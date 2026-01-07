;==============================================================================
; Dragon Quest III - Bank $7D
; Type: Data
; Purpose: Data tables and constants
; Address Range: $FE8000-$FEFFFF
; Instructions: 42
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_7D"

;------------------------------------------------------------------------------
; Bank7D_DataFunction_000
; Address: $FF1001
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7D_DataFunction_000:
	TSX				  ; BA | Transfer stack pointer to X register
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$61			 ; C9 61 | Compare accumulator (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7D_DataFunction_001
; Address: $FF100C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7D_DataFunction_001:
	STY $32D0			; 8C D0 32 | Store Y register to absolute address
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA $02			  ; 85 02 | Store accumulator to zero page
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7D_DataFunction_002
; Address: $FF1017
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7D_DataFunction_002:
	LDA $7E32D0		  ; AF D0 32 7E | Load from absolute long address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $02			  ; D0 02 | Branch if not equal
	BRA $1D			  ; 80 1D | Branch always
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $20			  ; A5 20 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$42			 ; 69 42 | Hardware register operation
	STA $20			  ; 85 20 | Store accumulator to zero page
	LDX #$0C			 ; A2 0C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank7D_DataFunction_004
; Address: $FF1033
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7D_DataFunction_004:
	JSL $C32BD2		  ; 22 D2 2B C3 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $7E32D0		  ; 8F D0 32 7E | Store accumulator to absolute long address
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7D_DataFunction_005
; Address: $FF1300
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7D_DataFunction_005:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 00 80 43 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank7D_DataFunction_007
; Address: $FF130C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7D_DataFunction_007:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 00 80 43 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
