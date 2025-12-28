;==============================================================================
; Dragon Quest III - Bank $36
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $DB0000-$DB7FFF
; Instructions: 8473
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_36"

;------------------------------------------------------------------------------
; Bank36_DmaFunction_000
; Address: $DB8000
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_000:
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $800C            ; 4C 0C 80 | Jump to address
    JMP $7FFD            ; 4C FD 7F | Jump to address
    JMP $7FC0            ; 4C C0 7F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_007
; Address: $DB802F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_007:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$64             ; 69 64 | Add with carry (immediate)
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$2C             ; C9 2C | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    JMP $804C            ; 4C 4C 80 | Jump to address
    JMP $803D            ; 4C 3D 80 | Jump to address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_00C
; Address: $DB8062
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_00C:
    JSL $CC7404          ; 22 04 74 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$64             ; E9 64 | Subtract with carry (immediate)
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $807F            ; 4C 7F 80 | Jump to address
    JMP $8070            ; 4C 70 80 | Jump to address
    JMP $801D            ; 4C 1D 80 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_013
; Address: $DB80A2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_013:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$64             ; 69 64 | Add with carry (immediate)
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$2C             ; C9 2C | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    JMP $80BF            ; 4C BF 80 | Jump to address
    JMP $80B0            ; 4C B0 80 | Jump to address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_018
; Address: $DB80D5
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_018:
    JSL $CC7429          ; 22 29 74 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$64             ; E9 64 | Subtract with carry (immediate)
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $80F2            ; 4C F2 80 | Jump to address
    JMP $80E3            ; 4C E3 80 | Jump to address
    JMP $8090            ; 4C 90 80 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_019
; Address: $DB80F6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_019:
    JSL $CCD74C          ; 22 4C D7 CC | Jump to subroutine long
    LDA #$99             ; A9 99 | Load immediate value into accumulator
    LDX $3426            ; AE 26 34 | Load from absolute address into X register
    LDY $3428            ; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_01A
; Address: $DB8103
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_01A:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_01C
; Address: $DB8114
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_01C:
    JSL $CC74F6          ; 22 F6 74 CC | Jump to subroutine long
    JMP $8114            ; 4C 14 81 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_01D
; Address: $DB811C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_01D:
    JSL $CCD74C          ; 22 4C D7 CC | Jump to subroutine long
    LDA #$99             ; A9 99 | Load immediate value into accumulator
    LDX $3426            ; AE 26 34 | Load from absolute address into X register
    LDY $3428            ; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_01E
; Address: $DB8129
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_01E:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_024
; Address: $DB814B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_024:
    JSL $CDC5C2          ; 22 C2 C5 CD | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_025
; Address: $DB8157
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_025:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_027
; Address: $DB8165
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_027:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$F4             ; A9 F4 | Load immediate value into accumulator
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_029
; Address: $DB8173
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_029:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($CD,X)          ; 01 CD | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $8195            ; 4C 95 81 | Jump to address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    STA ($A9,X)          ; 81 A9 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_043
; Address: $DB8211
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_043:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_044
; Address: $DB8217
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_044:
    PHA                  ; 48 | Push accumulator to stack
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$F4             ; C9 F4 | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    JMP $8227            ; 4C 27 82 | Jump to address
    JMP $8218            ; 4C 18 82 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_046
; Address: $DB822B
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_046:
    JSL $CDAEB1          ; 22 B1 AE CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $8267            ; 4C 67 82 | Jump to address
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $825F            ; 4C 5F 82 | Jump to address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    JMP $8244            ; 4C 44 82 | Jump to address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    LDA #$3D             ; A9 3D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_04D
; Address: $DB8283
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_04D:
    PHA                  ; 48 | Push accumulator to stack
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$F4             ; C9 F4 | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    JMP $8293            ; 4C 93 82 | Jump to address
    JMP $8284            ; 4C 84 82 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_04F
; Address: $DB8297
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_04F:
    JSL $CDAEB1          ; 22 B1 AE CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $82D3            ; 4C D3 82 | Jump to address
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $82CB            ; 4C CB 82 | Jump to address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    JMP $82B0            ; 4C B0 82 | Jump to address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    LDY #$82             ; A0 82 | Load immediate value into Y register
    LDA #$3B             ; A9 3B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_054
; Address: $DB82E9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_054:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_055
; Address: $DB82EF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_055:
    PHA                  ; 48 | Push accumulator to stack
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$F4             ; C9 F4 | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    JMP $82FF            ; 4C FF 82 | Jump to address
    JMP $82F0            ; 4C F0 82 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_057
; Address: $DB8303
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_057:
    JSL $CDAEB1          ; 22 B1 AE CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank36_DmaFunction_058
; Address: $DB8313
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_058:
    JMP $833F            ; 4C 3F 83 | Jump to address
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    STA $3406            ; 8D 06 34 | Store accumulator to absolute address
    LDA $3406            ; AD 06 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8337            ; 4C 37 83 | Jump to address
    LDA $3406            ; AD 06 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    STA $3406            ; 8D 06 34 | Store accumulator to absolute address
    JMP $831C            ; 4C 1C 83 | Jump to address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    LDA #$39             ; A9 39 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_05D
; Address: $DB8355
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_05D:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_05E
; Address: $DB835B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_05E:
    PHA                  ; 48 | Push accumulator to stack
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$F4             ; C9 F4 | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    JMP $836B            ; 4C 6B 83 | Jump to address
    JMP $835C            ; 4C 5C 83 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_060
; Address: $DB836F
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_060:
    JSL $CDAEB1          ; 22 B1 AE CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $83AB            ; 4C AB 83 | Jump to address
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $83A3            ; 4C A3 83 | Jump to address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    JMP $8388            ; 4C 88 83 | Jump to address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_061
; Address: $DB83A7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_061:
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    LDA #$37             ; A9 37 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_066
; Address: $DB83C1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_066:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_067
; Address: $DB83C7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_067:
    JSL $CD78AB          ; 22 AB 78 CD | Jump to subroutine long
    LDA $3553            ; AD 53 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $83DB            ; 4C DB 83 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_06A
; Address: $DB83DD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_06A:
    JSL $CD795A          ; 22 5A 79 CD | Jump to subroutine long
    LDA $3553            ; AD 53 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $83F4            ; 4C F4 83 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_06C
; Address: $DB83F4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_06C:
    JSL $CD8217          ; 22 17 82 CD | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_06D
; Address: $DB83FA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_06D:
    JSL $CD7B06          ; 22 06 7B CD | Jump to subroutine long
    LDA $3553            ; AD 53 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $8411            ; 4C 11 84 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_070
; Address: $DB8416
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_070:
    JSL $CD7C80          ; 22 80 7C CD | Jump to subroutine long
    LDA $3553            ; AD 53 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $842D            ; 4C 2D 84 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_073
; Address: $DB8432
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_073:
    JSL $CD7DCC          ; 22 CC 7D CD | Jump to subroutine long
    LDA $3553            ; AD 53 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0AE
; Address: $DB854B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0AE:
    JMP $8579            ; 4C 79 85 | Jump to address
    JMP $85A4            ; 4C A4 85 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0AF
; Address: $DB8554
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0AF:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $85A4            ; 4C A4 85 | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0B0
; Address: $DB855E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0B0:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $85A4            ; 4C A4 85 | Jump to address
    LDA #$30             ; A9 30 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0B1
; Address: $DB8568
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0B1:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $85A4            ; 4C A4 85 | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0B2
; Address: $DB8572
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0B2:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $85A4            ; 4C A4 85 | Jump to address
    LDA $3444            ; AD 44 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $854E            ; 4C 4E 85 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8551            ; 4C 51 85 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $855B            ; 4C 5B 85 | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0B3
; Address: $DB8599
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0B3:
    JMP $8565            ; 4C 65 85 | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $856F            ; 4C 6F 85 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0B9
; Address: $DB85BD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0B9:
    JSL $CDAEF1          ; 22 F1 AE CD | Jump to subroutine long
    LDA $3444            ; AD 44 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $85D0            ; 4C D0 85 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0BB
; Address: $DB85D0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0BB:
    JSL $CDAF11          ; 22 11 AF CD | Jump to subroutine long
    LDA $3444            ; AD 44 34 | Load from absolute address into accumulator
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $85E3            ; 4C E3 85 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0BE
; Address: $DB85E7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0BE:
    JSL $CD854B          ; 22 4B 85 CD | Jump to subroutine long
    LDX #$30             ; A2 30 | Load immediate value into X register
    LDA #$4D             ; A9 4D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0C6
; Address: $DB8612
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0C6:
    JSL $CDAEF1          ; 22 F1 AE CD | Jump to subroutine long
    LDA $3444            ; AD 44 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $8625            ; 4C 25 86 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0C8
; Address: $DB8625
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0C8:
    JSL $CDAF11          ; 22 11 AF CD | Jump to subroutine long
    LDA $3444            ; AD 44 34 | Load from absolute address into accumulator
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $8638            ; 4C 38 86 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0D1
; Address: $DB8658
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0D1:
    JSL $CDC5C2          ; 22 C2 C5 CD | Jump to subroutine long
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0D7
; Address: $DB8682
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0D7:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDA #$2D             ; A9 2D | Load immediate value into accumulator
    LDX #$5A             ; A2 5A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0DA
; Address: $DB8696
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0DA:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDA #$36             ; A9 36 | Load immediate value into accumulator
    LDX #$59             ; A2 59 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0DD
; Address: $DB86AA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0DD:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    LDX #$54             ; A2 54 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0E0
; Address: $DB86BE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0E0:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDA #$35             ; A9 35 | Load immediate value into accumulator
    LDX #$53             ; A2 53 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0E3
; Address: $DB86D2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0E3:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDA $3444            ; AD 44 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0E4
; Address: $DB86DE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0E4:
    JMP $86F2            ; 4C F2 86 | Jump to address
    LDA #$31             ; A9 31 | Load immediate value into accumulator
    LDX #$57             ; A2 57 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0E6
; Address: $DB86EB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0E6:
    JSL $CCD837          ; 22 37 D8 CC | Jump to subroutine long
    JMP $871C            ; 4C 1C 87 | Jump to address
    LDA $3442            ; AD 42 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $870E            ; 4C 0E 87 | Jump to address
    LDA #$31             ; A9 31 | Load immediate value into accumulator
    LDX #$57             ; A2 57 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0E8
; Address: $DB8707
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0E8:
    JSL $CCD837          ; 22 37 D8 CC | Jump to subroutine long
    JMP $871C            ; 4C 1C 87 | Jump to address
    LDA #$3A             ; A9 3A | Load immediate value into accumulator
    LDX #$55             ; A2 55 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0EB
; Address: $DB871E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0EB:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$A0             ; A9 A0 | Load immediate value into accumulator
    LDX #$68             ; A2 68 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0EC
; Address: $DB8728
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0EC:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0ED
; Address: $DB8737
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0ED:
    JSL $C73C23          ; 22 23 3C C7 | Jump to subroutine long
    JMP $875C            ; 4C 5C 87 | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0EE
; Address: $DB8741
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0EE:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $8777            ; 4C 77 87 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0EF
; Address: $DB874B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0EF:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $8777            ; 4C 77 87 | Jump to address
    LDA #$16             ; A9 16 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0F0
; Address: $DB8755
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0F0:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $8777            ; 4C 77 87 | Jump to address
    LDA $C141            ; AD 41 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $873E            ; 4C 3E 87 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8748            ; 4C 48 87 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0F1
; Address: $DB8774
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0F1:
    JMP $8752            ; 4C 52 87 | Jump to address
    JMP $87B0            ; 4C B0 87 | Jump to address
    LDX #$68             ; A2 68 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0F2
; Address: $DB8780
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0F2:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    LDX #$58             ; A2 58 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0F3
; Address: $DB8792
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0F3:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    LDX #$80             ; A2 80 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    WDM #$0A             ; 42 0A | Reserved instruction

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0F4
; Address: $DB87A4
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0F4:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BNE $03              ; D0 03 | Branch if not equal
    JMP $877A            ; 4C 7A 87 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $878C            ; 4C 8C 87 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $879E            ; 4C 9E 87 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0F5
; Address: $DB87CA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0F5:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0F6
; Address: $DB87D4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0F6:
    JSL $C73CED          ; 22 ED 3C C7 | Jump to subroutine long
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $87F8            ; 4C F8 87 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0F8
; Address: $DB87EA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0F8:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0FC
; Address: $DB8805
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0FC:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$A0             ; A9 A0 | Load immediate value into accumulator
    LDX #$68             ; A2 68 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0FD
; Address: $DB880F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0FD:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDA #$19             ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0FE
; Address: $DB8819
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0FE:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_0FF
; Address: $DB8825
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_0FF:
    JSL $C73C23          ; 22 23 3C C7 | Jump to subroutine long
    JMP $884A            ; 4C 4A 88 | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_100
; Address: $DB882F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_100:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $8865            ; 4C 65 88 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_101
; Address: $DB8839
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_101:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $8865            ; 4C 65 88 | Jump to address
    LDA #$16             ; A9 16 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_102
; Address: $DB8843
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_102:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $8865            ; 4C 65 88 | Jump to address
    LDA $C141            ; AD 41 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $882C            ; 4C 2C 88 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8836            ; 4C 36 88 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8840            ; 4C 40 88 | Jump to address
    JMP $889E            ; 4C 9E 88 | Jump to address
    LDX #$A4             ; A2 A4 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_103
; Address: $DB886E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_103:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    LDX #$B0             ; A2 B0 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_105
; Address: $DB8884
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_105:
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    LDX #$B8             ; A2 B8 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    BVC $0A              ; 50 0A | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank36_DmaFunction_106
; Address: $DB8892
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_106:
    JSL $C73CD1          ; 22 D1 3C C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8868            ; 4C 68 88 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $887A            ; 4C 7A 88 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $888C            ; 4C 8C 88 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_107
; Address: $DB88B8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_107:
    JSL $CC7587          ; 22 87 75 CC | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_108
; Address: $DB88C2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_108:
    JSL $C73CED          ; 22 ED 3C C7 | Jump to subroutine long
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $88E6            ; 4C E6 88 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_10A
; Address: $DB88D8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_10A:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_10C
; Address: $DB88EA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_10C:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    JMP $8822            ; 4C 22 88 | Jump to address
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_112
; Address: $DB890F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_112:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $33D8            ; 8D D8 33 | Store accumulator to absolute address
    LDX #$CC             ; A2 CC | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_113
; Address: $DB8918
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_113:
    LDA #$98             ; A9 98 | Load immediate value into accumulator
    BEQ $22              ; F0 22 | Branch if equal
    CMP #$A9             ; C9 A9 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_116
; Address: $DB892B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_116:
    JSL $C97F63          ; 22 63 7F C9 | Jump to subroutine long
    JMP $892B            ; 4C 2B 89 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_11E
; Address: $DB895C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_11E:
    JSL $CCD84F          ; 22 4F D8 CC | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $6B36,Y          ; 19 36 6B | Logical OR with accumulator (absolute,Y)
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    LDX #$27             ; A2 27 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_120
; Address: $DB8971
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_120:
    JSL $CCD847          ; 22 47 D8 CC | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA $6B36,Y          ; 19 36 6B | Logical OR with accumulator (absolute,Y)
    LDA #$2B             ; A9 2B | Load immediate value into accumulator
    LDX #$2F             ; A2 2F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_122
; Address: $DB8986
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_122:
    JSL $CCD84F          ; 22 4F D8 CC | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA $6B36,Y          ; 19 36 6B | Logical OR with accumulator (absolute,Y)
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    LDX #$32             ; A2 32 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_124
; Address: $DB899B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_124:
    JSL $CCD837          ; 22 37 D8 CC | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA $6B36,Y          ; 19 36 6B | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_125
; Address: $DB89A6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_125:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $89B9            ; 4C B9 89 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_128
; Address: $DB89BE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_128:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $89CD            ; 4C CD 89 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_129
; Address: $DB89C9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_129:
    JSL $CCD847          ; 22 47 D8 CC | Jump to subroutine long
    LDA $3444            ; AD 44 34 | Load from absolute address into accumulator
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $89E6            ; 4C E6 89 | Jump to address
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    LDX #$2B             ; A2 2B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_12C
; Address: $DB89E7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_12C:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $89FA            ; 4C FA 89 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_12E
; Address: $DB89FB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_12E:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $8A0E            ; 4C 0E 8A | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_130
; Address: $DB8A0F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_130:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $8A22            ; 4C 22 8A | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_132
; Address: $DB8A23
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_132:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $8A36            ; 4C 36 8A | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_134
; Address: $DB8A37
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_134:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $8A4A            ; 4C 4A 8A | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_137
; Address: $DB8A4F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_137:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $8A5E            ; 4C 5E 8A | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_13C
; Address: $DB8A6C
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_13C:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    JMP $8A85            ; 4C 85 8A | Jump to address
    LDA $4C08            ; AD 08 4C | Load from absolute address into accumulator
    LDY #$8A             ; A0 8A | Load immediate value into Y register
    LDX $4C08            ; AE 08 4C | Load from absolute address into X register
    LDY #$8A             ; A0 8A | Load immediate value into Y register
    LDA $A04C08          ; AF 08 4C A0 | Load from absolute long address into accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8A73            ; 4C 73 8A | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8A79            ; 4C 79 8A | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8A7F            ; 4C 7F 8A | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_141
; Address: $DB8AB0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_141:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    JMP $8A60            ; 4C 60 8A | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_142
; Address: $DB8AB8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_142:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8CB1            ; 4C B1 8C | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_143
; Address: $DB8AC1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_143:
    JSL $C7522F          ; 22 2F 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8BA8            ; 4C A8 8B | Jump to address
    LDA #$A0             ; A9 A0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$C8             ; A2 C8 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_144
; Address: $DB8AD3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_144:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8AEF            ; 4C EF 8A | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_145
; Address: $DB8ADF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_145:
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_146
; Address: $DB8AE8
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_146:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $8BA5            ; 4C A5 8B | Jump to address
    LDA #$A0             ; A9 A0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$C8             ; A2 C8 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8B14            ; 4C 14 8B | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_147
; Address: $DB8B0D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_147:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $8BA5            ; 4C A5 8B | Jump to address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_148
; Address: $DB8B1D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_148:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8B39            ; 4C 39 8B | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_149
; Address: $DB8B32
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_149:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $8BA5            ; 4C A5 8B | Jump to address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8B5E            ; 4C 5E 8B | Jump to address
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_14B
; Address: $DB8B5E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_14B:
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$70             ; A0 70 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8B83            ; 4C 83 8B | Jump to address
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_14C
; Address: $DB8B7C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_14C:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $8BA5            ; 4C A5 8B | Jump to address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8BA5            ; 4C A5 8B | Jump to address
    LDA #$07             ; A9 07 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_14E
; Address: $DB8BA8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_14E:
    JSL $C75203          ; 22 03 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8CB1            ; 4C B1 8C | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank36_DmaFunction_14F
; Address: $DB8BB9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_14F:
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8BD6            ; 4C D6 8B | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_150
; Address: $DB8BCF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_150:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $8CB1            ; 4C B1 8C | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_151
; Address: $DB8BDA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_151:
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    CPY #$08             ; C0 08 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_152
; Address: $DB8BDF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_152:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8BFB            ; 4C FB 8B | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_153
; Address: $DB8BF4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_153:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $8CB1            ; 4C B1 8C | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_154
; Address: $DB8C02
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_154:
    JSR $2209            ; 20 09 22 | Jump to subroutine
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8C20            ; 4C 20 8C | Jump to address
    LDA #$09             ; A9 09 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_155
; Address: $DB8C19
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_155:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $8CB1            ; 4C B1 8C | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8C45            ; 4C 45 8C | Jump to address
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_156
; Address: $DB8C3E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_156:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $8CB1            ; 4C B1 8C | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank36_DmaFunction_157
; Address: $DB8C4D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_157:
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8C6A            ; 4C 6A 8C | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_158
; Address: $DB8C57
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_158:
    LDA #$0B             ; A9 0B | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_159
; Address: $DB8C63
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_159:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $8CB1            ; 4C B1 8C | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    BRA $09              ; 80 09 | Branch always

;------------------------------------------------------------------------------
; Bank36_DmaFunction_15A
; Address: $DB8C73
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_15A:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8C8F            ; 4C 8F 8C | Jump to address
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_15B
; Address: $DB8C88
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_15B:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $8CB1            ; 4C B1 8C | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank36_DmaFunction_15C
; Address: $DB8C98
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_15C:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8CB1            ; 4C B1 8C | Jump to address
    LDA #$0D             ; A9 0D | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_165
; Address: $DB8CCF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_165:
    LDA #$87             ; A9 87 | Load immediate value into accumulator
    LDX $3426            ; AE 26 34 | Load from absolute address into X register
    LDY $3428            ; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_168
; Address: $DB8CE2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_168:
    JSL $CDA795          ; 22 95 A7 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_16C
; Address: $DB8CF9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_16C:
    JSL $CC7593          ; 22 93 75 CC | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_170
; Address: $DB8D11
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_170:
    JSL $CDAED1          ; 22 D1 AE CD | Jump to subroutine long
    JMP $8DDB            ; 4C DB 8D | Jump to address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $3426            ; 8D 26 34 | Store accumulator to absolute address
    LDA #$A0             ; A9 A0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $3428            ; 8D 28 34 | Store accumulator to absolute address
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA #$A0             ; A9 A0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$A0             ; A9 A0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $3428            ; 8D 28 34 | Store accumulator to absolute address
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $3426            ; 8D 26 34 | Store accumulator to absolute address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA #$70             ; A9 70 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_171
; Address: $DB8D67
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_171:
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $3426            ; 8D 26 34 | Store accumulator to absolute address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_172
; Address: $DB8DD2
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_172:
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    JMP $8E46            ; 4C 46 8E | Jump to address
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8D18            ; 4C 18 8D | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8D27            ; 4C 27 8D | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8D36            ; 4C 36 8D | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8D45            ; 4C 45 8D | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8D54            ; 4C 54 8D | Jump to address
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8D63            ; 4C 63 8D | Jump to address
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8D72            ; 4C 72 8D | Jump to address
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8D81            ; 4C 81 8D | Jump to address
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8D90            ; 4C 90 8D | Jump to address
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8D9F            ; 4C 9F 8D | Jump to address
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8DAE            ; 4C AE 8D | Jump to address
    CMP #$0C             ; C9 0C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8DBD            ; 4C BD 8D | Jump to address
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8DCC            ; 4C CC 8D | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_173
; Address: $DB8E46
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_173:
    JSL $CD8CB2          ; 22 B2 8C CD | Jump to subroutine long
    JMP $8D11            ; 4C 11 8D | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_174
; Address: $DB8E4E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_174:
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank36_DmaFunction_176
; Address: $DB8E59
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_176:
    JSL $CCD211          ; 22 11 D2 CC | Jump to subroutine long
    JMP $8FC5            ; 4C C5 8F | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8FC1            ; 4C C1 8F | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_178
; Address: $DB8E70
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_178:
    JSL $CCD276          ; 22 76 D2 CC | Jump to subroutine long
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    BPL $0A              ; 10 0A | Branch if positive

;------------------------------------------------------------------------------
; Bank36_DmaFunction_179
; Address: $DB8E7D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_179:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8E89            ; 4C 89 8E | Jump to address
    JMP $8E8C            ; 4C 8C 8E | Jump to address
    JMP $8E70            ; 4C 70 8E | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_17F
; Address: $DB8EA3
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_17F:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$2E             ; A2 2E | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_180
; Address: $DB8EB9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_180:
    JSL $C734B3          ; 22 B3 34 C7 | Jump to subroutine long
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$2F             ; A2 2F | Load immediate value into X register
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_184
; Address: $DB8EDE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_184:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_185
; Address: $DB8EE6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_185:
    BRA $96              ; 80 96 | Branch always
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $9684            ; 8D 84 96 | Store accumulator to absolute address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    LDX #$03             ; A2 03 | Load immediate value into X register
    LDY #$02             ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_186
; Address: $DB8EFD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_186:
    JSL $C734FC          ; 22 FC 34 C7 | Jump to subroutine long
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$30             ; A2 30 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_187
; Address: $DB8F13
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_187:
    JSL $C734B3          ; 22 B3 34 C7 | Jump to subroutine long
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$31             ; A2 31 | Load immediate value into X register
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_18D
; Address: $DB8F46
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_18D:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$32             ; A2 32 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_18E
; Address: $DB8F5C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_18E:
    JSL $C734B3          ; 22 B3 34 C7 | Jump to subroutine long
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank36_DmaFunction_18F
; Address: $DB8F69
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_18F:
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$33             ; A2 33 | Load immediate value into X register
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1A1
; Address: $DB8FC6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1A1:
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$34             ; A2 34 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1A2
; Address: $DB8FD8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1A2:
    JSL $C734B3          ; 22 B3 34 C7 | Jump to subroutine long
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$35             ; A2 35 | Load immediate value into X register
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1A4
; Address: $DB8FF3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1A4:
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1A5
; Address: $DB8FFF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1A5:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $9684            ; 8D 84 96 | Store accumulator to absolute address
    LDA #$19             ; A9 19 | Load immediate value into accumulator
    LDX #$05             ; A2 05 | Load immediate value into X register
    LDY #$02             ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1A6
; Address: $DB900E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1A6:
    JSL $C734FC          ; 22 FC 34 C7 | Jump to subroutine long
    LDA #$43             ; A9 43 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$43             ; A9 43 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$29             ; A9 29 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1A7
; Address: $DB9030
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1A7:
    JSL $C736BD          ; 22 BD 36 C7 | Jump to subroutine long
    LDA #$44             ; A9 44 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$27             ; A9 27 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$47             ; A9 47 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$27             ; A9 27 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1AC
; Address: $DB9061
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1AC:
    JSL $CDA876          ; 22 76 A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $9080            ; 4C 80 90 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1AD
; Address: $DB9074
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1AD:
    JSL $CDE1A5          ; 22 A5 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    BCC $22              ; 90 22 | Branch if carry clear
    ROR $CDA8,X          ; 7E A8 CD | Rotate right (absolute,X)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1AF
; Address: $DB9093
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1AF:
    JSL $CDE1B1          ; 22 B1 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    BIT #$90             ; 89 90 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1B1
; Address: $DB90A3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1B1:
    JSL $CDA886          ; 22 86 A8 CD | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $90B9            ; 4C B9 90 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1B3
; Address: $DB90B9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1B3:
    JSL $CDA88E          ; 22 8E A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $90D8            ; 4C D8 90 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1B4
; Address: $DB90CC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1B4:
    JSL $CDE1B1          ; 22 B1 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    REP #$90             ; C2 90 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1B5
; Address: $DB90D8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1B5:
    JSL $CDA896          ; 22 96 A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $90F7            ; 4C F7 90 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1B6
; Address: $DB90EB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1B6:
    JSL $CDE1A5          ; 22 A5 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    SBC ($90,X)          ; E1 90 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1B8
; Address: $DB90FB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1B8:
    JSL $CDAE1E          ; 22 1E AE CD | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1B9
; Address: $DB9101
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1B9:
    JSL $CC913E          ; 22 3E 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9167            ; 4C 67 91 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1BB
; Address: $DB910E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1BB:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA #$2D             ; A9 2D | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1BC
; Address: $DB9127
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1BC:
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA #$2E             ; A9 2E | Load immediate value into accumulator
    STA $3406            ; 8D 06 34 | Store accumulator to absolute address
    LDA $3406            ; AD 06 34 | Load from absolute address into accumulator
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$0E             ; E9 0E | Subtract with carry (immediate)
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX #$FF             ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1C1
; Address: $DB915A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1C1:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    JMP $91CD            ; 4C CD 91 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1C2
; Address: $DB9168
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1C2:
    JSL $CCD400          ; 22 00 D4 CC | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $917E            ; 4C 7E 91 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1C8
; Address: $DB918E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1C8:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    ORA $90              ; 05 90 | Logical OR with accumulator (zero page)
    JMP $91A1            ; 4C A1 91 | Jump to address
    JMP $9192            ; 4C 92 91 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1CC
; Address: $DB91B3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1CC:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX #$FF             ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1D3
; Address: $DB91D5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1D3:
    JSL $CDD82B          ; 22 2B D8 CD | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    LDX $3406            ; AE 06 34 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1E6
; Address: $DB9236
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1E6:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9255            ; 4C 55 92 | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1EA
; Address: $DB925D
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1EA:
    JSL $CDADD1          ; 22 D1 AD CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    BPL $00              ; 10 00 | Branch if positive
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    JMP ($6B91)          ; 6C 91 6B | Jump to address (absolute indirect)
    LDA #$20             ; A9 20 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1EF
; Address: $DB9297
; Size: 120 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1EF:
    JSL $CCD6FA          ; 22 FA D6 CC | Jump to subroutine long
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    STA $3406            ; 8D 06 34 | Store accumulator to absolute address
    JMP $9302            ; 4C 02 93 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    LDA $3406            ; AD 06 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$01             ; 69 01 | Add with carry (immediate)
    STA $3406            ; 8D 06 34 | Store accumulator to absolute address
    JMP $9325            ; 4C 25 93 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    JMP $9325            ; 4C 25 93 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    LDA $3406            ; AD 06 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    STA $3406            ; 8D 06 34 | Store accumulator to absolute address
    JMP $9325            ; 4C 25 93 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$01             ; 69 01 | Add with carry (immediate)
    STA $3404            ; 8D 04 34 | Store accumulator to absolute address
    JMP $9325            ; 4C 25 93 | Jump to address
    LDA $342A            ; AD 2A 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $92B6            ; 4C B6 92 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $92C9            ; 4C C9 92 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1F0
; Address: $DB931A
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1F0:
    JMP $92DC            ; 4C DC 92 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $92EF            ; 4C EF 92 | Jump to address
    LDA $3406            ; AD 06 34 | Load from absolute address into accumulator
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$0E             ; E9 0E | Subtract with carry (immediate)
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    JMP $4CC7            ; 4C C7 4C | Jump to address
    LSR $93              ; 46 93 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1F4
; Address: $DB934D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1F4:
    JSL $CC913E          ; 22 3E 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $935E            ; 4C 5E 93 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1F8
; Address: $DB9367
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1F8:
    JSL $CDA876          ; 22 76 A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $9386            ; 4C 86 93 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1F9
; Address: $DB937A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1F9:
    JSL $CDE1C9          ; 22 C9 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    BVS $93              ; 70 93 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1FA
; Address: $DB9386
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1FA:
    JSL $CDA87E          ; 22 7E A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $93A5            ; 4C A5 93 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1FB
; Address: $DB9399
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1FB:
    JSL $CDE1D5          ; 22 D5 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    STA $14A993          ; 8F 93 A9 14 | Store accumulator to absolute long address
    ORA $8D              ; 05 8D | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1FD
; Address: $DB93AF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1FD:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$80             ; C9 80 | Compare accumulator (immediate)
    ROL $0390,X          ; 3E 90 03 | Rotate left (absolute,X)
    JMP $93C1            ; 4C C1 93 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_1FF
; Address: $DB93C1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_1FF:
    JSL $CDA88E          ; 22 8E A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $93E0            ; 4C E0 93 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_200
; Address: $DB93D4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_200:
    JSL $CDE1D5          ; 22 D5 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_201
; Address: $DB93E0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_201:
    JSL $CDA896          ; 22 96 A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $93FF            ; 4C FF 93 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_202
; Address: $DB93F3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_202:
    JSL $CDE1C9          ; 22 C9 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    SBC #$93             ; E9 93 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_205
; Address: $DB9407
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_205:
    JSL $CDADAB          ; 22 AB AD CD | Jump to subroutine long
    JMP $935F            ; 4C 5F 93 | Jump to address
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_206
; Address: $DB9410
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_206:
    JSL $CC913E          ; 22 3E 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9421            ; 4C 21 94 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_208
; Address: $DB9422
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_208:
    JSL $CDAED1          ; 22 D1 AE CD | Jump to subroutine long
    JMP $9451            ; 4C 51 94 | Jump to address
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_209
; Address: $DB942C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_209:
    JSL $C743E5          ; 22 E5 43 C7 | Jump to subroutine long
    JMP $9474            ; 4C 74 94 | Jump to address
    LDX #$09             ; A2 09 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_20A
; Address: $DB9436
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_20A:
    JSL $C743E5          ; 22 E5 43 C7 | Jump to subroutine long
    JMP $9474            ; 4C 74 94 | Jump to address
    LDX #$0A             ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_20D
; Address: $DB944A
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_20D:
    JSL $C743E5          ; 22 E5 43 C7 | Jump to subroutine long
    JMP $9474            ; 4C 74 94 | Jump to address
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9429            ; 4C 29 94 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9433            ; 4C 33 94 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $943D            ; 4C 3D 94 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9447            ; 4C 47 94 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_210
; Address: $DB947C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_210:
    JSL $CDADAB          ; 22 AB AD CD | Jump to subroutine long
    JMP $9422            ; 4C 22 94 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_212
; Address: $DB9488
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_212:
    JSL $C73C23          ; 22 23 3C C7 | Jump to subroutine long
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    JMP $94B2            ; 4C B2 94 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_216
; Address: $DB94AB
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_216:
    JSL $CCD837          ; 22 37 D8 CC | Jump to subroutine long
    JMP $94D5            ; 4C D5 94 | Jump to address
    LDA $C141            ; AD 41 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9496            ; 4C 96 94 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $949D            ; 4C 9D 94 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $94A4            ; 4C A4 94 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $94AB            ; 4C AB 94 | Jump to address
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    LDX $3402            ; AE 02 34 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_217
; Address: $DB94DB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_217:
    JSL $C75305          ; 22 05 53 C7 | Jump to subroutine long
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROL $C76D            ; 2E 6D C7 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_219
; Address: $DB94ED
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_219:
    JSL $C73C23          ; 22 23 3C C7 | Jump to subroutine long
    LDA $C141            ; AD 41 C1 | Load from absolute address into accumulator
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ADC $AD95,Y          ; 79 95 AD | Add with carry (absolute,Y)
    ORA $2936,Y          ; 19 36 29 | Logical OR with accumulator (absolute,Y)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $950C            ; 4C 0C 95 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_21A
; Address: $DB950C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_21A:
    JSL $CCD31E          ; 22 1E D3 CC | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $952C            ; 4C 2C 95 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_21B
; Address: $DB952C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_21B:
    JSL $CCD326          ; 22 26 D3 CC | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $954C            ; 4C 4C 95 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_21C
; Address: $DB954C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_21C:
    JSL $CCD32E          ; 22 2E D3 CC | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $956C            ; 4C 6C 95 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_21D
; Address: $DB956C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_21D:
    JSL $CCD336          ; 22 36 D3 CC | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BNE $03              ; D0 03 | Branch if not equal
    JMP $94F9            ; 4C F9 94 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank36_DmaFunction_21E
; Address: $DB9588
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_21E:
    JMP $9519            ; 4C 19 95 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9539            ; 4C 39 95 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9559            ; 4C 59 95 | Jump to address
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_220
; Address: $DB95A1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_220:
    JSL $CCD847          ; 22 47 D8 CC | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROL $C76D            ; 2E 6D C7 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_222
; Address: $DB95B1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_222:
    JSL $CCD784          ; 22 84 D7 CC | Jump to subroutine long
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDX #$FF             ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_228
; Address: $DB95D1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_228:
    JSL $CD9484          ; 22 84 94 CD | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    LDX $3408            ; AE 08 34 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_22E
; Address: $DB95EF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_22E:
    JSL $CDADAB          ; 22 AB AD CD | Jump to subroutine long
    JMP $95C9            ; 4C C9 95 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_232
; Address: $DB9604
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_232:
    JSL $CCD4AA          ; 22 AA D4 CC | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $9616            ; 4C 16 96 | Jump to address
    JMP $961A            ; 4C 1A 96 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_233
; Address: $DB9616
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_233:
    JSL $CD9484          ; 22 84 94 CD | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    LDX $3408            ; AE 08 34 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_236
; Address: $DB9628
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_236:
    JSL $CDAF71          ; 22 71 AF CD | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $963A            ; 4C 3A 96 | Jump to address
    JMP $963E            ; 4C 3E 96 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_239
; Address: $DB9642
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_239:
    JSL $CDADAB          ; 22 AB AD CD | Jump to subroutine long
    JMP $9600            ; 4C 00 96 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_23D
; Address: $DB9657
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_23D:
    JSL $CCD4EA          ; 22 EA D4 CC | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $9669            ; 4C 69 96 | Jump to address
    JMP $966D            ; 4C 6D 96 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_23E
; Address: $DB9669
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_23E:
    JSL $CD9484          ; 22 84 94 CD | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    LDX $3408            ; AE 08 34 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_241
; Address: $DB967B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_241:
    JSL $CDAF61          ; 22 61 AF CD | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $968D            ; 4C 8D 96 | Jump to address
    JMP $9691            ; 4C 91 96 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_244
; Address: $DB9695
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_244:
    JSL $CDADAB          ; 22 AB AD CD | Jump to subroutine long
    JMP $9653            ; 4C 53 96 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_248
; Address: $DB96AA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_248:
    JSL $CCD52A          ; 22 2A D5 CC | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $96BC            ; 4C BC 96 | Jump to address
    JMP $96C0            ; 4C C0 96 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_249
; Address: $DB96BC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_249:
    JSL $CD9484          ; 22 84 94 CD | Jump to subroutine long
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    LDX $3408            ; AE 08 34 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_24C
; Address: $DB96CE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_24C:
    JSL $CDAF51          ; 22 51 AF CD | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $96E0            ; 4C E0 96 | Jump to address
    JMP $96E4            ; 4C E4 96 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_24F
; Address: $DB96E8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_24F:
    JSL $CDADAB          ; 22 AB AD CD | Jump to subroutine long
    JMP $96A6            ; 4C A6 96 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_250
; Address: $DB96F0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_250:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9768            ; 4C 68 97 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_255
; Address: $DB970F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_255:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9722            ; 4C 22 97 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_258
; Address: $DB9726
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_258:
    JSL $CDAF01          ; 22 01 AF CD | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $9739            ; 4C 39 97 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_262
; Address: $DB975E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_262:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    JMP $9700            ; 4C 00 97 | Jump to address
    JMP $976C            ; 4C 6C 97 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_266
; Address: $DB9778
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_266:
    JSL $CDAD89          ; 22 89 AD CD | Jump to subroutine long
    JMP $9782            ; 4C 82 97 | Jump to address
    BCS $08              ; B0 08 | Branch if carry set
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_267
; Address: $DB9783
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_267:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $97CD            ; 4C CD 97 | Jump to address
    LDA #$35             ; A9 35 | Load immediate value into accumulator
    LDX #$81             ; A2 81 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_26B
; Address: $DB97A1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_26B:
    JSL $C751DF          ; 22 DF 51 C7 | Jump to subroutine long
    LDA $C11D            ; AD 1D C1 | Load from absolute address into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_26D
; Address: $DB97AF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_26D:
    JSL $CDAEF1          ; 22 F1 AE CD | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $97C2            ; 4C C2 97 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_270
; Address: $DB97C6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_270:
    JSL $CDADAB          ; 22 AB AD CD | Jump to subroutine long
    JMP $979D            ; 4C 9D 97 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_271
; Address: $DB97CE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_271:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $97E0            ; 4C E0 97 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_272
; Address: $DB97D9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_272:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $97E3            ; 4C E3 97 | Jump to address
    LDA ($08),Y          ; B1 08 | Load from (zero page),Y into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_273
; Address: $DB97E4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_273:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9816            ; 4C 16 98 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_27E
; Address: $DB981B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_27E:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $982C            ; 4C 2C 98 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    JMP $982F            ; 4C 2F 98 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_27F
; Address: $DB9830
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_27F:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9862            ; 4C 62 98 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_287
; Address: $DB9858
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_287:
    JSL $CDADAB          ; 22 AB AD CD | Jump to subroutine long
    JMP $9840            ; 4C 40 98 | Jump to address
    JMP $9866            ; 4C 66 98 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_289
; Address: $DB9867
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_289:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9878            ; 4C 78 98 | Jump to address
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    JMP $987B            ; 4C 7B 98 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_28A
; Address: $DB987C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_28A:
    JSL $CCDADF          ; 22 DF DA CC | Jump to subroutine long
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $988E            ; 4C 8E 98 | Jump to address
    JMP $9896            ; 4C 96 98 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_28D
; Address: $DB9897
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_28D:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    LDA $3540            ; AD 40 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $98DE            ; 4C DE 98 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_28E
; Address: $DB98A6
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_28E:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $98D1            ; 4C D1 98 | Jump to address
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $98C7            ; 4C C7 98 | Jump to address
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    DEC $0098            ; CE 98 00 | Decrement (absolute)
    SEC                  ; 38 | Set carry flag
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    STA $56AD,Y          ; 99 AD 56 | Store accumulator to absolute,Y
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $98F0            ; 4C F0 98 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_28F
; Address: $DB98E9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_28F:
    JSL $CD9920          ; 22 20 99 CD | Jump to subroutine long
    JMP $991B            ; 4C 1B 99 | Jump to address
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    SBC $CC76,X          ; FD 76 CC | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_291
; Address: $DB98FF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_291:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $990E            ; 4C 0E 99 | Jump to address
    BMI $09              ; 30 09 | Branch if negative
    JMP $9911            ; 4C 11 99 | Jump to address
    ORA #$A9             ; 09 A9 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank36_DmaFunction_294
; Address: $DB9920
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_294:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $992F            ; 4C 2F 99 | Jump to address
    ORA #$4C             ; 09 4C | Logical OR with accumulator (immediate)
    STA $3100,Y          ; 99 00 31 | Store accumulator to absolute,Y
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $996C            ; 4C 6C 99 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_296
; Address: $DB9942
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_296:
    ASL $A8              ; 06 A8 | Arithmetic shift left (zero page)
    CMP $5F22            ; CD 22 5F | Compare accumulator (absolute)
    STA                  ; 9F CC 22 EE | Store accumulator to absolute long,X
    LDY $00CD            ; AC CD 00 | Load from absolute address into Y register
    DEC                  ; 3A | Decrement accumulator
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDA $CDAC,X          ; BD AC CD | Load from absolute,X into accumulator
    ORA #$A9             ; 09 A9 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $8222            ; CC 22 82 | Compare Y register (absolute)
    CPY $D222            ; CC 22 D2 | Compare Y register (absolute)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    STA $3300,Y          ; 99 00 33 | Store accumulator to absolute,Y
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    CPY $1D22            ; CC 22 1D | Compare Y register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $D222            ; CC 22 D2 | Compare Y register (absolute)
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register
    AND $2209,Y          ; 39 09 22 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_297
; Address: $DB9980
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_297:
    JSL $6BCDC2          ; 22 C2 CD 6B | Jump to subroutine long
    STA ($09),Y          ; 91 09 | Store accumulator to (zero page),Y
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_299
; Address: $DB998C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_299:
    JSL $CCDAF1          ; 22 F1 DA CC | Jump to subroutine long
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    LDA $6BCD,X          ; BD CD 6B | Load from absolute,X into accumulator
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_29B
; Address: $DB99AB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_29B:
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_29C
; Address: $DB99B9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_29C:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    STA $2209,Y          ; 99 09 22 | Store accumulator to absolute,Y
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    SBC $CC76,X          ; FD 76 CC | Subtract with carry (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    CPY $006B            ; CC 6B 00 | Compare Y register (absolute)
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)
    LDA $3546            ; AD 46 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2A0
; Address: $DB99EB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2A0:
    LDA $3546            ; AD 46 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9A09            ; 4C 09 9A | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2A3
; Address: $DB9A00
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2A3:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    STA $4C09,X          ; 9D 09 4C | Store accumulator to absolute,X
    TXS                  ; 9A | Transfer X register to stack pointer
    STZ $6B09            ; 9C 09 6B | Store zero to absolute
    LDA ($09,X)          ; A1 09 | Load from (zero page,X) into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2A4
; Address: $DB9A12
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2A4:
    STA                  ; 9F 09 6B 00 | Store accumulator to absolute long,X
    LDY #$09             ; A0 09 | Load immediate value into Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2A5
; Address: $DB9A19
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2A5:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9A2E            ; 4C 2E 9A | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2A6
; Address: $DB9A24
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2A6:
    JSL $CDDFAF          ; 22 AF DF CD | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2A7
; Address: $DB9A2F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2A7:
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9A6D            ; 4C 6D 9A | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2AC
; Address: $DB9A4B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2AC:
    JSL $CDD682          ; 22 82 D6 CD | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA $C1FD            ; AD FD C1 | Load from absolute address into accumulator
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $9A66            ; 4C 66 9A | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2B3
; Address: $DB9A86
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2B3:
    JSL $CCD276          ; 22 76 D2 CC | Jump to subroutine long
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$80             ; A0 80 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9A9F            ; 4C 9F 9A | Jump to address
    JMP $9AA2            ; 4C A2 9A | Jump to address
    JMP $9A86            ; 4C 86 9A | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2B6
; Address: $DB9AAA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2B6:
    JSL $CDAED1          ; 22 D1 AE CD | Jump to subroutine long
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2B9
; Address: $DB9ABD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2B9:
    JSL $CDAF01          ; 22 01 AF CD | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2BC
; Address: $DB9AD0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2BC:
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9AE8            ; 4C E8 9A | Jump to address
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    LDX #$2D             ; A2 2D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2BF
; Address: $DB9AED
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2BF:
    JSL $CDAEB1          ; 22 B1 AE CD | Jump to subroutine long
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    LDX #$1F             ; A2 1F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2C0
; Address: $DB9AF7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2C0:
    JSL $C75305          ; 22 05 53 C7 | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROL $C76D            ; 2E 6D C7 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2C4
; Address: $DB9B11
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2C4:
    JSL $CDADE6          ; 22 E6 AD CD | Jump to subroutine long
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    LDX #$2D             ; A2 2D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2C8
; Address: $DB9B30
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2C8:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    LDX #$2D             ; A2 2D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2CF
; Address: $DB9B59
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2CF:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9B6A            ; 4C 6A 9B | Jump to address
    ORA #$4C             ; 09 4C | Logical OR with accumulator (immediate)
    ADC $009B            ; 6D 9B 00 | Add with carry (absolute)
    LDX #$09             ; A2 09 | Load immediate value into X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2D0
; Address: $DB9B6E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2D0:
    LDA $3559            ; AD 59 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9B7F            ; 4C 7F 9B | Jump to address
    LDA $09              ; A5 09 | Load from zero page into accumulator
    JMP $9B82            ; 4C 82 9B | Jump to address
    LDY $09              ; A4 09 | Load from zero page into Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2D1
; Address: $DB9B83
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2D1:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA $C1FD            ; AD FD C1 | Load from absolute address into accumulator
    STA $3454            ; 8D 54 34 | Store accumulator to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    AND $2235,X          ; 3D 35 22 | Logical AND with accumulator (absolute,X)
    ORA $CD9A,Y          ; 19 9A CD | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2D5
; Address: $DB9BAC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2D5:
    LDA #$CC             ; A9 CC | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROL $C76D            ; 2E 6D C7 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2D6
; Address: $DB9BB3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2D6:
    JSL $C56364          ; 22 64 63 C5 | Jump to subroutine long
    LDA $353D            ; AD 3D 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9BC9            ; 4C C9 9B | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2D7
; Address: $DB9BC2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2D7:
    JSL $C57B68          ; 22 68 7B C5 | Jump to subroutine long
    JMP $9BB7            ; 4C B7 9B | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2D8
; Address: $DB9BCA
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2D8:
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ASL $C2              ; 06 C2 | Arithmetic shift left (zero page)
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9C34            ; 4C 34 9C | Jump to address
    LDA $353D            ; AD 3D 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9BEF            ; 4C EF 9B | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ASL $C2              ; 06 C2 | Arithmetic shift left (zero page)
    JMP $9C31            ; 4C 31 9C | Jump to address
    JMP $9C0E            ; 4C 0E 9C | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2DC
; Address: $DB9C07
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2DC:
    JSL $CD9B83          ; 22 83 9B CD | Jump to subroutine long
    JMP $9C31            ; 4C 31 9C | Jump to address
    LDA $C1FD            ; AD FD C1 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9BF2            ; 4C F2 9B | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9BF9            ; 4C F9 9B | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9C00            ; 4C 00 9C | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9C07            ; 4C 07 9C | Jump to address
    JMP $9C3A            ; 4C 3A 9C | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $C1FD            ; 8D FD C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2DF
; Address: $DB9C43
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2DF:
    JSL $CCD400          ; 22 00 D4 CC | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9C56            ; 4C 56 9C | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2E0
; Address: $DB9C52
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2E0:
    JSL $CDC39C          ; 22 9C C3 CD | Jump to subroutine long
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $9CDB            ; 4C DB 9C | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2E1
; Address: $DB9C6A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2E1:
    JSL $C75365          ; 22 65 53 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $9C7A            ; 4C 7A 9C | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2E3
; Address: $DB9C7A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2E3:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    ORA $90              ; 05 90 | Logical OR with accumulator (zero page)
    JMP $9C8D            ; 4C 8D 9C | Jump to address
    JMP $9C7E            ; 4C 7E 9C | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2E4
; Address: $DB9C8D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2E4:
    JSL $CC7B5A          ; 22 5A 7B CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $9CA4            ; 4C A4 9C | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2E6
; Address: $DB9C9A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2E6:
    JSL $CDD682          ; 22 82 D6 CD | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2ED
; Address: $DB9CBF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2ED:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    AND $A935,X          ; 3D 35 A9 | Logical AND with accumulator (absolute,X)
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2EF
; Address: $DB9CDF
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2EF:
    LDA $C1FD            ; AD FD C1 | Load from absolute address into accumulator
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $9CF4            ; 4C F4 9C | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    EOR $2235,Y          ; 59 35 22 | Exclusive OR with accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY $564C            ; CC 4C 56 | Compare Y register (absolute)
    STZ $AD6B            ; 9C 6B AD | Store zero to absolute
    ROL                  ; 2A | Rotate left (accumulator)
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9D0A            ; 4C 0A 9D | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2F2
; Address: $DB9D0F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2F2:
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9D33            ; 4C 33 9D | Jump to address
    LDA $3448            ; AD 48 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2F3
; Address: $DB9D1D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2F3:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$79             ; A2 79 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2F7
; Address: $DB9D39
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2F7:
    JSL $CC7B5A          ; 22 5A 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9D45            ; 4C 45 9D | Jump to address
    JMP $9D5E            ; 4C 5E 9D | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2F8
; Address: $DB9D45
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2F8:
    JSL $CCD4AA          ; 22 AA D4 CC | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9D5E            ; 4C 5E 9D | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2F9
; Address: $DB9D54
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2F9:
    JSL $C74D4E          ; 22 4E 4D C7 | Jump to subroutine long
    LDA $C18D            ; AD 8D C1 | Load from absolute address into accumulator
    STA $3448            ; 8D 48 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_2FB
; Address: $DB9D62
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_2FB:
    JSL $CDAED1          ; 22 D1 AE CD | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9D87            ; 4C 87 9D | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_302
; Address: $DB9D8C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_302:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9D9E            ; 4C 9E 9D | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_305
; Address: $DB9DA3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_305:
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9DC7            ; 4C C7 9D | Jump to address
    LDA $344A            ; AD 4A 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_306
; Address: $DB9DB1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_306:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$7B             ; A2 7B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_30B
; Address: $DB9DD1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_30B:
    JSL $CC7B5A          ; 22 5A 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9DDD            ; 4C DD 9D | Jump to address
    JMP $9DF6            ; 4C F6 9D | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_30C
; Address: $DB9DDD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_30C:
    JSL $CCD4EA          ; 22 EA D4 CC | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9DF6            ; 4C F6 9D | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_30D
; Address: $DB9DEC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_30D:
    JSL $C74D4E          ; 22 4E 4D C7 | Jump to subroutine long
    LDA $C18D            ; AD 8D C1 | Load from absolute address into accumulator
    STA $344A            ; 8D 4A 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_30F
; Address: $DB9DFA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_30F:
    JSL $CDAED1          ; 22 D1 AE CD | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9E1F            ; 4C 1F 9E | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_310
; Address: $DB9E09
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_310:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDX #$21             ; A2 21 | PPU graphics register access
    LDA #$7B             ; A9 7B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_315
; Address: $DB9E24
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_315:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9E36            ; 4C 36 9E | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_318
; Address: $DB9E3B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_318:
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9E5F            ; 4C 5F 9E | Jump to address
    LDA $344C            ; AD 4C 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_319
; Address: $DB9E49
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_319:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$7D             ; A2 7D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_31E
; Address: $DB9E69
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_31E:
    JSL $CC7B5A          ; 22 5A 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9E75            ; 4C 75 9E | Jump to address
    JMP $9E8E            ; 4C 8E 9E | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_31F
; Address: $DB9E75
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_31F:
    JSL $CCD52A          ; 22 2A D5 CC | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9E8E            ; 4C 8E 9E | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_320
; Address: $DB9E84
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_320:
    JSL $C74D4E          ; 22 4E 4D C7 | Jump to subroutine long
    LDA $C18D            ; AD 8D C1 | Load from absolute address into accumulator
    STA $344C            ; 8D 4C 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_322
; Address: $DB9E92
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_322:
    JSL $CDAED1          ; 22 D1 AE CD | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9EB7            ; 4C B7 9E | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_323
; Address: $DB9EA1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_323:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDX #$21             ; A2 21 | PPU graphics register access
    LDA #$7D             ; A9 7D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_328
; Address: $DB9EBC
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_328:
    JSL $CCDADF          ; 22 DF DA CC | Jump to subroutine long
    LDA $353D            ; AD 3D 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9ED8            ; 4C D8 9E | Jump to address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    LDX #$7A             ; A2 7A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_329
; Address: $DB9ED1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_329:
    JSL $C75305          ; 22 05 53 C7 | Jump to subroutine long
    JMP $9F17            ; 4C 17 9F | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9EEA            ; 4C EA 9E | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_32A
; Address: $DB9EE3
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_32A:
    JSL $CCD83F          ; 22 3F D8 CC | Jump to subroutine long
    JMP $9F17            ; 4C 17 9F | Jump to address
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9F17            ; 4C 17 9F | Jump to address
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9F0D            ; 4C 0D 9F | Jump to address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    LDX #$7A             ; A2 7A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_32B
; Address: $DB9F06
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_32B:
    JSL $C75305          ; 22 05 53 C7 | Jump to subroutine long
    JMP $9F17            ; 4C 17 9F | Jump to address
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    LDX #$7A             ; A2 7A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_32D
; Address: $DB9F18
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_32D:
    JSL $CDDB95          ; 22 95 DB CD | Jump to subroutine long
    JMP $9F7A            ; 4C 7A 9F | Jump to address
    LDA #$23             ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_32F
; Address: $DB9F26
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_32F:
    JSL $C74C86          ; 22 86 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9F52            ; 4C 52 9F | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_330
; Address: $DB9F2F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_330:
    JSL $CCD73B          ; 22 3B D7 CC | Jump to subroutine long
    LDA $3422            ; AD 22 34 | Load from absolute address into accumulator
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9F49            ; 4C 49 9F | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    JMP $9F4F            ; 4C 4F 9F | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_331
; Address: $DB9F4C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_331:
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    JMP $9F58            ; 4C 58 9F | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_332
; Address: $DB9F58
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_332:
    JSL $C74BC2          ; 22 C2 4B C7 | Jump to subroutine long
    JMP $9F9D            ; 4C 9D 9F | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    JMP $9F9D            ; 4C 9D 9F | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    JMP $9F9D            ; 4C 9D 9F | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    JMP $9F9D            ; 4C 9D 9F | Jump to address
    LDA $342A            ; AD 2A 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9F1F            ; 4C 1F 9F | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9F5F            ; 4C 5F 9F | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9F68            ; 4C 68 9F | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9F71            ; 4C 71 9F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_333
; Address: $DB9F9E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_333:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9FB0            ; 4C B0 9F | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_334
; Address: $DB9FA9
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_334:
    JSL $CDC3DF          ; 22 DF C3 CD | Jump to subroutine long
    JMP $9FC9            ; 4C C9 9F | Jump to address
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9FC5            ; 4C C5 9F | Jump to address
    LDA                  ; BF 0E 22 D2 | Load from absolute long,X into accumulator
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    CMP #$9F             ; C9 9F | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_338
; Address: $DB9FD2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_338:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    JMP $A001            ; 4C 01 A0 | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_33A
; Address: $DB9FE6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_33A:
    JSL $C75446          ; 22 46 54 C7 | Jump to subroutine long
    JMP $A014            ; 4C 14 A0 | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_33C
; Address: $DB9FFA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_33C:
    JSL $C75446          ; 22 46 54 C7 | Jump to subroutine long
    JMP $A014            ; 4C 14 A0 | Jump to address
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9FD9            ; 4C D9 9F | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9FED            ; 4C ED 9F | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_340
; Address: $DBA020
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_340:
    JSL $C74BC2          ; 22 C2 4B C7 | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_341
; Address: $DBA02D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_341:
    ASL $6622            ; 0E 22 66 | Arithmetic shift left (absolute)
    LDY $B0CD            ; AC CD B0 | Load from absolute address into Y register
    JMP $A069            ; 4C 69 A0 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_342
; Address: $DBA037
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_342:
    JSL $CC901C          ; 22 1C 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A05C            ; 4C 5C A0 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_343
; Address: $DBA040
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_343:
    JSL $CDAD91          ; 22 91 AD CD | Jump to subroutine long
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDX $220E,Y          ; BE 0E 22 | Load from absolute,Y into X register
    AND ($9F,X)          ; 21 9F | Logical AND with accumulator ((zero page,X))
    CPY $D722            ; CC 22 D7 | Compare Y register (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    DEX                  ; CA | Decrement X register
    STA                  ; 9F CD 4C 66 | Store accumulator to absolute long,X
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $000E,X          ; BD 0E 00 | Load from absolute,X into accumulator
    LDY $220E,X          ; BC 0E 22 | Load from absolute,X into Y register
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    BVS $A0              ; 70 A0 | Branch if overflow set
    LDY $220E,X          ; BC 0E 22 | Load from absolute,X into Y register
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_345
; Address: $DBA075
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_345:
    JSL $CC9007          ; 22 07 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A096            ; 4C 96 A0 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_346
; Address: $DBA07E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_346:
    JSL $CDAD91          ; 22 91 AD CD | Jump to subroutine long
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    CPY #$0E             ; C0 0E | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_34B
; Address: $DBA09F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_34B:
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA $358C            ; AD 8C 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $A0B6            ; 4C B6 A0 | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA $358C            ; AD 8C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $A0C7            ; 4C C7 A0 | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_34C
; Address: $DBA0C8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_34C:
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $A0D9            ; 4C D9 A0 | Jump to address
    ORA #$4C             ; 09 4C | Logical OR with accumulator (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDX $09              ; A6 09 | Load from zero page into X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_36F
; Address: $DBA167
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_36F:
    JSL $C73023          ; 22 23 30 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A174            ; 4C 74 A1 | Jump to address
    JMP $A167            ; 4C 67 A1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_395
; Address: $DBA251
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_395:
    JSL $CC7A53          ; 22 53 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A261            ; 4C 61 A2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_397
; Address: $DBA261
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_397:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A27D            ; 4C 7D A2 | Jump to address
    LDA #$0B             ; A9 0B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_398
; Address: $DBA26D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_398:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A27A            ; 4C 7A A2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_399
; Address: $DBA276
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_399:
    JSL $CDA199          ; 22 99 A1 CD | Jump to subroutine long
    JMP $A28D            ; 4C 8D A2 | Jump to address
    LDA #$0C             ; A9 0C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_39A
; Address: $DBA280
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_39A:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A28D            ; 4C 8D A2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_39C
; Address: $DBA28E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_39C:
    JSL $CC7A53          ; 22 53 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A29E            ; 4C 9E A2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_39D
; Address: $DBA297
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_39D:
    JSL $CDA1B1          ; 22 B1 A1 CD | Jump to subroutine long
    JMP $A2AE            ; 4C AE A2 | Jump to address
    LDA #$0F             ; A9 0F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_39E
; Address: $DBA2A1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_39E:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A2AE            ; 4C AE A2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3A1
; Address: $DBA2B2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3A1:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A2BF            ; 4C BF A2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3A6
; Address: $DBA2D0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3A6:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A2EC            ; 4C EC A2 | Jump to address
    LDA #$08             ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3A7
; Address: $DBA2DC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3A7:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A2E9            ; 4C E9 A2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3A8
; Address: $DBA2E5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3A8:
    JSL $CDA1C9          ; 22 C9 A1 CD | Jump to subroutine long
    JMP $A2FC            ; 4C FC A2 | Jump to address
    LDA #$09             ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3A9
; Address: $DBA2EF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3A9:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A2FC            ; 4C FC A2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3AB
; Address: $DBA2FD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3AB:
    JSL $CC7A53          ; 22 53 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A30D            ; 4C 0D A3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3AC
; Address: $DBA306
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3AC:
    JSL $CDA1E1          ; 22 E1 A1 CD | Jump to subroutine long
    JMP $A31D            ; 4C 1D A3 | Jump to address
    LDA #$0A             ; A9 0A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3AD
; Address: $DBA310
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3AD:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A31D            ; 4C 1D A3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3AF
; Address: $DBA31E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3AF:
    JSL $CC7A53          ; 22 53 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A32E            ; 4C 2E A3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3B0
; Address: $DBA327
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3B0:
    JSL $CDA205          ; 22 05 A2 CD | Jump to subroutine long
    JMP $A33E            ; 4C 3E A3 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3B1
; Address: $DBA331
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3B1:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A33E            ; 4C 3E A3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3B3
; Address: $DBA33F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3B3:
    JSL $CC7A53          ; 22 53 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A34F            ; 4C 4F A3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3B5
; Address: $DBA34F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3B5:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A36B            ; 4C 6B A3 | Jump to address
    LDA #$11             ; A9 11 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3B8
; Address: $DBA364
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3B8:
    JSL $CDA1ED          ; 22 ED A1 CD | Jump to subroutine long
    JMP $A37B            ; 4C 7B A3 | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3B9
; Address: $DBA36E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3B9:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A37B            ; 4C 7B A3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3BB
; Address: $DBA37C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3BB:
    JSL $CC7A53          ; 22 53 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A38C            ; 4C 8C A3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3BC
; Address: $DBA385
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3BC:
    JSL $CDA211          ; 22 11 A2 CD | Jump to subroutine long
    JMP $A39C            ; 4C 9C A3 | Jump to address
    LDA #$18             ; A9 18 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3BD
; Address: $DBA38F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3BD:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A39C            ; 4C 9C A3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3BF
; Address: $DBA39D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3BF:
    JSL $CC7A53          ; 22 53 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A3AD            ; 4C AD A3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3C0
; Address: $DBA3A6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3C0:
    JSL $CDA21D          ; 22 1D A2 CD | Jump to subroutine long
    JMP $A3BD            ; 4C BD A3 | Jump to address
    LDA #$17             ; A9 17 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3C1
; Address: $DBA3B0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3C1:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A3BD            ; 4C BD A3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3C3
; Address: $DBA3BE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3C3:
    LDA $353D            ; AD 3D 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A3E3            ; 4C E3 A3 | Jump to address
    LDA #$24             ; A9 24 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3C4
; Address: $DBA3CC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3C4:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A3E0            ; 4C E0 A3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3C6
; Address: $DBA3DC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3C6:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $A3FA            ; 4C FA A3 | Jump to address
    LDA #$23             ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3C7
; Address: $DBA3E6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3C7:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A3FA            ; 4C FA A3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3CB
; Address: $DBA3FE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3CB:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A412            ; 4C 12 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3CE
; Address: $DBA413
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3CE:
    JSL $CC9106          ; 22 06 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A42A            ; 4C 2A A4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3D0
; Address: $DBA423
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3D0:
    JSL $C72F73          ; 22 73 2F C7 | Jump to subroutine long
    JMP $A458            ; 4C 58 A4 | Jump to address
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A448            ; 4C 48 A4 | Jump to address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3D1
; Address: $DBA438
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3D1:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A445            ; 4C 45 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3D2
; Address: $DBA441
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3D2:
    JSL $CDA181          ; 22 81 A1 CD | Jump to subroutine long
    JMP $A458            ; 4C 58 A4 | Jump to address
    LDA #$05             ; A9 05 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3D3
; Address: $DBA44B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3D3:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A458            ; 4C 58 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3D5
; Address: $DBA459
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3D5:
    JSL $CC9122          ; 22 22 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A470            ; 4C 70 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3D7
; Address: $DBA469
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3D7:
    JSL $C72F73          ; 22 73 2F C7 | Jump to subroutine long
    JMP $A49E            ; 4C 9E A4 | Jump to address
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A48E            ; 4C 8E A4 | Jump to address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3D8
; Address: $DBA47E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3D8:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A48B            ; 4C 8B A4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3DB
; Address: $DBA491
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3DB:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A49E            ; 4C 9E A4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3DD
; Address: $DBA49F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3DD:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A4B1            ; 4C B1 A4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3E1
; Address: $DBA4BD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3E1:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A4CF            ; 4C CF A4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3E5
; Address: $DBA4DB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3E5:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A4EB            ; 4C EB A4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3E6
; Address: $DBA4E4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3E6:
    JSL $CDA251          ; 22 51 A2 CD | Jump to subroutine long
    JMP $A50A            ; 4C 0A A5 | Jump to address
    LDA #$17             ; A9 17 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3E7
; Address: $DBA4EE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3E7:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A50A            ; 4C 0A A5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3EE
; Address: $DBA513
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3EE:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A523            ; 4C 23 A5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3F2
; Address: $DBA52C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3F2:
    JSL $CC7A53          ; 22 53 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A543            ; 4C 43 A5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3F5
; Address: $DBA543
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3F5:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A566            ; 4C 66 A5 | Jump to address
    LDA #$1D             ; A9 1D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3F6
; Address: $DBA54F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3F6:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A563            ; 4C 63 A5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3F8
; Address: $DBA55F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3F8:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $A576            ; 4C 76 A5 | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3F9
; Address: $DBA569
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3F9:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A576            ; 4C 76 A5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3FB
; Address: $DBA577
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3FB:
    LDA $354D            ; AD 4D 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A589            ; 4C 89 A5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3FE
; Address: $DBA58E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3FE:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A5B3            ; 4C B3 A5 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_3FF
; Address: $DBA59C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_3FF:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A5B0            ; 4C B0 A5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_405
; Address: $DBA5C2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_405:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A5E9            ; 4C E9 A5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_40C
; Address: $DBA5EA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_40C:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A60F            ; 4C 0F A6 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_417
; Address: $DBA627
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_417:
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A64C            ; 4C 4C A6 | Jump to address
    LDA #$13             ; A9 13 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_418
; Address: $DBA635
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_418:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A649            ; 4C 49 A6 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_41A
; Address: $DBA645
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_41A:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $A679            ; 4C 79 A6 | Jump to address
    LDA #$13             ; A9 13 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_41B
; Address: $DBA64F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_41B:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A679            ; 4C 79 A6 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_422
; Address: $DBA67A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_422:
    JSL $CC913E          ; 22 3E 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A691            ; 4C 91 A6 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_424
; Address: $DBA68A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_424:
    JSL $C72F73          ; 22 73 2F C7 | Jump to subroutine long
    JMP $A6A1            ; 4C A1 A6 | Jump to address
    LDA #$16             ; A9 16 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_425
; Address: $DBA694
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_425:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A6A1            ; 4C A1 A6 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_428
; Address: $DBA6A5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_428:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A6C8            ; 4C C8 A6 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_431
; Address: $DBA6D8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_431:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A70D            ; 4C 0D A7 | Jump to address
    LDA $3554            ; AD 54 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A6F3            ; 4C F3 A6 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_43F
; Address: $DBA72F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_43F:
    JSL $C72FEE          ; 22 EE 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A73C            ; 4C 3C A7 | Jump to address
    JMP $A72C            ; 4C 2C A7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_443
; Address: $DBA748
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_443:
    JSL $C72FEE          ; 22 EE 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A755            ; 4C 55 A7 | Jump to address
    JMP $A745            ; 4C 45 A7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_44D
; Address: $DBA77D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_44D:
    JSL $C72FEE          ; 22 EE 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A78A            ; 4C 8A A7 | Jump to address
    JMP $A77A            ; 4C 7A A7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_45B
; Address: $DBA7B7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_45B:
    JSL $C72FEE          ; 22 EE 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A7C4            ; 4C C4 A7 | Jump to address
    JMP $A7B4            ; 4C B4 A7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_45C
; Address: $DBA7C5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_45C:
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_45F
; Address: $DBA7D5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_45F:
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_460
; Address: $DBA7DD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_460:
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    INC $C72F            ; EE 2F C7 | Increment (absolute)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A7ED            ; 4C ED A7 | Jump to address
    JMP $A7DD            ; 4C DD A7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_463
; Address: $DBA7F8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_463:
    JSL $C72FEE          ; 22 EE 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A805            ; 4C 05 A8 | Jump to address
    JMP $A7F5            ; 4C F5 A7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_466
; Address: $DBA810
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_466:
    JSL $C72FEE          ; 22 EE 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A81D            ; 4C 1D A8 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_46B
; Address: $DBA82D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_46B:
    JSL $C72FEE          ; 22 EE 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A83A            ; 4C 3A A8 | Jump to address
    JMP $A82A            ; 4C 2A A8 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_46E
; Address: $DBA845
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_46E:
    JSL $C72FEE          ; 22 EE 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $A852            ; 4C 52 A8 | Jump to address
    JMP $A842            ; 4C 42 A8 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_46F
; Address: $DBA853
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_46F:
    LDA #$6A             ; A9 6A | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_470
; Address: $DBA85B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_470:
    LDA #$6A             ; A9 6A | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_490
; Address: $DBA8EA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_490:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ADC $2200            ; 6D 00 22 | Add with carry (absolute)
    LDX $C737,Y          ; BE 37 C7 | Load from absolute,Y into X register
    JMP ($2200)          ; 6C 00 22 | Jump to address (absolute indirect)
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_491
; Address: $DBA8FB
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_491:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ASL $A8              ; 06 A8 | Arithmetic shift left (zero page)
    CMP $EE22            ; CD 22 EE | Compare accumulator (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    LDX $C737,Y          ; BE 37 C7 | Load from absolute,Y into X register
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A922            ; 4C 22 A9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_492
; Address: $DBA91B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_492:
    JSL $CDA8DB          ; 22 DB A8 CD | Jump to subroutine long
    JMP $A96B            ; 4C 6B A9 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A967            ; 4C 67 A9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_496
; Address: $DBA93B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_496:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    STA $342C            ; 8D 2C 34 | Store accumulator to absolute address
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_499
; Address: $DBA952
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_499:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY #$CC             ; A0 CC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_49D
; Address: $DBA96C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_49D:
    LDA $3550            ; AD 50 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A97E            ; 4C 7E A9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_49F
; Address: $DBA97E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_49F:
    JSL $CC8F46          ; 22 46 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A9B4            ; 4C B4 A9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4A1
; Address: $DBA98B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4A1:
    JSL $CDA8D4          ; 22 D4 A8 CD | Jump to subroutine long
    LDA #$85             ; A9 85 | Load immediate value into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4A3
; Address: $DBA999
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4A3:
    JSL $CC9FD6          ; 22 D6 9F CC | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    BVC $35              ; 50 35 | Branch if overflow clear
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $B84C            ; CC 4C B8 | Compare Y register (absolute)
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP $226B            ; CD 6B 22 | Compare accumulator (absolute)
    CMP $2AAD            ; CD AD 2A | Compare accumulator (absolute)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A9CF            ; 4C CF A9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4A5
; Address: $DBA9CF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4A5:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    STZ $A90F,X          ; 9E 0F A9 | Store zero to absolute,X
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4A7
; Address: $DBA9DF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4A7:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    STA                  ; 9F 0F 4C 7B | Store accumulator to absolute long,X
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4A8
; Address: $DBA9E8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4A8:
    JSL $CC7D1C          ; 22 1C 7D CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A9FA            ; 4C FA A9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4A9
; Address: $DBA9F1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4A9:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LDA ($0F,X)          ; A1 0F | Load from (zero page,X) into accumulator
    JMP $AA00            ; 4C 00 AA | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4AA
; Address: $DBA9FA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4AA:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LDY #$0F             ; A0 0F | Load immediate value into Y register
    JMP $AA7B            ; 4C 7B AA | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4AB
; Address: $DBAA03
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4AB:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LDX #$0F             ; A2 0F | Load immediate value into X register
    JMP $AA7B            ; 4C 7B AA | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4AD
; Address: $DBAA15
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4AD:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LDY $0F              ; A4 0F | Load from zero page into Y register
    JMP $AA7B            ; 4C 7B AA | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4AE
; Address: $DBAA1E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4AE:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LDA $0F              ; A5 0F | Load from zero page into accumulator
    JMP $AA7B            ; 4C 7B AA | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4B0
; Address: $DBAA2D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4B0:
    JSL $CC975B          ; 22 5B 97 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $AA3D            ; 4C 3D AA | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4B1
; Address: $DBAA36
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4B1:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    JMP $AA7B            ; 4C 7B AA | Jump to address
    LDA $C141            ; AD 41 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A9DF            ; 4C DF A9 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A9E8            ; 4C E8 A9 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $AA03            ; 4C 03 AA | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $AA0C            ; 4C 0C AA | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $AA15            ; 4C 15 AA | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $AA1E            ; 4C 1E AA | Jump to address
    CMP #$06             ; C9 06 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_4FE
; Address: $DBAC60
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_4FE:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register
    LDA #$16             ; A9 16 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_500
; Address: $DBAC6F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_500:
    JMP $AC81            ; 4C 81 AC | Jump to address
    LDA $C13B            ; AD 3B C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $AC81            ; 4C 81 AC | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $AC82            ; 4C 82 AC | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_502
; Address: $DBAC86
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_502:
    JSL $C73814          ; 22 14 38 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AC9E            ; 4C 9E AC | Jump to address
    LDA $C13B            ; AD 3B C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $AC9E            ; 4C 9E AC | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $AC9F            ; 4C 9F AC | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_504
; Address: $DBACA3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_504:
    JSL $C73814          ; 22 14 38 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $ACBB            ; 4C BB AC | Jump to address
    LDA $C13B            ; AD 3B C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $ACBB            ; 4C BB AC | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $ACBC            ; 4C BC AC | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_505
; Address: $DBACBD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_505:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    BVC $01              ; 50 01 | Branch if overflow clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_506
; Address: $DBACC4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_506:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    BVC $01              ; 50 01 | Branch if overflow clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_507
; Address: $DBACCB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_507:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    STZ $01              ; 64 01 | Store zero to zero page
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_510
; Address: $DBACF7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_510:
    JSL $CC7B5A          ; 22 5A 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $AD09            ; 4C 09 AD | Jump to address
    LDA #$8A             ; A9 8A | Load immediate value into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address
    JMP $AD0F            ; 4C 0F AD | Jump to address
    LDA #$8B             ; A9 8B | Load immediate value into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_511
; Address: $DBAD10
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_511:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address
    LDX #$07             ; A2 07 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_512
; Address: $DBAD19
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_512:
    JSL $C788DF          ; 22 DF 88 C7 | Jump to subroutine long
    LDA $C161            ; AD 61 C1 | Load from absolute address into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_513
; Address: $DBAD24
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_513:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    STA $C10B            ; 8D 0B C1 | Store accumulator to absolute address
    LDX #$05             ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_514
; Address: $DBAD2D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_514:
    JSL $C788DF          ; 22 DF 88 C7 | Jump to subroutine long
    LDA $C161            ; AD 61 C1 | Load from absolute address into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_515
; Address: $DBAD39
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_515:
    ADC $6B03,Y          ; 79 03 6B | Add with carry (absolute,Y)
    PLY                  ; 7A | Pull Y register from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_517
; Address: $DBAD44
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_517:
    JSL $CC7B6F          ; 22 6F 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $AD53            ; 4C 53 AD | Jump to address
    JMP $AD56            ; 4C 56 AD | Jump to address
    ADC $6B03,X          ; 7D 03 6B | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_518
; Address: $DBAD57
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_518:
    JSL $CC7B6F          ; 22 6F 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $AD66            ; 4C 66 AD | Jump to address
    ROR $4C03,X          ; 7E 03 4C | Rotate right (absolute,X)
    ADC #$AD             ; 69 AD | Add with carry (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_51B
; Address: $DBAD72
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_51B:
    JSL $CC7B6F          ; 22 6F 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $AD81            ; 4C 81 AD | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_520
; Address: $DBAD91
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_520:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $BE82            ; 8D 82 BE | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_521
; Address: $DBAD9E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_521:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $BE85            ; 8D 85 BE | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $BE86            ; 8D 86 BE | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_522
; Address: $DBADAB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_522:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $ADBA            ; 4C BA AD | Jump to address
    JMP $ADAB            ; 4C AB AD | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_523
; Address: $DBADBB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_523:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$64             ; 69 64 | Add with carry (immediate)
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_524
; Address: $DBADC6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_524:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_525
; Address: $DBADD1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_525:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_526
; Address: $DBADD8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_526:
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_527
; Address: $DBADDF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_527:
    LDA #$DC             ; A9 DC | Load immediate value into accumulator
    ORA $8D              ; 05 8D | Logical OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_528
; Address: $DBADE6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_528:
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_529
; Address: $DBADED
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_529:
    LDA #$B8             ; A9 B8 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_52C
; Address: $DBADFB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_52C:
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_52D
; Address: $DBAE02
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_52D:
    LDA #$70             ; A9 70 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_52E
; Address: $DBAE09
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_52E:
    LDA #$58             ; A9 58 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_52F
; Address: $DBAE10
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_52F:
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_530
; Address: $DBAE17
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_530:
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_531
; Address: $DBAE1E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_531:
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_532
; Address: $DBAE25
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_532:
    LDA #$F8             ; A9 F8 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_533
; Address: $DBAE2C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_533:
    LDA #$E0             ; A9 E0 | Game work RAM access
    ROL $348D            ; 2E 8D 34 | Rotate left (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_534
; Address: $DBAE33
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_534:
    LDA #$C8             ; A9 C8 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_535
; Address: $DBAE3A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_535:
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_536
; Address: $DBAE41
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_536:
    LDA #$98             ; A9 98 | Load immediate value into accumulator
    DEC                  ; 3A | Decrement accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_537
; Address: $DBAE48
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_537:
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ROL $348D,X          ; 3E 8D 34 | Rotate left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_538
; Address: $DBAE4F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_538:
    LDA #$68             ; A9 68 | Load immediate value into accumulator
    WDM #$8D             ; 42 8D | Reserved instruction
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_539
; Address: $DBAE56
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_539:
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    LSR $8D              ; 46 8D | Logical shift right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_53A
; Address: $DBAE5D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_53A:
    LDA #$38             ; A9 38 | Load immediate value into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_53B
; Address: $DBAE64
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_53B:
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LSR $348D            ; 4E 8D 34 | Logical shift right (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_53C
; Address: $DBAE6B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_53C:
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_53D
; Address: $DBAE72
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_53D:
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_53E
; Address: $DBAE79
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_53E:
    LDA #$D8             ; A9 D8 | Load immediate value into accumulator
    EOR $348D,Y          ; 59 8D 34 | Exclusive OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_53F
; Address: $DBAE80
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_53F:
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    EOR $348D,X          ; 5D 8D 34 | Exclusive OR with accumulator (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_540
; Address: $DBAE87
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_540:
    LDA #$A8             ; A9 A8 | Load immediate value into accumulator
    ADC ($8D,X)          ; 61 8D | Add with carry ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_541
; Address: $DBAE8E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_541:
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    ADC $8D              ; 65 8D | Add with carry (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_542
; Address: $DBAE95
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_542:
    LDA #$78             ; A9 78 | Load immediate value into accumulator
    ADC #$8D             ; 69 8D | Add with carry (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_543
; Address: $DBAE9C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_543:
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    ADC $348D            ; 6D 8D 34 | Add with carry (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_544
; Address: $DBAEA3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_544:
    LDA #$48             ; A9 48 | Load immediate value into accumulator
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_545
; Address: $DBAEAA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_545:
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_546
; Address: $DBAEB1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_546:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AEC0            ; 4C C0 AE | Jump to address
    JMP $AEB1            ; 4C B1 AE | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_547
; Address: $DBAEC1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_547:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$DC             ; C9 DC | Compare accumulator (immediate)
    ORA $90              ; 05 90 | Logical OR with accumulator (zero page)
    JMP $AED0            ; 4C D0 AE | Jump to address
    JMP $AEC1            ; 4C C1 AE | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_548
; Address: $DBAED1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_548:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AEE0            ; 4C E0 AE | Jump to address
    JMP $AED1            ; 4C D1 AE | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_54A
; Address: $DBAEE1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_54A:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AEF0            ; 4C F0 AE | Jump to address
    JMP $AEE1            ; 4C E1 AE | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_54B
; Address: $DBAEF1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_54B:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AF00            ; 4C 00 AF | Jump to address
    JMP $AEF1            ; 4C F1 AE | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_54C
; Address: $DBAF01
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_54C:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AF10            ; 4C 10 AF | Jump to address
    JMP $AF01            ; 4C 01 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_54D
; Address: $DBAF11
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_54D:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AF20            ; 4C 20 AF | Jump to address
    JMP $AF11            ; 4C 11 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_54E
; Address: $DBAF21
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_54E:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$58             ; C9 58 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AF30            ; 4C 30 AF | Jump to address
    JMP $AF21            ; 4C 21 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_54F
; Address: $DBAF31
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_54F:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AF40            ; 4C 40 AF | Jump to address
    JMP $AF31            ; 4C 31 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_550
; Address: $DBAF41
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_550:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$28             ; C9 28 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AF50            ; 4C 50 AF | Jump to address
    JMP $AF41            ; 4C 41 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_551
; Address: $DBAF51
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_551:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AF60            ; 4C 60 AF | Jump to address
    JMP $AF51            ; 4C 51 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_553
; Address: $DBAF64
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_553:
    CMP #$F8             ; C9 F8 | Compare accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AF70            ; 4C 70 AF | Jump to address
    JMP $AF61            ; 4C 61 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_554
; Address: $DBAF71
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_554:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$E0             ; C9 E0 | Game work RAM access
    ROL $0390            ; 2E 90 03 | Rotate left (absolute)
    JMP $AF80            ; 4C 80 AF | Jump to address
    JMP $AF71            ; 4C 71 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_555
; Address: $DBAF81
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_555:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$C8             ; C9 C8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AF90            ; 4C 90 AF | Jump to address
    JMP $AF81            ; 4C 81 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_556
; Address: $DBAF91
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_556:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$B0             ; C9 B0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AFA0            ; 4C A0 AF | Jump to address
    JMP $AF91            ; 4C 91 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_557
; Address: $DBAFA1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_557:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$98             ; C9 98 | Compare accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AFB0            ; 4C B0 AF | Jump to address
    JMP $AFA1            ; 4C A1 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_558
; Address: $DBAFB1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_558:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$80             ; C9 80 | Compare accumulator (immediate)
    ROL $0390,X          ; 3E 90 03 | Rotate left (absolute,X)
    JMP $AFC0            ; 4C C0 AF | Jump to address
    JMP $AFB1            ; 4C B1 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_559
; Address: $DBAFC1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_559:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$68             ; C9 68 | Compare accumulator (immediate)
    WDM #$90             ; 42 90 | Reserved instruction
    JMP $AFD0            ; 4C D0 AF | Jump to address
    JMP $AFC1            ; 4C C1 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_55A
; Address: $DBAFD1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_55A:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$50             ; C9 50 | Compare accumulator (immediate)
    LSR $90              ; 46 90 | Logical shift right (zero page)
    JMP $AFE0            ; 4C E0 AF | Jump to address
    JMP $AFD1            ; 4C D1 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_55C
; Address: $DBAFE4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_55C:
    CMP #$38             ; C9 38 | Compare accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AFF0            ; 4C F0 AF | Jump to address
    JMP $AFE1            ; 4C E1 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_55D
; Address: $DBAFF1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_55D:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    LSR $0390            ; 4E 90 03 | Logical shift right (absolute)
    JMP $B000            ; 4C 00 B0 | Jump to address
    JMP $AFF1            ; 4C F1 AF | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_55E
; Address: $DBB001
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_55E:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B010            ; 4C 10 B0 | Jump to address
    JMP $B001            ; 4C 01 B0 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_55F
; Address: $DBB011
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_55F:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$F0             ; C9 F0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B020            ; 4C 20 B0 | Jump to address
    JMP $B011            ; 4C 11 B0 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_560
; Address: $DBB021
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_560:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$D8             ; C9 D8 | Compare accumulator (immediate)
    EOR $0390,Y          ; 59 90 03 | Exclusive OR with accumulator (absolute,Y)
    JMP $B030            ; 4C 30 B0 | Jump to address
    JMP $B021            ; 4C 21 B0 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_561
; Address: $DBB031
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_561:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$C0             ; C9 C0 | Compare accumulator (immediate)
    EOR $0390,X          ; 5D 90 03 | Exclusive OR with accumulator (absolute,X)
    JMP $B040            ; 4C 40 B0 | Jump to address
    JMP $B031            ; 4C 31 B0 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_562
; Address: $DBB041
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_562:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$A8             ; C9 A8 | Compare accumulator (immediate)
    ADC ($90,X)          ; 61 90 | Add with carry ((zero page,X))
    JMP $B050            ; 4C 50 B0 | Jump to address
    JMP $B041            ; 4C 41 B0 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_563
; Address: $DBB051
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_563:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$90             ; C9 90 | Compare accumulator (immediate)
    ADC $90              ; 65 90 | Add with carry (zero page)
    JMP $B060            ; 4C 60 B0 | Jump to address
    JMP $B051            ; 4C 51 B0 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_565
; Address: $DBB066
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_565:
    ADC #$90             ; 69 90 | Add with carry (immediate)
    JMP $B070            ; 4C 70 B0 | Jump to address
    JMP $B061            ; 4C 61 B0 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_566
; Address: $DBB071
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_566:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$60             ; C9 60 | Compare accumulator (immediate)
    ADC $0390            ; 6D 90 03 | Add with carry (absolute)
    JMP $B080            ; 4C 80 B0 | Jump to address
    JMP $B071            ; 4C 71 B0 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_567
; Address: $DBB081
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_567:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$48             ; C9 48 | Compare accumulator (immediate)
    ADC ($90),Y          ; 71 90 | Add with carry ((zero page),Y)
    JMP $B090            ; 4C 90 B0 | Jump to address
    JMP $B081            ; 4C 81 B0 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_568
; Address: $DBB091
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_568:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B0A0            ; 4C A0 B0 | Jump to address
    JMP $B091            ; 4C 91 B0 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_569
; Address: $DBB0A1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_569:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_56A
; Address: $DBB0A8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_56A:
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_56B
; Address: $DBB0AF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_56B:
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_56C
; Address: $DBB0B6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_56C:
    LDA #$B8             ; A9 B8 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_56D
; Address: $DBB0BD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_56D:
    LDA #$A0             ; A9 A0 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_56E
; Address: $DBB0C4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_56E:
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_56F
; Address: $DBB0CB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_56F:
    LDA #$70             ; A9 70 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_570
; Address: $DBB0D2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_570:
    LDA #$58             ; A9 58 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_571
; Address: $DBB0D9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_571:
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_574
; Address: $DBB0E7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_574:
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_575
; Address: $DBB0EE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_575:
    LDA #$F8             ; A9 F8 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_576
; Address: $DBB0F5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_576:
    LDA #$E0             ; A9 E0 | Game work RAM access
    ROL $368D            ; 2E 8D 36 | Rotate left (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_577
; Address: $DBB0FC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_577:
    LDA #$C8             ; A9 C8 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_578
; Address: $DBB103
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_578:
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_579
; Address: $DBB10A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_579:
    LDA #$98             ; A9 98 | Load immediate value into accumulator
    DEC                  ; 3A | Decrement accumulator
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_57A
; Address: $DBB111
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_57A:
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ROL $368D,X          ; 3E 8D 36 | Rotate left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_57B
; Address: $DBB118
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_57B:
    LDA #$68             ; A9 68 | Load immediate value into accumulator
    WDM #$8D             ; 42 8D | Reserved instruction
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_57C
; Address: $DBB11F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_57C:
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    LSR $8D              ; 46 8D | Logical shift right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_57D
; Address: $DBB126
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_57D:
    LDA #$38             ; A9 38 | Load immediate value into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $3436            ; 8D 36 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_57E
; Address: $DBB12D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_57E:
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LSR $368D            ; 4E 8D 36 | Logical shift right (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_57F
; Address: $DBB134
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_57F:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B143            ; 4C 43 B1 | Jump to address
    JMP $B134            ; 4C 34 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_580
; Address: $DBB144
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_580:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B153            ; 4C 53 B1 | Jump to address
    JMP $B144            ; 4C 44 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_581
; Address: $DBB154
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_581:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B163            ; 4C 63 B1 | Jump to address
    JMP $B154            ; 4C 54 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_582
; Address: $DBB164
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_582:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B173            ; 4C 73 B1 | Jump to address
    JMP $B164            ; 4C 64 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_583
; Address: $DBB174
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_583:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B183            ; 4C 83 B1 | Jump to address
    JMP $B174            ; 4C 74 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_584
; Address: $DBB184
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_584:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B193            ; 4C 93 B1 | Jump to address
    JMP $B184            ; 4C 84 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_585
; Address: $DBB194
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_585:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$58             ; C9 58 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B1A3            ; 4C A3 B1 | Jump to address
    JMP $B194            ; 4C 94 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_586
; Address: $DBB1A4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_586:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B1B3            ; 4C B3 B1 | Jump to address
    JMP $B1A4            ; 4C A4 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_587
; Address: $DBB1B4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_587:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$28             ; C9 28 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B1C3            ; 4C C3 B1 | Jump to address
    JMP $B1B4            ; 4C B4 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_588
; Address: $DBB1C4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_588:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B1D3            ; 4C D3 B1 | Jump to address
    JMP $B1C4            ; 4C C4 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_58A
; Address: $DBB1D9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_58A:
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B1E3            ; 4C E3 B1 | Jump to address
    JMP $B1D4            ; 4C D4 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_58B
; Address: $DBB1E4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_58B:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$E0             ; C9 E0 | Game work RAM access
    ROL $0390            ; 2E 90 03 | Rotate left (absolute)
    JMP $B1F3            ; 4C F3 B1 | Jump to address
    JMP $B1E4            ; 4C E4 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_58C
; Address: $DBB1F4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_58C:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$C8             ; C9 C8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B203            ; 4C 03 B2 | Jump to address
    JMP $B1F4            ; 4C F4 B1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_58D
; Address: $DBB204
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_58D:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$B0             ; C9 B0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B213            ; 4C 13 B2 | Jump to address
    JMP $B204            ; 4C 04 B2 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_58E
; Address: $DBB214
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_58E:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$98             ; C9 98 | Compare accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B223            ; 4C 23 B2 | Jump to address
    JMP $B214            ; 4C 14 B2 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_58F
; Address: $DBB224
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_58F:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$80             ; C9 80 | Compare accumulator (immediate)
    ROL $0390,X          ; 3E 90 03 | Rotate left (absolute,X)
    JMP $B233            ; 4C 33 B2 | Jump to address
    JMP $B224            ; 4C 24 B2 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_590
; Address: $DBB234
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_590:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$68             ; C9 68 | Compare accumulator (immediate)
    WDM #$90             ; 42 90 | Reserved instruction
    JMP $B243            ; 4C 43 B2 | Jump to address
    JMP $B234            ; 4C 34 B2 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_591
; Address: $DBB244
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_591:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$50             ; C9 50 | Compare accumulator (immediate)
    LSR $90              ; 46 90 | Logical shift right (zero page)
    JMP $B253            ; 4C 53 B2 | Jump to address
    JMP $B244            ; 4C 44 B2 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_593
; Address: $DBB259
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_593:
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B263            ; 4C 63 B2 | Jump to address
    JMP $B254            ; 4C 54 B2 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_594
; Address: $DBB264
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_594:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    LSR $0390            ; 4E 90 03 | Logical shift right (absolute)
    JMP $B273            ; 4C 73 B2 | Jump to address
    JMP $B264            ; 4C 64 B2 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_595
; Address: $DBB274
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_595:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $343C            ; 8D 3C 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_596
; Address: $DBB27B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_596:
    LDA $343C            ; AD 3C 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $B28A            ; 4C 8A B2 | Jump to address
    JMP $B27B            ; 4C 7B B2 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_597
; Address: $DBB28B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_597:
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $343C            ; 8D 3C 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_598
; Address: $DBB292
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_598:
    LDA $343C            ; AD 3C 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B2A1            ; 4C A1 B2 | Jump to address
    JMP $B292            ; 4C 92 B2 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_599
; Address: $DBB2A2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_599:
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $343C            ; 8D 3C 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_59A
; Address: $DBB2A9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_59A:
    LDA $343C            ; AD 3C 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B2B8            ; 4C B8 B2 | Jump to address
    JMP $B2A9            ; 4C A9 B2 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_59D
; Address: $DBB2BE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_59D:
    JSL $C7526E          ; 22 6E 52 C7 | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    EOR $C76D,Y          ; 59 6D C7 | Exclusive OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5A4
; Address: $DBB2E3
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5A4:
    JSL $C738E2          ; 22 E2 38 C7 | Jump to subroutine long
    TSX                  ; BA | Transfer stack pointer to X register
    CMP $226B            ; CD 6B 22 | Compare accumulator (absolute)
    SEP #$38             ; E2 38 | Set processor status bits
    DEX                  ; CA | Decrement X register
    CMP $226B            ; CD 6B 22 | Compare accumulator (absolute)
    SEP #$38             ; E2 38 | Set processor status bits
    ORA ($CF,X)          ; 01 CF | Logical OR with accumulator ((zero page,X))
    CMP $226B            ; CD 6B 22 | Compare accumulator (absolute)
    ROL $CC80,X          ; 3E 80 CC | Rotate left (absolute,X)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B30E            ; 4C 0E B3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5A6
; Address: $DBB30F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5A6:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $B32E            ; 4C 2E B3 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5A7
; Address: $DBB31D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5A7:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B32E            ; 4C 2E B3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5AA
; Address: $DBB32F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5AA:
    LDA $354D            ; AD 4D 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $B34E            ; 4C 4E B3 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5AB
; Address: $DBB33D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5AB:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B34E            ; 4C 4E B3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5AF
; Address: $DBB352
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5AF:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B36F            ; 4C 6F B3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5B1
; Address: $DBB362
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5B1:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B36F            ; 4C 6F B3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5B2
; Address: $DBB36B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5B2:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    EOR $C76D,Y          ; 59 6D C7 | Exclusive OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5B7
; Address: $DBB389
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5B7:
    JSL $C74C04          ; 22 04 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B4AF            ; 4C AF B4 | Jump to address
    LDA #$E0             ; A9 E0 | Game work RAM access
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$28             ; A0 28 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B3DA            ; 4C DA B3 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5B8
; Address: $DBB3A7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5B8:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B3BF            ; 4C BF B3 | Jump to address
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5B9
; Address: $DBB3C2
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5B9:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B3D7            ; 4C D7 B3 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    LDA $D0A9B4          ; AF B4 A9 D0 | Load from absolute long address into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$E0             ; A2 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    LDY #$18             ; A0 18 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5BA
; Address: $DBB3E3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5BA:
    JSL $C75365          ; 22 65 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B422            ; 4C 22 B4 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5BB
; Address: $DBB3EF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5BB:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B407            ; 4C 07 B4 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5BC
; Address: $DBB40A
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5BC:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B41F            ; 4C 1F B4 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    LDA $E0A9B4          ; AF B4 A9 E0 | Game work RAM access
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX #$F8             ; A2 F8 | Load immediate value into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$28             ; A0 28 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B46A            ; 4C 6A B4 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5BD
; Address: $DBB437
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5BD:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B44F            ; 4C 4F B4 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5BE
; Address: $DBB452
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5BE:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B467            ; 4C 67 B4 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    LDA $30A9B4          ; AF B4 A9 30 | Load from absolute long address into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    CPX #$09             ; E0 09 | Compare X register (immediate)
    LDY #$70             ; A0 70 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B4AF            ; 4C AF B4 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5C0
; Address: $DBB483
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5C0:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B497            ; 4C 97 B4 | Jump to address
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    LDA $00A9B4          ; AF B4 A9 00 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5C1
; Address: $DBB49A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5C1:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B4AF            ; 4C AF B4 | Jump to address
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $6B36,Y          ; 19 36 6B | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5C3
; Address: $DBB4B4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5C3:
    JSL $C74EE9          ; 22 E9 4E C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B4C4            ; 4C C4 B4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5CB
; Address: $DBB4DB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5CB:
    JSL $C90572          ; 22 72 05 C9 | Jump to subroutine long
    AND $C898,Y          ; 39 98 C8 | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5CC
; Address: $DBB4EE
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5CC:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $B4FD            ; 4C FD B4 | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $B50D            ; 4C 0D B5 | Jump to address
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $B50C            ; 4C 0C B5 | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $B50D            ; 4C 0D B5 | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5CE
; Address: $DBB514
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5CE:
    BEQ $03              ; F0 03 | Branch if equal
    JMP $B51D            ; 4C 1D B5 | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $B51E            ; 4C 1E B5 | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5CF
; Address: $DBB51F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5CF:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $B52E            ; 4C 2E B5 | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $B52F            ; 4C 2F B5 | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5D0
; Address: $DBB530
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5D0:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $B53F            ; 4C 3F B5 | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $B540            ; 4C 40 B5 | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5D1
; Address: $DBB541
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5D1:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $B550            ; 4C 50 B5 | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $B551            ; 4C 51 B5 | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5D3
; Address: $DBB558
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5D3:
    BIT $220F            ; 2C 0F 22 | Test bits in accumulator (absolute)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $006B            ; CD 6B 00 | Compare accumulator (absolute)
    AND $220F            ; 2D 0F 22 | Logical AND with accumulator (absolute)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $226B            ; CD 6B 22 | Compare accumulator (absolute)
    ROR $CCD3,X          ; 7E D3 CC | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5D4
; Address: $DBB56B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5D4:
    JSL $CC76FD          ; 22 FD 76 CC | Jump to subroutine long
    ROL $220F            ; 2E 0F 22 | Rotate left (absolute)
    CPY $B022            ; CC 22 B0 | Compare Y register (absolute)
    CMP $006B            ; CD 6B 00 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5E3
; Address: $DBB5CC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5E3:
    AND $220F,Y          ; 39 0F 22 | Logical AND with accumulator (absolute,Y)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $006B            ; CD 6B 00 | Compare accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5E7
; Address: $DBB5EC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5E7:
    AND $220F,X          ; 3D 0F 22 | Logical AND with accumulator (absolute,X)
    CMP $226B            ; CD 6B 22 | Compare accumulator (absolute)
    ROR $CCD3,X          ; 7E D3 CC | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_5EA
; Address: $DBB601
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_5EA:
    ROL $220F,X          ; 3E 0F 22 | Rotate left (absolute,X)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $006B            ; CD 6B 00 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_600
; Address: $DBB671
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_600:
    JMP $220F            ; 4C 0F 22 | Jump to address
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $006B            ; CD 6B 00 | Compare accumulator (absolute)
    EOR $220F            ; 4D 0F 22 | Exclusive OR with accumulator (absolute)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $006B            ; CD 6B 00 | Compare accumulator (absolute)
    LSR $220F            ; 4E 0F 22 | Logical shift right (absolute)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $006B            ; CD 6B 00 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_60F
; Address: $DBB6E1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_60F:
    EOR $220F,Y          ; 59 0F 22 | Exclusive OR with accumulator (absolute,Y)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $006B            ; CD 6B 00 | Compare accumulator (absolute)
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank36_DmaFunction_612
; Address: $DBB6F9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_612:
    JMP $B0220F          ; 5C 0F 22 B0 | Jump to address long
    CMP $226B            ; CD 6B 22 | Compare accumulator (absolute)
    DEC $CDB4            ; CE B4 CD | Decrement (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_614
; Address: $DBB709
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_614:
    JSL $CDB50E          ; 22 0E B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B71C            ; 4C 1C B7 | Jump to address
    EOR $220F,X          ; 5D 0F 22 | Exclusive OR with accumulator (absolute,X)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $334C            ; CD 4C 33 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_615
; Address: $DBB71C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_615:
    JSL $CDB51F          ; 22 1F B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B72F            ; 4C 2F B7 | Jump to address
    LSR $220F,X          ; 5E 0F 22 | Logical shift right (absolute,X)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $334C            ; CD 4C 33 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_618
; Address: $DBB738
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_618:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B74B            ; 4C 4B B7 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_61C
; Address: $DBB754
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_61C:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B767            ; 4C 67 B7 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank36_DmaFunction_625
; Address: $DBB78C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_625:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B79F            ; 4C 9F B7 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_629
; Address: $DBB7A8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_629:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B7BB            ; 4C BB B7 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_62D
; Address: $DBB7C4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_62D:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B7D7            ; 4C D7 B7 | Jump to address
    STZ $0F              ; 64 0F | Store zero to zero page

;------------------------------------------------------------------------------
; Bank36_DmaFunction_631
; Address: $DBB7E0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_631:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B7F3            ; 4C F3 B7 | Jump to address
    ADC $0F              ; 65 0F | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_635
; Address: $DBB7FC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_635:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B80F            ; 4C 0F B8 | Jump to address
    ROR $0F              ; 66 0F | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_639
; Address: $DBB818
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_639:
    JSL $CDB50E          ; 22 0E B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B82B            ; 4C 2B B8 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_63B
; Address: $DBB82B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_63B:
    JSL $CDB51F          ; 22 1F B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B83E            ; 4C 3E B8 | Jump to address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank36_DmaFunction_63F
; Address: $DBB847
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_63F:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B85A            ; 4C 5A B8 | Jump to address
    ADC #$0F             ; 69 0F | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_643
; Address: $DBB863
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_643:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B876            ; 4C 76 B8 | Jump to address
    ROR                  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_647
; Address: $DBB87F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_647:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B892            ; 4C 92 B8 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_64B
; Address: $DBB89B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_64B:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B8AE            ; 4C AE B8 | Jump to address
    JMP ($220F)          ; 6C 0F 22 | Jump to address (absolute indirect)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $B24C            ; CD 4C B2 | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank36_DmaFunction_64E
; Address: $DBB8B7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_64E:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B8CA            ; 4C CA B8 | Jump to address
    ADC $220F            ; 6D 0F 22 | Add with carry (absolute)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $CE4C            ; CD 4C CE | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank36_DmaFunction_651
; Address: $DBB8D3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_651:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B8E6            ; 4C E6 B8 | Jump to address
    ROR $220F            ; 6E 0F 22 | Rotate right (absolute)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $EA4C            ; CD 4C EA | Compare accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank36_DmaFunction_654
; Address: $DBB8EF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_654:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B902            ; 4C 02 B9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_658
; Address: $DBB90B
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_658:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B91E            ; 4C 1E B9 | Jump to address
    AND $220F,X          ; 3D 0F 22 | Logical AND with accumulator (absolute,X)
    CMP $224C            ; CD 4C 22 | Compare accumulator (absolute)
    LDA $0022,Y          ; B9 22 00 | Load from absolute,Y into accumulator
    CMP $226B            ; CD 6B 22 | Compare accumulator (absolute)
    CMP $EE22            ; CD 22 EE | Compare accumulator (absolute)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $B93A            ; 4C 3A B9 | Jump to address
    BVS $0F              ; 70 0F | Branch if overflow set

;------------------------------------------------------------------------------
; Bank36_DmaFunction_65C
; Address: $DBB943
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_65C:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B956            ; 4C 56 B9 | Jump to address
    ADC ($0F),Y          ; 71 0F | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_661
; Address: $DBB95F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_661:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B972            ; 4C 72 B9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_665
; Address: $DBB97B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_665:
    JSL $CDB50E          ; 22 0E B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B98E            ; 4C 8E B9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_667
; Address: $DBB98E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_667:
    JSL $CDB51F          ; 22 1F B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B9A1            ; 4C A1 B9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_66B
; Address: $DBB9AA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_66B:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B9BD            ; 4C BD B9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_66F
; Address: $DBB9C6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_66F:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B9D9            ; 4C D9 B9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_673
; Address: $DBB9E2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_673:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B9F5            ; 4C F5 B9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_678
; Address: $DBBA02
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_678:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BA11            ; 4C 11 BA | Jump to address
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank36_DmaFunction_67A
; Address: $DBBA11
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_67A:
    JSL $CDB51F          ; 22 1F B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BA24            ; 4C 24 BA | Jump to address
    ADC $220F,Y          ; 79 0F 22 | Add with carry (absolute,Y)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $284C            ; CD 4C 28 | Compare accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_67D
; Address: $DBBA2D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_67D:
    JSL $CDB50E          ; 22 0E B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BA40            ; 4C 40 BA | Jump to address
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank36_DmaFunction_67F
; Address: $DBBA40
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_67F:
    JSL $CDB51F          ; 22 1F B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BA53            ; 4C 53 BA | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_683
; Address: $DBBA5C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_683:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BA6F            ; 4C 6F BA | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_687
; Address: $DBBA78
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_687:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BA8B            ; 4C 8B BA | Jump to address
    ADC $220F,X          ; 7D 0F 22 | Add with carry (absolute,X)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $8F4C            ; CD 4C 8F | Compare accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_68A
; Address: $DBBA94
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_68A:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BAA7            ; 4C A7 BA | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_68B
; Address: $DBBA9E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_68B:
    ROR $220F,X          ; 7E 0F 22 | Rotate right (absolute,X)
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $AB4C            ; CD 4C AB | Compare accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_68E
; Address: $DBBAB0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_68E:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BAC3            ; 4C C3 BA | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_692
; Address: $DBBACC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_692:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BADF            ; 4C DF BA | Jump to address
    BRA $0F              ; 80 0F | Branch always

;------------------------------------------------------------------------------
; Bank36_DmaFunction_696
; Address: $DBBAE8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_696:
    JSL $CDB50E          ; 22 0E B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BAFB            ; 4C FB BA | Jump to address
    STA ($0F,X)          ; 81 0F | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_698
; Address: $DBBAFB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_698:
    JSL $CDB51F          ; 22 1F B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BB0E            ; 4C 0E BB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_69C
; Address: $DBBB17
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_69C:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BB2A            ; 4C 2A BB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6A0
; Address: $DBBB33
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6A0:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BB46            ; 4C 46 BB | Jump to address
    STY $0F              ; 84 0F | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6A4
; Address: $DBBB4F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6A4:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BB62            ; 4C 62 BB | Jump to address
    STA $0F              ; 85 0F | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6A8
; Address: $DBBB6B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6A8:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BB7E            ; 4C 7E BB | Jump to address
    STX $0F              ; 86 0F | Store X register to zero page

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6AC
; Address: $DBBB87
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6AC:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BB9A            ; 4C 9A BB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6B0
; Address: $DBBBA3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6B0:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BBB6            ; 4C B6 BB | Jump to address
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6B4
; Address: $DBBBBF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6B4:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BBD2            ; 4C D2 BB | Jump to address
    AND $220F,X          ; 3D 0F 22 | Logical AND with accumulator (absolute,X)
    CMP $D64C            ; CD 4C D6 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6BC
; Address: $DBBBF7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6BC:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BC0A            ; 4C 0A BC | Jump to address
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6C0
; Address: $DBBC13
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6C0:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BC26            ; 4C 26 BC | Jump to address
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6C4
; Address: $DBBC2F
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6C4:
    JSL $CDB50E          ; 22 0E B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BC42            ; 4C 42 BC | Jump to address
    STY $220F            ; 8C 0F 22 | Store Y register to absolute address
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $594C            ; CD 4C 59 | Compare accumulator (absolute)
    LDY $1F22,X          ; BC 22 1F | Load from absolute,X into Y register
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $BC55            ; 4C 55 BC | Jump to address
    STA $220F            ; 8D 0F 22 | Store accumulator to absolute address
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $594C            ; CD 4C 59 | Compare accumulator (absolute)
    LDY $CE22,X          ; BC 22 CE | Load from absolute,X into Y register
    CMP $226B            ; CD 6B 22 | Compare accumulator (absolute)
    CMP $EE22            ; CD 22 EE | Compare accumulator (absolute)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $BC71            ; 4C 71 BC | Jump to address
    STX $220F            ; 8E 0F 22 | Store X register to absolute address
    BCS $B4              ; B0 B4 | Branch if carry set
    CMP $754C            ; CD 4C 75 | Compare accumulator (absolute)
    LDY $CE22,X          ; BC 22 CE | Load from absolute,X into Y register
    CMP $226B            ; CD 6B 22 | Compare accumulator (absolute)
    CMP $EE22            ; CD 22 EE | Compare accumulator (absolute)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $BC8D            ; 4C 8D BC | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6C5
; Address: $DBBC84
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6C5:
    STA $B0220F          ; 8F 0F 22 B0 | Store accumulator to absolute long address
    CMP $914C            ; CD 4C 91 | Compare accumulator (absolute)
    LDY $CE22,X          ; BC 22 CE | Load from absolute,X into Y register
    CMP $226B            ; CD 6B 22 | Compare accumulator (absolute)
    CMP $EE22            ; CD 22 EE | Compare accumulator (absolute)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $BCA9            ; 4C A9 BC | Jump to address
    BCC $0F              ; 90 0F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6C9
; Address: $DBBCB2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6C9:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BCC5            ; 4C C5 BC | Jump to address
    STA ($0F),Y          ; 91 0F | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6CD
; Address: $DBBCCE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6CD:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BCE1            ; 4C E1 BC | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6D1
; Address: $DBBCEA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6D1:
    JSL $CDB4EE          ; 22 EE B4 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BCFD            ; 4C FD BC | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6D5
; Address: $DBBD06
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6D5:
    JSL $CDB50E          ; 22 0E B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BD19            ; 4C 19 BD | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6D7
; Address: $DBBD19
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6D7:
    JSL $CDB51F          ; 22 1F B5 CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BD2C            ; 4C 2C BD | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6DA
; Address: $DBBD31
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6DA:
    LDA $C149            ; AD 49 C1 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $BD40            ; 4C 40 BD | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6DD
; Address: $DBBD44
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6DD:
    JSL $C687A0          ; 22 A0 87 C6 | Jump to subroutine long
    JMP $BD72            ; 4C 72 BD | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA #$19             ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6E3
; Address: $DBBD6B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6E3:
    JSL $C67A85          ; 22 85 7A C6 | Jump to subroutine long
    JMP $BD85            ; 4C 85 BD | Jump to address
    LDA $C149            ; AD 49 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BD4B            ; 4C 4B BD | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BD6B            ; 4C 6B BD | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6E4
; Address: $DBBD86
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6E4:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BD9B            ; 4C 9B BD | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6E5
; Address: $DBBD94
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6E5:
    JSL $C687A0          ; 22 A0 87 C6 | Jump to subroutine long
    JMP $BDA2            ; 4C A2 BD | Jump to address
    LDA #$0F             ; A9 0F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6E6
; Address: $DBBD9E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6E6:
    JSL $C687A0          ; 22 A0 87 C6 | Jump to subroutine long
    JMP $BDBF            ; 4C BF BD | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    WDM #$35             ; 42 35 | Reserved instruction

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6E8
; Address: $DBBDB8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6E8:
    JSL $C67A85          ; 22 85 7A C6 | Jump to subroutine long
    JMP $BDD2            ; 4C D2 BD | Jump to address
    LDA $C149            ; AD 49 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BDA5            ; 4C A5 BD | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6E9
; Address: $DBBDCA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6E9:
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BDB8            ; 4C B8 BD | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6EB
; Address: $DBBDD6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6EB:
    JSL $C687A0          ; 22 A0 87 C6 | Jump to subroutine long
    JMP $BE04            ; 4C 04 BE | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA #$19             ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6F1
; Address: $DBBDFD
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6F1:
    JSL $C67A85          ; 22 85 7A C6 | Jump to subroutine long
    JMP $BE17            ; 4C 17 BE | Jump to address
    LDA $C149            ; AD 49 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BDDD            ; 4C DD BD | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BDFD            ; 4C FD BD | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6F6
; Address: $DBBE2E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6F6:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA #$54             ; A9 54 | Load immediate value into accumulator
    LDY #$54             ; A0 54 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6F7
; Address: $DBBE35
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6F7:
    JSL $C3C4FC          ; 22 FC C4 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $BE4B            ; 4C 4B BE | Jump to address
    BMI $0A              ; 30 0A | Branch if negative

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6FA
; Address: $DBBE52
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6FA:
    JSL $CDBE27          ; 22 27 BE CD | Jump to subroutine long
    LDA #$54             ; A9 54 | Load immediate value into accumulator
    LDY #$54             ; A0 54 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6FB
; Address: $DBBE5C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6FB:
    JSL $C3C5EC          ; 22 EC C5 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $BE72            ; 4C 72 BE | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_6FE
; Address: $DBBE7C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_6FE:
    JSL $C3C51D          ; 22 1D C5 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $BE92            ; 4C 92 BE | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_700
; Address: $DBBE94
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_700:
    JSL $1D220A          ; 22 0A 22 1D | Jump to subroutine long
    LDX $A9CD,Y          ; BE CD A9 | Load from absolute,Y into X register
    LDY #$55             ; A0 55 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_701
; Address: $DBBEA0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_701:
    JSL $C3C61B          ; 22 1B C6 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $BEC5            ; 4C C5 BE | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_702
; Address: $DBBEAF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_702:
    JSL $CC8C76          ; 22 76 8C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BEBE            ; 4C BE BE | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $BEC1            ; 4C C1 BE | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_704
; Address: $DBBEC6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_704:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BED7            ; 4C D7 BE | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    PHX                  ; DA | Push X register to stack
    LDX $5400,Y          ; BE 00 54 | Load from absolute,Y into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    LDY #$56             ; A0 56 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_705
; Address: $DBBEE0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_705:
    JSL $C3C4FC          ; 22 FC C4 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $BEF6            ; 4C F6 BE | Jump to address
    BMI $0A              ; 30 0A | Branch if negative

;------------------------------------------------------------------------------
; Bank36_DmaFunction_708
; Address: $DBBEFD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_708:
    JSL $CDBE27          ; 22 27 BE CD | Jump to subroutine long
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    LDY #$56             ; A0 56 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_709
; Address: $DBBF07
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_709:
    JSL $C3C5EC          ; 22 EC C5 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $BF30            ; 4C 30 BF | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_70A
; Address: $DBBF16
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_70A:
    JSL $CC8C76          ; 22 76 8C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BF29            ; 4C 29 BF | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_70B
; Address: $DBBF22
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_70B:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    JMP $BF30            ; 4C 30 BF | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_70D
; Address: $DBBF31
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_70D:
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BF4C            ; 4C 4C BF | Jump to address
    LDA ($05,X)          ; A1 05 | Load from (zero page,X) into accumulator
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    LDY #$56             ; A0 56 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_70E
; Address: $DBBF45
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_70E:
    JSL $C3C55F          ; 22 5F C5 C3 | Jump to subroutine long
    JMP $BF74            ; 4C 74 BF | Jump to address
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BF67            ; 4C 67 BF | Jump to address
    STY $A905            ; 8C 05 A9 | Store Y register to absolute address
    LDY #$55             ; A0 55 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_70F
; Address: $DBBF60
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_70F:
    JSL $C3C55F          ; 22 5F C5 C3 | Jump to subroutine long
    JMP $BF74            ; 4C 74 BF | Jump to address
    STY $A905            ; 8C 05 A9 | Store Y register to absolute address
    LDY #$57             ; A0 57 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_716
; Address: $DBBF8F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_716:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $BFB3            ; 4C B3 BF | Jump to address
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_717
; Address: $DBBF9D
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_717:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $BFAC            ; 4C AC BF | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $BFAF            ; 4C AF BF | Jump to address
    JMP $D2220A          ; 5C 0A 22 D2 | Jump to address long
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register
    EOR $220A,Y          ; 59 0A 22 | Exclusive OR with accumulator (absolute,Y)
    ADC $CDBF,X          ; 7D BF CD | Add with carry (absolute,X)
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $BFCD            ; 4C CD BF | Jump to address
    ADC ($0A,X)          ; 61 0A | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_71A
; Address: $DBBFD1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_71A:
    JSL $CDBF7D          ; 22 7D BF CD | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $BFE7            ; 4C E7 BF | Jump to address
    ADC ($0A,X)          ; 61 0A | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_71D
; Address: $DBBFEE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_71D:
    JSL $CDBE18          ; 22 18 BE CD | Jump to subroutine long
    LDA #$58             ; A9 58 | Load immediate value into accumulator
    LDY #$58             ; A0 58 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_71E
; Address: $DBBFF8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_71E:
    JSL $C3C58E          ; 22 8E C5 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $C00E            ; 4C 0E C0 | Jump to address
    BIT $0A              ; 24 0A | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_720
; Address: $DBC010
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_720:
    STZ $0A              ; 64 0A | Store zero to zero page
    LDA #$59             ; A9 59 | Load immediate value into accumulator
    LDY #$59             ; A0 59 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_722
; Address: $DBC01F
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_722:
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $C050            ; 4C 50 C0 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C038            ; 4C 38 C0 | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $C04C            ; 4C 4C C0 | Jump to address
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C049            ; 4C 49 C0 | Jump to address
    ROR $0A              ; 66 0A | Rotate right (zero page)
    JMP $C04C            ; 4C 4C C0 | Jump to address
    ADC $0A              ; 65 0A | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_725
; Address: $DBC057
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_725:
    JSL $CDBE18          ; 22 18 BE CD | Jump to subroutine long
    LDA #$59             ; A9 59 | Load immediate value into accumulator
    LDY #$59             ; A0 59 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_726
; Address: $DBC061
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_726:
    JSL $C3C58E          ; 22 8E C5 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $C077            ; 4C 77 C0 | Jump to address
    BIT $0A              ; 24 0A | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_728
; Address: $DBC079
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_728:
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA $3550            ; AD 50 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $C08F            ; 4C 8F C0 | Jump to address
    AND $A90A,Y          ; 39 0A A9 | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $35              ; 50 35 | Branch if overflow clear
    LDA #$5A             ; A9 5A | Load immediate value into accumulator
    LDY #$5A             ; A0 5A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_729
; Address: $DBC095
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_729:
    JSL $C3C4DB          ; 22 DB C4 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $C0AB            ; 4C AB C0 | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_72C
; Address: $DBC0B2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_72C:
    JSL $CDBE22          ; 22 22 BE CD | Jump to subroutine long
    LDA #$5A             ; A9 5A | Load immediate value into accumulator
    LDY #$5A             ; A0 5A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_72D
; Address: $DBC0BC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_72D:
    JSL $C3C5BD          ; 22 BD C5 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $C0D2            ; 4C D2 C0 | Jump to address
    PHA                  ; 48 | Push accumulator to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_72F
; Address: $DBC0D4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_72F:
    PLA                  ; 68 | Pull accumulator from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA #$5B             ; A9 5B | Load immediate value into accumulator
    LDY #$5B             ; A0 5B | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_730
; Address: $DBC0DC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_730:
    JSL $C3C4FC          ; 22 FC C4 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $C0F2            ; 4C F2 C0 | Jump to address
    BMI $0A              ; 30 0A | Branch if negative

;------------------------------------------------------------------------------
; Bank36_DmaFunction_733
; Address: $DBC0F9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_733:
    JSL $CDBE27          ; 22 27 BE CD | Jump to subroutine long
    LDA #$5B             ; A9 5B | Load immediate value into accumulator
    LDY #$5B             ; A0 5B | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_734
; Address: $DBC103
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_734:
    JSL $C3C5EC          ; 22 EC C5 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $C119            ; 4C 19 C1 | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_736
; Address: $DBC11A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_736:
    LDA $3552            ; AD 52 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C12B            ; 4C 2B C1 | Jump to address
    ROR $4C0A            ; 6E 0A 4C | Rotate right (absolute)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ADC $A90A            ; 6D 0A A9 | Add with carry (absolute)
    BPL $00              ; 10 00 | Branch if positive
    LDA #$5D             ; A9 5D | Load immediate value into accumulator
    LDY #$5D             ; A0 5D | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_738
; Address: $DBC13E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_738:
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $C150            ; 4C 50 C1 | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_73B
; Address: $DBC157
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_73B:
    JSL $CDBE18          ; 22 18 BE CD | Jump to subroutine long
    LDA #$5D             ; A9 5D | Load immediate value into accumulator
    LDY #$5D             ; A0 5D | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_73C
; Address: $DBC161
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_73C:
    JSL $C3C58E          ; 22 8E C5 C3 | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $C177            ; 4C 77 C1 | Jump to address
    BIT $0A              ; 24 0A | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_79F
; Address: $DBC2FA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_79F:
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C30F            ; 4C 0F C3 | Jump to address
    LDA #$23             ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7A1
; Address: $DBC30F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7A1:
    JSL $CC8960          ; 22 60 89 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $C322            ; 4C 22 C3 | Jump to address
    LDA #$24             ; A9 24 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7A2
; Address: $DBC31B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7A2:
    JSL $C3C77C          ; 22 7C C7 C3 | Jump to subroutine long
    JMP $C33A            ; 4C 3A C3 | Jump to address
    LDA #$23             ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7A3
; Address: $DBC325
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7A3:
    JSL $C3C77C          ; 22 7C C7 C3 | Jump to subroutine long
    LDA $354D            ; AD 4D 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C33A            ; 4C 3A C3 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7B4
; Address: $DBC37F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7B4:
    JSL $C79973          ; 22 73 99 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $C38C            ; 4C 8C C3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7B9
; Address: $DBC39C
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7B9:
    JMP $C3B7            ; 4C B7 C3 | Jump to address
    CPY $0E              ; C4 0E | Compare Y register (zero page)
    JMP $C3DA            ; 4C DA C3 | Jump to address
    CPY $0E              ; C4 0E | Compare Y register (zero page)
    JMP $C3DA            ; 4C DA C3 | Jump to address
    CPY $0E              ; C4 0E | Compare Y register (zero page)
    JMP $C3DA            ; 4C DA C3 | Jump to address
    INY                  ; C8 | Increment Y register
    ASL $DA4C            ; 0E 4C DA | Arithmetic shift left (absolute)
    LDA $C1FD            ; AD FD C1 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C39F            ; 4C 9F C3 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C3A5            ; 4C A5 C3 | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C3AB            ; 4C AB C3 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C3B1            ; 4C B1 C3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7BC
; Address: $DBC3E5
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7BC:
    JMP $C41D            ; 4C 1D C4 | Jump to address
    DEC $0E              ; C6 0E | Decrement (zero page)
    JMP $C41D            ; 4C 1D C4 | Jump to address
    ASL $1D4C            ; 0E 4C 1D | Arithmetic shift left (absolute)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CPY $0E              ; C4 0E | Compare Y register (zero page)
    JMP $C41D            ; 4C 1D C4 | Jump to address
    LDA $3454            ; AD 54 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C3E2            ; 4C E2 C3 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C3E8            ; 4C E8 C3 | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C3EE            ; 4C EE C3 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C3F4            ; 4C F4 C3 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7BE
; Address: $DBC422
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7BE:
    LDA $360A            ; AD 0A 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C44B            ; 4C 4B C4 | Jump to address
    LDA #$13             ; A9 13 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7BF
; Address: $DBC430
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7BF:
    JSL $C74B8C          ; 22 8C 4B C7 | Jump to subroutine long
    LDA $360A            ; AD 0A 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7C0
; Address: $DBC43A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7C0:
    JSL $C7707A          ; 22 7A 70 C7 | Jump to subroutine long
    LDA $C18D            ; AD 8D C1 | Load from absolute address into accumulator
    STA $3448            ; 8D 48 34 | Store accumulator to absolute address
    LDA $C18D            ; AD 8D C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7C1
; Address: $DBC447
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7C1:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA $360C            ; AD 0C 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C474            ; 4C 74 C4 | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7C2
; Address: $DBC459
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7C2:
    JSL $C74B8C          ; 22 8C 4B C7 | Jump to subroutine long
    LDA $360C            ; AD 0C 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7C3
; Address: $DBC463
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7C3:
    JSL $C7707A          ; 22 7A 70 C7 | Jump to subroutine long
    LDA $C18D            ; AD 8D C1 | Load from absolute address into accumulator
    STA $344A            ; 8D 4A 34 | Store accumulator to absolute address
    LDA $C18D            ; AD 8D C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7C4
; Address: $DBC470
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7C4:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA $360E            ; AD 0E 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7C5
; Address: $DBC47A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7C5:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C49D            ; 4C 9D C4 | Jump to address
    LDA #$11             ; A9 11 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7C6
; Address: $DBC482
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7C6:
    JSL $C74B8C          ; 22 8C 4B C7 | Jump to subroutine long
    LDA $360E            ; AD 0E 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7C7
; Address: $DBC48C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7C7:
    JSL $C7707A          ; 22 7A 70 C7 | Jump to subroutine long
    LDA $C18D            ; AD 8D C1 | Load from absolute address into accumulator
    STA $344C            ; 8D 4C 34 | Store accumulator to absolute address
    LDA $C18D            ; AD 8D C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7CD
; Address: $DBC4AB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7CD:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7D4
; Address: $DBC4CB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7D4:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDA $C74A            ; AD 4A C7 | Load from absolute address into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7F5
; Address: $DBC584
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7F5:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7F8
; Address: $DBC596
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7F8:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C59F            ; 4C 9F C5 | Jump to address
    JMP $C592            ; 4C 92 C5 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_7F9
; Address: $DBC5A1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_7F9:
    JSL $C74ABA          ; 22 BA 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C5AE            ; 4C AE C5 | Jump to address
    JMP $C5A1            ; 4C A1 C5 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_82E
; Address: $DBC691
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_82E:
    JSL $C01F08          ; 22 08 1F C0 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_833
; Address: $DBC6B1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_833:
    JSL $C01F08          ; 22 08 1F C0 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_838
; Address: $DBC6CB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_838:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_83B
; Address: $DBC6DF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_83B:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C6EC            ; 4C EC C6 | Jump to address
    JMP $C6D9            ; 4C D9 C6 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_83D
; Address: $DBC6F3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_83D:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C700            ; 4C 00 C7 | Jump to address
    JMP $C6ED            ; 4C ED C6 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_83F
; Address: $DBC707
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_83F:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C714            ; 4C 14 C7 | Jump to address
    JMP $C701            ; 4C 01 C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_841
; Address: $DBC71B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_841:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C728            ; 4C 28 C7 | Jump to address
    JMP $C715            ; 4C 15 C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_843
; Address: $DBC72F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_843:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C73C            ; 4C 3C C7 | Jump to address
    JMP $C729            ; 4C 29 C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_845
; Address: $DBC743
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_845:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C750            ; 4C 50 C7 | Jump to address
    JMP $C73D            ; 4C 3D C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_847
; Address: $DBC757
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_847:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C764            ; 4C 64 C7 | Jump to address
    JMP $C751            ; 4C 51 C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_849
; Address: $DBC76B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_849:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C778            ; 4C 78 C7 | Jump to address
    JMP $C765            ; 4C 65 C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_84B
; Address: $DBC77F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_84B:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C78C            ; 4C 8C C7 | Jump to address
    JMP $C779            ; 4C 79 C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_84D
; Address: $DBC793
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_84D:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C7A0            ; 4C A0 C7 | Jump to address
    JMP $C78D            ; 4C 8D C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_84F
; Address: $DBC7A7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_84F:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C7B4            ; 4C B4 C7 | Jump to address
    JMP $C7A1            ; 4C A1 C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_851
; Address: $DBC7BB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_851:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C7C8            ; 4C C8 C7 | Jump to address
    JMP $C7B5            ; 4C B5 C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_853
; Address: $DBC7CF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_853:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C7DC            ; 4C DC C7 | Jump to address
    JMP $C7C9            ; 4C C9 C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_856
; Address: $DBC7E7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_856:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C7F0            ; 4C F0 C7 | Jump to address
    JMP $C7DD            ; 4C DD C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_858
; Address: $DBC7F7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_858:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C804            ; 4C 04 C8 | Jump to address
    JMP $C7F1            ; 4C F1 C7 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_859
; Address: $DBC805
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_859:
    LDA #$A1             ; A9 A1 | Load immediate value into accumulator
    LDA $7FFFA2          ; AF A2 FF 7F | Load from absolute long address into accumulator
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_85C
; Address: $DBC819
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_85C:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C826            ; 4C 26 C8 | Jump to address
    JMP $C813            ; 4C 13 C8 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_85E
; Address: $DBC82D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_85E:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C83A            ; 4C 3A C8 | Jump to address
    JMP $C827            ; 4C 27 C8 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_860
; Address: $DBC841
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_860:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C84E            ; 4C 4E C8 | Jump to address
    JMP $C83B            ; 4C 3B C8 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_862
; Address: $DBC855
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_862:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C862            ; 4C 62 C8 | Jump to address
    JMP $C84F            ; 4C 4F C8 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_863
; Address: $DBC863
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_863:
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    LDX #$FF             ; A2 FF | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_868
; Address: $DBC87F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_868:
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_86A
; Address: $DBC88D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_86A:
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_86C
; Address: $DBC89B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_86C:
    LDA #$E1             ; A9 E1 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_86E
; Address: $DBC8A9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_86E:
    LDA #$E1             ; A9 E1 | Load immediate value into accumulator
    LDX #$FF             ; A2 FF | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_870
; Address: $DBC8B7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_870:
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$B5             ; A2 B5 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_872
; Address: $DBC8C5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_872:
    JSL $CDC682          ; 22 82 C6 CD | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$8C             ; A2 8C | Load immediate value into X register
    AND ($A0),Y          ; 31 A0 | Logical AND with accumulator ((zero page),Y)
    INC $2283,X          ; FE 83 22 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_876
; Address: $DBC8E2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_876:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C936            ; 4C 36 C9 | Jump to address
    LDA #$A8             ; A9 A8 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_877
; Address: $DBC8F5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_877:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$B5             ; A2 B5 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_879
; Address: $DBC907
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_879:
    JSL $C74A04          ; 22 04 4A C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_87E
; Address: $DBC92A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_87E:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_87F
; Address: $DBC938
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_87F:
    JSL $C74A04          ; 22 04 4A C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_880
; Address: $DBC945
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_880:
    JSL $C01FEE          ; 22 EE 1F C0 | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$8C             ; A2 8C | Load immediate value into X register
    AND ($A0,X)          ; 21 A0 | Logical AND with accumulator ((zero page,X))
    INC $2283,X          ; FE 83 22 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    AND ($C0,X)          ; 21 C0 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_887
; Address: $DBC97C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_887:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C985            ; 4C 85 C9 | Jump to address
    JMP $C975            ; 4C 75 C9 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_888
; Address: $DBC985
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_888:
    JSL $C04835          ; 22 35 48 C0 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $C995            ; 4C 95 C9 | Jump to address
    JMP $C985            ; 4C 85 C9 | Jump to address
    LDA #$6C             ; A9 6C | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$B5             ; A2 B5 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_88C
; Address: $DBC9AE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_88C:
    JSL $CDC682          ; 22 82 C6 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_890
; Address: $DBC9C6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_890:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$B5             ; A2 B5 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_893
; Address: $DBC9D8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_893:
    JSL $C74A42          ; 22 42 4A C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_895
; Address: $DBC9E8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_895:
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$B5             ; A2 B5 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_897
; Address: $DBC9F6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_897:
    JSL $CDC682          ; 22 82 C6 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA #$21             ; A9 21 | PPU graphics register access
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_898
; Address: $DBCA07
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_898:
    JSL $C74A57          ; 22 57 4A C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $CA14            ; 4C 14 CA | Jump to address
    JMP $CA01            ; 4C 01 CA | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_89B
; Address: $DBCA1D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_89B:
    JSL $CB9852          ; 22 52 98 CB | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$4A             ; A2 4A | Load immediate value into X register
    AND #$A0             ; 29 A0 | Logical AND with accumulator (immediate)
    INC $2283,X          ; FE 83 22 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8A8
; Address: $DBCA64
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8A8:
    JSL $CDC584          ; 22 84 C5 CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8A9
; Address: $DBCA6E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8A9:
    JSL $C02EC7          ; 22 C7 2E C0 | Jump to subroutine long
    LDA                  ; BF 01 01 A9 | Load from absolute long,X into accumulator
    AND ($7F,X)          ; 21 7F | Logical AND with accumulator ((zero page,X))
    LDX #$08             ; A2 08 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8AA
; Address: $DBCA7E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8AA:
    JSL $C02140          ; 22 40 21 C0 | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8B0
; Address: $DBCAA6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8B0:
    JSL $C74A4A          ; 22 4A 4A C7 | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$08             ; A2 08 | Load immediate value into X register
    ORA $FEA0,Y          ; 19 A0 FE | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8B4
; Address: $DBCAC2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8B4:
    JSL $C74A04          ; 22 04 4A C7 | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$08             ; A2 08 | Load immediate value into X register
    ORA $FEA0,Y          ; 19 A0 FE | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8B5
; Address: $DBCACF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8B5:
    JSL $C02140          ; 22 40 21 C0 | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    LDX #$42             ; A2 42 | Hardware register operation
    BPL $A0              ; 10 A0 | Branch if positive

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8B7
; Address: $DBCADE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8B7:
    JSR $22C0            ; 20 C0 22 | Jump to subroutine
    DEC $CD              ; C6 CD | Decrement (zero page)
    LDA #$30             ; A9 30 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8BD
; Address: $DBCB06
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8BD:
    JSL $C04835          ; 22 35 48 C0 | Jump to subroutine long
    CMP $F630,Y          ; D9 30 F6 | Compare accumulator (absolute,Y)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $CB16            ; 4C 16 CB | Jump to address
    JMP $CB06            ; 4C 06 CB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8BE
; Address: $DBCB16
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8BE:
    JSL $C04835          ; 22 35 48 C0 | Jump to subroutine long
    STA ($31,X)          ; 81 31 | Store accumulator to (zero page,X)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $CB26            ; 4C 26 CB | Jump to address
    JMP $CB16            ; 4C 16 CB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8BF
; Address: $DBCB26
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8BF:
    JSL $C04835          ; 22 35 48 C0 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $CB36            ; 4C 36 CB | Jump to address
    JMP $CB26            ; 4C 26 CB | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8C3
; Address: $DBCB4A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8C3:
    JSL $C047B2          ; 22 B2 47 C0 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8C4
; Address: $DBCB52
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8C4:
    JSL $C04835          ; 22 35 48 C0 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $CB62            ; 4C 62 CB | Jump to address
    JMP $CB52            ; 4C 52 CB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8C5
; Address: $DBCB62
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8C5:
    JSL $C04835          ; 22 35 48 C0 | Jump to subroutine long
    ASL $F634            ; 0E 34 F6 | Arithmetic shift left (absolute)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $CB72            ; 4C 72 CB | Jump to address
    JMP $CB62            ; 4C 62 CB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8C6
; Address: $DBCB72
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8C6:
    JSL $C04835          ; 22 35 48 C0 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $CB82            ; 4C 82 CB | Jump to address
    JMP $CB72            ; 4C 72 CB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8CC
; Address: $DBCB95
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8CC:
    JSL $CC7A06          ; 22 06 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $CBAC            ; 4C AC CB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8CF
; Address: $DBCBAD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8CF:
    JSL $CC7A06          ; 22 06 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $CBD6            ; 4C D6 CB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8D1
; Address: $DBCBBD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8D1:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $CBC6            ; 4C C6 CB | Jump to address
    JMP $CBB6            ; 4C B6 CB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8D2
; Address: $DBCBC6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8D2:
    JSL $C04835          ; 22 35 48 C0 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $CBD6            ; 4C D6 CB | Jump to address
    JMP $CBC6            ; 4C C6 CB | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8D3
; Address: $DBCBD7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8D3:
    JSL $CC7A06          ; 22 06 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $CBE8            ; 4C E8 CB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8D6
; Address: $DBCBE9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8D6:
    JSL $CC7A06          ; 22 06 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $CBF9            ; 4C F9 CB | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8D9
; Address: $DBCBFA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8D9:
    JSL $CC7A06          ; 22 06 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $CC13            ; 4C 13 CC | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8DB
; Address: $DBCC0A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8DB:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $CC13            ; 4C 13 CC | Jump to address
    JMP $CC03            ; 4C 03 CC | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8E2
; Address: $DBCC31
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8E2:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $CC3A            ; 4C 3A CC | Jump to address
    JMP $CC2A            ; 4C 2A CC | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8E4
; Address: $DBCC40
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8E4:
    LDA $354D            ; AD 4D 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CC4E            ; 4C 4E CC | Jump to address
    JMP $CCB3            ; 4C B3 CC | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8E5
; Address: $DBCC4E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8E5:
    JSL $CC9C76          ; 22 76 9C CC | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    EOR $A935            ; 4D 35 A9 | Exclusive OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    EOR $2235            ; 4D 35 22 | Exclusive OR with accumulator (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP ($B2,X)          ; C1 B2 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8E6
; Address: $DBCC64
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8E6:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $CC7E            ; 4C 7E CC | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8E7
; Address: $DBCC6D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8E7:
    JSL $CDACE0          ; 22 E0 AC CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LSR $2235            ; 4E 35 22 | Logical shift right (absolute)
    BIT $CC9F            ; 2C 9F CC | Test bits in accumulator (absolute)
    JMP $CCAC            ; 4C AC CC | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    EOR $2235            ; 4D 35 22 | Exclusive OR with accumulator (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP ($B3,X)          ; C1 B3 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8E8
; Address: $DBCC8A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8E8:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $CC9E            ; 4C 9E CC | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8EF
; Address: $DBCCB4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8EF:
    LDA $3540            ; AD 40 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CCC2            ; 4C C2 CC | Jump to address
    JMP $CCD7            ; 4C D7 CC | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8F3
; Address: $DBCCD8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8F3:
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CCE6            ; 4C E6 CC | Jump to address
    JMP $CCEE            ; 4C EE CC | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8F6
; Address: $DBCCEF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8F6:
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CCFD            ; 4C FD CC | Jump to address
    JMP $CD0F            ; 4C 0F CD | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8FA
; Address: $DBCD10
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8FA:
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CD1E            ; 4C 1E CD | Jump to address
    JMP $CD46            ; 4C 46 CD | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8FB
; Address: $DBCD1E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8FB:
    JSL $CDCCEF          ; 22 EF CC CD | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    LDA #$20             ; A9 20 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_8FF
; Address: $DBCD47
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_8FF:
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CD55            ; 4C 55 CD | Jump to address
    JMP $CD9D            ; 4C 9D CD | Jump to address
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_900
; Address: $DBCD58
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_900:
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $CD8C            ; 4C 8C CD | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_902
; Address: $DBCD66
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_902:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $CD76            ; 4C 76 CD | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_908
; Address: $DBCD8C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_908:
    JSL $CC9FA3          ; 22 A3 9F CC | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    LDA #$05             ; A9 05 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_90A
; Address: $DBCD9E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_90A:
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CDAC            ; 4C AC CD | Jump to address
    JMP $CDB8            ; 4C B8 CD | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_90E
; Address: $DBCDB9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_90E:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CDC7            ; 4C C7 CD | Jump to address
    JMP $CDDB            ; 4C DB CD | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_910
; Address: $DBCDCB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_910:
    JSL $CC9E5A          ; 22 5A 9E CC | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_911
; Address: $DBCDDC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_911:
    LDA $3540            ; AD 40 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CDEA            ; 4C EA CD | Jump to address
    JMP $CE00            ; 4C 00 CE | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_917
; Address: $DBCE01
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_917:
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CE0F            ; 4C 0F CE | Jump to address
    JMP $CE1E            ; 4C 1E CE | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_91B
; Address: $DBCE1F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_91B:
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CE2D            ; 4C 2D CE | Jump to address
    JMP $CE3B            ; 4C 3B CE | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_91E
; Address: $DBCE3C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_91E:
    LDA $354B            ; AD 4B 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CE4A            ; 4C 4A CE | Jump to address
    JMP $CE62            ; 4C 62 CE | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_91F
; Address: $DBCE4A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_91F:
    JSL $CDCE1F          ; 22 1F CE CD | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDA #$09             ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_922
; Address: $DBCE63
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_922:
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CE71            ; 4C 71 CE | Jump to address
    JMP $CE9C            ; 4C 9C CE | Jump to address
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $CE80            ; 4C 80 CE | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_924
; Address: $DBCE80
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_924:
    JSL $CDCE3C          ; 22 3C CE CD | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_925
; Address: $DBCE9D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_925:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CEAB            ; 4C AB CE | Jump to address
    JMP $CEB3            ; 4C B3 CE | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_928
; Address: $DBCEB4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_928:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CEC2            ; 4C C2 CE | Jump to address
    JMP $CEDA            ; 4C DA CE | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_92B
; Address: $DBCECA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_92B:
    JSL $CC9E70          ; 22 70 9E CC | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_92C
; Address: $DBCEDB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_92C:
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CEE9            ; 4C E9 CE | Jump to address
    JMP $CF10            ; 4C 10 CF | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_92E
; Address: $DBCEF0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_92E:
    JSL $C78D7D          ; 22 7D 8D C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    JMP $A935            ; 4C 35 A9 | Jump to address
    WDM #$35             ; 42 35 | Reserved instruction
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CMP $81              ; C5 81 | Compare accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_92F
; Address: $DBCF11
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_92F:
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CF1F            ; 4C 1F CF | Jump to address
    JMP $CF35            ; 4C 35 CF | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_930
; Address: $DBCF1F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_930:
    JSL $CDCEDB          ; 22 DB CE CD | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    JMP $A935            ; 4C 35 A9 | Jump to address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $A935            ; 4D 35 A9 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_931
; Address: $DBCF30
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_931:
    JSR $0C00            ; 20 00 0C | Jump to subroutine
    JMP $6B35            ; 4C 35 6B | Jump to address
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_932
; Address: $DBCF3C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_932:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CF44            ; 4C 44 CF | Jump to address
    JMP $CF61            ; 4C 61 CF | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_938
; Address: $DBCF62
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_938:
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CF70            ; 4C 70 CF | Jump to address
    JMP $CF78            ; 4C 78 CF | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_93B
; Address: $DBCF79
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_93B:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CF87            ; 4C 87 CF | Jump to address
    JMP $CF96            ; 4C 96 CF | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_93F
; Address: $DBCF97
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_93F:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CFA5            ; 4C A5 CF | Jump to address
    JMP $CFB3            ; 4C B3 CF | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_941
; Address: $DBCFA9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_941:
    JSL $CCA04D          ; 22 4D A0 CC | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_942
; Address: $DBCFB4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_942:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CFC2            ; 4C C2 CF | Jump to address
    JMP $CFDE            ; 4C DE CF | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_945
; Address: $DBCFCA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_945:
    JSL $CC9E7B          ; 22 7B 9E CC | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    LSR $35              ; 46 35 | Logical shift right (zero page)
    LDX #$97             ; A2 97 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_948
; Address: $DBCFDF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_948:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CFED            ; 4C ED CF | Jump to address
    JMP $CFF5            ; 4C F5 CF | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_94B
; Address: $DBCFF6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_94B:
    LDA $3546            ; AD 46 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D004            ; 4C 04 D0 | Jump to address
    JMP $D012            ; 4C 12 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_94D
; Address: $DBD008
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_94D:
    JSL $CC9E86          ; 22 86 9E CC | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    LSR $35              ; 46 35 | Logical shift right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_94E
; Address: $DBD013
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_94E:
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D021            ; 4C 21 D0 | Jump to address
    JMP $D029            ; 4C 29 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_951
; Address: $DBD02A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_951:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D038            ; 4C 38 D0 | Jump to address
    JMP $D046            ; 4C 46 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_953
; Address: $DBD03C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_953:
    JSL $CC9E91          ; 22 91 9E CC | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_954
; Address: $DBD047
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_954:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank36_DmaFunction_957
; Address: $DBD069
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_957:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D071            ; 4C 71 D0 | Jump to address
    JMP $D0D1            ; 4C D1 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_959
; Address: $DBD077
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_959:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D089            ; 4C 89 D0 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    JMP $D0D1            ; 4C D1 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_95B
; Address: $DBD08F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_95B:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D0A1            ; 4C A1 D0 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    JMP $D0D1            ; 4C D1 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_95D
; Address: $DBD0A7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_95D:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D0B9            ; 4C B9 D0 | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    JMP $D0D1            ; 4C D1 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_95F
; Address: $DBD0BF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_95F:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D0D1            ; 4C D1 D0 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    JMP $D0D1            ; 4C D1 D0 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_960
; Address: $DBD0D2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_960:
    LDA $3559            ; AD 59 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D0E6            ; 4C E6 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_961
; Address: $DBD0DD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_961:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    CMP $0F              ; C5 0F | Compare accumulator (zero page)
    JMP $D0F2            ; 4C F2 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_962
; Address: $DBD0E6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_962:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    DEC $0F              ; C6 0F | Decrement (zero page)
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    EOR $2235,Y          ; 59 35 22 | Exclusive OR with accumulator (absolute,Y)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $D1DE            ; 4C DE D1 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_963
; Address: $DBD0FE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_963:
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D113            ; 4C 13 D1 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_965
; Address: $DBD10C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_965:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    JMP $D232            ; 4C 32 D2 | Jump to address
    LDA $3547            ; AD 47 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D130            ; 4C 30 D1 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_967
; Address: $DBD124
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_967:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D130            ; 4C 30 D1 | Jump to address
    JMP $D22C            ; 4C 2C D2 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D14D            ; 4C 4D D1 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_969
; Address: $DBD141
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_969:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D14D            ; 4C 4D D1 | Jump to address
    JMP $D226            ; 4C 26 D2 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D16A            ; 4C 6A D1 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_96B
; Address: $DBD15E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_96B:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D16A            ; 4C 6A D1 | Jump to address
    JMP $D220            ; 4C 20 D2 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D187            ; 4C 87 D1 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_96D
; Address: $DBD17B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_96D:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D187            ; 4C 87 D1 | Jump to address
    JMP $D21A            ; 4C 1A D2 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D1A4            ; 4C A4 D1 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_96F
; Address: $DBD196
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_96F:
    CPY $220F            ; CC 0F 22 | Compare Y register (absolute)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $D1A4            ; 4C A4 D1 | Jump to address
    JMP $D208            ; 4C 08 D2 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D1C1            ; 4C C1 D1 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_970
; Address: $DBD1AF
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_970:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    CMP $220F            ; CD 0F 22 | Compare accumulator (absolute)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $D1C1            ; 4C C1 D1 | Jump to address
    JMP $D202            ; 4C 02 D2 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D1DE            ; 4C DE D1 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_971
; Address: $DBD1CC
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_971:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    DEC $220F            ; CE 0F 22 | Decrement (absolute)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $D1DE            ; 4C DE D1 | Jump to address
    JMP $D1E1            ; 4C E1 D1 | Jump to address
    JMP $D232            ; 4C 32 D2 | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $D202            ; 4C 02 D2 | Jump to address
    LDA $3604            ; AD 04 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_972
; Address: $DBD1F8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_972:
    JSL $C76FAF          ; 22 AF 6F C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA #$80             ; A9 80 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_974
; Address: $DBD233
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_974:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D241            ; 4C 41 D2 | Jump to address
    JMP $D2F6            ; 4C F6 D2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_977
; Address: $DBD24B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_977:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D2F2            ; 4C F2 D2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_979
; Address: $DBD25A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_979:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D26A            ; 4C 6A D2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_97B
; Address: $DBD26A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_97B:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    LDA $220F,Y          ; B9 0F 22 | Load from absolute,Y into accumulator
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $D280            ; 4C 80 D2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_97E
; Address: $DBD286
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_97E:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D293            ; 4C 93 D2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_981
; Address: $DBD299
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_981:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D2A6            ; 4C A6 D2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_983
; Address: $DBD2A6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_983:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    LDY $220F,X          ; BC 0F 22 | Load from absolute,X into Y register
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $D2B9            ; 4C B9 D2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_985
; Address: $DBD2B9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_985:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    LDA $220F,X          ; BD 0F 22 | Load from absolute,X into accumulator
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $D2CC            ; 4C CC D2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_988
; Address: $DBD2D3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_988:
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $D2DF            ; 4C DF D2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_98A
; Address: $DBD2DF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_98A:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    LDA                  ; BF 0F 22 66 | Load from absolute long,X into accumulator
    LDY $B0CD            ; AC CD B0 | Load from absolute address into Y register
    JMP $D2F2            ; 4C F2 D2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9A3
; Address: $DBD356
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9A3:
    JSL $CC9ED3          ; 22 D3 9E CC | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9A4
; Address: $DBD369
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9A4:
    JSL $C9062D          ; 22 2D 06 C9 | Jump to subroutine long
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9A5
; Address: $DBD37B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9A5:
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9A6
; Address: $DBD381
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9A6:
    JSL $C9062D          ; 22 2D 06 C9 | Jump to subroutine long
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9A7
; Address: $DBD399
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9A7:
    JSL $C9062D          ; 22 2D 06 C9 | Jump to subroutine long
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9A8
; Address: $DBD3B1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9A8:
    JSL $C9062D          ; 22 2D 06 C9 | Jump to subroutine long
    ROR $0001,X          ; 7E 01 00 | Rotate right (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9A9
; Address: $DBD3C9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9A9:
    JSL $C9062D          ; 22 2D 06 C9 | Jump to subroutine long
    ROR $0001,X          ; 7E 01 00 | Rotate right (absolute,X)
    BVS $00              ; 70 00 | Branch if overflow set
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9AA
; Address: $DBD3E1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9AA:
    JSL $C9062D          ; 22 2D 06 C9 | Jump to subroutine long
    ROR $0001,X          ; 7E 01 00 | Rotate right (absolute,X)
    BRA $03              ; 80 03 | Branch always
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9AB
; Address: $DBD3F1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9AB:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D3FF            ; 4C FF D3 | Jump to address
    JMP $D415            ; 4C 15 D4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9B1
; Address: $DBD416
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9B1:
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D424            ; 4C 24 D4 | Jump to address
    JMP $D432            ; 4C 32 D4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9B3
; Address: $DBD428
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9B3:
    JSL $CCA11F          ; 22 1F A1 CC | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    EOR ($35),Y          ; 51 35 | Exclusive OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9B4
; Address: $DBD433
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9B4:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D441            ; 4C 41 D4 | Jump to address
    JMP $D46C            ; 4C 6C D4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9B6
; Address: $DBD447
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9B6:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D454            ; 4C 54 D4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9B9
; Address: $DBD458
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9B9:
    JSL $CDD3F1          ; 22 F1 D3 CD | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9BB
; Address: $DBD46D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9BB:
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D47B            ; 4C 7B D4 | Jump to address
    JMP $D495            ; 4C 95 D4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9BC
; Address: $DBD47B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9BC:
    JSL $CDD433          ; 22 33 D4 CD | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    LSR $A935            ; 4E 35 A9 | Logical shift right (absolute)
    BPL $00              ; 10 00 | Branch if positive
    LSR $A935            ; 4E 35 A9 | Logical shift right (absolute)
    RTI                  ; 40 | Return from interrupt
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9BE
; Address: $DBD496
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9BE:
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D4A4            ; 4C A4 D4 | Jump to address
    JMP $D4B3            ; 4C B3 D4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9C3
; Address: $DBD4B4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9C3:
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D4C2            ; 4C C2 D4 | Jump to address
    JMP $D4D1            ; 4C D1 D4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9C7
; Address: $DBD4D2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9C7:
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D4E0            ; 4C E0 D4 | Jump to address
    JMP $D4E8            ; 4C E8 D4 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9CA
; Address: $DBD4E9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9CA:
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D4F7            ; 4C F7 D4 | Jump to address
    JMP $D509            ; 4C 09 D5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9CE
; Address: $DBD50A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9CE:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D518            ; 4C 18 D5 | Jump to address
    JMP $D53E            ; 4C 3E D5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9D7
; Address: $DBD53F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9D7:
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9DC
; Address: $DBD55D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9DC:
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D56B            ; 4C 6B D5 | Jump to address
    JMP $D57D            ; 4C 7D D5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9DE
; Address: $DBD56F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9DE:
    JSL $CC9EDE          ; 22 DE 9E CC | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    EOR $2235            ; 4D 35 22 | Exclusive OR with accumulator (absolute)
    LDA ($CC,X)          ; A1 CC | Load from (zero page,X) into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9DF
; Address: $DBD57E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9DF:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D58C            ; 4C 8C D5 | Jump to address
    JMP $D5B6            ; 4C B6 D5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9E1
; Address: $DBD590
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9E1:
    JSL $CDD4E9          ; 22 E9 D4 CD | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9E2
; Address: $DBD59A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9E2:
    JSL $CC9F16          ; 22 16 9F CC | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9E3
; Address: $DBD5B7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9E3:
    LDA $3547            ; AD 47 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D5C5            ; 4C C5 D5 | Jump to address
    JMP $D5D5            ; 4C D5 D5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9E4
; Address: $DBD5C5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9E4:
    JSL $CDD57E          ; 22 7E D5 CD | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9E5
; Address: $DBD5D6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9E5:
    LDA $3546            ; AD 46 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D5E4            ; 4C E4 D5 | Jump to address
    JMP $D5F8            ; 4C F8 D5 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9E7
; Address: $DBD5E8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9E7:
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    LSR $35              ; 46 35 | Logical shift right (zero page)
    LDX #$46             ; A2 46 | Load immediate value into X register
    LDY #$04             ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9EA
; Address: $DBD5FF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9EA:
    JSL $C783C2          ; 22 C2 83 C7 | Jump to subroutine long
    LDA #$E7             ; A9 E7 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9EB
; Address: $DBD609
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9EB:
    JSL $C783F8          ; 22 F8 83 C7 | Jump to subroutine long
    LDA #$E7             ; A9 E7 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9EC
; Address: $DBD613
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9EC:
    JSL $C78356          ; 22 56 83 C7 | Jump to subroutine long
    LDA #$E7             ; A9 E7 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9ED
; Address: $DBD61D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9ED:
    JSL $C7838C          ; 22 8C 83 C7 | Jump to subroutine long
    LDA #$E7             ; A9 E7 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9EE
; Address: $DBD627
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9EE:
    JSL $C7842E          ; 22 2E 84 C7 | Jump to subroutine long
    LDA #$E7             ; A9 E7 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9EF
; Address: $DBD631
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9EF:
    JSL $C78464          ; 22 64 84 C7 | Jump to subroutine long
    LDA #$E7             ; A9 E7 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9F0
; Address: $DBD63B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9F0:
    JSL $C7849A          ; 22 9A 84 C7 | Jump to subroutine long
    LDA #$E7             ; A9 E7 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_9F1
; Address: $DBD645
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_9F1:
    JSL $C784D0          ; 22 D0 84 C7 | Jump to subroutine long
    LDA #$E7             ; A9 E7 | Load immediate value into accumulator
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_A03
; Address: $DBD697
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_A03:
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    CMP $3422            ; CD 22 34 | Compare accumulator (absolute)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $D6B4            ; 4C B4 D6 | Jump to address
    LDA $3422            ; AD 22 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $342C            ; ED 2C 34 | Subtract with carry (absolute)
    JMP $D6C1            ; 4C C1 D6 | Jump to address
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $3422            ; ED 22 34 | Subtract with carry (absolute)
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP $3424            ; CD 24 34 | Compare accumulator (absolute)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $D6DC            ; 4C DC D6 | Jump to address
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    SBC $342E            ; ED 2E 34 | Subtract with carry (absolute)
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    SBC #$D6             ; E9 D6 | Subtract with carry (immediate)
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    SBC $3424            ; ED 24 34 | Subtract with carry (absolute)
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    JMP $D70F            ; 4C 0F D7 | Jump to address
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP $3424            ; CD 24 34 | Compare accumulator (absolute)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $D706            ; 4C 06 D7 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $342A            ; 8D 2A 34 | Store accumulator to absolute address
    JMP $D70C            ; 4C 0C D7 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $342A            ; 8D 2A 34 | Store accumulator to absolute address
    JMP $D751            ; 4C 51 D7 | Jump to address
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    BCS $03              ; B0 03 | Branch if carry set
    JMP $D737            ; 4C 37 D7 | Jump to address
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    CMP $3422            ; CD 22 34 | Compare accumulator (absolute)
    BCC $03              ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank36_DmaFunction_A04
; Address: $DBD722
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_A04:
    JMP $D72E            ; 4C 2E D7 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $342A            ; 8D 2A 34 | Store accumulator to absolute address
    JMP $D734            ; 4C 34 D7 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $342A            ; 8D 2A 34 | Store accumulator to absolute address
    JMP $D751            ; 4C 51 D7 | Jump to address
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP $3424            ; CD 24 34 | Compare accumulator (absolute)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $D74B            ; 4C 4B D7 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $342A            ; 8D 2A 34 | Store accumulator to absolute address
    JMP $D751            ; 4C 51 D7 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $342A            ; 8D 2A 34 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_A0F
; Address: $DBD782
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_A0F:
    JSL $CC7CF2          ; 22 F2 7C CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $D78E            ; 4C 8E D7 | Jump to address
    JMP $D79D            ; 4C 9D D7 | Jump to address
    LDA #$20             ; A9 20 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_A13
; Address: $DBD79E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_A13:
    JSL $CC7D65          ; 22 65 7D CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $D7AA            ; 4C AA D7 | Jump to address
    JMP $D7B9            ; 4C B9 D7 | Jump to address
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank36_DmaFunction_A18
; Address: $DBD7BA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_A18:
    JSL $CC7DB9          ; 22 B9 7D CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $D7C6            ; 4C C6 D7 | Jump to address
    JMP $D7D5            ; 4C D5 D7 | Jump to address
    LDA #$22             ; A9 22 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_A1C
; Address: $DBD7D6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_A1C:
    JSL $CC7DCE          ; 22 CE 7D CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $D7E2            ; 4C E2 D7 | Jump to address
    JMP $D7F1            ; 4C F1 D7 | Jump to address
    LDA #$23             ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_AA2
; Address: $DBDA77
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_AA2:
    JSL $C74BC2          ; 22 C2 4B C7 | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_AAC
; Address: $DBDAAE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_AAC:
    JSL $C74BC2          ; 22 C2 4B C7 | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B01
; Address: $DBDC5F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B01:
    JSL $C77104          ; 22 04 71 C7 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B03
; Address: $DBDC71
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B03:
    JSL $C77104          ; 22 04 71 C7 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B04
; Address: $DBDC7A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B04:
    JSL $C77104          ; 22 04 71 C7 | Jump to subroutine long
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B05
; Address: $DBDC83
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B05:
    JSL $C77104          ; 22 04 71 C7 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B06
; Address: $DBDC8C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B06:
    JSL $C77104          ; 22 04 71 C7 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B09
; Address: $DBDCA7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B09:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDA #$0E             ; A9 0E | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B0B
; Address: $DBDCB8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B0B:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDA #$16             ; A9 16 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B0F
; Address: $DBDCD0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B0F:
    JSL $C78356          ; 22 56 83 C7 | Jump to subroutine long
    LDA #$E7             ; A9 E7 | Load immediate value into accumulator
    LDX #$12             ; A2 12 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B12
; Address: $DBDCE4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B12:
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $DD06            ; 4C 06 DD | Jump to address
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($A9,X)          ; C1 A9 | Compare accumulator ((zero page,X))
    LDX #$13             ; A2 13 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B13
; Address: $DBDCFA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B13:
    JSL $C7838C          ; 22 8C 83 C7 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    SBC $DC              ; E5 DC | Subtract with carry (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B14
; Address: $DBDD08
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B14:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $DD39            ; 4C 39 DD | Jump to address
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($A9,X)          ; C1 A9 | Compare accumulator ((zero page,X))
    LDX #$13             ; A2 13 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B15
; Address: $DBDD23
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B15:
    JSL $C78356          ; 22 56 83 C7 | Jump to subroutine long
    LDA #$E7             ; A9 E7 | Load immediate value into accumulator
    LDX #$13             ; A2 13 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B16
; Address: $DBDD2D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B16:
    JSL $C7838C          ; 22 8C 83 C7 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ASL $68DD            ; 0E DD 68 | Arithmetic shift left (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B23
; Address: $DBDD67
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B23:
    JSL $CCD74C          ; 22 4C D7 CC | Jump to subroutine long
    LDA $3428            ; AD 28 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$08             ; 69 08 | Add with carry (immediate)
    STA $3428            ; 8D 28 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B24
; Address: $DBDD75
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B24:
    LDA $3426            ; AD 26 34 | Load from absolute address into accumulator
    STA $9680            ; 8D 80 96 | Store accumulator to absolute address
    LDA $3428            ; AD 28 34 | Load from absolute address into accumulator
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$A1             ; A2 A1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B3D
; Address: $DBDDF2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B3D:
    JSL $C76067          ; 22 67 60 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $DE02            ; 4C 02 DE | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B3E
; Address: $DBDDFB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B3E:
    JSL $C76954          ; 22 54 69 C7 | Jump to subroutine long
    JMP $DDEF            ; 4C EF DD | Jump to address
    LDA #$19             ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B45
; Address: $DBDE22
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B45:
    JSL $C76954          ; 22 54 69 C7 | Jump to subroutine long
    JMP $DE16            ; 4C 16 DE | Jump to address
    LDA #$19             ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B48
; Address: $DBDE32
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B48:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $DE3E            ; 4C 3E DE | Jump to address
    JMP $DF14            ; 4C 14 DF | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B49
; Address: $DBDE3E
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B49:
    JSL $C76FF4          ; 22 F4 6F C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3608            ; 8D 08 36 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $360A            ; 8D 0A 36 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $360C            ; 8D 0C 36 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $360E            ; 8D 0E 36 | Store accumulator to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DF14            ; 4C 14 DF | Jump to address
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    ROL $AD34,X          ; 3E 34 AD | Rotate left (absolute,X)
    ROL $3834,X          ; 3E 34 38 | Rotate left (absolute,X)
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B4A
; Address: $DBDE7A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B4A:
    JSL $CC7C86          ; 22 86 7C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DE86            ; 4C 86 DE | Jump to address
    JMP $DF0C            ; 4C 0C DF | Jump to address
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($AD,X)          ; C1 AD | Compare accumulator ((zero page,X))
    CMP ($38,X)          ; C1 38 | Compare accumulator ((zero page,X))
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    STA $C10B            ; 8D 0B C1 | Store accumulator to absolute address
    LDX #$05             ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B4B
; Address: $DBDE98
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B4B:
    JSL $C78902          ; 22 02 89 C7 | Jump to subroutine long
    LDA $C173            ; AD 73 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DF0C            ; 4C 0C DF | Jump to address
    JMP $DEE6            ; 4C E6 DE | Jump to address
    LDA $C173            ; AD 73 C1 | Load from absolute address into accumulator
    STA $3608            ; 8D 08 36 | Store accumulator to absolute address
    LDA $3608            ; AD 08 36 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B4C
; Address: $DBDEB3
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B4C:
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address
    JMP $DF08            ; 4C 08 DF | Jump to address
    LDA $C173            ; AD 73 C1 | Load from absolute address into accumulator
    STA $360A            ; 8D 0A 36 | Store accumulator to absolute address
    LDA $360A            ; AD 0A 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address
    JMP $DF08            ; 4C 08 DF | Jump to address
    LDA $C173            ; AD 73 C1 | Load from absolute address into accumulator
    STA $360C            ; 8D 0C 36 | Store accumulator to absolute address
    LDA $360C            ; AD 0C 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address
    JMP $DF08            ; 4C 08 DF | Jump to address
    LDA $C173            ; AD 73 C1 | Load from absolute address into accumulator
    STA $360E            ; 8D 0E 36 | Store accumulator to absolute address
    LDA $360E            ; AD 0E 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address
    JMP $DF08            ; 4C 08 DF | Jump to address
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DEAA            ; 4C AA DE | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DEB9            ; 4C B9 DE | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DEC8            ; 4C C8 DE | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DED7            ; 4C D7 DE | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B4D
; Address: $DBDF08
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B4D:
    JSL $C76FBA          ; 22 BA 6F C7 | Jump to subroutine long
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    DEC $6B68,X          ; DE 68 6B | Decrement (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3608            ; 8D 08 36 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $360A            ; 8D 0A 36 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $360C            ; 8D 0C 36 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $360E            ; 8D 0E 36 | Store accumulator to absolute address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DFAD            ; 4C AD DF | Jump to address
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B4F
; Address: $DBDF48
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B4F:
    JSL $C78902          ; 22 02 89 C7 | Jump to subroutine long
    LDA $C173            ; AD 73 C1 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DFA5            ; 4C A5 DF | Jump to address
    JMP $DF87            ; 4C 87 DF | Jump to address
    LDA $C173            ; AD 73 C1 | Load from absolute address into accumulator
    STA $360A            ; 8D 0A 36 | Store accumulator to absolute address
    LDA $360A            ; AD 0A 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address
    JMP $DFA1            ; 4C A1 DF | Jump to address
    LDA $C173            ; AD 73 C1 | Load from absolute address into accumulator
    STA $360C            ; 8D 0C 36 | Store accumulator to absolute address
    LDA $360C            ; AD 0C 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address
    JMP $DFA1            ; 4C A1 DF | Jump to address
    LDA $C173            ; AD 73 C1 | Load from absolute address into accumulator
    STA $360E            ; 8D 0E 36 | Store accumulator to absolute address
    LDA $360E            ; AD 0E 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address
    JMP $DFA1            ; 4C A1 DF | Jump to address
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DF5A            ; 4C 5A DF | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DF69            ; 4C 69 DF | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DF78            ; 4C 78 DF | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B50
; Address: $DBDFA1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B50:
    JSL $C76FBA          ; 22 BA 6F C7 | Jump to subroutine long
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B51
; Address: $DBDFAF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B51:
    LDA $3608            ; AD 08 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DFC4            ; 4C C4 DF | Jump to address
    LDA $3608            ; AD 08 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B52
; Address: $DBDFC0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B52:
    JSL $C76FA4          ; 22 A4 6F C7 | Jump to subroutine long
    LDA $360A            ; AD 0A 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DFD9            ; 4C D9 DF | Jump to address
    LDA $360A            ; AD 0A 36 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B54
; Address: $DBDFD5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B54:
    JSL $C76FA4          ; 22 A4 6F C7 | Jump to subroutine long
    LDA $360C            ; AD 0C 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $DFEE            ; 4C EE DF | Jump to address
    LDA $360C            ; AD 0C 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B55
; Address: $DBDFEA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B55:
    JSL $C76FA4          ; 22 A4 6F C7 | Jump to subroutine long
    LDA $360E            ; AD 0E 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $E003            ; 4C 03 E0 | Game work RAM access
    LDA $360E            ; AD 0E 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B56
; Address: $DBDFFF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B56:
    JSL $C76FA4          ; 22 A4 6F C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3608            ; 8D 08 36 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $360A            ; 8D 0A 36 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $360C            ; 8D 0C 36 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $360E            ; 8D 0E 36 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B57
; Address: $DBE01C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B57:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B59
; Address: $DBE02C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B59:
    JSL $C738CB          ; 22 CB 38 C7 | Jump to subroutine long
    LDA $C163            ; AD 63 C1 | Load from absolute address into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B5A
; Address: $DBE037
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B5A:
    JSL $CC7B6F          ; 22 6F 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $E047            ; 4C 47 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B5B
; Address: $DBE040
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B5B:
    JSL $CDE01C          ; 22 1C E0 CD | Jump to subroutine long
    JMP $E061            ; 4C 61 E0 | Game work RAM access
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $C10B            ; 8D 0B C1 | Store accumulator to absolute address
    LDX #$05             ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B5D
; Address: $DBE057
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B5D:
    JSL $C738CB          ; 22 CB 38 C7 | Jump to subroutine long
    LDA $C163            ; AD 63 C1 | Load from absolute address into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B61
; Address: $DBE073
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B61:
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ASL $42              ; 06 42 | Hardware register operation
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B76
; Address: $DBE0D0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B76:
    JSL $C74295          ; 22 95 42 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E0E4            ; 4C E4 E0 | Game work RAM access
    LDA $C11F            ; AD 1F C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B77
; Address: $DBE0DC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B77:
    JSL $C74181          ; 22 81 41 C7 | Jump to subroutine long
    JMP $E0D0            ; 4C D0 E0 | Game work RAM access
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B78
; Address: $DBE0E5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B78:
    JSL $C742FB          ; 22 FB 42 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E0F9            ; 4C F9 E0 | Game work RAM access
    LDA $C11F            ; AD 1F C1 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B85
; Address: $DBE129
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B85:
    JSL $C74414          ; 22 14 44 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E136            ; 4C 36 E1 | Jump to address
    JMP $E126            ; 4C 26 E1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B87
; Address: $DBE13A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B87:
    JSL $C74414          ; 22 14 44 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E147            ; 4C 47 E1 | Jump to address
    JMP $E137            ; 4C 37 E1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B89
; Address: $DBE14C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B89:
    JSL $C74414          ; 22 14 44 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E159            ; 4C 59 E1 | Jump to address
    JMP $E149            ; 4C 49 E1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B8B
; Address: $DBE15E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B8B:
    JSL $C7442C          ; 22 2C 44 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E16B            ; 4C 6B E1 | Jump to address
    JMP $E15B            ; 4C 5B E1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B8D
; Address: $DBE170
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B8D:
    JSL $C74414          ; 22 14 44 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E17D            ; 4C 7D E1 | Jump to address
    JMP $E16D            ; 4C 6D E1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B8E
; Address: $DBE17F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B8E:
    JSL $CDE11D          ; 22 1D E1 CD | Jump to subroutine long
    JMP $E17F            ; 4C 7F E1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B90
; Address: $DBE18A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B90:
    JSL $C74414          ; 22 14 44 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E197            ; 4C 97 E1 | Jump to address
    JMP $E187            ; 4C 87 E1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_B92
; Address: $DBE19C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_B92:
    JSL $C74414          ; 22 14 44 C7 | Jump to subroutine long
    JMP $E199            ; 4C 99 E1 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_BB6
; Address: $DBE235
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_BB6:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E251            ; 4C 51 E2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_BB7
; Address: $DBE245
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_BB7:
    JSL $CDE1ED          ; 22 ED E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    SEP #$68             ; E2 68 | Set processor status bits
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_BB8
; Address: $DBE253
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_BB8:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E26F            ; 4C 6F E2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_BB9
; Address: $DBE263
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_BB9:
    JSL $CDE1F6          ; 22 F6 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    EOR $68E2,Y          ; 59 E2 68 | Exclusive OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_BBA
; Address: $DBE271
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_BBA:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E28D            ; 4C 8D E2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_BBB
; Address: $DBE281
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_BBB:
    JSL $CDE1FF          ; 22 FF E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    SEP #$68             ; E2 68 | Set processor status bits
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank36_DmaFunction_BBC
; Address: $DBE28F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_BBC:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $E2AB            ; 4C AB E2 | Jump to address

;------------------------------------------------------------------------------
; Bank36_DmaFunction_BBD
; Address: $DBE29F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_BBD:
    JSL $CDE208          ; 22 08 E2 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    SEP #$68             ; E2 68 | Set processor status bits

;------------------------------------------------------------------------------
; Bank36_DmaFunction_BDB
; Address: $DBE33E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank36_DmaFunction_BDB:
    JSL $CC7A06          ; 22 06 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $E34B            ; 4C 4B E3 | Jump to address
