;==============================================================================
; Dragon Quest III - Bank $0E
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $C70000-$C77FFF
; Instructions: 10345
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_0E"

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_026
; Address: $C780D7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_026:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8123            ; 4C 23 81 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_032
; Address: $C7811A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_032:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $80E2            ; 4C E2 80 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_075
; Address: $C78272
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_075:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $838C            ; 4C 8C 83 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_0A7
; Address: $C78383
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_0A7:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $827D            ; 4C 7D 82 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_0AD
; Address: $C783A3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_0AD:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $83DD            ; 4C DD 83 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_0B6
; Address: $C783D4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_0B6:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $83AE            ; 4C AE 83 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_0B8
; Address: $C783E2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_0B8:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $843C            ; 4C 3C 84 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_0C6
; Address: $C78433
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_0C6:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $83ED            ; 4C ED 83 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_0C8
; Address: $C78441
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_0C8:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8494            ; 4C 94 84 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_0D5
; Address: $C7848B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_0D5:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $844C            ; 4C 4C 84 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_122
; Address: $C78623
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_122:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8655            ; 4C 55 86 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_129
; Address: $C7864C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_129:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $862E            ; 4C 2E 86 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_12A
; Address: $C78655
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_12A:
    JSL $C35FD5          ; 22 D5 5F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8674            ; 4C 74 86 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $22              ; 80 22 | Branch always
    JMP $A9C33D          ; 5C 3D C3 A9 | Jump to address long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_12C
; Address: $C7866F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_12C:
    JSL $C32B70          ; 22 70 2B C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_131
; Address: $C78688
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_131:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $86BA            ; 4C BA 86 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_138
; Address: $C786B1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_138:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8693            ; 4C 93 86 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_139
; Address: $C786BA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_139:
    JSL $C35FD5          ; 22 D5 5F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $86D9            ; 4C D9 86 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $22              ; 80 22 | Branch always
    JMP $A9C33D          ; 5C 3D C3 A9 | Jump to address long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_13B
; Address: $C786D4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_13B:
    JSL $C32B70          ; 22 70 2B C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_140
; Address: $C786ED
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_140:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $871F            ; 4C 1F 87 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_147
; Address: $C78716
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_147:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $86F8            ; 4C F8 86 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_148
; Address: $C7871F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_148:
    JSL $C35FD5          ; 22 D5 5F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $873E            ; 4C 3E 87 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $22              ; 80 22 | Branch always
    JMP $A9C33D          ; 5C 3D C3 A9 | Jump to address long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_14A
; Address: $C78739
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_14A:
    JSL $C32B70          ; 22 70 2B C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_14F
; Address: $C78752
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_14F:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8784            ; 4C 84 87 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_156
; Address: $C7877B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_156:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $875D            ; 4C 5D 87 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_158
; Address: $C78788
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_158:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $87A3            ; 4C A3 87 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $22              ; 80 22 | Branch always
    JMP $A9C33D          ; 5C 3D C3 A9 | Jump to address long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_15A
; Address: $C7879E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_15A:
    JSL $C32B70          ; 22 70 2B C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_15F
; Address: $C787B7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_15F:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $87E9            ; 4C E9 87 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_166
; Address: $C787E0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_166:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $87C2            ; 4C C2 87 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_167
; Address: $C787E9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_167:
    JSL $C35FD5          ; 22 D5 5F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8808            ; 4C 08 88 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $22              ; 80 22 | Branch always
    JMP $A9C33D          ; 5C 3D C3 A9 | Jump to address long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_169
; Address: $C78803
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_169:
    JSL $C32B70          ; 22 70 2B C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_176
; Address: $C7884B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_176:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $1C              ; A5 1C | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$40             ; 69 40 | Add with carry (immediate)
    STA $1C              ; 85 1C | Store accumulator to zero page
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $88B0            ; 4C B0 88 | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_184
; Address: $C788A7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_184:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $885E            ; 4C 5E 88 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_186
; Address: $C788B5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_186:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $88F9            ; 4C F9 88 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_191
; Address: $C788F0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_191:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $88C0            ; 4C C0 88 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_193
; Address: $C788FE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_193:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8930            ; 4C 30 89 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_19A
; Address: $C78927
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_19A:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8909            ; 4C 09 89 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_1A0
; Address: $C78944
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_1A0:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $898C            ; 4C 8C 89 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_1AB
; Address: $C78983
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_1AB:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $894F            ; 4C 4F 89 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_1AE
; Address: $C78994
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_1AE:
    JSL $C36086          ; 22 86 60 C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $89B0            ; 4C B0 89 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_1B1
; Address: $C789AB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_1B1:
    JSL $FF130C          ; 22 0C 13 FF | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $89BC            ; 4C BC 89 | Jump to address
    LDA #$7D             ; A9 7D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_1D4
; Address: $C78A73
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_1D4:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8AA9            ; 4C A9 8A | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_1DC
; Address: $C78AA0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_1DC:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8A7E            ; 4C 7E 8A | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_1F8
; Address: $C78B3D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_1F8:
    JSL $C35FE7          ; 22 E7 5F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8BA4            ; 4C A4 8B | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_207
; Address: $C78B89
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_207:
    JSL $C3604F          ; 22 4F 60 C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8B9A            ; 4C 9A 8B | Jump to address
    LDA #$8A             ; A9 8A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_208
; Address: $C78B95
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_208:
    JSL $FF130C          ; 22 0C 13 FF | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $8BA3            ; 4C A3 8B | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_209
; Address: $C78B9F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_209:
    JSL $C35C00          ; 22 00 5C C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_20A
; Address: $C78BA5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_20A:
    JSL $C35FE7          ; 22 E7 5F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8BDD            ; 4C DD 8B | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_215
; Address: $C78BDD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_215:
    JSL $C35FEE          ; 22 EE 5F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8C02            ; 4C 02 8C | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_21B
; Address: $C78BFD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_21B:
    JSL $C35D23          ; 22 23 5D C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_21E
; Address: $C78C0B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_21E:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8C5C            ; 4C 5C 8C | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_22C
; Address: $C78C53
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_22C:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8C16            ; 4C 16 8C | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_22F
; Address: $C78C65
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_22F:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8CB6            ; 4C B6 8C | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_23D
; Address: $C78CAD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_23D:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8C70            ; 4C 70 8C | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_24F
; Address: $C78D07
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_24F:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8CCA            ; 4C CA 8C | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_252
; Address: $C78D19
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_252:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8D6A            ; 4C 6A 8D | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_260
; Address: $C78D61
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_260:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8D24            ; 4C 24 8D | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_263
; Address: $C78D73
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_263:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8DB1            ; 4C B1 8D | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_26D
; Address: $C78DA8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_26D:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8D7E            ; 4C 7E 8D | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_270
; Address: $C78DBA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_270:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8DE5            ; 4C E5 8D | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_276
; Address: $C78DDC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_276:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8DC5            ; 4C C5 8D | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_279
; Address: $C78DEE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_279:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8E33            ; 4C 33 8E | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_284
; Address: $C78E2A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_284:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8DF9            ; 4C F9 8D | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_287
; Address: $C78E3C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_287:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8E6E            ; 4C 6E 8E | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_28E
; Address: $C78E65
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_28E:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8E47            ; 4C 47 8E | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_294
; Address: $C78E83
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_294:
    JSL $C3604F          ; 22 4F 60 C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8EA6            ; 4C A6 8E | Jump to address
    LDA #$8B             ; A9 8B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_298
; Address: $C78EA1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_298:
    JSL $C32B70          ; 22 70 2B C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $8ECA            ; 4C CA 8E | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_299
; Address: $C78EAB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_299:
    JSL $C36018          ; 22 18 60 C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8EB9            ; 4C B9 8E | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_29A
; Address: $C78EB4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_29A:
    JSL $C35E12          ; 22 12 5E C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BCC $03              ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2A4
; Address: $C78EE1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2A4:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8F17            ; 4C 17 8F | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2AC
; Address: $C78F0E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2AC:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8EEC            ; 4C EC 8E | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2AD
; Address: $C78F17
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2AD:
    JSL $C35832          ; 22 32 58 C3 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $22              ; 80 22 | Branch always
    JMP $22C33D          ; 5C 3D C3 22 | Jump to address long
    LSR $A2C3            ; 4E C3 A2 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2B1
; Address: $C78F36
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2B1:
    JSL $C35FE7          ; 22 E7 5F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8F6B            ; 4C 6B 8F | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2C0
; Address: $C78F78
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2C0:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8FB2            ; 4C B2 8F | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2C9
; Address: $C78FA9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2C9:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8F83            ; 4C 83 8F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2CB
; Address: $C78FB7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2CB:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $8FED            ; 4C ED 8F | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2D3
; Address: $C78FE4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2D3:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $8FC2            ; 4C C2 8F | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2D6
; Address: $C78FF6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2D6:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $903E            ; 4C 3E 90 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2E2
; Address: $C79035
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2E2:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9001            ; 4C 01 90 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2E5
; Address: $C79047
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2E5:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9098            ; 4C 98 90 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2F3
; Address: $C7908F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2F3:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9052            ; 4C 52 90 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_2F7
; Address: $C790A5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_2F7:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $90F6            ; 4C F6 90 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_305
; Address: $C790ED
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_305:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $90B0            ; 4C B0 90 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_38B
; Address: $C793B1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_38B:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $938B            ; 4C 8B 93 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_38D
; Address: $C793BF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_38D:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $93F1            ; 4C F1 93 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_394
; Address: $C793E8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_394:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $93CA            ; 4C CA 93 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_398
; Address: $C79401
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_398:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $94A4            ; 4C A4 94 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3A3
; Address: $C79441
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3A3:
    JSL $C3606E          ; 22 6E 60 C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9452            ; 4C 52 94 | Jump to address
    LDA #$5B             ; A9 5B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3A4
; Address: $C7944D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3A4:
    JSL $FF130C          ; 22 0C 13 FF | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $945E            ; 4C 5E 94 | Jump to address
    LDA #$5C             ; A9 5C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3AD
; Address: $C79486
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3AD:
    JSL $C32C0F          ; 22 0F 2C C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $9497            ; 4C 97 94 | Jump to address
    LDA #$8E             ; A9 8E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3B0
; Address: $C7949B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3B0:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $940C            ; 4C 0C 94 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3B1
; Address: $C794A5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3B1:
    JSL $C35FFD          ; 22 FD 5F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $94FB            ; 4C FB 94 | Jump to address
    LDA #$5D             ; A9 5D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3BE
; Address: $C794F6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3BE:
    JSL $C32C9E          ; 22 9E 2C C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3C6
; Address: $C7951D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3C6:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $954F            ; 4C 4F 95 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3CD
; Address: $C79546
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3CD:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9528            ; 4C 28 95 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3D6
; Address: $C79575
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3D6:
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $95A3            ; 4C A3 95 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3DD
; Address: $C7959A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3DD:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $957C            ; 4C 7C 95 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3DF
; Address: $C795A8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3DF:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $95DA            ; 4C DA 95 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3E6
; Address: $C795D1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3E6:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $95B3            ; 4C B3 95 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3E8
; Address: $C795DF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3E8:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9611            ; 4C 11 96 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_3EF
; Address: $C79608
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_3EF:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $95EA            ; 4C EA 95 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_401
; Address: $C79678
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_401:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $96AA            ; 4C AA 96 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_408
; Address: $C796A1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_408:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9683            ; 4C 83 96 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_40F
; Address: $C796C8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_40F:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9702            ; 4C 02 97 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_418
; Address: $C796F9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_418:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $96D3            ; 4C D3 96 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_419
; Address: $C79702
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_419:
    JSL $C35832          ; 22 32 58 C3 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    BRA $22              ; 80 22 | Branch always
    JMP $22C33D          ; 5C 3D C3 22 | Jump to address long
    LSR $A2C3            ; 4E C3 A2 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_424
; Address: $C79742
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_424:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9786            ; 4C 86 97 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_42F
; Address: $C7977D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_42F:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $974D            ; 4C 4D 97 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_437
; Address: $C797A8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_437:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $97EC            ; 4C EC 97 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_441
; Address: $C797E3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_441:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $97B3            ; 4C B3 97 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_44D
; Address: $C79828
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_44D:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $987E            ; 4C 7E 98 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_45A
; Address: $C79875
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_45A:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9833            ; 4C 33 98 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_492
; Address: $C799A0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_492:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $99E4            ; 4C E4 99 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_49C
; Address: $C799DB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_49C:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $99AB            ; 4C AB 99 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_4A3
; Address: $C79A01
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_4A3:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9A2F            ; 4C 2F 9A | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_4A9
; Address: $C79A26
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_4A9:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9A0C            ; 4C 0C 9A | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_4AB
; Address: $C79A34
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_4AB:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9A62            ; 4C 62 9A | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_4B1
; Address: $C79A59
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_4B1:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9A3F            ; 4C 3F 9A | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_4B5
; Address: $C79A6F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_4B5:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $9AA5            ; 4C A5 9A | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_4BD
; Address: $C79A9C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_4BD:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9A7A            ; 4C 7A 9A | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_4BE
; Address: $C79AA5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_4BE:
    JSL $C36028          ; 22 28 60 C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9AC4            ; 4C C4 9A | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_4C2
; Address: $C79ABF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_4C2:
    JSL $C32B70          ; 22 70 2B C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_511
; Address: $C79C7C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_511:
    JSL $C36041          ; 22 41 60 C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9C8D            ; 4C 8D 9C | Jump to address
    LDA #$63             ; A9 63 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_512
; Address: $C79C88
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_512:
    JSL $FF130C          ; 22 0C 13 FF | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $9C99            ; 4C 99 9C | Jump to address
    LDA #$64             ; A9 64 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_52C
; Address: $C79D22
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_52C:
    JSL $C36041          ; 22 41 60 C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $9D33            ; 4C 33 9D | Jump to address
    LDA #$63             ; A9 63 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_52D
; Address: $C79D2E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_52D:
    JSL $FF130C          ; 22 0C 13 FF | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $9D3F            ; 4C 3F 9D | Jump to address
    LDA #$64             ; A9 64 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_69F
; Address: $C7A6AF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_69F:
    JSL $C32EB0          ; 22 B0 2E C3 | Jump to subroutine long
    LDA $04              ; A5 04 | Load from zero page into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $A6F3            ; 4C F3 A6 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6A9
; Address: $C7A6EA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6A9:
    JSL $C32FB0          ; 22 B0 2F C3 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $A6BA            ; 4C BA A6 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6BB
; Address: $C7A74A
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6BB:
    AND $20              ; 25 20 | Logical AND with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR ($2E,X)          ; 41 2E | Exclusive OR with accumulator ((zero page,X))
    AND $0200,Y          ; 39 00 02 | Logical AND with accumulator (absolute,Y)
    ASL $1304            ; 0E 04 13 | Arithmetic shift left (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ORA $1631,X          ; 1D 31 16 | Logical OR with accumulator (absolute,X)
    ORA $16              ; 05 16 | Logical OR with accumulator (zero page)
    ORA $0039,Y          ; 19 39 00 | Logical OR with accumulator (absolute,Y)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ORA ($0D),Y          ; 11 0D | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    EOR $4C44            ; 4D 44 4C | Exclusive OR with accumulator (absolute)
    ADC $2738            ; 6D 38 27 | Add with carry (absolute)
    ORA #$61             ; 09 61 | Logical OR with accumulator (immediate)
    LSR $2B38,X          ; 5E 38 2B | Logical shift right (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1631,X          ; 1D 31 16 | Logical OR with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    AND $0034            ; 2D 34 00 | Logical AND with accumulator (absolute)
    ROL $381F            ; 2E 1F 38 | Rotate left (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ORA $241A            ; 0D 1A 24 | Logical OR with accumulator (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6BC
; Address: $C7A7A6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6BC:
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $1F0C            ; 0E 0C 1F | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0D),Y          ; 11 0D | Logical OR with accumulator ((zero page),Y)
    ORA ($4D,X)          ; 01 4D | Logical OR with accumulator ((zero page,X))
    JMP $386D            ; 4C 6D 38 | Jump to address
    ROL                  ; 2A | Rotate left (accumulator)
    CLC                  ; 18 | Clear carry flag
    BPL $25              ; 10 25 | Branch if positive
    ORA $1100            ; 0D 00 11 | Logical OR with accumulator (absolute)
    ORA $0F0D            ; 0D 0D 0F | Logical OR with accumulator (absolute)
    AND #$14             ; 29 14 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6BD
; Address: $C7A7D4
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6BD:
    JSR $000D            ; 20 0D 00 | Jump to subroutine
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ASL $1404            ; 0E 04 14 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    ASL $2604            ; 0E 04 26 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    AND #$0E             ; 29 0E | Logical AND with accumulator (immediate)
    WDM #$00             ; 42 00 | Reserved instruction
    ORA $0421,Y          ; 19 21 04 | Logical OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    AND #$0E             ; 29 0E | Logical AND with accumulator (immediate)
    ORA $0D11,X          ; 1D 11 0D | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ASL $4233            ; 0E 33 42 | Hardware register operation
    ASL $3418            ; 0E 18 34 | Arithmetic shift left (absolute)
    ORA $111D,X          ; 1D 1D 11 | Logical OR with accumulator (absolute,X)
    ASL $1E00            ; 0E 00 1E | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $0034,Y          ; 19 34 00 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6BF
; Address: $C7A825
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6BF:
    JSL $391904          ; 22 04 19 39 | Jump to subroutine long
    ORA $0039            ; 0D 39 00 | Logical OR with accumulator (absolute)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BIT $19              ; 24 19 | Test bits in accumulator (zero page)
    ORA $2804            ; 0D 04 28 | Logical OR with accumulator (absolute)
    ORA $0005,X          ; 1D 05 00 | Logical OR with accumulator (absolute,X)
    AND $6C              ; 25 6C | Logical AND with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6C0
; Address: $C7A83F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6C0:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ROL $1C              ; 26 1C | Rotate left (zero page)
    ORA ($32),Y          ; 11 32 | Logical OR with accumulator ((zero page),Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    AND $2F              ; 25 2F | Logical AND with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6C1
; Address: $C7A84F
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6C1:
    PLP                  ; 28 | Pull processor status from stack
    ORA $4233            ; 0D 33 42 | Hardware register operation
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    AND #$11             ; 29 11 | Logical AND with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $2439            ; 0E 39 24 | Arithmetic shift left (absolute)
    AND ($16),Y          ; 31 16 | Logical AND with accumulator ((zero page),Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $1B04            ; 0D 04 1B | Logical OR with accumulator (absolute)
    ORA $A098            ; 0D 98 A0 | Logical OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BIT $0D16            ; 2C 16 0D | Test bits in accumulator (absolute)
    ORA $A09D            ; 0D 9D A0 | Logical OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    AND $0E15            ; 2D 15 0E | Logical AND with accumulator (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ROL $4117            ; 2E 17 41 | Rotate left (absolute)
    ROL $48              ; 26 48 | Rotate left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY #$05             ; A0 05 | Load immediate value into Y register
    BMI $9D              ; 30 9D | Branch if negative
    LDY #$05             ; A0 05 | Load immediate value into Y register
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    SEC                  ; 38 | Set carry flag
    ORA $1E35            ; 0D 35 1E | Logical OR with accumulator (absolute)
    ORA $3200            ; 0D 00 32 | Logical OR with accumulator (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ROL $1F04            ; 2E 04 1F | Rotate left (absolute)
    BPL $37              ; 10 37 | Branch if positive
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)
    LSR $7679            ; 4E 79 76 | Logical shift right (absolute)
    LSR $3700,X          ; 5E 00 37 | Logical shift right (absolute,X)
    JMP ($5F04)          ; 6C 04 5F | Jump to address (absolute indirect)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6C2
; Address: $C7A8C5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6C2:
    LSR $3800,X          ; 5E 00 38 | Logical shift right (absolute,X)
    AND #$0E             ; 29 0E | Logical AND with accumulator (immediate)
    AND $3900,Y          ; 39 00 39 | Logical AND with accumulator (absolute,Y)
    JMP $7061            ; 4C 61 70 | Jump to address
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6C3
; Address: $C7A8D6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6C3:
    JSR $0F2A            ; 20 2A 0F | Jump to subroutine
    ORA $1F39,Y          ; 19 39 1F | Logical OR with accumulator (absolute,Y)
    ASL $3C00            ; 0E 00 3C | Arithmetic shift left (absolute)
    STZ $76              ; 64 76 | Store zero to zero page
    BVC $7D              ; 50 7D | Branch if overflow clear
    LSR $3D00            ; 4E 00 3D | Logical shift right (absolute)
    LSR $5E              ; 46 5E | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6C4
; Address: $C7A8EC
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6C4:
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL $5E46,X          ; 3E 46 5E | Rotate left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ROR $037D            ; 6E 7D 03 | Rotate right (absolute)
    LSR $4000,X          ; 5E 00 40 | Logical shift right (absolute,X)
    INC                  ; 1A | Increment accumulator
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    EOR ($16,X)          ; 41 16 | Exclusive OR with accumulator ((zero page,X))
    ORA $4212            ; 0D 12 42 | Hardware register operation
    ASL $0E1A            ; 0E 1A 0E | Arithmetic shift left (absolute)
    ROL $00              ; 26 00 | Rotate left (zero page)
    WDM #$04             ; 42 04 | Reserved instruction
    AND #$0E             ; 29 0E | Logical AND with accumulator (immediate)
    ASL $1304            ; 0E 04 13 | Arithmetic shift left (absolute)
    EOR $31              ; 45 31 | Exclusive OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    LSR $17              ; 46 17 | Logical shift right (zero page)
    AND $2703,Y          ; 39 03 27 | Logical AND with accumulator (absolute,Y)
    LSR $524F            ; 4E 4F 52 | Logical shift right (absolute)
    ADC $4800,X          ; 7D 00 48 | Add with carry (absolute,X)
    EOR #$04             ; 49 04 | Exclusive OR with accumulator (immediate)
    AND $0E15,Y          ; 39 15 0E | Logical AND with accumulator (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6C5
; Address: $C7A944
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6C5:
    JSR $2A11            ; 20 11 2A | Jump to subroutine
    ASL $1336            ; 0E 36 13 | Arithmetic shift left (absolute)
    WDM #$00             ; 42 00 | Reserved instruction
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6C6
; Address: $C7A952
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6C6:
    ADC $5204,X          ; 7D 04 52 | Add with carry (absolute,X)
    BIT $16              ; 24 16 | Test bits in accumulator (zero page)
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    JMP $5204            ; 4C 04 52 | Jump to address
    ADC $2461,X          ; 7D 61 24 | Add with carry (absolute,X)
    AND $1E04,Y          ; 39 04 1E | Logical AND with accumulator (absolute,Y)
    AND $4D00,Y          ; 39 00 4D | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6C7
; Address: $C7A968
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6C7:
    JSR $0F2A            ; 20 2A 0F | Jump to subroutine
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    LSR $1311            ; 4E 11 13 | Logical shift right (absolute)
    ASL $1704            ; 0E 04 17 | Arithmetic shift left (absolute)
    WDM #$0E             ; 42 0E | Reserved instruction
    AND ($1A),Y          ; 31 1A | Logical AND with accumulator ((zero page),Y)
    ASL $002F            ; 0E 2F 00 | Arithmetic shift left (absolute)
    BVC $27              ; 50 27 | Branch if overflow clear
    ORA ($14),Y          ; 11 14 | Logical OR with accumulator ((zero page),Y)
    ORA $002F,Y          ; 19 2F 00 | Logical OR with accumulator (absolute,Y)
    EOR ($61),Y          ; 51 61 | Exclusive OR with accumulator ((zero page),Y)
    STZ $44              ; 64 44 | Store zero to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    STZ $04              ; 64 04 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6C9
; Address: $C7A995
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6C9:
    BPL $04              ; 10 04 | Branch if positive
    AND $5300,Y          ; 39 00 53 | Logical AND with accumulator (absolute,Y)
    LSR $524F            ; 4E 4F 52 | Logical shift right (absolute)
    ADC $7D50,X          ; 7D 50 7D | Add with carry (absolute,X)
    LSR $5400,X          ; 5E 00 54 | Logical shift right (absolute,X)
    BPL $0E              ; 10 0E | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    AND #$0E             ; 29 0E | Logical AND with accumulator (immediate)
    AND $1724,Y          ; 39 24 17 | Logical AND with accumulator (absolute,Y)
    WDM #$38             ; 42 38 | Reserved instruction
    ORA $3413,X          ; 1D 13 34 | Logical OR with accumulator (absolute,X)
    AND #$0E             ; 29 0E | Logical AND with accumulator (immediate)
    AND $1838,Y          ; 39 38 18 | Logical AND with accumulator (absolute,Y)
    ORA $1E3F,Y          ; 19 3F 1E | Logical OR with accumulator (absolute,Y)
    ORA $1138            ; 0D 38 11 | Logical OR with accumulator (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    AND #$0E             ; 29 0E | Logical AND with accumulator (immediate)
    AND $1724,Y          ; 39 24 17 | Logical AND with accumulator (absolute,Y)
    WDM #$38             ; 42 38 | Reserved instruction
    CLC                  ; 18 | Clear carry flag
    EOR $2904,Y          ; 59 04 29 | Exclusive OR with accumulator (absolute,Y)
    ASL $3914            ; 0E 14 39 | Arithmetic shift left (absolute)
    BIT $17              ; 24 17 | Test bits in accumulator (zero page)
    WDM #$38             ; 42 38 | Reserved instruction
    ASL $181D            ; 0E 1D 18 | Arithmetic shift left (absolute)
    PHY                  ; 5A | Push Y register to stack
    AND #$0E             ; 29 0E | Logical AND with accumulator (immediate)
    AND $1724,Y          ; 39 24 17 | Logical AND with accumulator (absolute,Y)
    WDM #$00             ; 42 00 | Reserved instruction
    STY $6D              ; 84 6D | Store Y register to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP $010101          ; 5C 01 01 01 | Jump to address long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $9FA2,X          ; 5D A2 9F | Exclusive OR with accumulator (absolute,X)
    STA $5C04,X          ; 9D 04 5C | Store accumulator to absolute,X
    ADC $4E04,X          ; 7D 04 4E | Add with carry (absolute,X)
    ADC $0070,Y          ; 79 70 00 | Add with carry (absolute,Y)
    LSR $4226,X          ; 5E 26 42 | Hardware register operation
    ASL $1704            ; 0E 04 17 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    AND $2F              ; 25 2F | Logical AND with accumulator (zero page)
    ORA $6000            ; 0D 00 60 | Logical OR with accumulator (absolute)
    BPL $1A              ; 10 1A | Branch if positive
    ORA $6100            ; 0D 00 61 | Logical OR with accumulator (absolute)
    JMP ($0047)          ; 6C 47 00 | Jump to address (absolute indirect)
    ADC $5B              ; 65 5B | Add with carry (zero page)
    ADC #$6B             ; 69 6B | Add with carry (immediate)
    BPL $1F              ; 10 1F | Branch if positive
    STZ $10              ; 64 10 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6CA
; Address: $C7AA32
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6CA:
    AND $0020,Y          ; 39 20 00 | Logical AND with accumulator (absolute,Y)
    ADC $19              ; 65 19 | Add with carry (zero page)
    AND $0E1F,Y          ; 39 1F 0E | Logical AND with accumulator (absolute,Y)
    ORA ($32),Y          ; 11 32 | Logical OR with accumulator ((zero page),Y)
    ROR $04              ; 66 04 | Rotate right (zero page)
    EOR ($1D,X)          ; 41 1D | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    WDM #$0E             ; 42 0E | Reserved instruction
    ROL $9D              ; 26 9D | Rotate left (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ADC #$98             ; 69 98 | Add with carry (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ROR                  ; 6A | Rotate right (accumulator)
    STA $00A0,X          ; 9D A0 00 | Store accumulator to absolute,X
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6CB
; Address: $C7AA5B
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6CB:
    ROL                  ; 2A | Rotate left (accumulator)
    AND $391B,Y          ; 39 1B 39 | Logical AND with accumulator (absolute,Y)
    JMP ($3220)          ; 6C 20 32 | Jump to address (absolute indirect)
    ROL $11              ; 26 11 | Rotate left (zero page)
    ADC $1F04            ; 6D 04 1F | Add with carry (absolute)
    ASL $1304            ; 0E 04 13 | Arithmetic shift left (absolute)
    ORA $330D,Y          ; 19 0D 33 | Logical OR with accumulator (absolute,Y)
    ROR $1327            ; 6E 27 13 | Rotate right (absolute)
    ORA $330D,Y          ; 19 0D 33 | Logical OR with accumulator (absolute,Y)
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    ROL $00              ; 26 00 | Rotate left (zero page)
    BVS $19              ; 70 19 | Branch if overflow set
    ORA $2804            ; 0D 04 28 | Logical OR with accumulator (absolute)
    ORA $7100,X          ; 1D 00 71 | Logical OR with accumulator (absolute,X)
    ASL $1404            ; 0E 04 14 | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    ROL $48              ; 26 48 | Rotate left (zero page)
    INC                  ; 1A | Increment accumulator
    ASL $2604            ; 0E 04 26 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6CC
; Address: $C7AAA1
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6CC:
    JSR $000D            ; 20 0D 00 | Jump to subroutine
    AND ($36),Y          ; 31 36 | Logical AND with accumulator ((zero page),Y)
    ORA $7600            ; 0D 00 76 | Logical OR with accumulator (absolute)
    ASL $7700,X          ; 1E 00 77 | Arithmetic shift left (absolute,X)
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    INC                  ; 1A | Increment accumulator
    ASL $4217            ; 0E 17 42 | Hardware register operation
    ROL $39              ; 26 39 | Rotate left (zero page)
    ADC $0D11,Y          ; 79 11 0D | Add with carry (absolute,Y)
    AND ($12,X)          ; 21 12 | Logical AND with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    ASL $2133            ; 0E 33 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6CD
; Address: $C7AACE
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6CD:
    AND ($25,X)          ; 21 25 | Logical AND with accumulator ((zero page,X))
    ORA ($25,X)          ; 01 25 | Logical OR with accumulator ((zero page,X))
    ORA $1E3F            ; 0D 3F 1E | Logical OR with accumulator (absolute)
    ORA $0034            ; 0D 34 00 | Logical OR with accumulator (absolute)
    ADC $0D25,X          ; 7D 25 0D | Add with carry (absolute,X)
    ASL $200D,X          ; 1E 0D 20 | Arithmetic shift left (absolute,X)
    ORA $7E00            ; 0D 00 7E | Logical OR with accumulator (absolute)
    ORA $1112            ; 0D 12 11 | Logical OR with accumulator (absolute)
    ORA $0034,Y          ; 19 34 00 | Logical OR with accumulator (absolute,Y)
    BIT $1C              ; 24 1C | Test bits in accumulator (zero page)
    WDM #$0E             ; 42 0E | Reserved instruction
    BRA $24              ; 80 24 | Branch always
    ORA $1F38            ; 0D 38 1F | Logical OR with accumulator (absolute)
    STA ($20,X)          ; 81 20 | Store accumulator to (zero page,X)
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    AND ($04),Y          ; 31 04 | Logical AND with accumulator ((zero page),Y)
    ROL $04              ; 26 04 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6CE
; Address: $C7AB0C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6CE:
    JSR $2A11            ; 20 11 2A | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    AND $040D            ; 2D 0D 04 | Logical AND with accumulator (absolute)
    AND #$38             ; 29 38 | Logical AND with accumulator (immediate)
    STY $04              ; 84 04 | Store Y register to zero page
    SEC                  ; 38 | Set carry flag
    STA $9D              ; 85 9D | Store accumulator to zero page
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STX $9D              ; 86 9D | Store X register to zero page
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    BIT #$9D             ; 89 9D | Test bits in accumulator (immediate)
    STZ $0005            ; 9C 05 00 | Store zero to absolute
    TXA                  ; 8A | Transfer X register to accumulator
    ROL $1D              ; 26 1D | Rotate left (zero page)
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6CF
; Address: $C7AB43
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6CF:
    JSR $121F            ; 20 1F 12 | Jump to subroutine
    ORA $1011,X          ; 1D 11 10 | Logical OR with accumulator (absolute,X)
    ASL $8B00            ; 0E 00 8B | Arithmetic shift left (absolute)
    ROL $1D              ; 26 1D | Rotate left (zero page)
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6D0
; Address: $C7AB50
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6D0:
    JSR $121F            ; 20 1F 12 | Jump to subroutine
    STY $111D            ; 8C 1D 11 | Store Y register to absolute address
    BPL $0E              ; 10 0E | Branch if positive
    STA $1B04            ; 8D 04 1B | Store accumulator to absolute address
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6D1
; Address: $C7AB61
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6D1:
    STX $3117            ; 8E 17 31 | Store X register to absolute address
    ASL $1E17            ; 0E 17 1E | Arithmetic shift left (absolute)
    ORA $192A            ; 0D 2A 19 | Logical OR with accumulator (absolute)
    AND $8F00,Y          ; 39 00 8F | Logical AND with accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    BCC $0D              ; 90 0D | Branch if carry clear
    AND $121C,Y          ; 39 1C 12 | Logical AND with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6D2
; Address: $C7AB78
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6D2:
    ADC $0069,X          ; 7D 69 00 | Add with carry (absolute,X)
    STA ($0C),Y          ; 91 0C | Store accumulator to (zero page),Y
    CLC                  ; 18 | Clear carry flag
    ROL $12              ; 26 12 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $70              ; 65 70 | Add with carry (zero page)
    ADC $3919,X          ; 7D 19 39 | Add with carry (absolute,X)
    ASL $1F04            ; 0E 04 1F | Arithmetic shift left (absolute)
    ASL $3919            ; 0E 19 39 | Arithmetic shift left (absolute)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $00              ; 26 00 | Rotate left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ORA $1704,X          ; 1D 04 17 | Logical OR with accumulator (absolute,X)
    EOR ($39,X)          ; 41 39 | Exclusive OR with accumulator ((zero page,X))
    STA $0D0C,Y          ; 99 0C 0D | Store accumulator to absolute,Y
    ASL $100F            ; 0E 0F 10 | Arithmetic shift left (absolute)
    EOR ($39,X)          ; 41 39 | Exclusive OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6D3
; Address: $C7ABC4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6D3:
    ADC $0069,X          ; 7D 69 00 | Add with carry (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    JMP ($5662)          ; 6C 62 56 | Jump to address (absolute indirect)
    STZ $5769            ; 9C 69 57 | Store zero to absolute
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6D4
; Address: $C7ABD1
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6D4:
    ADC $0052,X          ; 7D 52 00 | Add with carry (absolute,X)
    STA $7046,X          ; 9D 46 70 | Store accumulator to absolute,X
    PHA                  ; 48 | Push accumulator to stack
    EOR $70              ; 45 70 | Exclusive OR with accumulator (zero page)
    STZ $1904,X          ; 9E 04 19 | Store zero to absolute,X
    AND $1D2D,Y          ; 39 2D 1D | Logical AND with accumulator (absolute,Y)
    STA                  ; 9F 6A 50 76 | Store accumulator to absolute long,X
    LDY #$1C             ; A0 1C | Load immediate value into Y register
    ORA ($32),Y          ; 11 32 | Logical OR with accumulator ((zero page),Y)
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    LDA ($18,X)          ; A1 18 | Load from (zero page,X) into accumulator
    AND $2F              ; 25 2F | Logical AND with accumulator (zero page)
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    LDX #$4F             ; A2 4F | Load immediate value into X register
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6D5
; Address: $C7AC0B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6D5:
    ORA ($17),Y          ; 11 17 | Logical OR with accumulator ((zero page),Y)
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    LDY $69              ; A4 69 | Load from zero page into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    LDA $1D              ; A5 1D | Load from zero page into accumulator
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    CLC                  ; 18 | Clear carry flag
    LDX $04              ; A6 04 | Load from zero page into X register
    AND $1E04,Y          ; 39 04 1E | Logical AND with accumulator (absolute,Y)
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))
    BPL $2A              ; 10 2A | Branch if positive
    ORA ($19),Y          ; 11 19 | Logical OR with accumulator ((zero page),Y)
    AND ($18,X)          ; 21 18 | Logical AND with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6D6
; Address: $C7AC38
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6D6:
    JSR $0439            ; 20 39 04 | Jump to subroutine
    ORA ($1D),Y          ; 11 1D | Logical OR with accumulator ((zero page),Y)
    ASL $352A            ; 0E 2A 35 | Arithmetic shift left (absolute)
    ROR $A900,X          ; 7E 00 A9 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6D7
; Address: $C7AC43
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6D7:
    JSR $2139            ; 20 39 21 | PPU graphics register access
    ASL $352A            ; 0E 2A 35 | Arithmetic shift left (absolute)
    ROR $AA00,X          ; 7E 00 AA | Rotate right (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $AB00            ; 0D 00 AB | Logical OR with accumulator (absolute)
    ORA $1801            ; 0D 01 18 | Logical OR with accumulator (absolute)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA $AC00            ; 0D 00 AC | Logical OR with accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6D8
; Address: $C7AC6A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6D8:
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    ORA $AD00            ; 0D 00 AD | Logical OR with accumulator (absolute)
    LSR $76              ; 46 76 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6D9
; Address: $C7AC79
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6D9:
    JSR $2901            ; 20 01 29 | Jump to subroutine
    AND $1104,Y          ; 39 04 11 | Logical AND with accumulator (absolute,Y)
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))
    ORA $AE00            ; 0D 00 AE | Logical OR with accumulator (absolute)
    ORA $0F2A,X          ; 1D 2A 0F | Logical OR with accumulator (absolute,X)
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
; Bank0E_DmaFunction_6DB
; Address: $C7AC9B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6DB:
    STA $33FC            ; 8D FC 33 | Store accumulator to absolute address
    LDA #$3B             ; A9 3B | Load immediate value into accumulator
    LDA $C3A2            ; AD A2 C3 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6DD
; Address: $C7ACA8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6DD:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $45              ; F0 45 | Branch if equal
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $2E              ; F0 2E | Branch if equal
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BEQ $17              ; F0 17 | Branch if equal
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $48              ; D0 48 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6DE
; Address: $C7ACC2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6DE:
    JSL $C32296          ; 22 96 22 C3 | Jump to subroutine long
    ORA ($15),Y          ; 11 15 | Logical OR with accumulator ((zero page),Y)
    BCS $46              ; B0 46 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6DF
; Address: $C7ACCB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6DF:
    JSL $C32359          ; 22 59 23 C3 | Jump to subroutine long
    ORA ($15),Y          ; 11 15 | Logical OR with accumulator ((zero page),Y)
    JMP $AD1D            ; 4C 1D AD | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6E0
; Address: $C7ACD4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6E0:
    JSL $C32296          ; 22 96 22 C3 | Jump to subroutine long
    BPL $15              ; 10 15 | Branch if positive
    BCS $34              ; B0 34 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6E1
; Address: $C7ACDD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6E1:
    JSL $C32359          ; 22 59 23 C3 | Jump to subroutine long
    BPL $15              ; 10 15 | Branch if positive
    JMP $AD1D            ; 4C 1D AD | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6E4
; Address: $C7ACF8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6E4:
    JSL $C32296          ; 22 96 22 C3 | Jump to subroutine long
    ASL $B015            ; 0E 15 B0 | Arithmetic shift left (absolute)
    BPL $22              ; 10 22 | Branch if positive
    EOR $C323,Y          ; 59 23 C3 | Exclusive OR with accumulator (absolute,Y)
    ASL $4C15            ; 0E 15 4C | Arithmetic shift left (absolute)
    ORA $22AD,X          ; 1D AD 22 | Logical OR with accumulator (absolute,X)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)
    BCC $0C              ; 90 0C | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6E5
; Address: $C7AD11
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6E5:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6E6
; Address: $C7AD1D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6E6:
    LDA $33BE            ; AD BE 33 | Load from absolute address into accumulator
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BCS $EC              ; B0 EC | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6E7
; Address: $C7AD26
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6E7:
    TAX                  ; AA | Transfer accumulator to X register
    LDA $DEB0            ; AD B0 DE | Load from absolute address into accumulator
    JMP $AD11            ; 4C 11 AD | Jump to address
    CMP $E3AD,Y          ; D9 AD E3 | Compare accumulator (absolute,Y)
    LDA $AF02            ; AD 02 AF | Load from absolute address into accumulator
    STX $98B5            ; 8E B5 98 | Store X register to absolute address
    INX                  ; E8 | Increment X register
    LDA $33FC            ; AD FC 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6E8
; Address: $C7AD3F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6E8:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6E9
; Address: $C7AD4B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6E9:
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
; Bank0E_DmaFunction_6EA
; Address: $C7AD57
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6EA:
    JSL $C32060          ; 22 60 20 C3 | Jump to subroutine long
    STA $33FC            ; 8D FC 33 | Store accumulator to absolute address
    LDA #$3B             ; A9 3B | Load immediate value into accumulator
    LDA $C3A2            ; AD A2 C3 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6ED
; Address: $C7AD71
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6ED:
    JSL $C3233B          ; 22 3B 23 C3 | Jump to subroutine long
    ASL $8C4C            ; 0E 4C 8C | Arithmetic shift left (absolute)
    LDA $5122            ; AD 22 51 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6EF
; Address: $C7AD80
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6EF:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6F1
; Address: $C7AD8F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6F1:
    JSL $C42E19          ; 22 19 2E C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    LDA $33BE            ; AD BE 33 | Load from absolute address into accumulator
    BEQ $22              ; F0 22 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6F2
; Address: $C7AD9C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6F2:
    TAY                  ; A8 | Transfer accumulator to Y register
    DEC                  ; 3A | Decrement accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    PLA                  ; 68 | Pull accumulator from stack
    LDA                  ; BF C5 AD C3 | Load from absolute long,X into accumulator
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    BEQ $0B              ; F0 0B | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6F5
; Address: $C7ADB8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6F5:
    JSR $B58E            ; 20 8E B5 | Jump to subroutine
    JMP $AD80            ; 4C 80 AD | Jump to address
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6F6
; Address: $C7ADBF
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6F6:
    JSR $ADD9            ; 20 D9 AD | Jump to subroutine
    JMP $AD80            ; 4C 80 AD | Jump to address
    ROL $3F06,X          ; 3E 06 3F | Rotate left (absolute,X)
    ASL $3A              ; 06 3A | Arithmetic shift left (zero page)
    ASL $3B              ; 06 3B | Arithmetic shift left (zero page)
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    ASL $41              ; 06 41 | Arithmetic shift left (zero page)
    ASL $3C              ; 06 3C | Arithmetic shift left (zero page)
    ASL $3D              ; 06 3D | Arithmetic shift left (zero page)
    ASL $42              ; 06 42 | Hardware register operation
    ASL $43              ; 06 43 | Arithmetic shift left (zero page)
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    CPX $1E              ; E4 1E | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6F7
; Address: $C7ADDD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6F7:
    JSL $C6769D          ; 22 9D 76 C6 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6F8
; Address: $C7ADE3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6F8:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $AE6F            ; 4C 6F AE | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_6FA
; Address: $C7ADF7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_6FA:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCC $29              ; 90 29 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_700
; Address: $C7AE27
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_700:
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    STA $BE7D            ; 8D 7D BE | Store accumulator to absolute address
    LDA $4197            ; AD 97 41 | Load from absolute address into accumulator
    BEQ $E8              ; F0 E8 | Branch if equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    STA $33B8            ; 8D B8 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_701
; Address: $C7AE38
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_701:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $BA              ; D0 BA | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $BD              ; D0 BD | Branch if not equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_703
; Address: $C7AE54
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_703:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $96              ; B0 96 | Branch if carry set
    STA $33DA            ; 8D DA 33 | Store accumulator to absolute address
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_706
; Address: $C7AE68
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_706:
    JSL $C90D2F          ; 22 2F 0D C9 | Jump to subroutine long
    BCS $BF              ; B0 BF | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_707
; Address: $C7AE6F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_707:
    STZ $33D6            ; 9C D6 33 | Store zero to absolute
    STZ $BE7D            ; 9C 7D BE | Store zero to absolute
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_708
; Address: $C7AE78
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_708:
    JSL $C455FD          ; 22 FD 55 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA $4197            ; AD 97 41 | Load from absolute address into accumulator
    BEQ $59              ; F0 59 | Branch if equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    STA $33B8            ; 8D B8 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_709
; Address: $C7AE89
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_709:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $2B              ; D0 2B | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $2E              ; D0 2E | Branch if not equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_70F
; Address: $C7AEB9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_70F:
    JSL $C90D2F          ; 22 2F 0D C9 | Jump to subroutine long
    BCS $E6              ; B0 E6 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_714
; Address: $C7AEE2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_714:
    JSL $C340F7          ; 22 F7 40 C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_715
; Address: $C7AEE8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_715:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDX #$03             ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_716
; Address: $C7AEEE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_716:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $B0FD,X          ; FE FD B0 | Increment (absolute,X)
    ORA $C0              ; 05 C0 | Logical OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $01              ; F0 01 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_717
; Address: $C7AF02
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_717:
    LDA #$1D             ; A9 1D | Load immediate value into accumulator
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    STZ $33A2            ; 9C A2 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_719
; Address: $C7AF11
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_719:
    JSL $C3226F          ; 22 6F 22 C3 | Jump to subroutine long
    AND ($12,X)          ; 21 12 | Logical AND with accumulator ((zero page,X))
    BCC $01              ; 90 01 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_71A
; Address: $C7AF1A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_71A:
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    STA $BE7D            ; 8D 7D BE | Store accumulator to absolute address
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    STA $33B8            ; 8D B8 33 | Store accumulator to absolute address
    CMP $3394            ; CD 94 33 | Compare accumulator (absolute)
    BCC $1C              ; 90 1C | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_71E
; Address: $C7AF3D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_71E:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $BE              ; B0 BE | Branch if carry set
    JMP $AF67            ; 4C 67 AF | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_71F
; Address: $C7AF47
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_71F:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $0D              ; D0 0D | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_720
; Address: $C7AF53
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_720:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    LDA $2200,Y          ; B9 00 22 | Load from absolute,Y into accumulator
    RTI                  ; 40 | Return from interrupt
    JMP $AF02            ; 4C 02 AF | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_722
; Address: $C7AF64
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_722:
    JSL $8D9BB0          ; 22 B0 9B 8D | Jump to subroutine long
    PHX                  ; DA | Push X register to stack
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    LDA $33BE            ; AD BE 33 | Load from absolute address into accumulator
    STA $33DC            ; 8D DC 33 | Store accumulator to absolute address
    LDA $33A0            ; AD A0 33 | Load from absolute address into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    CMP $3394            ; CD 94 33 | Compare accumulator (absolute)
    BCC $0A              ; 90 0A | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_723
; Address: $C7AF81
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_723:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $98              ; B0 98 | Branch if carry set
    JMP $AFAB            ; 4C AB AF | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_724
; Address: $C7AF8B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_724:
    JSL $C46951          ; 22 51 69 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BEQ $0A              ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_725
; Address: $C7AF97
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_725:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    AND $B0              ; 25 B0 | Logical AND with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $AFAB            ; 4C AB AF | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_726
; Address: $C7AFA1
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_726:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    ROL $90              ; 26 90 | Rotate left (zero page)
    JMP $AF20            ; 4C 20 AF | Jump to address
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    CMP #$1D             ; C9 1D | Compare accumulator (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    CMP #$1E             ; C9 1E | Compare accumulator (immediate)
    BEQ $1E              ; F0 1E | Branch if equal
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BEQ $1C              ; F0 1C | Branch if equal
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BEQ $1A              ; F0 1A | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_727
; Address: $C7AFC2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_727:
    CMP #$21             ; C9 21 | PPU graphics register access
    BEQ $1B              ; F0 1B | Branch if equal
    CMP #$17             ; C9 17 | Compare accumulator (immediate)
    BEQ $19              ; F0 19 | Branch if equal
    CMP #$1F             ; C9 1F | Compare accumulator (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_728
; Address: $C7AFD3
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_728:
    JMP $AFE8            ; 4C E8 AF | Jump to address
    JMP $B07D            ; 4C 7D B0 | Jump to address
    JMP $B41C            ; 4C 1C B4 | Jump to address
    JMP $B015            ; 4C 15 B0 | Jump to address
    JMP $B022            ; 4C 22 B0 | Jump to address
    JMP $B017            ; 4C 17 B0 | Jump to address
    JMP $B4DE            ; 4C DE B4 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_729
; Address: $C7AFE8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_729:
    JSL $C90C02          ; 22 02 0C C9 | Jump to subroutine long
    BCS $85              ; B0 85 | Branch if carry set
    JMP $AFF1            ; 4C F1 AF | Jump to address
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    CMP $3394            ; CD 94 33 | Compare accumulator (absolute)
    BEQ $0A              ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_72A
; Address: $C7AFF9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_72A:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    JMP $B00A            ; 4C 0A B0 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_72B
; Address: $C7B003
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_72B:
    JSL $C3305F          ; 22 5F 30 C3 | Jump to subroutine long
    LDA $2BF0            ; AD F0 2B | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $AF20            ; 4C 20 AF | Jump to address
    JMP $AF02            ; 4C 02 AF | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_72D
; Address: $C7B01B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_72D:
    JSL $C340F7          ; 22 F7 40 C3 | Jump to subroutine long
    JMP $AF20            ; 4C 20 AF | Jump to address
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_72E
; Address: $C7B025
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_72E:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BEQ $0C              ; F0 0C | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_72F
; Address: $C7B031
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_72F:
    JSL $C46951          ; 22 51 69 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BEQ $24              ; F0 24 | Branch if equal
    INX                  ; E8 | Increment X register
    CPX $3394            ; EC 94 33 | Compare X register (absolute)
    BCC $E2              ; 90 E2 | Branch if carry clear
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_731
; Address: $C7B04D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_731:
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    INX                  ; E8 | Increment X register
    CPX $3394            ; EC 94 33 | Compare X register (absolute)
    BCC $EE              ; 90 EE | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_732
; Address: $C7B058
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_732:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    LDA $4C0D,Y          ; B9 0D 4C | Load from absolute,Y into accumulator
    BCS $AD              ; B0 AD | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    STX $33D6            ; 8E D6 33 | Store X register to absolute address
    STX $BE7D            ; 8E 7D BE | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_733
; Address: $C7B06B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_733:
    JSL $C92509          ; 22 09 25 C9 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    STA $BE7D            ; 8D 7D BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_734
; Address: $C7B076
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_734:
    JSL $C340F7          ; 22 F7 40 C3 | Jump to subroutine long
    JMP $AF20            ; 4C 20 AF | Jump to address
    LDA $33A2            ; AD A2 33 | Load from absolute address into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_735
; Address: $C7B083
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_735:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $AF73            ; 4C 73 AF | Jump to address
    STA $33A2            ; 8D A2 33 | Store accumulator to absolute address
    STA $33D8            ; 8D D8 33 | Store accumulator to absolute address
    STA $BE7F            ; 8D 7F BE | Store accumulator to absolute address
    STA $7C              ; 85 7C | Store accumulator to zero page
    LDX $33D6            ; AE D6 33 | Load from absolute address into X register
    STX $78              ; 86 78 | Store X register to zero page
    LDY $33DC            ; AC DC 33 | Load from absolute address into Y register
    STY $7A              ; 84 7A | Store Y register to zero page
    LDY $33DA            ; AC DA 33 | Load from absolute address into Y register
    STY $7E              ; 84 7E | Store Y register to zero page
    CMP $3394            ; CD 94 33 | Compare accumulator (absolute)
    BCC $6A              ; 90 6A | Branch if carry clear
    CPX $3394            ; EC 94 33 | Compare X register (absolute)
    BCC $0E              ; 90 0E | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_736
; Address: $C7B0B1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_736:
    JSL $C45458          ; 22 58 54 C4 | Jump to subroutine long
    ROR $D422,X          ; 7E 22 D4 | Rotate right (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP ($B5,X)          ; C1 B5 | Compare accumulator ((zero page,X))
    JMP $B304            ; 4C 04 B3 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_737
; Address: $C7B0BF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_737:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    BCS $27              ; B0 27 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_740
; Address: $C7B0FA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_740:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_742
; Address: $C7B106
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_742:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA $2201,X          ; 1D 01 22 | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    JMP $AFF1            ; 4C F1 AF | Jump to address
    JMP $B07D            ; 4C 7D B0 | Jump to address
    STA $33B8            ; 8D B8 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_743
; Address: $C7B119
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_743:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    AND #$B0             ; 29 B0 | Logical AND with accumulator (immediate)
    STA $33DE            ; 8D DE 33 | Store accumulator to absolute address
    CPX $3394            ; EC 94 33 | Compare X register (absolute)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $B1CE            ; 4C CE B1 | Jump to address
    LDX $7E              ; A6 7E | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_744
; Address: $C7B12D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_744:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    ROR $7EC5,X          ; 7E C5 7E | Rotate right (absolute,X)
    BEQ $45              ; F0 45 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_745
; Address: $C7B138
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_745:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    SBC $69B0,X          ; FD B0 69 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_747
; Address: $C7B146
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_747:
    JSL $C453F7          ; 22 F7 53 C4 | Jump to subroutine long
    INC $D322,X          ; FE 22 D3 | Increment (absolute,X)
    CPY $FE              ; C4 FE | Compare Y register (zero page)
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_748
; Address: $C7B154
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_748:
    JSL $C45399          ; 22 99 53 C4 | Jump to subroutine long
    SBC $7B8C,X          ; FD 8C 7B | Subtract with carry (absolute,X)
    LDX $C420,Y          ; BE 20 C4 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_749
; Address: $C7B15F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_749:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_74C
; Address: $C7B17D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_74C:
    JSL $C453F7          ; 22 F7 53 C4 | Jump to subroutine long
    INC $3922,X          ; FE 22 39 | Increment (absolute,X)
    CPY $FE              ; C4 FE | Compare Y register (zero page)
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_74E
; Address: $C7B18D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_74E:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_750
; Address: $C7B1A2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_750:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    JMP $B304            ; 4C 04 B3 | Jump to address
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_751
; Address: $C7B1AC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_751:
    JSL $C44708          ; 22 08 47 C4 | Jump to subroutine long
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($AA,X)          ; 01 AA | Logical OR with accumulator ((zero page,X))
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    JMP $B258            ; 4C 58 B2 | Jump to address
    LDY $78              ; A4 78 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_752
; Address: $C7B1C6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_752:
    JSR $B3E5            ; 20 E5 B3 | Jump to subroutine
    BCS $E0              ; B0 E0 | Game work RAM access
    JMP $B258            ; 4C 58 B2 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_753
; Address: $C7B1CE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_753:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    ROR $7EC5,X          ; 7E C5 7E | Rotate right (absolute,X)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $B25B            ; 4C 5B B2 | Jump to address
    LDX $33D8            ; AE D8 33 | Load from absolute address into X register
    CPX $33D6            ; EC D6 33 | Compare X register (absolute)
    BNE $15              ; D0 15 | Branch if not equal
    CMP $7A              ; C5 7A | Compare accumulator (zero page)
    BEQ $0E              ; F0 0E | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_754
; Address: $C7B1E8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_754:
    JSL $C4497B          ; 22 7B 49 C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    BCS $D2              ; B0 D2 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_755
; Address: $C7B1F2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_755:
    JSL $C3BD64          ; 22 64 BD C3 | Jump to subroutine long
    JMP $B293            ; 4C 93 B2 | Jump to address
    LDY $7C              ; A4 7C | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_757
; Address: $C7B200
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_757:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_759
; Address: $C7B20A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_759:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    SBC $6422,X          ; FD 22 64 | Subtract with carry (absolute,X)
    LDA $22C3,X          ; BD C3 22 | Load from absolute,X into accumulator
    CPY $FE              ; C4 FE | Compare Y register (zero page)
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_75A
; Address: $C7B21F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_75A:
    JSL $C447D3          ; 22 D3 47 C4 | Jump to subroutine long
    SBC $7801,X          ; FD 01 78 | Subtract with carry (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    RTI                  ; 40 | Return from interrupt
    STY $BE7B            ; 8C 7B BE | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_75C
; Address: $C7B22E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_75C:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $15              ; F0 15 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_75D
; Address: $C7B23A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_75D:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_75F
; Address: $C7B24F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_75F:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    LDY $4C00            ; AC 00 4C | Load from absolute address into Y register
    JMP $B0F0            ; 4C F0 B0 | Jump to address
    LDX $33D8            ; AE D8 33 | Load from absolute address into X register
    CPX $33D6            ; EC D6 33 | Compare X register (absolute)
    BNE $19              ; D0 19 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_760
; Address: $C7B263
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_760:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    INC $EBB0,X          ; FE B0 EB | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_761
; Address: $C7B26D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_761:
    JSL $C44739          ; 22 39 47 C4 | Jump to subroutine long
    INC $7801,X          ; FE 01 78 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_763
; Address: $C7B27C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_763:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    INC $D2B0,X          ; FE B0 D2 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_765
; Address: $C7B28A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_765:
    JSL $C447D3          ; 22 D3 47 C4 | Jump to subroutine long
    INC $7C01,X          ; FE 01 7C | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_766
; Address: $C7B293
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_766:
    JSR $B3C4            ; 20 C4 B3 | Jump to subroutine
    LDA $33D8            ; AD D8 33 | Load from absolute address into accumulator
    CMP $33D6            ; CD D6 33 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_768
; Address: $C7B29E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_768:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $1E              ; F0 1E | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_769
; Address: $C7B2AA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_769:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_76A
; Address: $C7B2B6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_76A:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    JMP $B2E3            ; 4C E3 B2 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_76B
; Address: $C7B2BF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_76B:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $B2E3            ; 4C E3 B2 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_76C
; Address: $C7B2C8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_76C:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_76D
; Address: $C7B2D4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_76D:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    LDA $00              ; A5 00 | Load from zero page into accumulator
    JMP $B2E3            ; 4C E3 B2 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_76E
; Address: $C7B2DD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_76E:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    LDY $00              ; A4 00 | Load from zero page into Y register
    JMP $B304            ; 4C 04 B3 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_76F
; Address: $C7B2E6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_76F:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_770
; Address: $C7B2F2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_770:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    JMP $B2E3            ; 4C E3 B2 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_771
; Address: $C7B2FB
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_771:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    JMP $B2E3            ; 4C E3 B2 | Jump to address
    LDA $BE7D            ; AD 7D BE | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $BE79            ; AD 79 BE | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDX $33D8            ; AE D8 33 | Load from absolute address into X register
    STX $BE7D            ; 8E 7D BE | Store X register to absolute address
    CPX $3394            ; EC 94 33 | Compare X register (absolute)
    BCS $71              ; B0 71 | Branch if carry set
    CPX $33D6            ; EC D6 33 | Compare X register (absolute)
    BEQ $6C              ; F0 6C | Branch if equal
    LDY $33DA            ; AC DA 33 | Load from absolute address into Y register
    STY $BE79            ; 8C 79 BE | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_772
; Address: $C7B322
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_772:
    JSL $C44A72          ; 22 72 4A C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $4040,X          ; FD 40 40 | Subtract with carry (absolute,X)
    BCS $5B              ; B0 5B | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_775
; Address: $C7B339
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_775:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $4C              ; B0 4C | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $47              ; D0 47 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_776
; Address: $C7B345
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_776:
    JSL $C446D6          ; 22 D6 46 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP $33DE            ; CD DE 33 | Compare accumulator (absolute)
    BCC $03              ; 90 03 | Branch if carry clear
    STA $33DE            ; 8D DE 33 | Store accumulator to absolute address
    LDY $33DE            ; AC DE 33 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_777
; Address: $C7B357
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_777:
    JSL $C44C1B          ; 22 1B 4C C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $B0FF,X          ; FD FF B0 | Subtract with carry (absolute,X)
    BVC $1F              ; 50 1F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_77A
; Address: $C7B36D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_77A:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_77C
; Address: $C7B379
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_77C:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_77D
; Address: $C7B382
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_77D:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA $2201,Y          ; 19 01 22 | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    STA $BE7D            ; 8D 7D BE | Store accumulator to absolute address
    JMP $AFF1            ; 4C F1 AF | Jump to address
    BVS $09              ; 70 09 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_77E
; Address: $C7B399
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_77E:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $33DC            ; AD DC 33 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $33D8            ; AD D8 33 | Load from absolute address into accumulator
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    LDA $33DE            ; AD DE 33 | Load from absolute address into accumulator
    STA $33DC            ; 8D DC 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_780
; Address: $C7B3BA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_780:
    STA $33DC            ; 8D DC 33 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    JMP $B388            ; 4C 88 B3 | Jump to address
    PHA                  ; 48 | Push accumulator to stack
    LDA $78              ; A5 78 | Load from zero page into accumulator
    CMP $3394            ; CD 94 33 | Compare accumulator (absolute)
    BCS $0C              ; B0 0C | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_781
; Address: $C7B3CC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_781:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $06              ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_782
; Address: $C7B3D8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_782:
    JSL $C32209          ; 22 09 22 C3 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_783
; Address: $C7B3DE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_783:
    JSL $C32511          ; 22 11 25 C3 | Jump to subroutine long
    AND #$68             ; 29 68 | Logical AND with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_784
; Address: $C7B3E5
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_784:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_785
; Address: $C7B3E9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_785:
    JSL $C446D6          ; 22 D6 46 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $1E              ; F0 1E | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    ORA $90              ; 05 90 | Logical OR with accumulator (zero page)
    ORA $0822,Y          ; 19 22 08 | Logical OR with accumulator (absolute,Y)
    CPY $01              ; C4 01 | Compare Y register (zero page)
    SBC $18FF,X          ; FD FF 18 | Subtract with carry (absolute,X)
    ORA $AA              ; 05 AA | Logical OR with accumulator (zero page)
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_786
; Address: $C7B40B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_786:
    JSL $C4508A          ; 22 8A 50 C4 | Jump to subroutine long
    JMP $B418            ; 4C 18 B4 | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $B418            ; 4C 18 B4 | Jump to address
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_788
; Address: $C7B421
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_788:
    JSL $C44F00          ; 22 00 4F C4 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    BCC $0D              ; 90 0D | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_78D
; Address: $C7B442
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_78D:
    JSL $B01EC3          ; 22 C3 1E B0 | Jump to subroutine long
    ORA $C9              ; 05 C9 | Logical OR with accumulator (zero page)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $AF73            ; 4C 73 AF | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_78E
; Address: $C7B44F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_78E:
    JSL $C44F00          ; 22 00 4F C4 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    BVS $5C              ; 70 5C | Branch if overflow set
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator
    CMP #$1B             ; C9 1B | Compare accumulator (immediate)
    BNE $04              ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_78F
; Address: $C7B45E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_78F:
    JSL $C31631          ; 22 31 16 C3 | Jump to subroutine long
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    STA $7A              ; 85 7A | Store accumulator to zero page
    LDX $33DC            ; AE DC 33 | Load from absolute address into X register
    STX $7C              ; 86 7C | Store X register to zero page
    CMP $3394            ; CD 94 33 | Compare accumulator (absolute)
    BCS $58              ; B0 58 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_790
; Address: $C7B474
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_790:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    BCS $11              ; B0 11 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_792
; Address: $C7B482
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_792:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    JMP $AFF1            ; 4C F1 AF | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_795
; Address: $C7B499
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_795:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_797
; Address: $C7B4A5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_797:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA $2201,X          ; 1D 01 22 | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    JMP $AFF1            ; 4C F1 AF | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_798
; Address: $C7B4B2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_798:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)
    ASL $C622,X          ; 1E 22 C6 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_799
; Address: $C7B4BF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_799:
    JSL $B01EC3          ; 22 C3 1E B0 | Jump to subroutine long
    ORA $C9              ; 05 C9 | Logical OR with accumulator (zero page)
    BEQ $8D              ; F0 8D | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_79C
; Address: $C7B4D1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_79C:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    JMP $AFF1            ; 4C F1 AF | Jump to address
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_79D
; Address: $C7B4E1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_79D:
    JSL $C44FE2          ; 22 E2 4F C4 | Jump to subroutine long
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $09              ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_79E
; Address: $C7B4EC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_79E:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ASL $ADB5            ; 0E B5 AD | Arithmetic shift left (absolute)
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_79F
; Address: $C7B4FB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_79F:
    JSR $BA81            ; 20 81 BA | Jump to subroutine
    BCC $15              ; 90 15 | Branch if carry clear
    BVS $09              ; 70 09 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7A0
; Address: $C7B502
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7A0:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ASL $20B5            ; 0E B5 20 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7A1
; Address: $C7B50E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7A1:
    JSL $C340F7          ; 22 F7 40 C3 | Jump to subroutine long
    JMP $AF73            ; 4C 73 AF | Jump to address
    BVS $09              ; 70 09 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7A5
; Address: $C7B52A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7A5:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7A7
; Address: $C7B536
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7A7:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    JMP $AFF1            ; 4C F1 AF | Jump to address
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7A9
; Address: $C7B54F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7A9:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7AC
; Address: $C7B564
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7AC:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7AE
; Address: $C7B570
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7AE:
    JSL $C446D6          ; 22 D6 46 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    LDA $33DC            ; AD DC 33 | Load from absolute address into accumulator
    CMP $78              ; C5 78 | Compare accumulator (zero page)
    BCC $09              ; 90 09 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7AF
; Address: $C7B57E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7AF:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA $4C01,X          ; 1D 01 4C | Logical OR with accumulator (absolute,X)
    STA $22B5            ; 8D B5 22 | Store accumulator to absolute address
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP ($1F,X)          ; C1 1F | Compare accumulator ((zero page,X))
    ORA ($60,X)          ; 01 60 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7B1
; Address: $C7B592
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7B1:
    JSL $C66F59          ; 22 59 6F C6 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7B2
; Address: $C7B598
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7B2:
    JSL $C3226F          ; 22 6F 22 C3 | Jump to subroutine long
    BCC $01              ; 90 01 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7B4
; Address: $C7B5A3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7B4:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $08              ; D0 08 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7B6
; Address: $C7B5B6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7B6:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    STZ $22              ; 64 22 | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    BCS $D7              ; B0 D7 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7B7
; Address: $C7B5C2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7B7:
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    STA $33B8            ; 8D B8 33 | Store accumulator to absolute address
    LDX #$05             ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7B8
; Address: $C7B5CE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7B8:
    JSR $B688            ; 20 88 B6 | Jump to subroutine
    STA $3398            ; 8D 98 33 | Store accumulator to absolute address
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7B9
; Address: $C7B5D7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7B9:
    JSR $B688            ; 20 88 B6 | Jump to subroutine
    STA $339A            ; 8D 9A 33 | Store accumulator to absolute address
    LDX #$07             ; A2 07 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7BB
; Address: $C7B5E6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7BB:
    JSL $C46951          ; 22 51 69 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $21              ; D0 21 | PPU graphics register access
    LDX #$03             ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7BD
; Address: $C7B5F8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7BD:
    STA $3396            ; 8D 96 33 | Store accumulator to absolute address
    LDA $3396            ; AD 96 33 | Load from absolute address into accumulator
    BEQ $13              ; F0 13 | Branch if equal
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7BE
; Address: $C7B606
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7BE:
    JSL $C3226F          ; 22 6F 22 C3 | Jump to subroutine long
    STY $22              ; 84 22 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    BCS $86              ; B0 86 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7BF
; Address: $C7B613
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7BF:
    LDA $3398            ; AD 98 33 | Load from absolute address into accumulator
    BEQ $22              ; F0 22 | Branch if equal
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7C0
; Address: $C7B61E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7C0:
    JSL $C3226F          ; 22 6F 22 C3 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    STA $22              ; 85 22 | Store accumulator to zero page
    RTI                  ; 40 | Return from interrupt
    BCS $2C              ; B0 2C | Branch if carry set
    LDA $339A            ; AD 9A 33 | Load from absolute address into accumulator
    BNE $05              ; D0 05 | Branch if not equal
    LDA $339C            ; AD 9C 33 | Load from absolute address into accumulator
    BEQ $06              ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7C1
; Address: $C7B634
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7C1:
    JSL $C1E32E          ; 22 2E E3 C1 | Jump to subroutine long
    AND $AD00,X          ; 3D 00 AD | Logical AND with accumulator (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    BEQ $25              ; F0 25 | Branch if equal
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7C3
; Address: $C7B64B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7C3:
    JSL $C340F7          ; 22 F7 40 C3 | Jump to subroutine long
    BCC $08              ; 90 08 | Branch if carry clear
    LDA $3398            ; AD 98 33 | Load from absolute address into accumulator
    BNE $BD              ; D0 BD | Branch if not equal
    JMP $B598            ; 4C 98 B5 | Jump to address
    LDA $339C            ; AD 9C 33 | Load from absolute address into accumulator
    BEQ $06              ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7C4
; Address: $C7B65E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7C4:
    JSL $C1E32E          ; 22 2E E3 C1 | Jump to subroutine long
    AND $AD00,X          ; 3D 00 AD | Logical AND with accumulator (absolute,X)
    STZ $F033            ; 9C 33 F0 | Store zero to absolute
    ASL $07A9,X          ; 1E A9 07 | Arithmetic shift left (absolute,X)
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7C6
; Address: $C7B674
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7C6:
    JSL $C340F7          ; 22 F7 40 C3 | Jump to subroutine long
    BCC $0D              ; 90 0D | Branch if carry clear
    LDA $339A            ; AD 9A 33 | Load from absolute address into accumulator
    BNE $BB              ; D0 BB | Branch if not equal
    LDA $3398            ; AD 98 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7C7
; Address: $C7B682
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7C7:
    BNE $8F              ; D0 8F | Branch if not equal
    JMP $B598            ; 4C 98 B5 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7C9
; Address: $C7B68C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7C9:
    JSL $C45796          ; 22 96 57 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $97AD,X          ; FE AD 97 | Increment (absolute,X)
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7CB
; Address: $C7B69F
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7CB:
    JSL $C456BC          ; 22 BC 56 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $97AC,X          ; FE AC 97 | Increment (absolute,X)
    EOR ($60,X)          ; 41 60 | Exclusive OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $40F7,X          ; BD F7 40 | Load from absolute,X into accumulator
    BEQ $01              ; F0 01 | Branch if equal
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$48             ; E0 48 | Compare X register (immediate)
    BCC $F3              ; 90 F3 | Branch if carry clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    PLY                  ; 7A | Pull Y register from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7CC
; Address: $C7B6C6
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7CC:
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7CD
; Address: $C7B6C9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7CD:
    PHY                  ; 5A | Push Y register to stack
    LDX #$48             ; A2 48 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $40F7,X          ; BD F7 40 | Load from absolute,X into accumulator
    BEQ $01              ; F0 01 | Branch if equal
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$6A             ; E0 6A | Compare X register (immediate)
    BCC $F3              ; 90 F3 | Branch if carry clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    PLY                  ; 7A | Pull Y register from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7CE
; Address: $C7B6E5
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7CE:
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7CF
; Address: $C7B6E8
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7CF:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $1F              ; B0 1F | Branch if carry set
    CMP #$17             ; C9 17 | Compare accumulator (immediate)
    BEQ $1B              ; F0 1B | Branch if equal
    CMP #$6C             ; C9 6C | Compare accumulator (immediate)
    BEQ $19              ; F0 19 | Branch if equal
    CMP #$6B             ; C9 6B | Compare accumulator (immediate)
    BEQ $17              ; F0 17 | Branch if equal
    CMP #$5E             ; C9 5E | Compare accumulator (immediate)
    BEQ $15              ; F0 15 | Branch if equal
    CMP #$6D             ; C9 6D | Compare accumulator (immediate)
    BEQ $13              ; F0 13 | Branch if equal
    CMP #$6E             ; C9 6E | Compare accumulator (immediate)
    BEQ $11              ; F0 11 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7D0
; Address: $C7B70F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7D0:
    JMP $B820            ; 4C 20 B8 | Jump to address
    JMP $BBF2            ; 4C F2 BB | Jump to address
    JMP $B721            ; 4C 21 B7 | Jump to address
    JMP $B7FF            ; 4C FF B7 | Jump to address
    JMP $B736            ; 4C 36 B7 | Jump to address
    JMP $B792            ; 4C 92 B7 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7D1
; Address: $C7B721
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7D1:
    JSL $C91F27          ; 22 27 1F C9 | Jump to subroutine long
    BCS $C1              ; B0 C1 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7D2
; Address: $C7B728
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7D2:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $11              ; D0 11 | Branch if not equal
    JMP $B78F            ; 4C 8F B7 | Jump to address
    STZ $33D6            ; 9C D6 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7D3
; Address: $C7B739
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7D3:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $0A              ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7D4
; Address: $C7B744
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7D4:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $44              ; B0 44 | Branch if carry set
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7D5
; Address: $C7B74E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7D5:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7D6
; Address: $C7B759
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7D6:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $C8              ; B0 C8 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $C3              ; D0 C3 | Branch if not equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    BEQ $08              ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7D9
; Address: $C7B772
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7D9:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    BMI $07              ; 30 07 | Branch if negative

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7DB
; Address: $C7B782
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7DB:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BCS $01              ; B0 01 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7DD
; Address: $C7B792
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7DD:
    JSL $C3305F          ; 22 5F 30 C3 | Jump to subroutine long
    LDA $2BF0            ; AD F0 2B | Load from absolute address into accumulator
    BNE $09              ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7DF
; Address: $C7B7A4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7DF:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $51              ; B0 51 | Branch if carry set
    CMP #$99             ; C9 99 | Compare accumulator (immediate)
    BEQ $21              ; F0 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7E0
; Address: $C7B7B0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7E0:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)
    ORA $C622,X          ; 1D 22 C6 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7E1
; Address: $C7B7BD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7E1:
    JSL $B01DC3          ; 22 C3 1D B0 | Jump to subroutine long
    SEP #$C9             ; E2 C9 | Set processor status bits
    BNE $DD              ; D0 DD | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7E2
; Address: $C7B7C7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7E2:
    JSL $C454B4          ; 22 B4 54 C4 | Jump to subroutine long
    STZ $33F6            ; 9C F6 33 | Store zero to absolute
    JMP $B7EF            ; 4C EF B7 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7E3
; Address: $C7B7D1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7E3:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    AND $2201,Y          ; 39 01 22 | Logical AND with accumulator (absolute,Y)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)
    ORA $C622,X          ; 1D 22 C6 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7E4
; Address: $C7B7DE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7E4:
    JSL $B01DC3          ; 22 C3 1D B0 | Jump to subroutine long
    CMP ($C9,X)          ; C1 C9 | Compare accumulator ((zero page,X))
    BNE $BC              ; D0 BC | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7E6
; Address: $C7B7EF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7E6:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BCS $01              ; B0 01 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7E9
; Address: $C7B807
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7E9:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    EOR #$B0             ; 49 B0 | Exclusive OR with accumulator (immediate)
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    AND $FFC4            ; 2D C4 FF | Logical AND with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7EB
; Address: $C7B817
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7EB:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    BEQ $F4              ; F0 F4 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7EC
; Address: $C7B820
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7EC:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    BEQ $07              ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7ED
; Address: $C7B829
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7ED:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    ROR $B0              ; 66 B0 | Rotate right (zero page)
    CPX $8D              ; E4 8D | Compare X register (zero page)
    STA $33B8            ; 8D B8 33 | Store accumulator to absolute address
    STA $BE7D            ; 8D 7D BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7EE
; Address: $C7B839
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7EE:
    JSL $C44708          ; 22 08 47 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $A422,X          ; FE 22 A4 | Increment (absolute,X)
    LSR $C4              ; 46 C4 | Logical shift right (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $B28E,X          ; FD 8E B2 | Subtract with carry (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $2BB2            ; 6D B2 2B | Add with carry (absolute)
    STA $2BB4            ; 8D B4 2B | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7F1
; Address: $C7B85B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7F1:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    ADC $00A9            ; 6D A9 00 | Add with carry (absolute)
    STA $33DA            ; 8D DA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7F3
; Address: $C7B869
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7F3:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    JMP ($A7B0)          ; 6C B0 A7 | Jump to address (absolute indirect)
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7F4
; Address: $C7B873
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7F4:
    JSR $BA81            ; 20 81 BA | Jump to subroutine
    BCC $08              ; 90 08 | Branch if carry clear
    BVS $0E              ; 70 0E | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7F5
; Address: $C7B87A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7F5:
    JSR $B986            ; 20 86 B9 | Jump to subroutine
    JMP $B85B            ; 4C 5B B8 | Jump to address
    BVC $09              ; 50 09 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7FB
; Address: $C7B89B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7FB:
    JSL $A96EC3          ; 22 C3 6E A9 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $33DA            ; 8D DA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7FC
; Address: $C7B8A4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7FC:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    ADC $B0B0            ; 6D B0 B0 | Add with carry (absolute)
    LDX #$02             ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7FD
; Address: $C7B8AE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7FD:
    JSR $BA81            ; 20 81 BA | Jump to subroutine
    BCC $08              ; 90 08 | Branch if carry clear
    BVS $0E              ; 70 0E | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_7FE
; Address: $C7B8B5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_7FE:
    JSR $B986            ; 20 86 B9 | Jump to subroutine
    JMP $B899            ; 4C 99 B8 | Jump to address
    BVC $09              ; 50 09 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_805
; Address: $C7B8DF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_805:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    ROR $B3B0            ; 6E B0 B3 | Rotate right (absolute)
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_806
; Address: $C7B8E9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_806:
    JSR $BA81            ; 20 81 BA | Jump to subroutine
    BCC $08              ; 90 08 | Branch if carry clear
    BVS $0E              ; 70 0E | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_807
; Address: $C7B8F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_807:
    JSR $B986            ; 20 86 B9 | Jump to subroutine
    JMP $B8D4            ; 4C D4 B8 | Jump to address
    BVC $09              ; 50 09 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_80E
; Address: $C7B91A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_80E:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $B3              ; B0 B3 | Branch if carry set
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_80F
; Address: $C7B924
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_80F:
    JSR $BA81            ; 20 81 BA | Jump to subroutine
    BCC $08              ; 90 08 | Branch if carry clear
    BVS $0E              ; 70 0E | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_810
; Address: $C7B92B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_810:
    JSR $B986            ; 20 86 B9 | Jump to subroutine
    JMP $B90F            ; 4C 0F B9 | Jump to address
    BVC $09              ; 50 09 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_815
; Address: $C7B945
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_815:
    JSL $C32569          ; 22 69 25 C3 | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $33DA            ; 8D DA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_816
; Address: $C7B950
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_816:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BVS $B0              ; 70 B0 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    LDX #$08             ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_817
; Address: $C7B95A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_817:
    JSR $BA81            ; 20 81 BA | Jump to subroutine
    BCC $08              ; 90 08 | Branch if carry clear
    BVS $0E              ; 70 0E | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_818
; Address: $C7B961
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_818:
    JSR $B986            ; 20 86 B9 | Jump to subroutine
    JMP $B94A            ; 4C 4A B9 | Jump to address
    BVC $09              ; 50 09 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_81D
; Address: $C7B97B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_81D:
    JSL $C340F7          ; 22 F7 40 C3 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $B817            ; 4C 17 B8 | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_81E
; Address: $C7B986
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_81E:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_81F
; Address: $C7B98B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_81F:
    JSL $C44708          ; 22 08 47 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    TAX                  ; AA | Transfer accumulator to X register
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_821
; Address: $C7B9A6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_821:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_822
; Address: $C7B9B0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_822:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    BCS $2A              ; B0 2A | Branch if carry set
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_825
; Address: $C7B9C2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_825:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BCS $58              ; B0 58 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_826
; Address: $C7B9CC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_826:
    JSR $BAD1            ; 20 D1 BA | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_827
; Address: $C7B9D4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_827:
    JSL $C44708          ; 22 08 47 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    TAX                  ; AA | Transfer accumulator to X register
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_82A
; Address: $C7B9F4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_82A:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_82E
; Address: $C7BA0A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_82E:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA $4C01,X          ; 1D 01 4C | Logical OR with accumulator (absolute,X)
    ORA $22BA,Y          ; 19 BA 22 | Logical OR with accumulator (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP ($1F,X)          ; C1 1F | Compare accumulator ((zero page,X))
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    LDY $22B9            ; AC B9 22 | Load from absolute address into Y register
    SBC #$BA             ; E9 BA | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_833
; Address: $C7BA36
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_833:
    JSR $BAD1            ; 20 D1 BA | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_834
; Address: $C7BA3E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_834:
    JSL $C44708          ; 22 08 47 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    TAX                  ; AA | Transfer accumulator to X register
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_837
; Address: $C7BA5E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_837:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_83A
; Address: $C7BA6F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_83A:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    LDY $22B9            ; AC B9 22 | Load from absolute address into Y register
    SBC #$BA             ; E9 BA | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_83E
; Address: $C7BA89
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_83E:
    PHX                  ; DA | Push X register to stack
    CMP #$74             ; C9 74 | Compare accumulator (immediate)
    BEQ $0D              ; F0 0D | Branch if equal
    LDX $33D6            ; AE D6 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_83F
; Address: $C7BA92
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_83F:
    JSL $C44C1B          ; 22 1B 4C C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $60FA,X          ; FD FA 60 | Subtract with carry (absolute,X)
    LDA                  ; BF CE BB C3 | Load from absolute long,X into accumulator
    LDX $33D6            ; AE D6 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_840
; Address: $C7BAA3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_840:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BCS $16              ; B0 16 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_842
; Address: $C7BAB0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_842:
    JSL $C44D5E          ; 22 5E 4D C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $0990,X          ; FD 90 09 | Subtract with carry (absolute,X)
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_844
; Address: $C7BAC0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_844:
    JSR $B9CF            ; 20 CF B9 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF BF 83 01 | Load from absolute long,X into accumulator
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_845
; Address: $C7BAD1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_845:
    PHX                  ; DA | Push X register to stack
    SEP #$20             ; E2 20 | Set processor status bits
    LDX $2BB2            ; AE B2 2B | Load from absolute address into X register
    CMP $0000,X          ; DD 00 00 | Compare accumulator (absolute,X)
    BEQ $04              ; F0 04 | Branch if equal
    INX                  ; E8 | Increment X register
    JMP $BAD7            ; 4C D7 BA | Jump to address
    REP #$20             ; C2 20 | Reset processor status bits
    TXA                  ; 8A | Transfer X register to accumulator
    SEC                  ; 38 | Set carry flag
    SBC $2BB2            ; ED B2 2B | Subtract with carry (absolute)
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_846
; Address: $C7BAE9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_846:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_847
; Address: $C7BAF2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_847:
    JSR $BB91            ; 20 91 BB | Jump to subroutine
    STY $2BCE            ; 8C CE 2B | Store Y register to absolute address
    STA $2BBA            ; 8D BA 2B | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_848
; Address: $C7BAFE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_848:
    JSR $BB91            ; 20 91 BB | Jump to subroutine
    STY $2BD0            ; 8C D0 2B | Store Y register to absolute address
    STA $2BBC            ; 8D BC 2B | Store accumulator to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_849
; Address: $C7BB0A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_849:
    JSR $BB91            ; 20 91 BB | Jump to subroutine
    STY $2BD2            ; 8C D2 2B | Store Y register to absolute address
    STA $2BBE            ; 8D BE 2B | Store accumulator to absolute address
    LDA #$06             ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_84A
; Address: $C7BB16
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_84A:
    JSR $BB91            ; 20 91 BB | Jump to subroutine
    STY $2BD4            ; 8C D4 2B | Store Y register to absolute address
    STA $2BC0            ; 8D C0 2B | Store accumulator to absolute address
    LDA #$08             ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_84B
; Address: $C7BB22
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_84B:
    JSR $BB91            ; 20 91 BB | Jump to subroutine
    STY $2BD6            ; 8C D6 2B | Store Y register to absolute address
    STA $2BC2            ; 8D C2 2B | Store accumulator to absolute address
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    STZ $2BC4            ; 9C C4 2B | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_84D
; Address: $C7BB34
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_84D:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $B0FE,X          ; FE FE B0 | Increment (absolute,X)
    INC $2BC4            ; EE C4 2B | Increment (absolute)
    STZ $2BC6            ; 9C C6 2B | Store zero to absolute
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_84E
; Address: $C7BB47
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_84E:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $B0FE,X          ; FE FE B0 | Increment (absolute,X)
    INC $2BC6            ; EE C6 2B | Increment (absolute)
    STZ $2BC8            ; 9C C8 2B | Store zero to absolute
    LDX #$02             ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_84F
; Address: $C7BB5A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_84F:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $B0FE,X          ; FE FE B0 | Increment (absolute,X)
    INC $2BC8            ; EE C8 2B | Increment (absolute)
    STZ $2BCA            ; 9C CA 2B | Store zero to absolute
    LDX #$03             ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_850
; Address: $C7BB6D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_850:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $B0FE,X          ; FE FE B0 | Increment (absolute,X)
    INC $2BCA            ; EE CA 2B | Increment (absolute)
    STZ $2BCC            ; 9C CC 2B | Store zero to absolute
    LDX #$04             ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_851
; Address: $C7BB80
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_851:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $B0FE,X          ; FE FE B0 | Increment (absolute,X)
    INC $2BCC            ; EE CC 2B | Increment (absolute)
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_852
; Address: $C7BB91
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_852:
    PHX                  ; DA | Push X register to stack
    STZ $2BB6            ; 9C B6 2B | Store zero to absolute
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF CE BB C3 | Load from absolute long,X into accumulator
    STA $2BB8            ; 8D B8 2B | Store accumulator to absolute address
    LDX $2BB2            ; AE B2 2B | Load from absolute address into X register
    CPX $2BB4            ; EC B4 2B | Compare X register (absolute)
    BCS $22              ; B0 22 | Branch if carry set
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_853
; Address: $C7BBAC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_853:
    JSL $C44FE2          ; 22 E2 4F C4 | Jump to subroutine long
    CMP $2BB8            ; CD B8 2B | Compare accumulator (absolute)
    BNE $0D              ; D0 0D | Branch if not equal
    TXA                  ; 8A | Transfer X register to accumulator
    SEC                  ; 38 | Set carry flag
    SBC $2BB2            ; ED B2 2B | Subtract with carry (absolute)
    STA $2BD8,Y          ; 99 D8 2B | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_854
; Address: $C7BBBF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_854:
    INC $2BB6            ; EE B6 2B | Increment (absolute)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    JMP $BBA1            ; 4C A1 BB | Jump to address
    LDA $2BB6            ; AD B6 2B | Load from absolute address into accumulator
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_856
; Address: $C7BBDB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_856:
    JSL $C31AFC          ; 22 FC 1A C3 | Jump to subroutine long
    BCC $10              ; 90 10 | Branch if carry clear
    LDY $2818,X          ; BC 18 28 | Load from absolute,X into Y register
    LDA #$7F             ; A9 7F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_857
; Address: $C7BBE7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_857:
    JSL $C31AFC          ; 22 FC 1A C3 | Jump to subroutine long
    BCC $04              ; 90 04 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $2818,X          ; 9D 18 28 | Store accumulator to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_858
; Address: $C7BBF2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_858:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $0D              ; D0 0D | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_85A
; Address: $C7BC01
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_85A:
    JSR $2201            ; 20 01 22 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    JMP $B6E8            ; 4C E8 B6 | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $2BE2            ; 8D E2 2B | Store accumulator to absolute address
    STA $2BE6            ; 8D E6 2B | Store accumulator to absolute address
    STZ $2BE4            ; 9C E4 2B | Store zero to absolute
    LDX #$00             ; A2 00 | Load immediate value into X register
    TXA                  ; 8A | Transfer X register to accumulator
    STA $2BB2,X          ; 9D B2 2B | Store accumulator to absolute,X
    STA $2BD2,X          ; 9D D2 2B | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC                  ; 1A | Increment accumulator
    CMP $2BE2            ; CD E2 2B | Compare accumulator (absolute)
    BCC $F2              ; 90 F2 | Branch if carry clear
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_85B
; Address: $C7BC2C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_85B:
    JSL $C32359          ; 22 59 23 C3 | Jump to subroutine long
    ROR                  ; 6A | Rotate right (accumulator)
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_85C
; Address: $C7BC32
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_85C:
    JSL $C3226F          ; 22 6F 22 C3 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    ADC #$90             ; 69 90 | Add with carry (immediate)
    DEC                  ; 3A | Decrement accumulator
    LDX $2BE4            ; AE E4 2B | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_85D
; Address: $C7BC3D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_85D:
    BEQ $32              ; F0 32 | Branch if equal
    LDA $2BC0,X          ; BD C0 2B | Load from absolute,X into accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_85E
; Address: $C7BC43
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_85E:
    JSR $BCE6            ; 20 E6 BC | Jump to subroutine
    STY $78              ; 84 78 | Store Y register to zero page
    LDX $2BE6            ; AE E6 2B | Load from absolute address into X register
    LDA $2BD0,X          ; BD D0 2B | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_85F
; Address: $C7BC4E
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_85F:
    JSR $BCE6            ; 20 E6 BC | Jump to subroutine
    CPY $78              ; C4 78 | Compare Y register (zero page)
    BCC $07              ; 90 07 | Branch if carry clear
    STA $2BD2,X          ; 9D D2 2B | Store accumulator to absolute,X
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BNE $EF              ; D0 EF | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    STA $2BD2,X          ; 9D D2 2B | Store accumulator to absolute,X
    INC $2BE6            ; EE E6 2B | Increment (absolute)
    INC $2BE6            ; EE E6 2B | Increment (absolute)
    DEC $2BE4            ; CE E4 2B | Decrement (absolute)
    DEC $2BE4            ; CE E4 2B | Decrement (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    JMP $BC29            ; 4C 29 BC | Jump to address
    JMP $B6E8            ; 4C E8 B6 | Jump to address
    STA $78              ; 85 78 | Store accumulator to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDY $2BE4            ; AC E4 2B | Load from absolute address into Y register
    LDA $2BD2,X          ; BD D2 2B | Load from absolute,X into accumulator
    STA $2BC2,Y          ; 99 C2 2B | Store accumulator to absolute,Y
    LDA $2BD4,X          ; BD D4 2B | Load from absolute,X into accumulator
    STA $2BD2,X          ; 9D D2 2B | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX $2BE6            ; EC E6 2B | Compare X register (absolute)
    BCC $F3              ; 90 F3 | Branch if carry clear
    DEC $2BE6            ; CE E6 2B | Decrement (absolute)
    DEC $2BE6            ; CE E6 2B | Decrement (absolute)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    STY $2BE4            ; 8C E4 2B | Store Y register to absolute address
    CPY $2BE2            ; CC E2 2B | Compare Y register (absolute)
    BCS $0E              ; B0 0E | Branch if carry set
    LDA $78              ; A5 78 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $2BE6            ; CD E6 2B | Compare accumulator (absolute)
    BCC $02              ; 90 02 | Branch if carry clear
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_860
; Address: $C7BCA9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_860:
    JMP $BC29            ; 4C 29 BC | Jump to address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $2BC2,X          ; BD C2 2B | Load from absolute,X into accumulator
    STA $4054,X          ; 9D 54 40 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $F3              ; 90 F3 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_862
; Address: $C7BCC0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_862:
    JSL $C3BD64          ; 22 64 BD C3 | Jump to subroutine long
    LDX #$00             ; A2 00 | Load immediate value into X register
    TXA                  ; 8A | Transfer X register to accumulator
    STA $2BC2,X          ; 9D C2 2B | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC                  ; 1A | Increment accumulator
    CPX $2BE4            ; EC E4 2B | Compare X register (absolute)
    BCC $F5              ; 90 F5 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_863
; Address: $C7BCD3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_863:
    JSL $C32359          ; 22 59 23 C3 | Jump to subroutine long
    ROR                  ; 6A | Rotate right (accumulator)
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_864
; Address: $C7BCD9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_864:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    ADC #$22             ; 69 22 | Add with carry (immediate)
    RTI                  ; 40 | Return from interrupt
    BCS $8D              ; B0 8D | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_865
; Address: $C7BCE6
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_865:
    PHA                  ; 48 | Push accumulator to stack
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CMP $2BB2,Y          ; D9 B2 2B | Compare accumulator (absolute,Y)
    BEQ $07              ; F0 07 | Branch if equal
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY $2BE2            ; CC E2 2B | Compare Y register (absolute)
    BCC $F4              ; 90 F4 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_866
; Address: $C7BCFB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_866:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    CPX #$04             ; E0 04 | Compare X register (immediate)
    BCS $0B              ; B0 0B | Branch if carry set
    LDA                  ; BF 13 BD C3 | Load from absolute long,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_869
; Address: $C7BD16
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_869:
    ORA ($48),Y          ; 11 48 | Logical OR with accumulator ((zero page),Y)
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $78              ; 85 78 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_86A
; Address: $C7BD1D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_86A:
    JSL $C44708          ; 22 08 47 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_86B
; Address: $C7BD25
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_86B:
    JSL $C446D6          ; 22 D6 46 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    STA $7A              ; 85 7A | Store accumulator to zero page
    CLC                  ; 18 | Clear carry flag
    ORA ($AA,X)          ; 01 AA | Logical OR with accumulator ((zero page,X))
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $1D              ; F0 1D | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_86D
; Address: $C7BD49
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_86D:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_86E
; Address: $C7BD51
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_86E:
    JSL $C45399          ; 22 99 53 C4 | Jump to subroutine long
    JMP $BD3B            ; 4C 3B BD | Jump to address
    INC $7A              ; E6 7A | Increment (zero page)
    INX                  ; E8 | Increment X register
    CPX $7C              ; E4 7C | Compare X register (zero page)
    BCC $DB              ; 90 DB | Branch if carry clear
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_86F
; Address: $C7BD64
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_86F:
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
; Bank0E_DmaFunction_870
; Address: $C7BD70
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_870:
    JSL $C62DD5          ; 22 D5 2D C6 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_874
; Address: $C7BD85
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_874:
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
; Bank0E_DmaFunction_878
; Address: $C7BD9D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_878:
    JSL $C3BEF4          ; 22 F4 BE C3 | Jump to subroutine long
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF E6 BD C3 | Load from absolute long,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_879
; Address: $C7BDA9
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_879:
    JSL $C3165B          ; 22 5B 16 C3 | Jump to subroutine long
    BCS $EE              ; B0 EE | Branch if carry set
    CMP #$55             ; C9 55 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BDEA            ; 4C EA BD | Jump to address
    CMP #$56             ; C9 56 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BE61            ; 4C 61 BE | Jump to address
    CMP #$57             ; C9 57 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BE78            ; 4C 78 BE | Jump to address
    CMP #$58             ; C9 58 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BE9A            ; 4C 9A BE | Jump to address
    CMP #$59             ; C9 59 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $BED6            ; 4C D6 BE | Jump to address
    JMP $BD9D            ; 4C 9D BD | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_87A
; Address: $C7BDDA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_87A:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_87B
; Address: $C7BDE7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_87B:
    LSR $46              ; 46 46 | Logical shift right (zero page)
    EOR $22              ; 45 22 | Exclusive OR with accumulator (zero page)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_87E
; Address: $C7BDF7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_87E:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    BCS $EC              ; B0 EC | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_885
; Address: $C7BE22
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_885:
    JSL $C3C3D5          ; 22 D5 C3 C3 | Jump to subroutine long
    STA $405F            ; 8D 5F 40 | Store accumulator to absolute address
    LDA #$0B             ; A9 0B | Load immediate value into accumulator
    STA $4061            ; 8D 61 40 | Store accumulator to absolute address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_886
; Address: $C7BE35
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_886:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    BCS $DF              ; B0 DF | Branch if carry set
    STA $4067            ; 8D 67 40 | Store accumulator to absolute address
    LDA #$61             ; A9 61 | Load immediate value into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_88A
; Address: $C7BE57
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_88A:
    JSL $C45E67          ; 22 67 5E C4 | Jump to subroutine long
    JMP $BDDA            ; 4C DA BD | Jump to address
    JMP $BD9D            ; 4C 9D BD | Jump to address
    LDA $40AB            ; AD AB 40 | Load from absolute address into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_88B
; Address: $C7BE67
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_88B:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    BCS $F0              ; B0 F0 | Branch if carry set
    STA $78              ; 85 78 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_88C
; Address: $C7BE70
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_88C:
    JSL $C46177          ; 22 77 61 C4 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    JMP $BDDA            ; 4C DA BD | Jump to address
    LDA $40AB            ; AD AB 40 | Load from absolute address into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_88E
; Address: $C7BE82
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_88E:
    PHA                  ; 48 | Push accumulator to stack
    BCS $D9              ; B0 D9 | Branch if carry set
    STA $78              ; 85 78 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_891
; Address: $C7BE91
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_891:
    JSL $C3C044          ; 22 44 C0 C3 | Jump to subroutine long
    BCS $F0              ; B0 F0 | Branch if carry set
    JMP $BE5E            ; 4C 5E BE | Jump to address
    STZ $33BA            ; 9C BA 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_892
; Address: $C7BE9D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_892:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    BCS $BA              ; B0 BA | Branch if carry set
    STA $78              ; 85 78 | Store accumulator to zero page
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    INC                  ; 1A | Increment accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_893
; Address: $C7BEAD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_893:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)
    JMP $C622            ; 4C 22 C6 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_894
; Address: $C7BEBA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_894:
    JSL $B04CC3          ; 22 C3 4C B0 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $D6              ; D0 D6 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_896
; Address: $C7BEC9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_896:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    JMP $BD91            ; 4C 91 BD | Jump to address
    STZ $33BA            ; 9C BA 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_897
; Address: $C7BED9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_897:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    BCS $B7              ; B0 B7 | Branch if carry set
    STA $78              ; 85 78 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_898
; Address: $C7BEE2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_898:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $ED              ; B0 ED | Branch if carry set
    STA $7A              ; 85 7A | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_899
; Address: $C7BEEB
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_899:
    JSL $C463F9          ; 22 F9 63 C4 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    JMP $BD91            ; 4C 91 BD | Jump to address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $4069            ; AD 69 40 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $01              ; D0 01 | Branch if not equal
    INX                  ; E8 | Increment X register
    LDA $406B            ; AD 6B 40 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_89A
; Address: $C7BF06
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_89A:
    BNE $01              ; D0 01 | Branch if not equal
    INX                  ; E8 | Increment X register
    LDA $406D            ; AD 6D 40 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $01              ; D0 01 | Branch if not equal
    INX                  ; E8 | Increment X register
    TXA                  ; 8A | Transfer X register to accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_89B
; Address: $C7BF14
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_89B:
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    TAX                  ; AA | Transfer accumulator to X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $4069            ; AD 69 40 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    DEX                  ; CA | Decrement X register
    BMI $19              ; 30 19 | Branch if negative
    INY                  ; C8 | Increment Y register
    LDA $406B            ; AD 6B 40 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    DEX                  ; CA | Decrement X register
    BMI $0D              ; 30 0D | Branch if negative
    INY                  ; C8 | Increment Y register
    LDA $406D            ; AD 6D 40 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    DEX                  ; CA | Decrement X register
    BMI $01              ; 30 01 | Branch if negative
    INY                  ; C8 | Increment Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_89C
; Address: $C7BF42
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_89C:
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    TAX                  ; AA | Transfer accumulator to X register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDA $4069            ; AD 69 40 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    DEX                  ; CA | Decrement X register
    BMI $19              ; 30 19 | Branch if negative
    INY                  ; C8 | Increment Y register
    LDA $406B            ; AD 6B 40 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    DEX                  ; CA | Decrement X register
    BMI $0D              ; 30 0D | Branch if negative
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_89D
; Address: $C7BF60
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_89D:
    LDA $406D            ; AD 6D 40 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    DEX                  ; CA | Decrement X register
    BMI $01              ; 30 01 | Branch if negative
    INY                  ; C8 | Increment Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_89E
; Address: $C7BF70
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_89E:
    STZ $78              ; 64 78 | Store zero to zero page
    LDA $4069            ; AD 69 40 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $27              ; D0 27 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8A1
; Address: $C7BF84
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8A1:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8A5
; Address: $C7BF9D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8A5:
    JSL $C340F7          ; 22 F7 40 C3 | Jump to subroutine long
    INC $78              ; E6 78 | Increment (zero page)
    LDA $406B            ; AD 6B 40 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $27              ; D0 27 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8A8
; Address: $C7BFB5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8A8:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8AC
; Address: $C7BFCE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8AC:
    JSL $C340F7          ; 22 F7 40 C3 | Jump to subroutine long
    INC $78              ; E6 78 | Increment (zero page)
    LDA $406D            ; AD 6D 40 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $27              ; D0 27 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8B5
; Address: $C7C004
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8B5:
    PHX                  ; DA | Push X register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 11 C0 C3 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    PLX                  ; FA | Pull X register from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8B6
; Address: $C7C011
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8B6:
    STA ($40,X)          ; 81 40 | Store accumulator to (zero page,X)
    RTI                  ; 40 | Return from interrupt
    STA $40              ; 85 40 | Store accumulator to zero page
    PHX                  ; DA | Push X register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 24 C0 C3 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    PLX                  ; FA | Pull X register from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8B7
; Address: $C7C025
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8B7:
    RTI                  ; 40 | Return from interrupt
    BIT #$40             ; 89 40 | Test bits in accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    RTI                  ; 40 | Return from interrupt
    LDA $78              ; A5 78 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8B9
; Address: $C7C033
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8B9:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    BCS $09              ; B0 09 | Branch if carry set
    STA $7A              ; 85 7A | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8BA
; Address: $C7C03C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8BA:
    JSL $C46606          ; 22 06 66 C4 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8BC
; Address: $C7C046
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8BC:
    JSL $C3C017          ; 22 17 C0 C3 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $06              ; F0 06 | Branch if equal
    LDA #$62             ; A9 62 | Load immediate value into accumulator
    JMP $C058            ; 4C 58 C0 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8C0
; Address: $C7C067
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8C0:
    JSL $C46678          ; 22 78 66 C4 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8C1
; Address: $C7C06F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8C1:
    CMP #$61             ; C9 61 | Compare accumulator (immediate)
    BEQ $06              ; F0 06 | Branch if equal
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    JMP $C07D            ; 4C 7D C0 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8C2
; Address: $C7C07E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8C2:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $2BB2            ; 8D B2 2B | Store accumulator to absolute address
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    LDA $2BB2            ; AD B2 2B | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8C6
; Address: $C7C0B0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8C6:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $34              ; B0 34 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $2F              ; D0 2F | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8C8
; Address: $C7C0C4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8C8:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    LDA $40AB            ; AD AB 40 | Load from absolute address into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8C9
; Address: $C7C0CE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8C9:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BVC $22              ; 50 22 | Branch if overflow clear
    DEC $22              ; C6 22 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8CB
; Address: $C7C0DE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8CB:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    JMP $C1C9            ; 4C C9 C1 | Jump to address
    LDA                  ; BF ED C1 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8CC
; Address: $C7C0EF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8CC:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    JMP $C17D            ; 4C 7D C1 | Jump to address
    CMP $40AB            ; CD AB 40 | Compare accumulator (absolute)
    BNE $2E              ; D0 2E | Branch if not equal
    LDY $33A0            ; AC A0 33 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8CE
; Address: $C7C106
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8CE:
    JSL $C42C2C          ; 22 2C 2C C4 | Jump to subroutine long
    SBC $4E22,X          ; FD 22 4E | Subtract with carry (absolute,X)
    CPY $FF              ; C4 FF | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8D3
; Address: $C7C129
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8D3:
    JSL $C3C300          ; 22 00 C3 C3 | Jump to subroutine long
    BCS $CC              ; B0 CC | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8D4
; Address: $C7C130
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8D4:
    JSL $C3C31F          ; 22 1F C3 C3 | Jump to subroutine long
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA                  ; BF 01 C2 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8D7
; Address: $C7C150
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8D7:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    BCS $41              ; B0 41 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $3C              ; D0 3C | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP $C0FB            ; 4C FB C0 | Jump to address
    LDA                  ; BF 0B C2 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8DA
; Address: $C7C16E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8DA:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $40              ; B0 40 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $3B              ; D0 3B | Branch if not equal
    JMP $C1D1            ; 4C D1 C1 | Jump to address
    LDA                  ; BF 15 C2 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8DD
; Address: $C7C18A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8DD:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $0B              ; B0 0B | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $06              ; D0 06 | Branch if not equal
    JMP $C1D1            ; 4C D1 C1 | Jump to address
    JMP $C0BC            ; 4C BC C0 | Jump to address
    LDA                  ; BF 1F C2 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8E0
; Address: $C7C1A9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8E0:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $E9              ; B0 E9 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $E4              ; D0 E4 | Branch if not equal
    LDA                  ; BF 33 C2 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8E5
; Address: $C7C1CD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8E5:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8E6
; Address: $C7C1DA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8E6:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND #$0A             ; 29 0A | Logical AND with accumulator (immediate)
    EOR $180A            ; 4D 0A 18 | Exclusive OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $3D0A,Y          ; 19 0A 3D | Logical OR with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8E7
; Address: $C7C1FC
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8E7:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR $620A            ; 4E 0A 62 | Logical shift right (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $2B0A,X          ; 3E 0A 2B | Rotate left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $1B0A            ; 2C 0A 1B | Test bits in accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $1C0A            ; 2D 0A 1C | Logical AND with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $410A,X          ; 1D 0A 41 | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $500A            ; 2E 0A 50 | Rotate left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1E0A,X          ; 1D 0A 1E | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    WDM #$0A             ; 42 0A | Reserved instruction
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR ($0A),Y          ; 51 0A | Exclusive OR with accumulator ((zero page),Y)
    ASL $200A,X          ; 1E 0A 20 | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($0A),Y          ; 31 0A | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8E8
; Address: $C7C239
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8E8:
    JSR $200A            ; 20 0A 20 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $0A              ; 25 0A | Logical AND with accumulator (zero page)
    EOR #$0A             ; 49 0A | Exclusive OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $0A              ; 25 0A | Logical AND with accumulator (zero page)
    AND $0A              ; 25 0A | Logical AND with accumulator (zero page)
    ROL $0A              ; 26 0A | Rotate left (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $0A              ; 26 0A | Rotate left (zero page)
    ROL $0A              ; 26 0A | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8E9
; Address: $C7C255
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8E9:
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $2BB2            ; 8D B2 2B | Store accumulator to absolute address
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF F6 C2 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8EC
; Address: $C7C276
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8EC:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $61              ; B0 61 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $5C              ; D0 5C | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8EE
; Address: $C7C28A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8EE:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    LDA $40AB            ; AD AB 40 | Load from absolute address into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8EF
; Address: $C7C294
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8EF:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BVC $22              ; 50 22 | Branch if overflow clear
    DEC $22              ; C6 22 | Decrement (zero page)
    BVC $90              ; 50 90 | Branch if overflow clear
    LDA                  ; BF FE C2 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8F0
; Address: $C7C2A4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8F0:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    JMP $C2DE            ; 4C DE C2 | Jump to address
    LDY $33A0            ; AC A0 33 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8F2
; Address: $C7C2B6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8F2:
    JSL $C42C2C          ; 22 2C 2C C4 | Jump to subroutine long
    SBC $4E22,X          ; FD 22 4E | Subtract with carry (absolute,X)
    CPY $FF              ; C4 FF | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8FA
; Address: $C7C2EA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8FA:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8FB
; Address: $C7C2F2
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8FB:
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8FC
; Address: $C7C2F6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8FC:
    LSR $4F0B            ; 4E 0B 4F | Logical shift right (absolute)
    BVC $0B              ; 50 0B | Branch if overflow clear
    EOR ($0B),Y          ; 51 0B | Exclusive OR with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 19 C3 C3 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $04              ; F0 04 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8FD
; Address: $C7C315
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8FD:
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_8FF
; Address: $C7C31C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_8FF:
    RTI                  ; 40 | Return from interrupt
    ADC $DA40            ; 6D 40 DA | Add with carry (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 2C C3 C3 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    PLX                  ; FA | Pull X register from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_900
; Address: $C7C32D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_900:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ADC $DA40,Y          ; 79 40 DA | Add with carry (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 3F C3 C3 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    PLX                  ; FA | Pull X register from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_901
; Address: $C7C340
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_901:
    RTI                  ; 40 | Return from interrupt
    ADC ($40),Y          ; 71 40 | Add with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    LDA #$10             ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_903
; Address: $C7C34C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_903:
    STZ $3306            ; 9C 06 33 | Store zero to absolute
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA #$AC             ; A9 AC | Load immediate value into accumulator
    STA $3310,X          ; 9D 10 33 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$22             ; E0 22 | Compare X register (immediate)
    BCC $F6              ; 90 F6 | Branch if carry clear
    LDA #$3A             ; A9 3A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_904
; Address: $C7C362
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_904:
    JSL $C31AFC          ; 22 FC 1A C3 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    STZ $28F0,X          ; 9E F0 28 | Store zero to absolute,X
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_905
; Address: $C7C36C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_905:
    PHA                  ; 48 | Push accumulator to stack
    STA $3308            ; 8D 08 33 | Store accumulator to absolute address
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    STA $330A            ; 8D 0A 33 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $330C            ; 8D 0C 33 | Store accumulator to absolute address
    DEC                  ; 3A | Decrement accumulator
    STA $330E            ; 8D 0E 33 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_906
; Address: $C7C37F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_906:
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $3310,X          ; BD 10 33 | Load from absolute,X into accumulator
    STA $3332,X          ; 9D 32 33 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$22             ; E0 22 | Compare X register (immediate)
    BCC $F3              ; 90 F3 | Branch if carry clear
    LDX #$32             ; A2 32 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_907
; Address: $C7C392
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_907:
    JSL $C1B9EE          ; 22 EE B9 C1 | Jump to subroutine long
    SEP #$20             ; E2 20 | Set processor status bits
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $3332,X          ; BD 32 33 | Load from absolute,X into accumulator
    STA $4056,X          ; 9D 56 40 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    CPX #$09             ; E0 09 | Compare X register (immediate)
    BCC $F4              ; 90 F4 | Branch if carry clear
    REP #$20             ; C2 20 | Reset processor status bits
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_908
; Address: $C7C3AA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_908:
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $3310,X          ; BD 10 33 | Load from absolute,X into accumulator
    STA $3332,X          ; 9D 32 33 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$22             ; E0 22 | Compare X register (immediate)
    BCC $F3              ; 90 F3 | Branch if carry clear
    LDX #$32             ; A2 32 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_909
; Address: $C7C3BD
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_909:
    JSL $C1B9EE          ; 22 EE B9 C1 | Jump to subroutine long
    SEP #$20             ; E2 20 | Set processor status bits
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $3332,X          ; BD 32 33 | Load from absolute,X into accumulator
    STA $3714,X          ; 9D 14 37 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    CPX #$11             ; E0 11 | Compare X register (immediate)
    BCC $F4              ; 90 F4 | Branch if carry clear
    REP #$20             ; C2 20 | Reset processor status bits
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_90A
; Address: $C7C3D5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_90A:
    CMP #$63             ; C9 63 | Compare accumulator (immediate)
    BEQ $06              ; F0 06 | Branch if equal
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    JMP $C3E3            ; 4C E3 C3 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_90B
; Address: $C7C3E4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_90B:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $74              ; 85 74 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_90C
; Address: $C7C3FA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_90C:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    STZ $BE7D            ; 9C 7D BE | Store zero to absolute
    LDA $BE7D            ; AD 7D BE | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_90D
; Address: $C7C406
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_90D:
    JSL $C42FEB          ; 22 EB 2F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $22E8,X          ; FE E8 22 | Increment (absolute,X)
    CPY $01              ; C4 01 | Compare Y register (zero page)
    INC $9070,X          ; FE 70 90 | Increment (absolute,X)
    ORA #$A6             ; 09 A6 | Logical OR with accumulator (immediate)
    LDA                  ; BF 3D C2 C3 | Load from absolute long,X into accumulator
    JMP $C469            ; 4C 69 C4 | Jump to address
    LDX $70              ; A6 70 | Load from zero page into X register
    STX $BE81            ; 8E 81 BE | Store X register to absolute address
    LDX $71              ; A6 71 | Load from zero page into X register
    STX $BE82            ; 8E 82 BE | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_90E
; Address: $C7C42B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_90E:
    JSL $C43B5F          ; 22 5F 3B C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BVS $A5              ; 70 A5 | Branch if overflow set
    ADC ($CD),Y          ; 71 CD | Add with carry ((zero page),Y)
    LDX $05F0,Y          ; BE F0 05 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_90F
; Address: $C7C439
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_90F:
    BCS $0A              ; B0 0A | Branch if carry set
    JMP $C44E            ; 4C 4E C4 | Jump to address
    LDA $70              ; A5 70 | Load from zero page into accumulator
    CMP $BE81            ; CD 81 BE | Compare accumulator (absolute)
    BCC $09              ; 90 09 | Branch if carry clear
    LDX $74              ; A6 74 | Load from zero page into X register
    LDA                  ; BF 47 C2 C3 | Load from absolute long,X into accumulator
    JMP $C469            ; 4C 69 C4 | Jump to address
    LDA $BE81            ; AD 81 BE | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $70              ; E5 70 | Subtract with carry (zero page)
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $BE83            ; AD 83 BE | Load from absolute address into accumulator
    SBC $72              ; E5 72 | Subtract with carry (zero page)
    STA $BE83            ; 8D 83 BE | Store accumulator to absolute address
    REP #$20             ; C2 20 | Reset processor status bits
    LDX $74              ; A6 74 | Load from zero page into X register
    LDA                  ; BF D9 C1 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_910
; Address: $C7C469
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_910:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    INC $BE7D            ; EE 7D BE | Increment (absolute)
    DEY                  ; 88 | Decrement Y register
    BNE $90              ; D0 90 | Branch if not equal
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_911
; Address: $C7C47B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_911:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $343E            ; 8D 3E 34 | Store accumulator to absolute address
    LDA                  ; BF E3 C1 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_915
; Address: $C7C4AA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_915:
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C0BC            ; 4C BC C0 | Jump to address
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_916
; Address: $C7C4BA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_916:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    STY $33A2            ; 8C A2 33 | Store Y register to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_917
; Address: $C7C4CF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_917:
    JSL $C3C07E          ; 22 7E C0 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_918
; Address: $C7C4DB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_918:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    STY $33A2            ; 8C A2 33 | Store Y register to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_919
; Address: $C7C4F0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_919:
    JSL $C3C07E          ; 22 7E C0 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_91A
; Address: $C7C4FC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_91A:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    STY $33A2            ; 8C A2 33 | Store Y register to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_91B
; Address: $C7C511
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_91B:
    JSL $C3C07E          ; 22 7E C0 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_91C
; Address: $C7C51D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_91C:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    STY $33A2            ; 8C A2 33 | Store Y register to absolute address
    LDA #$06             ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_91D
; Address: $C7C532
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_91D:
    JSL $C3C07E          ; 22 7E C0 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_91E
; Address: $C7C53E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_91E:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_920
; Address: $C7C553
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_920:
    JSL $C3C07E          ; 22 7E C0 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_921
; Address: $C7C55F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_921:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    STY $33A2            ; 8C A2 33 | Store Y register to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_922
; Address: $C7C574
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_922:
    JSL $C3C251          ; 22 51 C2 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_923
; Address: $C7C580
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_923:
    PHP                  ; 08 | Push processor status to stack
    REP #$20             ; C2 20 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_924
; Address: $C7C587
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_924:
    JSL $C3C3E4          ; 22 E4 C3 C3 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_925
; Address: $C7C58E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_925:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    STY $33A2            ; 8C A2 33 | Store Y register to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_926
; Address: $C7C5A3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_926:
    JSL $C3C47B          ; 22 7B C4 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_927
; Address: $C7C5AF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_927:
    PHP                  ; 08 | Push processor status to stack
    REP #$20             ; C2 20 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_928
; Address: $C7C5B6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_928:
    JSL $C3C3E4          ; 22 E4 C3 C3 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_929
; Address: $C7C5BD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_929:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    STY $33A2            ; 8C A2 33 | Store Y register to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_92A
; Address: $C7C5D2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_92A:
    JSL $C3C47B          ; 22 7B C4 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_92B
; Address: $C7C5DE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_92B:
    PHP                  ; 08 | Push processor status to stack
    REP #$20             ; C2 20 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    LDA #$04             ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_92C
; Address: $C7C5E5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_92C:
    JSL $C3C3E4          ; 22 E4 C3 C3 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_92D
; Address: $C7C5EC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_92D:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_92E
; Address: $C7C5F3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_92E:
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    STY $33A2            ; 8C A2 33 | Store Y register to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_92F
; Address: $C7C601
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_92F:
    JSL $C3C47B          ; 22 7B C4 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_930
; Address: $C7C60D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_930:
    PHP                  ; 08 | Push processor status to stack
    REP #$20             ; C2 20 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    LDA #$06             ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_931
; Address: $C7C614
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_931:
    JSL $C3C3E4          ; 22 E4 C3 C3 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_932
; Address: $C7C61B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_932:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    STY $33A2            ; 8C A2 33 | Store Y register to absolute address
    LDA #$06             ; A9 06 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_933
; Address: $C7C630
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_933:
    JSL $C3C47B          ; 22 7B C4 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_934
; Address: $C7C63C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_934:
    PHP                  ; 08 | Push processor status to stack
    REP #$20             ; C2 20 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    LDA #$08             ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_935
; Address: $C7C643
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_935:
    JSL $C3C3E4          ; 22 E4 C3 C3 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_936
; Address: $C7C64A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_936:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    STY $33A2            ; 8C A2 33 | Store Y register to absolute address
    LDA #$08             ; A9 08 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_937
; Address: $C7C65F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_937:
    JSL $C3C47B          ; 22 7B C4 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_938
; Address: $C7C66B
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_938:
    SEP #$20             ; E2 20 | Set processor status bits
    LDX #$FF             ; A2 FF | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDA                  ; BF A4 C6 C3 | Load from absolute long,X into accumulator
    BEQ $1D              ; F0 1D | Branch if equal
    XBA                  ; EB | Exchange accumulator bytes
    LDA $3311,Y          ; B9 11 33 | Load from absolute,Y into accumulator
    BNE $06              ; D0 06 | Branch if not equal
    XBA                  ; EB | Exchange accumulator bytes
    CMP $3310,Y          ; D9 10 33 | Compare accumulator (absolute,Y)
    BEQ $EB              ; F0 EB | Branch if equal
    INX                  ; E8 | Increment X register
    LDA                  ; BF A4 C6 C3 | Load from absolute long,X into accumulator
    BNE $F9              ; D0 F9 | Branch if not equal
    LDA                  ; BF A5 C6 C3 | Load from absolute long,X into accumulator
    BNE $DB              ; D0 DB | Branch if not equal
    REP #$20             ; C2 20 | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_939
; Address: $C7C699
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_939:
    LDA $3310,Y          ; B9 10 33 | Load from absolute,Y into accumulator
    CMP #$AC             ; C9 AC | Compare accumulator (immediate)
    BNE $D0              ; D0 D0 | Branch if not equal
    REP #$20             ; C2 20 | Reset processor status bits
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_93B
; Address: $C7C6B0
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_93B:
    ADC $0156            ; 6D 56 01 | Add with carry (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $011F            ; 6D 1F 01 | Add with carry (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $0156            ; 6D 56 01 | Add with carry (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ADC $011F            ; 6D 1F 01 | Add with carry (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($6D,X)          ; 01 6D | Logical OR with accumulator ((zero page,X))
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    ORA ($6D,X)          ; 01 6D | Logical OR with accumulator ((zero page,X))
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    ORA ($6D,X)          ; 01 6D | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($6D,X)          ; 01 6D | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ADC $0056            ; 6D 56 00 | Add with carry (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ADC $001F            ; 6D 1F 00 | Add with carry (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ADC $5601            ; 6D 01 56 | Add with carry (absolute)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ADC $1F01            ; 6D 01 1F | Add with carry (absolute)
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    ADC $5601            ; 6D 01 56 | Add with carry (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $1F01            ; 6D 01 1F | Add with carry (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $0101            ; 6D 01 01 | Add with carry (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ADC $0101            ; 6D 01 01 | Add with carry (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($6D,X)          ; 01 6D | Logical OR with accumulator ((zero page,X))
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($6D,X)          ; 01 6D | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_93C
; Address: $C7C753
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_93C:
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_93E
; Address: $C7C763
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_93E:
    JSL $C1BAD3          ; 22 D3 BA C1 | Jump to subroutine long
    CMP #$AC             ; C9 AC | Compare accumulator (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    STA $3310,X          ; 9D 10 33 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX $3308            ; EC 08 33 | Compare X register (absolute)
    BCC $ED              ; 90 ED | Branch if carry clear
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    STX $3306            ; 8E 06 33 | Store X register to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_93F
; Address: $C7C77C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_93F:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PEA #$3538           ; F4 38 35 | Push effective address to stack
    PEA #$003F           ; F4 3F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_941
; Address: $C7C795
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_941:
    JSL $C3CEC6          ; 22 C6 CE C3 | Jump to subroutine long
    STZ $339E            ; 9C 9E 33 | Store zero to absolute
    LDX $2BB2            ; AE B2 2B | Load from absolute address into X register
    LDA                  ; BF 2A CA C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_943
; Address: $C7C7A7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_943:
    JSL $C3226F          ; 22 6F 22 C3 | Jump to subroutine long
    ADC ($12),Y          ; 71 12 | Add with carry ((zero page),Y)
    BCS $0F              ; B0 0F | Branch if carry set
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BEQ $0A              ; F0 0A | Branch if equal
    CMP #$79             ; C9 79 | Compare accumulator (immediate)
    BEQ $22              ; F0 22 | Branch if equal
    CMP #$7A             ; C9 7A | Compare accumulator (immediate)
    BEQ $23              ; F0 23 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_948
; Address: $C7C7D4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_948:
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_94B
; Address: $C7C7E8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_94B:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    JMP $C7A7            ; 4C A7 C7 | Jump to address
    LDA                  ; BF 34 CA C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_94E
; Address: $C7C7FB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_94E:
    JSL $C32436          ; 22 36 24 C3 | Jump to subroutine long
    LDA $33A0            ; AD A0 33 | Load from absolute address into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address
    LDA $2BB8            ; AD B8 2B | Load from absolute address into accumulator
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_953
; Address: $C7C825
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_953:
    JSL $C32413          ; 22 13 24 C3 | Jump to subroutine long
    BCS $43              ; B0 43 | Branch if carry set
    STA $33A0            ; 8D A0 33 | Store accumulator to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2BBA,Y          ; B9 BA 2B | Load from absolute,Y into accumulator
    STA $33DA            ; 8D DA 33 | Store accumulator to absolute address
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $33A0            ; 6D A0 33 | Add with carry (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2BCA,Y          ; B9 CA 2B | Load from absolute,Y into accumulator
    STA $33E2            ; 8D E2 33 | Store accumulator to absolute address
    LDA $2BCC,Y          ; B9 CC 2B | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $33E4            ; 8D E4 33 | Store accumulator to absolute address
    LDY $33A0            ; AC A0 33 | Load from absolute address into Y register
    LDA $2BE2,Y          ; B9 E2 2B | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $33E6            ; 8D E6 33 | Store accumulator to absolute address
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_957
; Address: $C7C86F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_957:
    LDA $33E6            ; AD E6 33 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $07              ; F0 07 | Branch if equal
    LDA                  ; BF 52 CA C3 | Load from absolute long,X into accumulator
    JMP $C882            ; 4C 82 C8 | Jump to address
    LDA                  ; BF 48 CA C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_959
; Address: $C7C889
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_959:
    JSL $C44FE2          ; 22 E2 4F C4 | Jump to subroutine long
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BEQ $12              ; F0 12 | Branch if equal
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_95A
; Address: $C7C897
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_95A:
    JSL $C451A3          ; 22 A3 51 C4 | Jump to subroutine long
    BCS $08              ; B0 08 | Branch if carry set
    LDA                  ; BF 5C CA C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_95D
; Address: $C7C8AE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_95D:
    JSL $C32436          ; 22 36 24 C3 | Jump to subroutine long
    LDA $33A4            ; AD A4 33 | Load from absolute address into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_960
; Address: $C7C8C4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_960:
    JSL $C32413          ; 22 13 24 C3 | Jump to subroutine long
    BCS $A4              ; B0 A4 | Branch if carry set
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    STA $33A4            ; 8D A4 33 | Store accumulator to absolute address
    STA $BE7D            ; 8D 7D BE | Store accumulator to absolute address
    BVS $68              ; 70 68 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_961
; Address: $C7C8D5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_961:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $0CC0,X          ; FD C0 0C | Subtract with carry (absolute,X)
    BCC $6F              ; 90 6F | Branch if carry clear
    LDA                  ; BF 70 CA C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_964
; Address: $C7C8F0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_964:
    JSL $B019C3          ; 22 C3 19 B0 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $26              ; D0 26 | Branch if not equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_966
; Address: $C7C901
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_966:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $0CC0,X          ; FD C0 0C | Subtract with carry (absolute,X)
    BCS $0B              ; B0 0B | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_968
; Address: $C7C911
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_968:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    JMP $C950            ; 4C 50 C9 | Jump to address
    LDA                  ; BF 84 CA C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_96C
; Address: $C7C92F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_96C:
    JSL $B019C3          ; 22 C3 19 B0 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $C8A6            ; 4C A6 C8 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_96F
; Address: $C7C949
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_96F:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    JMP $CA03            ; 4C 03 CA | Jump to address
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_970
; Address: $C7C953
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_970:
    JSL $C44FE2          ; 22 E2 4F C4 | Jump to subroutine long
    SBC $05C0,X          ; FD C0 05 | Subtract with carry (absolute,X)
    BEQ $71              ; F0 71 | Branch if equal
    LDY $33D6            ; AC D6 33 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_971
; Address: $C7C961
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_971:
    JSL $C44A72          ; 22 72 4A C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    SBC $B040,X          ; FD 40 B0 | Subtract with carry (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA                  ; BF AC CA C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_974
; Address: $C7C97B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_974:
    JSL $B019C3          ; 22 C3 19 B0 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $4A              ; D0 4A | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_976
; Address: $C7C98A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_976:
    JSL $C3CC51          ; 22 51 CC C3 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_977
; Address: $C7C992
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_977:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $2288,X          ; FD 88 22 | Subtract with carry (absolute,X)
    JMP $01C4            ; 4C C4 01 | Jump to address
    SBC $2240,X          ; FD 40 22 | Subtract with carry (absolute,X)
    STZ $BD              ; 64 BD | Store zero to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_97A
; Address: $C7C9B1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_97A:
    BCS $48              ; B0 48 | Branch if carry set
    JMP $CA03            ; 4C 03 CA | Jump to address
    LDA                  ; BF A2 CA C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_97D
; Address: $C7C9C5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_97D:
    JSL $B019C3          ; 22 C3 19 B0 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $3F              ; D0 3F | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_97F
; Address: $C7C9D3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_97F:
    JSL $C32209          ; 22 09 22 C3 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_980
; Address: $C7C9DB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_980:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BCC $0C              ; 90 0C | Branch if carry clear
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $07              ; F0 07 | Branch if equal
    LDA                  ; BF C0 CA C3 | Load from absolute long,X into accumulator
    JMP $C9F4            ; 4C F4 C9 | Jump to address
    LDA                  ; BF B6 CA C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_981
; Address: $C7C9F4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_981:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCC $08              ; 90 08 | Branch if carry clear
    LDA                  ; BF D4 CA C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_983
; Address: $C7CA03
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_983:
    JSL $C45AB0          ; 22 B0 5A C4 | Jump to subroutine long
    BVS $A5              ; 70 A5 | Branch if overflow set
    BVS $05              ; 70 05 | Branch if overflow set
    ADC ($F0),Y          ; 71 F0 | Add with carry ((zero page),Y)
    BPL $BF              ; 10 BF | Branch if positive
    DEC $C3CA,X          ; DE CA C3 | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_985
; Address: $C7CA16
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_985:
    JSR $CA1F            ; 20 1F CA | Jump to subroutine
    BCS $03              ; B0 03 | Branch if carry set
    JMP $C7F7            ; 4C F7 C7 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_986
; Address: $C7CA1F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_986:
    CLC                  ; 18 | Clear carry flag
    LDA $BE6B            ; AD 6B BE | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $01              ; F0 01 | Branch if equal
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_987
; Address: $C7CA2A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_987:
    NOP                  ; EA | No operation
    ORA #$70             ; 09 70 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    NOP                  ; EA | No operation
    ORA #$91             ; 09 91 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVS $0A              ; 70 0A | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_988
; Address: $C7CA34
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_988:
    XBA                  ; EB | Exchange accumulator bytes
    ORA #$71             ; 09 71 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    XBA                  ; EB | Exchange accumulator bytes
    ORA #$92             ; 09 92 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC ($0A),Y          ; 71 0A | Add with carry ((zero page),Y)
    CPX $7209            ; EC 09 72 | Compare X register (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX $9309            ; EC 09 93 | Compare X register (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $7309            ; ED 09 73 | Subtract with carry (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $9409            ; ED 09 94 | Subtract with carry (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $7409            ; EE 09 74 | Increment (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $9509            ; EE 09 95 | Increment (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$75             ; 09 75 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$96             ; 09 96 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BEQ $09              ; F0 09 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BEQ $09              ; F0 09 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC ($09),Y          ; F1 09 | Subtract with carry ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC ($09),Y          ; F1 09 | Subtract with carry ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$78             ; 09 78 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$99             ; 09 99 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$79             ; 09 79 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$9A             ; 09 9A | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $F40A,Y          ; 79 0A F4 | Add with carry (absolute,Y)
    ORA #$7A             ; 09 7A | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_989
; Address: $C7CA91
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_989:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PEA #$9B09           ; F4 09 9B | Push effective address to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLY                  ; 7A | Pull Y register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$7B             ; 09 7B | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$9C             ; 09 9C | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$7C             ; 09 7C | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$9D             ; 09 9D | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$7D             ; 09 7D | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$9E             ; 09 9E | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $F90A,X          ; 7D 0A F9 | Add with carry (absolute,X)
    ORA #$7F             ; 09 7F | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $A009,Y          ; F9 09 A0 | Subtract with carry (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLX                  ; FA | Pull X register from stack
    ORA #$80             ; 09 80 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLX                  ; FA | Pull X register from stack
    ORA #$A1             ; 09 A1 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $0A              ; 80 0A | Branch always
    ORA #$81             ; 09 81 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA ($0A,X)          ; 81 0A | Store accumulator to (zero page,X)
    ORA #$82             ; 09 82 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$A3             ; 09 A3 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $8309,X          ; FD 09 83 | Subtract with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $A409,X          ; FD 09 A4 | Subtract with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $8409,X          ; FE 09 84 | Increment (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $A509,X          ; FE 09 A5 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_98A
; Address: $C7CAEF
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_98A:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $0A              ; 84 0A | Store Y register to zero page
    ORA #$85             ; 09 85 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$A6             ; 09 A6 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $0A              ; 85 0A | Store accumulator to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STX $0A              ; 86 0A | Store X register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STX $0A              ; 86 0A | Store X register to zero page
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEY                  ; 88 | Decrement Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    DEY                  ; 88 | Decrement Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT #$0A             ; 89 0A | Test bits in accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT #$0A             ; 89 0A | Test bits in accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLB                  ; AB | Pull data bank register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    LDY $8B0A            ; AC 0A 8B | Load from absolute address into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    STY $060A            ; 8C 0A 06 | Store Y register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA $8C0A            ; AD 0A 8C | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_98B
; Address: $C7CB42
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_98B:
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STX $080A            ; 8E 0A 08 | Store X register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA $0A8E0A          ; AF 0A 8E 0A | Load from absolute long address into accumulator
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    STA $0A090A          ; 8F 0A 09 0A | Store accumulator to absolute long address
    BCS $0A              ; B0 0A | Branch if carry set
    STA $0A0A0A          ; 8F 0A 0A 0A | Store accumulator to absolute long address
    BCC $0A              ; 90 0A | Branch if carry clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA ($0A),Y          ; B1 0A | Load from (zero page),Y into accumulator
    BCC $0A              ; 90 0A | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    ORA #$7E             ; 09 7E | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    ORA #$9F             ; 09 9F | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROR $070A,X          ; 7E 0A 07 | Rotate right (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $070A            ; 8D 0A 07 | Store accumulator to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX $8D0A            ; AE 0A 8D | Load from absolute address into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_98D
; Address: $C7CB83
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_98D:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    BCS $2C              ; B0 2C | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_98E
; Address: $C7CB8D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_98E:
    JSL $C4508A          ; 22 8A 50 C4 | Jump to subroutine long
    BCC $25              ; 90 25 | Branch if carry clear
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_991
; Address: $C7CBA1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_991:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_993
; Address: $C7CBB1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_993:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    JMP $CBBA            ; 4C BA CB | Jump to address
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_994
; Address: $C7CBBA
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_994:
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_995
; Address: $C7CBBE
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_995:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_996
; Address: $C7CBC1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_996:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    BCS $4C              ; B0 4C | Branch if carry set
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_998
; Address: $C7CBDC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_998:
    JSL $C44A03          ; 22 03 4A C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    BCS $36              ; B0 36 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_99A
; Address: $C7CBED
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_99A:
    JSL $C446D6          ; 22 D6 46 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    CMP $33DC            ; CD DC 33 | Compare accumulator (absolute)
    BCC $22              ; 90 22 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_99D
; Address: $C7CC04
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_99D:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_99F
; Address: $C7CC14
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_99F:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    JMP $CC1D            ; 4C 1D CC | Jump to address
    CLC                  ; 18 | Clear carry flag
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9A0
; Address: $C7CC21
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9A0:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9A1
; Address: $C7CC24
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9A1:
    JSR $CC37            ; 20 37 CC | Jump to subroutine
    BCC $04              ; 90 04 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    JMP $CC33            ; 4C 33 CC | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9A3
; Address: $C7CC31
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9A3:
    BVS $38              ; 70 38 | Branch if overflow set
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9A4
; Address: $C7CC37
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9A4:
    LDA $33E2            ; AD E2 33 | Load from absolute address into accumulator
    STA $70              ; 85 70 | Store accumulator to zero page
    LDA $33E4            ; AD E4 33 | Load from absolute address into accumulator
    STA $72              ; 85 72 | Store accumulator to zero page
    LDA $33E6            ; AD E6 33 | Load from absolute address into accumulator
    LDX #$70             ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9A6
; Address: $C7CC4B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9A6:
    JSL $C45B66          ; 22 66 5B C4 | Jump to subroutine long
    BVS $60              ; 70 60 | Branch if overflow set
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator
    CMP #$1E             ; C9 1E | Compare accumulator (immediate)
    BNE $1D              ; D0 1D | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9A7
; Address: $C7CC5C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9A7:
    JSL $C908F0          ; 22 F0 08 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ROR $0053,X          ; 7E 53 00 | Rotate right (absolute,X)
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    PEA #$3538           ; F4 38 35 | Push effective address to stack
    PEA #$003F           ; F4 3F 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9AA
; Address: $C7CC79
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9AA:
    JSR $CC37            ; 20 37 CC | Jump to subroutine
    LDX $33E6            ; AE E6 33 | Load from absolute address into X register
    LDY $33D6            ; AC D6 33 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9AB
; Address: $C7CC82
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9AB:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP $33D6            ; CD D6 33 | Compare accumulator (absolute)
    BEQ $14              ; F0 14 | Branch if equal
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9AC
; Address: $C7CC90
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9AC:
    JSL $C44739          ; 22 39 47 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BCS $07              ; B0 07 | Branch if carry set
    DEX                  ; CA | Decrement X register
    BNE $F3              ; D0 F3 | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    JMP $CCAD            ; 4C AD CC | Jump to address
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9AD
; Address: $C7CCA4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9AD:
    JSL $C45399          ; 22 99 53 C4 | Jump to subroutine long
    DEX                  ; CA | Decrement X register
    BNE $F8              ; D0 F8 | Branch if not equal
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9AE
; Address: $C7CCAD
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9AE:
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9B2
; Address: $C7CCBD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9B2:
    JSL $C3233B          ; 22 3B 23 C3 | Jump to subroutine long
    STA $A2AD,Y          ; 99 AD A2 | Store accumulator to absolute,Y
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9B3
; Address: $C7CCC8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9B3:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $23              ; B0 23 | Branch if carry set
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    STA $33A2            ; 8D A2 33 | Store accumulator to absolute address
    STA $BE7D            ; 8D 7D BE | Store accumulator to absolute address
    BVS $46              ; 70 46 | Branch if overflow set
    LDA $2BEE            ; AD EE 2B | Load from absolute address into accumulator
    BNE $1E              ; D0 1E | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9BA
; Address: $C7CD03
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9BA:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $B3              ; B0 B3 | Branch if carry set
    STA $33DA            ; 8D DA 33 | Store accumulator to absolute address
    LDA $33BE            ; AD BE 33 | Load from absolute address into accumulator
    STA $33DC            ; 8D DC 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9BC
; Address: $C7CD19
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9BC:
    JSL $C32413          ; 22 13 24 C3 | Jump to subroutine long
    JMP $CD50            ; 4C 50 CD | Jump to address
    LDA $2BF0            ; AD F0 2B | Load from absolute address into accumulator
    BNE $16              ; D0 16 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9C1
; Address: $C7CD3B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9C1:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    STA $F6B0,Y          ; 99 B0 F6 | Store accumulator to absolute,Y
    STA $33DA            ; 8D DA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9C5
; Address: $C7CD56
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9C5:
    JSL $C44F00          ; 22 00 4F C4 | Jump to subroutine long
    BCS $40              ; B0 40 | Branch if carry set
    BVC $03              ; 50 03 | Branch if overflow clear
    JMP $CDEA            ; 4C EA CD | Jump to address
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9C6
; Address: $C7CD65
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9C6:
    JSL $C44EA6          ; 22 A6 4E C4 | Jump to subroutine long
    BVS $A5              ; 70 A5 | Branch if overflow set
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    LDX $70A5,Y          ; BE A5 70 | Load from absolute,Y into X register
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA                  ; BF 1A CB C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9C9
; Address: $C7CD84
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9C9:
    JSL $B019C3          ; 22 C3 19 B0 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $51              ; D0 51 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9CA
; Address: $C7CD8E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9CA:
    JSL $C3CE2A          ; 22 2A CE C3 | Jump to subroutine long
    BCC $1E              ; 90 1E | Branch if carry clear
    LDA                  ; BF 38 CB C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9CC
; Address: $C7CD9D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9CC:
    CMP #$B1             ; C9 B1 | Compare accumulator (immediate)
    BNE $05              ; D0 05 | Branch if not equal
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BEQ $BB              ; F0 BB | Branch if equal
    LDA                  ; BF 06 CB C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9D2
; Address: $C7CDC7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9D2:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator
    CMP #$B1             ; C9 B1 | Compare accumulator (immediate)
    BNE $09              ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9D3
; Address: $C7CDD3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9D3:
    JSL $C908F0          ; 22 F0 08 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ROR $009B,X          ; 7E 9B 00 | Rotate right (absolute,X)
    JMP $CE06            ; 4C 06 CE | Jump to address
    LDA                  ; BF 2E CB C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9D4
; Address: $C7CDE3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9D4:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    JMP $CE06            ; 4C 06 CE | Jump to address
    LDA                  ; BF 10 CB C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9D7
; Address: $C7CDF9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9D7:
    JSL $B019C3          ; 22 C3 19 B0 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $CD62            ; 4C 62 CD | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9D8
; Address: $C7CE06
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9D8:
    JSL $C3CE93          ; 22 93 CE C3 | Jump to subroutine long
    BCC $1D              ; 90 1D | Branch if carry clear
    STZ $72              ; 64 72 | Store zero to zero page
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $70              ; 85 70 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9D9
; Address: $C7CE13
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9D9:
    JSL $C3CE2A          ; 22 2A CE C3 | Jump to subroutine long
    BCS $10              ; B0 10 | Branch if carry set
    LDA                  ; BF 42 CB C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9DB
; Address: $C7CE21
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9DB:
    JSR $CA1F            ; 20 1F CA | Jump to subroutine
    BCS $03              ; B0 03 | Branch if carry set
    JMP $CCB9            ; 4C B9 CC | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9DC
; Address: $C7CE2A
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9DC:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9DD
; Address: $C7CE2D
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9DD:
    JSL $C45AB0          ; 22 B0 5A C4 | Jump to subroutine long
    LDA $73              ; A5 73 | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $70              ; 65 70 | Add with carry (zero page)
    STA $73              ; 85 73 | Store accumulator to zero page
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $75              ; A5 75 | Load from zero page into accumulator
    ADC $72              ; 65 72 | Add with carry (zero page)
    STA $75              ; 85 75 | Store accumulator to zero page
    REP #$20             ; C2 20 | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    LDA $75              ; A5 75 | Load from zero page into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    CMP #$0F             ; C9 0F | Compare accumulator (immediate)
    BCC $07              ; 90 07 | Branch if carry clear
    BNE $05              ; D0 05 | Branch if not equal
    LDA $73              ; A5 73 | Load from zero page into accumulator
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    WDM #$7A             ; 42 7A | Reserved instruction
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9DE
; Address: $C7CE5B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9DE:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDX $33DA            ; AE DA 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9DF
; Address: $C7CE61
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9DF:
    JSL $C44EA6          ; 22 A6 4E C4 | Jump to subroutine long
    INC $2270,X          ; FE 70 22 | Increment (absolute,X)
    INC                  ; 1A | Increment accumulator
    CPY $70              ; C4 70 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9E0
; Address: $C7CE6C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9E0:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    CMP $70              ; C5 70 | Compare accumulator (zero page)
    BCC $08              ; 90 08 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9E1
; Address: $C7CE79
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9E1:
    JSL $C453F7          ; 22 F7 53 C4 | Jump to subroutine long
    INC $8F4C,X          ; FE 4C 8F | Increment (absolute,X)
    DEC $D6AD            ; CE AD D6 | Decrement (absolute)
    LDX $33DC            ; AE DC 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9E2
; Address: $C7CE87
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9E2:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $7A40,X          ; FE 40 7A | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9E3
; Address: $C7CE93
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9E3:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9E4
; Address: $C7CE96
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9E4:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STZ $70              ; 64 70 | Store zero to zero page
    DEX                  ; CA | Decrement X register
    BMI $0F              ; 30 0F | Branch if negative

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9E5
; Address: $C7CEA1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9E5:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ADC $70              ; 65 70 | Add with carry (zero page)
    STA $70              ; 85 70 | Store accumulator to zero page
    JMP $CE9E            ; 4C 9E CE | Jump to address
    LDA $70              ; A5 70 | Load from zero page into accumulator
    BNE $0D              ; D0 0D | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9E6
; Address: $C7CEB4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9E6:
    JSL $C3305F          ; 22 5F 30 C3 | Jump to subroutine long
    LDA $2BF0            ; AD F0 2B | Load from absolute address into accumulator
    BNE $04              ; D0 04 | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    JMP $CEC2            ; 4C C2 CE | Jump to address
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9E7
; Address: $C7CEC6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9E7:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    STA $2BB4            ; 8D B4 2B | Store accumulator to absolute address
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9E8
; Address: $C7CECD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9E8:
    JSL $C9050D          ; 22 0D 05 C9 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    ORA #$C3             ; 09 C3 | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$007F           ; F4 7F 00 | Push effective address to stack
    PEA #$0000           ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9E9
; Address: $C7CEE1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9E9:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    STA $2BB2            ; 8D B2 2B | Store accumulator to absolute address
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$0080           ; F4 80 00 | Push effective address to stack
    PEA #$0000           ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9EA
; Address: $C7CEF1
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9EA:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    STA $2BB8            ; 8D B8 2B | Store accumulator to absolute address
    LDY #$01             ; A0 01 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BBA            ; 8D BA 2B | Store accumulator to absolute address
    LDY #$02             ; A0 02 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BBC            ; 8D BC 2B | Store accumulator to absolute address
    LDY #$03             ; A0 03 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BBE            ; 8D BE 2B | Store accumulator to absolute address
    LDY #$04             ; A0 04 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BC0            ; 8D C0 2B | Store accumulator to absolute address
    LDY #$05             ; A0 05 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BC2            ; 8D C2 2B | Store accumulator to absolute address
    LDY #$06             ; A0 06 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BC4            ; 8D C4 2B | Store accumulator to absolute address
    LDY #$07             ; A0 07 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BC6            ; 8D C6 2B | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $2BBA,X          ; BD BA 2B | Load from absolute,X into accumulator
    BEQ $21              ; F0 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9EB
; Address: $C7CF4D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9EB:
    JSL $C44E68          ; 22 68 4E C4 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    PHX                  ; DA | Push X register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9EC
; Address: $C7CF56
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9EC:
    CLC                  ; 18 | Clear carry flag
    ORA ($A8,X)          ; 01 A8 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    LDA $78              ; A5 78 | Load from zero page into accumulator
    STA $2BCA,Y          ; 99 CA 2B | Store accumulator to absolute,Y
    LDA $79              ; A5 79 | Load from zero page into accumulator
    STA $2BCB,Y          ; 99 CB 2B | Store accumulator to absolute,Y
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BCC $DC              ; 90 DC | Branch if carry clear
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    TXA                  ; 8A | Transfer X register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $2BB6            ; 8D B6 2B | Store accumulator to absolute address
    STZ $33A0            ; 9C A0 33 | Store zero to absolute
    STZ $33A2            ; 9C A2 33 | Store zero to absolute
    STZ $33A4            ; 9C A4 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9ED
; Address: $C7CF7C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9ED:
    JSL $C3CF84          ; 22 84 CF C3 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9EE
; Address: $C7CF84
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9EE:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    SEP #$20             ; E2 20 | Set processor status bits
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $2BE2,X          ; 9D E2 2B | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BCC $F7              ; 90 F7 | Branch if carry clear
    REP #$20             ; C2 20 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9EF
; Address: $C7CF9B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9EF:
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
; Bank0E_DmaFunction_9F3
; Address: $C7CFB6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9F3:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $05              ; B0 05 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $06              ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9F9
; Address: $C7CFE1
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9F9:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA $4C0A            ; 0D 0A 4C | Logical OR with accumulator (absolute)
    BNE $48              ; D0 48 | Branch if not equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2BBA,Y          ; B9 BA 2B | Load from absolute,Y into accumulator
    STA $33DA            ; 8D DA 33 | Store accumulator to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $2BCA,Y          ; B9 CA 2B | Load from absolute,Y into accumulator
    STA $33E2            ; 8D E2 33 | Store accumulator to absolute address
    LDA $2BCC,Y          ; B9 CC 2B | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $33E4            ; 8D E4 33 | Store accumulator to absolute address
    ASL $33E2            ; 0E E2 33 | Arithmetic shift left (absolute)
    ROL $33E4            ; 2E E4 33 | Rotate left (absolute)
    ASL $33E2            ; 0E E2 33 | Arithmetic shift left (absolute)
    ROL $33E4            ; 2E E4 33 | Rotate left (absolute)
    ASL $33E2            ; 0E E2 33 | Arithmetic shift left (absolute)
    ROL $33E4            ; 2E E4 33 | Rotate left (absolute)
    ASL $33E2            ; 0E E2 33 | Arithmetic shift left (absolute)
    ROL $33E4            ; 2E E4 33 | Rotate left (absolute)
    LDA $33E3            ; AD E3 33 | Load from absolute address into accumulator
    STA $BE82            ; 8D 82 BE | Store accumulator to absolute address
    LDA $33E2            ; AD E2 33 | Load from absolute address into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_9FC
; Address: $C7D038
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_9FC:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $08              ; B0 08 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D09E            ; 4C 9E D0 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A00
; Address: $C7D056
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A00:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $08              ; B0 08 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D09E            ; 4C 9E D0 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A04
; Address: $C7D074
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A04:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $08              ; B0 08 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D09E            ; 4C 9E D0 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A08
; Address: $C7D092
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A08:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $36              ; B0 36 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $31              ; D0 31 | Branch if not equal
    LDA $33E3            ; AD E3 33 | Load from absolute address into accumulator
    STA $71              ; 85 71 | Store accumulator to zero page
    LDA $33E2            ; AD E2 33 | Load from absolute address into accumulator
    STA $70              ; 85 70 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A09
; Address: $C7D0A8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A09:
    JSL $C45B66          ; 22 66 5B C4 | Jump to subroutine long
    BVS $90              ; 70 90 | Branch if overflow set
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ROL $C1A9            ; 2E A9 C1 | Rotate left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $D0D5            ; 4C D5 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A0B
; Address: $C7D0BD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A0B:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA $33DA            ; AD DA 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A0C
; Address: $C7D0C6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A0C:
    JSL $C44824          ; 22 24 48 C4 | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    JMP $D0D5            ; 4C D5 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A0F
; Address: $C7D0D9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A0F:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A10
; Address: $C7D0E2
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A10:
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A11
; Address: $C7D0E5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A11:
    LSR $33E4            ; 4E E4 33 | Logical shift right (absolute)
    ROR $33E2            ; 6E E2 33 | Rotate right (absolute)
    LDA $33E3            ; AD E3 33 | Load from absolute address into accumulator
    STA $BE82            ; 8D 82 BE | Store accumulator to absolute address
    LDA $33E2            ; AD E2 33 | Load from absolute address into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A12
; Address: $C7D0F8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A12:
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
; Bank0E_DmaFunction_A14
; Address: $C7D10A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A14:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $D11C            ; 4C 1C D1 | Jump to address
    JMP $D1C0            ; 4C C0 D1 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A15
; Address: $C7D116
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A15:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    TSX                  ; BA | Transfer stack pointer to X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A16
; Address: $C7D11C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A16:
    JSL $C3D2DB          ; 22 DB D2 C3 | Jump to subroutine long
    LDA $70              ; A5 70 | Load from zero page into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA $71              ; A5 71 | Load from zero page into accumulator
    STA $BE82            ; 8D 82 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A19
; Address: $C7D136
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A19:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $D6              ; B0 D6 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $D1              ; D0 D1 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A1A
; Address: $C7D142
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A1A:
    JSL $C45B66          ; 22 66 5B C4 | Jump to subroutine long
    BVS $B0              ; 70 B0 | Branch if overflow set
    ADC ($22),Y          ; 71 22 | Add with carry ((zero page),Y)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A20
; Address: $C7D165
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A20:
    JSL $C908F0          ; 22 F0 08 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ROR $0016,X          ; 7E 16 00 | Rotate right (absolute,X)
    LDA $9818            ; AD 18 98 | Load from absolute address into accumulator
    LDX #$28             ; A2 28 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A25
; Address: $C7D189
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A25:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL $00              ; 26 00 | Rotate left (zero page)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A27
; Address: $C7D195
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A27:
    JSL $C791E1          ; 22 E1 91 C7 | Jump to subroutine long
    LDA $73              ; A5 73 | Load from zero page into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $04              ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A29
; Address: $C7D1A4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A29:
    JSL $C90937          ; 22 37 09 C9 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    ROR $0005,X          ; 7E 05 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A2B
; Address: $C7D1B1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A2B:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $D1C6            ; 4C C6 D1 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A2F
; Address: $C7D1CA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A2F:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A30
; Address: $C7D1D6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A30:
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
; Bank0E_DmaFunction_A32
; Address: $C7D1E5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A32:
    JSL $C3D20C          ; 22 0C D2 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A33
; Address: $C7D1F1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A33:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDX #$02             ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A34
; Address: $C7D200
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A34:
    JSL $C3D20C          ; 22 0C D2 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A35
; Address: $C7D20C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A35:
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
; Bank0E_DmaFunction_A36
; Address: $C7D218
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A36:
    JSL $C3D2DB          ; 22 DB D2 C3 | Jump to subroutine long
    LDA $70              ; A5 70 | Load from zero page into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA $71              ; A5 71 | Load from zero page into accumulator
    STA $BE82            ; 8D 82 BE | Store accumulator to absolute address
    LDA                  ; BF C3 D2 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A3A
; Address: $C7D23C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A3A:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $68              ; B0 68 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $63              ; D0 63 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A3F
; Address: $C7D261
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A3F:
    JSL $C3D332          ; 22 32 D3 C3 | Jump to subroutine long
    LDA $9818            ; AD 18 98 | Load from absolute address into accumulator
    LDX #$28             ; A2 28 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A44
; Address: $C7D280
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A44:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL $00              ; 26 00 | Rotate left (zero page)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A47
; Address: $C7D293
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A47:
    JSL $C01014          ; 22 14 10 C0 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    LDA                  ; BF D7 D2 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A48
; Address: $C7D29C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A48:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    JMP $D2B3            ; 4C B3 D2 | Jump to address
    LDA                  ; BF CF D2 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A4C
; Address: $C7D2B7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A4C:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A4D
; Address: $C7D2C4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A4D:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA                  ; BF 0A BC 0A | Load from absolute long,X into accumulator
    CPY #$0A             ; C0 0A | Compare Y register (immediate)
    LDA $C10A,X          ; BD 0A C1 | Load from absolute,X into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    REP #$0A             ; C2 0A | Reset processor status bits
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX $C40A,Y          ; BE 0A C4 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A4E
; Address: $C7D2DA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A4E:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A4F
; Address: $C7D2DF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A4F:
    JSL $C9050D          ; 22 0D 05 C9 | Jump to subroutine long
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$03FF           ; F4 FF 03 | Push effective address to stack
    PEA #$0000           ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A50
; Address: $C7D2F3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A50:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    STZ $72              ; 64 72 | Store zero to zero page
    STA $70              ; 85 70 | Store accumulator to zero page
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$07FC           ; F4 FC 07 | Push effective address to stack
    PEA #$0001           ; F4 01 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A52
; Address: $C7D30A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A52:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDY #$00             ; A0 00 | Load immediate value into Y register
    DEX                  ; CA | Decrement X register
    BMI $10              ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A53
; Address: $C7D316
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A53:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $F1              ; D0 F1 | Branch if not equal
    INY                  ; C8 | Increment Y register
    JMP $D313            ; 4C 13 D3 | Jump to address
    TYA                  ; 98 | Transfer Y register to accumulator
    LDX #$70             ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A54
; Address: $C7D32A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A54:
    JSL $C010D6          ; 22 D6 10 C0 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A55
; Address: $C7D332
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A55:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A56
; Address: $C7D335
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A56:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    BMI $2B              ; 30 2B | Branch if negative

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A57
; Address: $C7D33E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A57:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $F1              ; D0 F1 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A59
; Address: $C7D34E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A59:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BVS $22              ; 70 22 | Branch if overflow set
    AND ($C4),Y          ; 31 C4 | Logical AND with accumulator ((zero page),Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BVS $22              ; 70 22 | Branch if overflow set
    AND ($32),Y          ; 31 32 | Logical AND with accumulator ((zero page),Y)
    CPY $01              ; C4 01 | Compare Y register (zero page)
    INC $2270,X          ; FE 70 22 | Increment (absolute,X)
    CPY $01              ; C4 01 | Compare Y register (zero page)
    INC $4C70,X          ; FE 70 4C | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A5A
; Address: $C7D36D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A5A:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    WDM #$90             ; 42 90 | Reserved instruction
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A5B
; Address: $C7D375
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A5B:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    CMP #$4A             ; C9 4A | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A5C
; Address: $C7D37E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A5C:
    JSL $C3DAEB          ; 22 EB DA C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$4B             ; C9 4B | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A5D
; Address: $C7D38A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A5D:
    JSL $C3D760          ; 22 60 D7 C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$48             ; C9 48 | Compare accumulator (immediate)
    BNE $0A              ; D0 0A | Branch if not equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A5E
; Address: $C7D399
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A5E:
    JSL $C3D0F8          ; 22 F8 D0 C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$46             ; C9 46 | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A5F
; Address: $C7D3A5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A5F:
    JSL $C3D466          ; 22 66 D4 C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$47             ; C9 47 | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A60
; Address: $C7D3B1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A60:
    JSL $C3D481          ; 22 81 D4 C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$49             ; C9 49 | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A61
; Address: $C7D3BD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A61:
    JSL $C3E2F2          ; 22 F2 E2 C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$4C             ; C9 4C | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A62
; Address: $C7D3C9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A62:
    JSL $C3E477          ; 22 77 E4 C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$4D             ; C9 4D | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A64
; Address: $C7D3D9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A64:
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$54             ; C9 54 | Compare accumulator (immediate)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A65
; Address: $C7D3E5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A65:
    JSL $C3C4BA          ; 22 BA C4 C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$4F             ; C9 4F | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A66
; Address: $C7D3F1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A66:
    JSL $C3EFBE          ; 22 BE EF C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$4E             ; C9 4E | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A67
; Address: $C7D3FD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A67:
    JSL $C3EE64          ; 22 64 EE C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$51             ; C9 51 | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A68
; Address: $C7D409
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A68:
    JSL $C3EC84          ; 22 84 EC C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$50             ; C9 50 | Compare accumulator (immediate)
    BNE $0A              ; D0 0A | Branch if not equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A69
; Address: $C7D418
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A69:
    JSL $C3CF9B          ; 22 9B CF C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$44             ; C9 44 | Compare accumulator (immediate)
    BNE $0A              ; D0 0A | Branch if not equal
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A6A
; Address: $C7D427
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A6A:
    JSL $C3C77C          ; 22 7C C7 C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$45             ; C9 45 | Compare accumulator (immediate)
    BNE $0A              ; D0 0A | Branch if not equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A6B
; Address: $C7D436
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A6B:
    JSL $C3C77C          ; 22 7C C7 C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$53             ; C9 53 | Compare accumulator (immediate)
    BNE $0B              ; D0 0B | Branch if not equal
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A6C
; Address: $C7D446
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A6C:
    JSL $C3C55F          ; 22 5F C5 C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    CMP #$52             ; C9 52 | Compare accumulator (immediate)
    BNE $07              ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A6D
; Address: $C7D452
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A6D:
    JSL $C3F076          ; 22 76 F0 C3 | Jump to subroutine long
    JMP $D460            ; 4C 60 D4 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A6F
; Address: $C7D460
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A6F:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A71
; Address: $C7D467
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A71:
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A72
; Address: $C7D475
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A72:
    JSL $C3D49C          ; 22 9C D4 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A73
; Address: $C7D481
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A73:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A74
; Address: $C7D490
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A74:
    JSL $C3D49C          ; 22 9C D4 C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A75
; Address: $C7D49C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A75:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A76
; Address: $C7D4A9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A76:
    JSL $C79190          ; 22 90 91 C7 | Jump to subroutine long
    BCS $07              ; B0 07 | Branch if carry set
    LDA                  ; BF 0C D5 C3 | Load from absolute long,X into accumulator
    JMP $D4BA            ; 4C BA D4 | Jump to address
    LDA                  ; BF 50 D5 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A78
; Address: $C7D4BE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A78:
    JSL $C3226F          ; 22 6F 22 C3 | Jump to subroutine long
    ADC $B012,Y          ; 79 12 B0 | Add with carry (absolute,Y)
    CMP #$7E             ; C9 7E | Compare accumulator (immediate)
    BEQ $27              ; F0 27 | Branch if equal
    CMP #$7F             ; C9 7F | Compare accumulator (immediate)
    BEQ $28              ; F0 28 | Branch if equal
    CMP #$80             ; C9 80 | Compare accumulator (immediate)
    BEQ $29              ; F0 29 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A7C
; Address: $C7D4E6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A7C:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A80
; Address: $C7D505
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A80:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    JMP $D4BE            ; 4C BE D4 | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $DE0A            ; EE 0A DE | Increment (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BEQ $0A              ; F0 0A | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC ($0A),Y          ; F1 0A | Subtract with carry ((zero page),Y)
    CPX #$0A             ; E0 0A | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC ($0A,X)          ; E1 0A | Subtract with carry ((zero page,X))
    SBC ($0A,X)          ; E1 0A | Subtract with carry ((zero page,X))
    SEP #$0A             ; E2 0A | Set processor status bits
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PEA #$E40A           ; F4 0A E4 | Push effective address to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INX                  ; E8 | Increment X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $E90A,Y          ; F9 0A E9 | Subtract with carry (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A81
; Address: $C7D533
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A81:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    NOP                  ; EA | No operation
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    XBA                  ; EB | Exchange accumulator bytes
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX $FD0A            ; EC 0A FD | Compare X register (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $FE0A            ; ED 0A FE | Subtract with carry (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $0A              ; E5 0A | Subtract with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $0A              ; E6 0A | Increment (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $EF0A,X          ; DD 0A EF | Compare accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA                  ; BF 10 D5 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A84
; Address: $C7D561
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A84:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    BCS $6C              ; B0 6C | Branch if carry set
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    STA $BE7D            ; 8D 7D BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A85
; Address: $C7D56E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A85:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $50              ; F0 50 | Branch if equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A87
; Address: $C7D581
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A87:
    JSL $C3D6B7          ; 22 B7 D6 C3 | Jump to subroutine long
    BCS $42              ; B0 42 | Hardware register operation
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A89
; Address: $C7D590
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A89:
    JSL $C43231          ; 22 31 32 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $3722,X          ; FD 22 37 | Subtract with carry (absolute,X)
    CPY $01              ; C4 01 | Compare Y register (zero page)
    SBC $18BF,X          ; FD BF 18 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A90
; Address: $C7D5C4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A90:
    JSL $C1A900          ; 22 00 A9 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A92
; Address: $C7D5CE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A92:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A98
; Address: $C7D5EA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A98:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    BCS $50              ; B0 50 | Branch if carry set
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    STA $BE7D            ; 8D 7D BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A99
; Address: $C7D5F7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A99:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $35              ; F0 35 | Branch if equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A9B
; Address: $C7D60A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A9B:
    JSL $C3D6B7          ; 22 B7 D6 C3 | Jump to subroutine long
    BCS $27              ; B0 27 | Branch if carry set
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_A9C
; Address: $C7D613
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_A9C:
    JSL $C440B0          ; 22 B0 40 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 28 D5 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AAA
; Address: $C7D657
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AAA:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    BCS $50              ; B0 50 | Branch if carry set
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    STA $BE7D            ; 8D 7D BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AAB
; Address: $C7D664
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AAB:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $35              ; F0 35 | Branch if equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AAD
; Address: $C7D677
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AAD:
    JSL $C3D6B7          ; 22 B7 D6 C3 | Jump to subroutine long
    BCS $27              ; B0 27 | Branch if carry set
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AAE
; Address: $C7D680
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AAE:
    JSL $C44168          ; 22 68 41 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 4C D5 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AB8
; Address: $C7D6B7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AB8:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDA $70              ; A5 70 | Load from zero page into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA $71              ; A5 71 | Load from zero page into accumulator
    STA $BE82            ; 8D 82 BE | Store accumulator to absolute address
    LDA                  ; BF 2C D5 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_ABB
; Address: $C7D6D1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_ABB:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    BCS $1B              ; B0 1B | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $16              ; D0 16 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_ABC
; Address: $C7D6DD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_ABC:
    JSL $C45B66          ; 22 66 5B C4 | Jump to subroutine long
    BVS $22              ; 70 22 | Branch if overflow set
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_ABE
; Address: $C7D6EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_ABE:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    JMP $D6FB            ; 4C FB D6 | Jump to address
    LDA                  ; BF 34 D5 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_ABF
; Address: $C7D6F7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_ABF:
    JSL $C1A95A          ; 22 5A A9 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AC0
; Address: $C7D700
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AC0:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    STZ $71              ; 64 71 | Store zero to zero page
    STZ $70              ; 64 70 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AC1
; Address: $C7D706
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AC1:
    JSL $C42FEB          ; 22 EB 2F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SEP #$20             ; E2 20 | Set processor status bits
    PHA                  ; 48 | Push accumulator to stack
    XBA                  ; EB | Exchange accumulator bytes
    PLA                  ; 68 | Pull accumulator from stack
    REP #$20             ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AC2
; Address: $C7D714
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AC2:
    JSL $C01098          ; 22 98 10 C0 | Jump to subroutine long
    STA $70              ; 85 70 | Store accumulator to zero page
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    LDX #$70             ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AC3
; Address: $C7D720
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AC3:
    JSL $C0121C          ; 22 1C 12 C0 | Jump to subroutine long
    INC $70              ; E6 70 | Increment (zero page)
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    LDX #$70             ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AC4
; Address: $C7D72C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AC4:
    JSL $C010D6          ; 22 D6 10 C0 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AC6
; Address: $C7D734
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AC6:
    JSL $C42FEB          ; 22 EB 2F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SEP #$20             ; E2 20 | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    REP #$20             ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AC7
; Address: $C7D742
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AC7:
    JSL $C01098          ; 22 98 10 C0 | Jump to subroutine long
    STA $70              ; 85 70 | Store accumulator to zero page
    STZ $72              ; 64 72 | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AC9
; Address: $C7D74D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AC9:
    JSL $C42FEB          ; 22 EB 2F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_ACA
; Address: $C7D755
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_ACA:
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    ADC #$04             ; 69 04 | Add with carry (immediate)
    STA $70              ; 85 70 | Store accumulator to zero page
    STZ $72              ; 64 72 | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_ACB
; Address: $C7D760
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_ACB:
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
; Bank0E_DmaFunction_ACD
; Address: $C7D772
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_ACD:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    BCS $0F              ; B0 0F | Branch if carry set
    CMP #$82             ; C9 82 | Compare accumulator (immediate)
    BEQ $25              ; F0 25 | Branch if equal
    CMP #$81             ; C9 81 | Compare accumulator (immediate)
    BEQ $26              ; F0 26 | Branch if equal
    CMP #$83             ; C9 83 | Compare accumulator (immediate)
    BEQ $27              ; F0 27 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_ACF
; Address: $C7D78D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_ACF:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    PHX                  ; DA | Push X register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AD1
; Address: $C7D797
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AD1:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AD8
; Address: $C7D7C6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AD8:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    DEC $0A              ; C6 0A | Decrement (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AD9
; Address: $C7D7CD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AD9:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    INY                  ; C8 | Increment Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_ADD
; Address: $C7D7E2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_ADD:
    JSL $C32413          ; 22 13 24 C3 | Jump to subroutine long
    BCS $25              ; B0 25 | Branch if carry set
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_ADE
; Address: $C7D7EB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_ADE:
    JSL $C42F5E          ; 22 5E 2F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $778C,X          ; FD 8C 77 | Subtract with carry (absolute,X)
    LDX $A122,Y          ; BE 22 A1 | Load from absolute,Y into X register
    AND $01C4            ; 2D C4 01 | Logical AND with accumulator (absolute)
    SBC $1D90,X          ; FD 90 1D | Subtract with carry (absolute,X)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_ADF
; Address: $C7D7FF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_ADF:
    JSL $CC8C5A          ; 22 5A 8C CC | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    BCS $15              ; B0 15 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AE0
; Address: $C7D806
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AE0:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AE1
; Address: $C7D80D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AE1:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    CLD                  ; D8 | Clear decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AE2
; Address: $C7D814
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AE2:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AE3
; Address: $C7D81B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AE3:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $7A              ; D0 7A | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AE5
; Address: $C7D82C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AE5:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    CMP $220A            ; CD 0A 22 | Compare accumulator (absolute)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AE6
; Address: $C7D837
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AE6:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $CF              ; B0 CF | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $CA              ; D0 CA | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AE9
; Address: $C7D84F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AE9:
    JSL $C909AE          ; 22 AE 09 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ROR $000F,X          ; 7E 0F 00 | Rotate right (absolute,X)
    BCS $0F              ; B0 0F | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AEB
; Address: $C7D860
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AEB:
    JSL $C908F0          ; 22 F0 08 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ROR $000F,X          ; 7E 0F 00 | Rotate right (absolute,X)
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AEF
; Address: $C7D87B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AEF:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCC $1A              ; 90 1A | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AF2
; Address: $C7D891
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AF2:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $08              ; B0 08 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $D7CD            ; 4C CD D7 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AF3
; Address: $C7D8A1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AF3:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    DEX                  ; CA | Decrement X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AF5
; Address: $C7D8AC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AF5:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $0E              ; B0 0E | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $09              ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AF6
; Address: $C7D8B8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AF6:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $D849            ; 4C 49 D8 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AF8
; Address: $C7D8C8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AF8:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDY #$00             ; A0 00 | Load immediate value into Y register
    DEX                  ; CA | Decrement X register
    BMI $10              ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AF9
; Address: $C7D8D4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AF9:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AFA
; Address: $C7D8DE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AFA:
    BNE $F1              ; D0 F1 | Branch if not equal
    INY                  ; C8 | Increment Y register
    JMP $D8D1            ; 4C D1 D8 | Jump to address
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AFB
; Address: $C7D8E8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AFB:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BEQ $7B              ; F0 7B | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_AFC
; Address: $C7D8F3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_AFC:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $77              ; F0 77 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B03
; Address: $C7D91F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B03:
    JSL $C42F5E          ; 22 5E 2F C4 | Jump to subroutine long
    INC $778E,X          ; FE 8E 77 | Increment (absolute,X)
    LDX $2E22,Y          ; BE 22 2E | Load from absolute,Y into X register
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B05
; Address: $C7D935
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B05:
    JSL $C42A6D          ; 22 6D 2A C4 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    STZ $BD              ; 64 BD | Store zero to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B06
; Address: $C7D940
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B06:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BEQ $22              ; F0 22 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B07
; Address: $C7D94B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B07:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $17              ; F0 17 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B0A
; Address: $C7D961
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B0A:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $05              ; B0 05 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $91              ; F0 91 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B0B
; Address: $C7D96E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B0B:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B0E
; Address: $C7D97C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B0E:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    CLD                  ; D8 | Clear decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B0F
; Address: $C7D983
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B0F:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $0E              ; F0 0E | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B11
; Address: $C7D992
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B11:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCC $0A              ; 90 0A | Branch if carry clear
    JMP $DA6A            ; 4C 6A DA | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B12
; Address: $C7D99C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B12:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B13
; Address: $C7D9A3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B13:
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    STA $33B8            ; 8D B8 33 | Store accumulator to absolute address
    LDX #$05             ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B14
; Address: $C7D9AF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B14:
    JSR $DA75            ; 20 75 DA | Jump to subroutine
    STA $3398            ; 8D 98 33 | Store accumulator to absolute address
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B15
; Address: $C7D9B8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B15:
    JSR $DA75            ; 20 75 DA | Jump to subroutine
    STA $339A            ; 8D 9A 33 | Store accumulator to absolute address
    LDX #$07             ; A2 07 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B17
; Address: $C7D9C7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B17:
    JSL $C46951          ; 22 51 69 C4 | Jump to subroutine long
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $23              ; D0 23 | Branch if not equal
    LDX #$03             ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B18
; Address: $C7D9D6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B18:
    JSR $DA75            ; 20 75 DA | Jump to subroutine
    STA $3396            ; 8D 96 33 | Store accumulator to absolute address
    LDA $3396            ; AD 96 33 | Load from absolute address into accumulator
    BEQ $15              ; F0 15 | Branch if equal
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B19
; Address: $C7D9E7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B19:
    JSL $C3226F          ; 22 6F 22 C3 | Jump to subroutine long
    STX $228B            ; 8E 8B 22 | Store X register to absolute address
    RTI                  ; 40 | Return from interrupt
    BCS $9F              ; B0 9F | Branch if carry set
    JMP $DA6A            ; 4C 6A DA | Jump to address
    LDA $3398            ; AD 98 33 | Load from absolute address into accumulator
    BEQ $22              ; F0 22 | Branch if equal
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B1A
; Address: $C7DA01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B1A:
    JSL $C3226F          ; 22 6F 22 C3 | Jump to subroutine long
    STA $F7228C          ; 8F 8C 22 F7 | Store accumulator to absolute long address
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B1B
; Address: $C7DA0B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B1B:
    BCS $85              ; B0 85 | Branch if carry set
    LDA $339A            ; AD 9A 33 | Load from absolute address into accumulator
    BNE $05              ; D0 05 | Branch if not equal
    LDA $339C            ; AD 9C 33 | Load from absolute address into accumulator
    BEQ $06              ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B1C
; Address: $C7DA17
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B1C:
    JSL $C1E32E          ; 22 2E E3 C1 | Jump to subroutine long
    AND $AD00,X          ; 3D 00 AD | Logical AND with accumulator (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    BEQ $25              ; F0 25 | Branch if equal
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B1E
; Address: $C7DA2E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B1E:
    JSL $C340F7          ; 22 F7 40 C3 | Jump to subroutine long
    BCC $08              ; 90 08 | Branch if carry clear
    LDA $3398            ; AD 98 33 | Load from absolute address into accumulator
    BNE $BD              ; D0 BD | Branch if not equal
    JMP $D992            ; 4C 92 D9 | Jump to address
    LDA $339C            ; AD 9C 33 | Load from absolute address into accumulator
    BEQ $06              ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B1F
; Address: $C7DA41
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B1F:
    JSL $C1E32E          ; 22 2E E3 C1 | Jump to subroutine long
    AND $AD00,X          ; 3D 00 AD | Logical AND with accumulator (absolute,X)
    STZ $F033            ; 9C 33 F0 | Store zero to absolute
    ASL $07A9,X          ; 1E A9 07 | Arithmetic shift left (absolute,X)
    STA $33BA            ; 8D BA 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B20
; Address: $C7DA52
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B20:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    STA ($22),Y          ; 91 22 | Store accumulator to (zero page),Y
    RTI                  ; 40 | Return from interrupt
    BCC $0D              ; 90 0D | Branch if carry clear
    LDA $339A            ; AD 9A 33 | Load from absolute address into accumulator
    BNE $BB              ; D0 BB | Branch if not equal
    LDA $3398            ; AD 98 33 | Load from absolute address into accumulator
    BNE $8F              ; D0 8F | Branch if not equal
    JMP $D992            ; 4C 92 D9 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B21
; Address: $C7DA6A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B21:
    JSL $C323CE          ; 22 CE 23 C3 | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    BIT $C3              ; 24 C3 | Test bits in accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B23
; Address: $C7DA79
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B23:
    JSL $C45796          ; 22 96 57 C4 | Jump to subroutine long
    INC $97AD,X          ; FE AD 97 | Increment (absolute,X)
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B26
; Address: $C7DA95
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B26:
    EOR ($60,X)          ; 41 60 | Exclusive OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    STA $78              ; 85 78 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B27
; Address: $C7DA9C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B27:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B28
; Address: $C7DAA3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B28:
    JSL $C446D6          ; 22 D6 46 C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    INC $E49B,X          ; FE 9B E4 | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    BCS $11              ; B0 11 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B29
; Address: $C7DAAF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B29:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    SBC $22FF,X          ; FD FF 22 | Subtract with carry (absolute,X)
    STA $C453,Y          ; 99 53 C4 | Store accumulator to absolute,Y
    INX                  ; E8 | Increment X register
    JMP $DAAB            ; 4C AB DA | Jump to address
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B2A
; Address: $C7DAC4
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B2A:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B2B
; Address: $C7DAC7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B2B:
    JSL $C429DA          ; 22 DA 29 C4 | Jump to subroutine long
    INC $A422,X          ; FE 22 A4 | Increment (absolute,X)
    LSR $C4              ; 46 C4 | Logical shift right (zero page)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    SBC $3088,X          ; FD 88 30 | Subtract with carry (absolute,X)
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B2D
; Address: $C7DADF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B2D:
    JSL $C45399          ; 22 99 53 C4 | Jump to subroutine long
    JMP $DAD5            ; 4C D5 DA | Jump to address
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B2E
; Address: $C7DAEB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B2E:
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
; Bank0E_DmaFunction_B30
; Address: $C7DAFD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B30:
    JSL $C909AE          ; 22 AE 09 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ROR $0014,X          ; 7E 14 00 | Rotate right (absolute,X)
    BCS $0F              ; B0 0F | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B32
; Address: $C7DB0E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B32:
    JSL $C908F0          ; 22 F0 08 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ROR $0014,X          ; 7E 14 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B35
; Address: $C7DB24
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B35:
    JSL $B019C3          ; 22 C3 19 B0 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $33              ; D0 33 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B38
; Address: $C7DB3A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B38:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BIT $22              ; 24 22 | Test bits in accumulator (zero page)
    EOR $C3              ; 45 C3 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B39
; Address: $C7DB43
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B39:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    BCS $28              ; B0 28 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B3C
; Address: $C7DB54
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B3C:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    INY                  ; C8 | Increment Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    JMP $DB43            ; 4C 43 DB | Jump to address
    JMP $DCFD            ; 4C FD DC | Jump to address
    JMP $DCF7            ; 4C F7 DC | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B3E
; Address: $C7DB6C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B3E:
    JSL $C322E4          ; 22 E4 22 C3 | Jump to subroutine long
    LDA $4CBE,X          ; BD BE 4C | Load from absolute,X into accumulator
    CMP $22DC,X          ; DD DC 22 | Compare accumulator (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    BCC $09              ; 90 09 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B3F
; Address: $C7DB7B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B3F:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    EOR $0B              ; 45 0B | Exclusive OR with accumulator (zero page)
    JMP $DB90            ; 4C 90 DB | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B45
; Address: $C7DBA4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B45:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B47
; Address: $C7DBB2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B47:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    LDA ($B0,X)          ; A1 B0 | Load from (zero page,X) into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    STA $4063            ; 8D 63 40 | Store accumulator to absolute address
    LDA $0000            ; AD 00 00 | Load from absolute address into accumulator
    STA $4061            ; 8D 61 40 | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $4054            ; 8D 54 40 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B48
; Address: $C7DBC8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B48:
    JSL $C441AE          ; 22 AE 41 C4 | Jump to subroutine long
    BCS $95              ; B0 95 | Branch if carry set
    STA $2BB4            ; 8D B4 2B | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B49
; Address: $C7DBD2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B49:
    JSL $C42F5E          ; 22 5E 2F C4 | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B4A
; Address: $C7DBDC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B4A:
    JSL $C3226F          ; 22 6F 22 C3 | Jump to subroutine long
    LDA $22BE,X          ; BD BE 22 | Load from absolute,X into accumulator
    ROL $C1A9            ; 2E A9 C1 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B4B
; Address: $C7DBE8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B4B:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $39              ; B0 39 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $34              ; D0 34 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B4D
; Address: $C7DBF9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B4D:
    JSL $C909AE          ; 22 AE 09 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ROR $0015,X          ; 7E 15 00 | Rotate right (absolute,X)
    BCS $0F              ; B0 0F | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B4F
; Address: $C7DC0A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B4F:
    JSL $C908F0          ; 22 F0 08 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ROR $0015,X          ; 7E 15 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B51
; Address: $C7DC1C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B51:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    BNE $09              ; D0 09 | Branch if not equal
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    JMP $DC2E            ; 4C 2E DC | Jump to address
    JMP $DB67            ; 4C 67 DB | Jump to address
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    STA $2BB2            ; 8D B2 2B | Store accumulator to absolute address
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B54
; Address: $C7DC43
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B54:
    JSL $B0BCC3          ; 22 C3 BC B0 | Jump to subroutine long
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $12              ; D0 12 | Branch if not equal
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $2A60            ; 8D 60 2A | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B55
; Address: $C7DC53
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B55:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    AND $4C0B,X          ; 3D 0B 4C | Logical AND with accumulator (absolute,X)
    ADC $DC              ; 65 DC | Add with carry (zero page)
    JMP $DCDD            ; 4C DD DC | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B56
; Address: $C7DC5F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B56:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    LDA #$04             ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B58
; Address: $C7DC6F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B58:
    JSL $C32296          ; 22 96 22 C3 | Jump to subroutine long
    CLV                  ; B8 | Clear overflow flag
    TSX                  ; BA | Transfer stack pointer to X register
    LDA $F7B0,Y          ; B9 B0 F7 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B59
; Address: $C7DC78
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B59:
    JSR $DE20            ; 20 20 DE | Jump to subroutine
    DEC $2BB2            ; CE B2 2B | Decrement (absolute)
    BNE $E5              ; D0 E5 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B5B
; Address: $C7DC84
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B5B:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    BVC $01              ; 50 01 | Branch if overflow clear
    LDA $2A60            ; AD 60 2A | Load from absolute address into accumulator
    BEQ $09              ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B5C
; Address: $C7DC8F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B5C:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ROL $9C0B,X          ; 3E 0B 9C | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B5D
; Address: $C7DC97
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B5D:
    ROL                  ; 2A | Rotate left (accumulator)
    LDA $BE77            ; AD 77 BE | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $2BB4            ; AD B4 2B | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B5F
; Address: $C7DCA3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B5F:
    JSR $E2D0            ; 20 D0 E2 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B60
; Address: $C7DCAA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B60:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    AND $220B,Y          ; 39 0B 22 | Logical AND with accumulator (absolute,Y)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B61
; Address: $C7DCB7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B61:
    JSL $C323B0          ; 22 B0 23 C3 | Jump to subroutine long
    BIT $68              ; 24 68 | Test bits in accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BCS $17              ; B0 17 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $12              ; D0 12 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B64
; Address: $C7DCCE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B64:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    JMP $DCDD            ; 4C DD DC | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B68
; Address: $C7DCEA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B68:
    JSL $B019C3          ; 22 C3 19 B0 | Jump to subroutine long
    ASL $00C9            ; 0E C9 00 | Arithmetic shift left (absolute)
    BNE $09              ; D0 09 | Branch if not equal
    JMP $DB2E            ; 4C 2E DB | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B6C
; Address: $C7DD07
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B6C:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B6D
; Address: $C7DD13
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B6D:
    JSL $C4467F          ; 22 7F 46 C4 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $DDA3            ; 4C A3 DD | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B70
; Address: $C7DD29
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B70:
    JSL $B019C3          ; 22 C3 19 B0 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $72              ; D0 72 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B76
; Address: $C7DD4E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B76:
    JSL $C32413          ; 22 13 24 C3 | Jump to subroutine long
    BCS $51              ; B0 51 | Branch if carry set
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B77
; Address: $C7DD57
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B77:
    JSL $C42F5E          ; 22 5E 2F C4 | Jump to subroutine long
    INC $778E,X          ; FE 8E 77 | Increment (absolute,X)
    LDX $D6AD,Y          ; BE AD D6 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B78
; Address: $C7DD64
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B78:
    JSL $C429DA          ; 22 DA 29 C4 | Jump to subroutine long
    INC $04EC,X          ; FE EC 04 | Increment (absolute,X)
    BEQ $46              ; F0 46 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B79
; Address: $C7DD70
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B79:
    JSL $C42DA1          ; 22 A1 2D C4 | Jump to subroutine long
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BCS $34              ; B0 34 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B7C
; Address: $C7DD86
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B7C:
    JSL $B019C3          ; 22 C3 19 B0 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $15              ; D0 15 | Branch if not equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B7F
; Address: $C7DD9D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B7F:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    WDM #$0B             ; 42 0B | Reserved instruction
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B80
; Address: $C7DDA5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B80:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B81
; Address: $C7DDAD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B81:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    JMP $4C0B            ; 4C 0B 4C | Jump to address
    CMP $2E22,X          ; DD 22 2E | Compare accumulator (absolute,X)
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    EOR $4C0B            ; 4D 0B 4C | Exclusive OR with accumulator (absolute)
    CMP $DA48,X          ; DD 48 DA | Compare accumulator (absolute,X)
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B82
; Address: $C7DDC2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B82:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    DEC $78              ; C6 78 | Decrement (zero page)
    BMI $0B              ; 30 0B | Branch if negative
    LDA $78              ; A5 78 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B83
; Address: $C7DDCE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B83:
    JSL $C3DDE5          ; 22 E5 DD C3 | Jump to subroutine long
    BCS $04              ; B0 04 | Branch if carry set
    JMP $DDC8            ; 4C C8 DD | Jump to address
    CLC                  ; 18 | Clear carry flag
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B84
; Address: $C7DDDC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B84:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    JMP $DDEF            ; 4C EF DD | Jump to address
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B88
; Address: $C7DDF6
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B88:
    JSL $C1BACC          ; 22 CC BA C1 | Jump to subroutine long
    CMP #$AC             ; C9 AC | Compare accumulator (immediate)
    BEQ $0D              ; F0 0D | Branch if equal
    SEP #$20             ; E2 20 | Set processor status bits
    CMP $3332,X          ; DD 32 33 | Compare accumulator (absolute,X)
    REP #$20             ; C2 20 | Reset processor status bits
    BNE $13              ; D0 13 | Branch if not equal
    INX                  ; E8 | Increment X register
    JMP $DDF6            ; 4C F6 DD | Jump to address
    LDA $3332,X          ; BD 32 33 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$AC             ; C9 AC | Compare accumulator (immediate)
    BNE $04              ; D0 04 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    JMP $DE1C            ; 4C 1C DE | Jump to address
    CLC                  ; 18 | Clear carry flag
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B89
; Address: $C7DE20
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B89:
    TAX                  ; AA | Transfer accumulator to X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF 40 DE C3 | Load from absolute long,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B8B
; Address: $C7DE2F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B8B:
    JSL $C90B3A          ; 22 3A 0B C9 | Jump to subroutine long
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    PLX                  ; FA | Pull X register from stack
    LDY $2BB4            ; AC B4 2B | Load from absolute address into Y register
    EOR $DE              ; 45 DE | Exclusive OR with accumulator (zero page)
    DEC $DE5D,X          ; DE 5D DE | Decrement (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B8C
; Address: $C7DE4A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B8C:
    DEC $DE79,X          ; DE 79 DE | Decrement (absolute,X)
    DEC $6822,X          ; DE 22 68 | Decrement (absolute,X)
    CPY $06              ; C4 06 | Compare Y register (zero page)
    SBC $22FF,X          ; FD FF 22 | Subtract with carry (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP ($CF,X)          ; C1 CF | Compare accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B93
; Address: $C7DE80
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B93:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B96
; Address: $C7DE95
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B96:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $2BBC            ; 8D BC 2B | Store accumulator to absolute address
    STA $7A              ; 85 7A | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B97
; Address: $C7DEA6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B97:
    JSL $C46951          ; 22 51 69 C4 | Jump to subroutine long
    ASL $7A              ; 06 7A | Arithmetic shift left (zero page)
    STA $2BB8            ; 8D B8 2B | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B98
; Address: $C7DEB0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B98:
    JSL $C42E19          ; 22 19 2E C4 | Jump to subroutine long
    ASL $7A              ; 06 7A | Arithmetic shift left (zero page)
    STA $2BBA            ; 8D BA 2B | Store accumulator to absolute address
    STA $4054            ; 8D 54 40 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B99
; Address: $C7DEBD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B99:
    JSL $C42FEB          ; 22 EB 2F C4 | Jump to subroutine long
    ASL $7A              ; 06 7A | Arithmetic shift left (zero page)
    SBC $B8AD,X          ; FD AD B8 | Subtract with carry (absolute,X)
    LDX #$35             ; A2 35 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    STZ $C46B,X          ; 9E 6B C4 | Store zero to absolute,X
    STA $78              ; 85 78 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B9A
; Address: $C7DED0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B9A:
    JSL $C43414          ; 22 14 34 C4 | Jump to subroutine long
    ASL $7A              ; 06 7A | Arithmetic shift left (zero page)
    STA $2BD2            ; 8D D2 2B | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag
    SBC $78              ; E5 78 | Subtract with carry (zero page)
    STA $2BC8            ; 8D C8 2B | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $2BBE            ; 8D BE 2B | Store accumulator to absolute address
    LDA $2BB8            ; AD B8 2B | Load from absolute address into accumulator
    LDX #$41             ; A2 41 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B9C
; Address: $C7DEF2
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B9C:
    JSL $C43644          ; 22 44 36 C4 | Jump to subroutine long
    ASL $7A              ; 06 7A | Arithmetic shift left (zero page)
    STA $2BD4            ; 8D D4 2B | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag
    SBC $78              ; E5 78 | Subtract with carry (zero page)
    STA $2BCA            ; 8D CA 2B | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $2BC0            ; 8D C0 2B | Store accumulator to absolute address
    LDA $2BB8            ; AD B8 2B | Load from absolute address into accumulator
    LDX #$4D             ; A2 4D | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    STZ $C46B,X          ; 9E 6B C4 | Store zero to absolute,X
    STA $78              ; 85 78 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B9D
; Address: $C7DF14
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B9D:
    JSL $C4350C          ; 22 0C 35 C4 | Jump to subroutine long
    ASL $7A              ; 06 7A | Arithmetic shift left (zero page)
    STA $2BD6            ; 8D D6 2B | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag
    SBC $78              ; E5 78 | Subtract with carry (zero page)
    STA $2BCC            ; 8D CC 2B | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $2BC2            ; 8D C2 2B | Store accumulator to absolute address
    LDA $2BB8            ; AD B8 2B | Load from absolute address into accumulator
    LDX #$5B             ; A2 5B | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    STZ $C46B,X          ; 9E 6B C4 | Store zero to absolute,X
    STA $78              ; 85 78 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B9E
; Address: $C7DF36
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B9E:
    JSL $C437C1          ; 22 C1 37 C4 | Jump to subroutine long
    ASL $7A              ; 06 7A | Arithmetic shift left (zero page)
    STA $2BD8            ; 8D D8 2B | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag
    SBC $78              ; E5 78 | Subtract with carry (zero page)
    STA $2BCE            ; 8D CE 2B | Store accumulator to absolute address
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $2BC4            ; 8D C4 2B | Store accumulator to absolute address
    LDA $2BB8            ; AD B8 2B | Load from absolute address into accumulator
    LDX #$67             ; A2 67 | Load immediate value into X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    STZ $C46B,X          ; 9E 6B C4 | Store zero to absolute,X
    STA $78              ; 85 78 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_B9F
; Address: $C7DF58
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_B9F:
    JSL $C438FB          ; 22 FB 38 C4 | Jump to subroutine long
    ASL $7A              ; 06 7A | Arithmetic shift left (zero page)
    STA $2BDA            ; 8D DA 2B | Store accumulator to absolute address
    SEC                  ; 38 | Set carry flag
    SBC $78              ; E5 78 | Subtract with carry (zero page)
    STA $2BD0            ; 8D D0 2B | Store accumulator to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $2BC6            ; 8D C6 2B | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BA4
; Address: $C7DF7D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BA4:
    JSL $C42ED6          ; 22 D6 2E C4 | Jump to subroutine long
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    ASL $AB              ; 06 AB | Arithmetic shift left (zero page)
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BA5
; Address: $C7DF8E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BA5:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDX #$0A             ; A2 0A | Load immediate value into X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BEQ $31              ; F0 31 | Branch if equal
    LDA $2BC8,X          ; BD C8 2B | Load from absolute,X into accumulator
    CMP $2BC6,X          ; DD C6 2B | Compare accumulator (absolute,X)
    BEQ $09              ; F0 09 | Branch if equal
    BCC $F2              ; 90 F2 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BA6
; Address: $C7DFA2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BA6:
    JSR $DFCF            ; 20 CF DF | Jump to subroutine
    INY                  ; C8 | Increment Y register
    JMP $DF94            ; 4C 94 DF | Jump to address
    LDA $2BD2,X          ; BD D2 2B | Load from absolute,X into accumulator
    CMP $2BD0,X          ; DD D0 2B | Compare accumulator (absolute,X)
    BEQ $09              ; F0 09 | Branch if equal
    BCC $E1              ; 90 E1 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BA7
; Address: $C7DFB3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BA7:
    JSR $DFCF            ; 20 CF DF | Jump to subroutine
    INY                  ; C8 | Increment Y register
    JMP $DF94            ; 4C 94 DF | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BA9
; Address: $C7DFC3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BA9:
    JSR $DFCF            ; 20 CF DF | Jump to subroutine
    JMP $DF94            ; 4C 94 DF | Jump to address
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $C0              ; D0 C0 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BAA
; Address: $C7DFCF
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BAA:
    PHY                  ; 5A | Push Y register to stack
    LDA $2BBE,X          ; BD BE 2B | Load from absolute,X into accumulator
    LDY $2BBC,X          ; BC BC 2B | Load from absolute,X into Y register
    STA $2BBC,X          ; 9D BC 2B | Store accumulator to absolute,X
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $2BBE,X          ; 9D BE 2B | Store accumulator to absolute,X
    LDA $2BC8,X          ; BD C8 2B | Load from absolute,X into accumulator
    LDY $2BC6,X          ; BC C6 2B | Load from absolute,X into Y register
    STA $2BC6,X          ; 9D C6 2B | Store accumulator to absolute,X
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BAB
; Address: $C7DFE7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BAB:
    STA $2BC8,X          ; 9D C8 2B | Store accumulator to absolute,X
    LDA $2BD2,X          ; BD D2 2B | Load from absolute,X into accumulator
    LDY $2BD0,X          ; BC D0 2B | Load from absolute,X into Y register
    STA $2BD0,X          ; 9D D0 2B | Store accumulator to absolute,X
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $2BD2,X          ; 9D D2 2B | Store accumulator to absolute,X
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BAC
; Address: $C7DFF9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BAC:
    LDA $2BBE            ; AD BE 2B | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 0E E0 C3 | Load from absolute long,X into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    LDA $2BB8            ; AD B8 2B | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BAD
; Address: $C7E006
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BAD:
    JSL $C46AFD          ; 22 FD 6A C4 | Jump to subroutine long
    INC $60FF,X          ; FE FF 60 | Increment (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BAE
; Address: $C7E019
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BAE:
    JSL $C9050D          ; 22 0D 05 C9 | Jump to subroutine long
    SBC $C30E,X          ; FD 0E C3 | Subtract with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    LDY #$01             ; A0 01 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $7C              ; 85 7C | Store accumulator to zero page
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    STA $7E              ; 85 7E | Store accumulator to zero page
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $0E              ; D0 0E | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BAF
; Address: $C7E042
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BAF:
    JSR $E11A            ; 20 1A E1 | Jump to subroutine
    BCC $0E              ; 90 0E | Branch if carry clear
    LDY #$02             ; A0 02 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BB0
; Address: $C7E050
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BB0:
    JSR $E12E            ; 20 2E E1 | Jump to subroutine
    BEQ $F2              ; F0 F2 | Branch if equal
    LDY #$04             ; A0 04 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $7C              ; 85 7C | Store accumulator to zero page
    LDY #$03             ; A0 03 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BB1
; Address: $C7E064
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BB1:
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    STA $7E              ; 85 7E | Store accumulator to zero page
    LDY #$03             ; A0 03 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $0E              ; D0 0E | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BB2
; Address: $C7E073
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BB2:
    JSR $E11A            ; 20 1A E1 | Jump to subroutine
    BCC $0E              ; 90 0E | Branch if carry clear
    LDY #$05             ; A0 05 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BB3
; Address: $C7E081
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BB3:
    JSR $E12E            ; 20 2E E1 | Jump to subroutine
    BEQ $F2              ; F0 F2 | Branch if equal
    LDY #$07             ; A0 07 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $7C              ; 85 7C | Store accumulator to zero page
    LDY #$06             ; A0 06 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    STA $7E              ; 85 7E | Store accumulator to zero page
    LDY #$06             ; A0 06 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $0E              ; D0 0E | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BB4
; Address: $C7E0A4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BB4:
    JSR $E11A            ; 20 1A E1 | Jump to subroutine
    BCC $0E              ; 90 0E | Branch if carry clear
    LDY #$08             ; A0 08 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BB5
; Address: $C7E0B2
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BB5:
    JSR $E12E            ; 20 2E E1 | Jump to subroutine
    BEQ $F2              ; F0 F2 | Branch if equal
    LDY #$0A             ; A0 0A | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $7C              ; 85 7C | Store accumulator to zero page
    LDY #$09             ; A0 09 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    STA $7E              ; 85 7E | Store accumulator to zero page
    LDY #$09             ; A0 09 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $0E              ; D0 0E | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BB6
; Address: $C7E0D5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BB6:
    JSR $E11A            ; 20 1A E1 | Jump to subroutine
    BCC $0E              ; 90 0E | Branch if carry clear
    LDY #$0B             ; A0 0B | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BB8
; Address: $C7E0E3
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BB8:
    JSR $E12E            ; 20 2E E1 | Jump to subroutine
    BEQ $F2              ; F0 F2 | Branch if equal
    LDY #$0D             ; A0 0D | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $7C              ; 85 7C | Store accumulator to zero page
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    STA $7E              ; 85 7E | Store accumulator to zero page
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $0E              ; D0 0E | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BB9
; Address: $C7E106
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BB9:
    JSR $E11A            ; 20 1A E1 | Jump to subroutine
    BCC $0E              ; 90 0E | Branch if carry clear
    LDY #$0E             ; A0 0E | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BBA
; Address: $C7E114
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BBA:
    JSR $E12E            ; 20 2E E1 | Jump to subroutine
    BEQ $F2              ; F0 F2 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BBB
; Address: $C7E11A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BBB:
    LDX #$0A             ; A2 0A | Load immediate value into X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BEQ $07              ; F0 07 | Branch if equal
    LDA $2BBE,X          ; BD BE 2B | Load from absolute,X into accumulator
    CMP $7C              ; C5 7C | Compare accumulator (zero page)
    BNE $F5              ; D0 F5 | Branch if not equal
    LDA $2BC8,X          ; BD C8 2B | Load from absolute,X into accumulator
    CMP $7E              ; C5 7E | Compare accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BBC
; Address: $C7E12E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BBC:
    LDA $2BC0            ; AD C0 2B | Load from absolute address into accumulator
    CMP $7C              ; C5 7C | Compare accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BBE
; Address: $C7E135
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BBE:
    JSL $C9050D          ; 22 0D 05 C9 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    STZ $2BBE            ; 9C BE 2B | Store zero to absolute
    STZ $2BC0            ; 9C C0 2B | Store zero to absolute
    LDX #$0E             ; A2 0E | Load immediate value into X register
    STZ $2BC2,X          ; 9E C2 2B | Store zero to absolute,X
    STZ $2BD2,X          ; 9E D2 2B | Store zero to absolute,X
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    BPL $F6              ; 10 F6 | Branch if positive
    LDY #$04             ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BBF
; Address: $C7E157
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BBF:
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BC2            ; 8D C2 2B | Store accumulator to absolute address
    LDY #$05             ; A0 05 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BC4            ; 8D C4 2B | Store accumulator to absolute address
    LDY #$06             ; A0 06 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BC6            ; 8D C6 2B | Store accumulator to absolute address
    LDY #$07             ; A0 07 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BC8            ; 8D C8 2B | Store accumulator to absolute address
    LDY #$08             ; A0 08 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BCA            ; 8D CA 2B | Store accumulator to absolute address
    LDY #$09             ; A0 09 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BCC            ; 8D CC 2B | Store accumulator to absolute address
    LDY #$0A             ; A0 0A | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BCE            ; 8D CE 2B | Store accumulator to absolute address
    LDY #$0B             ; A0 0B | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2BD0            ; 8D D0 2B | Store accumulator to absolute address
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$0000           ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BC0
; Address: $C7E1B4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BC0:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    STA $2BD2            ; 8D D2 2B | Store accumulator to absolute address
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$00F0           ; F4 F0 00 | Push effective address to stack
    PEA #$0000           ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BC1
; Address: $C7E1C4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BC1:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    STA $2BD4            ; 8D D4 2B | Store accumulator to absolute address
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$0001           ; F4 01 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BC2
; Address: $C7E1D4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BC2:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    STA $2BD6            ; 8D D6 2B | Store accumulator to absolute address
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$00F0           ; F4 F0 00 | Push effective address to stack
    PEA #$0001           ; F4 01 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BC4
; Address: $C7E1E8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BC4:
    STA $2BD8            ; 8D D8 2B | Store accumulator to absolute address
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$0002           ; F4 02 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BC5
; Address: $C7E1F4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BC5:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    STA $2BDA            ; 8D DA 2B | Store accumulator to absolute address
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$00F0           ; F4 F0 00 | Push effective address to stack
    PEA #$0002           ; F4 02 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BC6
; Address: $C7E204
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BC6:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    STA $2BDC            ; 8D DC 2B | Store accumulator to absolute address
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$000F           ; F4 0F 00 | Push effective address to stack
    PEA #$0003           ; F4 03 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BC7
; Address: $C7E214
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BC7:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    STA $2BDE            ; 8D DE 2B | Store accumulator to absolute address
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$00F0           ; F4 F0 00 | Push effective address to stack
    PEA #$0003           ; F4 03 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BC8
; Address: $C7E224
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BC8:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    STA $2BE0            ; 8D E0 2B | Store accumulator to absolute address
    LDA $2BBA            ; AD BA 2B | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $33              ; F0 33 | Branch if equal
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $2BC2,X          ; BD C2 2B | Load from absolute,X into accumulator
    BEQ $25              ; F0 25 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BC9
; Address: $C7E23B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BC9:
    JSL $C46BED          ; 22 ED 6B C4 | Jump to subroutine long
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $06              ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BCA
; Address: $C7E246
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BCA:
    JSR $E2B4            ; 20 B4 E2 | Jump to subroutine
    JMP $E236            ; 4C 36 E2 | Jump to address
    LDA $2BD2,X          ; BD D2 2B | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $2BC0            ; 6D C0 2B | Add with carry (absolute)
    STA $2BC0            ; 8D C0 2B | Store accumulator to absolute address
    STA $2BD2,X          ; 9D D2 2B | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BCC $D6              ; 90 D6 | Branch if carry clear
    STX $2BBE            ; 8E BE 2B | Store X register to absolute address
    JMP $E296            ; 4C 96 E2 | Jump to address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $2BC2,X          ; BD C2 2B | Load from absolute,X into accumulator
    BEQ $25              ; F0 25 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BCB
; Address: $C7E26E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BCB:
    JSL $C46BED          ; 22 ED 6B C4 | Jump to subroutine long
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $06              ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BCD
; Address: $C7E27C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BCD:
    JMP $E269            ; 4C 69 E2 | Jump to address
    LDA $2BD2,X          ; BD D2 2B | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $2BC0            ; 6D C0 2B | Add with carry (absolute)
    STA $2BC0            ; 8D C0 2B | Store accumulator to absolute address
    STA $2BD2,X          ; 9D D2 2B | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BCC $D6              ; 90 D6 | Branch if carry clear
    STX $2BBE            ; 8E BE 2B | Store X register to absolute address
    LDA $2BC0            ; AD C0 2B | Load from absolute address into accumulator
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BCE
; Address: $C7E29A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BCE:
    JSL $C0135F          ; 22 5F 13 C0 | Jump to subroutine long
    LDX #$00             ; A2 00 | Load immediate value into X register
    CMP $2BD2,X          ; DD D2 2B | Compare accumulator (absolute,X)
    BCC $0A              ; 90 0A | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX $2BBE            ; EC BE 2B | Compare X register (absolute)
    BCC $F4              ; 90 F4 | Branch if carry clear
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $2BC2,X          ; BD C2 2B | Load from absolute,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BCF
; Address: $C7E2B4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BCF:
    PHX                  ; DA | Push X register to stack
    LDA $2BD4,X          ; BD D4 2B | Load from absolute,X into accumulator
    STA $2BD2,X          ; 9D D2 2B | Store accumulator to absolute,X
    LDA $2BC4,X          ; BD C4 2B | Load from absolute,X into accumulator
    STA $2BC2,X          ; 9D C2 2B | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BCC $ED              ; 90 ED | Branch if carry clear
    STZ $2BC0,X          ; 9E C0 2B | Store zero to absolute,X
    STZ $2BD0,X          ; 9E D0 2B | Store zero to absolute,X
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BD0
; Address: $C7E2D0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BD0:
    JSL $C42F28          ; 22 28 2F C4 | Jump to subroutine long
    INC $778E,X          ; FE 8E 77 | Increment (absolute,X)
    LDX $2822,Y          ; BE 22 28 | Load from absolute,Y into X register
    JMP ($FFC4)          ; 6C C4 FF | Jump to address (absolute indirect)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF EA E2 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BD2
; Address: $C7E2EA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BD2:
    PHA                  ; 48 | Push accumulator to stack
    EOR #$0B             ; 49 0B | Exclusive OR with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BD3
; Address: $C7E2F3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BD3:
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BD4
; Address: $C7E2FE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BD4:
    JSL $C909AE          ; 22 AE 09 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ROR $0011,X          ; 7E 11 00 | Rotate right (absolute,X)
    BCS $12              ; B0 12 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BD6
; Address: $C7E30F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BD6:
    JSL $C908F0          ; 22 F0 08 C9 | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ROR $0011,X          ; 7E 11 00 | Rotate right (absolute,X)
    JMP $E340            ; 4C 40 E3 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BD8
; Address: $C7E321
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BD8:
    JSL $C45BBA          ; 22 BA 5B C4 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BD9
; Address: $C7E331
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BD9:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    JMP $E340            ; 4C 40 E3 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BDB
; Address: $C7E340
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BDB:
    JSL $C3226F          ; 22 6F 22 C3 | Jump to subroutine long
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    BCS $0A              ; B0 0A | Branch if carry set
    CMP #$91             ; C9 91 | Compare accumulator (immediate)
    BEQ $39              ; F0 39 | Branch if equal
    CMP #$92             ; C9 92 | Compare accumulator (immediate)
    BEQ $40              ; F0 40 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BDC
; Address: $C7E352
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BDC:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BE0
; Address: $C7E37A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BE0:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BE1
; Address: $C7E381
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BE1:
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BE3
; Address: $C7E389
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BE3:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    BVC $01              ; 50 01 | Branch if overflow clear
    JMP $E357            ; 4C 57 E3 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BE5
; Address: $C7E395
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BE5:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    BVC $01              ; 50 01 | Branch if overflow clear
    JMP $E357            ; 4C 57 E3 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BE6
; Address: $C7E39E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BE6:
    JSL $C45BBA          ; 22 BA 5B C4 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $07              ; 90 07 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BE8
; Address: $C7E3B0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BE8:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    STZ $33B8            ; 9C B8 33 | Store zero to absolute
    STZ $33BA            ; 9C BA 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BEA
; Address: $C7E3C1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BEA:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    TAX                  ; AA | Transfer accumulator to X register
    BCS $41              ; B0 41 | Branch if carry set
    LDA $33BC            ; AD BC 33 | Load from absolute address into accumulator
    BEQ $3C              ; F0 3C | Branch if equal
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BEB
; Address: $C7E3D3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BEB:
    JSL $C45BEB          ; 22 EB 5B C4 | Jump to subroutine long
    BCC $0B              ; 90 0B | Branch if carry clear
    BVS $14              ; 70 14 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BEC
; Address: $C7E3DC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BEC:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    JMP $E3B0            ; 4C B0 E3 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BEF
; Address: $C7E3F0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BEF:
    JSL $C45BBA          ; 22 BA 5B C4 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    LDA #$0F             ; A9 0F | Load immediate value into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    STA ($BE,X)          ; 81 BE | Store accumulator to (zero page,X)
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BF0
; Address: $C7E400
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BF0:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    JMP $E3B0            ; 4C B0 E3 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BF2
; Address: $C7E410
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BF2:
    JSL $C45BBA          ; 22 BA 5B C4 | Jump to subroutine long
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $4F              ; F0 4F | Branch if equal
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BF3
; Address: $C7E420
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BF3:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA #$0B             ; 09 0B | Logical OR with accumulator (immediate)
    STZ $33B8            ; 9C B8 33 | Store zero to absolute
    STZ $33BA            ; 9C BA 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BF5
; Address: $C7E431
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BF5:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    TAX                  ; AA | Transfer accumulator to X register
    BCS $38              ; B0 38 | Branch if carry set
    LDA $33BC            ; AD BC 33 | Load from absolute address into accumulator
    BEQ $33              ; F0 33 | Branch if equal
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BF6
; Address: $C7E443
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BF6:
    JSL $C45C5A          ; 22 5A 5C C4 | Jump to subroutine long
    BCC $14              ; 90 14 | Branch if carry clear
    BVS $09              ; 70 09 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BF7
; Address: $C7E44C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BF7:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $E410            ; 4C 10 E4 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BFB
; Address: $C7E469
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BFB:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_BFC
; Address: $C7E470
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_BFC:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA $600B            ; 0D 0B 60 | Logical OR with accumulator (absolute)
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
; Bank0E_DmaFunction_C03
; Address: $C7E4A7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C03:
    JSL $B0ACC3          ; 22 C3 AC B0 | Jump to subroutine long
    STA $33D6            ; 8D D6 33 | Store accumulator to absolute address
    STA $BE7D            ; 8D 7D BE | Store accumulator to absolute address
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C04
; Address: $C7E4B3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C04:
    JSL $C43F87          ; 22 87 3F C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $25              ; D0 25 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C05
; Address: $C7E4BF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C05:
    JSL $C46951          ; 22 51 69 C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    INC $DA8E,X          ; FE 8E DA | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C06
; Address: $C7E4C9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C06:
    JSL $C4691B          ; 22 1B 69 C4 | Jump to subroutine long
    INC $8EFE,X          ; FE FE 8E | Increment (absolute,X)
    LDX $A122,Y          ; BE 22 A1 | Load from absolute,Y into X register
    AND $01C4            ; 2D C4 01 | Logical AND with accumulator (absolute)
    SBC $90FE,X          ; FD FE 90 | Subtract with carry (absolute,X)
    ASL $2E22,X          ; 1E 22 2E | Arithmetic shift left (absolute,X)
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    JMP $E5C2            ; 4C C2 E5 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C07
; Address: $C7E4E4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C07:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    JMP $E5C2            ; 4C C2 E5 | Jump to address
    JMP $E5DC            ; 4C DC E5 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C09
; Address: $C7E4F9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C09:
    JSL $C42FEB          ; 22 EB 2F C4 | Jump to subroutine long
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    INC $14E0,X          ; FE E0 14 | Increment (absolute,X)
    BCS $0C              ; B0 0C | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C0A
; Address: $C7E505
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C0A:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    JMP $E5C2            ; 4C C2 E5 | Jump to address
    JMP $E5BC            ; 4C BC E5 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C0B
; Address: $C7E511
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C0B:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    STA $33B8            ; 8D B8 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C0F
; Address: $C7E52B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C0F:
    JSL $C32413          ; 22 13 24 C3 | Jump to subroutine long
    BCS $DD              ; B0 DD | Branch if carry set
    STA $33DC            ; 8D DC 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C10
; Address: $C7E534
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C10:
    JSL $C4691B          ; 22 1B 69 C4 | Jump to subroutine long
    INC $778E,X          ; FE 8E 77 | Increment (absolute,X)
    LDX $2E22,Y          ; BE 22 2E | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C13
; Address: $C7E548
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C13:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $C2              ; B0 C2 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $BD              ; D0 BD | Branch if not equal
    LDA $33DC            ; AD DC 33 | Load from absolute address into accumulator
    CMP $33DA            ; CD DA 33 | Compare accumulator (absolute)
    BNE $09              ; D0 09 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C14
; Address: $C7E55C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C14:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    JMP $E511            ; 4C 11 E5 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C16
; Address: $C7E568
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C16:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA $220B,Y          ; 19 0B 22 | Logical OR with accumulator (absolute,Y)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C17
; Address: $C7E573
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C17:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $42              ; B0 42 | Hardware register operation
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $3D              ; D0 3D | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C1B
; Address: $C7E58F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C1B:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C1D
; Address: $C7E59B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C1D:
    JSR $E79C            ; 20 9C E7 | Jump to subroutine
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator
    LDX $33DC            ; AE DC 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C1E
; Address: $C7E5A4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C1E:
    JSL $C46987          ; 22 87 69 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $CC22,X          ; FE 22 CC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C22
; Address: $C7E5C2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C22:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA $220B,X          ; 1D 0B 22 | Logical OR with accumulator (absolute,X)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C23
; Address: $C7E5CD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C23:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $0E              ; B0 0E | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $09              ; D0 09 | Branch if not equal
    JMP $E49A            ; 4C 9A E4 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C27
; Address: $C7E5EC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C27:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C28
; Address: $C7E5F8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C28:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDA $BE77            ; AD 77 BE | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C29
; Address: $C7E602
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C29:
    JSL $C42E53          ; 22 53 2E C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $0122,X          ; FD 22 01 | Subtract with carry (absolute,X)
    ORA $C9              ; 05 C9 | Logical OR with accumulator (zero page)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    BEQ $26              ; F0 26 | Branch if equal
    CPY $78              ; C4 78 | Compare Y register (zero page)
    LDX $33DC            ; AE DC 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C2A
; Address: $C7E617
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C2A:
    JSL $C42F28          ; 22 28 2F C4 | Jump to subroutine long
    SBC $E0FD,X          ; FD FD E0 | Game work RAM access
    BNE $10              ; D0 10 | Branch if not equal
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$0780           ; F4 80 07 | Push effective address to stack
    PEA #$0007           ; F4 07 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C2B
; Address: $C7E62B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C2B:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    JMP $E6C2            ; 4C C2 E6 | Jump to address
    CPX #$01             ; E0 01 | Compare X register (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$0008           ; F4 08 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C2C
; Address: $C7E640
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C2C:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    JMP $E6C2            ; 4C C2 E6 | Jump to address
    CPX #$02             ; E0 02 | Compare X register (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$0009           ; F4 09 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C2D
; Address: $C7E655
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C2D:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    JMP $E6C2            ; 4C C2 E6 | Jump to address
    CPX #$03             ; E0 03 | Compare X register (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$0780           ; F4 80 07 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C2F
; Address: $C7E66A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C2F:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    JMP $E6C2            ; 4C C2 E6 | Jump to address
    CPX #$04             ; E0 04 | Compare X register (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$000A           ; F4 0A 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C30
; Address: $C7E67F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C30:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    JMP $E6C2            ; 4C C2 E6 | Jump to address
    CPX #$05             ; E0 05 | Compare X register (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$0780           ; F4 80 07 | Push effective address to stack
    PEA #$000A           ; F4 0A 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C31
; Address: $C7E694
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C31:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    JMP $E6C2            ; 4C C2 E6 | Jump to address
    CPX #$06             ; E0 06 | Compare X register (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$000B           ; F4 0B 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C32
; Address: $C7E6A9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C32:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    JMP $E6C2            ; 4C C2 E6 | Jump to address
    CPX #$07             ; E0 07 | Compare X register (immediate)
    BNE $12              ; D0 12 | Branch if not equal
    PEA #$0078           ; F4 78 00 | Push effective address to stack
    PEA #$0780           ; F4 80 07 | Push effective address to stack
    PEA #$0009           ; F4 09 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C33
; Address: $C7E6BE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C33:
    JSL $C90717          ; 22 17 07 C9 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    INC $68              ; E6 68 | Increment (zero page)
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C34
; Address: $C7E6D0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C34:
    INC $E4              ; E6 E4 | Increment (zero page)
    INC $F4              ; E6 F4 | Increment (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    ROL $E7              ; 26 E7 | Rotate left (zero page)
    PLY                  ; 7A | Pull Y register from stack
    STY $E7              ; 84 E7 | Store Y register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C3B
; Address: $C7E701
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C3B:
    JSL $AD600B          ; 22 0B 60 AD | Jump to subroutine long
    LDX $8C48,Y          ; BE 48 8C | Load from absolute,Y into X register
    LDX $2E22,Y          ; BE 22 2E | Load from absolute,Y into X register
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    PLA                  ; 68 | Pull accumulator from stack
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C3C
; Address: $C7E715
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C3C:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    BIT $0B              ; 24 0B | Test bits in accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C3E
; Address: $C7E71F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C3E:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    AND $0B              ; 25 0B | Logical AND with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C3F
; Address: $C7E726
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C3F:
    LDA $BE77            ; AD 77 BE | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    STY $BE77            ; 8C 77 BE | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C40
; Address: $C7E72D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C40:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ROL $0B              ; 26 0B | Rotate left (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C42
; Address: $C7E73D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C42:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C43
; Address: $C7E744
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C43:
    LDA $BE77            ; AD 77 BE | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    STY $BE77            ; 8C 77 BE | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C44
; Address: $C7E74B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C44:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    AND #$0B             ; 29 0B | Logical AND with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C47
; Address: $C7E762
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C47:
    LDA $BE77            ; AD 77 BE | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    STY $BE77            ; 8C 77 BE | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C48
; Address: $C7E769
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C48:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    BIT $680B            ; 2C 0B 68 | Test bits in accumulator (absolute)
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C49
; Address: $C7E773
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C49:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    AND $600B            ; 2D 0B 60 | Logical AND with accumulator (absolute)
    STY $BE77            ; 8C 77 BE | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C4A
; Address: $C7E77D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C4A:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ROL $600B            ; 2E 0B 60 | Rotate left (absolute)
    LDA $BE77            ; AD 77 BE | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C4C
; Address: $C7E78B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C4C:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C4D
; Address: $C7E795
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C4D:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    BMI $0B              ; 30 0B | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C4E
; Address: $C7E79C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C4E:
    LDA $33DC            ; AD DC 33 | Load from absolute address into accumulator
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BNE $27              ; D0 27 | Branch if not equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C4F
; Address: $C7E7A7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C4F:
    JSL $C46951          ; 22 51 69 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BEQ $18              ; F0 18 | Branch if equal
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    LDX $33D6            ; AE D6 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C50
; Address: $C7E7B9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C50:
    JSL $C44DC0          ; 22 C0 4D C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BCC $08              ; 90 08 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C51
; Address: $C7E7C3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C51:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C52
; Address: $C7E7CC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C52:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    STA $78              ; 85 78 | Store accumulator to zero page
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C56
; Address: $C7E7E6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C56:
    JSR $E7ED            ; 20 ED E7 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C57
; Address: $C7E7ED
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C57:
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    STA $2BB8            ; 8D B8 2B | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C58
; Address: $C7E7F3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C58:
    JSL $C446A4          ; 22 A4 46 C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    STA $2BB2            ; 8D B2 2B | Store accumulator to absolute address
    STA $7A              ; 85 7A | Store accumulator to zero page
    STZ $2BBA            ; 9C BA 2B | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C59
; Address: $C7E802
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C59:
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $2BBC            ; 8D BC 2B | Store accumulator to absolute address
    STA $2BBE            ; 8D BE 2B | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C5A
; Address: $C7E80B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C5A:
    JSL $C44708          ; 22 08 47 C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    SBC $B68C,X          ; FD 8C B6 | Subtract with carry (absolute,X)
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    DEC $7A              ; C6 7A | Decrement (zero page)
    BMI $3C              ; 30 3C | Branch if negative
    LDA $0000,Y          ; B9 00 00 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C5B
; Address: $C7E822
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C5B:
    JSL $C44FE2          ; 22 E2 4F C4 | Jump to subroutine long
    INC $CDFF,X          ; FE FF CD | Increment (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    BNE $E9              ; D0 E9 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C5D
; Address: $C7E834
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C5D:
    JSL $C44A72          ; 22 72 4A C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    INC $FF40,X          ; FE 40 FF | Increment (absolute,X)
    BCS $D7              ; B0 D7 | Branch if carry set
    CMP $2BBA            ; CD BA 2B | Compare accumulator (absolute)
    BCC $D2              ; 90 D2 | Branch if carry clear
    BEQ $D0              ; F0 D0 | Branch if equal
    STA $2BBA            ; 8D BA 2B | Store accumulator to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    SEC                  ; 38 | Set carry flag
    SBC $2BB6            ; ED B6 2B | Subtract with carry (absolute)
    STA $2BBC            ; 8D BC 2B | Store accumulator to absolute address
    STX $2BBE            ; 8E BE 2B | Store X register to absolute address
    JMP $E816            ; 4C 16 E8 | Jump to address
    LDA $2BB2            ; AD B2 2B | Load from absolute address into accumulator
    CMP #$0C             ; C9 0C | Compare accumulator (immediate)
    BEQ $63              ; F0 63 | Branch if equal
    STZ $2BB4            ; 9C B4 2B | Store zero to absolute
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    LDA $3825,Y          ; B9 25 38 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BEQ $37              ; F0 37 | Branch if equal
    LDA $3725,Y          ; B9 25 37 | Load from absolute,Y into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C5E
; Address: $C7E87A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C5E:
    JSL $C44FE2          ; 22 E2 4F C4 | Jump to subroutine long
    INC $CDFF,X          ; FE FF CD | Increment (absolute,X)
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C61
; Address: $C7E88C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C61:
    JSL $C44A72          ; 22 72 4A C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    INC $FF40,X          ; FE 40 FF | Increment (absolute,X)
    BCS $CE              ; B0 CE | Branch if carry set
    CMP $2BBA            ; CD BA 2B | Compare accumulator (absolute)
    BCC $C9              ; 90 C9 | Branch if carry clear
    BEQ $C7              ; F0 C7 | Branch if equal
    STA $2BBA            ; 8D BA 2B | Store accumulator to absolute address
    STX $2BBE            ; 8E BE 2B | Store X register to absolute address
    INC $2BB4            ; EE B4 2B | Increment (absolute)
    JMP $E865            ; 4C 65 E8 | Jump to address
    LDA $2BB4            ; AD B4 2B | Load from absolute address into accumulator
    BEQ $13              ; F0 13 | Branch if equal
    LDA $2BBE            ; AD BE 2B | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C63
; Address: $C7E8B7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C63:
    JSL $C44739          ; 22 39 47 C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    STA $2BBC            ; 8D BC 2B | Store accumulator to absolute address
    LDA $2BBC            ; AD BC 2B | Load from absolute address into accumulator
    BMI $08              ; 30 08 | Branch if negative

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C64
; Address: $C7E8C7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C64:
    JSL $C44C1B          ; 22 1B 4C C4 | Jump to subroutine long
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C65
; Address: $C7E8D3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C65:
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
; Bank0E_DmaFunction_C66
; Address: $C7E8DF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C66:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    CMP $2209            ; CD 09 22 | Compare accumulator (absolute)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C67
; Address: $C7E8EA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C67:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $05              ; B0 05 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $EB15            ; 4C 15 EB | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C68
; Address: $C7E8F9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C68:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    DEC $2209            ; CE 09 22 | Decrement (absolute)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C6B
; Address: $C7E90E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C6B:
    JSL $C3EBCD          ; 22 CD EB C3 | Jump to subroutine long
    BCS $0B              ; B0 0B | Branch if carry set
    BVC $06              ; 50 06 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C6C
; Address: $C7E916
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C6C:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA #$4C             ; 09 4C | Logical OR with accumulator (immediate)
    STX $E9              ; 86 E9 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C6F
; Address: $C7E929
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C6F:
    JSL $C1E59C          ; 22 9C E5 C1 | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    BCC $F4              ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C73
; Address: $C7E941
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C73:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $35              ; B0 35 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $30              ; D0 30 | Branch if not equal
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C75
; Address: $C7E95A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C75:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    SBC #$09             ; E9 09 | Subtract with carry (immediate)
    JMP $EAF6            ; 4C F6 EA | Jump to address
    LDA $33D8            ; AD D8 33 | Load from absolute address into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C77
; Address: $C7E96E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C77:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ROL $C1A9            ; 2E A9 C1 | Rotate left (absolute)
    INX                  ; E8 | Increment X register
    ORA #$4C             ; 09 4C | Logical OR with accumulator (immediate)
    SBC #$22             ; E9 22 | Subtract with carry (immediate)
    ROL $C1A9            ; 2E A9 C1 | Rotate left (absolute)
    INC $09              ; E6 09 | Increment (zero page)
    JMP $EAF6            ; 4C F6 EA | Jump to address
    LDA $33D8            ; AD D8 33 | Load from absolute address into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C78
; Address: $C7E98C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C78:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    CPX $1E              ; E4 1E | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C7B
; Address: $C7E99F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C7B:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $EAD3            ; 4C D3 EA | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C7D
; Address: $C7E9AC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C7D:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP $33D6            ; CD D6 33 | Compare accumulator (absolute)
    BEQ $0C              ; F0 0C | Branch if equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C7E
; Address: $C7E9BA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C7E:
    JSL $C3DDE5          ; 22 E5 DD C3 | Jump to subroutine long
    BCS $E5              ; B0 E5 | Branch if carry set
    JMP $E9C9            ; 4C C9 E9 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C81
; Address: $C7E9CF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C81:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    CMP $4C09,Y          ; D9 09 4C | Compare accumulator (absolute,Y)
    NOP                  ; EA | No operation

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C84
; Address: $C7E9E4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C84:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    CMP $4C09,X          ; DD 09 4C | Compare accumulator (absolute,X)
    NOP                  ; EA | No operation

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C86
; Address: $C7E9F3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C86:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    DEC $2209,X          ; DE 09 22 | Decrement (absolute,X)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C87
; Address: $C7E9FE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C87:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $49              ; B0 49 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $44              ; D0 44 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C88
; Address: $C7EA0A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C88:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C89
; Address: $C7EA15
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C89:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $32              ; B0 32 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $2D              ; D0 2D | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C92
; Address: $C7EA45
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C92:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    SBC ($09,X)          ; E1 09 | Subtract with carry ((zero page,X))
    JMP $EAB5            ; 4C B5 EA | Jump to address
    JMP $EADC            ; 4C DC EA | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C96
; Address: $C7EA62
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C96:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $05              ; B0 05 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $9C              ; F0 9C | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C97
; Address: $C7EA6E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C97:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C98
; Address: $C7EA79
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C98:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $05              ; B0 05 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $85              ; F0 85 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C99
; Address: $C7EA85
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C99:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    CPX $09              ; E4 09 | Compare X register (zero page)
    JMP $E992            ; 4C 92 E9 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C9C
; Address: $C7EA99
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C9C:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $3C              ; B0 3C | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $37              ; D0 37 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_C9F
; Address: $C7EAAF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_C9F:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    AND #$C4             ; 29 C4 | Logical AND with accumulator (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP $33D6            ; CD D6 33 | Compare accumulator (absolute)
    BEQ $0C              ; F0 0C | Branch if equal
    LDA $33D6            ; AD D6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CA0
; Address: $C7EAC3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CA0:
    JSL $C42FAE          ; 22 AE 2F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    JMP $EAF6            ; 4C F6 EA | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CA4
; Address: $C7EADC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CA4:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CA5
; Address: $C7EAE7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CA5:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $08              ; B0 08 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $E986            ; 4C 86 E9 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CA7
; Address: $C7EAFB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CA7:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CA8
; Address: $C7EB06
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CA8:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $08              ; B0 08 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $E8F9            ; 4C F9 E8 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CA9
; Address: $C7EB15
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CA9:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CAA
; Address: $C7EB1F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CAA:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CAB
; Address: $C7EB2B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CAB:
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $70              ; 85 70 | Store accumulator to zero page
    LDA #$F5             ; A9 F5 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $72              ; 85 72 | Store accumulator to zero page
    LDA #$C3             ; A9 C3 | Load immediate value into accumulator
    STA $74              ; 85 74 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CAD
; Address: $C7EB3F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CAD:
    LDA #$16             ; A9 16 | Load immediate value into accumulator
    STA $70              ; 85 70 | Store accumulator to zero page
    LDA #$68             ; A9 68 | Load immediate value into accumulator
    STA $72              ; 85 72 | Store accumulator to zero page
    LDA #$C3             ; A9 C3 | Load immediate value into accumulator
    STA $74              ; 85 74 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CAF
; Address: $C7EB53
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CAF:
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    DEC $70              ; C6 70 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CB0
; Address: $C7EB57
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CB0:
    BMI $4E              ; 30 4E | Branch if negative
    LDA $70              ; A5 70 | Load from zero page into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CB2
; Address: $C7EB66
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CB2:
    JSL $C1BACC          ; 22 CC BA C1 | Jump to subroutine long
    CMP #$AC             ; C9 AC | Compare accumulator (immediate)
    BEQ $29              ; F0 29 | Branch if equal
    SEP #$20             ; E2 20 | Set processor status bits
    CMP $3332,X          ; DD 32 33 | Compare accumulator (absolute,X)
    REP #$20             ; C2 20 | Reset processor status bits
    BEQ $1C              ; F0 1C | Branch if equal
    CMP #$AB             ; C9 AB | Compare accumulator (immediate)
    BCS $D8              ; B0 D8 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    LDA #$43             ; A9 43 | Load immediate value into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$0C             ; E9 0C | Subtract with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    SEP #$20             ; E2 20 | Set processor status bits
    CMP $3332,X          ; DD 32 33 | Compare accumulator (absolute,X)
    REP #$20             ; C2 20 | Reset processor status bits
    BNE $C1              ; D0 C1 | Branch if not equal
    INX                  ; E8 | Increment X register
    JMP $EB66            ; 4C 66 EB | Jump to address
    LDA $3332,X          ; BD 32 33 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    CMP #$AC             ; C9 AC | Compare accumulator (immediate)
    BNE $B2              ; D0 B2 | Branch if not equal
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CB3
; Address: $C7EBA7
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CB3:
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CB4
; Address: $C7EBAB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CB4:
    SEP #$20             ; E2 20 | Set processor status bits
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $3333,X          ; BD 33 33 | Load from absolute,X into accumulator
    CMP #$AC             ; C9 AC | Compare accumulator (immediate)
    BEQ $09              ; F0 09 | Branch if equal
    CMP $3332,X          ; DD 32 33 | Compare accumulator (absolute,X)
    BNE $0D              ; D0 0D | Branch if not equal
    INX                  ; E8 | Increment X register
    JMP $EBB0            ; 4C B0 EB | Jump to address
    CPX #$03             ; E0 03 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CB5
; Address: $C7EBC3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CB5:
    BCC $04              ; 90 04 | Branch if carry clear
    REP #$20             ; C2 20 | Reset processor status bits
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CB6
; Address: $C7EBC9
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CB6:
    REP #$20             ; C2 20 | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CB7
; Address: $C7EBCD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CB7:
    PHP                  ; 08 | Push processor status to stack
    BVC $06              ; 50 06 | Branch if overflow clear
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    JMP $EBDD            ; 4C DD EB | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CB8
; Address: $C7EBD6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CB8:
    JSL $C42F5E          ; 22 5E 2F C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA $33D8            ; 8D D8 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CBA
; Address: $C7EBE7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CBA:
    JSL $C1BACC          ; 22 CC BA C1 | Jump to subroutine long
    SEP #$20             ; E2 20 | Set processor status bits
    STA $3332,X          ; 9D 32 33 | Store accumulator to absolute,X
    REP #$20             ; C2 20 | Reset processor status bits
    CMP #$AC             ; C9 AC | Compare accumulator (immediate)
    BEQ $04              ; F0 04 | Branch if equal
    INX                  ; E8 | Increment X register
    JMP $EBE7            ; 4C E7 EB | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CBC
; Address: $C7EC01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CBC:
    JSL $C3EBAB          ; 22 AB EB C3 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CBD
; Address: $C7EC0A
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CBD:
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CBE
; Address: $C7EC0D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CBE:
    JSR $EC2E            ; 20 2E EC | Jump to subroutine
    LDA #$94             ; A9 94 | Load immediate value into accumulator
    STA $7FD4            ; 8D D4 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CC0
; Address: $C7EC1A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CC0:
    JSL $C028B4          ; 22 B4 28 C0 | Jump to subroutine long
    LDA $7FD4            ; AD D4 7F | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$21             ; E9 21 | PPU graphics register access
    STA $7FD4            ; 8D D4 7F | Store accumulator to absolute address
    BPL $EC              ; 10 EC | Branch if positive

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CC2
; Address: $C7EC2E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CC2:
    LDA $7FD0            ; AD D0 7F | Load from absolute address into accumulator
    STA $33C8            ; 8D C8 33 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $7FD0            ; 8D D0 7F | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CC3
; Address: $C7EC3A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CC3:
    LDA $7FD2            ; AD D2 7F | Load from absolute address into accumulator
    STA $33CA            ; 8D CA 33 | Store accumulator to absolute address
    LDA #$17             ; A9 17 | Load immediate value into accumulator
    STA $7FD2            ; 8D D2 7F | Store accumulator to absolute address
    LDA $7FD4            ; AD D4 7F | Load from absolute address into accumulator
    STA $33CC            ; 8D CC 33 | Store accumulator to absolute address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $7FD4            ; 8D D4 7F | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CC4
; Address: $C7EC53
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CC4:
    LDA $33C8            ; AD C8 33 | Load from absolute address into accumulator
    STA $7FD0            ; 8D D0 7F | Store accumulator to absolute address
    LDA $33CA            ; AD CA 33 | Load from absolute address into accumulator
    STA $7FD2            ; 8D D2 7F | Store accumulator to absolute address
    LDA $33CC            ; AD CC 33 | Load from absolute address into accumulator
    STA $7FD4            ; 8D D4 7F | Store accumulator to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CC5
; Address: $C7EC66
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CC5:
    JSR $EC2E            ; 20 2E EC | Jump to subroutine
    LDY #$08             ; A0 08 | Load immediate value into Y register
    LDA #$EF             ; A9 EF | Load immediate value into accumulator
    AND $D48D,X          ; 3D 8D D4 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CC7
; Address: $C7EC79
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CC7:
    JSL $C028B4          ; 22 B4 28 C0 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    BNE $EC              ; D0 EC | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CC9
; Address: $C7EC84
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CC9:
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
; Bank0E_DmaFunction_CCA
; Address: $C7EC90
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CCA:
    JSR $ED82            ; 20 82 ED | Jump to subroutine
    STA $337A            ; 8D 7A 33 | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BCC $17              ; 90 17 | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $10              ; 90 10 | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CMP #$16             ; C9 16 | Compare accumulator (immediate)
    BCC $09              ; 90 09 | Branch if carry clear
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CCB
; Address: $C7ECAD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CCB:
    INX                  ; E8 | Increment X register
    CMP #$1E             ; C9 1E | Compare accumulator (immediate)
    BCC $02              ; 90 02 | Branch if carry clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA                  ; BF 78 ED C3 | Load from absolute long,X into accumulator
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CCC
; Address: $C7ECBA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CCC:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    STA $3370            ; 8D 70 33 | Store accumulator to absolute address
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CCD
; Address: $C7ECC2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CCD:
    JSL $C9050D          ; 22 0D 05 C9 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    CMP $0D              ; C5 0D | Compare accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$01             ; A0 01 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CCE
; Address: $C7ECD8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CCE:
    JSR $EDBB            ; 20 BB ED | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDY #$03             ; A0 03 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CCF
; Address: $C7ECE5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CCF:
    JSR $EDBB            ; 20 BB ED | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDY #$05             ; A0 05 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CD0
; Address: $C7ECF2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CD0:
    JSR $EDBB            ; 20 BB ED | Jump to subroutine
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDY #$07             ; A0 07 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CD1
; Address: $C7ECFF
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CD1:
    JSR $EDBB            ; 20 BB ED | Jump to subroutine
    STZ $3372            ; 9C 72 33 | Store zero to absolute
    STZ $2008            ; 9C 08 20 | Store zero to absolute
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2000            ; 8D 00 20 | Store accumulator to absolute address
    BEQ $06              ; F0 06 | Branch if equal
    INC $2008            ; EE 08 20 | Increment (absolute)
    INC $3372            ; EE 72 33 | Increment (absolute)
    STZ $200A            ; 9C 0A 20 | Store zero to absolute
    LDY #$02             ; A0 02 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CD2
; Address: $C7ED26
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CD2:
    STA $2002            ; 8D 02 20 | Store accumulator to absolute address
    BEQ $06              ; F0 06 | Branch if equal
    INC $200A            ; EE 0A 20 | Increment (absolute)
    INC $3372            ; EE 72 33 | Increment (absolute)
    STZ $200C            ; 9C 0C 20 | Store zero to absolute
    LDY #$04             ; A0 04 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2004            ; 8D 04 20 | Store accumulator to absolute address
    BEQ $06              ; F0 06 | Branch if equal
    INC $200C            ; EE 0C 20 | Increment (absolute)
    INC $3372            ; EE 72 33 | Increment (absolute)
    STZ $200E            ; 9C 0E 20 | Store zero to absolute
    LDY #$06             ; A0 06 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $2006            ; 8D 06 20 | Store accumulator to absolute address
    BEQ $06              ; F0 06 | Branch if equal
    INC $200E            ; EE 0E 20 | Increment (absolute)
    INC $3372            ; EE 72 33 | Increment (absolute)
    STZ $3378            ; 9C 78 33 | Store zero to absolute
    LDA $3372            ; AD 72 33 | Load from absolute address into accumulator
    DEC                  ; 3A | Decrement accumulator
    BEQ $0A              ; F0 0A | Branch if equal
    BMI $08              ; 30 08 | Branch if negative

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CD3
; Address: $C7ED68
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CD3:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $3378            ; 8D 78 33 | Store accumulator to absolute address
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CD4
; Address: $C7ED78
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CD4:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ROL $00              ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CD5
; Address: $C7ED82
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CD5:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CD6
; Address: $C7ED89
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CD6:
    JSL $C42DA1          ; 22 A1 2D C4 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BCS $06              ; B0 06 | Branch if carry set
    DEX                  ; CA | Decrement X register
    BPL $F4              ; 10 F4 | Branch if positive
    JMP $EDA0            ; 4C A0 ED | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CD9
; Address: $C7EDA0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CD9:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    INC $22CA,X          ; FE CA 22 | Increment (absolute,X)
    LDA ($2D,X)          ; A1 2D | Load from (zero page,X) into accumulator
    CPY $04              ; C4 04 | Compare Y register (zero page)
    INC $B0FF,X          ; FE FF B0 | Increment (absolute,X)
    DEX                  ; CA | Decrement X register
    BPL $F4              ; 10 F4 | Branch if positive

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CDA
; Address: $C7EDB3
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CDA:
    JSL $C42FEB          ; 22 EB 2F C4 | Jump to subroutine long
    INC $60FF,X          ; FE FF 60 | Increment (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    STA $337C,X          ; 9D 7C 33 | Store accumulator to absolute,X
    STZ $3384,X          ; 9E 84 33 | Store zero to absolute,X
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BCC $15              ; 90 15 | Branch if carry clear
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BCC $16              ; 90 16 | Branch if carry clear
    CMP #$1F             ; C9 1F | Compare accumulator (immediate)
    BCC $17              ; 90 17 | Branch if carry clear
    CMP #$65             ; C9 65 | Compare accumulator (immediate)
    BCC $18              ; 90 18 | Branch if carry clear
    LDA #$C8             ; A9 C8 | Load immediate value into accumulator
    JMP $EDF3            ; 4C F3 ED | Jump to address
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    JMP $EDF3            ; 4C F3 ED | Jump to address
    LDA #$0E             ; A9 0E | Load immediate value into accumulator
    JMP $EDF3            ; 4C F3 ED | Jump to address
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    JMP $EDF3            ; 4C F3 ED | Jump to address
    LDA #$64             ; A9 64 | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CDB
; Address: $C7EDF7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CDB:
    JSL $C0133E          ; 22 3E 13 C0 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    BPL $43              ; 10 43 | Branch if positive
    PHX                  ; DA | Push X register to stack
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    STA $70              ; 85 70 | Store accumulator to zero page
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    LDX #$70             ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CDC
; Address: $C7EE10
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CDC:
    JSL $C0121C          ; 22 1C 12 C0 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CDD
; Address: $C7EE16
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CDD:
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    SEC                  ; 38 | Set carry flag
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    STA $3384,X          ; 9D 84 33 | Store accumulator to absolute,X
    LDA $337C,X          ; BD 7C 33 | Load from absolute,X into accumulator
    BEQ $04              ; F0 04 | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    STA $337C,X          ; 9D 7C 33 | Store accumulator to absolute,X
    LDA $337C,X          ; BD 7C 33 | Load from absolute,X into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $70              ; E5 70 | Subtract with carry (zero page)
    BEQ $02              ; F0 02 | Branch if equal
    BPL $06              ; 10 06 | Branch if positive
    STZ $3384,X          ; 9E 84 33 | Store zero to absolute,X
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $337C,X          ; 9D 7C 33 | Store accumulator to absolute,X
    JMP $EE60            ; 4C 60 EE | Jump to address
    PHX                  ; DA | Push X register to stack
    STA $70              ; 85 70 | Store accumulator to zero page
    LDA #$0A             ; A9 0A | Load immediate value into accumulator
    LDX #$70             ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CDE
; Address: $C7EE4F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CDE:
    JSL $C0121C          ; 22 1C 12 C0 | Jump to subroutine long
    PLX                  ; FA | Pull X register from stack
    STA $3384,X          ; 9D 84 33 | Store accumulator to absolute,X
    LDA $70              ; A5 70 | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $337C,X          ; 7D 7C 33 | Add with carry (absolute,X)
    STA $337C,X          ; 9D 7C 33 | Store accumulator to absolute,X
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CDF
; Address: $C7EE64
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CDF:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $337A            ; AD 7A 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CE3
; Address: $C7EE85
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CE3:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $75              ; B0 75 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $70              ; D0 70 | Branch if not equal
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $3376            ; AD 76 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CE7
; Address: $C7EEA8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CE7:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $47              ; B0 47 | Branch if carry set
    STA $3374            ; 8D 74 33 | Store accumulator to absolute address
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$000C           ; F4 0C 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CE8
; Address: $C7EEBB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CE8:
    JSL $C902E9          ; 22 E9 02 C9 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $2000,X          ; BD 00 20 | Load from absolute,X into accumulator
    STA $BE71            ; 8D 71 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CE9
; Address: $C7EEC7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CE9:
    JSR $F022            ; 20 22 F0 | Jump to subroutine
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    PEA #$2011           ; F4 11 20 | Push effective address to stack
    PEA #$0040           ; F4 40 00 | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CEB
; Address: $C7EEDD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CEB:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    LDX $A309,Y          ; BE 09 A3 | Load from absolute,Y into X register
    PHP                  ; 08 | Push processor status to stack
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    JMP $EF19            ; 4C 19 EF | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CEC
; Address: $C7EEED
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CEC:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    LDA                  ; BF 09 4C 0C | Load from absolute long,X into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDA $3376            ; AD 76 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CEE
; Address: $C7EF01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CEE:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    LDY $2209,X          ; BC 09 22 | Load from absolute,X into Y register
    EOR ($22),Y          ; 51 22 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CEF
; Address: $C7EF0C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CEF:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    LDA $A309,X          ; BD 09 A3 | Load from absolute,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CF2
; Address: $C7EF22
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CF2:
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CF3
; Address: $C7EF29
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CF3:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($9C,X)          ; 01 9C | Logical OR with accumulator ((zero page,X))
    LDX $818D,Y          ; BE 8D 81 | Load from absolute,Y into X register
    LDX $60FA,Y          ; BE FA 60 | Load from absolute,Y into X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CF4
; Address: $C7EF38
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CF4:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $3374            ; AD 74 33 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $3384,Y          ; B9 84 33 | Load from absolute,Y into accumulator
    LDX $3376            ; AE 76 33 | Load from absolute address into X register
    STX $70              ; 86 70 | Store X register to zero page
    LDX #$70             ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CF6
; Address: $C7EF5B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CF6:
    JSL $C01243          ; 22 43 12 C0 | Jump to subroutine long
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BCC $02              ; 90 02 | Branch if carry clear
    INC $70              ; E6 70 | Increment (zero page)
    LDA $70              ; A5 70 | Load from zero page into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $337C,Y          ; B9 7C 33 | Load from absolute,Y into accumulator
    STA $70              ; 85 70 | Store accumulator to zero page
    LDX #$70             ; A2 70 | Load immediate value into X register
    LDA $3376            ; AD 76 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CF7
; Address: $C7EF74
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CF7:
    JSL $C01146          ; 22 46 11 C0 | Jump to subroutine long
    LDA $70              ; A5 70 | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    BVS $90              ; 70 90 | Branch if overflow set
    INC $72              ; E6 72 | Increment (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    LDA $70              ; A5 70 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CF8
; Address: $C7EF86
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CF8:
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $72              ; A5 72 | Load from zero page into accumulator
    STA $BE83            ; 8D 83 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CF9
; Address: $C7EF90
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CF9:
    JSL $C45B1A          ; 22 1A 5B C4 | Jump to subroutine long
    BVS $AB              ; 70 AB | Branch if overflow set
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CFC
; Address: $C7EF9F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CFC:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    LDA $3376            ; AD 76 33 | Load from absolute address into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CFD
; Address: $C7EFB1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CFD:
    JSL $C45B1A          ; 22 1A 5B C4 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_CFE
; Address: $C7EFBE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CFE:
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
; Bank0E_DmaFunction_CFF
; Address: $C7EFCA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_CFF:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D01
; Address: $C7EFD6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D01:
    JSL $C322C6          ; 22 C6 22 C3 | Jump to subroutine long
    BCS $2F              ; B0 2F | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $2A              ; D0 2A | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D04
; Address: $C7EFEF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D04:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    LDX $3378            ; AE 78 33 | Load from absolute address into X register
    LDA $2000,X          ; BD 00 20 | Load from absolute,X into accumulator
    STA $BE71            ; 8D 71 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D06
; Address: $C7F003
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D06:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ORA $4C06,Y          ; 19 06 4C | Logical OR with accumulator (absolute,Y)
    BEQ $22              ; F0 22 | Branch if equal
    ROL $C1A9            ; 2E A9 C1 | Rotate left (absolute)
    INC                  ; 1A | Increment accumulator
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D07
; Address: $C7F016
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D07:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D08
; Address: $C7F022
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D08:
    STZ $338C            ; 9C 8C 33 | Store zero to absolute
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CMP $2000,Y          ; D9 00 20 | Compare accumulator (absolute,Y)
    BNE $12              ; D0 12 | Branch if not equal
    PHA                  ; 48 | Push accumulator to stack
    PHY                  ; 5A | Push Y register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($D0,X)          ; 01 D0 | Logical OR with accumulator ((zero page,X))
    ASL $AD              ; 06 AD | Arithmetic shift left (zero page)
    STY $8D33            ; 8C 33 8D | Store Y register to absolute address
    STX $7A33            ; 8E 33 7A | Store X register to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    INC $338C            ; EE 8C 33 | Increment (absolute)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BCC $E2              ; 90 E2 | Branch if carry clear
    LDA $338C            ; AD 8C 33 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCC $0A              ; 90 0A | Branch if carry clear
    LDA $338E            ; AD 8E 33 | Load from absolute address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF F5 0E C3 | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D0A
; Address: $C7F05C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D0A:
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
; Bank0E_DmaFunction_D0C
; Address: $C7F06B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D0C:
    JSR $EF29            ; 20 29 EF | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D0D
; Address: $C7F076
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D0D:
    PHP                  ; 08 | Push processor status to stack
    REP #$30             ; C2 30 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    PHB                  ; 8B | Push data bank register to stack
    PEA #$7E7E           ; F4 7E 7E | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    PEA #$3538           ; F4 38 35 | Push effective address to stack
    PEA #$3FC0           ; F4 C0 3F | Push effective address to stack
    PEA #$7E00           ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D0E
; Address: $C7F08B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D0E:
    JSL $C9029E          ; 22 9E 02 C9 | Jump to subroutine long
    STA $2BB2            ; 8D B2 2B | Store accumulator to absolute address
    LDX #$0C             ; A2 0C | Load immediate value into X register
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D10
; Address: $C7F09D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D10:
    JSL $C3F1BD          ; 22 BD F1 C3 | Jump to subroutine long
    STA $2BB4            ; 8D B4 2B | Store accumulator to absolute address
    CLC                  ; 18 | Clear carry flag
    ADC $2BB2            ; 6D B2 2B | Add with carry (absolute)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    STA $2BB6            ; 8D B6 2B | Store accumulator to absolute address
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    PEA #$3538           ; F4 38 35 | Push effective address to stack
    PEA #$3FC0           ; F4 C0 3F | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D13
; Address: $C7F0C9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D13:
    JSL $C3F199          ; 22 99 F1 C3 | Jump to subroutine long
    BCC $12              ; 90 12 | Branch if carry clear
    LDA $2BB6            ; AD B6 2B | Load from absolute address into accumulator
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D14
; Address: $C7F0D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D14:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ADC $4C0D            ; 6D 0D 4C | Add with carry (absolute)
    BIT #$F1             ; 89 F1 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D15
; Address: $C7F0E1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D15:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    STZ $0D              ; 64 0D | Store zero to zero page
    LDA $2BB2            ; AD B2 2B | Load from absolute address into accumulator
    BNE $1D              ; D0 1D | Branch if not equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D16
; Address: $C7F0EC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D16:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ADC $0D              ; 65 0D | Add with carry (zero page)
    LDA $2BB4            ; AD B4 2B | Load from absolute address into accumulator
    BNE $03              ; D0 03 | Branch if not equal
    JMP $F189            ; 4C 89 F1 | Jump to address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D18
; Address: $C7F100
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D18:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    ROR $0D              ; 66 0D | Rotate right (zero page)
    JMP $F114            ; 4C 14 F1 | Jump to address
    LDA $2BB4            ; AD B4 2B | Load from absolute address into accumulator
    BEQ $57              ; F0 57 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D19
; Address: $C7F10E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D19:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    ORA $2E22            ; 0D 22 2E | Logical OR with accumulator (absolute)
    LDA #$C1             ; A9 C1 | Load immediate value into accumulator
    ORA $B6AD            ; 0D AD B6 | Logical OR with accumulator (absolute)
    CMP $2BBA            ; CD BA 2B | Compare accumulator (absolute)
    BCC $52              ; 90 52 | Branch if carry clear
    LDA $2BBC            ; AD BC 2B | Load from absolute address into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D1A
; Address: $C7F128
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D1A:
    JSL $C44824          ; 22 24 48 C4 | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    LDA $2BBA            ; AD BA 2B | Load from absolute address into accumulator
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D1C
; Address: $C7F13D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D1C:
    JSL $C1A8D4          ; 22 D4 A8 C1 | Jump to subroutine long
    ROR                  ; 6A | Rotate right (accumulator)
    ORA $B8AE            ; 0D AE B8 | Logical OR with accumulator (absolute)
    INX                  ; E8 | Increment X register
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    BCS $83              ; B0 83 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D1F
; Address: $C7F153
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D1F:
    JSL $C3F239          ; 22 39 F2 C3 | Jump to subroutine long
    STA $2BBA            ; 8D BA 2B | Store accumulator to absolute address
    STX $2BB8            ; 8E B8 2B | Store X register to absolute address
    LDA $2BB6            ; AD B6 2B | Load from absolute address into accumulator
    CMP $2BBA            ; CD BA 2B | Compare accumulator (absolute)
    BCS $BD              ; B0 BD | Branch if carry set
    LDA $2BB6            ; AD B6 2B | Load from absolute address into accumulator
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D21
; Address: $C7F173
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D21:
    ORA $BAAD            ; 0D AD BA | Logical OR with accumulator (absolute)
    STZ $BE82            ; 9C 82 BE | Store zero to absolute
    STA $BE81            ; 8D 81 BE | Store accumulator to absolute address
    LDA $2BBC            ; AD BC 2B | Load from absolute address into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D22
; Address: $C7F183
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D22:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    JMP ($220D)          ; 6C 0D 22 | Jump to address (absolute indirect)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D23
; Address: $C7F18D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D23:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D24
; Address: $C7F199
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D24:
    INC                  ; 1A | Increment accumulator
    STA $78              ; 85 78 | Store accumulator to zero page
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D25
; Address: $C7F19F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D25:
    JSL $C3F239          ; 22 39 F2 C3 | Jump to subroutine long
    STA $2BBA            ; 8D BA 2B | Store accumulator to absolute address
    CMP $78              ; C5 78 | Compare accumulator (zero page)
    BCS $07              ; B0 07 | Branch if carry set
    INX                  ; E8 | Increment X register
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    BCC $EF              ; 90 EF | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D26
; Address: $C7F1B1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D26:
    JSL $C3F21E          ; 22 1E F2 C3 | Jump to subroutine long
    STA $2BBC            ; 8D BC 2B | Store accumulator to absolute address
    STX $2BB8            ; 8E B8 2B | Store X register to absolute address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D28
; Address: $C7F1C2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D28:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    STZ $7C              ; 64 7C | Store zero to zero page
    DEC $7A              ; C6 7A | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D2A
; Address: $C7F1CE
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D2A:
    JSL $C44DC0          ; 22 C0 4D C4 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    INC $F290,X          ; FE 90 F2 | Increment (absolute,X)
    LDA $7C              ; A5 7C | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $2BB2            ; 6D B2 2B | Add with carry (absolute)
    CMP $2BBE            ; CD BE 2B | Compare accumulator (absolute)
    BCS $38              ; B0 38 | Branch if carry set
    INC $7C              ; E6 7C | Increment (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D2B
; Address: $C7F1E5
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D2B:
    JSL $C4487F          ; 22 7F 48 C4 | Jump to subroutine long
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    INC $4C40,X          ; FE 40 4C | Increment (absolute,X)
    DEC $22F1            ; CE F1 22 | Decrement (absolute)
    EOR $53              ; 45 53 | Exclusive OR with accumulator (zero page)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $78              ; 65 78 | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA $7A              ; 85 7A | Store accumulator to zero page
    DEC $7A              ; C6 7A | Decrement (zero page)
    BMI $15              ; 30 15 | Branch if negative
    LDA $7C              ; A5 7C | Load from zero page into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $2BB2            ; 6D B2 2B | Add with carry (absolute)
    CMP $2BBE            ; CD BE 2B | Compare accumulator (absolute)
    BCS $0A              ; B0 0A | Branch if carry set
    INC $7C              ; E6 7C | Increment (zero page)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D2C
; Address: $C7F213
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D2C:
    JSL $C453F7          ; 22 F7 53 C4 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    JMP $F202            ; 4C 02 F2 | Jump to address
    LDA $7C              ; A5 7C | Load from zero page into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D2D
; Address: $C7F21E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D2D:
    PHX                  ; DA | Push X register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D2E
; Address: $C7F227
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D2E:
    JSL $C01098          ; 22 98 10 C0 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ADC #$01             ; 69 01 | Add with carry (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 50 13 C3 | Load from absolute long,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D2F
; Address: $C7F239
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D2F:
    PHX                  ; DA | Push X register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D30
; Address: $C7F242
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D30:
    JSL $C01098          ; 22 98 10 C0 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ADC #$00             ; 69 00 | Add with carry (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDA                  ; BF 50 13 C3 | Load from absolute long,X into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D31
; Address: $C7F254
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D31:
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
; Bank0E_DmaFunction_D34
; Address: $C7F269
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D34:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $19              ; B0 19 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $F4              ; F0 F4 | Branch if equal

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D35
; Address: $C7F275
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D35:
    JSL $C32251          ; 22 51 22 C3 | Jump to subroutine long
    BCS $ED              ; B0 ED | Branch if carry set
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$02             ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D37
; Address: $C7F289
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D37:
    JSL $C31EE4          ; 22 E4 1E C3 | Jump to subroutine long
    PLB                  ; AB | Pull data bank register from stack
    REP #$30             ; C2 30 | Reset processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D39
; Address: $C7F296
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D39:
    JMP $C98EE8          ; 5C E8 8E C9 | Jump to address long
    LDA $3390            ; AD 90 33 | Load from absolute address into accumulator
    BEQ $2E              ; F0 2E | Branch if equal
    LDY $338C            ; AC 8C 33 | Load from absolute address into Y register
    LDX #$00             ; A2 00 | Load immediate value into X register
    SEI                  ; 78 | Set interrupt disable flag
    STA $EE65,X          ; 9D 65 EE | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D3A
; Address: $C7F2AA
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D3A:
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    LDA $338C            ; AD 8C 33 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$C0             ; E9 C0 | Subtract with carry (immediate)
    ORA ($CD,X)          ; 01 CD | Logical OR with accumulator ((zero page,X))
    STX $9033            ; 8E 33 90 | Store X register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STZ $3390            ; 9C 90 33 | Store zero to absolute
    LDA $338C            ; AD 8C 33 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$C0             ; 69 C0 | Add with carry (immediate)
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    STY $6B33            ; 8C 33 6B | Store Y register to absolute address
    LDY $338C            ; AC 8C 33 | Load from absolute address into Y register
    LDX #$00             ; A2 00 | Load immediate value into X register
    SEI                  ; 78 | Set interrupt disable flag
    STA $EE65,X          ; 9D 65 EE | Store accumulator to absolute,X
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    CPY $338E            ; CC 8E 33 | Compare Y register (absolute)
    BCC $0B              ; 90 0B | Branch if carry clear
    INC $3390            ; EE 90 33 | Increment (absolute)
    LDA $338C            ; AD 8C 33 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$C0             ; E9 C0 | Subtract with carry (immediate)
    ORA ($A8,X)          ; 01 A8 | Logical OR with accumulator ((zero page,X))
    STY $338C            ; 8C 8C 33 | Store Y register to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D3B
; Address: $C7F2F5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D3B:
    JSL $C4297C          ; 22 7C 29 C4 | Jump to subroutine long
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    BMI $0B              ; 30 0B | Branch if negative

;------------------------------------------------------------------------------
; Bank0E_DmaFunction_D3D
; Address: $C7F302
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0E_DmaFunction_D3D:
    JSL $C3E7CC          ; 22 CC E7 C3 | Jump to subroutine long
    JMP $F2FB            ; 4C FB F2 | Jump to address
    RTL                  ; 6B | Return from subroutine long
