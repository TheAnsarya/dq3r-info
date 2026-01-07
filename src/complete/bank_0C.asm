;==============================================================================
; Dragon Quest III - Bank $0C
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $C60000-$C67FFF
; Instructions: 12292
; Bytes: 32770
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_0C"

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_001
; Address: $C68004
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_001:
	JSR $0000			; 20 00 00 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	BCS $52			  ; B0 52 | Branch if carry set
	BRA $20			  ; 80 20 | Branch always
	STZ $0060			; 9C 60 00 | Store zero to absolute
	AND ($DC,X)		  ; 21 DC | Logical AND with accumulator ((zero page,X))
	BPL $90			  ; 10 90 | Branch if positive
	BPL $7A			  ; 10 7A | Branch if positive
	WDM #$BC			 ; 42 BC | Reserved instruction
	BCC $20			  ; 90 20 | Branch if carry clear
	CMP #$60			 ; C9 60 | Compare accumulator (immediate)
	WDM #$B4			 ; 42 B4 | Reserved instruction
	BCC $20			  ; 90 20 | Branch if carry clear
	WDM #$61			 ; 42 61 | Reserved instruction
	WDM #$B4			 ; 42 B4 | Reserved instruction
	BCC $20			  ; 90 20 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	BCS $12			  ; B0 12 | Branch if carry set
	BCC $60			  ; 90 60 | Branch if carry clear
	SBC #$61			 ; E9 61 | Subtract with carry (immediate)
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	EOR ($80),Y		  ; 51 80 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_002
; Address: $C68058
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_002:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($62),Y		  ; 11 62 | Logical OR with accumulator ((zero page),Y)
	BCS $46			  ; B0 46 | Branch if carry set
	BRA $20			  ; 80 20 | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_004
; Address: $C68070
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_004:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CMP ($6B),Y		  ; D1 6B | Compare accumulator ((zero page),Y)
	BCS $4C			  ; B0 4C | Branch if carry set
	BRA $20			  ; 80 20 | Branch always
	STA ($6E,X)		  ; 81 6E | Store accumulator to (zero page,X)
	JMP $1298			; 4C 98 12 | Jump to address
	BCC $60			  ; 90 60 | Branch if carry clear
	EOR ($E0,X)		  ; 41 E0 | Game work RAM access
	BCC $20			  ; 90 20 | Branch if carry clear
	PEA #$00A6		   ; F4 A6 00 | Push effective address to stack
	INC $B1			  ; E6 B1 | Increment (zero page)
	ORA ($D0),Y		  ; 11 D0 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_005
; Address: $C680A0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_005:
	JSL $0000B0		  ; 22 B0 00 00 | Jump to subroutine long
	SEI				  ; 78 | Set interrupt disable flag
	ASL $54			  ; 06 54 | Arithmetic shift left (zero page)
	BRA $01			  ; 80 01 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ADC #$62			 ; 69 62 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_006
; Address: $C680B5
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_006:
	ASL $54			  ; 06 54 | Arithmetic shift left (zero page)
	BRA $01			  ; 80 01 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ADC #$62			 ; 69 62 | Add with carry (immediate)
	ROR $5406			; 6E 06 54 | Rotate right (absolute)
	BRA $01			  ; 80 01 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ADC #$62			 ; 69 62 | Add with carry (immediate)
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	BRA $01			  ; 80 01 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ADC #$62			 ; 69 62 | Add with carry (immediate)
	LDY $51			  ; A4 51 | Load from zero page into Y register
	BRA $20			  ; 80 20 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	LDY $51			  ; A4 51 | Load from zero page into Y register
	BRA $20			  ; 80 20 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	LDY $51			  ; A4 51 | Load from zero page into Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	LDX $51			  ; A6 51 | Load from zero page into X register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $60			  ; 90 60 | Branch if carry clear
	CLV				  ; B8 | Clear overflow flag
	STA $9012,Y		  ; 99 12 90 | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_007
; Address: $C68121
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_007:
	BCS $13			  ; B0 13 | Branch if carry set
	BCC $60			  ; 90 60 | Branch if carry clear
	JMP $980063		  ; 5C 63 00 98 | Jump to address long
	STA $9012,Y		  ; 99 12 90 | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_008
; Address: $C68139
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_008:
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $60			  ; 90 60 | Branch if carry clear
	LDA $1299,Y		  ; B9 99 12 | Load from absolute,Y into accumulator
	BCC $60			  ; 90 60 | Branch if carry clear
	LDX #$99			 ; A2 99 | Load immediate value into X register
	BCC $60			  ; 90 60 | Branch if carry clear
	LDA ($99),Y		  ; B1 99 | Load from (zero page),Y into accumulator
	BCC $60			  ; 90 60 | Branch if carry clear
	STA $9012,Y		  ; 99 12 90 | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_009
; Address: $C68175
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_009:
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $60			  ; 90 60 | Branch if carry clear
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $60			  ; 90 60 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_00A
; Address: $C68189
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_00A:
	STA $0063,X		  ; 9D 63 00 | Store accumulator to absolute,X
	STA ($A0,X)		  ; 81 A0 | Store accumulator to (zero page,X)
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_00B
; Address: $C68192
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_00B:
	JSL $BE0000		  ; 22 00 00 BE | Jump to subroutine long
	AND #$3C			 ; 29 3C | Logical AND with accumulator (immediate)
	EOR $2096			; 4D 96 20 | Exclusive OR with accumulator (absolute)
	STZ $00			  ; 64 00 | Store zero to zero page
	AND #$48			 ; 29 48 | Logical AND with accumulator (immediate)
	EOR $3899			; 4D 99 38 | Exclusive OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_00C
; Address: $C681AE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_00C:
	ADC $00			  ; 65 00 | Add with carry (zero page)
	EOR ($FA,X)		  ; 41 FA | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_00D
; Address: $C681B4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_00D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	LDX #$65			 ; A2 65 | Load immediate value into X register
	STY $A1			  ; 84 A1 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_00E
; Address: $C681C0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_00E:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	STY $A1			  ; 84 A1 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_00F
; Address: $C681CC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_00F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	CPY $A1			  ; C4 A1 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_010
; Address: $C681D8
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_010:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	PLP				  ; 28 | Pull processor status from stack
	LDA ($12,X)		  ; A1 12 | Load from (zero page,X) into accumulator
	ROR $0029,X		  ; 7E 29 00 | Rotate right (absolute,X)
	STZ $00			  ; 64 00 | Store zero to zero page
	BMI $3C			  ; 30 3C | Branch if negative
	ORA $2091			; 0D 91 20 | Logical OR with accumulator (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ADC #$62			 ; 69 62 | Add with carry (immediate)
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	EOR ($BA,X)		  ; 41 BA | Exclusive OR with accumulator ((zero page,X))
	BCC $20			  ; 90 20 | Branch if carry clear
	AND $0000			; 2D 00 00 | Logical AND with accumulator (absolute)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	REP #$50			 ; C2 50 | Reset processor status bits
	BCC $00			  ; 90 00 | Branch if carry clear
	ROR $00			  ; 66 00 | Rotate right (zero page)
	REP #$50			 ; C2 50 | Reset processor status bits
	BCC $00			  ; 90 00 | Branch if carry clear
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CMP #$A6			 ; C9 A6 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_011
; Address: $C68237
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_011:
	BCC $20			  ; 90 20 | Branch if carry clear
	EOR $0066,Y		  ; 59 66 00 | Exclusive OR with accumulator (absolute,Y)
	LSR $10A2			; 4E A2 10 | Logical shift right (absolute)
	BCC $00			  ; 90 00 | Branch if carry clear
	ROR $0066,X		  ; 7E 66 00 | Rotate right (absolute,X)
	LDX #$10			 ; A2 10 | Load immediate value into X register
	BCC $00			  ; 90 00 | Branch if carry clear
	ROR $0066,X		  ; 7E 66 00 | Rotate right (absolute,X)
	LDA $9A0741		  ; AF 41 07 9A | Load from absolute long address into accumulator
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	CMP ($66,X)		  ; C1 66 | Compare accumulator ((zero page,X))
	EOR ($FA,X)		  ; 41 FA | Exclusive OR with accumulator ((zero page,X))
	BMI $08			  ; 30 08 | Branch if negative
	ORA $D1			  ; 05 D1 | Logical OR with accumulator (zero page)
	BPL $90			  ; 10 90 | Branch if positive
	BIT $98			  ; 24 98 | Test bits in accumulator (zero page)
	BNE $A0			  ; D0 A0 | Branch if not equal
	BCC $00			  ; 90 00 | Branch if carry clear
	STA ($6A,X)		  ; 81 6A | Store accumulator to (zero page,X)
	EOR ($9C,X)		  ; 41 9C | Exclusive OR with accumulator ((zero page,X))
	BCC $00			  ; 90 00 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	AND $6A22,Y		  ; 39 22 6A | Logical AND with accumulator (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	LDY $8046			; AC 46 80 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_012
; Address: $C68298
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_012:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $39			  ; E5 39 | Subtract with carry (zero page)
	LSR $80			  ; 46 80 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_013
; Address: $C682A4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_013:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CMP ($6B),Y		  ; D1 6B | Compare accumulator ((zero page),Y)
	BMI $4B			  ; 30 4B | Branch if negative
	BRA $20			  ; 80 20 | Branch always
	INC $6C			  ; E6 6C | Increment (zero page)
	LDX #$F0			 ; A2 F0 | Load immediate value into X register
	BCC $20			  ; 90 20 | Branch if carry clear
	ADC ($70,X)		  ; 61 70 | Add with carry ((zero page,X))
	EOR #$B8			 ; 49 B8 | Exclusive OR with accumulator (immediate)
	EOR ($80),Y		  ; 51 80 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_014
; Address: $C682C8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_014:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CMP $0077			; CD 77 00 | Compare accumulator (absolute)
	REP #$F1			 ; C2 F1 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_015
; Address: $C682D4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_015:
	JSR $3D00			; 20 00 3D | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BVS $00			  ; 70 00 | Branch if overflow set
	CMP #$51			 ; C9 51 | Compare accumulator (immediate)
	BRA $20			  ; 80 20 | Branch always
	CMP $0077			; CD 77 00 | Compare accumulator (absolute)
	STX $D1			  ; 86 D1 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_018
; Address: $C682F8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_018:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BVS $9E			  ; 70 9E | Branch if overflow set
	ADC $DD			  ; 65 DD | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_01B
; Address: $C68310
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_01B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	DEC $A3			  ; C6 A3 | Decrement (zero page)
	AND ($F8,X)		  ; 21 F8 | Logical AND with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	BCC $20			  ; 90 20 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	AND ($B0,X)		  ; 21 B0 | Logical AND with accumulator ((zero page,X))
	JMP $002090		  ; 5C 90 20 00 | Jump to address long
	INC $0077			; EE 77 00 | Increment (absolute)
	WDM #$E4			 ; 42 E4 | Reserved instruction
	EOR ($90),Y		  ; 51 90 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_01C
; Address: $C68334
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_01C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ADC ($7A),Y		  ; 71 7A | Add with carry ((zero page),Y)
	WDM #$E4			 ; 42 E4 | Reserved instruction
	BCC $20			  ; 90 20 | Branch if carry clear
	BRA $7A			  ; 80 7A | Branch always
	WDM #$E4			 ; 42 E4 | Reserved instruction
	BCC $20			  ; 90 20 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $9050			; CD 50 90 | Compare accumulator (absolute)
	CPY $EC			  ; C4 EC | Compare Y register (zero page)
	BVC $93			  ; 50 93 | Branch if overflow clear
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	CPY $C9			  ; C4 C9 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_020
; Address: $C68388
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_020:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLV				  ; B8 | Clear overflow flag
	STA $9012,Y		  ; 99 12 90 | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_022
; Address: $C683A0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_022:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BMI $B4			  ; 30 B4 | Branch if negative
	BRA $20			  ; 80 20 | Branch always
	SBC $7B			  ; E5 7B | Subtract with carry (zero page)
	BMI $B4			  ; 30 B4 | Branch if negative
	WDM #$80			 ; 42 80 | Reserved instruction

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_023
; Address: $C683B8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_023:
	JSR $0000			; 20 00 00 | Jump to subroutine
	LDA $94			  ; A5 94 | Load from zero page into accumulator
	REP #$F0			 ; C2 F0 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_024
; Address: $C683C4
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_024:
	JSR $4F00			; 20 00 4F | Jump to subroutine
	INC $0093,X		  ; FE 93 00 | Increment (absolute,X)
	WDM #$F2			 ; 42 F2 | Reserved instruction
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	ADC $3600,X		  ; 7D 00 36 | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	BRA $20			  ; 80 20 | Branch always
	ADC $4800,X		  ; 7D 00 48 | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($90),Y		  ; 11 90 | Logical OR with accumulator ((zero page),Y)
	DEC $007D			; CE 7D 00 | Decrement (absolute)
	BCS $48			  ; B0 48 | Branch if carry set
	BMI $10			  ; 30 10 | Branch if negative
	ROL $7E			  ; 26 7E | Rotate left (zero page)
	ADC #$A6			 ; 69 A6 | Add with carry (immediate)
	BRA $20			  ; 80 20 | Branch always
	BRA $20			  ; 80 20 | Branch always
	BVC $7F			  ; 50 7F | Branch if overflow clear
	LSR $48B0			; 4E B0 48 | Logical shift right (absolute)
	BMI $10			  ; 30 10 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $2600,Y		  ; 59 00 26 | Exclusive OR with accumulator (absolute,Y)
	ROR $6B00,X		  ; 7E 00 6B | Rotate right (absolute,X)
	LDX $52			  ; A6 52 | Load from zero page into X register
	BRA $20			  ; 80 20 | Branch always
	TAX				  ; AA | Transfer accumulator to X register
	BRA $20			  ; 80 20 | Branch always
	BVC $7F			  ; 50 7F | Branch if overflow clear
	LDY #$11			 ; A0 11 | Load immediate value into Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $8043,X		  ; 9D 43 80 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_025
; Address: $C68448
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_025:
	JSR $0000			; 20 00 00 | Jump to subroutine
	XBA				  ; EB | Exchange accumulator bytes
	LDA ($11,X)		  ; A1 11 | Load from (zero page,X) into accumulator
	BCC $00			  ; 90 00 | Branch if carry clear
	TXS				  ; 9A | Transfer X register to stack pointer
	LDA ($11,X)		  ; A1 11 | Load from (zero page,X) into accumulator
	BCC $00			  ; 90 00 | Branch if carry clear
	TXS				  ; 9A | Transfer X register to stack pointer
	LDA ($11,X)		  ; A1 11 | Load from (zero page,X) into accumulator
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_029
; Address: $C68484
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_029:
	JSR $0000			; 20 00 00 | Jump to subroutine
	EOR $0080,X		  ; 5D 80 00 | Exclusive OR with accumulator (absolute,X)
	WDM #$C8			 ; 42 C8 | Reserved instruction
	JMP $2080			; 4C 80 20 | Jump to address
	BRA $00			  ; 80 00 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	PHA				  ; 48 | Push accumulator to stack
	BRA $20			  ; 80 20 | Branch always
	BIT $81			  ; 24 81 | Test bits in accumulator (zero page)
	INY				  ; C8 | Increment Y register
	CPY #$57			 ; C0 57 | Compare Y register (immediate)
	BCC $20			  ; 90 20 | Branch if carry clear
	SBC $81			  ; E5 81 | Subtract with carry (zero page)
	BIT #$84			 ; 89 84 | Test bits in accumulator (immediate)
	PHY				  ; 5A | Push Y register to stack
	BRA $01			  ; 80 01 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ROR $0082			; 6E 82 00 | Rotate right (absolute)
	ADC #$84			 ; 69 84 | Add with carry (immediate)
	PHY				  ; 5A | Push Y register to stack
	BRA $01			  ; 80 01 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ROR $0082			; 6E 82 00 | Rotate right (absolute)
	EOR $A0			  ; 45 A0 | Exclusive OR with accumulator (zero page)
	ORA ($90),Y		  ; 11 90 | Logical OR with accumulator ((zero page),Y)
	STA $0083			; 8D 83 00 | Store accumulator to absolute address
	EOR $463C			; 4D 3C 46 | Exclusive OR with accumulator (absolute)
	BRA $20			  ; 80 20 | Branch always
	JMP ($4100)		  ; 6C 00 41 | Jump to address (absolute indirect)
	BPL $92			  ; 10 92 | Branch if positive
	ROR				  ; 6A | Rotate right (accumulator)
	DEC $0083,X		  ; DE 83 00 | Decrement (absolute,X)
	LSR $54B0			; 4E B0 54 | Logical shift right (absolute)
	BRA $20			  ; 80 20 | Branch always
	AND $0084,X		  ; 3D 84 00 | Logical AND with accumulator (absolute,X)
	ROR $47B1			; 6E B1 47 | Rotate right (absolute)
	BRA $20			  ; 80 20 | Branch always
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA ($3D,X)		  ; 01 3D | Logical OR with accumulator ((zero page,X))
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	ROR $85			  ; 66 85 | Rotate right (zero page)
	BPL $BD			  ; 10 BD | Branch if positive
	WDM #$90			 ; 42 90 | Reserved instruction
	ROL				  ; 2A | Rotate left (accumulator)
	BPL $86			  ; 10 86 | Branch if positive
	BPL $BD			  ; 10 BD | Branch if positive
	WDM #$90			 ; 42 90 | Reserved instruction
	STX $00			  ; 86 00 | Store X register to zero page
	BPL $BD			  ; 10 BD | Branch if positive

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_02A
; Address: $C6852A
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_02A:
	WDM #$90			 ; 42 90 | Reserved instruction
	DEC				  ; 3A | Decrement accumulator
	PHX				  ; DA | Push X register to stack
	STX $00			  ; 86 00 | Store X register to zero page
	BPL $BD			  ; 10 BD | Branch if positive
	WDM #$90			 ; 42 90 | Reserved instruction
	WDM #$7F			 ; 42 7F | Reserved instruction
	BPL $BD			  ; 10 BD | Branch if positive
	WDM #$90			 ; 42 90 | Reserved instruction
	LSR				  ; 4A | Logical shift right (accumulator)
	LDY $87			  ; A4 87 | Load from zero page into Y register
	LDY #$53			 ; A0 53 | Load immediate value into Y register
	BCC $20			  ; 90 20 | Branch if carry clear
	ORA #$88			 ; 09 88 | Logical OR with accumulator (immediate)
	AND ($E0,X)		  ; 21 E0 | Game work RAM access
	BPL $92			  ; 10 92 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	AND ($D4,X)		  ; 21 D4 | Logical AND with accumulator ((zero page,X))
	ORA ($92),Y		  ; 11 92 | Logical OR with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	LDA ($88),Y		  ; B1 88 | Load from (zero page),Y into accumulator
	EOR ($D4,X)		  ; 41 D4 | Exclusive OR with accumulator ((zero page,X))
	ORA ($92),Y		  ; 11 92 | Logical OR with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	PLX				  ; FA | Pull X register from stack
	DEY				  ; 88 | Decrement Y register
	EOR ($D6,X)		  ; 41 D6 | Exclusive OR with accumulator ((zero page,X))
	BRA $20			  ; 80 20 | Branch always
	AND ($89),Y		  ; 31 89 | Logical AND with accumulator ((zero page),Y)
	EOR ($D6,X)		  ; 41 D6 | Exclusive OR with accumulator ((zero page,X))
	BRA $20			  ; 80 20 | Branch always
	AND ($89),Y		  ; 31 89 | Logical AND with accumulator ((zero page),Y)
	EOR ($80),Y		  ; 51 80 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_02B
; Address: $C68598
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_02B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	STA $0089			; 8D 89 00 | Store accumulator to absolute address
	LDA ($51,X)		  ; A1 51 | Load from (zero page,X) into accumulator
	BRA $20			  ; 80 20 | Branch always
	STA $0089			; 8D 89 00 | Store accumulator to absolute address
	LDA $9054BC		  ; AF BC 54 90 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_02C
; Address: $C685B0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_02C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	LDA $0089,X		  ; BD 89 00 | Load from absolute,X into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $20			  ; 90 20 | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	STA ($9C,X)		  ; 81 9C | Store accumulator to (zero page,X)
	ORA ($90),Y		  ; 11 90 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	STZ $9F9D,X		  ; 9E 9D 9F | Store zero to absolute,X
	EOR $008A,X		  ; 5D 8A 00 | Exclusive OR with accumulator (absolute,X)
	LDA #$56			 ; A9 56 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_02D
; Address: $C685D3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_02D:
	BRA $20			  ; 80 20 | Branch always
	TAX				  ; AA | Transfer accumulator to X register
	TXA				  ; 8A | Transfer X register to accumulator
	CPX $8056			; EC 56 80 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_02E
; Address: $C685E0
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_02E:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PEA #$0098		   ; F4 98 00 | Push effective address to stack
	AND ($3C,X)		  ; 21 3C | Logical AND with accumulator ((zero page,X))
	BRA $20			  ; 80 20 | Branch always
	AND $008B,X		  ; 3D 8B 00 | Logical AND with accumulator (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	CPY $52			  ; C4 52 | Compare Y register (zero page)
	BRA $20			  ; 80 20 | Branch always
	LDA $8B			  ; A5 8B | Load from zero page into accumulator
	WDM #$F0			 ; 42 F0 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	BCS $18			  ; B0 18 | Branch if carry set
	PHY				  ; 5A | Push Y register to stack
	STY $4200			; 8C 00 42 | Hardware register operation
	BEQ $40			  ; F0 40 | Branch if equal
	BCS $18			  ; B0 18 | Branch if carry set
	EOR $008C,X		  ; 5D 8C 00 | Exclusive OR with accumulator (absolute,X)
	WDM #$F0			 ; 42 F0 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	BCS $18			  ; B0 18 | Branch if carry set
	STY $4200			; 8C 00 42 | Hardware register operation
	BEQ $40			  ; F0 40 | Branch if equal
	BCS $18			  ; B0 18 | Branch if carry set
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA ($8D),Y		  ; 11 8D | Logical OR with accumulator ((zero page),Y)
	EOR ($D0,X)		  ; 41 D0 | Exclusive OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	BRA $20			  ; 80 20 | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_02F
; Address: $C6863A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_02F:
	STA $4100			; 8D 00 41 | Store accumulator to absolute address
	BNE $4C			  ; D0 4C | Branch if not equal
	BRA $20			  ; 80 20 | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_030
; Address: $C68646
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_030:
	STA $4100			; 8D 00 41 | Store accumulator to absolute address
	BNE $4C			  ; D0 4C | Branch if not equal
	BRA $20			  ; 80 20 | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_031
; Address: $C68652
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_031:
	STA $5500			; 8D 00 55 | Store accumulator to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $2080			; 4C 80 20 | Jump to address
	STA $5500			; 8D 00 55 | Store accumulator to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register
	PHA				  ; 48 | Push accumulator to stack
	BRA $20			  ; 80 20 | Branch always
	STA $5500			; 8D 00 55 | Store accumulator to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_032
; Address: $C6866E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_032:
	PHA				  ; 48 | Push accumulator to stack
	BRA $20			  ; 80 20 | Branch always
	STA $5500			; 8D 00 55 | Store accumulator to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register
	PHA				  ; 48 | Push accumulator to stack
	BRA $20			  ; 80 20 | Branch always
	STA $4300			; 8D 00 43 | Store accumulator to absolute address
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	INC $8D			  ; E6 8D | Increment (zero page)
	CPY #$4C			 ; C0 4C | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	INC $8D			  ; E6 8D | Increment (zero page)
	CPY #$4C			 ; C0 4C | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	INC $8D			  ; E6 8D | Increment (zero page)
	LDY $804C			; AC 4C 80 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_033
; Address: $C686AC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_033:
	JSR $0000			; 20 00 00 | Jump to subroutine
	STX $5300			; 8E 00 53 | Store X register to absolute address
	LDY $8048			; AC 48 80 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_034
; Address: $C686B8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_034:
	JSR $0000			; 20 00 00 | Jump to subroutine
	STX $5300			; 8E 00 53 | Store X register to absolute address
	LDY $8048			; AC 48 80 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_035
; Address: $C686C4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_035:
	JSR $0000			; 20 00 00 | Jump to subroutine
	STX $5300			; 8E 00 53 | Store X register to absolute address
	LDY $8048			; AC 48 80 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_036
; Address: $C686D0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_036:
	JSR $0000			; 20 00 00 | Jump to subroutine
	STX $3400			; 8E 00 34 | Store X register to absolute address
	LDY $8043			; AC 43 80 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_037
; Address: $C686DC
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_037:
	JSR $0000			; 20 00 00 | Jump to subroutine
	STX $B500			; 8E 00 B5 | Store X register to absolute address
	LDY $12			  ; A4 12 | Load from zero page into Y register
	STX $B700			; 8E 00 B7 | Store X register to absolute address
	STZ $9212			; 9C 12 92 | Store zero to absolute
	STX $5500			; 8E 00 55 | Store X register to absolute address
	TAX				  ; AA | Transfer accumulator to X register
	BRA $20			  ; 80 20 | Branch always
	STA $4C2200		  ; 8F 00 22 4C | Store accumulator to absolute long address
	EOR $2080			; 4D 80 20 | Exclusive OR with accumulator (absolute)
	STZ $00			  ; 64 00 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_039
; Address: $C68718
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_039:
	JSR $0000			; 20 00 00 | Jump to subroutine
	JMP ($008F)		  ; 6C 8F 00 | Jump to address (absolute indirect)
	WDM #$CC			 ; 42 CC | Reserved instruction
	JMP $A03898		  ; 5C 98 38 A0 | Jump to address long
	STA $642200		  ; 8F 00 22 64 | Store accumulator to absolute long address
	EOR $3898,X		  ; 5D 98 38 | Exclusive OR with accumulator (absolute,X)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STA $F04200		  ; 8F 00 42 F0 | Store accumulator to absolute long address
	JMP $2080			; 4C 80 20 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_03A
; Address: $C68742
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_03A:
	BCC $00			  ; 90 00 | Branch if carry clear
	WDM #$F0			 ; 42 F0 | Reserved instruction
	EOR $80			  ; 45 80 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_03B
; Address: $C68748
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_03B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	STA $0090,X		  ; 9D 90 00 | Store accumulator to absolute,X
	STA ($A0,X)		  ; 81 A0 | Store accumulator to (zero page,X)
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_03C
; Address: $C68756
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_03C:
	JSL $6A0000		  ; 22 00 00 6A | Jump to subroutine long
	SBC $B9			  ; E5 B9 | Subtract with carry (zero page)
	EOR $80			  ; 45 80 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_03D
; Address: $C68760
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_03D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ADC $91			  ; 65 91 | Add with carry (zero page)
	DEY				  ; 88 | Decrement Y register
	LDY $8045			; AC 45 80 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_03E
; Address: $C6876C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_03E:
	JSR $0000			; 20 00 00 | Jump to subroutine
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	BMI $4B			  ; 30 4B | Branch if negative
	BRA $20			  ; 80 20 | Branch always
	CMP $0091,Y		  ; D9 91 00 | Compare accumulator (absolute,Y)
	ORA $AD			  ; 05 AD | Logical OR with accumulator (zero page)
	BCC $20			  ; 90 20 | Branch if carry clear
	BCS $BC			  ; B0 BC | Branch if carry set
	BVC $90			  ; 50 90 | Branch if overflow clear
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $A1			  ; A5 A1 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_03F
; Address: $C6879C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_03F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $A1			  ; A5 A1 | Load from zero page into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $B5			  ; A5 B5 | Load from zero page into accumulator
	EOR ($90),Y		  ; 51 90 | Exclusive OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_040
; Address: $C687B5
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_040:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	JMP $11CC			; 4C CC 11 | Jump to address
	BCC $14			  ; 90 14 | Branch if carry clear
	ROR				  ; 6A | Rotate right (accumulator)
	BVC $95			  ; 50 95 | Branch if overflow clear
	AND ($EC,X)		  ; 21 EC | Logical AND with accumulator ((zero page,X))
	BPL $90			  ; 10 90 | Branch if positive
	LDY $95			  ; A4 95 | Load from zero page into Y register
	PHA				  ; 48 | Push accumulator to stack
	CLV				  ; B8 | Clear overflow flag
	BPL $90			  ; 10 90 | Branch if positive
	TSX				  ; BA | Transfer stack pointer to X register
	EOR $11A0			; 4D A0 11 | Exclusive OR with accumulator (absolute)
	BCC $00			  ; 90 00 | Branch if carry clear
	ROR				  ; 6A | Rotate right (accumulator)
	LDY $9053			; AC 53 90 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_042
; Address: $C687FC
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_042:
	JSR $0000			; 20 00 00 | Jump to subroutine
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	BCC $00			  ; 90 00 | Branch if carry clear
	LDY #$11			 ; A0 11 | Load immediate value into Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	ROR				  ; 6A | Rotate right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	EOR #$D0			 ; 49 D0 | Exclusive OR with accumulator (immediate)
	ORA ($90),Y		  ; 11 90 | Logical OR with accumulator ((zero page),Y)
	AND ($97,X)		  ; 21 97 | Logical AND with accumulator ((zero page,X))
	BCC $20			  ; 90 20 | Branch if carry clear
	SBC $0097			; ED 97 00 | Subtract with carry (absolute)
	BMI $B4			  ; 30 B4 | Branch if negative
	BRA $20			  ; 80 20 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP $11C4			; 4C C4 11 | Jump to address
	BCC $14			  ; 90 14 | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	INY				  ; C8 | Increment Y register
	CPY $52			  ; C4 52 | Compare Y register (zero page)
	BCC $20			  ; 90 20 | Branch if carry clear
	CPY $0098			; CC 98 00 | Compare Y register (absolute)
	WDM #$8C			 ; 42 8C | Reserved instruction
	EOR ($80),Y		  ; 51 80 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_043
; Address: $C68868
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_043:
	JSR $0000			; 20 00 00 | Jump to subroutine
	STA $4200,Y		  ; 99 00 42 | Hardware register operation
	SEP #$10			 ; E2 10 | Set processor status bits
	BCC $08			  ; 90 08 | Branch if carry clear
	STZ $0099			; 9C 99 00 | Store zero to absolute
	WDM #$D0			 ; 42 D0 | Reserved instruction
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_044
; Address: $C68880
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_044:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SBC $99			  ; E5 99 | Subtract with carry (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	STX $11			  ; 86 11 | Store X register to zero page
	BCC $01			  ; 90 01 | Branch if carry clear
	SBC $0099,X		  ; FD 99 00 | Subtract with carry (absolute,X)
	EOR ($86,X)		  ; 41 86 | Exclusive OR with accumulator ((zero page,X))
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BMI $9A			  ; 30 9A | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	LDA $D013			; AD 13 D0 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_045
; Address: $C688A4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_045:
	JSR $BB00			; 20 00 BB | Jump to subroutine
	CMP $9A			  ; C5 9A | Compare accumulator (zero page)
	EOR #$28			 ; 49 28 | Exclusive OR with accumulator (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_046
; Address: $C688B5
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_046:
	LSR				  ; 4A | Logical shift right (accumulator)
	STZ $5300			; 9C 00 53 | Store zero to absolute
	BMI $58			  ; 30 58 | Branch if negative
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	AND ($9B),Y		  ; 31 9B | Logical AND with accumulator ((zero page),Y)
	CMP ($51,X)		  ; C1 51 | Compare accumulator ((zero page,X))
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	STZ $4A00			; 9C 00 4A | Store zero to absolute
	LDA $9012,X		  ; BD 12 90 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_047
; Address: $C688D4
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_047:
	JSR $0000			; 20 00 00 | Jump to subroutine
	DEC $9C			  ; C6 9C | Decrement (zero page)
	EOR $5830			; 4D 30 58 | Exclusive OR with accumulator (absolute)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	AND ($9B),Y		  ; 31 9B | Logical AND with accumulator ((zero page),Y)
	AND ($B1,X)		  ; 21 B1 | Logical AND with accumulator ((zero page,X))
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	STZ $4200			; 9C 00 42 | Hardware register operation
	BNE $50			  ; D0 50 | Branch if not equal
	BCS $0C			  ; B0 0C | Branch if carry set
	TAX				  ; AA | Transfer accumulator to X register
	PLB				  ; AB | Pull data bank register from stack
	LDX $00			  ; A6 00 | Load from zero page into X register
	STX $08			  ; 86 08 | Store X register to zero page
	INC				  ; 1A | Increment accumulator
	ORA $1810,Y		  ; 19 10 18 | Logical OR with accumulator (absolute,Y)
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	LDA $BBBA,Y		  ; B9 BA BB | Load from absolute,Y into accumulator
	ORA $3F3E			; 0D 3E 3F | Logical OR with accumulator (absolute)
	ADC $B882,Y		  ; 79 82 B8 | Add with carry (absolute,Y)
	LDA $BBBA,Y		  ; B9 BA BB | Load from absolute,Y into accumulator
	LDA				  ; BF 00 00 00 | Load from absolute long,X into accumulator
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	EOR ($66,X)		  ; 41 66 | Exclusive OR with accumulator ((zero page,X))
	JMP $B88200		  ; 5C 00 82 B8 | Jump to address long
	ADC $0000,Y		  ; 79 00 00 | Add with carry (absolute,Y)
	CLV				  ; B8 | Clear overflow flag
	TSX				  ; BA | Transfer stack pointer to X register
	ADC $0000,Y		  ; 79 00 00 | Add with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	AND ($2B,X)		  ; 21 2B | Logical AND with accumulator ((zero page,X))
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_048
; Address: $C68942
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_048:
	JSR $5E2B			; 20 2B 5E | Jump to subroutine
	ROR $0054			; 6E 54 00 | Rotate right (absolute)
	CLV				  ; B8 | Clear overflow flag
	TSX				  ; BA | Transfer stack pointer to X register
	DEC $C7			  ; C6 C7 | Decrement (zero page)
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_049
; Address: $C68952
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_049:
	PHP				  ; 08 | Push processor status to stack
	TSX				  ; BA | Transfer stack pointer to X register
	LDA				  ; BF C7 00 08 | Load from absolute long,X into accumulator
	ASL $59			  ; 06 59 | Arithmetic shift left (zero page)
	JMP $000073		  ; 5C 73 00 00 | Jump to address long
	ORA $2305			; 0D 05 23 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDA $00BF,Y		  ; B9 BF 00 | Load from absolute,Y into accumulator
	JMP $6A41			; 4C 41 6A | Jump to address
	JMP ($7C46)		  ; 6C 46 7C | Jump to address (absolute indirect)
	CLV				  ; B8 | Clear overflow flag
	LDA $BBBA,Y		  ; B9 BA BB | Load from absolute,Y into accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	AND $0C			  ; 25 0C | Logical AND with accumulator (zero page)
	WDM #$6D			 ; 42 6D | Reserved instruction
	CLV				  ; B8 | Clear overflow flag
	LDA $BBBA,Y		  ; B9 BA BB | Load from absolute,Y into accumulator
	LDA				  ; BF C7 00 82 | Load from absolute long,X into accumulator
	TSX				  ; BA | Transfer stack pointer to X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_04A
; Address: $C68999
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_04A:
	JSL $44331A		  ; 22 1A 33 44 | Jump to subroutine long
	EOR #$43			 ; 49 43 | Exclusive OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	ORA $442D,Y		  ; 19 2D 44 | Logical OR with accumulator (absolute,Y)
	ROR $7E71			; 6E 71 7E | Rotate right (absolute)
	CLV				  ; B8 | Clear overflow flag
	LDA $BBBA,Y		  ; B9 BA BB | Load from absolute,Y into accumulator
	LDA				  ; BF DF 00 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_04B
; Address: $C689B1
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_04B:
	JSR $490F			; 20 0F 49 | Jump to subroutine
	LSR $8200			; 4E 00 82 | Logical shift right (absolute)
	CLV				  ; B8 | Clear overflow flag
	LDA $BBBA,Y		  ; B9 BA BB | Load from absolute,Y into accumulator
	LDA				  ; BF 00 00 07 | Load from absolute long,X into accumulator
	ASL $41			  ; 06 41 | Arithmetic shift left (zero page)
	EOR $7366,X		  ; 5D 66 73 | Exclusive OR with accumulator (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	LDA $BBBA,Y		  ; B9 BA BB | Load from absolute,Y into accumulator
	LDA				  ; BF 00 00 05 | Load from absolute long,X into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR ($48,X)		  ; 41 48 | Exclusive OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($7B82)		  ; 6C 82 7B | Jump to address (absolute indirect)
	CLV				  ; B8 | Clear overflow flag
	LDA $BBBA,Y		  ; B9 BA BB | Load from absolute,Y into accumulator
	LDA				  ; BF 8C 82 54 | Load from absolute long,X into accumulator
	STA $25			  ; 85 25 | Store accumulator to zero page
	BMI $9C			  ; 30 9C | Branch if negative
	AND $22			  ; 25 22 | Logical AND with accumulator (zero page)
	EOR $4349,Y		  ; 59 49 43 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_04C
; Address: $C689F1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_04C:
	CLV				  ; B8 | Clear overflow flag
	LDA $BBBA,Y		  ; B9 BA BB | Load from absolute,Y into accumulator
	LDA				  ; BF C6 00 00 | Load from absolute long,X into accumulator
	AND ($0C,X)		  ; 21 0C | Logical AND with accumulator ((zero page,X))
	JMP $82006D		  ; 5C 6D 00 82 | Jump to address long
	CLV				  ; B8 | Clear overflow flag
	LDA $C6BF,Y		  ; B9 BF C6 | Load from absolute,Y into accumulator
	LDA #$90			 ; A9 90 | Load immediate value into accumulator
	ADC $0200,X		  ; 7D 00 02 | Add with carry (absolute,X)
	ORA #$3A			 ; 09 3A | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ADC $0000			; 6D 00 00 | Add with carry (absolute)
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_04D
; Address: $C68A18
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_04D:
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	TSX				  ; BA | Transfer stack pointer to X register
	LDA				  ; BF 9D 00 00 | Load from absolute long,X into accumulator
	CLV				  ; B8 | Clear overflow flag
	TSX				  ; BA | Transfer stack pointer to X register
	LDA				  ; BF 1E 9D 00 | Load from absolute long,X into accumulator
	CLV				  ; B8 | Clear overflow flag
	LDA $70BB,Y		  ; B9 BB 70 | Load from absolute,Y into accumulator
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	AND $3F4D,X		  ; 3D 4D 3F | Logical AND with accumulator (absolute,X)
	ADC $82			  ; 65 82 | Add with carry (zero page)
	LSR $79			  ; 46 79 | Logical shift right (zero page)
	CLV				  ; B8 | Clear overflow flag
	LDA $BBBA,Y		  ; B9 BA BB | Load from absolute,Y into accumulator
	LDA				  ; BF 00 04 0D | Load from absolute long,X into accumulator
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	BVC $4C			  ; 50 4C | Branch if overflow clear
	ROR				  ; 6A | Rotate right (accumulator)
	CLV				  ; B8 | Clear overflow flag
	LDA $BBBA,Y		  ; B9 BA BB | Load from absolute,Y into accumulator
	LDA				  ; BF C6 00 00 | Load from absolute long,X into accumulator
	AND ($33,X)		  ; 21 33 | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ROR $7A7F			; 6E 7F 7A | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_04E
; Address: $C68A59
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_04E:
	JSR $5433			; 20 33 54 | Jump to subroutine
	ROR $826B			; 6E 6B 82 | Rotate right (absolute)
	CLV				  ; B8 | Clear overflow flag
	LDA $BBBA,Y		  ; B9 BA BB | Load from absolute,Y into accumulator
	LDA				  ; BF A9 00 06 | Load from absolute long,X into accumulator
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ASL $59			  ; 06 59 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	ASL $28			  ; 06 28 | Arithmetic shift left (zero page)
	STA $0083,Y		  ; 99 83 00 | Store accumulator to absolute,Y
	ASL $53			  ; 06 53 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_04F
; Address: $C68A83
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_04F:
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ASL $5A			  ; 06 5A | Arithmetic shift left (zero page)
	STZ $00E4			; 9C E4 00 | Store zero to absolute
	ASL $85			  ; 06 85 | Arithmetic shift left (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STZ $00			  ; 64 00 | Store zero to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA $10			  ; 05 10 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA $0320,Y		  ; 19 20 03 | Logical OR with accumulator (absolute,Y)
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	ORA $0328,Y		  ; 19 28 03 | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $0403			; 2C 03 04 | Test bits in accumulator (absolute)
	BMI $03			  ; 30 03 | Branch if negative
	ORA ($34,X)		  ; 01 34 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA $3C			  ; 05 3C | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	JMP $1403			; 4C 03 14 | Jump to address
	BVC $03			  ; 50 03 | Branch if overflow clear
	ORA ($54,X)		  ; 01 54 | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $600203		  ; 5C 03 02 60 | Jump to address long
	STZ $00			  ; 64 00 | Store zero to zero page
	INY				  ; C8 | Increment Y register
	PEA #$0001		   ; F4 01 00 | Push effective address to stack
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	SBC $FA02,Y		  ; F9 02 FA | Subtract with carry (absolute,Y)
	SBC $FE02,X		  ; FD 02 FE | Subtract with carry (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0E03			; 0D 03 0E | Logical OR with accumulator (absolute)
	BPL $03			  ; 10 03 | Branch if positive
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)
	ORA $99C9			; 0D C9 99 | Logical OR with accumulator (absolute)
	ORA $ABC9			; 0D C9 AB | Logical OR with accumulator (absolute)
	ORA $BDC9			; 0D C9 BD | Logical OR with accumulator (absolute)
	ORA $42C9			; 0D C9 42 | Hardware register operation
	ASL $61C9			; 0E C9 61 | Arithmetic shift left (absolute)
	ASL $80C9			; 0E C9 80 | Arithmetic shift left (absolute)
	ASL $EDC9			; 0E C9 ED | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_050
; Address: $C68B47
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_050:
	ASL $6EC9			; 0E C9 6E | Arithmetic shift left (absolute)
	CMP #$FB			 ; C9 FB | Compare accumulator (immediate)
	CMP #$E5			 ; C9 E5 | Compare accumulator (immediate)
	BPL $C9			  ; 10 C9 | Branch if positive
	STA $C910,X		  ; 9D 10 C9 | Store accumulator to absolute,X
	CMP #$19			 ; C9 19 | Compare accumulator (immediate)
	ORA ($C9),Y		  ; 11 C9 | Logical OR with accumulator ((zero page),Y)
	EOR $C911			; 4D 11 C9 | Exclusive OR with accumulator (absolute)
	EOR $0F			  ; 45 0F | Exclusive OR with accumulator (zero page)
	CMP #$19			 ; C9 19 | Compare accumulator (immediate)
	CMP #$B2			 ; C9 B2 | Compare accumulator (immediate)
	CMP #$BE			 ; C9 BE | Compare accumulator (immediate)
	CMP #$1E			 ; C9 1E | Compare accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	CMP #$F6			 ; C9 F6 | Compare accumulator (immediate)
	CMP #$0E			 ; C9 0E | Compare accumulator (immediate)
	CMP #$F6			 ; C9 F6 | Compare accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CMP #$C5			 ; C9 C5 | Compare accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CMP #$E0			 ; C9 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CMP #$E0			 ; C9 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CMP #$E0			 ; C9 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CMP #$52			 ; C9 52 | Compare accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	CMP #$FE			 ; C9 FE | Compare accumulator (immediate)
	CMP #$92			 ; C9 92 | Compare accumulator (immediate)
	ORA $1EC9,Y		  ; 19 C9 1E | Logical OR with accumulator (absolute,Y)
	CMP #$23			 ; C9 23 | Compare accumulator (immediate)
	CMP #$A5			 ; C9 A5 | Compare accumulator (immediate)
	ORA $FFC9,Y		  ; 19 C9 FF | Logical OR with accumulator (absolute,Y)
	ORA $06C9,Y		  ; 19 C9 06 | Logical OR with accumulator (absolute,Y)
	CMP #$67			 ; C9 67 | Compare accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	CMP #$16			 ; C9 16 | Compare accumulator (immediate)
	CMP #$C6			 ; C9 C6 | Compare accumulator (immediate)
	CMP #$D6			 ; C9 D6 | Compare accumulator (immediate)
	CMP #$E6			 ; C9 E6 | Compare accumulator (immediate)
	CMP #$EE			 ; C9 EE | Compare accumulator (immediate)
	CMP #$CE			 ; C9 CE | Compare accumulator (immediate)
	CMP #$DE			 ; C9 DE | Compare accumulator (immediate)
	CMP #$26			 ; C9 26 | Compare accumulator (immediate)
	CMP #$81			 ; C9 81 | Compare accumulator (immediate)
	ORA ($C9),Y		  ; 11 C9 | Logical OR with accumulator ((zero page),Y)
	CMP #$8F			 ; C9 8F | Compare accumulator (immediate)
	CMP #$F4			 ; C9 F4 | Compare accumulator (immediate)
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_051
; Address: $C68BC3
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_051:
	CMP #$93			 ; C9 93 | Compare accumulator (immediate)
	CMP #$D6			 ; C9 D6 | Compare accumulator (immediate)
	CMP #$49			 ; C9 49 | Compare accumulator (immediate)
	CMP #$78			 ; C9 78 | Compare accumulator (immediate)
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	CMP #$6B			 ; C9 6B | Compare accumulator (immediate)
	CMP #$54			 ; C9 54 | Compare accumulator (immediate)
	ORA $A0C9,Y		  ; 19 C9 A0 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	CMP #$A7			 ; C9 A7 | Compare accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	CMP #$1D			 ; C9 1D | Compare accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CMP #$45			 ; C9 45 | Compare accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CMP #$56			 ; C9 56 | Compare accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CMP #$17			 ; C9 17 | Compare accumulator (immediate)
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	CMP #$3A			 ; C9 3A | Compare accumulator (immediate)
	ORA $79C9,Y		  ; 19 C9 79 | Logical OR with accumulator (absolute,Y)
	CMP #$69			 ; C9 69 | Compare accumulator (immediate)
	ORA $F5C9,Y		  ; 19 C9 F5 | Logical OR with accumulator (absolute,Y)
	CMP #$82			 ; C9 82 | Compare accumulator (immediate)
	CMP #$30			 ; C9 30 | Compare accumulator (immediate)
	CMP #$24			 ; C9 24 | Compare accumulator (immediate)
	CMP #$30			 ; C9 30 | Compare accumulator (immediate)
	CMP #$7E			 ; C9 7E | Compare accumulator (immediate)
	CMP #$9D			 ; C9 9D | Compare accumulator (immediate)
	CMP #$B9			 ; C9 B9 | Compare accumulator (immediate)
	CMP #$CB			 ; C9 CB | Compare accumulator (immediate)
	CMP #$D7			 ; C9 D7 | Compare accumulator (immediate)
	CMP #$E3			 ; C9 E3 | Compare accumulator (immediate)
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	CMP #$2D			 ; C9 2D | Compare accumulator (immediate)
	CMP #$39			 ; C9 39 | Compare accumulator (immediate)
	CMP #$45			 ; C9 45 | Compare accumulator (immediate)
	CMP #$51			 ; C9 51 | Compare accumulator (immediate)
	CMP #$5D			 ; C9 5D | Compare accumulator (immediate)
	CMP #$81			 ; C9 81 | Compare accumulator (immediate)
	CMP #$99			 ; C9 99 | Compare accumulator (immediate)
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	ORA $16C9,X		  ; 1D C9 16 | Logical OR with accumulator (absolute,X)
	ORA $78C9,X		  ; 1D C9 78 | Logical OR with accumulator (absolute,X)
	ORA $A0C9,X		  ; 1D C9 A0 | Logical OR with accumulator (absolute,X)
	ORA $18C9,X		  ; 1D C9 18 | Logical OR with accumulator (absolute,X)
	ASL $B4C9,X		  ; 1E C9 B4 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_052
; Address: $C68C46
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_052:
	ORA $C8C9,X		  ; 1D C9 C8 | Logical OR with accumulator (absolute,X)
	ORA $DCC9,X		  ; 1D C9 DC | Logical OR with accumulator (absolute,X)
	ORA $F0C9,X		  ; 1D C9 F0 | Logical OR with accumulator (absolute,X)
	ORA $47C9,X		  ; 1D C9 47 | Logical OR with accumulator (absolute,X)
	ASL $04C9,X		  ; 1E C9 04 | Arithmetic shift left (absolute,X)
	ASL $28C9,X		  ; 1E C9 28 | Arithmetic shift left (absolute,X)
	ORA $3CC9,X		  ; 1D C9 3C | Logical OR with accumulator (absolute,X)
	ORA $50C9,X		  ; 1D C9 50 | Logical OR with accumulator (absolute,X)
	ORA $64C9,X		  ; 1D C9 64 | Logical OR with accumulator (absolute,X)
	ORA $76C9,X		  ; 1D C9 76 | Logical OR with accumulator (absolute,X)
	ASL $69C9,X		  ; 1E C9 69 | Arithmetic shift left (absolute,X)
	CMP #$6A			 ; C9 6A | Compare accumulator (immediate)
	CMP #$AA			 ; C9 AA | Compare accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CMP #$4C			 ; C9 4C | Compare accumulator (immediate)
	BIT $5FC9			; 2C C9 5F | Test bits in accumulator (absolute)
	BIT $B5C9			; 2C C9 B5 | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CMP #$D3			 ; C9 D3 | Compare accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CMP #$DE			 ; C9 DE | Compare accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CMP #$F4			 ; C9 F4 | Compare accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CMP #$E9			 ; C9 E9 | Compare accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CMP #$6C			 ; C9 6C | Compare accumulator (immediate)
	AND $61C9			; 2D C9 61 | Logical AND with accumulator (absolute)
	AND $88C9			; 2D C9 88 | Logical AND with accumulator (absolute)
	AND #$C9			 ; 29 C9 | Logical AND with accumulator (immediate)
	AND #$C9			 ; 29 C9 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CMP #$15			 ; C9 15 | Compare accumulator (immediate)
	AND #$C9			 ; 29 C9 | Logical AND with accumulator (immediate)
	AND #$C9			 ; 29 C9 | Logical AND with accumulator (immediate)
	EOR ($29,X)		  ; 41 29 | Exclusive OR with accumulator ((zero page,X))
	CMP #$B6			 ; C9 B6 | Compare accumulator (immediate)
	AND #$C9			 ; 29 C9 | Logical AND with accumulator (immediate)
	AND #$C9			 ; 29 C9 | Logical AND with accumulator (immediate)
	LSR $2A			  ; 46 2A | Logical shift right (zero page)
	CMP #$33			 ; C9 33 | Compare accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$20			 ; C9 20 | Compare accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$0D			 ; C9 0D | Compare accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$8F			 ; C9 8F | Compare accumulator (immediate)
	ROL $84C9			; 2E C9 84 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_053
; Address: $C68CB5
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_053:
	ROL $41C9			; 2E C9 41 | Rotate left (absolute)
	AND #$C9			 ; 29 C9 | Logical AND with accumulator (immediate)
	ROR $2E			  ; 66 2E | Rotate right (zero page)
	CMP #$53			 ; C9 53 | Compare accumulator (immediate)
	ROL $48C9			; 2E C9 48 | Rotate left (absolute)
	ROL $12C9			; 2E C9 12 | Rotate left (absolute)
	ROL $79C9			; 2E C9 79 | Rotate left (absolute)
	ROL $A2C9			; 2E C9 A2 | Rotate left (absolute)
	ROL $07C9			; 2E C9 07 | Rotate left (absolute)
	ROL $E1C9			; 2E C9 E1 | Rotate left (absolute)
	AND $82C9			; 2D C9 82 | Logical AND with accumulator (absolute)
	AND $95C9			; 2D C9 95 | Logical AND with accumulator (absolute)
	AND $A8C9			; 2D C9 A8 | Logical AND with accumulator (absolute)
	AND $BBC9			; 2D C9 BB | Logical AND with accumulator (absolute)
	AND $56C9			; 2D C9 56 | Logical AND with accumulator (absolute)
	AND $0AC9			; 2D C9 0A | Logical AND with accumulator (absolute)
	AND $1DC9			; 2D C9 1D | Logical AND with accumulator (absolute)
	AND $30C9			; 2D C9 30 | Logical AND with accumulator (absolute)
	AND $43C9			; 2D C9 43 | Logical AND with accumulator (absolute)
	AND $72C9			; 2D C9 72 | Logical AND with accumulator (absolute)
	BIT $F7C9			; 2C C9 F7 | Test bits in accumulator (absolute)
	BIT $E4C9			; 2C C9 E4 | Test bits in accumulator (absolute)
	BIT $D1C9			; 2C C9 D1 | Test bits in accumulator (absolute)
	BIT $BEC9			; 2C C9 BE | Test bits in accumulator (absolute)
	BIT $ABC9			; 2C C9 AB | Test bits in accumulator (absolute)
	BIT $98C9			; 2C C9 98 | Test bits in accumulator (absolute)
	BIT $85C9			; 2C C9 85 | Test bits in accumulator (absolute)
	BIT $35C9			; 2C C9 35 | Test bits in accumulator (absolute)
	CMP #$5B			 ; C9 5B | Compare accumulator (immediate)
	CMP #$59			 ; C9 59 | Compare accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$22			 ; C9 22 | Compare accumulator (immediate)
	CMP #$E6			 ; C9 E6 | Compare accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$AD			 ; C9 AD | Compare accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$92			 ; C9 92 | Compare accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$AD			 ; C9 AD | Compare accumulator (immediate)
	ROL $2DC9			; 2E C9 2D | Rotate left (absolute)
	ROL $FAC9			; 2E C9 FA | Rotate left (absolute)
	AND #$C9			 ; 29 C9 | Logical AND with accumulator (immediate)
	CMP #$29			 ; C9 29 | Compare accumulator (immediate)
	CMP #$CE			 ; C9 CE | Compare accumulator (immediate)
	AND $77C9			; 2D C9 77 | Logical AND with accumulator (absolute)
	AND $F4C9			; 2D C9 F4 | Logical AND with accumulator (absolute)
	AND $48C9			; 2D C9 48 | Logical AND with accumulator (absolute)
	CMP #$D2			 ; C9 D2 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_054
; Address: $C68D37
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_054:
	CMP #$AF			 ; C9 AF | Compare accumulator (immediate)
	CMP #$9C			 ; C9 9C | Compare accumulator (immediate)
	CMP #$89			 ; C9 89 | Compare accumulator (immediate)
	CMP #$76			 ; C9 76 | Compare accumulator (immediate)
	CMP #$63			 ; C9 63 | Compare accumulator (immediate)
	CMP #$50			 ; C9 50 | Compare accumulator (immediate)
	CMP #$3D			 ; C9 3D | Compare accumulator (immediate)
	CMP #$2A			 ; C9 2A | Compare accumulator (immediate)
	CMP #$17			 ; C9 17 | Compare accumulator (immediate)
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	CMP #$F1			 ; C9 F1 | Compare accumulator (immediate)
	ROL $DEC9			; 2E C9 DE | Rotate left (absolute)
	ROL $CBC9			; 2E C9 CB | Rotate left (absolute)
	ROL $31C9			; 2E C9 31 | Rotate left (absolute)
	BIT $16C9			; 2C C9 16 | Test bits in accumulator (absolute)
	BIT $FBC9			; 2C C9 FB | Test bits in accumulator (absolute)
	CMP #$E5			 ; C9 E5 | Compare accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BMI $C9			  ; 30 C9 | Branch if negative
	BMI $C9			  ; 30 C9 | Branch if negative
	CPX #$2B			 ; E0 2B | Compare X register (immediate)
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	BMI $C9			  ; 30 C9 | Branch if negative
	EOR ($30),Y		  ; 51 30 | Exclusive OR with accumulator ((zero page),Y)
	CMP #$C2			 ; C9 C2 | Compare accumulator (immediate)
	CMP #$6C			 ; C9 6C | Compare accumulator (immediate)
	BMI $C9			  ; 30 C9 | Branch if negative
	BMI $C9			  ; 30 C9 | Branch if negative
	BMI $C9			  ; 30 C9 | Branch if negative
	LDA $30			  ; A5 30 | Load from zero page into accumulator
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)
	BMI $C9			  ; 30 C9 | Branch if negative
	BMI $C9			  ; 30 C9 | Branch if negative
	DEC $C930,X		  ; DE 30 C9 | Decrement (absolute,X)
	SBC ($30),Y		  ; F1 30 | Subtract with carry ((zero page),Y)
	CMP #$AF			 ; C9 AF | Compare accumulator (immediate)
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	AND ($C9),Y		  ; 31 C9 | Logical AND with accumulator ((zero page),Y)
	BIT #$2B			 ; 89 2B | Test bits in accumulator (immediate)
	CMP #$6E			 ; C9 6E | Compare accumulator (immediate)
	CMP #$9C			 ; C9 9C | Compare accumulator (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROL $D3C9			; 2E C9 D3 | Rotate left (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$2B			 ; C9 2B | Compare accumulator (immediate)
	AND #$C9			 ; 29 C9 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_055
; Address: $C68DAD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_055:
	JSR $C929			; 20 29 C9 | Jump to subroutine
	CMP #$6C			 ; C9 6C | Compare accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$FA			 ; C9 FA | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_056
; Address: $C68DB7
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_056:
	AND #$C9			 ; 29 C9 | Logical AND with accumulator (immediate)
	AND #$C9			 ; 29 C9 | Logical AND with accumulator (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	AND #$C9			 ; 29 C9 | Logical AND with accumulator (immediate)
	JMP $C929			; 4C 29 C9 | Jump to address
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0E1B			; 0D 1B 0E | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	ASL $161E			; 0E 1E 16 | Arithmetic shift left (absolute)
	ORA $0417			; 0D 17 04 | Logical OR with accumulator (absolute)
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND ($02,X)		  ; 21 02 | Logical AND with accumulator ((zero page,X))
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	AND $02			  ; 25 02 | Logical AND with accumulator (zero page)
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	BIT $05			  ; 24 05 | Test bits in accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STZ $1B			  ; 64 1B | Store zero to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_057
; Address: $C68E55
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_057:
	JSR $1620			; 20 20 16 | Jump to subroutine
	ORA $1E13,X		  ; 1D 13 1E | Logical OR with accumulator (absolute,X)
	ROR $3201			; 6E 01 32 | Rotate right (absolute)
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	ROL $04			  ; 26 04 | Rotate left (zero page)
	AND $0003,Y		  ; 39 03 00 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_058
; Address: $C68E6F
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_058:
	BMI $06			  ; 30 06 | Branch if negative
	AND ($02),Y		  ; 31 02 | Logical AND with accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INY				  ; C8 | Increment Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	EOR ($05,X)		  ; 41 05 | Exclusive OR with accumulator ((zero page,X))
	WDM #$05			 ; 42 05 | Reserved instruction
	ADC ($03,X)		  ; 61 03 | Add with carry ((zero page,X))
	ADC ($03,X)		  ; 61 03 | Add with carry ((zero page,X))
	ADC ($03,X)		  ; 61 03 | Add with carry ((zero page,X))
	EOR ($01),Y		  ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
	LSR $1E			  ; 46 1E | Logical shift right (zero page)
	BVC $0A			  ; 50 0A | Branch if overflow clear
	ORA ($DF,X)		  ; 01 DF | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	AND ($46),Y		  ; 31 46 | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ADC ($01,X)		  ; 61 01 | Add with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_059
; Address: $C68EB5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_059:
	CLI				  ; 58 | Clear interrupt disable flag
	BEQ $37			  ; F0 37 | Branch if equal
	EOR #$03			 ; 49 03 | Exclusive OR with accumulator (immediate)
	LSR $4D03			; 4E 03 4D | Logical shift right (absolute)
	ADC $03			  ; 65 03 | Add with carry (zero page)
	STZ $04			  ; 64 04 | Store zero to zero page
	ADC $03			  ; 65 03 | Add with carry (zero page)
	BVS $02			  ; 70 02 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_05A
; Address: $C68EE1
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_05A:
	JMP $000004		  ; 5C 04 00 00 | Jump to address long
	ORA $1907,Y		  ; 19 07 19 | Logical OR with accumulator (absolute,Y)
	ORA $0007,Y		  ; 19 07 00 | Logical OR with accumulator (absolute,Y)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	BRA $01			  ; 80 01 | Branch always
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BRA $03			  ; 80 03 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_05B
; Address: $C68F1B
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_05B:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	ORA $0200			; 0D 00 02 | Logical OR with accumulator (absolute)
	ORA $030A			; 0D 0A 03 | Logical OR with accumulator (absolute)
	ASL $0306			; 0E 06 03 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $0C			  ; 10 0C | Branch if positive
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	BRA $02			  ; 80 02 | Branch always
	BRA $03			  ; 80 03 | Branch always
	CLC				  ; 18 | Clear carry flag
	ORA $0380,Y		  ; 19 80 03 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	BRA $02			  ; 80 02 | Branch always
	BRA $01			  ; 80 01 | Branch always
	ORA $010B,X		  ; 1D 0B 01 | Logical OR with accumulator (absolute,X)
	ASL $0107,X		  ; 1E 07 01 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_05C
; Address: $C68F6E
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_05C:
	JSR $0280			; 20 80 02 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($23,X)		  ; 01 23 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BIT $80			  ; 24 80 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ORA ($26,X)		  ; 01 26 | Logical OR with accumulator ((zero page,X))
	ORA ($26,X)		  ; 01 26 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BRA $03			  ; 80 03 | Branch always
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	BIT $0080			; 2C 80 00 | Test bits in accumulator (absolute)
	AND $0200			; 2D 00 02 | Logical AND with accumulator (absolute)
	ROL $0200			; 2E 00 02 | Rotate left (absolute)
	ROL $030A			; 2E 0A 03 | Rotate left (absolute)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($0A),Y		  ; 31 0A | Logical AND with accumulator ((zero page),Y)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_05D
; Address: $C68FD1
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_05D:
	SEC				  ; 38 | Set carry flag
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	AND $0400,Y		  ; 39 00 04 | Logical AND with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	AND $0400,X		  ; 3D 00 04 | Logical AND with accumulator (absolute,X)
	AND $0400,X		  ; 3D 00 04 | Logical AND with accumulator (absolute,X)
	AND $0409,X		  ; 3D 09 04 | Logical AND with accumulator (absolute,X)
	ROL $0406,X		  ; 3E 06 04 | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHY				  ; 5A | Push Y register to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	STA $65			  ; 85 65 | Store accumulator to zero page
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	ROR $86			  ; 66 86 | Rotate right (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	BPL $11			  ; 10 11 | Branch if positive
	ROL $06			  ; 26 06 | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	STX $54			  ; 86 54 | Store X register to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	ASL $29			  ; 06 29 | Arithmetic shift left (zero page)
	ROR $34			  ; 66 34 | Rotate right (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	ORA $0011,Y		  ; 19 11 00 | Logical OR with accumulator (absolute,Y)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $36			  ; 66 36 | Rotate right (zero page)
	ASL $0E1F,X		  ; 1E 1F 0E | Arithmetic shift left (absolute,X)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $20			  ; 10 20 | Branch if positive
	AND ($2C,X)		  ; 21 2C | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_05F
; Address: $C690A9
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_05F:
	JSL $002423		  ; 22 23 24 00 | Jump to subroutine long
	ROR $86			  ; 66 86 | Rotate right (zero page)
	BIT $2A			  ; 24 2A | Test bits in accumulator (zero page)
	STZ $66			  ; 64 66 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	ORA $2B25			; 0D 25 2B | Logical OR with accumulator (absolute)
	AND $0011			; 2D 11 00 | Logical AND with accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	ROL $0F			  ; 26 0F | Rotate left (zero page)
	STZ $26			  ; 64 26 | Store zero to zero page
	BIT $21			  ; 24 21 | PPU graphics register access
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ORA $1725			; 0D 25 17 | Logical OR with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STZ $46			  ; 64 46 | Store zero to zero page
	ASL $0120			; 0E 20 01 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STX $44			  ; 86 44 | Store X register to zero page
	ASL $1805,X		  ; 1E 05 18 | Arithmetic shift left (absolute,X)
	LSR $64			  ; 46 64 | Logical shift right (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	INC				  ; 1A | Increment accumulator
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA $1021			; 0D 21 10 | Logical OR with accumulator (absolute)
	AND $0011			; 2D 11 00 | Logical AND with accumulator (absolute)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STX $04			  ; 86 04 | Store X register to zero page
	AND #$14			 ; 29 14 | Logical AND with accumulator (immediate)
	ADC $04			  ; 65 04 | Add with carry (zero page)
	PHP				  ; 08 | Push processor status to stack
	STZ $06			  ; 64 06 | Store zero to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $86			  ; 24 86 | Test bits in accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	BIT $19			  ; 24 19 | Test bits in accumulator (zero page)
	AND $18			  ; 25 18 | Logical AND with accumulator (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_060
; Address: $C69170
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_060:
	WDM #$64			 ; 42 64 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROR $46			  ; 66 46 | Rotate right (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ROR $44			  ; 66 44 | Rotate right (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	LSR $44			  ; 46 44 | Logical shift right (zero page)
	PHP				  ; 08 | Push processor status to stack
	AND #$24			 ; 29 24 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA $0011,Y		  ; 19 11 00 | Logical OR with accumulator (absolute,Y)
	ROR $04			  ; 66 04 | Rotate right (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $06			  ; 46 06 | Logical shift right (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BIT $82			  ; 24 82 | Test bits in accumulator (zero page)
	ORA $2E2B,Y		  ; 19 2B 2E | Logical OR with accumulator (absolute,Y)
	STZ $08			  ; 64 08 | Store zero to zero page
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $2425			; 0D 25 24 | Logical OR with accumulator (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	LSR $24			  ; 46 24 | Logical shift right (zero page)
	ASL $091E			; 0E 1E 09 | Arithmetic shift left (absolute)
	ROR $64			  ; 66 64 | Rotate right (zero page)
	AND $0B20			; 2D 20 0B | Logical AND with accumulator (absolute)
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	STZ $46			  ; 64 46 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $110C			; 0D 0C 11 | Logical OR with accumulator (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	LSR $35			  ; 46 35 | Logical shift right (zero page)
	ASL $0905			; 0E 05 09 | Arithmetic shift left (absolute)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	STY $00			  ; 84 00 | Store Y register to zero page
	AND ($29,X)		  ; 21 29 | Logical AND with accumulator ((zero page,X))
	ROL $242B			; 2E 2B 24 | Rotate left (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ROL $00			  ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_063
; Address: $C69248
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_063:
	LSR $44			  ; 46 44 | Logical shift right (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA $252D,Y		  ; 19 2D 25 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	BPL $11			  ; 10 11 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_065
; Address: $C69265
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_065:
	JSL $002317		  ; 22 17 23 00 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	AND #$24			 ; 29 24 | Logical AND with accumulator (immediate)
	ASL $1128,X		  ; 1E 28 11 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_067
; Address: $C6927D
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_067:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	STX $86			  ; 86 86 | Store X register to zero page
	ROL $2B09			; 2E 09 2B | Rotate left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	LSR $04			  ; 46 04 | Logical shift right (zero page)
	AND ($0C,X)		  ; 21 0C | Logical AND with accumulator ((zero page,X))
	AND $29			  ; 25 29 | Logical AND with accumulator (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	ROL $0F			  ; 26 0F | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	WDM #$00			 ; 42 00 | Reserved instruction
	ORA $2125			; 0D 25 21 | PPU graphics register access
	LSR $56			  ; 46 56 | Logical shift right (zero page)
	LDX $00			  ; A6 00 | Load from zero page into X register
	PLP				  ; 28 | Pull processor status from stack
	ORA $2C2A,Y		  ; 19 2A 2C | Logical OR with accumulator (absolute,Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	ROL $27			  ; 26 27 | Rotate left (zero page)
	LSR $44			  ; 46 44 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_068
; Address: $C692D1
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_068:
	JSR $1825			; 20 25 18 | Jump to subroutine
	STZ $46			  ; 64 46 | Store zero to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA $2D19			; 0D 19 2D | Logical OR with accumulator (absolute)
	BPL $11			  ; 10 11 | Branch if positive
	ROL $0F			  ; 26 0F | Rotate left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA $2E25			; 0D 25 2E | Logical OR with accumulator (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $24			  ; 66 24 | Rotate right (zero page)
	ROL $36			  ; 26 36 | Rotate left (zero page)
	ORA #$2E			 ; 09 2E | Logical OR with accumulator (immediate)
	ORA $2B1A,Y		  ; 19 1A 2B | Logical OR with accumulator (absolute,Y)
	AND ($18,X)		  ; 21 18 | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_069
; Address: $C6930E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_069:
	ORA $0403,Y		  ; 19 03 04 | Logical OR with accumulator (absolute,Y)
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	ASL $15			  ; 06 15 | Arithmetic shift left (zero page)
	ASL $15			  ; 06 15 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $0803,X		  ; 1D 03 08 | Logical OR with accumulator (absolute,X)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	ASL $0903,X		  ; 1E 03 09 | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_06A
; Address: $C69338
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_06A:
	JSR $0B03			; 20 03 0B | Jump to subroutine
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_06B
; Address: $C69344
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_06B:
	JSL $140103		  ; 22 03 01 14 | Jump to subroutine long
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1E2714		  ; 8F 14 27 1E | Store accumulator to absolute long address
	PHB				  ; 8B | Push data bank register to stack
	STZ $3C			  ; 64 3C | Store zero to zero page
	BIT $8D46			; 2C 46 8D | Test bits in accumulator (absolute)
	BVC $34			  ; 50 34 | Branch if overflow clear
	PHY				  ; 5A | Push Y register to stack
	AND $635F,Y		  ; 39 5F 63 | Logical AND with accumulator (absolute,Y)
	STZ $D3			  ; 64 D3 | Store zero to zero page
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	AND $03			  ; 25 03 | Logical AND with accumulator (zero page)
	ROL $03			  ; 26 03 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D03			; 2C 03 2D | Test bits in accumulator (absolute)
	ROL $2F03			; 2E 03 2F | Rotate left (absolute)
	BMI $03			  ; 30 03 | Branch if negative
	AND ($03),Y		  ; 31 03 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	AND $C203,Y		  ; 39 03 C2 | Logical AND with accumulator (absolute,Y)
	BMI $F4			  ; 30 F4 | Branch if negative
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA $BE5F			; AD 5F BE | Load from absolute address into accumulator
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_06C
; Address: $C693A1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_06C:
	JSL $C1B5C9		  ; 22 C9 B5 C1 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_06D
; Address: $C693A7
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_06D:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_070
; Address: $C693B2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_070:
	JSL $C7304B		  ; 22 4B 30 C7 | Jump to subroutine long
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDA $FBC1			; AD C1 FB | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_071
; Address: $C693BB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_071:
	JSL $C1E314		  ; 22 14 E3 C1 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_074
; Address: $C693CF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_074:
	JSL $C73824		  ; 22 24 38 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_076
; Address: $C693D9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_076:
	JSL $C08D4C		  ; 22 4C 8D C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_079
; Address: $C693EB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_079:
	JSL $C73824		  ; 22 24 38 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_07B
; Address: $C693F5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_07B:
	JSL $C08D4C		  ; 22 4C 8D C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_07D
; Address: $C693FF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_07D:
	JSL $C77E6F		  ; 22 6F 7E C7 | Jump to subroutine long
	LDA $AD55			; AD 55 AD | Load from absolute address into accumulator
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal
	CMP #$35			 ; C9 35 | Compare accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_07F
; Address: $C69416
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_07F:
	JSL $C73824		  ; 22 24 38 C7 | Jump to subroutine long
	BRA $31			  ; 80 31 | Branch always
	LDA #$D1			 ; A9 D1 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BCC $E8			  ; 90 E8 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_080
; Address: $C69428
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_080:
	JSL $C77E1C		  ; 22 1C 7E C7 | Jump to subroutine long
	BRA $12			  ; 80 12 | Branch always
	LDA #$D2			 ; A9 D2 | Load immediate value into accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_082
; Address: $C6943A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_082:
	JSL $C77E22		  ; 22 22 7E C7 | Jump to subroutine long
	BRA $00			  ; 80 00 | Branch always
	BCS $0B			  ; B0 0B | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_086
; Address: $C69452
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_086:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$AB			 ; A9 AB | Load immediate value into accumulator
	JMP $C1D679		  ; 5C 79 D6 C1 | Jump to address long
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	JMP $C1D679		  ; 5C 79 D6 C1 | Jump to address long
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$AD			 ; A9 AD | Load immediate value into accumulator
	JMP $C1D679		  ; 5C 79 D6 C1 | Jump to address long
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_087
; Address: $C69477
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_087:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROR $0040,X		  ; 7E 40 00 | Rotate right (absolute,X)
	LDA $7E353B		  ; AF 3B 35 7E | Load from absolute long address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $0D			  ; D0 0D | Branch if not equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_088
; Address: $C6948A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_088:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ROR $0002,X		  ; 7E 02 00 | Rotate right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_089
; Address: $C69497
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_089:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_08A
; Address: $C6949A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_08A:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STZ $C167			; 9C 67 C1 | Store zero to absolute
	STZ $C169			; 9C 69 C1 | Store zero to absolute
	LDA $99F9			; AD F9 99 | Load from absolute address into accumulator
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	BNE $4B			  ; D0 4B | Branch if not equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_08B
; Address: $C694AB
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_08B:
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $DA65,X		  ; BD 65 DA | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $C725,X		  ; BD 25 C7 | Load from absolute,X into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $C725,Y		  ; F9 25 C7 | Subtract with carry (absolute,Y)
	STA $30			  ; 85 30 | Store accumulator to zero page
	BPL $04			  ; 10 04 | Branch if positive
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_08C
; Address: $C694C6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_08C:
	JSR $14F9			; 20 F9 14 | Jump to subroutine
	STA $C167			; 8D 67 C1 | Store accumulator to absolute address
	LDA $30			  ; A5 30 | Load from zero page into accumulator
	STA $C16B			; 8D 6B C1 | Store accumulator to absolute address
	LDA $C765,X		  ; BD 65 C7 | Load from absolute,X into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $C765,Y		  ; F9 65 C7 | Subtract with carry (absolute,Y)
	STA $30			  ; 85 30 | Store accumulator to zero page
	BPL $04			  ; 10 04 | Branch if positive
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_08D
; Address: $C694E0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_08D:
	JSR $14F9			; 20 F9 14 | Jump to subroutine
	STA $C169			; 8D 69 C1 | Store accumulator to absolute address
	LDA $30			  ; A5 30 | Load from zero page into accumulator
	STA $C16D			; 8D 6D C1 | Store accumulator to absolute address
	LSR $C167			; 4E 67 C1 | Logical shift right (absolute)
	LSR $C169			; 4E 69 C1 | Logical shift right (absolute)
	SEC				  ; 38 | Set carry flag
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_08E
; Address: $C694F6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_08E:
	CLC				  ; 18 | Clear carry flag
	BRA $F9			  ; 80 F9 | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($A5,X)		  ; 01 A5 | Logical OR with accumulator ((zero page,X))
	BMI $49			  ; 30 49 | Branch if negative
	STA $30			  ; 85 30 | Store accumulator to zero page
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_08F
; Address: $C69514
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_08F:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_092
; Address: $C69524
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_092:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LDX #$04			 ; A2 04 | Load immediate value into X register
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BRA $0D			  ; 80 0D | Branch always

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_094
; Address: $C6953C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_094:
	JSR $1544			; 20 44 15 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_095
; Address: $C69544
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_095:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	BNE $F9			  ; D0 F9 | Branch if not equal
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_09A
; Address: $C69560
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_09A:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_09B
; Address: $C69568
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_09B:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0A2
; Address: $C6959D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0A2:
	JSL $C62DD5		  ; 22 D5 2D C6 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0A3
; Address: $C695A5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0A3:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0A4
; Address: $C695AD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0A4:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $C1FFFE		  ; AF FE FF C1 | Load from absolute long address into accumulator
	BPL $0B			  ; 10 0B | Branch if positive
	LDA $C36B			; AD 6B C3 | Load from absolute address into accumulator
	BEQ $06			  ; F0 06 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	STA $3530			; 8D 30 35 | Store accumulator to absolute address
	BRA $0B			  ; 80 0B | Branch always
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0A6
; Address: $C695CC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0A6:
	JSL $C1C35F		  ; 22 5F C3 C1 | Jump to subroutine long
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	STA $3536			; 8D 36 35 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0AA
; Address: $C695F4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0AA:
	JSL $C62DD5		  ; 22 D5 2D C6 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0AD
; Address: $C69604
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0AD:
	JSL $C1D415		  ; 22 15 D4 C1 | Jump to subroutine long
	BCC $04			  ; 90 04 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0AE
; Address: $C6960B
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0AE:
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0AF
; Address: $C6960E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0AF:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $03			  ; 80 03 | Branch always
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0B4
; Address: $C6962D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0B4:
	JSL $C73281		  ; 22 81 32 C7 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $99F7			; AD F7 99 | Load from absolute address into accumulator
	CMP #$55			 ; C9 55 | Compare accumulator (immediate)
	BNE $1B			  ; D0 1B | Branch if not equal
	LDA $7E3545		  ; AF 45 35 7E | Load from absolute long address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0B5
; Address: $C69645
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0B5:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	EOR $35			  ; 45 35 | Exclusive OR with accumulator (zero page)
	ROR $0002,X		  ; 7E 02 00 | Rotate right (absolute,X)
	LDA $99F9			; AD F9 99 | Load from absolute address into accumulator
	CMP #$4B			 ; C9 4B | Compare accumulator (immediate)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0B6
; Address: $C6965B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0B6:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0B8
; Address: $C69679
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0B8:
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	AND #$BF			 ; 29 BF | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BPL $2D			  ; 10 2D | Branch if positive
	LDX $2A			  ; A6 2A | Load from zero page into X register
	BEQ $4D			  ; F0 4D | Branch if equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0B9
; Address: $C6968B
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0B9:
	JSR $A62D			; 20 2D A6 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	BNE $3E			  ; D0 3E | Branch if not equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	AND $2AA6			; 2D A6 2A | Logical AND with accumulator (absolute)
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $33BC			; 8D BC 33 | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $2D			  ; 10 2D | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	BEQ $11			  ; F0 11 | Branch if equal
	LDA $33F8			; AD F8 33 | Load from absolute address into accumulator
	STA $001D9E		  ; 8F 9E 1D 00 | Store accumulator to absolute long address
	LDA $33FA			; AD FA 33 | Load from absolute address into accumulator
	STA $001DA0		  ; 8F A0 1D 00 | Store accumulator to absolute long address
	STZ $AD1D,X		  ; 9E 1D AD | Store zero to absolute,X
	LDY $8333,X		  ; BC 33 83 | Load from absolute,X into Y register
	ASL $AD			  ; 06 AD | Arithmetic shift left (zero page)
	STZ $F02A			; 9C 2A F0 | Store zero to absolute
	ORA ($A3),Y		  ; 11 A3 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	JMP $16D6			; 4C D6 16 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0BA
; Address: $C696DE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0BA:
	STA $33F8			; 8D F8 33 | Store accumulator to absolute address
	STX $33FA			; 8E FA 33 | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0BB
; Address: $C696E5
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0BB:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	JMP $1672			; 4C 72 16 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	JMP $1672			; 4C 72 16 | Jump to address
	STA $33B0			; 8D B0 33 | Store accumulator to absolute address
	STX $33B2			; 8E B2 33 | Store X register to absolute address
	STY $33B4			; 8C B4 33 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0BC
; Address: $C6971D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0BC:
	JSL $C02BD9		  ; 22 D9 2B C0 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $33AE			; 8D AE 33 | Store accumulator to absolute address
	LDA $33B0			; AD B0 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0C5
; Address: $C69753
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0C5:
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $2800,X		  ; 9D 00 28 | Store accumulator to absolute,X
	LDA $33AC			; AD AC 33 | Load from absolute address into accumulator
	STA $2818,X		  ; 9D 18 28 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0C6
; Address: $C6975D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0C6:
	STZ $2A40,X		  ; 9E 40 2A | Store zero to absolute,X
	STZ $28F0,X		  ; 9E F0 28 | Store zero to absolute,X
	STZ $2920,X		  ; 9E 20 29 | Store zero to absolute,X
	STZ $2938,X		  ; 9E 38 29 | Store zero to absolute,X
	STZ $2980,X		  ; 9E 80 29 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0C7
; Address: $C6976C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0C7:
	JSL $C90501		  ; 22 01 05 C9 | Jump to subroutine long
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PEA #$001F		   ; F4 1F 00 | Push effective address to stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0C8
; Address: $C69780
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0C8:
	JSL $C90717		  ; 22 17 07 C9 | Jump to subroutine long
	STA $2848,X		  ; 9D 48 28 | Store accumulator to absolute,X
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PEA #$03E0		   ; F4 E0 03 | Push effective address to stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0C9
; Address: $C69790
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0C9:
	JSL $C90717		  ; 22 17 07 C9 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	ORA $2848,X		  ; 1D 48 28 | Logical OR with accumulator (absolute,X)
	STA $2848,X		  ; 9D 48 28 | Store accumulator to absolute,X
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PEA #$007C		   ; F4 7C 00 | Push effective address to stack
	PEA #$0001		   ; F4 01 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0CA
; Address: $C697A4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0CA:
	JSL $C90717		  ; 22 17 07 C9 | Jump to subroutine long
	STA $2878,X		  ; 9D 78 28 | Store accumulator to absolute,X
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PEA #$0F80		   ; F4 80 0F | Push effective address to stack
	PEA #$0001		   ; F4 01 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0CB
; Address: $C697B4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0CB:
	JSL $C90717		  ; 22 17 07 C9 | Jump to subroutine long
	STA $2890,X		  ; 9D 90 28 | Store accumulator to absolute,X
	STA $2860,X		  ; 9D 60 28 | Store accumulator to absolute,X
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PEA #$0007		   ; F4 07 00 | Push effective address to stack
	PEA #$0005		   ; F4 05 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0CC
; Address: $C697C7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0CC:
	JSL $C90717		  ; 22 17 07 C9 | Jump to subroutine long
	STA $28A8,X		  ; 9D A8 28 | Store accumulator to absolute,X
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PEA #$001E		   ; F4 1E 00 | Push effective address to stack
	PEA #$0004		   ; F4 04 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0CD
; Address: $C697D7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0CD:
	JSL $C90717		  ; 22 17 07 C9 | Jump to subroutine long
	STA $2950,X		  ; 9D 50 29 | Store accumulator to absolute,X
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PEA #$000F		   ; F4 0F 00 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0CE
; Address: $C697E7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0CE:
	JSL $C90717		  ; 22 17 07 C9 | Jump to subroutine long
	STA $28D8,X		  ; 9D D8 28 | Store accumulator to absolute,X
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PEA #$00F8		   ; F4 F8 00 | Push effective address to stack
	PEA #$0005		   ; F4 05 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0CF
; Address: $C697F7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0CF:
	JSL $C90717		  ; 22 17 07 C9 | Jump to subroutine long
	STA $2968,X		  ; 9D 68 29 | Store accumulator to absolute,X
	PEA #$0000		   ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0D1
; Address: $C69807
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0D1:
	JSL $C90717		  ; 22 17 07 C9 | Jump to subroutine long
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	ORA $2A40,X		  ; 1D 40 2A | Logical OR with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PEA #$00C0		   ; F4 C0 00 | Push effective address to stack
	PEA #$0002		   ; F4 02 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0D2
; Address: $C6981D
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0D2:
	JSL $C90717		  ; 22 17 07 C9 | Jump to subroutine long
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $2A40,X		  ; 1D 40 2A | Logical OR with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	LDY #$06			 ; A0 06 | Load immediate value into Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $29F8,X		  ; 9D F8 29 | Store accumulator to absolute,X
	LDY #$07			 ; A0 07 | Load immediate value into Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $2A10,X		  ; 9D 10 2A | Store accumulator to absolute,X
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $2A28,X		  ; 9D 28 2A | Store accumulator to absolute,X
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	STA $2830,X		  ; 9D 30 28 | Store accumulator to absolute,X
	LDY #$0B			 ; A0 0B | Load immediate value into Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $29C8,X		  ; 9D C8 29 | Store accumulator to absolute,X
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PEA #$0030		   ; F4 30 00 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0D3
; Address: $C69869
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0D3:
	JSL $C90717		  ; 22 17 07 C9 | Jump to subroutine long
	STA $28C0,X		  ; 9D C0 28 | Store accumulator to absolute,X
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ORA $2A40,X		  ; 1D 40 2A | Logical OR with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA $2A40,X		  ; 1D 40 2A | Logical OR with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	LDA $2878,X		  ; BD 78 28 | Load from absolute,X into accumulator
	STA $2860,X		  ; 9D 60 28 | Store accumulator to absolute,X
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0D4
; Address: $C698A1
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0D4:
	ORA $2A40,X		  ; 1D 40 2A | Logical OR with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	LDY #$03			 ; A0 03 | Load immediate value into Y register
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROL				  ; 2A | Rotate left (accumulator)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0D5
; Address: $C698C6
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0D5:
	JSR $401D			; 20 1D 40 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt
	ORA $2A40,X		  ; 1D 40 2A | Logical OR with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	LDY #$03			 ; A0 03 | Load immediate value into Y register
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $29			  ; D0 29 | Branch if not equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BPL $1D			  ; 10 1D | Branch if positive
	RTI				  ; 40 | Return from interrupt
	ROL				  ; 2A | Rotate left (accumulator)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $09			  ; 80 09 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA $2848,X		  ; BD 48 28 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $BE45			; AD 45 BE | Load from absolute address into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$09			 ; A9 09 | Load immediate value into accumulator
	STA $2890,X		  ; 9D 90 28 | Store accumulator to absolute,X
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0D6
; Address: $C69914
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0D6:
	STZ $04			  ; 64 04 | Store zero to zero page
	STX $2C			  ; 86 2C | Store X register to zero page
	LDA $2848,X		  ; BD 48 28 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0D7
; Address: $C6991B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0D7:
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $12			  ; 85 12 | Store accumulator to zero page
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $14			  ; 85 14 | Store accumulator to zero page
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	STA $2E			  ; 85 2E | Store accumulator to zero page
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $07			  ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0D9
; Address: $C69939
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0D9:
	JSL $C325E7		  ; 22 E7 25 C3 | Jump to subroutine long
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BNE $21			  ; D0 21 | PPU graphics register access
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA $2878,X		  ; BD 78 28 | Load from absolute,X into accumulator
	STA $16			  ; 85 16 | Store accumulator to zero page
	LDA $2860,X		  ; BD 60 28 | Load from absolute,X into accumulator
	STA $18			  ; 85 18 | Store accumulator to zero page
	JMP $1976			; 4C 76 19 | Jump to address
	LDA $2860,X		  ; BD 60 28 | Load from absolute,X into accumulator
	STA $16			  ; 85 16 | Store accumulator to zero page
	LDA $2890,X		  ; BD 90 28 | Load from absolute,X into accumulator
	STA $18			  ; 85 18 | Store accumulator to zero page
	JMP $1976			; 4C 76 19 | Jump to address
	LDA $2878,X		  ; BD 78 28 | Load from absolute,X into accumulator
	STA $16			  ; 85 16 | Store accumulator to zero page
	LDA $2890,X		  ; BD 90 28 | Load from absolute,X into accumulator
	STA $18			  ; 85 18 | Store accumulator to zero page
	LDA $28A8,X		  ; BD A8 28 | Load from absolute,X into accumulator
	STA $0A			  ; 85 0A | Store accumulator to zero page
	LDA $2998,X		  ; BD 98 29 | Load from absolute,X into accumulator
	STA $08			  ; 85 08 | Store accumulator to zero page
	LDA $29B0,X		  ; BD B0 29 | Load from absolute,X into accumulator
	STA $06			  ; 85 06 | Store accumulator to zero page
	LDA $14			  ; A5 14 | Load from zero page into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $12			  ; 65 12 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0DA
; Address: $C6998D
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0DA:
	ADC $12			  ; 65 12 | Add with carry (zero page)
	STA $1E			  ; 85 1E | Store accumulator to zero page
	STA $26			  ; 85 26 | Store accumulator to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	ADC $16			  ; 65 16 | Add with carry (zero page)
	ADC $16			  ; 65 16 | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$1C			 ; A9 1C | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $18			  ; E5 18 | Subtract with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $28			  ; 85 28 | Store accumulator to zero page
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $1E			  ; A5 1E | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$F2			 ; 69 F2 | Add with carry (immediate)
	SEC				  ; 38 | Set carry flag
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0DC
; Address: $C699C5
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0DC:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $14			  ; F0 14 | Branch if equal
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $0A			  ; E5 0A | Subtract with carry (zero page)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	STA $22			  ; 85 22 | Store accumulator to zero page
	LDA $1E			  ; A5 1E | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	BIT $68			  ; 24 68 | Test bits in accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0DE
; Address: $C699E3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0DE:
	SEC				  ; 38 | Set carry flag
	SBC $16			  ; E5 16 | Subtract with carry (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	STA $22			  ; 85 22 | Store accumulator to zero page
	LDA $1E			  ; A5 1E | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	BIT $68			  ; 24 68 | Test bits in accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0DF
; Address: $C699F5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0DF:
	LDY $7F64			; AC 64 7F | Load from absolute address into Y register
	LDA $32FC,Y		  ; B9 FC 32 | Load from absolute,Y into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0E3
; Address: $C69A0A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0E3:
	JSL $C31AFC		  ; 22 FC 1A C3 | Jump to subroutine long
	BCC $2D			  ; 90 2D | Branch if carry clear
	PHX				  ; DA | Push X register to stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $33AA			; EC AA 33 | Compare X register (absolute)
	PLX				  ; FA | Pull X register from stack
	BCS $12			  ; B0 12 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0E7
; Address: $C69A27
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0E7:
	JSL $C31DFA		  ; 22 FA 1D C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $2A40,X		  ; 3D 40 2A | Logical AND with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	LDA $2800,X		  ; BD 00 28 | Load from absolute,X into accumulator
	JMP $1A42			; 4C 42 1A | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0EA
; Address: $C69A45
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0EA:
	JSR $1A73			; 20 73 1A | Jump to subroutine
	CPX $33AE			; EC AE 33 | Compare X register (absolute)
	BCS $09			  ; B0 09 | Branch if carry set
	STX $33AE			; 8E AE 33 | Store X register to absolute address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0EC
; Address: $C69A5A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0EC:
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BCS $13			  ; B0 13 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0ED
; Address: $C69A60
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0ED:
	JSL $C31753		  ; 22 53 17 C3 | Jump to subroutine long
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	INC $33AA			; EE AA 33 | Increment (absolute)
	INC $33AA			; EE AA 33 | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0EE
; Address: $C69A73
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0EE:
	STA $00			  ; 85 00 | Store accumulator to zero page
	STX $02			  ; 86 02 | Store X register to zero page
	STZ $2AA6			; 9C A6 2A | Store zero to absolute
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BPL $D0			  ; 10 D0 | Branch if positive

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0EF
; Address: $C69A82
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0EF:
	JSL $C02D16		  ; 22 16 2D C0 | Jump to subroutine long
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0F0
; Address: $C69A8B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0F0:
	JSL $C31AA2		  ; 22 A2 1A C3 | Jump to subroutine long
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	STA $32FC,Y		  ; 99 FC 32 | Store accumulator to absolute,Y
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA $32F2,Y		  ; 99 F2 32 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0F1
; Address: $C69A99
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0F1:
	JSL $C02C2D		  ; 22 2D 2C C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ASL $18C3,X		  ; 1E C3 18 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0F2
; Address: $C69AA2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0F2:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $7F50,Y		  ; B9 50 7F | Load from absolute,Y into accumulator
	BNE $0A			  ; D0 0A | Branch if not equal
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0F3
; Address: $C69AB5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0F3:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	CPY $7A1A			; CC 1A 7A | Compare Y register (absolute)
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0F6
; Address: $C69ACE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0F6:
	SBC ($1A,X)		  ; E1 1A | Subtract with carry ((zero page,X))
	INC $FB1A			; EE 1A FB | Increment (absolute)
	INC				  ; 1A | Increment accumulator
	LDA $33B8			; AD B8 33 | Load from absolute address into accumulator
	STA $29B0,Y		  ; 99 B0 29 | Store accumulator to absolute,Y
	LDA $33BA			; AD BA 33 | Load from absolute address into accumulator
	STA $2998,Y		  ; 99 98 29 | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0F7
; Address: $C69AE1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0F7:
	LDA $33B8			; AD B8 33 | Load from absolute address into accumulator
	STA $2998,Y		  ; 99 98 29 | Store accumulator to absolute,Y
	LDA $33BA			; AD BA 33 | Load from absolute address into accumulator
	STA $29B0,Y		  ; 99 B0 29 | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0F8
; Address: $C69AEE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0F8:
	LDA $33B8			; AD B8 33 | Load from absolute address into accumulator
	STA $2998,Y		  ; 99 98 29 | Store accumulator to absolute,Y
	LDA $33BA			; AD BA 33 | Load from absolute address into accumulator
	STA $29B0,Y		  ; 99 B0 29 | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0FA
; Address: $C69AFC
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0FA:
	LDX $33AA			; AE AA 33 | Load from absolute address into X register
	BEQ $0F			  ; F0 0F | Branch if equal
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CMP $2800,X		  ; DD 00 28 | Compare accumulator (absolute,X)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $33AA			; EC AA 33 | Compare X register (absolute)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0FC
; Address: $C69B14
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0FC:
	STX $33AA			; 8E AA 33 | Store X register to absolute address
	LDA $2816,X		  ; BD 16 28 | Load from absolute,X into accumulator
	INC				  ; 1A | Increment accumulator
	STA $33AC			; 8D AC 33 | Store accumulator to absolute address
	STZ $2800,X		  ; 9E 00 28 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0FD
; Address: $C69B29
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0FD:
	PHX				  ; DA | Push X register to stack
	LDA $2818,X		  ; BD 18 28 | Load from absolute,X into accumulator
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $33AA			; EC AA 33 | Compare X register (absolute)
	BCS $57			  ; B0 57 | Branch if carry set
	LDY $2800,X		  ; BC 00 28 | Load from absolute,X into Y register
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_0FE
; Address: $C69B39
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_0FE:
	CMP $2818,X		  ; DD 18 28 | Compare accumulator (absolute,X)
	BCS $EF			  ; B0 EF | Branch if carry set
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STX $33AA			; 8E AA 33 | Store X register to absolute address
	LDA $2848,X		  ; BD 48 28 | Load from absolute,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $B493			; 8D 93 B4 | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	ADC $2890,X		  ; 7D 90 28 | Add with carry (absolute,X)
	STA $B495			; 8D 95 B4 | Store accumulator to absolute address
	LDA $2800,X		  ; BD 00 28 | Load from absolute,X into accumulator
	BEQ $2D			  ; F0 2D | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_100
; Address: $C69B61
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_100:
	JSL $C32471		  ; 22 71 24 C3 | Jump to subroutine long
	LDA $2848,X		  ; BD 48 28 | Load from absolute,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP $B493			; CD 93 B4 | Compare accumulator (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	STA $B493			; 8D 93 B4 | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	ADC $2890,X		  ; 7D 90 28 | Add with carry (absolute,X)
	CMP $B495			; CD 95 B4 | Compare accumulator (absolute)
	BCC $03			  ; 90 03 | Branch if carry clear
	STA $B495			; 8D 95 B4 | Store accumulator to absolute address
	STZ $2800,X		  ; 9E 00 28 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BCC $CE			  ; 90 CE | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_103
; Address: $C69B95
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_103:
	JSL $C31C4E		  ; 22 4E 1C C3 | Jump to subroutine long
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$FE			 ; A9 FE | Load immediate value into accumulator
	INC				  ; 1A | Increment accumulator
	STA $338C			; 8D 8C 33 | Store accumulator to absolute address
	LDA $2802,X		  ; BD 02 28 | Load from absolute,X into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $1C3B			; 4C 3B 1C | Jump to address
	STA $2800,X		  ; 9D 00 28 | Store accumulator to absolute,X
	LDA $281A,X		  ; BD 1A 28 | Load from absolute,X into accumulator
	CMP $338C			; CD 8C 33 | Compare accumulator (absolute)
	BCC $01			  ; 90 01 | Branch if carry clear
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_104
; Address: $C69BB6
; Size: 143 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_104:
	STA $2818,X		  ; 9D 18 28 | Store accumulator to absolute,X
	LDA $2832,X		  ; BD 32 28 | Load from absolute,X into accumulator
	STA $2830,X		  ; 9D 30 28 | Store accumulator to absolute,X
	LDA $284A,X		  ; BD 4A 28 | Load from absolute,X into accumulator
	STA $2848,X		  ; 9D 48 28 | Store accumulator to absolute,X
	LDA $287A,X		  ; BD 7A 28 | Load from absolute,X into accumulator
	STA $2878,X		  ; 9D 78 28 | Store accumulator to absolute,X
	LDA $2892,X		  ; BD 92 28 | Load from absolute,X into accumulator
	STA $2890,X		  ; 9D 90 28 | Store accumulator to absolute,X
	LDA $28C2,X		  ; BD C2 28 | Load from absolute,X into accumulator
	STA $28C0,X		  ; 9D C0 28 | Store accumulator to absolute,X
	LDA $28DA,X		  ; BD DA 28 | Load from absolute,X into accumulator
	STA $28D8,X		  ; 9D D8 28 | Store accumulator to absolute,X
	LDA $28F2,X		  ; BD F2 28 | Load from absolute,X into accumulator
	STA $28F0,X		  ; 9D F0 28 | Store accumulator to absolute,X
	LDA $290A,X		  ; BD 0A 29 | Load from absolute,X into accumulator
	STA $2908,X		  ; 9D 08 29 | Store accumulator to absolute,X
	LDA $2922,X		  ; BD 22 29 | Load from absolute,X into accumulator
	STA $2920,X		  ; 9D 20 29 | Store accumulator to absolute,X
	LDA $2952,X		  ; BD 52 29 | Load from absolute,X into accumulator
	STA $2950,X		  ; 9D 50 29 | Store accumulator to absolute,X
	LDA $296A,X		  ; BD 6A 29 | Load from absolute,X into accumulator
	STA $2968,X		  ; 9D 68 29 | Store accumulator to absolute,X
	LDA $2982,X		  ; BD 82 29 | Load from absolute,X into accumulator
	STA $2980,X		  ; 9D 80 29 | Store accumulator to absolute,X
	LDA $299A,X		  ; BD 9A 29 | Load from absolute,X into accumulator
	STA $2998,X		  ; 9D 98 29 | Store accumulator to absolute,X
	LDA $29B2,X		  ; BD B2 29 | Load from absolute,X into accumulator
	STA $29B0,X		  ; 9D B0 29 | Store accumulator to absolute,X
	LDA $29CA,X		  ; BD CA 29 | Load from absolute,X into accumulator
	STA $29C8,X		  ; 9D C8 29 | Store accumulator to absolute,X
	LDA $29E2,X		  ; BD E2 29 | Load from absolute,X into accumulator
	STA $29E0,X		  ; 9D E0 29 | Store accumulator to absolute,X
	LDA $29FA,X		  ; BD FA 29 | Load from absolute,X into accumulator
	STA $29F8,X		  ; 9D F8 29 | Store accumulator to absolute,X
	LDA $2A12,X		  ; BD 12 2A | Load from absolute,X into accumulator
	STA $2A10,X		  ; 9D 10 2A | Store accumulator to absolute,X
	LDA $2A2A,X		  ; BD 2A 2A | Load from absolute,X into accumulator
	STA $2A28,X		  ; 9D 28 2A | Store accumulator to absolute,X
	LDA $2A42,X		  ; BD 42 2A | Load from absolute,X into accumulator
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $33AA			; EC AA 33 | Compare X register (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1BA2			; 4C A2 1B | Jump to address
	STZ $2800,X		  ; 9E 00 28 | Store zero to absolute,X
	DEC $33AA			; CE AA 33 | Decrement (absolute)
	DEC $33AA			; CE AA 33 | Decrement (absolute)
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_105
; Address: $C69C45
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_105:
	LDA $338C			; AD 8C 33 | Load from absolute address into accumulator
	BMI $03			  ; 30 03 | Branch if negative
	DEC $33AC			; CE AC 33 | Decrement (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_106
; Address: $C69C4E
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_106:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STX $338C			; 8E 8C 33 | Store X register to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CPX $338C			; EC 8C 33 | Compare X register (absolute)
	BEQ $0A			  ; F0 0A | Branch if equal
	LDY $2800,X		  ; BC 00 28 | Load from absolute,X into Y register
	BEQ $0C			  ; F0 0C | Branch if equal
	CMP $2818,X		  ; DD 18 28 | Compare accumulator (absolute,X)
	BEQ $08			  ; F0 08 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BCC $EA			  ; 90 EA | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_107
; Address: $C69C70
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_107:
	LDA $2800,X		  ; BD 00 28 | Load from absolute,X into accumulator
	LDY $2800			; AC 00 28 | Load from absolute address into Y register
	STA $2800			; 8D 00 28 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2800,X		  ; 9D 00 28 | Store accumulator to absolute,X
	LDA $2818,X		  ; BD 18 28 | Load from absolute,X into accumulator
	LDY $2818			; AC 18 28 | Load from absolute address into Y register
	STA $2818			; 8D 18 28 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2818,X		  ; 9D 18 28 | Store accumulator to absolute,X
	LDA $2830,X		  ; BD 30 28 | Load from absolute,X into accumulator
	LDY $2830			; AC 30 28 | Load from absolute address into Y register
	STA $2830			; 8D 30 28 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2830,X		  ; 9D 30 28 | Store accumulator to absolute,X
	LDA $2848,X		  ; BD 48 28 | Load from absolute,X into accumulator
	LDY $2848			; AC 48 28 | Load from absolute address into Y register
	STA $2848			; 8D 48 28 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2848,X		  ; 9D 48 28 | Store accumulator to absolute,X
	LDA $2860,X		  ; BD 60 28 | Load from absolute,X into accumulator
	LDY $2860			; AC 60 28 | Load from absolute address into Y register
	STA $2860			; 8D 60 28 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2860,X		  ; 9D 60 28 | Store accumulator to absolute,X
	LDA $2878,X		  ; BD 78 28 | Load from absolute,X into accumulator
	LDY $2878			; AC 78 28 | Load from absolute address into Y register
	STA $2878			; 8D 78 28 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_108
; Address: $C69CBA
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_108:
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2878,X		  ; 9D 78 28 | Store accumulator to absolute,X
	LDA $2890,X		  ; BD 90 28 | Load from absolute,X into accumulator
	LDY $2890			; AC 90 28 | Load from absolute address into Y register
	STA $2890			; 8D 90 28 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2890,X		  ; 9D 90 28 | Store accumulator to absolute,X
	LDA $28A8,X		  ; BD A8 28 | Load from absolute,X into accumulator
	LDY $28A8			; AC A8 28 | Load from absolute address into Y register
	STA $28A8			; 8D A8 28 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $28A8,X		  ; 9D A8 28 | Store accumulator to absolute,X
	LDA $28C0,X		  ; BD C0 28 | Load from absolute,X into accumulator
	LDY $28C0			; AC C0 28 | Load from absolute address into Y register
	STA $28C0			; 8D C0 28 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $28C0,X		  ; 9D C0 28 | Store accumulator to absolute,X
	LDA $28D8,X		  ; BD D8 28 | Load from absolute,X into accumulator
	LDY $28D8			; AC D8 28 | Load from absolute address into Y register
	STA $28D8			; 8D D8 28 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $28D8,X		  ; 9D D8 28 | Store accumulator to absolute,X
	LDA $28F0,X		  ; BD F0 28 | Load from absolute,X into accumulator
	LDY $28F0			; AC F0 28 | Load from absolute address into Y register
	STA $28F0			; 8D F0 28 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $28F0,X		  ; 9D F0 28 | Store accumulator to absolute,X
	LDA $2908,X		  ; BD 08 29 | Load from absolute,X into accumulator
	LDY $2908			; AC 08 29 | Load from absolute address into Y register
	STA $2908			; 8D 08 29 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2908,X		  ; 9D 08 29 | Store accumulator to absolute,X
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	LDY $2920			; AC 20 29 | Load from absolute address into Y register
	STA $2920			; 8D 20 29 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2920,X		  ; 9D 20 29 | Store accumulator to absolute,X
	LDA $2950,X		  ; BD 50 29 | Load from absolute,X into accumulator
	LDY $2950			; AC 50 29 | Load from absolute address into Y register
	STA $2950			; 8D 50 29 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2950,X		  ; 9D 50 29 | Store accumulator to absolute,X
	LDA $2968,X		  ; BD 68 29 | Load from absolute,X into accumulator
	LDY $2968			; AC 68 29 | Load from absolute address into Y register
	STA $2968			; 8D 68 29 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2968,X		  ; 9D 68 29 | Store accumulator to absolute,X
	LDA $2980,X		  ; BD 80 29 | Load from absolute,X into accumulator
	LDY $2980			; AC 80 29 | Load from absolute address into Y register
	STA $2980			; 8D 80 29 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_109
; Address: $C69D3C
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_109:
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2980,X		  ; 9D 80 29 | Store accumulator to absolute,X
	LDA $2998,X		  ; BD 98 29 | Load from absolute,X into accumulator
	LDY $2998			; AC 98 29 | Load from absolute address into Y register
	STA $2998			; 8D 98 29 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2998,X		  ; 9D 98 29 | Store accumulator to absolute,X
	LDA $29B0,X		  ; BD B0 29 | Load from absolute,X into accumulator
	LDY $29B0			; AC B0 29 | Load from absolute address into Y register
	STA $29B0			; 8D B0 29 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $29B0,X		  ; 9D B0 29 | Store accumulator to absolute,X
	LDA $29C8,X		  ; BD C8 29 | Load from absolute,X into accumulator
	LDY $29C8			; AC C8 29 | Load from absolute address into Y register
	STA $29C8			; 8D C8 29 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $29C8,X		  ; 9D C8 29 | Store accumulator to absolute,X
	LDA $29E0,X		  ; BD E0 29 | Load from absolute,X into accumulator
	LDY $29E0			; AC E0 29 | Load from absolute address into Y register
	STA $29E0			; 8D E0 29 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $29E0,X		  ; 9D E0 29 | Store accumulator to absolute,X
	LDA $29F8,X		  ; BD F8 29 | Load from absolute,X into accumulator
	LDY $29F8			; AC F8 29 | Load from absolute address into Y register
	STA $29F8			; 8D F8 29 | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $29F8,X		  ; 9D F8 29 | Store accumulator to absolute,X
	LDA $2A10,X		  ; BD 10 2A | Load from absolute,X into accumulator
	LDY $2A10			; AC 10 2A | Load from absolute address into Y register
	STA $2A10			; 8D 10 2A | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2A10,X		  ; 9D 10 2A | Store accumulator to absolute,X
	LDA $2A28,X		  ; BD 28 2A | Load from absolute,X into accumulator
	LDY $2A28			; AC 28 2A | Load from absolute address into Y register
	STA $2A28			; 8D 28 2A | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2A28,X		  ; 9D 28 2A | Store accumulator to absolute,X
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	LDY $2A40			; AC 40 2A | Load from absolute address into Y register
	STA $2A40			; 8D 40 2A | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	STZ $2818			; 9C 18 28 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_10A
; Address: $C69DAC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_10A:
	PHX				  ; DA | Push X register to stack
	LDA $2818,X		  ; BD 18 28 | Load from absolute,X into accumulator
	INC				  ; 1A | Increment accumulator
	STA $33AC			; 8D AC 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_10D
; Address: $C69DBA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_10D:
	BIT $33B6			; 2C B6 33 | Test bits in accumulator (absolute)
	BPL $06			  ; 10 06 | Branch if positive
	BVS $04			  ; 70 04 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_10E
; Address: $C69DC1
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_10E:
	JSL $C1BD38		  ; 22 38 BD C1 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	CMP $33AA			; CD AA 33 | Compare accumulator (absolute)
	BCS $1F			  ; B0 1F | Branch if carry set
	TAX				  ; AA | Transfer accumulator to X register
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BPL $D0			  ; 10 D0 | Branch if positive
	INC $9922			; EE 22 99 | Increment (absolute)
	BIT $C3			  ; 24 C3 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_111
; Address: $C69DE7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_111:
	JSL $C33E8F		  ; 22 8F 3E C3 | Jump to subroutine long
	JMP $1DC9			; 4C C9 1D | Jump to address
	BIT $33B6			; 2C B6 33 | Test bits in accumulator (absolute)
	BPL $06			  ; 10 06 | Branch if positive
	BVC $04			  ; 50 04 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_113
; Address: $C69DFA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_113:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	AND $33B6			; 2D B6 33 | Logical AND with accumulator (absolute)
	BEQ $07			  ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_114
; Address: $C69E0C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_114:
	JSL $C32491		  ; 22 91 24 C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_11B
; Address: $C69E31
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_11B:
	BIT $2AA8			; 2C A8 2A | Test bits in accumulator (absolute)
	BMI $1E			  ; 30 1E | Branch if negative
	BVC $15			  ; 50 15 | Branch if overflow clear
	LDY $7F64			; AC 64 7F | Load from absolute address into Y register
	LDX $32FC,Y		  ; BE FC 32 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_11D
; Address: $C69E42
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_11D:
	JSL $C32AF9		  ; 22 F9 2A C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_11F
; Address: $C69E4D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_11F:
	JSL $C02D00		  ; 22 00 2D C0 | Jump to subroutine long
	JMP $1E31			; 4C 31 1E | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_121
; Address: $C69E56
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_121:
	JSR $1E8D			; 20 8D 1E | Jump to subroutine
	BCC $2D			  ; 90 2D | Branch if carry clear
	LDY $2818,X		  ; BC 18 28 | Load from absolute,X into Y register
	STY $2A58			; 8C 58 2A | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_123
; Address: $C69E67
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_123:
	JSR $1EAC			; 20 AC 1E | Jump to subroutine
	BCS $1C			  ; B0 1C | Branch if carry set
	LDA $2A58			; AD 58 2A | Load from absolute address into accumulator
	STA $2818,X		  ; 9D 18 28 | Store accumulator to absolute,X
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $2A40,X		  ; 3D 40 2A | Logical AND with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	STZ $28F0,X		  ; 9E F0 28 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_124
; Address: $C69E81
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_124:
	JSR $1EC0			; 20 C0 1E | Jump to subroutine
	BCS $02			  ; B0 02 | Branch if carry set
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_125
; Address: $C69E88
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_125:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_126
; Address: $C69E8D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_126:
	PHA				  ; 48 | Push accumulator to stack
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $16			  ; F0 16 | Branch if equal
	CMP #$4E			 ; C9 4E | Compare accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	CMP #$4F			 ; C9 4F | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_128
; Address: $C69EA4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_128:
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BRA $D0			  ; 80 D0 | Branch always
	PEA #$1868		   ; F4 68 18 | Push effective address to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_129
; Address: $C69EAC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_129:
	LDX $33AA			; AE AA 33 | Load from absolute address into X register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BCS $0B			  ; B0 0B | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_12A
; Address: $C69EB4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_12A:
	JSL $C31753		  ; 22 53 17 C3 | Jump to subroutine long
	INC $33AA			; EE AA 33 | Increment (absolute)
	INC $33AA			; EE AA 33 | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_12C
; Address: $C69EC4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_12C:
	JSL $C02D16		  ; 22 16 2D C0 | Jump to subroutine long
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_12D
; Address: $C69ECD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_12D:
	JSL $C31AA2		  ; 22 A2 1A C3 | Jump to subroutine long
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	STA $32FC,Y		  ; 99 FC 32 | Store accumulator to absolute,Y
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA $32F2,Y		  ; 99 F2 32 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_12E
; Address: $C69EDB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_12E:
	JSL $C02C2D		  ; 22 2D 2C C0 | Jump to subroutine long
	AND ($1E),Y		  ; 31 1E | Logical AND with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_12F
; Address: $C69EE4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_12F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	LDA $33AA			; AD AA 33 | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_131
; Address: $C69EFF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_131:
	JSL $C32587		  ; 22 87 25 C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $07			  ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_132
; Address: $C69F06
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_132:
	JSL $C32483		  ; 22 83 24 C3 | Jump to subroutine long
	JMP $1F0D			; 4C 0D 1F | Jump to address
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_133
; Address: $C69F13
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_133:
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_134
; Address: $C69F16
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_134:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_135
; Address: $C69F29
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_135:
	JSL $C31AFC		  ; 22 FC 1A C3 | Jump to subroutine long
	BCC $25			  ; 90 25 | Branch if carry clear
	LDA $2848,X		  ; BD 48 28 | Load from absolute,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $B493			; 8D 93 B4 | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	ADC $2890,X		  ; 7D 90 28 | Add with carry (absolute,X)
	STA $B495			; 8D 95 B4 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_13A
; Address: $C69F50
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_13A:
	JSL $C32491		  ; 22 91 24 C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_13B
; Address: $C69F5D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_13B:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	STZ $B493			; 9C 93 B4 | Store zero to absolute
	DEC $B493			; CE 93 B4 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_13C
; Address: $C69F76
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_13C:
	STZ $B495			; 9C 95 B4 | Store zero to absolute
	STZ $3392			; 9C 92 33 | Store zero to absolute
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_13F
; Address: $C69F86
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_13F:
	JSL $C31B8D		  ; 22 8D 1B C3 | Jump to subroutine long
	INC $3392			; EE 92 33 | Increment (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_142
; Address: $C69F97
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_142:
	JSL $C31B8D		  ; 22 8D 1B C3 | Jump to subroutine long
	INC $3392			; EE 92 33 | Increment (absolute)
	LDA $3392			; AD 92 33 | Load from absolute address into accumulator
	BEQ $0C			  ; F0 0C | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_145
; Address: $C69FAB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_145:
	JSL $C32491		  ; 22 91 24 C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_146
; Address: $C69FB8
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_146:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	STZ $B493			; 9C 93 B4 | Store zero to absolute
	DEC $B493			; CE 93 B4 | Decrement (absolute)
	STZ $B495			; 9C 95 B4 | Store zero to absolute
	STZ $3392			; 9C 92 33 | Store zero to absolute
	PHY				  ; 5A | Push Y register to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_149
; Address: $C69FE2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_149:
	JSL $C31B8D		  ; 22 8D 1B C3 | Jump to subroutine long
	INC $3392			; EE 92 33 | Increment (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_14C
; Address: $C69FF3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_14C:
	JSL $C31B8D		  ; 22 8D 1B C3 | Jump to subroutine long
	INC $3392			; EE 92 33 | Increment (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_14F
; Address: $C6A004
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_14F:
	JSL $C31B8D		  ; 22 8D 1B C3 | Jump to subroutine long
	INC $3392			; EE 92 33 | Increment (absolute)
	LDA $3392			; AD 92 33 | Load from absolute address into accumulator
	BEQ $0C			  ; F0 0C | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_152
; Address: $C6A018
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_152:
	JSL $C32491		  ; 22 91 24 C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_153
; Address: $C6A025
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_153:
	PHX				  ; DA | Push X register to stack
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $B493			; 8D 93 B4 | Store accumulator to absolute address
	STZ $B495			; 9C 95 B4 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_154
; Address: $C6A02F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_154:
	JSR $203B			; 20 3B 20 | Jump to subroutine
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $33AA			; EC AA 33 | Compare X register (absolute)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_156
; Address: $C6A040
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_156:
	JSL $C32459		  ; 22 59 24 C3 | Jump to subroutine long
	LDA $2848,X		  ; BD 48 28 | Load from absolute,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP $B493			; CD 93 B4 | Compare accumulator (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	STA $B493			; 8D 93 B4 | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	ADC $2890,X		  ; 7D 90 28 | Add with carry (absolute,X)
	CMP $B495			; CD 95 B4 | Compare accumulator (absolute)
	BCC $03			  ; 90 03 | Branch if carry clear
	STA $B495			; 8D 95 B4 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_158
; Address: $C6A061
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_158:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_15A
; Address: $C6A077
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_15A:
	JSL $C32587		  ; 22 87 25 C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_15B
; Address: $C6A084
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_15B:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_15F
; Address: $C6A0A5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_15F:
	JSL $C31DBA		  ; 22 BA 1D C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_160
; Address: $C6A0B2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_160:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_161
; Address: $C6A0B9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_161:
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	STZ $3392			; 9C 92 33 | Store zero to absolute
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_163
; Address: $C6A0CF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_163:
	JSL $C31B8D		  ; 22 8D 1B C3 | Jump to subroutine long
	INC $3392			; EE 92 33 | Increment (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_165
; Address: $C6A0DD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_165:
	JSL $C31B8D		  ; 22 8D 1B C3 | Jump to subroutine long
	INC $3392			; EE 92 33 | Increment (absolute)
	LDA $3392			; AD 92 33 | Load from absolute address into accumulator
	BEQ $08			  ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_167
; Address: $C6A0ED
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_167:
	JSL $C31DBA		  ; 22 BA 1D C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_168
; Address: $C6A0FA
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_168:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	STZ $3392			; 9C 92 33 | Store zero to absolute
	PHY				  ; 5A | Push Y register to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_16A
; Address: $C6A118
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_16A:
	JSL $C31B8D		  ; 22 8D 1B C3 | Jump to subroutine long
	INC $3392			; EE 92 33 | Increment (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_16C
; Address: $C6A126
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_16C:
	JSL $C31B8D		  ; 22 8D 1B C3 | Jump to subroutine long
	INC $3392			; EE 92 33 | Increment (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_16E
; Address: $C6A134
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_16E:
	JSL $C31B8D		  ; 22 8D 1B C3 | Jump to subroutine long
	INC $3392			; EE 92 33 | Increment (absolute)
	LDA $3392			; AD 92 33 | Load from absolute address into accumulator
	BEQ $08			  ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_170
; Address: $C6A144
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_170:
	JSL $C31DBA		  ; 22 BA 1D C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_171
; Address: $C6A151
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_171:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_178
; Address: $C6A180
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_178:
	JSL $C32491		  ; 22 91 24 C3 | Jump to subroutine long
	LDA $2800			; AD 00 28 | Load from absolute address into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	JMP $1672			; 4C 72 16 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_179
; Address: $C6A199
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_179:
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_17C
; Address: $C6A1AE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_17C:
	JSL $C31B14		  ; 22 14 1B C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_17D
; Address: $C6A1BB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_17D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_17F
; Address: $C6A1D5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_17F:
	JSL $C31C70		  ; 22 70 1C C3 | Jump to subroutine long
	LDX #$02			 ; A2 02 | Load immediate value into X register
	LDA $2800,X		  ; BD 00 28 | Load from absolute,X into accumulator
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_187
; Address: $C6A202
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_187:
	JSL $C32491		  ; 22 91 24 C3 | Jump to subroutine long
	JMP $21B2			; 4C B2 21 | PPU graphics register access
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_188
; Address: $C6A20D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_188:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_18B
; Address: $C6A222
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_18B:
	JSL $C08B6B		  ; 22 6B 8B C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_18C
; Address: $C6A22F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_18C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_18E
; Address: $C6A244
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_18E:
	JSL $C31DBA		  ; 22 BA 1D C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_18F
; Address: $C6A251
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_18F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_190
; Address: $C6A269
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_190:
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $1662			; 4C 62 16 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0002,X		  ; BD 02 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	JMP $16EC			; 4C EC 16 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0002,X		  ; BD 02 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0003,X		  ; BD 03 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	JMP $1705			; 4C 05 17 | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_191
; Address: $C6A2C7
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_191:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $1F1D			; 4C 1D 1F | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0002,X		  ; BD 02 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	JMP $1F64			; 4C 64 1F | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_192
; Address: $C6A321
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_192:
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0002,X		  ; BD 02 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0003,X		  ; BD 03 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	JMP $1FBF			; 4C BF 1F | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $208B			; 4C 8B 20 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0002,X		  ; BD 02 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	JMP $20B9			; 4C B9 20 | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_193
; Address: $C6A381
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_193:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0002,X		  ; BD 02 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0003,X		  ; BD 03 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	JMP $2101			; 4C 01 21 | PPU graphics register access
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $2158			; 4C 58 21 | PPU graphics register access
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_194
; Address: $C6A3DB
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_194:
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $0002,X		  ; BD 02 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	JMP $21C2			; 4C C2 21 | PPU graphics register access
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $2195			; 4C 95 21 | PPU graphics register access
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $33B6			; AD B6 33 | Load from absolute address into accumulator
	BPL $0A			  ; 10 0A | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $33B6			; 8D B6 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_195
; Address: $C6A42A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_195:
	JSL $C32209		  ; 22 09 22 C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_196
; Address: $C6A436
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_196:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $33B6			; AD B6 33 | Load from absolute address into accumulator
	BPL $0A			  ; 10 0A | Branch if positive
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	LDA				  ; BF 8D B6 33 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_197
; Address: $C6A44D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_197:
	JSL $C32209		  ; 22 09 22 C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_198
; Address: $C6A459
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_198:
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BPL $F0			  ; 10 F0 | Branch if positive
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $B49D			; 8D 9D B4 | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $09			  ; 80 09 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_199
; Address: $C6A471
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_199:
	LDA $2800,X		  ; BD 00 28 | Load from absolute,X into accumulator
	CMP #$24			 ; C9 24 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	CMP #$51			 ; C9 51 | Compare accumulator (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_19C
; Address: $C6A489
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_19C:
	JSL $C08BDA		  ; 22 DA 8B C0 | Jump to subroutine long
	STZ $B49D			; 9C 9D B4 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_19D
; Address: $C6A491
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_19D:
	JSL $C08BEA		  ; 22 EA 8B C0 | Jump to subroutine long
	STZ $B49D			; 9C 9D B4 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_19E
; Address: $C6A499
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_19E:
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $30			  ; F0 30 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_19F
; Address: $C6A4A2
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_19F:
	TYA				  ; 98 | Transfer Y register to accumulator
	PHA				  ; 48 | Push accumulator to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $2A40,X		  ; 3D 40 2A | Logical AND with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $2980,X		  ; BD 80 29 | Load from absolute,X into accumulator
	STA $2920,X		  ; 9D 20 29 | Store accumulator to absolute,X
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1A1
; Address: $C6A4C5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1A1:
	JSL $C32ACE		  ; 22 CE 2A C3 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	STA $2920,X		  ; 9D 20 29 | Store accumulator to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1A2
; Address: $C6A4D3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1A2:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1A3
; Address: $C6A4E6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1A3:
	JSL $C31AFC		  ; 22 FC 1A C3 | Jump to subroutine long
	BCC $1C			  ; 90 1C | Branch if carry clear
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BPL $D0			  ; 10 D0 | Branch if positive

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1A8
; Address: $C6A504
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1A8:
	JSL $C08B6B		  ; 22 6B 8B C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1AA
; Address: $C6A511
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1AA:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $24DA			; 4C DA 24 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDA #$DA			 ; A9 DA | Load immediate value into accumulator
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1AB
; Address: $C6A542
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1AB:
	JSL $C31AFC		  ; 22 FC 1A C3 | Jump to subroutine long
	BCC $18			  ; 90 18 | Branch if carry clear
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BPL $D0			  ; 10 D0 | Branch if positive
	BPL $22			  ; 10 22 | Branch if positive
	STA $C324,Y		  ; 99 24 C3 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1AE
; Address: $C6A55C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1AE:
	JSL $C33E8F		  ; 22 8F 3E C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1AF
; Address: $C6A569
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1AF:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1B0
; Address: $C6A56E
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1B0:
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $2536			; 4C 36 25 | Jump to address
	STZ $B49D			; 9C 9D B4 | Store zero to absolute
	STZ $33AA			; 9C AA 33 | Store zero to absolute
	STZ $33AC			; 9C AC 33 | Store zero to absolute
	STZ $33B6			; 9C B6 33 | Store zero to absolute
	STZ $33B8			; 9C B8 33 | Store zero to absolute
	STZ $33BA			; 9C BA 33 | Store zero to absolute
	STZ $33BC			; 9C BC 33 | Store zero to absolute
	STZ $33BE			; 9C BE 33 | Store zero to absolute
	STZ $BE43			; 9C 43 BE | Store zero to absolute
	STZ $33A8			; 9C A8 33 | Store zero to absolute
	STZ $2A60			; 9C 60 2A | Store zero to absolute
	LDA #$BB			 ; A9 BB | Load immediate value into accumulator
	LDX #$C3			 ; A2 C3 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1B1
; Address: $C6A5AE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1B1:
	JSL $C316DE		  ; 22 DE 16 C3 | Jump to subroutine long
	LDX #$18			 ; A2 18 | Load immediate value into X register
	STZ $27FE,X		  ; 9E FE 27 | Store zero to absolute,X
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F9			  ; 10 F9 | Branch if positive
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1B2
; Address: $C6A5BD
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1B2:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	STZ $2BF2			; 9C F2 2B | Store zero to absolute
	LDX #$F2			 ; A2 F2 | Load immediate value into X register
	LDY #$F4			 ; A0 F4 | Load immediate value into Y register
	LDA #$FE			 ; A9 FE | Load immediate value into accumulator
	ASL $54			  ; 06 54 | Arithmetic shift left (zero page)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1B4
; Address: $C6A5E0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1B4:
	JSR $F30D			; 20 0D F3 | Jump to subroutine
	STA $0C85,Y		  ; 99 85 0C | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1B6
; Address: $C6A5EC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1B6:
	JSR $F30D			; 20 0D F3 | Jump to subroutine
	STA $0C85,Y		  ; 99 85 0C | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1B7
; Address: $C6A5F3
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1B7:
	LDA #$AB			 ; A9 AB | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	LDA #$AD			 ; A9 AD | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	LDX $22			  ; A6 22 | Load from zero page into X register
	LDY $24			  ; A4 24 | Load from zero page into Y register
	ROL $A9			  ; 26 A9 | Rotate left (zero page)
	PLB				  ; AB | Pull data bank register from stack
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY $1A			  ; A4 1A | Load from zero page into Y register
	STA $2BF0,Y		  ; 99 F0 2B | Store accumulator to absolute,Y
	LDA #$B2			 ; A9 B2 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA #$B3			 ; A9 B3 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $10			  ; 85 10 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1B8
; Address: $C6A627
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1B8:
	JSL $C35481		  ; 22 81 54 C3 | Jump to subroutine long
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1B9
; Address: $C6A637
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1B9:
	ADC $7C26,Y		  ; 79 26 7C | Add with carry (absolute,Y)
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	ROL $82			  ; 26 82 | Rotate left (zero page)
	ROL $85			  ; 26 85 | Rotate left (zero page)
	ROL $88			  ; 26 88 | Rotate left (zero page)
	ROL $8B			  ; 26 8B | Rotate left (zero page)
	ROL $8E			  ; 26 8E | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1BA
; Address: $C6A646
; Size: 124 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1BA:
	ROL $91			  ; 26 91 | Rotate left (zero page)
	ROL $94			  ; 26 94 | Rotate left (zero page)
	ROL $97			  ; 26 97 | Rotate left (zero page)
	ROL $9A			  ; 26 9A | Rotate left (zero page)
	ROL $9D			  ; 26 9D | Rotate left (zero page)
	ROL $A0			  ; 26 A0 | Rotate left (zero page)
	ROL $A3			  ; 26 A3 | Rotate left (zero page)
	ROL $A6			  ; 26 A6 | Rotate left (zero page)
	ROL $A9			  ; 26 A9 | Rotate left (zero page)
	ROL $AC			  ; 26 AC | Rotate left (zero page)
	ROL $AF			  ; 26 AF | Rotate left (zero page)
	ROL $B2			  ; 26 B2 | Rotate left (zero page)
	ROL $B5			  ; 26 B5 | Rotate left (zero page)
	ROL $B8			  ; 26 B8 | Rotate left (zero page)
	ROL $BB			  ; 26 BB | Rotate left (zero page)
	ROL $BE			  ; 26 BE | Rotate left (zero page)
	ROL $C1			  ; 26 C1 | Rotate left (zero page)
	ROL $C4			  ; 26 C4 | Rotate left (zero page)
	ROL $C7			  ; 26 C7 | Rotate left (zero page)
	ROL $CA			  ; 26 CA | Rotate left (zero page)
	ROL $CD			  ; 26 CD | Rotate left (zero page)
	ROL $D0			  ; 26 D0 | Rotate left (zero page)
	ROL $D3			  ; 26 D3 | Rotate left (zero page)
	ROL $D6			  ; 26 D6 | Rotate left (zero page)
	ROL $D9			  ; 26 D9 | Rotate left (zero page)
	ROL $99			  ; 26 99 | Rotate left (zero page)
	PEA #$992B		   ; F4 2B 99 | Push effective address to stack
	STA $2BF8,Y		  ; 99 F8 2B | Store accumulator to absolute,Y
	STA $2BFA,Y		  ; 99 FA 2B | Store accumulator to absolute,Y
	STA $2BFC,Y		  ; 99 FC 2B | Store accumulator to absolute,Y
	STA $2BFE,Y		  ; 99 FE 2B | Store accumulator to absolute,Y
	STA $2C00,Y		  ; 99 00 2C | Store accumulator to absolute,Y
	STA $2C02,Y		  ; 99 02 2C | Store accumulator to absolute,Y
	STA $2C04,Y		  ; 99 04 2C | Store accumulator to absolute,Y
	STA $2C06,Y		  ; 99 06 2C | Store accumulator to absolute,Y
	STA $2C08,Y		  ; 99 08 2C | Store accumulator to absolute,Y
	STA $2C0A,Y		  ; 99 0A 2C | Store accumulator to absolute,Y
	STA $2C0C,Y		  ; 99 0C 2C | Store accumulator to absolute,Y
	STA $2C0E,Y		  ; 99 0E 2C | Store accumulator to absolute,Y
	STA $2C10,Y		  ; 99 10 2C | Store accumulator to absolute,Y
	STA $2C12,Y		  ; 99 12 2C | Store accumulator to absolute,Y
	STA $2C14,Y		  ; 99 14 2C | Store accumulator to absolute,Y
	STA $2C16,Y		  ; 99 16 2C | Store accumulator to absolute,Y
	STA $2C18,Y		  ; 99 18 2C | Store accumulator to absolute,Y
	STA $2C1A,Y		  ; 99 1A 2C | Store accumulator to absolute,Y
	STA $2C1C,Y		  ; 99 1C 2C | Store accumulator to absolute,Y
	STA $2C1E,Y		  ; 99 1E 2C | Store accumulator to absolute,Y
	STA $2C20,Y		  ; 99 20 2C | Store accumulator to absolute,Y
	STA $2C22,Y		  ; 99 22 2C | Store accumulator to absolute,Y
	STA $2C24,Y		  ; 99 24 2C | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1BB
; Address: $C6A6C4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1BB:
	STA $2C26,Y		  ; 99 26 2C | Store accumulator to absolute,Y
	STA $2C28,Y		  ; 99 28 2C | Store accumulator to absolute,Y
	STA $2C2A,Y		  ; 99 2A 2C | Store accumulator to absolute,Y
	STA $2C2C,Y		  ; 99 2C 2C | Store accumulator to absolute,Y
	STA $2C2E,Y		  ; 99 2E 2C | Store accumulator to absolute,Y
	STA $2C30,Y		  ; 99 30 2C | Store accumulator to absolute,Y
	STA $2C32,Y		  ; 99 32 2C | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1BC
; Address: $C6A6DA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1BC:
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	LDA #$B9			 ; A9 B9 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	LDX $22			  ; A6 22 | Load from zero page into X register
	LDY $24			  ; A4 24 | Load from zero page into Y register
	ROL $A9			  ; 26 A9 | Rotate left (zero page)
	LDY $1800			; AC 00 18 | Load from absolute address into Y register
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY $1A			  ; A4 1A | Load from zero page into Y register
	STA $2BF0,Y		  ; 99 F0 2B | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1BD
; Address: $C6A6FF
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1BD:
	LDA #$AB			 ; A9 AB | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2C32,Y		  ; 99 32 2C | Store accumulator to absolute,Y
	PHA				  ; 48 | Push accumulator to stack
	LDA #$AF			 ; A9 AF | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2C72,Y		  ; 99 72 2C | Store accumulator to absolute,Y
	PLA				  ; 68 | Pull accumulator from stack
	LDX $28			  ; A6 28 | Load from zero page into X register
	LDY $2A			  ; A4 2A | Load from zero page into Y register
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	LDY $1C			  ; A4 1C | Load from zero page into Y register
	STA $2BB2,Y		  ; 99 B2 2B | Store accumulator to absolute,Y
	INC $1E			  ; E6 1E | Increment (zero page)
	INC $1E			  ; E6 1E | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1BF
; Address: $C6A739
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1BF:
	ROR $8127,X		  ; 7E 27 81 | Rotate right (absolute,X)
	STY $27			  ; 84 27 | Store Y register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	STA $9027			; 8D 27 90 | Store accumulator to absolute address
	STA $9C27,Y		  ; 99 27 9C | Store accumulator to absolute,Y
	STA				  ; 9F 27 A2 27 | Store accumulator to absolute long,X
	LDA $27			  ; A5 27 | Load from zero page into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	PLB				  ; AB | Pull data bank register from stack
	LDX $B127			; AE 27 B1 | Load from absolute address into X register
	TSX				  ; BA | Transfer stack pointer to X register
	LDA $BD27,X		  ; BD 27 BD | Load from absolute,X into accumulator
	LDA $BD27,X		  ; BD 27 BD | Load from absolute,X into accumulator
	LDA $BD27,X		  ; BD 27 BD | Load from absolute,X into accumulator
	LDA $BD27,X		  ; BD 27 BD | Load from absolute,X into accumulator
	LDA $9927,X		  ; BD 27 99 | Load from absolute,X into accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA $0100,Y		  ; 99 00 01 | Store accumulator to absolute,Y
	STA $0140,Y		  ; 99 40 01 | Store accumulator to absolute,Y
	STA $0180,Y		  ; 99 80 01 | Store accumulator to absolute,Y
	STA $01C0,Y		  ; 99 C0 01 | Store accumulator to absolute,Y
	STA $0200,Y		  ; 99 00 02 | Store accumulator to absolute,Y
	STA $0240,Y		  ; 99 40 02 | Store accumulator to absolute,Y
	STA $0280,Y		  ; 99 80 02 | Store accumulator to absolute,Y
	STA $02C0,Y		  ; 99 C0 02 | Store accumulator to absolute,Y
	STA $0300,Y		  ; 99 00 03 | Store accumulator to absolute,Y
	STA $0340,Y		  ; 99 40 03 | Store accumulator to absolute,Y
	STA $0380,Y		  ; 99 80 03 | Store accumulator to absolute,Y
	STA $03C0,Y		  ; 99 C0 03 | Store accumulator to absolute,Y
	STA $0400,Y		  ; 99 00 04 | Store accumulator to absolute,Y
	STA $0440,Y		  ; 99 40 04 | Store accumulator to absolute,Y
	STA $0480,Y		  ; 99 80 04 | Store accumulator to absolute,Y
	STA $04C0,Y		  ; 99 C0 04 | Store accumulator to absolute,Y
	STA $0500,Y		  ; 99 00 05 | Store accumulator to absolute,Y
	STA $0540,Y		  ; 99 40 05 | Store accumulator to absolute,Y
	STA $0580,Y		  ; 99 80 05 | Store accumulator to absolute,Y
	STA $05C0,Y		  ; 99 C0 05 | Store accumulator to absolute,Y
	STA $0600,Y		  ; 99 00 06 | Store accumulator to absolute,Y
	STA $0640,Y		  ; 99 40 06 | Store accumulator to absolute,Y
	STA $0680,Y		  ; 99 80 06 | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1C0
; Address: $C6A7BE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1C0:
	LDA #$AB			 ; A9 AB | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1C1
; Address: $C6A7D0
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1C1:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $2C32,Y		  ; 99 32 2C | Store accumulator to absolute,Y
	PHA				  ; 48 | Push accumulator to stack
	LDA #$AF			 ; A9 AF | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $2C72,Y		  ; 99 72 2C | Store accumulator to absolute,Y
	PLA				  ; 68 | Pull accumulator from stack
	LDX $28			  ; A6 28 | Load from zero page into X register
	LDY $2A			  ; A4 2A | Load from zero page into Y register
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY $1C			  ; A4 1C | Load from zero page into Y register
	STA $2BB2,Y		  ; 99 B2 2B | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1C2
; Address: $C6A7FA
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1C2:
	LDA #$AF			 ; A9 AF | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	LDA #$B0			 ; A9 B0 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	LDX $22			  ; A6 22 | Load from zero page into X register
	LDY $24			  ; A4 24 | Load from zero page into Y register
	ROL $A9			  ; 26 A9 | Rotate left (zero page)
	LDA $651800		  ; AF 00 18 65 | Load from absolute long address into accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY $1A			  ; A4 1A | Load from zero page into Y register
	STA $2BF0,Y		  ; 99 F0 2B | Store accumulator to absolute,Y
	LDA #$B4			 ; A9 B4 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA #$B5			 ; A9 B5 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $10			  ; 85 10 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1C3
; Address: $C6A82E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1C3:
	JSL $C35481		  ; 22 81 54 C3 | Jump to subroutine long
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1C5
; Address: $C6A83E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1C5:
	LDA $1C			  ; A5 1C | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $1E			  ; E5 1E | Subtract with carry (zero page)
	BMI $1D			  ; 30 1D | Branch if negative
	CMP #$41			 ; C9 41 | Compare accumulator (immediate)
	BCC $18			  ; 90 18 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1C6
; Address: $C6A84A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1C6:
	JSL $C32863		  ; 22 63 28 C3 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	CMP $1C			  ; C5 1C | Compare accumulator (zero page)
	BCS $0B			  ; B0 0B | Branch if carry set
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1C7
; Address: $C6A863
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1C7:
	PHX				  ; DA | Push X register to stack
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	LDX $22			  ; A6 22 | Load from zero page into X register
	LDY $24			  ; A4 24 | Load from zero page into Y register
	ROL $22			  ; 26 22 | Rotate left (zero page)
	BPL $FF			  ; 10 FF | Branch if positive
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY $1A			  ; A4 1A | Load from zero page into Y register
	STA $2BF0,Y		  ; 99 F0 2B | Store accumulator to absolute,Y
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $10			  ; 85 10 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1C8
; Address: $C6A898
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1C8:
	JSL $C35481		  ; 22 81 54 C3 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1CA
; Address: $C6A8A1
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1CA:
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2C32,Y		  ; 99 32 2C | Store accumulator to absolute,Y
	PHA				  ; 48 | Push accumulator to stack
	LDA #$B0			 ; A9 B0 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $2C72,Y		  ; 99 72 2C | Store accumulator to absolute,Y
	PLA				  ; 68 | Pull accumulator from stack
	LDX $28			  ; A6 28 | Load from zero page into X register
	LDY $2A			  ; A4 2A | Load from zero page into Y register
	LDA #$B9			 ; A9 B9 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	LDY $1C			  ; A4 1C | Load from zero page into Y register
	STA $2BB2,Y		  ; 99 B2 2B | Store accumulator to absolute,Y
	INC $1E			  ; E6 1E | Increment (zero page)
	INC $1E			  ; E6 1E | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1CB
; Address: $C6A8D5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1CB:
	LDA #$B0			 ; A9 B0 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	LDX $22			  ; A6 22 | Load from zero page into X register
	LDY $24			  ; A4 24 | Load from zero page into Y register
	ROL $A9			  ; 26 A9 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA #$B5			 ; A9 B5 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $10			  ; 85 10 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1CD
; Address: $C6A8F7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1CD:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	LDX $22			  ; A6 22 | Load from zero page into X register
	LDY $24			  ; A4 24 | Load from zero page into Y register
	ROL $A9			  ; 26 A9 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1CE
; Address: $C6A90F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1CE:
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $10			  ; 85 10 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1D0
; Address: $C6A919
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1D0:
	LDA #$AD			 ; A9 AD | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	LDX $22			  ; A6 22 | Load from zero page into X register
	LDY $24			  ; A4 24 | Load from zero page into Y register
	ROL $A9			  ; 26 A9 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA #$B3			 ; A9 B3 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $10			  ; 85 10 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1D2
; Address: $C6A93B
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1D2:
	LDA #$B9			 ; A9 B9 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	LDX $22			  ; A6 22 | Load from zero page into X register
	LDY $24			  ; A4 24 | Load from zero page into Y register
	ROL $6B			  ; 26 6B | Rotate left (zero page)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND $33B6			; 2D B6 33 | Logical AND with accumulator (absolute)
	BEQ $28			  ; F0 28 | Branch if equal
	LDA $33AC			; AD AC 33 | Load from absolute address into accumulator
	BEQ $15			  ; F0 15 | Branch if equal
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CPX $33AE			; EC AE 33 | Compare X register (absolute)
	BCS $0D			  ; B0 0D | Branch if carry set
	LDY $2800,X		  ; BC 00 28 | Load from absolute,X into Y register
	BEQ $08			  ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1D3
; Address: $C6A966
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1D3:
	JSR $297A			; 20 7A 29 | Jump to subroutine
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	JMP $295C			; 4C 5C 29 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $33B6			; 2D B6 33 | Logical AND with accumulator (absolute)
	BEQ $03			  ; F0 03 | Branch if equal
	INC $33AC			; EE AC 33 | Increment (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1D4
; Address: $C6A97A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1D4:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1D5
; Address: $C6A981
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1D5:
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	BPL $98			  ; 10 98 | Branch if positive
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $0A			  ; D0 0A | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1D6
; Address: $C6A993
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1D6:
	JSR $299A			; 20 9A 29 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1D7
; Address: $C6A99A
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1D7:
	JSL $C329CF		  ; 22 CF 29 C3 | Jump to subroutine long
	LDA $2BF2,Y		  ; B9 F2 2B | Load from absolute,Y into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $B48B			; 0D 8B B4 | Logical OR with accumulator (absolute)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $338E			; CC 8E 33 | Compare Y register (absolute)
	BCC $ED			  ; 90 ED | Branch if carry clear
	LDA $338C			; AD 8C 33 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	CMP $3390			; CD 90 33 | Compare accumulator (absolute)
	BCS $11			  ; B0 11 | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $338C			; 8D 8C 33 | Store accumulator to absolute address
	LDA $338E			; AD 8E 33 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $338E			; 8D 8E 33 | Store accumulator to absolute address
	JMP $299E			; 4C 9E 29 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1D8
; Address: $C6A9CF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1D8:
	LDA $2848,X		  ; BD 48 28 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $2848,X		  ; BD 48 28 | Load from absolute,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	ORA ($63,X)		  ; 01 63 | Logical OR with accumulator ((zero page,X))
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	STY $7A33			; 8C 33 7A | Store Y register to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $2878,X		  ; BD 78 28 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1D9
; Address: $C6A9EB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1D9:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $338C			; 6D 8C 33 | Add with carry (absolute)
	STA $338E			; 8D 8E 33 | Store accumulator to absolute address
	LDA $2890,X		  ; BD 90 28 | Load from absolute,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $338C			; 6D 8C 33 | Add with carry (absolute)
	STA $3390			; 8D 90 33 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1DA
; Address: $C6AA01
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1DA:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1DB
; Address: $C6AA04
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1DB:
	JSR $299A			; 20 9A 29 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1DC
; Address: $C6AA0B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1DC:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1DD
; Address: $C6AA17
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1DD:
	JSL $C31AFC		  ; 22 FC 1A C3 | Jump to subroutine long
	BCC $0C			  ; 90 0C | Branch if carry clear
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	ORA ($49,X)		  ; 01 49 | Logical OR with accumulator ((zero page,X))
	AND $2A40,X		  ; 3D 40 2A | Logical AND with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1DE
; Address: $C6AA31
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1DE:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1DF
; Address: $C6AA3D
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1DF:
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $2A12			; 4C 12 2A | Jump to address
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $1A			  ; F0 1A | Branch if equal
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $0C			  ; A5 0C | Load from zero page into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $B485			; 0D 85 B4 | Logical OR with accumulator (absolute)
	STA $0C			  ; 85 0C | Store accumulator to zero page
	LDA #$82			 ; A9 82 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF0,Y		  ; 99 F0 2B | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1E0
; Address: $C6AA71
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1E0:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1E1
; Address: $C6AA7D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1E1:
	JSL $C31AFC		  ; 22 FC 1A C3 | Jump to subroutine long
	BCC $25			  ; 90 25 | Branch if carry clear
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROL				  ; 2A | Rotate left (accumulator)
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $2A40,X		  ; 3D 40 2A | Logical AND with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1E6
; Address: $C6AAA9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1E6:
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1E7
; Address: $C6AAB0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1E7:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA #$BD			 ; 09 BD | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $2A78			; 4C 78 2A | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $0F			  ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1F1
; Address: $C6AAFB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1F1:
	JSR $A82D			; 20 2D A8 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	BNE $04			  ; D0 04 | Branch if not equal
	JMP $C32ACE		  ; 5C CE 2A C3 | Jump to address long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1F5
; Address: $C6AB12
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1F5:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$C3			 ; A9 C3 | Load immediate value into accumulator
	PHA				  ; 48 | Push accumulator to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2830,X		  ; BD 30 28 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1F6
; Address: $C6AB1E
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1F6:
	DEC				  ; 3A | Decrement accumulator
	PHA				  ; 48 | Push accumulator to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1F7
; Address: $C6AB21
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1F7:
	SEC				  ; 38 | Set carry flag
	SBC #$49			 ; E9 49 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 00 00 43 | Load from absolute long,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1F8
; Address: $C6AB2D
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1F8:
	JSL $C33D96		  ; 22 96 3D C3 | Jump to subroutine long
	LDA				  ; BF 01 00 43 | Load from absolute long,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BEQ $16			  ; F0 16 | Branch if equal
	INX				  ; E8 | Increment X register
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $14			  ; F0 14 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	JMP $2B31			; 4C 31 2B | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1F9
; Address: $C6AB51
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1F9:
	LDA $0E			  ; A5 0E | Load from zero page into accumulator
	STA $2BB2,Y		  ; 99 B2 2B | Store accumulator to absolute,Y
	JMP $2B31			; 4C 31 2B | Jump to address
	LDA $10			  ; A5 10 | Load from zero page into accumulator
	STA $2BB2,Y		  ; 99 B2 2B | Store accumulator to absolute,Y
	JMP $2B31			; 4C 31 2B | Jump to address
	SEC				  ; 38 | Set carry flag
	SBC #$49			 ; E9 49 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 00 00 43 | Load from absolute long,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $2B31			; 4C 31 2B | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	BNE $F8			  ; D0 F8 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1FA
; Address: $C6AB7F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1FA:
	PHA				  ; 48 | Push accumulator to stack
	LDY $1E			  ; A4 1E | Load from zero page into Y register
	LDA #$B1			 ; A9 B1 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1FB
; Address: $C6AB88
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1FB:
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1FC
; Address: $C6AB8D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1FC:
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1FD
; Address: $C6AB96
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1FD:
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INC				  ; 1A | Increment accumulator
	STA $2C32,Y		  ; 99 32 2C | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1FE
; Address: $C6ABA3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1FE:
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	STA $2C32,Y		  ; 99 32 2C | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_1FF
; Address: $C6ABAF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_1FF:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	AND $29C3,X		  ; 3D C3 29 | Logical AND with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_200
; Address: $C6ABC2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_200:
	STA $00			  ; 85 00 | Store accumulator to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	BCS $05			  ; B0 05 | Branch if carry set
	STX $00			  ; 86 00 | Store X register to zero page
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $02			  ; 85 02 | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_202
; Address: $C6ABD4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_202:
	JSL $C1BAD3		  ; 22 D3 BA C1 | Jump to subroutine long
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $16			  ; F0 16 | Branch if equal
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BRA $B0			  ; 80 B0 | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_203
; Address: $C6ABE5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_203:
	BCS $1B			  ; B0 1B | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,X		  ; 9D F2 2B | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $00			  ; C6 00 | Decrement (zero page)
	BNE $E1			  ; D0 E1 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_204
; Address: $C6ABF5
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_204:
	PHA				  ; 48 | Push accumulator to stack
	LDA $0E			  ; A5 0E | Load from zero page into accumulator
	STA $2BB2,X		  ; 9D B2 2B | Store accumulator to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $2BE7			; 4C E7 2B | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	LDA $10			  ; A5 10 | Load from zero page into accumulator
	STA $2BB2,X		  ; 9D B2 2B | Store accumulator to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $2BE7			; 4C E7 2B | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	LDX $02			  ; A6 02 | Load from zero page into X register
	BEQ $08			  ; F0 08 | Branch if equal
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	BNE $F8			  ; D0 F8 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_206
; Address: $C6AC25
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_206:
	JSL $C32C0F		  ; 22 0F 2C C3 | Jump to subroutine long
	STY $20			  ; 84 20 | Store Y register to zero page
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_207
; Address: $C6AC2D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_207:
	STA $00			  ; 85 00 | Store accumulator to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	BEQ $04			  ; F0 04 | Branch if equal
	BCS $06			  ; B0 06 | Branch if carry set
	STX $00			  ; 86 00 | Store X register to zero page
	JMP $C32BD2		  ; 5C D2 2B C3 | Jump to address long
	PHY				  ; 5A | Push Y register to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_208
; Address: $C6AC41
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_208:
	ADC $00			  ; 65 00 | Add with carry (zero page)
	PHA				  ; 48 | Push accumulator to stack
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	STA $02			  ; 85 02 | Store accumulator to zero page
	PLX				  ; FA | Pull X register from stack
	BEQ $08			  ; F0 08 | Branch if equal
	LDY $20			  ; A4 20 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_209
; Address: $C6AC50
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_209:
	JSL $C32B70		  ; 22 70 2B C3 | Jump to subroutine long
	STY $20			  ; 84 20 | Store Y register to zero page
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_20A
; Address: $C6AC57
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_20A:
	JSL $C32BD2		  ; 22 D2 2B C3 | Jump to subroutine long
	LDX $02			  ; A6 02 | Load from zero page into X register
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_20C
; Address: $C6AC64
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_20C:
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $17			  ; F0 17 | Branch if equal
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BRA $B0			  ; 80 B0 | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BCS $1B			  ; B0 1B | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	JMP $2C64			; 4C 64 2C | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_20D
; Address: $C6AC84
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_20D:
	PHA				  ; 48 | Push accumulator to stack
	LDA $0E			  ; A5 0E | Load from zero page into accumulator
	STA $2BB2,Y		  ; 99 B2 2B | Store accumulator to absolute,Y
	PLA				  ; 68 | Pull accumulator from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $2C76			; 4C 76 2C | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	LDA $10			  ; A5 10 | Load from zero page into accumulator
	STA $2BB2,Y		  ; 99 B2 2B | Store accumulator to absolute,Y
	PLA				  ; 68 | Pull accumulator from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $2C76			; 4C 76 2C | Jump to address
	PHX				  ; DA | Push X register to stack
	LDX #$70			 ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_20F
; Address: $C6ACA9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_20F:
	SEC				  ; 38 | Set carry flag
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	BVS $29			  ; 70 29 | Branch if overflow set
	BNE $1C			  ; D0 1C | Branch if not equal
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_210
; Address: $C6ACB8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_210:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	LDA #$87			 ; A9 87 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_212
; Address: $C6ACCD
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_212:
	BVS $29			  ; 70 29 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_213
; Address: $C6ACD5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_213:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_215
; Address: $C6ACE4
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_215:
	JSL $C01579		  ; 22 79 15 C0 | Jump to subroutine long
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	BVS $29			  ; 70 29 | Branch if overflow set
	BNE $23			  ; D0 23 | Branch if not equal
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	STA $2C32,Y		  ; 99 32 2C | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $E5			  ; 90 E5 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	LDA #$BC			 ; A9 BC | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_217
; Address: $C6AD16
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_217:
	BVS $29			  ; 70 29 | Branch if overflow set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$BC			 ; 69 BC | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_218
; Address: $C6AD1E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_218:
	JSL $C32B96		  ; 22 96 2B C3 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_21A
; Address: $C6AD2D
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_21A:
	JSL $C01579		  ; 22 79 15 C0 | Jump to subroutine long
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	BVS $29			  ; 70 29 | Branch if overflow set
	BNE $29			  ; D0 29 | Branch if not equal
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	LDA #$B9			 ; A9 B9 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2C32,Y		  ; 99 32 2C | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $DF			  ; 90 DF | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	LDA #$E6			 ; A9 E6 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_21C
; Address: $C6AD65
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_21C:
	BVS $29			  ; 70 29 | Branch if overflow set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$E6			 ; 69 E6 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_21D
; Address: $C6AD6D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_21D:
	JSL $C32B96		  ; 22 96 2B C3 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_21F
; Address: $C6AD7C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_21F:
	JSL $C32D83		  ; 22 83 2D C3 | Jump to subroutine long
	JMP $2CA6			; 4C A6 2C | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_220
; Address: $C6AD93
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_220:
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL $A3			  ; 06 A3 | Arithmetic shift left (zero page)
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ORA $68			  ; 05 68 | Logical OR with accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_222
; Address: $C6ADC8
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_222:
	JSL $C32DCF		  ; 22 CF 2D C3 | Jump to subroutine long
	JMP $2CA6			; 4C A6 2C | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BCC $02			  ; 90 02 | Branch if carry clear
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $F2			  ; 90 F2 | Branch if carry clear
	REP #$20			 ; C2 20 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_224
; Address: $C6ADEF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_224:
	JSL $C01579		  ; 22 79 15 C0 | Jump to subroutine long
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_225
; Address: $C6ADFA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_225:
	TAX				  ; AA | Transfer accumulator to X register
	BVS $29			  ; 70 29 | Branch if overflow set
	BNE $1C			  ; D0 1C | Branch if not equal
	LDA #$87			 ; A9 87 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_226
; Address: $C6AE05
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_226:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	LDA #$87			 ; A9 87 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_228
; Address: $C6AE1A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_228:
	BVS $29			  ; 70 29 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	ADC #$87			 ; 69 87 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_229
; Address: $C6AE22
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_229:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_22B
; Address: $C6AE31
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_22B:
	JSL $C32D83		  ; 22 83 2D C3 | Jump to subroutine long
	JMP $2DF3			; 4C F3 2D | Jump to address
	PHX				  ; DA | Push X register to stack
	LDX #$70			 ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_22C
; Address: $C6AE3C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_22C:
	JSL $C32DCF		  ; 22 CF 2D C3 | Jump to subroutine long
	JMP $2DF3			; 4C F3 2D | Jump to address
	STY $00			  ; 84 00 | Store Y register to zero page
	LDA $1C			  ; A5 1C | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	BMI $1C			  ; 30 1C | Branch if negative
	CMP #$41			 ; C9 41 | Compare accumulator (immediate)
	BCC $17			  ; 90 17 | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_22D
; Address: $C6AE52
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_22D:
	JSL $C3549B		  ; 22 9B 54 C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	DEX				  ; CA | Decrement X register
	BEQ $07			  ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_22E
; Address: $C6AE61
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_22E:
	JSL $C32863		  ; 22 63 28 C3 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	BNE $F9			  ; D0 F9 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_22F
; Address: $C6AE69
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_22F:
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	LDA $0A			  ; A5 0A | Load from zero page into accumulator
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_230
; Address: $C6AE70
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_230:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $1C			  ; A5 1C | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $05			  ; F0 05 | Branch if equal
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	BNE $0C			  ; D0 0C | Branch if not equal
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $05			  ; D0 05 | Branch if not equal
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	STA $2890,X		  ; 9D 90 28 | Store accumulator to absolute,X
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	BPL $08			  ; 10 08 | Branch if positive
	LDA $1C			  ; A5 1C | Load from zero page into accumulator
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	STA $2A88			; 8D 88 2A | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_232
; Address: $C6AEB2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_232:
	JSL $C346A6		  ; 22 A6 46 C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BNE $17			  ; D0 17 | Branch if not equal
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_233
; Address: $C6AEC4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_233:
	JSR $2F26			; 20 26 2F | Jump to subroutine
	JMP $2ED4			; 4C D4 2E | Jump to address
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_236
; Address: $C6AED5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_236:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BNE $26			  ; D0 26 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_237
; Address: $C6AEDC
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_237:
	JSL $C32FA2		  ; 22 A2 2F C3 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $18			  ; 85 18 | Store accumulator to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $1C			  ; 65 1C | Add with carry (zero page)
	STA $1C			  ; 85 1C | Store accumulator to zero page
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $18			  ; A5 18 | Load from zero page into accumulator
	STA $2890,X		  ; 9D 90 28 | Store accumulator to absolute,X
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	BPL $08			  ; 10 08 | Branch if positive
	LDA $1C			  ; A5 1C | Load from zero page into accumulator
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	STA $2A88			; 8D 88 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_238
; Address: $C6AF02
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_238:
	JSL $C32FA2		  ; 22 A2 2F C3 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	ADC $16			  ; 65 16 | Add with carry (zero page)
	STA $16			  ; 85 16 | Store accumulator to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $16			  ; A5 16 | Load from zero page into accumulator
	STA $2878,X		  ; 9D 78 28 | Store accumulator to absolute,X
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	BPL $E4			  ; 10 E4 | Branch if positive
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	STA $2A84			; 8D 84 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_239
; Address: $C6AF26
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_239:
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	INC				  ; 1A | Increment accumulator
	CMP $2938,X		  ; DD 38 29 | Compare accumulator (absolute,X)
	BNE $3A			  ; D0 3A | Branch if not equal
	SEP #$20			 ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_23A
; Address: $C6AF33
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_23A:
	DEC				  ; 3A | Decrement accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LDA $2950,X		  ; BD 50 29 | Load from absolute,X into accumulator
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_23B
; Address: $C6AF3A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_23B:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($E2,X)		  ; 01 E2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_23C
; Address: $C6AF45
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_23C:
	JSR $A5EB			; 20 EB A5 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_23D
; Address: $C6AF4B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_23D:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $18			  ; 85 18 | Store accumulator to zero page
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $1C			  ; 65 1C | Add with carry (zero page)
	STA $1C			  ; 85 1C | Store accumulator to zero page
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	BPL $08			  ; 10 08 | Branch if positive
	LDA $1C			  ; A5 1C | Load from zero page into accumulator
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	STA $2A88			; 8D 88 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_23E
; Address: $C6AF6B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_23E:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $2950,X		  ; BD 50 29 | Load from absolute,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LDA $0A			  ; A5 0A | Load from zero page into accumulator
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_23F
; Address: $C6AF75
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_23F:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $18			  ; 85 18 | Store accumulator to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $1C			  ; 65 1C | Add with carry (zero page)
	STA $1C			  ; 85 1C | Store accumulator to zero page
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $DC			  ; D0 DC | Branch if not equal
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $18			  ; A5 18 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_240
; Address: $C6AF92
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_240:
	STA $2890,X		  ; 9D 90 28 | Store accumulator to absolute,X
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	BPL $D1			  ; 10 D1 | Branch if positive
	LDA $1C			  ; A5 1C | Load from zero page into accumulator
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	STA $2A88			; 8D 88 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_241
; Address: $C6AFA2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_241:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LDA $0A			  ; A5 0A | Load from zero page into accumulator
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_243
; Address: $C6AFB0
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_243:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $2F			  ; F0 2F | Branch if equal
	LDA $0A			  ; A5 0A | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $26			  ; A5 26 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $1E			  ; 85 1E | Store accumulator to zero page
	STA $26			  ; 85 26 | Store accumulator to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $1C			  ; A5 1C | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $1C			  ; 85 1C | Store accumulator to zero page
	LDA $2A			  ; A5 2A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $2A			  ; 85 2A | Store accumulator to zero page
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $06			  ; E5 06 | Subtract with carry (zero page)
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_245
; Address: $C6AFE2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_245:
	JSL $C3289E		  ; 22 9E 28 C3 | Jump to subroutine long
	INC $06			  ; E6 06 | Increment (zero page)
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP $04			  ; C5 04 | Compare accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_246
; Address: $C6AFED
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_246:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STZ $2BB6			; 9C B6 2B | Store zero to absolute
	STZ $2BB8			; 9C B8 2B | Store zero to absolute
	LDA $4197			; AD 97 41 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_247
; Address: $C6AFF8
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_247:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2BB2			; 8D B2 2B | Store accumulator to absolute address
	LDX #$FE			 ; A2 FE | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $F6			  ; F0 F6 | Branch if equal
	STA $3306,Y		  ; 99 06 33 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPX $2BB4			; EC B4 2B | Compare X register (absolute)
	BNE $0A			  ; D0 0A | Branch if not equal
	STA $2BB6			; 8D B6 2B | Store accumulator to absolute address
	PHY				  ; 5A | Push Y register to stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STY $2BB8			; 8C B8 2B | Store Y register to absolute address
	PLY				  ; 7A | Pull Y register from stack
	CPY $2BB2			; CC B2 2B | Compare Y register (absolute)
	BCC $DD			  ; 90 DD | Branch if carry clear
	LDA $2BB8			; AD B8 2B | Load from absolute address into accumulator
	STA $2BB4			; 8D B4 2B | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_248
; Address: $C6B02E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_248:
	LDX #$FE			 ; A2 FE | Load immediate value into X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CMP $40F7,X		  ; DD F7 40 | Compare accumulator (absolute,X)
	BNE $F9			  ; D0 F9 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_249
; Address: $C6B03B
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_249:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_24A
; Address: $C6B03E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_24A:
	JSL $C42C5B		  ; 22 5B 2C C4 | Jump to subroutine long
	SEP #$20			 ; E2 20 | Set processor status bits
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	BCC $F2			  ; 90 F2 | Branch if carry clear
	STY $2BB2			; 8C B2 2B | Store Y register to absolute address
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_24B
; Address: $C6B05B
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_24B:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_24C
; Address: $C6B05F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_24C:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $3825,X		  ; BD 25 38 | Load from absolute,X into accumulator
	BEQ $06			  ; F0 06 | Branch if equal
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	REP #$20			 ; C2 20 | Reset processor status bits
	STX $2BF0			; 8E F0 2B | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_24D
; Address: $C6B075
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_24D:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $36A0,X		  ; BD A0 36 | Load from absolute,X into accumulator
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $F0			  ; 90 F0 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_24E
; Address: $C6B08F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_24E:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	TXA				  ; 8A | Transfer X register to accumulator
	LDY $36A0,X		  ; BC A0 36 | Load from absolute,X into Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	INC				  ; 1A | Increment accumulator
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_251
; Address: $C6B0B6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_251:
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $2B			  ; F0 2B | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_259
; Address: $C6B0DD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_259:
	JSL $C33B71		  ; 22 71 3B C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_25E
; Address: $C6B0F5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_25E:
	JSL $C331EE		  ; 22 EE 31 C3 | Jump to subroutine long
	BCC $F2			  ; 90 F2 | Branch if carry clear
	JMP $30DD			; 4C DD 30 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_25F
; Address: $C6B0FE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_25F:
	JSL $C33167		  ; 22 67 31 C3 | Jump to subroutine long
	STZ $2A7C			; 9C 7C 2A | Store zero to absolute
	STZ $2A7E			; 9C 7E 2A | Store zero to absolute
	STZ $2A80			; 9C 80 2A | Store zero to absolute
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $29F8,X		  ; BD F8 29 | Load from absolute,X into accumulator
	BEQ $1F			  ; F0 1F | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_260
; Address: $C6B112
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_260:
	JSL $C31E55		  ; 22 55 1E C3 | Jump to subroutine long
	STY $2A7C			; 8C 7C 2A | Store Y register to absolute address
	LDA $2A10,X		  ; BD 10 2A | Load from absolute,X into accumulator
	BEQ $13			  ; F0 13 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_261
; Address: $C6B11E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_261:
	JSL $C31E55		  ; 22 55 1E C3 | Jump to subroutine long
	STY $2A7E			; 8C 7E 2A | Store Y register to absolute address
	LDA $2A28,X		  ; BD 28 2A | Load from absolute,X into accumulator
	BEQ $07			  ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_262
; Address: $C6B12A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_262:
	JSL $C31E55		  ; 22 55 1E C3 | Jump to subroutine long
	STY $2A80			; 8C 80 2A | Store Y register to absolute address
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	STA $2A8A			; 8D 8A 2A | Store accumulator to absolute address
	LDA $2938,X		  ; BD 38 29 | Load from absolute,X into accumulator
	STA $2A8C			; 8D 8C 2A | Store accumulator to absolute address
	LDA $2950,X		  ; BD 50 29 | Load from absolute,X into accumulator
	STA $2A8E			; 8D 8E 2A | Store accumulator to absolute address
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_264
; Address: $C6B14B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_264:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDA $2A72			; AD 72 2A | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	LDX $2A78			; AE 78 2A | Load from absolute address into X register
	STA $2BF2,X		  ; 9D F2 2B | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_265
; Address: $C6B15F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_265:
	JSL $C3369C		  ; 22 9C 36 C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_267
; Address: $C6B167
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_267:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $09			  ; 80 09 | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_268
; Address: $C6B16F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_268:
	JSR $A81C			; 20 1C A8 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_269
; Address: $C6B174
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_269:
	LDA $2A68			; AD 68 2A | Load from absolute address into accumulator
	BEQ $0C			  ; F0 0C | Branch if equal
	AND $2A6A			; 2D 6A 2A | Logical AND with accumulator (absolute)
	BNE $0D			  ; D0 0D | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_26B
; Address: $C6B185
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_26B:
	STZ $2AA6			; 9C A6 2A | Store zero to absolute
	STZ $2A6A			; 9C 6A 2A | Store zero to absolute
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	BEQ $09			  ; F0 09 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_26C
; Address: $C6B191
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_26C:
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BNE $E8			  ; D0 E8 | Branch if not equal
	BIT $2AA6			; 2C A6 2A | Test bits in accumulator (absolute)
	BVS $02			  ; 70 02 | Branch if overflow set
	BMI $E3			  ; 30 E3 | Branch if negative

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_26D
; Address: $C6B19D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_26D:
	JSL $C331B9		  ; 22 B9 31 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_26E
; Address: $C6B1A3
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_26E:
	JSL $C331B9		  ; 22 B9 31 C3 | Jump to subroutine long
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	BEQ $2D			  ; F0 2D | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	AND $2A6A			; 2D 6A 2A | Logical AND with accumulator (absolute)
	BNE $05			  ; D0 05 | Branch if not equal
	STZ $2A6A			; 9C 6A 2A | Store zero to absolute
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_270
; Address: $C6B1B9
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_270:
	LDX $2A78			; AE 78 2A | Load from absolute address into X register
	LDA $2A6C			; AD 6C 2A | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	STA $2A6C			; 8D 6C 2A | Store accumulator to absolute address
	BMI $18			  ; 30 18 | Branch if negative
	LDA $2A72			; AD 72 2A | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CMP $2BF2,X		  ; DD F2 2B | Compare accumulator (absolute,X)
	BEQ $0A			  ; F0 0A | Branch if equal
	STA $2BF2,X		  ; 9D F2 2B | Store accumulator to absolute,X
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_272
; Address: $C6B1E0
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_272:
	LDA $2A70			; AD 70 2A | Load from absolute address into accumulator
	CMP $2BF2,X		  ; DD F2 2B | Compare accumulator (absolute,X)
	BEQ $F7			  ; F0 F7 | Branch if equal
	STA $2BF2,X		  ; 9D F2 2B | Store accumulator to absolute,X
	JMP $31D8			; 4C D8 31 | Jump to address
	LDA $2A6A			; AD 6A 2A | Load from absolute address into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA #$F0			 ; A9 F0 | Load immediate value into accumulator
	BEQ $2D			  ; F0 2D | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	BNE $18			  ; D0 18 | Branch if not equal
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BNE $2E			  ; D0 2E | Branch if not equal
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BNE $2F			  ; D0 2F | Branch if not equal
	STZ $2AA6			; 9C A6 2A | Store zero to absolute
	STZ $2A6A			; 9C 6A 2A | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_273
; Address: $C6B216
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_273:
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_274
; Address: $C6B220
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_274:
	JSR $A60C			; 20 0C A6 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	JMP $3232			; 4C 32 32 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_276
; Address: $C6B22C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_276:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	AND $3800,X		  ; 3D 00 38 | Logical AND with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_278
; Address: $C6B237
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_278:
	JSL $C3447C		  ; 22 7C 44 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_27A
; Address: $C6B240
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_27A:
	JSL $C3445E		  ; 22 5E 44 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_27B
; Address: $C6B246
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_27B:
	LDY $7F64			; AC 64 7F | Load from absolute address into Y register
	LDX $32FC,Y		  ; BE FC 32 | Load from absolute,Y into X register
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_27C
; Address: $C6B253
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_27C:
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	BEQ $2D			  ; F0 2D | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	BNE $2E			  ; D0 2E | Branch if not equal
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BNE $14			  ; D0 14 | Branch if not equal
	LDA #$0F			 ; A9 0F | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BNE $3B			  ; D0 3B | Branch if not equal
	STZ $2AA6			; 9C A6 2A | Store zero to absolute
	STZ $2A6A			; 9C 6A 2A | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_27D
; Address: $C6B271
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_27D:
	JSL $C331B9		  ; 22 B9 31 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_27E
; Address: $C6B277
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_27E:
	JSL $C331A3		  ; 22 A3 31 C3 | Jump to subroutine long
	BCC $F8			  ; 90 F8 | Branch if carry clear
	LDA #$60			 ; A9 60 | Load immediate value into accumulator
	STA $2A6A			; 8D 6A 2A | Store accumulator to absolute address
	LDX $2A9A			; AE 9A 2A | Load from absolute address into X register
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_27F
; Address: $C6B289
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_27F:
	JSL $C331A3		  ; 22 A3 31 C3 | Jump to subroutine long
	BCC $E6			  ; 90 E6 | Branch if carry clear
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	BEQ $8D			  ; F0 8D | Branch if equal
	ROR				  ; 6A | Rotate right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_281
; Address: $C6B29A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_281:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	AND $AE00,X		  ; 3D 00 AE | Logical AND with accumulator (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_283
; Address: $C6B2A6
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_283:
	JSL $C33174		  ; 22 74 31 C3 | Jump to subroutine long
	BCC $C9			  ; 90 C9 | Branch if carry clear
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BEQ $06			  ; F0 06 | Branch if equal
	LDX $2A96			; AE 96 2A | Load from absolute address into X register
	CPX $32			  ; E4 32 | Compare X register (zero page)
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BEQ $06			  ; F0 06 | Branch if equal
	LDX $2A94			; AE 94 2A | Load from absolute address into X register
	NOP				  ; EA | No operation
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BEQ $06			  ; F0 06 | Branch if equal
	LDX $2A90			; AE 90 2A | Load from absolute address into X register
	BEQ $32			  ; F0 32 | Branch if equal
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BEQ $97			  ; F0 97 | Branch if equal
	LDX $2A92			; AE 92 2A | Load from absolute address into X register
	PEA #$C732		   ; F4 32 C7 | Push effective address to stack
	SBC ($33,X)		  ; E1 33 | Subtract with carry ((zero page,X))
	SBC #$33			 ; E9 33 | Subtract with carry (immediate)
	CPY #$33			 ; C0 33 | Compare Y register (immediate)
	SBC ($33,X)		  ; E1 33 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ASL $33			  ; 06 33 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_285
; Address: $C6B2FF
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_285:
	JSL $C33707		  ; 22 07 37 C3 | Jump to subroutine long
	JMP $33CE			; 4C CE 33 | Jump to address
	STA $2A6A			; 8D 6A 2A | Store accumulator to absolute address
	LDX $2A74			; AE 74 2A | Load from absolute address into X register
	LDY $2AAC,X		  ; BC AC 2A | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $2A9E,Y		  ; B9 9E 2A | Load from absolute,Y into accumulator
	INC				  ; 1A | Increment accumulator
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BCC $02			  ; 90 02 | Branch if carry clear
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $2A9E,Y		  ; 99 9E 2A | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_288
; Address: $C6B329
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_288:
	JSR $3752			; 20 52 37 | Jump to subroutine
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $8D			  ; 80 8D | Branch always

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_289
; Address: $C6B330
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_289:
	JMP ($222A)		  ; 6C 2A 22 | Jump to address (absolute indirect)
	AND $22C3,X		  ; 3D C3 22 | Logical AND with accumulator (absolute,X)
	WDM #$3E			 ; 42 3E | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_28A
; Address: $C6B33C
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_28A:
	STA $2A6A			; 8D 6A 2A | Store accumulator to absolute address
	LDX $2A74			; AE 74 2A | Load from absolute address into X register
	LDY $2AAC,X		  ; BC AC 2A | Load from absolute,X into Y register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $2A9E,Y		  ; B9 9E 2A | Load from absolute,Y into accumulator
	DEC				  ; 3A | Decrement accumulator
	BPL $CE			  ; 10 CE | Branch if positive
	LDA #$09			 ; A9 09 | Load immediate value into accumulator
	JMP $331B			; 4C 1B 33 | Jump to address
	LDY $7F64			; AC 64 7F | Load from absolute address into Y register
	LDX $32FC,Y		  ; BE FC 32 | Load from absolute,Y into X register
	LDY $29C8,X		  ; BC C8 29 | Load from absolute,X into Y register
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $338C			; 8D 8C 33 | Store accumulator to absolute address
	STZ $338E			; 9C 8E 33 | Store zero to absolute
	STZ $74			  ; 64 74 | Store zero to zero page
	STZ $76			  ; 64 76 | Store zero to zero page
	PHX				  ; DA | Push X register to stack
	LDX #$07			 ; A2 07 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	LDA $338C			; AD 8C 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	LDA $338E			; AD 8E 33 | Load from absolute address into accumulator
	STA $72			  ; 85 72 | Store accumulator to zero page
	LDA $2A9E,X		  ; BD 9E 2A | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	LDX #$70			 ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_28B
; Address: $C6B380
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_28B:
	JSL $C01107		  ; 22 07 11 C0 | Jump to subroutine long
	LDA $70			  ; A5 70 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $74			  ; 65 74 | Add with carry (zero page)
	STA $74			  ; 85 74 | Store accumulator to zero page
	LDA $72			  ; A5 72 | Load from zero page into accumulator
	ADC $76			  ; 65 76 | Add with carry (zero page)
	STA $76			  ; 85 76 | Store accumulator to zero page
	LDA $338C			; AD 8C 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	LDA $338E			; AD 8E 33 | Load from absolute address into accumulator
	STA $72			  ; 85 72 | Store accumulator to zero page
	LDA #$0A			 ; A9 0A | Load immediate value into accumulator
	LDX #$70			 ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_28C
; Address: $C6B3A1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_28C:
	JSL $C01107		  ; 22 07 11 C0 | Jump to subroutine long
	LDA $70			  ; A5 70 | Load from zero page into accumulator
	STA $338C			; 8D 8C 33 | Store accumulator to absolute address
	LDA $72			  ; A5 72 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_28D
; Address: $C6B3AC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_28D:
	STA $338E			; 8D 8E 33 | Store accumulator to absolute address
	PLX				  ; FA | Pull X register from stack
	DEX				  ; CA | Decrement X register
	DEY				  ; 88 | Decrement Y register
	BPL $B8			  ; 10 B8 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	LDA $74			  ; A5 74 | Load from zero page into accumulator
	STA $2998,X		  ; 9D 98 29 | Store accumulator to absolute,X
	LDA $76			  ; A5 76 | Load from zero page into accumulator
	STA $29B0,X		  ; 9D B0 29 | Store accumulator to absolute,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_28F
; Address: $C6B3C7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_28F:
	JSL $C3371B		  ; 22 1B 37 C3 | Jump to subroutine long
	JMP $33CE			; 4C CE 33 | Jump to address
	BCC $0F			  ; 90 0F | Branch if carry clear
	STZ $2A6C			; 9C 6C 2A | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_292
; Address: $C6B3DB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_292:
	JSL $C3369C		  ; 22 9C 36 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_293
; Address: $C6B3E1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_293:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDX $2A			  ; A6 2A | Load from zero page into X register
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_294
; Address: $C6B3E9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_294:
	STA $2A6A			; 8D 6A 2A | Store accumulator to absolute address
	LDA $2A74			; AD 74 2A | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2BE2,X		  ; BD E2 2B | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BCS $05			  ; B0 05 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_295
; Address: $C6B3FE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_295:
	JSR $344D			; 20 4D 34 | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	JMP $3409			; 4C 09 34 | Jump to address
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $2BE2,X		  ; 9D E2 2B | Store accumulator to absolute,X
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $2A8A			; AD 8A 2A | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_29A
; Address: $C6B423
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_29A:
	SEC				  ; 38 | Set carry flag
	JMP $33CE			; 4C CE 33 | Jump to address
	STA $2A6A			; 8D 6A 2A | Store accumulator to absolute address
	LDA $2A74			; AD 74 2A | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2BE2,X		  ; BD E2 2B | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	BNE $0C			  ; D0 0C | Branch if not equal
	LDA #$09			 ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_29B
; Address: $C6B43C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_29B:
	JSR $344D			; 20 4D 34 | Jump to subroutine
	BCC $C8			  ; 90 C8 | Branch if carry clear
	DEC				  ; 3A | Decrement accumulator
	JMP $343C			; 4C 3C 34 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_29C
; Address: $C6B445
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_29C:
	JSR $344D			; 20 4D 34 | Jump to subroutine
	BCS $95			  ; B0 95 | Branch if carry set
	JMP $3409			; 4C 09 34 | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2BBA,X		  ; BD BA 2B | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_29D
; Address: $C6B459
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_29D:
	JSL $C44E68		  ; 22 68 4E C4 | Jump to subroutine long
	BVS $A3			  ; 70 A3 | Branch if overflow set
	LDX #$70			 ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_29E
; Address: $C6B464
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_29E:
	JSL $C01107		  ; 22 07 11 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	LDA $72			  ; A5 72 | Load from zero page into accumulator
	BEQ $0A			  ; F0 0A | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BCS $05			  ; B0 05 | Branch if carry set
	LDY $70			  ; A4 70 | Load from zero page into Y register
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	STX $FA			  ; 86 FA | Store X register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_29F
; Address: $C6B47A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_29F:
	BIT #$34			 ; 89 34 | Test bits in accumulator (immediate)
	BRA $34			  ; 80 34 | Branch always
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2A0
; Address: $C6B482
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2A0:
	JSR $A60C			; 20 0C A6 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	JMP $3500			; 4C 00 35 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2A2
; Address: $C6B48F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2A2:
	JMP $3534			; 4C 34 35 | Jump to address
	LDA $3306			; AD 06 33 | Load from absolute address into accumulator
	BEQ $F2			  ; F0 F2 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2A3
; Address: $C6B497
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2A3:
	JSR $35D5			; 20 D5 35 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $3A			  ; F0 3A | Branch if equal
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2A5
; Address: $C6B4AC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2A5:
	JSL $C3356D		  ; 22 6D 35 C3 | Jump to subroutine long
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	LDA $9040,Y		  ; B9 40 90 | Load from absolute,Y into accumulator
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	LDY $C335			; AC 35 C3 | Load from absolute address into Y register
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	LDA $6840,Y		  ; B9 40 68 | Load from absolute,Y into accumulator
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2A6
; Address: $C6B4C5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2A6:
	JSL $C33DA5		  ; 22 A5 3D C3 | Jump to subroutine long
	LDX $2A78			; AE 78 2A | Load from absolute address into X register
	PLA				  ; 68 | Pull accumulator from stack
	STA $2A78			; 8D 78 2A | Store accumulator to absolute address
	LDA $2A70			; AD 70 2A | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2A9
; Address: $C6B4DA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2A9:
	JSL $C3369C		  ; 22 9C 36 C3 | Jump to subroutine long
	STZ $2A6C			; 9C 6C 2A | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2AA
; Address: $C6B4E5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2AA:
	DEC				  ; 3A | Decrement accumulator
	ADC $AC35			; 6D 35 AC | Add with carry (absolute)
	CMP #$35			 ; C9 35 | Compare accumulator (immediate)
	BEQ $35			  ; F0 35 | Branch if equal
	LDX $3306			; AE 06 33 | Load from absolute address into X register
	BEQ $8F			  ; F0 8F | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2AB
; Address: $C6B4FA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2AB:
	JSR $351C			; 20 1C 35 | Jump to subroutine
	BCS $35			  ; B0 35 | Branch if carry set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2AF
; Address: $C6B50C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2AF:
	JSL $C02D00		  ; 22 00 2D C0 | Jump to subroutine long
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $BE43			; 8D 43 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2B0
; Address: $C6B516
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2B0:
	JSL $C33695		  ; 22 95 36 C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2B1
; Address: $C6B51C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2B1:
	LDX $3306			; AE 06 33 | Load from absolute address into X register
	LDA $3310,X		  ; BD 10 33 | Load from absolute,X into accumulator
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $06			  ; D0 06 | Branch if not equal
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $EF			  ; 10 EF | Branch if positive
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2B3
; Address: $C6B534
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2B3:
	JSL $C33695		  ; 22 95 36 C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2B4
; Address: $C6B53A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2B4:
	LDX $2A74			; AE 74 2A | Load from absolute address into X register
	LDA $2AAC,X		  ; BD AC 2A | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	LDX $3306			; AE 06 33 | Load from absolute address into X register
	STA $3310,X		  ; 9D 10 33 | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $3308			; EC 08 33 | Compare X register (absolute)
	BCS $0C			  ; B0 0C | Branch if carry set
	STX $3306			; 8E 06 33 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2B5
; Address: $C6B553
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2B5:
	JSL $C3369C		  ; 22 9C 36 C3 | Jump to subroutine long
	STZ $2A6C			; 9C 6C 2A | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2B6
; Address: $C6B55C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2B6:
	JSR $351C			; 20 1C 35 | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$34			 ; A9 34 | Load immediate value into accumulator
	JMP $34A6			; 4C A6 34 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2B7
; Address: $C6B567
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2B7:
	JSL $C3369C		  ; 22 9C 36 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2B8
; Address: $C6B56D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2B8:
	LDY $7F64			; AC 64 7F | Load from absolute address into Y register
	LDX $32FC,Y		  ; BE FC 32 | Load from absolute,Y into X register
	LDA $2800,X		  ; BD 00 28 | Load from absolute,X into accumulator
	CMP #$3A			 ; C9 3A | Compare accumulator (immediate)
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$A6			 ; A9 A6 | Load immediate value into accumulator
	JMP $3584			; 4C 84 35 | Jump to address
	LDA #$C4			 ; A9 C4 | Load immediate value into accumulator
	STA $2830,X		  ; 9D 30 28 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2B9
; Address: $C6B587
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2B9:
	JSL $C31914		  ; 22 14 19 C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $04			  ; 80 04 | Branch always
	ROL $74AD			; 2E AD 74 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2BA
; Address: $C6B592
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2BA:
	ROL				  ; 2A | Rotate left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	STZ $2A74			; 9C 74 2A | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2BB
; Address: $C6B597
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2BB:
	JSL $C32ACE		  ; 22 CE 2A C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2BC
; Address: $C6B59E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2BC:
	JSL $C33C60		  ; 22 60 3C C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2BD
; Address: $C6B5A6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2BD:
	JSL $C33E42		  ; 22 42 3E C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2BE
; Address: $C6B5AC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2BE:
	LDY $7F64			; AC 64 7F | Load from absolute address into Y register
	LDX $32FC,Y		  ; BE FC 32 | Load from absolute,Y into X register
	LDA $2800,X		  ; BD 00 28 | Load from absolute,X into accumulator
	CMP #$3A			 ; C9 3A | Compare accumulator (immediate)
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$7F			 ; A9 7F | Load immediate value into accumulator
	JMP $35C3			; 4C C3 35 | Jump to address
	LDA #$9D			 ; A9 9D | Load immediate value into accumulator
	STA $2830,X		  ; 9D 30 28 | Store accumulator to absolute,X
	JMP $3587			; 4C 87 35 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2C0
; Address: $C6B5CC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2C0:
	JSL $C3369C		  ; 22 9C 36 C3 | Jump to subroutine long
	STZ $2A6C			; 9C 6C 2A | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2C1
; Address: $C6B5D5
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2C1:
	LDA #$AC			 ; A9 AC | Load immediate value into accumulator
	LDX $3306			; AE 06 33 | Load from absolute address into X register
	LDY $3310,X		  ; BC 10 33 | Load from absolute,X into Y register
	STA $3310,X		  ; 9D 10 33 | Store accumulator to absolute,X
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BMI $05			  ; 30 05 | Branch if negative
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	BEQ $F1			  ; F0 F1 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	STX $3306			; 8E 06 33 | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2C2
; Address: $C6B5F0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2C2:
	LDX $3306			; AE 06 33 | Load from absolute address into X register
	LDA $3310,X		  ; BD 10 33 | Load from absolute,X into accumulator
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F4			  ; 10 F4 | Branch if positive
	JMP $3623			; 4C 23 36 | Jump to address
	STA $2A58			; 8D 58 2A | Store accumulator to absolute address
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2C3
; Address: $C6B609
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2C3:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $8D			  ; 80 8D | Branch always
	PHY				  ; 5A | Push Y register to stack
	ROL				  ; 2A | Rotate left (accumulator)
	SEP #$20			 ; E2 20 | Set processor status bits
	INX				  ; E8 | Increment X register
	LDA				  ; BF 41 36 C3 | Load from absolute long,X into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP $2A58			; CD 58 2A | Compare accumulator (absolute)
	BNE $F4			  ; D0 F4 | Branch if not equal
	LDA $2A5B			; AD 5B 2A | Load from absolute address into accumulator
	STA $3311,Y		  ; 99 11 33 | Store accumulator to absolute,Y
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2C4
; Address: $C6B625
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2C4:
	JSL $C3369C		  ; 22 9C 36 C3 | Jump to subroutine long
	LDX $3306			; AE 06 33 | Load from absolute address into X register
	CPX $330A			; EC 0A 33 | Compare X register (absolute)
	BNE $08			  ; D0 08 | Branch if not equal
	LDA $3310,X		  ; BD 10 33 | Load from absolute,X into accumulator
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BNE $05			  ; D0 05 | Branch if not equal
	STZ $2A6C			; 9C 6C 2A | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2C5
; Address: $C6B63E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2C5:
	JMP $355C			; 4C 5C 35 | Jump to address
	ORA ($12),Y		  ; 11 12 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA $1B1A,Y		  ; 19 1A 1B | Logical OR with accumulator (absolute,Y)
	ORA $1F1E,X		  ; 1D 1E 1F | Logical OR with accumulator (absolute,X)
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$48			 ; 29 48 | Logical AND with accumulator (immediate)
	EOR #$4A			 ; 49 4A | Exclusive OR with accumulator (immediate)
	JMP $4E4D			; 4C 4D 4E | Jump to address
	BVC $51			  ; 50 51 | Branch if overflow clear
	JMP $5F5E5D		  ; 5C 5D 5E 5F | Jump to address long
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2C6
; Address: $C6B669
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2C6:
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$5C			 ; 29 5C | Logical AND with accumulator (immediate)
	EOR $5F5E,X		  ; 5D 5E 5F | Exclusive OR with accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2C7
; Address: $C6B676
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2C7:
	LDX $3306			; AE 06 33 | Load from absolute address into X register
	LDA $3310,X		  ; BD 10 33 | Load from absolute,X into accumulator
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F4			  ; 10 F4 | Branch if positive
	JMP $3623			; 4C 23 36 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2C8
; Address: $C6B689
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2C8:
	STA $2A58			; 8D 58 2A | Store accumulator to absolute address
	LDX #$29			 ; A2 29 | Load immediate value into X register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt
	JMP $360C			; 4C 0C 36 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $0C			  ; 80 0C | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	ROL				  ; 2A | Rotate left (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2C9
; Address: $C6B69C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2C9:
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt
	TAY				  ; A8 | Transfer accumulator to Y register
	ROL				  ; 2A | Rotate left (accumulator)
	LDX $2A7C			; AE 7C 2A | Load from absolute address into X register
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2CA
; Address: $C6B6A7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2CA:
	JSR $36BB			; 20 BB 36 | Jump to subroutine
	LDX $2A7E			; AE 7E 2A | Load from absolute address into X register
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2CB
; Address: $C6B6AF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2CB:
	JSR $36BB			; 20 BB 36 | Jump to subroutine
	LDX $2A80			; AE 80 2A | Load from absolute address into X register
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2CD
; Address: $C6B6BB
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2CD:
	LDY $32FC,X		  ; BC FC 32 | Load from absolute,X into Y register
	LDX $2A74			; AE 74 2A | Load from absolute address into X register
	LDA $2AAC,X		  ; BD AC 2A | Load from absolute,X into accumulator
	STA $2998,Y		  ; 99 98 29 | Store accumulator to absolute,Y
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $29B0,Y		  ; 99 B0 29 | Store accumulator to absolute,Y
	PHY				  ; 5A | Push Y register to stack
	LDY $7F64			; AC 64 7F | Load from absolute address into Y register
	LDX $32FC,Y		  ; BE FC 32 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2CE
; Address: $C6B6D5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2CE:
	JSR $3C17			; 20 17 3C | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	CLC				  ; 18 | Clear carry flag
	ADC $29B0,Y		  ; 79 B0 29 | Add with carry (absolute,Y)
	STA $29B0,Y		  ; 99 B0 29 | Store accumulator to absolute,Y
	LDA $29B0,X		  ; BD B0 29 | Load from absolute,X into accumulator
	STA $29C8,Y		  ; 99 C8 29 | Store accumulator to absolute,Y
	LDA $2998,X		  ; BD 98 29 | Load from absolute,X into accumulator
	STA $29E0,Y		  ; 99 E0 29 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2D0
; Address: $C6B6F3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2D0:
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BEQ $0A			  ; F0 0A | Branch if equal
	STA $2A6A			; 8D 6A 2A | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2D1
; Address: $C6B6FE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2D1:
	JSL $C3393B		  ; 22 3B 39 C3 | Jump to subroutine long
	BCC $01			  ; 90 01 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2D3
; Address: $C6B707
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2D3:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BEQ $0A			  ; F0 0A | Branch if equal
	STA $2A6A			; 8D 6A 2A | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2D4
; Address: $C6B712
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2D4:
	JSL $C33AB2		  ; 22 B2 3A C3 | Jump to subroutine long
	BCC $01			  ; 90 01 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2D6
; Address: $C6B71B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2D6:
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BEQ $0A			  ; F0 0A | Branch if equal
	STA $2A6A			; 8D 6A 2A | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2D7
; Address: $C6B726
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2D7:
	JSL $C3376A		  ; 22 6A 37 C3 | Jump to subroutine long
	BCC $01			  ; 90 01 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2D9
; Address: $C6B72F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2D9:
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BEQ $0A			  ; F0 0A | Branch if equal
	STA $2A6A			; 8D 6A 2A | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2DA
; Address: $C6B73A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2DA:
	JSL $C338E7		  ; 22 E7 38 C3 | Jump to subroutine long
	BCC $01			  ; 90 01 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2DC
; Address: $C6B743
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2DC:
	LDA $2A6C			; AD 6C 2A | Load from absolute address into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP $2A6E			; CD 6E 2A | Compare accumulator (absolute)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2DE
; Address: $C6B752
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2DE:
	BIT $2AA6			; 2C A6 2A | Test bits in accumulator (absolute)
	BPL $06			  ; 10 06 | Branch if positive
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	JMP $3760			; 4C 60 37 | Jump to address
	LDA #$14			 ; A9 14 | Load immediate value into accumulator
	STA $2A6E			; 8D 6E 2A | Store accumulator to absolute address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $8D			  ; 80 8D | Branch always
	LDX $2A			  ; A6 2A | Load from zero page into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2E1
; Address: $C6B773
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2E1:
	JSL $C3445E		  ; 22 5E 44 C3 | Jump to subroutine long
	BCS $14			  ; B0 14 | Branch if carry set
	LDA $2AA6			; AD A6 2A | Load from absolute address into accumulator
	BPL $07			  ; 10 07 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $2AA6			; 8D A6 2A | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2E4
; Address: $C6B78E
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2E4:
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $2A84			; 6D 84 2A | Add with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $2A58			; 8E 58 2A | Store X register to absolute address
	STY $2A5A			; 8C 5A 2A | Store Y register to absolute address
	JMP $3809			; 4C 09 38 | Jump to address
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $2A82			; 6D 82 2A | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	STX $2A58			; 8E 58 2A | Store X register to absolute address
	STY $2A5A			; 8C 5A 2A | Store Y register to absolute address
	JMP $3809			; 4C 09 38 | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ASL $06B0			; 0E B0 06 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2E7
; Address: $C6B7D4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2E7:
	CLC				  ; 18 | Clear carry flag
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2E8
; Address: $C6B7D9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2E8:
	STY $338C			; 8C 8C 33 | Store Y register to absolute address
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	BMI $09			  ; 30 09 | Branch if negative
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $338C			; EC 8C 33 | Compare X register (absolute)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2EA
; Address: $C6B7ED
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2EA:
	JSR $3B22			; 20 22 3B | Jump to subroutine
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2EB
; Address: $C6B7F3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2EB:
	JSL $C33C60		  ; 22 60 3C C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2EC
; Address: $C6B7F9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2EC:
	STY $338C			; 8C 8C 33 | Store Y register to absolute address
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	BMI $E9			  ; 30 E9 | Branch if negative
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	CPX $338C			; EC 8C 33 | Compare X register (absolute)
	BCS $F4			  ; B0 F4 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2ED
; Address: $C6B809
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2ED:
	JSR $37BE			; 20 BE 37 | Jump to subroutine
	BCS $13			  ; B0 13 | Branch if carry set
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BNE $0C			  ; D0 0C | Branch if not equal
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BNE $0D			  ; D0 0D | Branch if not equal
	JMP $3872			; 4C 72 38 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2F2
; Address: $C6B834
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2F2:
	LDX $2A58			; AE 58 2A | Load from absolute address into X register
	LDY $2A5A			; AC 5A 2A | Load from absolute address into Y register
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2F3
; Address: $C6B83B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2F3:
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	CMP $2A86			; CD 86 2A | Compare accumulator (absolute)
	BCC $0D			  ; 90 0D | Branch if carry clear
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2F4
; Address: $C6B84B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2F4:
	JSR $37BE			; 20 BE 37 | Jump to subroutine
	BCC $EA			  ; 90 EA | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2F6
; Address: $C6B853
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2F6:
	LDX $2A58			; AE 58 2A | Load from absolute address into X register
	LDY $2A5A			; AC 5A 2A | Load from absolute address into Y register
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $2A88			; CC 88 2A | Compare Y register (absolute)
	BCS $06			  ; B0 06 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2F7
; Address: $C6B86A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2F7:
	JSR $37BE			; 20 BE 37 | Jump to subroutine
	BCC $EA			  ; 90 EA | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2F9
; Address: $C6B872
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2F9:
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	STA $2A5C			; 8D 5C 2A | Store accumulator to absolute address
	STZ $2A5E			; 9C 5E 2A | Store zero to absolute
	LDA $2A5E			; AD 5E 2A | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $24			  ; D0 24 | Branch if not equal
	LDA $2A58			; AD 58 2A | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A5C			; 6D 5C 2A | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2A5A			; AD 5A 2A | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A5C			; 6D 5C 2A | Add with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $2A88			; CC 88 2A | Compare Y register (absolute)
	BCS $06			  ; B0 06 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2FA
; Address: $C6B898
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2FA:
	JSR $37BE			; 20 BE 37 | Jump to subroutine
	BCC $0A			  ; 90 0A | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2FB
; Address: $C6B89E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2FB:
	LDA $2A5E			; AD 5E 2A | Load from absolute address into accumulator
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	STA $2A5E			; 8D 5E 2A | Store accumulator to absolute address
	LDA $2A5E			; AD 5E 2A | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $24			  ; D0 24 | Branch if not equal
	LDA $2A58			; AD 58 2A | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $2A5C			; ED 5C 2A | Subtract with carry (absolute)
	CMP $2A86			; CD 86 2A | Compare accumulator (absolute)
	BCC $0F			  ; 90 0F | Branch if carry clear
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2A5A			; AD 5A 2A | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $2A5C			; ED 5C 2A | Subtract with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2FC
; Address: $C6B8C4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2FC:
	JSR $37BE			; 20 BE 37 | Jump to subroutine
	BCC $0A			  ; 90 0A | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_2FD
; Address: $C6B8CA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_2FD:
	LDA $2A5E			; AD 5E 2A | Load from absolute address into accumulator
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	STA $2A5E			; 8D 5E 2A | Store accumulator to absolute address
	LDA $2A5C			; AD 5C 2A | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $2A5C			; 8D 5C 2A | Store accumulator to absolute address
	LDA $2A5E			; AD 5E 2A | Load from absolute address into accumulator
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BCC $96			  ; 90 96 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_300
; Address: $C6B8F0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_300:
	JSL $C3447C		  ; 22 7C 44 C3 | Jump to subroutine long
	BCS $14			  ; B0 14 | Branch if carry set
	LDA $2AA6			; AD A6 2A | Load from absolute address into accumulator
	BPL $07			  ; 10 07 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $2AA6			; 8D A6 2A | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_303
; Address: $C6B90B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_303:
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_304
; Address: $C6B910
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_304:
	DEX				  ; CA | Decrement X register
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $2A82			; 6D 82 2A | Add with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $2A58			; 8E 58 2A | Store X register to absolute address
	STY $2A5A			; 8C 5A 2A | Store Y register to absolute address
	JMP $3809			; 4C 09 38 | Jump to address
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $2A84			; 6D 84 2A | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	STX $2A58			; 8E 58 2A | Store X register to absolute address
	STY $2A5A			; 8C 5A 2A | Store Y register to absolute address
	JMP $3809			; 4C 09 38 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_307
; Address: $C6B944
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_307:
	LDA $2AA6			; AD A6 2A | Load from absolute address into accumulator
	BPL $07			  ; 10 07 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $2AA6			; 8D A6 2A | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_30A
; Address: $C6B959
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_30A:
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $2A86			; 6D 86 2A | Add with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $2A58			; 8E 58 2A | Store X register to absolute address
	STY $2A5A			; 8C 5A 2A | Store Y register to absolute address
	JMP $39DA			; 4C DA 39 | Jump to address
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_30B
; Address: $C6B978
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_30B:
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $2A88			; 6D 88 2A | Add with carry (absolute)
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $2A58			; 8E 58 2A | Store X register to absolute address
	STY $2A5A			; 8C 5A 2A | Store Y register to absolute address
	JMP $39DA			; 4C DA 39 | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ASL $06B0			; 0E B0 06 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_30D
; Address: $C6B9A3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_30D:
	JSR $39AE			; 20 AE 39 | Jump to subroutine
	JMP $39AA			; 4C AA 39 | Jump to address
	CLC				  ; 18 | Clear carry flag
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_30E
; Address: $C6B9AE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_30E:
	STY $338C			; 8C 8C 33 | Store Y register to absolute address
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	BMI $0C			  ; 30 0C | Branch if negative
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	CPX $338C			; EC 8C 33 | Compare X register (absolute)
	BCS $F0			  ; B0 F0 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_30F
; Address: $C6B9C2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_30F:
	JMP $37EA			; 4C EA 37 | Jump to address
	STY $338C			; 8C 8C 33 | Store Y register to absolute address
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	BMI $F5			  ; 30 F5 | Branch if negative
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	CPX $338C			; EC 8C 33 | Compare X register (absolute)
	BCC $F0			  ; 90 F0 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_310
; Address: $C6B9DA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_310:
	JSR $3993			; 20 93 39 | Jump to subroutine
	BCS $13			  ; B0 13 | Branch if carry set
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BNE $0C			  ; D0 0C | Branch if not equal
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	AND $2A68			; 2D 68 2A | Logical AND with accumulator (absolute)
	BNE $0D			  ; D0 0D | Branch if not equal
	JMP $3A3B			; 4C 3B 3A | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_315
; Address: $C6BA05
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_315:
	LDX $2A58			; AE 58 2A | Load from absolute address into X register
	LDY $2A5A			; AC 5A 2A | Load from absolute address into Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CMP $2A84			; CD 84 2A | Compare accumulator (absolute)
	BCS $06			  ; B0 06 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_316
; Address: $C6BA18
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_316:
	JSR $3993			; 20 93 39 | Jump to subroutine
	BCC $EE			  ; 90 EE | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_318
; Address: $C6BA20
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_318:
	LDX $2A58			; AE 58 2A | Load from absolute address into X register
	LDY $2A5A			; AC 5A 2A | Load from absolute address into Y register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CMP $2A82			; CD 82 2A | Compare accumulator (absolute)
	BCC $06			  ; 90 06 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_319
; Address: $C6BA33
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_319:
	JSR $3993			; 20 93 39 | Jump to subroutine
	BCC $EE			  ; 90 EE | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_31C
; Address: $C6BA41
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_31C:
	STZ $2A5E			; 9C 5E 2A | Store zero to absolute
	LDA $2A5E			; AD 5E 2A | Load from absolute address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $27			  ; D0 27 | Branch if not equal
	LDA $2A58			; AD 58 2A | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A5C			; 6D 5C 2A | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2A5A			; AD 5A 2A | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A5C			; 6D 5C 2A | Add with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CMP $2A84			; CD 84 2A | Compare accumulator (absolute)
	BCS $06			  ; B0 06 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_31D
; Address: $C6BA64
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_31D:
	JSR $3993			; 20 93 39 | Jump to subroutine
	BCC $0A			  ; 90 0A | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_31E
; Address: $C6BA6A
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_31E:
	LDA $2A5E			; AD 5E 2A | Load from absolute address into accumulator
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	STA $2A5E			; 8D 5E 2A | Store accumulator to absolute address
	LDA $2A5E			; AD 5E 2A | Load from absolute address into accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $27			  ; D0 27 | Branch if not equal
	LDA $2A58			; AD 58 2A | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $2A5C			; ED 5C 2A | Subtract with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CMP $2A82			; CD 82 2A | Compare accumulator (absolute)
	BCC $0E			  ; 90 0E | Branch if carry clear
	LDA $2A5A			; AD 5A 2A | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $2A5C			; ED 5C 2A | Subtract with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_31F
; Address: $C6BA93
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_31F:
	JSR $3993			; 20 93 39 | Jump to subroutine
	BCC $0A			  ; 90 0A | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_320
; Address: $C6BA99
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_320:
	LDA $2A5E			; AD 5E 2A | Load from absolute address into accumulator
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	STA $2A5E			; 8D 5E 2A | Store accumulator to absolute address
	INC $2A5C			; EE 5C 2A | Increment (absolute)
	INC $2A5C			; EE 5C 2A | Increment (absolute)
	LDA $2A5E			; AD 5E 2A | Load from absolute address into accumulator
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BCC $94			  ; 90 94 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_323
; Address: $C6BABB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_323:
	LDA $2AA6			; AD A6 2A | Load from absolute address into accumulator
	BPL $07			  ; 10 07 | Branch if positive
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $2AA6			; 8D A6 2A | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_326
; Address: $C6BAD0
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_326:
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $2A88			; 6D 88 2A | Add with carry (absolute)
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $2A58			; 8E 58 2A | Store X register to absolute address
	STY $2A5A			; 8C 5A 2A | Store Y register to absolute address
	JMP $39DA			; 4C DA 39 | Jump to address
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $2A86			; 6D 86 2A | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $2A58			; 8E 58 2A | Store X register to absolute address
	STY $2A5A			; 8C 5A 2A | Store Y register to absolute address
	JMP $39DA			; 4C DA 39 | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	LDA $2A70			; AD 70 2A | Load from absolute address into accumulator
	LDY $2A78			; AC 78 2A | Load from absolute address into Y register
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	PLA				  ; 68 | Pull accumulator from stack
	STA $2A70			; 8D 70 2A | Store accumulator to absolute address
	LDA $2A72			; AD 72 2A | Load from absolute address into accumulator
	STA $2BF2,X		  ; 9D F2 2B | Store accumulator to absolute,X
	STX $2A78			; 8E 78 2A | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_327
; Address: $C6BB22
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_327:
	STZ $2A74			; 9C 74 2A | Store zero to absolute
	LDA $2A86			; AD 86 2A | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	ADC $2A82			; 6D 82 2A | Add with carry (absolute)
	STA $2A58			; 8D 58 2A | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ADC $2A84			; 6D 84 2A | Add with carry (absolute)
	STA $2A5A			; 8D 5A 2A | Store accumulator to absolute address
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	BMI $24			  ; 30 24 | Branch if negative
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $2A5A			; EC 5A 2A | Compare X register (absolute)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	LDA $2A58			; AD 58 2A | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	CMP $2A88			; CD 88 2A | Compare accumulator (absolute)
	BCS $1D			  ; B0 1D | Branch if carry set
	STA $2A58			; 8D 58 2A | Store accumulator to absolute address
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2A5A			; AD 5A 2A | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $2A5A			; 8D 5A 2A | Store accumulator to absolute address
	JMP $3B3B			; 4C 3B 3B | Jump to address
	INY				  ; C8 | Increment Y register
	CPX $2A78			; EC 78 2A | Compare X register (absolute)
	BNE $D6			  ; D0 D6 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_328
; Address: $C6BB71
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_328:
	LDX $7F64			; AE 64 7F | Load from absolute address into X register
	LDY $32FC,X		  ; BC FC 32 | Load from absolute,X into Y register
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	STA $28F0,Y		  ; 99 F0 28 | Store accumulator to absolute,Y
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_329
; Address: $C6BB7F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_329:
	JSR $A62D			; 20 2D A6 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	BNE $2B			  ; D0 2B | Branch if not equal
	LDA $2A40,Y		  ; B9 40 2A | Load from absolute,Y into accumulator
	AND #$0C			 ; 29 0C | Logical AND with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDX $7F64			; AE 64 7F | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_32A
; Address: $C6BB93
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_32A:
	LDY $32FC,X		  ; BC FC 32 | Load from absolute,X into Y register
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	STA $28F0,Y		  ; 99 F0 28 | Store accumulator to absolute,Y
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2A72			; AD 72 2A | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	STA $2BF2,X		  ; 9D F2 2B | Store accumulator to absolute,X
	LDA $28D8,Y		  ; B9 D8 28 | Load from absolute,Y into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 3B A9 00 | Load from absolute long,X into accumulator
	BPL $0C			  ; 10 0C | Branch if positive
	LDX $2A			  ; A6 2A | Load from zero page into X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_32B
; Address: $C6BBBB
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_32B:
	ORA #$3C			 ; 09 3C | Logical OR with accumulator (immediate)
	BIT $2C3C			; 2C 3C 2C | Test bits in accumulator (absolute)
	BIT $2C3C			; 2C 3C 2C | Test bits in accumulator (absolute)
	BIT $2C3C			; 2C 3C 2C | Test bits in accumulator (absolute)
	EOR $2C3C,Y		  ; 59 3C 2C | Exclusive OR with accumulator (absolute,Y)
	LDX $2A74			; AE 74 2A | Load from absolute address into X register
	LDA $2AAC,X		  ; BD AC 2A | Load from absolute,X into accumulator
	STA $33BE			; 8D BE 33 | Store accumulator to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $33BC			; 8D BC 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_32C
; Address: $C6BBE4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_32C:
	JSR $3C17			; 20 17 3C | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ADC $33BC			; 6D BC 33 | Add with carry (absolute)
	STA $33BC			; 8D BC 33 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_32D
; Address: $C6BBEF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_32D:
	LDX $2A74			; AE 74 2A | Load from absolute address into X register
	LDA $2AAC,X		  ; BD AC 2A | Load from absolute,X into accumulator
	STA $33BC			; 8D BC 33 | Store accumulator to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $33BE			; 8D BE 33 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_32E
; Address: $C6BBFE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_32E:
	JSR $3C17			; 20 17 3C | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ADC $33BE			; 6D BE 33 | Add with carry (absolute)
	STA $33BE			; 8D BE 33 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_32F
; Address: $C6BC09
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_32F:
	LDA $2998,Y		  ; B9 98 29 | Load from absolute,Y into accumulator
	STA $33BC			; 8D BC 33 | Store accumulator to absolute address
	LDA $29B0,Y		  ; B9 B0 29 | Load from absolute,Y into accumulator
	STA $33BE			; 8D BE 33 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_331
; Address: $C6BC17
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_331:
	LDA $2950,Y		  ; B9 50 29 | Load from absolute,Y into accumulator
	BEQ $0F			  ; F0 0F | Branch if equal
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $2920,Y		  ; B9 20 29 | Load from absolute,Y into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LDA $2950,Y		  ; B9 50 29 | Load from absolute,Y into accumulator
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_335
; Address: $C6BC30
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_335:
	JSL $C3302E		  ; 22 2E 30 C3 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_337
; Address: $C6BC3C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_337:
	JSL $C45A16		  ; 22 16 5A C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $2060,X		  ; FE 60 20 | Increment (absolute,X)
	AND $B93C			; 2D 3C B9 | Logical AND with accumulator (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$22			 ; 29 22 | Logical AND with accumulator (immediate)
	PHY				  ; 5A | Push Y register to stack
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	INC $AD60,X		  ; FE 60 AD | Increment (absolute,X)
	LDX $8D33,Y		  ; BE 33 8D | Load from absolute,Y into X register
	STZ $6033,X		  ; 9E 33 60 | Store zero to absolute,X
	LDA $33BE			; AD BE 33 | Load from absolute address into accumulator
	STA $33F6			; 8D F6 33 | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_338
; Address: $C6BC60
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_338:
	ORA $33A8			; 0D A8 33 | Logical OR with accumulator (absolute)
	STA $33A8			; 8D A8 33 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_339
; Address: $C6BC67
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_339:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	LDA $33A8			; AD A8 33 | Load from absolute address into accumulator
	STZ $33A8			; 9C A8 33 | Store zero to absolute
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BRA $B0			  ; 80 B0 | Branch always
	ORA $00C9,Y		  ; 19 C9 00 | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	BCS $19			  ; B0 19 | Branch if carry set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_33A
; Address: $C6BC7F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_33A:
	JSR $19B0			; 20 B0 19 | Jump to subroutine
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BPL $B0			  ; 10 B0 | Branch if positive
	INC				  ; 1A | Increment accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BCS $20			  ; B0 20 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_344
; Address: $C6BCB4
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_344:
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $38			  ; F0 38 | Branch if equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $04			  ; 80 04 | Branch always
	ROL $749C			; 2E 9C 74 | Rotate left (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	STA $2A64			; 8D 64 2A | Store accumulator to absolute address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	ORA ($9E,X)		  ; 01 9E | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	ROL				  ; 2A | Rotate left (accumulator)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BNE $F9			  ; D0 F9 | Branch if not equal
	LDA $1E			  ; A5 1E | Load from zero page into accumulator
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	STA $2A82			; 8D 82 2A | Store accumulator to absolute address
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	STA $2A84			; 8D 84 2A | Store accumulator to absolute address
	LDA $1E			  ; A5 1E | Load from zero page into accumulator
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	STA $2A86			; 8D 86 2A | Store accumulator to absolute address
	LDA $1C			  ; A5 1C | Load from zero page into accumulator
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	STA $2A88			; 8D 88 2A | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_345
; Address: $C6BCF4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_345:
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $60			  ; F0 60 | Branch if equal
	LDA $0C			  ; A5 0C | Load from zero page into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $B485			; 0D 85 B4 | Logical OR with accumulator (absolute)
	STA $0C			  ; 85 0C | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_346
; Address: $C6BD05
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_346:
	STZ $2A6C			; 9C 6C 2A | Store zero to absolute
	STZ $2A6A			; 9C 6A 2A | Store zero to absolute
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $28C0,X		  ; BD C0 28 | Load from absolute,X into accumulator
	BEQ $1C			  ; F0 1C | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $1D			  ; F0 1D | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$DF			 ; A9 DF | Load immediate value into accumulator
	JMP $3D37			; 4C 37 3D | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $2908,X		  ; 9D 08 29 | Store accumulator to absolute,X
	STA $2A72			; 8D 72 2A | Store accumulator to absolute address
	JMP $3D5B			; 4C 5B 3D | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	JMP $3D3A			; 4C 3A 3D | Jump to address
	LDA #$E0			 ; A9 E0 | Game work RAM access
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $9D			  ; 80 9D | Branch always
	PHP				  ; 08 | Push processor status to stack
	AND #$18			 ; 29 18 | Logical AND with accumulator (immediate)
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2A72			; 8D 72 2A | Store accumulator to absolute address
	LDA $2A74			; AD 74 2A | Load from absolute address into accumulator
	STA $2A76			; 8D 76 2A | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_349
; Address: $C6BD51
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_349:
	JSL $C33E42		  ; 22 42 3E C3 | Jump to subroutine long
	LDA $2BF2,Y		  ; B9 F2 2B | Load from absolute,Y into accumulator
	STA $2A70			; 8D 70 2A | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_34A
; Address: $C6BD5C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_34A:
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	BPL $0D			  ; 10 0D | Branch if positive
	LDX $2A74			; AE 74 2A | Load from absolute address into X register
	STA $2AAA,X		  ; 9D AA 2A | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	STX $2A74			; 8E 74 2A | Store X register to absolute address
	STY $2A7A			; 8C 7A 2A | Store Y register to absolute address
	LDA #$D3			 ; A9 D3 | Load immediate value into accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $22			  ; 80 22 | Branch always
	STA $C32B			; 8D 2B C3 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_34B
; Address: $C6BD7B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_34B:
	LDX $2A7A			; AE 7A 2A | Load from absolute address into X register
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_34C
; Address: $C6BD82
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_34C:
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,X		  ; 9D F2 2B | Store accumulator to absolute,X
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	BPL $0A			  ; 10 0A | Branch if positive
	LDX $2A74			; AE 74 2A | Load from absolute address into X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	STX $2A74			; 8E 74 2A | Store X register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_34D
; Address: $C6BD96
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_34D:
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	BPL $0A			  ; 10 0A | Branch if positive
	PHX				  ; DA | Push X register to stack
	LDX $2A74			; AE 74 2A | Load from absolute address into X register
	BEQ $03			  ; F0 03 | Branch if equal
	STA $2AA8,X		  ; 9D A8 2A | Store accumulator to absolute,X
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_34E
; Address: $C6BDA5
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_34E:
	LDA $2A86			; AD 86 2A | Load from absolute address into accumulator
	ORA $2A82			; 0D 82 2A | Logical OR with accumulator (absolute)
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $2A86			; AD 86 2A | Load from absolute address into accumulator
	ORA $2A84			; 0D 84 2A | Logical OR with accumulator (absolute)
	STA $02			  ; 85 02 | Store accumulator to zero page
	LDA $2A74			; AD 74 2A | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY $00			  ; A4 00 | Load from zero page into Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $02			  ; C4 02 | Compare Y register (zero page)
	BCS $0B			  ; B0 0B | Branch if carry set
	LDA $2BF0,Y		  ; B9 F0 2B | Load from absolute,Y into accumulator
	BPL $F5			  ; 10 F5 | Branch if positive
	DEX				  ; CA | Decrement X register
	BPL $F2			  ; 10 F2 | Branch if positive
	JMP $3DE6			; 4C E6 3D | Jump to address
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	CMP $2A88			; CD 88 2A | Compare accumulator (absolute)
	BCS $13			  ; B0 13 | Branch if carry set
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $02			  ; 85 02 | Store accumulator to zero page
	JMP $3DBB			; 4C BB 3D | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_34F
; Address: $C6BDE6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_34F:
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STY $2A78			; 8C 78 2A | Store Y register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_350
; Address: $C6BDEC
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_350:
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	ROL $AD6B			; 2E 6B AD | Rotate left (absolute)
	STX $2A			  ; 86 2A | Store X register to zero page
	ORA $2A82			; 0D 82 2A | Logical OR with accumulator (absolute)
	STA $2A58			; 8D 58 2A | Store accumulator to absolute address
	LDA $2A86			; AD 86 2A | Load from absolute address into accumulator
	ORA $2A84			; 0D 84 2A | Logical OR with accumulator (absolute)
	STA $2A5A			; 8D 5A 2A | Store accumulator to absolute address
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	LDY $2A58			; AC 58 2A | Load from absolute address into Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $2A5A			; CC 5A 2A | Compare Y register (absolute)
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $2BF2,Y		  ; B9 F2 2B | Load from absolute,Y into accumulator
	BPL $F4			  ; 10 F4 | Branch if positive
	INX				  ; E8 | Increment X register
	CPY $2A78			; CC 78 2A | Compare Y register (absolute)
	BEQ $1F			  ; F0 1F | Branch if equal
	JMP $3E0A			; 4C 0A 3E | Jump to address
	LDA $2A58			; AD 58 2A | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	CMP $2A88			; CD 88 2A | Compare accumulator (absolute)
	BCS $10			  ; B0 10 | Branch if carry set
	STA $2A58			; 8D 58 2A | Store accumulator to absolute address
	LDA $2A5A			; AD 5A 2A | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $2A5A			; 8D 5A 2A | Store accumulator to absolute address
	JMP $3E07			; 4C 07 3E | Jump to address
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_351
; Address: $C6BE42
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_351:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STZ $2A9C			; 9C 9C 2A | Store zero to absolute
	LDX $2A74			; AE 74 2A | Load from absolute address into X register
	LDA $2AAA,X		  ; BD AA 2A | Load from absolute,X into accumulator
	BPL $03			  ; 10 03 | Branch if positive
	INC $2A9C			; EE 9C 2A | Increment (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_352
; Address: $C6BE57
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_352:
	STA $2A92			; 8D 92 2A | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$18			 ; 29 18 | Logical AND with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $2A90			; 8D 90 2A | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$E0			 ; 29 E0 | Game work RAM access
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $2A94			; 8D 94 2A | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A96			; 8D 96 2A | Store accumulator to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	STA $2A98			; 8D 98 2A | Store accumulator to absolute address
	STZ $2A9A			; 9C 9A 2A | Store zero to absolute
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A9A			; 8D 9A 2A | Store accumulator to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_353
; Address: $C6BE8F
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_353:
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $28C0,X		  ; BD C0 28 | Load from absolute,X into accumulator
	BEQ $1C			  ; F0 1C | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $17			  ; F0 17 | Branch if equal
	LDA $2908,X		  ; BD 08 29 | Load from absolute,X into accumulator
	BEQ $12			  ; F0 12 | Branch if equal
	LDY $28F0,X		  ; BC F0 28 | Load from absolute,X into Y register
	BEQ $0D			  ; F0 0D | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	LDA $2BF2,Y		  ; B9 F2 2B | Load from absolute,Y into accumulator
	BPL $08			  ; 10 08 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_354
; Address: $C6BEB3
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_354:
	LDA $2848,X		  ; BD 48 28 | Load from absolute,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $2848,X		  ; BD 48 28 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($98,X)		  ; 01 98 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	ORA $F2B9			; 0D B9 F2 | Logical OR with accumulator (absolute)
	BPL $F1			  ; 10 F1 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_355
; Address: $C6BED8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_355:
	JSL $C33F03		  ; 22 03 3F C3 | Jump to subroutine long
	JMP $3EAB			; 4C AB 3E | Jump to address
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	BEQ $1C			  ; F0 1C | Branch if equal
	DEC $2920,X		  ; DE 20 29 | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_357
; Address: $C6BEEB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_357:
	JSL $C32ACE		  ; 22 CE 2A C3 | Jump to subroutine long
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2890,X		  ; BD 90 28 | Load from absolute,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($A8,X)		  ; 01 A8 | Logical OR with accumulator ((zero page,X))
	STA $28F0,X		  ; 9D F0 28 | Store accumulator to absolute,X
	JMP $3EC8			; 4C C8 3E | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_358
; Address: $C6BF03
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_358:
	PHX				  ; DA | Push X register to stack
	PHX				  ; DA | Push X register to stack
	STY $3392			; 8C 92 33 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_359
; Address: $C6BF08
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_359:
	JSL $C329CF		  ; 22 CF 29 C3 | Jump to subroutine long
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	LDY $338C			; AC 8C 33 | Load from absolute address into Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $338E			; CC 8E 33 | Compare Y register (absolute)
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $2BF2,Y		  ; B9 F2 2B | Load from absolute,Y into accumulator
	BPL $F4			  ; 10 F4 | Branch if positive
	INX				  ; E8 | Increment X register
	CPY $3392			; CC 92 33 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_35A
; Address: $C6BF22
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_35A:
	BEQ $1F			  ; F0 1F | Branch if equal
	JMP $3F12			; 4C 12 3F | Jump to address
	LDA $338C			; AD 8C 33 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	CMP $3390			; CD 90 33 | Compare accumulator (absolute)
	BCS $10			  ; B0 10 | Branch if carry set
	STA $338C			; 8D 8C 33 | Store accumulator to absolute address
	LDA $338E			; AD 8E 33 | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $338E			; 8D 8E 33 | Store accumulator to absolute address
	JMP $3F0F			; 4C 0F 3F | Jump to address
	PLY				  ; 7A | Pull Y register from stack
	PHX				  ; DA | Push X register to stack
	LDA $29F8,Y		  ; B9 F8 29 | Load from absolute,Y into accumulator
	BEQ $2B			  ; F0 2B | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_35B
; Address: $C6BF4A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_35B:
	JSL $C31AFC		  ; 22 FC 1A C3 | Jump to subroutine long
	BCC $05			  ; 90 05 | Branch if carry clear
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	BCS $29			  ; B0 29 | Branch if carry set
	LDA $2A10,Y		  ; B9 10 2A | Load from absolute,Y into accumulator
	BEQ $1B			  ; F0 1B | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_35C
; Address: $C6BF5A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_35C:
	JSL $C31AFC		  ; 22 FC 1A C3 | Jump to subroutine long
	BCC $05			  ; 90 05 | Branch if carry clear
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	BCS $29			  ; B0 29 | Branch if carry set
	LDA $2A10,Y		  ; B9 10 2A | Load from absolute,Y into accumulator
	BEQ $0B			  ; F0 0B | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_35D
; Address: $C6BF6A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_35D:
	JSL $C31AFC		  ; 22 FC 1A C3 | Jump to subroutine long
	BCC $05			  ; 90 05 | Branch if carry clear
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	BCS $29			  ; B0 29 | Branch if carry set
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_35E
; Address: $C6BF78
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_35E:
	STZ $2A74			; 9C 74 2A | Store zero to absolute
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $28D8,X		  ; BD D8 28 | Load from absolute,X into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_35F
; Address: $C6BF87
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_35F:
	SBC $3F			  ; E5 3F | Subtract with carry (zero page)
	ORA $40			  ; 05 40 | Logical OR with accumulator (zero page)
	AND $4140			; 2D 40 41 | Logical AND with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 40 9F 40 | Store accumulator to absolute long,X
	STA $F63F,X		  ; 9D 3F F6 | Store accumulator to absolute,X
	LSR $7540			; 4E 40 75 | Logical shift right (absolute)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_360
; Address: $C6BF9B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_360:
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	LDA $28F0,Y		  ; B9 F0 28 | Load from absolute,Y into accumulator
	BNE $43			  ; D0 43 | Branch if not equal
	LDX $29B0,Y		  ; BE B0 29 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_362
; Address: $C6BFAC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_362:
	JSL $C446D6		  ; 22 D6 46 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCS $06			  ; B0 06 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_364
; Address: $C6BFC1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_364:
	LDA $28F0,Y		  ; B9 F0 28 | Load from absolute,Y into accumulator
	BNE $1F			  ; D0 1F | Branch if not equal
	LDX $29B0,Y		  ; BE B0 29 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_366
; Address: $C6BFD0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_366:
	JSL $C446D6		  ; 22 D6 46 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCS $06			  ; B0 06 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_368
; Address: $C6BFE5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_368:
	STZ $2A74			; 9C 74 2A | Store zero to absolute
	LDA $28F0,X		  ; BD F0 28 | Load from absolute,X into accumulator
	STA $2A78			; 8D 78 2A | Store accumulator to absolute address
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_36A
; Address: $C6BFF6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_36A:
	LDA $28F0,Y		  ; B9 F0 28 | Load from absolute,Y into accumulator
	BNE $EA			  ; D0 EA | Branch if not equal
	LDA $29C8,X		  ; BD C8 29 | Load from absolute,X into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_36B
; Address: $C6C005
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_36B:
	LDA $28F0,Y		  ; B9 F0 28 | Load from absolute,Y into accumulator
	BNE $DB			  ; D0 DB | Branch if not equal
	LDX $29B0,Y		  ; BE B0 29 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_36C
; Address: $C6C00D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_36C:
	JSL $C446A4		  ; 22 A4 46 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	LDX $33D6			; AE D6 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_36D
; Address: $C6C017
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_36D:
	CPX $33D8			; EC D8 33 | Compare X register (absolute)
	BNE $05			  ; D0 05 | Branch if not equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	CMP #$0C			 ; C9 0C | Compare accumulator (immediate)
	BCC $01			  ; 90 01 | Branch if carry clear
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_36E
; Address: $C6C02D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_36E:
	LDA $28F0,Y		  ; B9 F0 28 | Load from absolute,Y into accumulator
	BNE $B3			  ; D0 B3 | Branch if not equal
	LDA $29B0,X		  ; BD B0 29 | Load from absolute,X into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address
	CMP $2A76			; CD 76 2A | Compare accumulator (absolute)
	BCS $66			  ; B0 66 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_36F
; Address: $C6C041
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_36F:
	LDA $28F0,Y		  ; B9 F0 28 | Load from absolute,Y into accumulator
	BNE $9F			  ; D0 9F | Branch if not equal
	LDA $29B0,X		  ; BD B0 29 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_371
; Address: $C6C04E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_371:
	LDA $28F0,Y		  ; B9 F0 28 | Load from absolute,Y into accumulator
	BNE $92			  ; D0 92 | Branch if not equal
	LDA $2950,Y		  ; B9 50 29 | Load from absolute,Y into accumulator
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $339E			; AD 9E 33 | Load from absolute address into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_372
; Address: $C6C061
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_372:
	PHA				  ; 48 | Push accumulator to stack
	LDA $339E			; AD 9E 33 | Load from absolute address into accumulator
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_373
; Address: $C6C06B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_373:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_374
; Address: $C6C075
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_374:
	LDA $28F0,Y		  ; B9 F0 28 | Load from absolute,Y into accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $3FE5			; 4C E5 3F | Jump to address
	LDA $2950,Y		  ; B9 50 29 | Load from absolute,Y into accumulator
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $33F6			; AD F6 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_375
; Address: $C6C085
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_375:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_376
; Address: $C6C08B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_376:
	PHA				  ; 48 | Push accumulator to stack
	LDA $33F6			; AD F6 33 | Load from absolute address into accumulator
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_377
; Address: $C6C095
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_377:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_37A
; Address: $C6C0A6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_37A:
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	BMI $09			  ; 30 09 | Branch if negative
	CMP $2A76			; CD 76 2A | Compare accumulator (absolute)
	BCS $F5			  ; B0 F5 | Branch if carry set
	STA $2A74			; 8D 74 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_37C
; Address: $C6C0B9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_37C:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CMP $2AAC,X		  ; DD AC 2A | Compare accumulator (absolute,X)
	BEQ $0D			  ; F0 0D | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $2A76			; EC 76 2A | Compare X register (absolute)
	BCC $F2			  ; 90 F2 | Branch if carry clear
	STZ $2A74			; 9C 74 2A | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_37D
; Address: $C6C0CE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_37D:
	STX $2A74			; 8E 74 2A | Store X register to absolute address
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_37E
; Address: $C6C0D3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_37E:
	LDA $2A60			; AD 60 2A | Load from absolute address into accumulator
	BNE $14			  ; D0 14 | Branch if not equal
	LDX #$3C			 ; A2 3C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_380
; Address: $C6C0DF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_380:
	JSL $C3475D		  ; 22 5D 47 C3 | Jump to subroutine long
	LDA $2A68			; AD 68 2A | Load from absolute address into accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_384
; Address: $C6C0F7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_384:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHP				  ; 08 | Push processor status to stack
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDX #$3C			 ; A2 3C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_386
; Address: $C6C111
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_386:
	JSL $C3475D		  ; 22 5D 47 C3 | Jump to subroutine long
	LDA $2A68			; AD 68 2A | Load from absolute address into accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	DEX				  ; CA | Decrement X register
	BNE $F0			  ; D0 F0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_388
; Address: $C6C121
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_388:
	JSL $C3475D		  ; 22 5D 47 C3 | Jump to subroutine long
	LDA $2A68			; AD 68 2A | Load from absolute address into accumulator
	BEQ $F3			  ; F0 F3 | Branch if equal
	AND #$60			 ; 29 60 | Logical AND with accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $2D			  ; 10 2D | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	BEQ $21			  ; F0 21 | PPU graphics register access
	LDA #$C3			 ; A9 C3 | Load immediate value into accumulator
	CMP $33FA			; CD FA 33 | Compare accumulator (absolute)
	BNE $08			  ; D0 08 | Branch if not equal
	LDA $33F8			; AD F8 33 | Load from absolute address into accumulator
	CMP #$BB			 ; C9 BB | Compare accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal
	LDA $33F8			; AD F8 33 | Load from absolute address into accumulator
	STA $001D9E		  ; 8F 9E 1D 00 | Store accumulator to absolute long address
	LDA $33FA			; AD FA 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_389
; Address: $C6C15B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_389:
	STA $001DA0		  ; 8F A0 1D 00 | Store accumulator to absolute long address
	STZ $AB1D,X		  ; 9E 1D AB | Store zero to absolute,X
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_38A
; Address: $C6C16A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_38A:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHP				  ; 08 | Push processor status to stack
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDX #$3C			 ; A2 3C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_38C
; Address: $C6C184
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_38C:
	JSL $C3475D		  ; 22 5D 47 C3 | Jump to subroutine long
	LDA $2A68			; AD 68 2A | Load from absolute address into accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	DEX				  ; CA | Decrement X register
	BNE $F0			  ; D0 F0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_38E
; Address: $C6C194
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_38E:
	JSL $C3475D		  ; 22 5D 47 C3 | Jump to subroutine long
	LDA $2A68			; AD 68 2A | Load from absolute address into accumulator
	BEQ $F3			  ; F0 F3 | Branch if equal
	AND #$60			 ; 29 60 | Logical AND with accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_38F
; Address: $C6C1B1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_38F:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $2950,X		  ; BD 50 29 | Load from absolute,X into accumulator
	BEQ $18			  ; F0 18 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_391
; Address: $C6C1BF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_391:
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $2998,X		  ; BD 98 29 | Load from absolute,X into accumulator
	STA $02			  ; 85 02 | Store accumulator to zero page
	LDA $2968,X		  ; BD 68 29 | Load from absolute,X into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($7A,X)		  ; 41 7A | Exclusive OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_392
; Address: $C6C1D4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_392:
	WDM #$9A			 ; 42 9A | Reserved instruction
	WDM #$F2			 ; 42 F2 | Reserved instruction
	WDM #$1E			 ; 42 1E | Reserved instruction
	WDM #$15			 ; 42 15 | Reserved instruction
	WDM #$1D			 ; 42 1D | Reserved instruction
	WDM #$25			 ; 42 25 | Reserved instruction
	WDM #$2D			 ; 42 2D | Reserved instruction
	WDM #$36			 ; 42 36 | Reserved instruction
	ADC ($43,X)		  ; 61 43 | Add with carry ((zero page,X))
	STA $9F43			; 8D 43 9F | Store accumulator to absolute address
	AND ($44,X)		  ; 21 44 | Logical AND with accumulator ((zero page,X))
	AND $4B44,Y		  ; 39 44 4B | Logical AND with accumulator (absolute,Y)
	LDA ($43),Y		  ; B1 43 | Load from (zero page),Y into accumulator
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $2BBA			; AD BA 2B | Load from absolute address into accumulator
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_395
; Address: $C6C215
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_395:
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $2BBC			; AD BC 2B | Load from absolute address into accumulator
	JMP $4208			; 4C 08 42 | Hardware register operation
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $2BBE			; AD BE 2B | Load from absolute address into accumulator
	JMP $4208			; 4C 08 42 | Hardware register operation
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $2BC0			; AD C0 2B | Load from absolute address into accumulator
	JMP $4208			; 4C 08 42 | Hardware register operation
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $2BC2			; AD C2 2B | Load from absolute address into accumulator
	JMP $4208			; 4C 08 42 | Hardware register operation
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_396
; Address: $C6C236
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_396:
	JSL $C446A4		  ; 22 A4 46 C4 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	STX $00			  ; 86 00 | Store X register to zero page
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_39A
; Address: $C6C24D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_39A:
	STA $02			  ; 85 02 | Store accumulator to zero page
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_39B
; Address: $C6C254
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_39B:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	INC $02			  ; E6 02 | Increment (zero page)
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	STA $2938,Y		  ; 99 38 29 | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_39C
; Address: $C6C265
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_39C:
	LDA $2A40,Y		  ; B9 40 2A | Load from absolute,Y into accumulator
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $2A40,Y		  ; 99 40 2A | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_39D
; Address: $C6C272
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_39D:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $2A40,X		  ; 3D 40 2A | Logical AND with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	STZ $2938,X		  ; 9E 38 29 | Store zero to absolute,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_39E
; Address: $C6C285
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_39E:
	LDA $2BB4			; AD B4 2B | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $02			  ; 85 02 | Store accumulator to zero page
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_39F
; Address: $C6C290
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_39F:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	LDA $02			  ; A5 02 | Load from zero page into accumulator
	STA $2920,Y		  ; 99 20 29 | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3A1
; Address: $C6C29B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3A1:
	JSL $C45A4A		  ; 22 4A 5A C4 | Jump to subroutine long
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2BB4			; 8D B4 2B | Store accumulator to absolute address
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	STA $2BB6			; 8D B6 2B | Store accumulator to absolute address
	BNE $03			  ; D0 03 | Branch if not equal
	STZ $2BB4			; 9C B4 2B | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3A2
; Address: $C6C2B2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3A2:
	JSL $C456E7		  ; 22 E7 56 C4 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA #$35			 ; A9 35 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3A3
; Address: $C6C2BE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3A3:
	JSR $424D			; 20 4D 42 | Hardware register operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	INC				  ; 1A | Increment accumulator
	CMP $02			  ; C5 02 | Compare accumulator (zero page)
	BCS $09			  ; B0 09 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3A4
; Address: $C6C2CC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3A4:
	JSR $44EE			; 20 EE 44 | Jump to subroutine
	BCC $F6			  ; 90 F6 | Branch if carry clear
	INX				  ; E8 | Increment X register
	JMP $42C7			; 4C C7 42 | Hardware register operation
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3A7
; Address: $C6C2E0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3A7:
	JSR $44EE			; 20 EE 44 | Jump to subroutine
	BCS $09			  ; B0 09 | Branch if carry set
	INC				  ; 1A | Increment accumulator
	CMP $2938,Y		  ; D9 38 29 | Compare accumulator (absolute,Y)
	BCS $06			  ; B0 06 | Branch if carry set
	JMP $42E0			; 4C E0 42 | Hardware register operation
	STA $2920,Y		  ; 99 20 29 | Store accumulator to absolute,Y
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3A9
; Address: $C6C2F3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3A9:
	JSL $C459E4		  ; 22 E4 59 C4 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2BB4			; 8D B4 2B | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3AA
; Address: $C6C2FE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3AA:
	JSL $C455FD		  ; 22 FD 55 C4 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	STX $00			  ; 86 00 | Store X register to zero page
	LDA $4197			; AD 97 41 | Load from absolute address into accumulator
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3AF
; Address: $C6C31E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3AF:
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $2BF0			; AD F0 2B | Load from absolute address into accumulator
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3B4
; Address: $C6C338
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3B4:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3B8
; Address: $C6C351
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3B8:
	JSL $C3B6C9		  ; 22 C9 B6 C3 | Jump to subroutine long
	BCC $09			  ; 90 09 | Branch if carry clear
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $2938,Y		  ; 99 38 29 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3BB
; Address: $C6C367
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3BB:
	JSL $C3B6C9		  ; 22 C9 B6 C3 | Jump to subroutine long
	BCC $09			  ; 90 09 | Branch if carry clear
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $2938,Y		  ; 99 38 29 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3BE
; Address: $C6C379
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3BE:
	JSL $C3303B		  ; 22 3B 30 C3 | Jump to subroutine long
	LDA $2BB2			; AD B2 2B | Load from absolute address into accumulator
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3C1
; Address: $C6C38D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3C1:
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA #$73			 ; A9 73 | Load immediate value into accumulator
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3C4
; Address: $C6C39F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3C4:
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA #$2C			 ; A9 2C | Load immediate value into accumulator
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3C8
; Address: $C6C3B3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3C8:
	LDA #$2F			 ; A9 2F | Load immediate value into accumulator
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3CB
; Address: $C6C3C3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3CB:
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA #$1A			 ; A9 1A | Load immediate value into accumulator
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3CE
; Address: $C6C3D5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3CE:
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA #$A0			 ; A9 A0 | Load immediate value into accumulator
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3D1
; Address: $C6C3E7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3D1:
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	BCC $F6			  ; 90 F6 | Branch if carry clear
	BEQ $F4			  ; F0 F4 | Branch if equal
	JMP $43E0			; 4C E0 43 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3D3
; Address: $C6C3FB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3D3:
	JSL $C3B6C9		  ; 22 C9 B6 C3 | Jump to subroutine long
	BCC $09			  ; 90 09 | Branch if carry clear
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $2938,Y		  ; 99 38 29 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3D6
; Address: $C6C411
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3D6:
	JSL $C3B6C9		  ; 22 C9 B6 C3 | Jump to subroutine long
	BCC $09			  ; 90 09 | Branch if carry clear
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $2938,Y		  ; 99 38 29 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3D8
; Address: $C6C421
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3D8:
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA $2BF0			; AD F0 2B | Load from absolute address into accumulator
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3DD
; Address: $C6C439
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3DD:
	STA $00			  ; 85 00 | Store accumulator to zero page
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3E1
; Address: $C6C44D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3E1:
	JSL $C33075		  ; 22 75 30 C3 | Jump to subroutine long
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3E9
; Address: $C6C474
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3E9:
	JSL $C331B9		  ; 22 B9 31 C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3F0
; Address: $C6C492
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3F0:
	JSL $C331B9		  ; 22 B9 31 C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3F1
; Address: $C6C498
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3F1:
	LDY $7F64			; AC 64 7F | Load from absolute address into Y register
	LDX $32FC,Y		  ; BE FC 32 | Load from absolute,Y into X register
	LDA $2968,X		  ; BD 68 29 | Load from absolute,X into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3F2
; Address: $C6C4A8
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3F2:
	ROL $45			  ; 26 45 | Rotate left (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	ROL $45			  ; 26 45 | Rotate left (zero page)
	LDA $2A8A			; AD 8A 2A | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3F4
; Address: $C6C4E0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3F4:
	JSR $44EE			; 20 EE 44 | Jump to subroutine
	BCC $F6			  ; 90 F6 | Branch if carry clear
	CMP $2A8A			; CD 8A 2A | Compare accumulator (absolute)
	BEQ $02			  ; F0 02 | Branch if equal
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3F6
; Address: $C6C4EE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3F6:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	LDA $2950,Y		  ; B9 50 29 | Load from absolute,Y into accumulator
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3F7
; Address: $C6C4F9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3F7:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	ADC $2950,Y		  ; 79 50 29 | Add with carry (absolute,Y)
	ADC $2950,Y		  ; 79 50 29 | Add with carry (absolute,Y)
	STA $70			  ; 85 70 | Store accumulator to zero page
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3F8
; Address: $C6C50B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3F8:
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	BEQ $01			  ; F0 01 | Branch if equal
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $70			  ; E4 70 | Compare X register (zero page)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3F9
; Address: $C6C521
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3F9:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3FA
; Address: $C6C526
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3FA:
	LDA $2A8A			; AD 8A 2A | Load from absolute address into accumulator
	INC				  ; 1A | Increment accumulator
	CMP $2A8C			; CD 8C 2A | Compare accumulator (absolute)
	BCC $08			  ; 90 08 | Branch if carry clear
	LDA $2A8C			; AD 8C 2A | Load from absolute address into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3FC
; Address: $C6C53B
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3FC:
	LDY $7F64			; AC 64 7F | Load from absolute address into Y register
	LDX $32FC,Y		  ; BE FC 32 | Load from absolute,Y into X register
	LDA $2968,X		  ; BD 68 29 | Load from absolute,X into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	EOR $60			  ; 45 60 | Exclusive OR with accumulator (zero page)
	STA ($45),Y		  ; 91 45 | Store accumulator to (zero page),Y
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3FD
; Address: $C6C568
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3FD:
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR $AD			  ; 45 AD | Exclusive OR with accumulator (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_3FF
; Address: $C6C583
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_3FF:
	JSR $44EE			; 20 EE 44 | Jump to subroutine
	BCC $F6			  ; 90 F6 | Branch if carry clear
	CMP $2A8A			; CD 8A 2A | Compare accumulator (absolute)
	BEQ $02			  ; F0 02 | Branch if equal
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_401
; Address: $C6C591
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_401:
	LDA $2A8A			; AD 8A 2A | Load from absolute address into accumulator
	DEC				  ; 3A | Decrement accumulator
	BPL $06			  ; 10 06 | Branch if positive
	LDA $2A8C			; AD 8C 2A | Load from absolute address into accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_403
; Address: $C6C5A1
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_403:
	LDY $7F64			; AC 64 7F | Load from absolute address into Y register
	LDX $32FC,Y		  ; BE FC 32 | Load from absolute,Y into X register
	LDY $2920,X		  ; BC 20 29 | Load from absolute,X into Y register
	STA $2920,X		  ; 9D 20 29 | Store accumulator to absolute,X
	STA $2A8A			; 8D 8A 2A | Store accumulator to absolute address
	INC				  ; 1A | Increment accumulator
	CMP $2A8C			; CD 8C 2A | Compare accumulator (absolute)
	BNE $2D			  ; D0 2D | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $2980,X		  ; 9D 80 29 | Store accumulator to absolute,X
	LDA $2A40,X		  ; BD 40 2A | Load from absolute,X into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BNE $21			  ; D0 21 | PPU graphics register access
	LDA $2A72			; AD 72 2A | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDY $2A78			; AC 78 2A | Load from absolute address into Y register
	LDA $2A70			; AD 70 2A | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_405
; Address: $C6C5D3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_405:
	JSL $C32A01		  ; 22 01 2A C3 | Jump to subroutine long
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	ORA $2A40,X		  ; 1D 40 2A | Logical OR with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X
	JMP $45EF			; 4C EF 45 | Jump to address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $2A40,X		  ; 3D 40 2A | Logical AND with accumulator (absolute,X)
	STA $2A40,X		  ; 9D 40 2A | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_406
; Address: $C6C5EF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_406:
	JSL $C31914		  ; 22 14 19 C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $04			  ; 80 04 | Branch always
	ROL $749C			; 2E 9C 74 | Rotate left (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_407
; Address: $C6C5FF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_407:
	JSL $C32ACE		  ; 22 CE 2A C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_408
; Address: $C6C606
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_408:
	JSL $C33C60		  ; 22 60 3C C3 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	STX $2A78			; 8E 78 2A | Store X register to absolute address
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	STA $2A70			; 8D 70 2A | Store accumulator to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_409
; Address: $C6C615
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_409:
	CPX $2A88			; EC 88 2A | Compare X register (absolute)
	BCC $1A			  ; 90 1A | Branch if carry clear
	LDA $2A88			; AD 88 2A | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $2A82			; 6D 82 2A | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	STX $2A78			; 8E 78 2A | Store X register to absolute address
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	STA $2A70			; 8D 70 2A | Store accumulator to absolute address
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	BMI $0D			  ; 30 0D | Branch if negative

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_40E
; Address: $C6C64C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_40E:
	LDA $2A88			; AD 88 2A | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $2A82			; 6D 82 2A | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	STX $2A78			; 8E 78 2A | Store X register to absolute address
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	STA $2A70			; 8D 70 2A | Store accumulator to absolute address
	LDA $2BF2,X		  ; BD F2 2B | Load from absolute,X into accumulator
	BMI $0D			  ; 30 0D | Branch if negative

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_412
; Address: $C6C679
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_412:
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $2A88			; 6D 88 2A | Add with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_413
; Address: $C6C68B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_413:
	JSR $3993			; 20 93 39 | Jump to subroutine
	BCS $15			  ; B0 15 | Branch if carry set
	LDA $2A78			; AD 78 2A | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $2A86			; 6D 86 2A | Add with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_415
; Address: $C6C6A6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_415:
	STZ $06			  ; 64 06 | Store zero to zero page
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDX $2C			  ; A6 2C | Load from zero page into X register
	SEP #$20			 ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_416
; Address: $C6C6B3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_416:
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LDA $2950,X		  ; BD 50 29 | Load from absolute,X into accumulator
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_417
; Address: $C6C6BC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_417:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	STA $06			  ; 85 06 | Store accumulator to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $06			  ; 65 06 | Add with carry (zero page)
	STA $33A6			; 8D A6 33 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_418
; Address: $C6C6CB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_418:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	DEX				  ; CA | Decrement X register
	TXA				  ; 8A | Transfer X register to accumulator
	LDX $2C			  ; A6 2C | Load from zero page into X register
	STA $29C8,X		  ; 9D C8 29 | Store accumulator to absolute,X
	LDX #$70			 ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_419
; Address: $C6C6D7
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_419:
	JSL $C01579		  ; 22 79 15 C0 | Jump to subroutine long
	LDX #$00			 ; A2 00 | Load immediate value into X register
	BVS $9D			  ; 70 9D | Branch if overflow set
	STZ $E82A,X		  ; 9E 2A E8 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	BVS $29			  ; 70 29 | Branch if overflow set
	BNE $2D			  ; D0 2D | Branch if not equal
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	EOR ($47,X)		  ; 41 47 | Exclusive OR with accumulator ((zero page,X))
	LDA #$D4			 ; A9 D4 | Load immediate value into accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $22			  ; 80 22 | Branch always
	STA $C32B			; 8D 2B C3 | Store accumulator to absolute address
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $E3			  ; 90 E3 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_41A
; Address: $C6C712
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_41A:
	JSL $C34741		  ; 22 41 47 C3 | Jump to subroutine long
	LDA #$D4			 ; A9 D4 | Load immediate value into accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $22			  ; 80 22 | Branch always
	STA $C32B			; 8D 2B C3 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_41C
; Address: $C6C726
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_41C:
	CLC				  ; 18 | Clear carry flag
	ADC #$D4			 ; 69 D4 | Add with carry (immediate)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_41D
; Address: $C6C72D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_41D:
	JSL $C34741		  ; 22 41 47 C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $22			  ; 80 22 | Branch always
	STA $C32B			; 8D 2B C3 | Store accumulator to absolute address
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $E2			  ; 90 E2 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_41E
; Address: $C6C741
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_41E:
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	BPL $17			  ; 10 17 | Branch if positive
	PHX				  ; DA | Push X register to stack
	LDX $2A74			; AE 74 2A | Load from absolute address into X register
	STA $2AAA,X		  ; 9D AA 2A | Store accumulator to absolute,X
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	LDY $E82A			; AC 2A E8 | Load from absolute address into Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	STX $2A74			; 8E 74 2A | Store X register to absolute address
	STY $2A7A			; 8C 7A 2A | Store Y register to absolute address
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_41F
; Address: $C6C75D
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_41F:
	PHA				  ; 48 | Push accumulator to stack
	LDA $2A60			; AD 60 2A | Load from absolute address into accumulator
	BEQ $39			  ; F0 39 | Branch if equal
	STZ $2A68			; 9C 68 2A | Store zero to absolute
	LDA $2A66			; AD 66 2A | Load from absolute address into accumulator
	BNE $18			  ; D0 18 | Branch if not equal
	LDA $2A74			; AD 74 2A | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $2A62			; CD 62 2A | Compare accumulator (absolute)
	BEQ $14			  ; F0 14 | Branch if equal
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$08			 ; A9 08 | Load immediate value into accumulator
	JMP $4797			; 4C 97 47 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	JMP $4797			; 4C 97 47 | Jump to address
	DEC $2A66			; CE 66 2A | Decrement (absolute)
	JMP $479A			; 4C 9A 47 | Jump to address
	DEC $2A64			; CE 64 2A | Decrement (absolute)
	BNE $0C			  ; D0 0C | Branch if not equal
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	STA $2A64			; 8D 64 2A | Store accumulator to absolute address
	LDA #$80			 ; A9 80 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_420
; Address: $C6C798
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_420:
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_421
; Address: $C6C79C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_421:
	JSL $C0240A		  ; 22 0A 24 C0 | Jump to subroutine long
	LDA $7F70			; AD 70 7F | Load from absolute address into accumulator
	STA $2A68			; 8D 68 2A | Store accumulator to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_429
; Address: $C6C7C8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_429:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $2BEA			; AD EA 2B | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $06			  ; 65 06 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_42D
; Address: $C6C7E6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_42D:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $240E,X		  ; BD 0E 24 | Load from absolute,X into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	BEQ $0B			  ; F0 0B | Branch if equal
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EF			  ; 90 EF | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STX $3396			; 8E 96 33 | Store X register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_42E
; Address: $C6C805
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_42E:
	JSL $C33D96		  ; 22 96 3D C3 | Jump to subroutine long
	LDA $23FE,X		  ; BD FE 23 | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_431
; Address: $C6C818
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_431:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $2008,X		  ; BD 08 20 | Load from absolute,X into accumulator
	BEQ $05			  ; F0 05 | Branch if equal
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	BEQ $0B			  ; F0 0B | Branch if equal
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EF			  ; 90 EF | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STX $3396			; 8E 96 33 | Store X register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_432
; Address: $C6C837
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_432:
	JSL $C33D96		  ; 22 96 3D C3 | Jump to subroutine long
	LDA $2000,X		  ; BD 00 20 | Load from absolute,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_435
; Address: $C6C84A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_435:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDX $06			  ; A6 06 | Load from zero page into X register
	CPX $2BF0			; EC F0 2B | Compare X register (absolute)
	BCS $43			  ; B0 43 | Branch if carry set
	LDA $3825,X		  ; BD 25 38 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $3398			; 8D 98 33 | Store accumulator to absolute address
	LDA $3725,X		  ; BD 25 37 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_439
; Address: $C6C871
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_439:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP $2BEE			; CD EE 2B | Compare accumulator (absolute)
	BCS $1C			  ; B0 1C | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	ADC $2BEA			; 6D EA 2B | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_43C
; Address: $C6C88F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_43C:
	JSL $C1BA53		  ; 22 53 BA C1 | Jump to subroutine long
	INC $06			  ; E6 06 | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_43F
; Address: $C6C8A2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_43F:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP #$35			 ; C9 35 | Compare accumulator (immediate)
	BCS $EB			  ; B0 EB | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_443
; Address: $C6C8C0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_443:
	JSL $C1BA53		  ; 22 53 BA C1 | Jump to subroutine long
	INC $06			  ; E6 06 | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_444
; Address: $C6C8C7
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_444:
	INC $06			  ; E6 06 | Increment (zero page)
	JMP $4896			; 4C 96 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP $4197			; CD 97 41 | Compare accumulator (absolute)
	BCS $C1			  ; B0 C1 | Branch if carry set
	CMP #$1E			 ; C9 1E | Compare accumulator (immediate)
	BCS $BC			  ; B0 BC | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $3306,X		  ; BD 06 33 | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_448
; Address: $C6C8EF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_448:
	JSL $C1BA53		  ; 22 53 BA C1 | Jump to subroutine long
	INC $06			  ; E6 06 | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_449
; Address: $C6C8F6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_449:
	INC $06			  ; E6 06 | Increment (zero page)
	JMP $4896			; 4C 96 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $33A6			; AD A6 33 | Load from absolute address into accumulator
	INC $33A6			; EE A6 33 | Increment (absolute)
	CMP #$1E			 ; C9 1E | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_44A
; Address: $C6C909
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_44A:
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_44E
; Address: $C6C91E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_44E:
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $33A6			; AD A6 33 | Load from absolute address into accumulator
	INC $33A6			; EE A6 33 | Increment (absolute)
	CMP #$35			 ; C9 35 | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_452
; Address: $C6C944
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_452:
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP $4197			; CD 97 41 | Compare accumulator (absolute)
	BCS $1B			  ; B0 1B | Branch if carry set
	CMP #$1E			 ; C9 1E | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $3306,X		  ; BD 06 33 | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_456
; Address: $C6C96B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_456:
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP #$35			 ; C9 35 | Compare accumulator (immediate)
	BCS $18			  ; B0 18 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_457
; Address: $C6C977
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_457:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0E			  ; F0 0E | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_45A
; Address: $C6C988
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_45A:
	JSL $C1BA53		  ; 22 53 BA C1 | Jump to subroutine long
	INC $06			  ; E6 06 | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_45B
; Address: $C6C98F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_45B:
	INC $06			  ; E6 06 | Increment (zero page)
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP #$35			 ; C9 35 | Compare accumulator (immediate)
	BCS $F4			  ; B0 F4 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $EA			  ; F0 EA | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_45F
; Address: $C6C9B3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_45F:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP #$35			 ; C9 35 | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_463
; Address: $C6C9D2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_463:
	JMP $489A			; 4C 9A 48 | Jump to address
	INC $06			  ; E6 06 | Increment (zero page)
	JMP $C349B3		  ; 5C B3 49 C3 | Jump to address long
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_464
; Address: $C6C9E0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_464:
	ADC #$24			 ; 69 24 | Add with carry (immediate)
	CMP #$35			 ; C9 35 | Compare accumulator (immediate)
	BCS $EA			  ; B0 EA | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_468
; Address: $C6C9FE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_468:
	INC $06			  ; E6 06 | Increment (zero page)
	JMP $C349DB		  ; 5C DB 49 C3 | Jump to address long
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP #$1E			 ; C9 1E | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_46C
; Address: $C6CA23
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_46C:
	JMP $489A			; 4C 9A 48 | Jump to address
	INC $06			  ; E6 06 | Increment (zero page)
	JMP $C34A04		  ; 5C 04 4A C3 | Jump to address long
	STY $20			  ; 84 20 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_46E
; Address: $C6CA35
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_46E:
	JSL $C909AE		  ; 22 AE 09 C9 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROR $0062,X		  ; 7E 62 00 | Rotate right (absolute,X)
	BCS $0B			  ; B0 0B | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_471
; Address: $C6CA4B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_471:
	JSL $C42DA1		  ; 22 A1 2D C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BCC $EC			  ; 90 EC | Branch if carry clear
	LDA #$8C			 ; A9 8C | Load immediate value into accumulator
	JMP $4A46			; 4C 46 4A | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_473
; Address: $C6CA5F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_473:
	JSL $C44A03		  ; 22 03 4A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	INC $0FB0,X		  ; FE B0 0F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_475
; Address: $C6CA6D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_475:
	JSL $C44E32		  ; 22 32 4E C4 | Jump to subroutine long
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_476
; Address: $C6CA80
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_476:
	JSL $C44A03		  ; 22 03 4A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	INC $0FB0,X		  ; FE B0 0F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_478
; Address: $C6CA8E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_478:
	JSL $C44E32		  ; 22 32 4E C4 | Jump to subroutine long
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_479
; Address: $C6CAA1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_479:
	JSL $C44A03		  ; 22 03 4A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	INC $0FB0,X		  ; FE B0 0F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_47B
; Address: $C6CAAF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_47B:
	JSL $C44E32		  ; 22 32 4E C4 | Jump to subroutine long
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_47C
; Address: $C6CAC2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_47C:
	JSL $C44A03		  ; 22 03 4A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	INC $0FB0,X		  ; FE B0 0F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_47E
; Address: $C6CAD0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_47E:
	JSL $C44E32		  ; 22 32 4E C4 | Jump to subroutine long
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_47F
; Address: $C6CAE3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_47F:
	JSL $C44A03		  ; 22 03 4A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	INC $0FB0,X		  ; FE B0 0F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_481
; Address: $C6CAF1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_481:
	JSL $C44E32		  ; 22 32 4E C4 | Jump to subroutine long
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $08			  ; A5 08 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_484
; Address: $C6CB0C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_484:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $08			  ; A5 08 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 23 4B C3 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_487
; Address: $C6CB24
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_487:
	RTI				  ; 40 | Return from interrupt
	ADC $7F40,X		  ; 7D 40 7F | Add with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	JMP $4B03			; 4C 03 4B | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	JMP $4B10			; 4C 10 4B | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDX $08			  ; A6 08 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_490
; Address: $C6CB5E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_490:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2BD2,X		  ; BD D2 2B | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_494
; Address: $C6CB73
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_494:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2BC2,X		  ; BD C2 2B | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_497
; Address: $C6CB88
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_497:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	BNE $09			  ; D0 09 | Branch if not equal
	LDX $2BC4			; AE C4 2B | Load from absolute address into X register
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_498
; Address: $C6CB93
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_498:
	JSL $C32B7F		  ; 22 7F 2B C3 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $2BCE			; 6D CE 2B | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2BD8,X		  ; BD D8 2B | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_499
; Address: $C6CBA0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_499:
	JSL $C33D96		  ; 22 96 3D C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $2BB2			; 6D B2 2B | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_49C
; Address: $C6CBBA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_49C:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	BNE $09			  ; D0 09 | Branch if not equal
	LDX $2BC6			; AE C6 2B | Load from absolute address into X register
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_49D
; Address: $C6CBC5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_49D:
	JSL $C32B7F		  ; 22 7F 2B C3 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $2BD0			; 6D D0 2B | Add with carry (absolute)
	JMP $4B9C			; 4C 9C 4B | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	BNE $09			  ; D0 09 | Branch if not equal
	LDX $2BC8			; AE C8 2B | Load from absolute address into X register
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_49E
; Address: $C6CBDC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_49E:
	JSL $C32B7F		  ; 22 7F 2B C3 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_49F
; Address: $C6CBE2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_49F:
	ADC $2BD2			; 6D D2 2B | Add with carry (absolute)
	JMP $4B9C			; 4C 9C 4B | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	BNE $09			  ; D0 09 | Branch if not equal
	LDX $2BCA			; AE CA 2B | Load from absolute address into X register
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4A0
; Address: $C6CBF3
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4A0:
	JSL $C32B7F		  ; 22 7F 2B C3 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $2BD4			; 6D D4 2B | Add with carry (absolute)
	JMP $4B9C			; 4C 9C 4B | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	BNE $09			  ; D0 09 | Branch if not equal
	LDX $2BCC			; AE CC 2B | Load from absolute address into X register
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4A1
; Address: $C6CC0A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4A1:
	JSL $C32B7F		  ; 22 7F 2B C3 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $2BD6			; 6D D6 2B | Add with carry (absolute)
	JMP $4B9C			; 4C 9C 4B | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4A5
; Address: $C6CC2A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4A5:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2BBA,X		  ; BD BA 2B | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4A9
; Address: $C6CC42
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4A9:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $33DA			; AD DA 33 | Load from absolute address into accumulator
	STA $08			  ; 85 08 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4B5
; Address: $C6CC7E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4B5:
	JSL $C909AE		  ; 22 AE 09 C9 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROR $0062,X		  ; 7E 62 00 | Rotate right (absolute,X)
	BCS $0B			  ; B0 0B | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4B8
; Address: $C6CC94
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4B8:
	JSL $C42DA1		  ; 22 A1 2D C4 | Jump to subroutine long
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	BCC $EC			  ; 90 EC | Branch if carry clear
	LDA #$8C			 ; A9 8C | Load immediate value into accumulator
	JMP $4C8F			; 4C 8F 4C | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4B9
; Address: $C6CCA8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4B9:
	JSL $C44A03		  ; 22 03 4A C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	INC $0FB0,X		  ; FE B0 0F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4BB
; Address: $C6CCB6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4BB:
	JSL $C44E32		  ; 22 32 4E C4 | Jump to subroutine long
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4BC
; Address: $C6CCC9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4BC:
	JSL $C44A03		  ; 22 03 4A C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	INC $0FB0,X		  ; FE B0 0F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4BE
; Address: $C6CCD7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4BE:
	JSL $C44E32		  ; 22 32 4E C4 | Jump to subroutine long
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA #$02			 ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4BF
; Address: $C6CCEA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4BF:
	JSL $C44A03		  ; 22 03 4A C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	INC $0FB0,X		  ; FE B0 0F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4C1
; Address: $C6CCF8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4C1:
	JSL $C44E32		  ; 22 32 4E C4 | Jump to subroutine long
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4C2
; Address: $C6CD01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4C2:
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA #$03			 ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4C3
; Address: $C6CD0B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4C3:
	JSL $C44A03		  ; 22 03 4A C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	INC $0FB0,X		  ; FE B0 0F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4C5
; Address: $C6CD19
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4C5:
	JSL $C44E32		  ; 22 32 4E C4 | Jump to subroutine long
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA #$04			 ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4C6
; Address: $C6CD2C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4C6:
	JSL $C44A03		  ; 22 03 4A C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	INC $0FB0,X		  ; FE B0 0F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4C8
; Address: $C6CD3A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4C8:
	JSL $C44E32		  ; 22 32 4E C4 | Jump to subroutine long
	INC $22FF,X		  ; FE FF 22 | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	JMP $489A			; 4C 9A 48 | Jump to address
	STY $20			  ; 84 20 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4D3
; Address: $C6CD7C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4D3:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40F9,X		  ; BD F9 40 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4D7
; Address: $C6CD94
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4D7:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDX $08			  ; A6 08 | Load from zero page into X register
	INX				  ; E8 | Increment X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $F4			  ; F0 F4 | Branch if equal
	STX $08			  ; 86 08 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4DF
; Address: $C6CDC4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4DF:
	STA $78			  ; 85 78 | Store accumulator to zero page
	LDA #$07			 ; A9 07 | Load immediate value into accumulator
	LDX #$78			 ; A2 78 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4E0
; Address: $C6CDCC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4E0:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDA $78			  ; A5 78 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF AF A3 C8 | Load from absolute long,X into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4E1
; Address: $C6CDDC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4E1:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF E5 F7 C8 | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $06			  ; 65 06 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4E4
; Address: $C6CDF1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4E4:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	STA $78			  ; 85 78 | Store accumulator to zero page
	LDX #$78			 ; A2 78 | Load immediate value into X register
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4E5
; Address: $C6CDFD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4E5:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDX $78			  ; A6 78 | Load from zero page into X register
	LDA				  ; BF BC 24 C4 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4EF
; Address: $C6CE31
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4EF:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF B0 D4 C8 | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $06			  ; 65 06 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4F2
; Address: $C6CE46
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4F2:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40F9,X		  ; BD F9 40 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4F6
; Address: $C6CE5E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4F6:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	STA $78			  ; 85 78 | Store accumulator to zero page
	LDA #$25			 ; A9 25 | Load immediate value into accumulator
	LDX #$78			 ; A2 78 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4F7
; Address: $C6CE6A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4F7:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDA $78			  ; A5 78 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 00 00 C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4FA
; Address: $C6CE82
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4FA:
	STY $20			  ; 84 20 | Store Y register to zero page
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	STA $78			  ; 85 78 | Store accumulator to zero page
	LDA #$1D			 ; A9 1D | Load immediate value into accumulator
	LDX #$78			 ; A2 78 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_4FB
; Address: $C6CE8E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_4FB:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDA $78			  ; A5 78 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 60 18 C2 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_50D
; Address: $C6CEE8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_50D:
	LDA #$32			 ; A9 32 | Load immediate value into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_510
; Address: $C6CEFC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_510:
	JSL $C43115		  ; 22 15 31 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $224E			; ED 4E 22 | Subtract with carry (absolute)
	ORA $33			  ; 05 33 | Logical OR with accumulator (zero page)
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_511
; Address: $C6CF10
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_511:
	JSL $C42FEB		  ; 22 EB 2F C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $AE4E			; ED 4E AE | Subtract with carry (absolute)
	LDA $240E,X		  ; BD 0E 24 | Load from absolute,X into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_512
; Address: $C6CF23
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_512:
	JSL $C437C1		  ; 22 C1 37 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $4C			  ; 70 4C | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_514
; Address: $C6CF31
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_514:
	JSL $C43B5F		  ; 22 5F 3B C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $6B			  ; 70 6B | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_515
; Address: $C6CF39
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_515:
	JSL $C4350C		  ; 22 0C 35 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $224E			; ED 4E 22 | Subtract with carry (absolute)
	EOR ($30,X)		  ; 41 30 | Exclusive OR with accumulator ((zero page,X))
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_516
; Address: $C6CF4D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_516:
	JSL $C43231		  ; 22 31 32 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $224E			; ED 4E 22 | Subtract with carry (absolute)
	SEC				  ; 38 | Set carry flag
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_517
; Address: $C6CF61
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_517:
	JSL $C43A42		  ; 22 42 3A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $224E			; ED 4E 22 | Subtract with carry (absolute)
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_518
; Address: $C6CF75
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_518:
	JSL $C43414		  ; 22 14 34 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $224E			; ED 4E 22 | Subtract with carry (absolute)
	PLX				  ; FA | Pull X register from stack
	DEC				  ; 3A | Decrement accumulator
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address
	LDA $08			  ; A5 08 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_519
; Address: $C6CF8B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_519:
	JSL $C3C332		  ; 22 32 C3 C3 | Jump to subroutine long
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	JMP $4F8B			; 4C 8B 4F | Jump to address
	LDA $06			  ; A5 06 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_51B
; Address: $C6CF9D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_51B:
	JSL $C33D96		  ; 22 96 3D C3 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $08			  ; A5 08 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_51D
; Address: $C6CFAC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_51D:
	JMP $4EEB			; 4C EB 4E | Jump to address
	PHY				  ; 5A | Push Y register to stack
	LDX $06			  ; A6 06 | Load from zero page into X register
	LDY $08			  ; A4 08 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_51E
; Address: $C6CFB4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_51E:
	JSL $C2B44A		  ; 22 4A B4 C2 | Jump to subroutine long
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_51F
; Address: $C6CFC0
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_51F:
	LDA $08			  ; A5 08 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF CF 4F C3 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDA $08			  ; A5 08 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF E4 4F C3 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	STA $9B40,Y		  ; 99 40 9B | Store accumulator to absolute,Y
	RTI				  ; 40 | Return from interrupt
	STA $A540,X		  ; 9D 40 A5 | Store accumulator to absolute,X
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF F9 4F C3 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	STA				  ; 9F 40 A1 40 | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt
	LDA $08			  ; A5 08 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 0E 50 C3 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $40			  ; A5 40 | Load from zero page into accumulator
	RTI				  ; 40 | Return from interrupt
	LDA #$40			 ; A9 40 | Load immediate value into accumulator
	LDA $06			  ; A5 06 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_520
; Address: $C6D016
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_520:
	JMP $4FC2			; 4C C2 4F | Jump to address
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	JMP $4FD7			; 4C D7 4F | Jump to address
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	JMP $4FEC			; 4C EC 4F | Jump to address
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	JMP $5001			; 4C 01 50 | Jump to address
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2BD2,X		  ; BD D2 2B | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_521
; Address: $C6D02F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_521:
	JSL $C42FEB		  ; 22 EB 2F C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $A54E			; ED 4E A5 | Subtract with carry (absolute)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2BC2,X		  ; BD C2 2B | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_522
; Address: $C6D040
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_522:
	JSL $C42FEB		  ; 22 EB 2F C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $A64E			; ED 4E A6 | Subtract with carry (absolute)
	ASL $BD			  ; 06 BD | Arithmetic shift left (zero page)
	SEP #$2B			 ; E2 2B | Set processor status bits
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $06			  ; 65 06 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA $2BCA,X		  ; BD CA 2B | Load from absolute,X into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	LDA $2BCB,X		  ; BD CB 2B | Load from absolute,X into accumulator
	STA $71			  ; 85 71 | Store accumulator to zero page
	LDX $06			  ; A6 06 | Load from zero page into X register
	LDA $2BE2,X		  ; BD E2 2B | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	LDX #$70			 ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_524
; Address: $C6D079
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_524:
	LDA $C367			; AD 67 C3 | Load from absolute address into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $C369			; AD 69 C3 | Load from absolute address into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $C361			; AD 61 C3 | Load from absolute address into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $C363			; AD 63 C3 | Load from absolute address into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_525
; Address: $C6D091
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_525:
	LDA $C365			; AD 65 C3 | Load from absolute address into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $7FFC5A		  ; AF 5A FC 7F | Load from absolute long address into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $4EEB			; 4C EB 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_526
; Address: $C6D0A4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_526:
	JSL $C437C1		  ; 22 C1 37 C4 | Jump to subroutine long
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_527
; Address: $C6D0B2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_527:
	JSL $C43B5F		  ; 22 5F 3B C4 | Jump to subroutine long
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_528
; Address: $C6D0BA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_528:
	JSL $C4350C		  ; 22 0C 35 C4 | Jump to subroutine long
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_529
; Address: $C6D0C4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_529:
	JSL $C43041		  ; 22 41 30 C4 | Jump to subroutine long
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_52A
; Address: $C6D0CE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_52A:
	JSL $C43231		  ; 22 31 32 C4 | Jump to subroutine long
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_52B
; Address: $C6D0D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_52B:
	JSL $C438FB		  ; 22 FB 38 C4 | Jump to subroutine long
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_52C
; Address: $C6D0E2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_52C:
	JSL $C43A42		  ; 22 42 3A C4 | Jump to subroutine long
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_52D
; Address: $C6D0EC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_52D:
	JSL $C43644		  ; 22 44 36 C4 | Jump to subroutine long
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_52E
; Address: $C6D0F6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_52E:
	JSL $C43414		  ; 22 14 34 C4 | Jump to subroutine long
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_52F
; Address: $C6D100
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_52F:
	JSL $C43AFA		  ; 22 FA 3A C4 | Jump to subroutine long
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_530
; Address: $C6D10A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_530:
	JSL $C42FEB		  ; 22 EB 2F C4 | Jump to subroutine long
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	INC				  ; 1A | Increment accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	INC				  ; 1A | Increment accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_531
; Address: $C6D123
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_531:
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDX $3396			; AE 96 33 | Load from absolute address into X register
	LDA $337C,X		  ; BD 7C 33 | Load from absolute,X into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDX $3396			; AE 96 33 | Load from absolute address into X register
	LDA $3384,X		  ; BD 84 33 | Load from absolute,X into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $C46C77		  ; AF 77 6C C4 | Load from absolute long address into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $C46C78		  ; AF 78 6C C4 | Load from absolute long address into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $C46C79		  ; AF 79 6C C4 | Load from absolute long address into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $C46C7A		  ; AF 7A 6C C4 | Load from absolute long address into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $4EEB			; 4C EB 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_532
; Address: $C6D162
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_532:
	JSL $C437C1		  ; 22 C1 37 C4 | Jump to subroutine long
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $224E			; ED 4E 22 | Subtract with carry (absolute)
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_533
; Address: $C6D176
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_533:
	JSL $C43041		  ; 22 41 30 C4 | Jump to subroutine long
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $224E			; ED 4E 22 | Subtract with carry (absolute)
	AND ($32),Y		  ; 31 32 | Logical AND with accumulator ((zero page),Y)
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_534
; Address: $C6D18A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_534:
	JSL $C438FB		  ; 22 FB 38 C4 | Jump to subroutine long
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $224E			; ED 4E 22 | Subtract with carry (absolute)
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_535
; Address: $C6D19E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_535:
	JSL $C43414		  ; 22 14 34 C4 | Jump to subroutine long
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $AD4E			; ED 4E AD | Subtract with carry (absolute)
	JMP $4EEB			; 4C EB 4E | Jump to address
	LDA $C1E1			; AD E1 C1 | Load from absolute address into accumulator
	JMP $4EEB			; 4C EB 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_537
; Address: $C6D1B8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_537:
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BVS $4C			  ; 70 4C | Branch if overflow set
	SBC $A64E			; ED 4E A6 | Subtract with carry (absolute)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	AND $C3F2,Y		  ; 39 F2 C3 | Logical AND with accumulator (absolute,Y)
	STA $70			  ; 85 70 | Store accumulator to zero page
	JMP $4EED			; 4C ED 4E | Jump to address
	JMP $4EED			; 4C ED 4E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_538
; Address: $C6D1CC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_538:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA $3394			; 8D 94 33 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_539
; Address: $C6D1D6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_539:
	JSL $C44708		  ; 22 08 47 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	STA $2BEA			; 8D EA 2B | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_53A
; Address: $C6D1E0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_53A:
	JSL $C446D6		  ; 22 D6 46 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	STA $2BEC			; 8D EC 2B | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_53B
; Address: $C6D1EA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_53B:
	JSL $C446A4		  ; 22 A4 46 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	STA $2BEE			; 8D EE 2B | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_53C
; Address: $C6D1F5
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_53C:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ROL $5F22			; 2E 22 5F | Rotate left (absolute)
	BMI $C3			  ; 30 C3 | Branch if negative
	LDA $33F6			; AD F6 33 | Load from absolute address into accumulator
	CMP $2BF0			; CD F0 2B | Compare accumulator (absolute)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA $2BF0			; AD F0 2B | Load from absolute address into accumulator
	BEQ $04			  ; F0 04 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	STA $33F6			; 8D F6 33 | Store accumulator to absolute address
	JMP $5235			; 4C 35 52 | Jump to address
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator
	LDX $2C			  ; A6 2C | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_53E
; Address: $C6D21B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_53E:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ROL $5F22			; 2E 22 5F | Rotate left (absolute)
	BMI $C3			  ; 30 C3 | Branch if negative
	LDA $339E			; AD 9E 33 | Load from absolute address into accumulator
	CMP $2BF0			; CD F0 2B | Compare accumulator (absolute)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA $2BF0			; AD F0 2B | Load from absolute address into accumulator
	BEQ $04			  ; F0 04 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	STA $339E			; 8D 9E 33 | Store accumulator to absolute address
	STA $78			  ; 85 78 | Store accumulator to zero page
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator
	LDX #$78			 ; A2 78 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_53F
; Address: $C6D23D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_53F:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	LDA $78			  ; A5 78 | Load from zero page into accumulator
	LDX $2C			  ; A6 2C | Load from zero page into X register
	STA $2920,X		  ; 9D 20 29 | Store accumulator to absolute,X
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator
	STA $2950,X		  ; 9D 50 29 | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_541
; Address: $C6D252
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_541:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $240E,X		  ; BD 0E 24 | Load from absolute,X into accumulator
	BEQ $01			  ; F0 01 | Branch if equal
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_542
; Address: $C6D269
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_542:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $2008,X		  ; BD 08 20 | Load from absolute,X into accumulator
	BEQ $01			  ; F0 01 | Branch if equal
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_543
; Address: $C6D280
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_543:
	JSL $C3BEF4		  ; 22 F4 BE C3 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_545
; Address: $C6D292
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_545:
	JSL $C456E7		  ; 22 E7 56 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_548
; Address: $C6D2A1
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_548:
	LDA $2BE4			; AD E4 2B | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_549
; Address: $C6D2A6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_549:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $12			  ; F0 12 | Branch if equal
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_54A
; Address: $C6D2B7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_54A:
	JSL $C32E69		  ; 22 69 2E C3 | Jump to subroutine long
	LDA $2950,X		  ; BD 50 29 | Load from absolute,X into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_54C
; Address: $C6D2C3
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_54C:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $0A			  ; F0 0A | Branch if equal
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $52B4			; 4C B4 52 | Jump to address
	LDA $2BBC			; AD BC 2B | Load from absolute address into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_54D
; Address: $C6D2D8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_54D:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $0A			  ; F0 0A | Branch if equal
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $52B4			; 4C B4 52 | Jump to address
	LDA $2BBE			; AD BE 2B | Load from absolute address into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_54E
; Address: $C6D2ED
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_54E:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $0A			  ; F0 0A | Branch if equal
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $52B4			; 4C B4 52 | Jump to address
	LDA $2BC0			; AD C0 2B | Load from absolute address into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_54F
; Address: $C6D302
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_54F:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $0A			  ; F0 0A | Branch if equal
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $52B4			; 4C B4 52 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_552
; Address: $C6D31B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_552:
	JSL $C456E7		  ; 22 E7 56 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	BNE $04			  ; D0 04 | Branch if not equal
	LDA $2950,X		  ; BD 50 29 | Load from absolute,X into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_553
; Address: $C6D32C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_553:
	LDA #$35			 ; A9 35 | Load immediate value into accumulator
	STA $78			  ; 85 78 | Store accumulator to zero page
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	LDX #$78			 ; A2 78 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_554
; Address: $C6D337
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_554:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	INC $78			  ; E6 78 | Increment (zero page)
	LDA $78			  ; A5 78 | Load from zero page into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_555
; Address: $C6D345
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_555:
	JSL $C455FD		  ; 22 FD 55 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	LDA #$1E			 ; A9 1E | Load immediate value into accumulator
	JMP $532F			; 4C 2F 53 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_556
; Address: $C6D351
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_556:
	JSL $C456E7		  ; 22 E7 56 C4 | Jump to subroutine long
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	AND ($53,X)		  ; 21 53 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_557
; Address: $C6D35A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_557:
	JSL $C455FD		  ; 22 FD 55 C4 | Jump to subroutine long
	ASL $A9			  ; 06 A9 | Arithmetic shift left (zero page)
	ASL $4C00,X		  ; 1E 00 4C | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_558
; Address: $C6D366
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_558:
	JSL $C45796		  ; 22 96 57 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_559
; Address: $C6D36D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_559:
	JSL $C46951		  ; 22 51 69 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	LDA #$18			 ; A9 18 | Load immediate value into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_55B
; Address: $C6D381
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_55B:
	JSL $C456BC		  ; 22 BC 56 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_55C
; Address: $C6D388
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_55C:
	JSL $C32FED		  ; 22 ED 2F C3 | Jump to subroutine long
	LDA $4197			; AD 97 41 | Load from absolute address into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_55E
; Address: $C6D397
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_55E:
	JSL $C46951		  ; 22 51 69 C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	JMP $5374			; 4C 74 53 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_560
; Address: $C6D3A8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_560:
	JSL $C32FED		  ; 22 ED 2F C3 | Jump to subroutine long
	LDA $4197			; AD 97 41 | Load from absolute address into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_561
; Address: $C6D3B0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_561:
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2950,X		  ; BD 50 29 | Load from absolute,X into accumulator
	STA $00			  ; 85 00 | Store accumulator to zero page
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_562
; Address: $C6D3BF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_562:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_567
; Address: $C6D3DA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_567:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $0C			  ; F0 0C | Branch if equal
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BNE $05			  ; D0 05 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_56A
; Address: $C6D3F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_56A:
	JSL $C46A31		  ; 22 31 6A C4 | Jump to subroutine long
	LDA $40F7			; AD F7 40 | Load from absolute address into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_56B
; Address: $C6D3F8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_56B:
	PHY				  ; 5A | Push Y register to stack
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $10			  ; F0 10 | Branch if equal
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BNE $12			  ; D0 12 | Branch if not equal
	LDA $2BB2			; AD B2 2B | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_56C
; Address: $C6D40A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_56C:
	JSR $53B0			; 20 B0 53 | Jump to subroutine
	JMP $5421			; 4C 21 54 | Jump to address
	LDA $2BB2			; AD B2 2B | Load from absolute address into accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	JMP $5421			; 4C 21 54 | Jump to address
	LDA $2BB2			; AD B2 2B | Load from absolute address into accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_56D
; Address: $C6D41D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_56D:
	JSR $53B0			; 20 B0 53 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	INX				  ; E8 | Increment X register
	LDA $40F7,X		  ; BD F7 40 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $F4			  ; F0 F4 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	BPL $F1			  ; 10 F1 | Branch if positive
	DEX				  ; CA | Decrement X register
	STX $08			  ; 86 08 | Store X register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_578
; Address: $C6D45E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_578:
	JSL $C46A64		  ; 22 64 6A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	LDA $40F7			; AD F7 40 | Load from absolute address into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_57B
; Address: $C6D46F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_57B:
	LDA #$12			 ; A9 12 | Load immediate value into accumulator
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	PHX				  ; DA | Push X register to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_57D
; Address: $C6D477
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_57D:
	JSL $C0F29B		  ; 22 9B F2 C0 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_57F
; Address: $C6D481
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_57F:
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $1A			  ; 85 1A | Store accumulator to zero page
	LDA $24			  ; A5 24 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $24			  ; 85 24 | Store accumulator to zero page
	LDA $1E			  ; A5 1E | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $1E			  ; 85 1E | Store accumulator to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_580
; Address: $C6D49B
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_580:
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $10			  ; 85 10 | Store accumulator to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	BMI $26			  ; 30 26 | Branch if negative
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BCC $11			  ; 90 11 | Branch if carry clear
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	DEX				  ; CA | Decrement X register
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	BNE $F8			  ; D0 F8 | Branch if not equal
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_583
; Address: $C6D4DB
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_583:
	JSL $C3549B		  ; 22 9B 54 C3 | Jump to subroutine long
	LDA $1C			  ; A5 1C | Load from zero page into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $1E			  ; E5 1E | Subtract with carry (zero page)
	BMI $19			  ; 30 19 | Branch if negative
	CMP #$41			 ; C9 41 | Compare accumulator (immediate)
	BCC $14			  ; 90 14 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	CMP $1C			  ; C5 1C | Compare accumulator (zero page)
	BCS $0B			  ; B0 0B | Branch if carry set
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_588
; Address: $C6D512
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_588:
	JSL $C354CA		  ; 22 CA 54 C3 | Jump to subroutine long
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_594
; Address: $C6D54E
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_594:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	INC $1890,X		  ; FE 90 18 | Increment (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $7A			  ; D0 7A | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $3A			  ; D0 3A | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $3D			  ; D0 3D | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $40			  ; D0 40 | Branch if not equal
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $60			  ; D0 60 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $3C			  ; F0 3C | Branch if equal
	LDA $0C			  ; A5 0C | Load from zero page into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $B487			; 0D 87 B4 | Logical OR with accumulator (absolute)
	STA $0C			  ; 85 0C | Store accumulator to zero page
	LDA $0E			  ; A5 0E | Load from zero page into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $B487			; 0D 87 B4 | Logical OR with accumulator (absolute)
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA $10			  ; A5 10 | Load from zero page into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $B487			; 0D 87 B4 | Logical OR with accumulator (absolute)
	STA $10			  ; 85 10 | Store accumulator to zero page
	JMP $55D6			; 4C D6 55 | Jump to address
	LDA #$02			 ; A9 02 | Load immediate value into accumulator
	STA $3396			; 8D 96 33 | Store accumulator to absolute address
	JMP $556F			; 4C 6F 55 | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	STA $3396			; 8D 96 33 | Store accumulator to absolute address
	JMP $556F			; 4C 6F 55 | Jump to address
	LDA #$04			 ; A9 04 | Load immediate value into accumulator
	STA $3396			; 8D 96 33 | Store accumulator to absolute address
	JMP $556F			; 4C 6F 55 | Jump to address
	LDA $0C			  ; A5 0C | Load from zero page into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $B485			; 0D 85 B4 | Logical OR with accumulator (absolute)
	STA $0C			  ; 85 0C | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_595
; Address: $C6D5C2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_595:
	LDA $0E			  ; A5 0E | Load from zero page into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $B485			; 0D 85 B4 | Logical OR with accumulator (absolute)
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA $10			  ; A5 10 | Load from zero page into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $B485			; 0D 85 B4 | Logical OR with accumulator (absolute)
	STA $10			  ; 85 10 | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_596
; Address: $C6D5D7
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_596:
	INC $3396			; EE 96 33 | Increment (absolute)
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $F5			  ; D0 F5 | Branch if not equal
	LDA $0C			  ; A5 0C | Load from zero page into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $B489			; 0D 89 B4 | Logical OR with accumulator (absolute)
	STA $0C			  ; 85 0C | Store accumulator to zero page
	LDA $0E			  ; A5 0E | Load from zero page into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $B489			; 0D 89 B4 | Logical OR with accumulator (absolute)
	STA $0E			  ; 85 0E | Store accumulator to zero page
	LDA $10			  ; A5 10 | Load from zero page into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA $B489			; 0D 89 B4 | Logical OR with accumulator (absolute)
	STA $10			  ; 85 10 | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_597
; Address: $C6D600
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_597:
	LDX $3396			; AE 96 33 | Load from absolute address into X register
	LDA				  ; BF 0F 56 C3 | Load from absolute long,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_59A
; Address: $C6D614
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_59A:
	JSL $C46951		  ; 22 51 69 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	INC $0D22,X		  ; FE 22 0D | Increment (absolute,X)
	ORA $C9			  ; 05 C9 | Logical OR with accumulator (zero page)
	ORA ($73,X)		  ; 01 73 | Logical OR with accumulator ((zero page,X))
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	BIT $C4			  ; 24 C4 | Test bits in accumulator (zero page)
	PHY				  ; 5A | Push Y register to stack
	LDY #$05			 ; A0 05 | Load immediate value into Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5A9
; Address: $C6D681
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5A9:
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP $2BEC			; CD EC 2B | Compare accumulator (absolute)
	BCS $0B			  ; B0 0B | Branch if carry set
	LDA #$B1			 ; A9 B1 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	LDX $1E			  ; A6 1E | Load from zero page into X register
	STA $2BF2,X		  ; 9D F2 2B | Store accumulator to absolute,X
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5AA
; Address: $C6D694
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5AA:
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP $2BEC			; CD EC 2B | Compare accumulator (absolute)
	BCS $10			  ; B0 10 | Branch if carry set
	LDA $1E			  ; A5 1E | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$B1			 ; A9 B1 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,X		  ; 9D F2 2B | Store accumulator to absolute,X
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5AD
; Address: $C6D6B5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5AD:
	LDX $2C			  ; A6 2C | Load from zero page into X register
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	LDA $2950,X		  ; BD 50 29 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5AF
; Address: $C6D6C2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5AF:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	STA $06			  ; 85 06 | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5B0
; Address: $C6D6C9
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5B0:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	JMP $C390FB		  ; 5C FB 90 C3 | Jump to address long
	DEC $5C56,X		  ; DE 56 5C | Decrement (absolute,X)
	STA ($C3),Y		  ; 91 C3 | Store accumulator to (zero page),Y
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	LDA				  ; BF 0D 57 C3 | Load from absolute long,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF4,Y		  ; 99 F4 2B | Store accumulator to absolute,Y
	LDA				  ; BF 0E 57 C3 | Load from absolute long,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF6,Y		  ; 99 F6 2B | Store accumulator to absolute,Y
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5B3
; Address: $C6D716
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5B3:
	JSL $C32C64		  ; 22 64 2C C3 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $330C			; CD 0C 33 | Compare accumulator (absolute)
	BCS $14			  ; B0 14 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	LDA $330E			; AD 0E 33 | Load from absolute address into accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	LDA #$09			 ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5B5
; Address: $C6D738
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5B5:
	BPL $F6			  ; 10 F6 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5B7
; Address: $C6D73E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5B7:
	JSL $C2AFAA		  ; 22 AA AF C2 | Jump to subroutine long
	BCC $2A			  ; 90 2A | Branch if carry clear
	TAX				  ; AA | Transfer accumulator to X register
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $37			  ; D0 37 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $37			  ; D0 37 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	AND $298A,X		  ; 3D 8A 29 | Logical AND with accumulator (absolute,X)
	BPL $D0			  ; 10 D0 | Branch if positive
	EOR #$8A			 ; 49 8A | Exclusive OR with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BNE $37			  ; D0 37 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $37			  ; D0 37 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $1F			  ; D0 1F | Branch if not equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5B8
; Address: $C6D76E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5B8:
	JSL $C42FEB		  ; 22 EB 2F C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $64			  ; 70 64 | Branch if overflow set
	STZ $74			  ; 64 74 | Store zero to zero page
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5BA
; Address: $C6D781
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5BA:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	JMP $57A8			; 4C A8 57 | Jump to address
	LDX #$02			 ; A2 02 | Load immediate value into X register
	JMP $57A8			; 4C A8 57 | Jump to address
	LDX #$04			 ; A2 04 | Load immediate value into X register
	JMP $57A8			; 4C A8 57 | Jump to address
	LDX #$06			 ; A2 06 | Load immediate value into X register
	JMP $57A8			; 4C A8 57 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	JMP $57A8			; 4C A8 57 | Jump to address
	LDX #$0A			 ; A2 0A | Load immediate value into X register
	JMP $57A8			; 4C A8 57 | Jump to address
	LDX #$0C			 ; A2 0C | Load immediate value into X register
	LDA				  ; BF ED 64 C3 | Load from absolute long,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5BB
; Address: $C6D7B0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5BB:
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	LDA				  ; BF EE 64 C3 | Load from absolute long,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF4,Y		  ; 99 F4 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5BC
; Address: $C6D7C8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5BC:
	AND ($2A,X)		  ; 21 2A | Logical AND with accumulator ((zero page,X))
	ROL $0A			  ; 26 0A | Rotate left (zero page)
	ADC ($59,X)		  ; 61 59 | Add with carry ((zero page,X))
	ADC ($60,X)		  ; 61 60 | Add with carry ((zero page,X))
	AND $2EA5,Y		  ; 39 A5 2E | Logical AND with accumulator (absolute,Y)
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $2E			  ; 85 2E | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5BD
; Address: $C6D7DD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5BD:
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $29C8,X		  ; BD C8 29 | Load from absolute,X into accumulator
	STA $06			  ; 85 06 | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5BF
; Address: $C6D7EB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5BF:
	JSL $C32FED		  ; 22 ED 2F C3 | Jump to subroutine long
	STZ $06			  ; 64 06 | Store zero to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5C0
; Address: $C6D7F2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5C0:
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2BD2,X		  ; BD D2 2B | Load from absolute,X into accumulator
	STA $06			  ; 85 06 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5C1
; Address: $C6D7FC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5C1:
	JSL $C3554B		  ; 22 4B 55 C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	STA $06			  ; 85 06 | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5C2
; Address: $C6D804
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5C2:
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2BC2,X		  ; BD C2 2B | Load from absolute,X into accumulator
	STA $06			  ; 85 06 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5C3
; Address: $C6D80E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5C3:
	JSL $C3554B		  ; 22 4B 55 C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	STA $06			  ; 85 06 | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5C5
; Address: $C6D818
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5C5:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $2BD2,X		  ; BD D2 2B | Load from absolute,X into accumulator
	STA $06			  ; 85 06 | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5C6
; Address: $C6D820
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5C6:
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP $3394			; CD 94 33 | Compare accumulator (absolute)
	BCS $01			  ; B0 01 | Branch if carry set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5C7
; Address: $C6D828
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5C7:
	SEP #$20			 ; E2 20 | Set processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	JMP $C36525		  ; 5C 25 65 C3 | Jump to address long
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $0A			  ; D0 0A | Branch if not equal
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5C9
; Address: $C6D83E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5C9:
	JSL $C355B8		  ; 22 B8 55 C3 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5CA
; Address: $C6D844
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5CA:
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP $2BF0			; CD F0 2B | Compare accumulator (absolute)
	BCS $11			  ; B0 11 | Branch if carry set
	LDA $3398			; AD 98 33 | Load from absolute address into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5CF
; Address: $C6D86B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5CF:
	LDX $06			  ; A6 06 | Load from zero page into X register
	CPX $2BF0			; EC F0 2B | Compare X register (absolute)
	BCS $26			  ; B0 26 | Branch if carry set
	LDA $3725,X		  ; BD 25 37 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5D0
; Address: $C6D878
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5D0:
	JSL $C44F00		  ; 22 00 4F C4 | Jump to subroutine long
	BCS $21			  ; B0 21 | PPU graphics register access
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5D1
; Address: $C6D883
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5D1:
	JSL $C44EA6		  ; 22 A6 4E C4 | Jump to subroutine long
	BVS $A2			  ; 70 A2 | Branch if overflow set
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5D6
; Address: $C6D8A0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5D6:
	CMP #$B1			 ; C9 B1 | Compare accumulator (immediate)
	BNE $08			  ; D0 08 | Branch if not equal
	LDX $2BB2			; AE B2 2B | Load from absolute address into X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BEQ $D2			  ; F0 D2 | Branch if equal
	LDX #$71			 ; A2 71 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDA $2BEA			; AD EA 2B | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $06			  ; 65 06 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $5878			; 4C 78 58 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5D7
; Address: $C6D8C3
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5D7:
	JSL $C4501B		  ; 22 1B 50 C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	STA $3398			; 8D 98 33 | Store accumulator to absolute address
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $5D			  ; D0 5D | Branch if not equal
	LDX #$28			 ; A2 28 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	STZ $339C			; 9C 9C 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5D8
; Address: $C6D8DA
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5D8:
	JSL $C4501B		  ; 22 1B 50 C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	STA $3398			; 8D 98 33 | Store accumulator to absolute address
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $7C			  ; F0 7C | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $65			  ; F0 65 | Branch if equal
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $66			  ; F0 66 | Branch if equal
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BEQ $67			  ; F0 67 | Branch if equal
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BEQ $6E			  ; F0 6E | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $6F			  ; F0 6F | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5D9
; Address: $C6D901
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5D9:
	JSL $C44FE2		  ; 22 E2 4F C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	STA $339A			; 8D 9A 33 | Store accumulator to absolute address
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $10			  ; F0 10 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5DB
; Address: $C6D913
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5DB:
	PHP				  ; 08 | Push processor status to stack
	BCC $03			  ; 90 03 | Branch if carry clear
	INC $339C			; EE 9C 33 | Increment (absolute)
	LDX #$9D			 ; A2 9D | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$93			 ; A2 93 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5DC
; Address: $C6D925
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5DC:
	JSL $C4501B		  ; 22 1B 50 C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	STA $3398			; 8D 98 33 | Store accumulator to absolute address
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $3D			  ; F0 3D | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $2C			  ; F0 2C | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $16			  ; F0 16 | Branch if equal
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BEQ $17			  ; F0 17 | Branch if equal
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDX #$20			 ; A2 20 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$18			 ; A2 18 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$08			 ; A2 08 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$38			 ; A2 38 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$10			 ; A2 10 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$30			 ; A2 30 | Load immediate value into X register
	LDA				  ; BF 00 A0 03 | Load from absolute long,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STA $2BF2,Y		  ; 99 F2 2B | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	JMP $5973			; 4C 73 59 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5DE
; Address: $C6D993
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5DE:
	JMP $5989			; 4C 89 59 | Jump to address
	ORA ($17),Y		  ; 11 17 | Logical OR with accumulator ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $2439			; 0E 39 24 | Arithmetic shift left (absolute)
	AND ($16),Y		  ; 31 16 | Logical AND with accumulator ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $4233			; 0D 33 42 | Hardware register operation
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	AND $2F			  ; 25 2F | Logical AND with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1304			; 0E 04 13 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $1304			; 0E 04 13 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1404			; 0E 04 14 | Arithmetic shift left (absolute)
	WDM #$13			 ; 42 13 | Reserved instruction
	EOR ($04,X)		  ; 41 04 | Exclusive OR with accumulator ((zero page,X))
	ROL $33			  ; 26 33 | Rotate left (zero page)
	WDM #$13			 ; 42 13 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ASL $2604			; 0E 04 26 | Arithmetic shift left (absolute)
	ASL $2012,X		  ; 1E 12 20 | Arithmetic shift left (absolute,X)
	ORA $1A00			; 0D 00 1A | Logical OR with accumulator (absolute)
	ASL $2604			; 0E 04 26 | Arithmetic shift left (absolute)
	ASL $340D,X		  ; 1E 0D 34 | Arithmetic shift left (absolute,X)
	ROL $1E3F			; 2E 3F 1E | Rotate left (absolute)
	ORA $0134			; 0D 34 01 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $1E3F			; 2E 3F 1E | Rotate left (absolute)
	ORA $0D20			; 0D 20 0D | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ASL $2604			; 0E 04 26 | Arithmetic shift left (absolute)
	ASL $3412,X		  ; 1E 12 34 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $2035			; 0E 35 20 | Arithmetic shift left (absolute)
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)
	AND ($36),Y		  ; 31 36 | Logical AND with accumulator ((zero page),Y)
	ORA $1B00			; 0D 00 1B | Logical OR with accumulator (absolute)
	ASL $1100,X		  ; 1E 00 11 | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ASL $4217			; 0E 17 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5DF
; Address: $C6DA26
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5DF:
	ROL $39			  ; 26 39 | Rotate left (zero page)
	ASL $1304			; 0E 04 13 | Arithmetic shift left (absolute)
	ORA $1704			; 0D 04 17 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5E0
; Address: $C6DA34
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5E0:
	JSR $242E			; 20 2E 24 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROR $7E7E,X		  ; 7E 7E 7E | Rotate right (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $3F11,X		  ; 1D 11 3F | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5E2
; Address: $C6DA4B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5E2:
	JSR $1139			; 20 39 11 | Jump to subroutine
	ORA $1E04			; 0D 04 1E | Logical OR with accumulator (absolute)
	ROL $1D00			; 2E 00 1D | Rotate left (absolute)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	ORA $0D11,X		  ; 1D 11 0D | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROL $1900			; 2E 00 19 | Rotate left (absolute)
	ORA $1311			; 0D 11 13 | Logical OR with accumulator (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($37),Y		  ; 11 37 | Logical OR with accumulator ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $3F11,X		  ; 1D 11 3F | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5E3
; Address: $C6DA7B
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5E3:
	JSR $2013			; 20 13 20 | Jump to subroutine
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	AND $0D11,Y		  ; 39 11 0D | Logical AND with accumulator (absolute,Y)
	ASL $1D2E,X		  ; 1E 2E 1D | Arithmetic shift left (absolute,X)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	ORA $0D11,X		  ; 1D 11 0D | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROR $7E7E,X		  ; 7E 7E 7E | Rotate right (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	ORA $1311			; 0D 11 13 | Logical OR with accumulator (absolute)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ASL $3412,X		  ; 1E 12 34 | Arithmetic shift left (absolute,X)
	ASL $2012,X		  ; 1E 12 20 | Arithmetic shift left (absolute,X)
	ORA $0C00			; 0D 00 0C | Logical OR with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	SEC				  ; 38 | Set carry flag
	ORA $3414,X		  ; 1D 14 34 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5E5
; Address: $C6DAD5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5E5:
	JSR $000D			; 20 0D 00 | Jump to subroutine
	LDA $3398			; AD 98 33 | Load from absolute address into accumulator
	JMP $592E			; 4C 2E 59 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5E7
; Address: $C6DAE3
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5E7:
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BCC $19			  ; 90 19 | Branch if carry clear
	BVS $06			  ; 70 06 | Branch if overflow set
	LDX #$59			 ; A2 59 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDA $3398			; AD 98 33 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $5C79			; 4C 79 5C | Jump to address
	LDX #$50			 ; A2 50 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5E8
; Address: $C6DB01
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5E8:
	JSL $C44A72		  ; 22 72 4A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	INC $90FF,X		  ; FE FF 90 | Increment (absolute,X)
	JMP $5B94			; 4C 94 5B | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	LDA $3398			; AD 98 33 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $52			  ; F0 52 | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $25			  ; F0 25 | Branch if equal
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BEQ $2F			  ; F0 2F | Branch if equal
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5E9
; Address: $C6DB31
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5E9:
	JSL $C43AFA		  ; 22 FA 3A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	JMP $5B71			; 4C 71 5B | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	LDX #$69			 ; A2 69 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5EA
; Address: $C6DB42
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5EA:
	JSL $C43644		  ; 22 44 36 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	JMP $5B71			; 4C 71 5B | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5EB
; Address: $C6DB4C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5EB:
	JSL $C437C1		  ; 22 C1 37 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	JMP $5B71			; 4C 71 5B | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5EC
; Address: $C6DB56
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5EC:
	JSL $C438FB		  ; 22 FB 38 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	JMP $5B71			; 4C 71 5B | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5ED
; Address: $C6DB60
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5ED:
	JSL $C4350C		  ; 22 0C 35 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	JMP $5B71			; 4C 71 5B | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5EF
; Address: $C6DB71
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5EF:
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDX #$03			 ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5F1
; Address: $C6DB81
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5F1:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	STA $70			  ; 85 70 | Store accumulator to zero page
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDX #$03			 ; A2 03 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5F3
; Address: $C6DB94
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5F3:
	LDA $3398			; AD 98 33 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	LDX #$56			 ; A2 56 | Load immediate value into X register
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $E222,Y		  ; 59 22 E2 | Exclusive OR with accumulator (absolute,Y)
	CPY $08			  ; C4 08 | Compare Y register (zero page)
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $EF			  ; F0 EF | Branch if equal
	LDX #$61			 ; A2 61 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5F4
; Address: $C6DBB3
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5F4:
	JSL $C44DC0		  ; 22 C0 4D C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $05			  ; 70 05 | Branch if overflow set
	BCS $14			  ; B0 14 | Branch if carry set
	JMP $5B01			; 4C 01 5B | Jump to address
	LDA $3398			; AD 98 33 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $5C79			; 4C 79 5C | Jump to address
	LDX #$50			 ; A2 50 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5F5
; Address: $C6DBD3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5F5:
	JSL $C44A72		  ; 22 72 4A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	INC $B0FF,X		  ; FE FF B0 | Increment (absolute,X)
	JMP $5B0F			; 4C 0F 5B | Jump to address
	LDA $3398			; AD 98 33 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	LDX #$48			 ; A2 48 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5F6
; Address: $C6DBEF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5F6:
	JSL $C44FE2		  ; 22 E2 4F C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5F7
; Address: $C6DBF8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5F7:
	BEQ $EF			  ; F0 EF | Branch if equal
	LDX #$59			 ; A2 59 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5F8
; Address: $C6DC00
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5F8:
	JSL $C44DC0		  ; 22 C0 4D C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $B8			  ; 70 B8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5F9
; Address: $C6DC0A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5F9:
	JSL $C44A72		  ; 22 72 4A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	INC $B0FF,X		  ; FE FF B0 | Increment (absolute,X)
	JMP $5B0F			; 4C 0F 5B | Jump to address
	LDA $3398			; AD 98 33 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $C9			  ; D0 C9 | Branch if not equal
	LDA $08			  ; A5 08 | Load from zero page into accumulator
	CMP #$85			 ; C9 85 | Compare accumulator (immediate)
	BEQ $33			  ; F0 33 | Branch if equal
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	CMP #$A8			 ; C9 A8 | Compare accumulator (immediate)
	BEQ $2F			  ; F0 2F | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5FA
; Address: $C6DC31
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5FA:
	JSL $C44FE2		  ; 22 E2 4F C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $AD			  ; F0 AD | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5FB
; Address: $C6DC3C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5FB:
	JSL $C452AA		  ; 22 AA 52 C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $1F			  ; D0 1F | Branch if not equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_5FC
; Address: $C6DC47
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_5FC:
	JSL $C44F55		  ; 22 55 4F C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BCS $06			  ; B0 06 | Branch if carry set
	LDX #$11			 ; A2 11 | Load immediate value into X register
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $FBA2,Y		  ; 59 A2 FB | Exclusive OR with accumulator (absolute,Y)
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$24			 ; A2 24 | Load immediate value into X register
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $3CA2,Y		  ; 59 A2 3C | Exclusive OR with accumulator (absolute,Y)
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $43A2,Y		  ; 59 A2 43 | Exclusive OR with accumulator (absolute,Y)
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $C022,Y		  ; 59 22 C0 | Exclusive OR with accumulator (absolute,Y)
	EOR $08C4			; 4D C4 08 | Exclusive OR with accumulator (absolute)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $03			  ; 70 03 | Branch if overflow set
	JMP $5B01			; 4C 01 5B | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_600
; Address: $C6DC8A
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_600:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	LDA $3398			; AD 98 33 | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $51			  ; F0 51 | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $42			  ; F0 42 | Hardware register operation
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $1A			  ; F0 1A | Branch if equal
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BEQ $24			  ; F0 24 | Branch if equal
	LDX #$50			 ; A2 50 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_601
; Address: $C6DCB5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_601:
	JSL $C43644		  ; 22 44 36 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $4C			  ; 70 4C | Branch if overflow set
	INC $225C			; EE 5C 22 | Increment (absolute)
	CMP ($37,X)		  ; C1 37 | Compare accumulator ((zero page,X))
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $5CEE			; 4C EE 5C | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_602
; Address: $C6DCC9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_602:
	JSL $C438FB		  ; 22 FB 38 C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $4C			  ; 70 4C | Branch if overflow set
	INC $225C			; EE 5C 22 | Increment (absolute)
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	JMP $5CEE			; 4C EE 5C | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_603
; Address: $C6DCDD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_603:
	JSL $C43AFA		  ; 22 FA 3A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVS $4C			  ; 70 4C | Branch if overflow set
	INC $225C			; EE 5C 22 | Increment (absolute)
	WDM #$3A			 ; 42 3A | Reserved instruction
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	STZ $72			  ; 64 72 | Store zero to zero page
	STZ $74			  ; 64 74 | Store zero to zero page
	LDX #$04			 ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_605
; Address: $C6DCFA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_605:
	LDA $08			  ; A5 08 | Load from zero page into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2BB2			; 6D B2 2B | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_606
; Address: $C6DD01
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_606:
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $08			  ; 85 08 | Store accumulator to zero page
	LDA $33D6			; AD D6 33 | Load from absolute address into accumulator
	STA $06			  ; 85 06 | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_607
; Address: $C6DD0F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_607:
	LDA $33DA			; AD DA 33 | Load from absolute address into accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	JMP $592B			; 4C 2B 59 | Jump to address
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	JMP $592B			; 4C 2B 59 | Jump to address
	LDA $33DA			; AD DA 33 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_608
; Address: $C6DD26
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_608:
	JSL $C44BB9		  ; 22 B9 4B C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	JMP $5B0F			; 4C 0F 5B | Jump to address
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	CMP $3394			; CD 94 33 | Compare accumulator (absolute)
	BCS $01			  ; B0 01 | Branch if carry set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_609
; Address: $C6DD39
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_609:
	SEP #$20			 ; E2 20 | Set processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	JMP $8FB3			; 4C B3 8F | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_60A
; Address: $C6DD43
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_60A:
	JSL $C3B6C9		  ; 22 C9 B6 C3 | Jump to subroutine long
	BCC $07			  ; 90 07 | Branch if carry clear
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $2E			  ; 85 2E | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_60B
; Address: $C6DD51
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_60B:
	JSL $C3B6AA		  ; 22 AA B6 C3 | Jump to subroutine long
	BCC $07			  ; 90 07 | Branch if carry clear
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $2E			  ; 85 2E | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_60D
; Address: $C6DD62
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_60D:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	JMP $5555			; 4C 55 55 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_60E
; Address: $C6DD6C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_60E:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	JMP $56D0			; 4C D0 56 | Jump to address
	LDA #$06			 ; A9 06 | Load immediate value into accumulator
	JMP $5D82			; 4C 82 5D | Jump to address
	LDA #$03			 ; A9 03 | Load immediate value into accumulator
	JMP $5D82			; 4C 82 5D | Jump to address
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_60F
; Address: $C6DD83
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_60F:
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2998,X		  ; BD 98 29 | Load from absolute,X into accumulator
	STA $70			  ; 85 70 | Store accumulator to zero page
	LDA $29B0,X		  ; BD B0 29 | Load from absolute,X into accumulator
	STA $72			  ; 85 72 | Store accumulator to zero page
	PLX				  ; FA | Pull X register from stack
	LDA #$0C			 ; A9 0C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_612
; Address: $C6DD9D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_612:
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_614
; Address: $C6DDA9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_614:
	LDA $2BEA			; AD EA 2B | Load from absolute address into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $06			  ; 65 06 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $08			  ; 85 08 | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_616
; Address: $C6DDBC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_616:
	JSL $C44FA5		  ; 22 A5 4F C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BCS $46			  ; B0 46 | Branch if carry set

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_617
; Address: $C6DDC3
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_617:
	JSL $C44FE2		  ; 22 E2 4F C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	STA $339A			; 8D 9A 33 | Store accumulator to absolute address
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $1A			  ; F0 1A | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $1B			  ; F0 1B | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $1C			  ; F0 1C | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $1D			  ; F0 1D | Branch if equal
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	LDX #$9D			 ; A2 9D | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$78			 ; A2 78 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$7F			 ; A2 7F | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$85			 ; A2 85 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_618
; Address: $C6DDFD
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_618:
	LDX #$8C			 ; A2 8C | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$93			 ; A2 93 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	INC $339C			; EE 9C 33 | Increment (absolute)
	LDX #$A5			 ; A2 A5 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDA $339A			; AD 9A 33 | Load from absolute address into accumulator
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $56			  ; F0 56 | Branch if equal
	LDA $08			  ; A5 08 | Load from zero page into accumulator
	CMP #$85			 ; C9 85 | Compare accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BEQ $7F			  ; F0 7F | Branch if equal
	CMP #$A8			 ; C9 A8 | Compare accumulator (immediate)
	BEQ $7A			  ; F0 7A | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_619
; Address: $C6DE2B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_619:
	JSL $C452AA		  ; 22 AA 52 C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $7F			  ; D0 7F | Branch if not equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_61A
; Address: $C6DE36
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_61A:
	JSL $C44F55		  ; 22 55 4F C4 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BCS $11			  ; B0 11 | Branch if carry set
	LDX #$C6			 ; A2 C6 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_61C
; Address: $C6DE44
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_61C:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDX #$CF			 ; A2 CF | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$B5			 ; A2 B5 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_61E
; Address: $C6DE55
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_61E:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDX #$BD			 ; A2 BD | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address
	LDX #$D9			 ; A2 D9 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_620
; Address: $C6DE66
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_620:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDX #$E3			 ; A2 E3 | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_621
; Address: $C6DE70
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_621:
	JSL $C44A72		  ; 22 72 4A C4 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	INC $90FF,X		  ; FE FF 90 | Increment (absolute,X)
	BPL $22			  ; 10 22 | Branch if positive
	LDX #$47			 ; A2 47 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_62E
; Address: $C6DEBC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_62E:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDX #$ED			 ; A2 ED | Load immediate value into X register
	JMP $5973			; 4C 73 59 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_632
; Address: $C6DED6
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_632:
	JSL $C1D13B		  ; 22 3B D1 C1 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	LDX #$67			 ; A2 67 | Load immediate value into X register
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $4DA2,Y		  ; 59 A2 4D | Exclusive OR with accumulator (absolute,Y)
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $5EA2,Y		  ; 59 A2 5E | Exclusive OR with accumulator (absolute,Y)
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $EE22,Y		  ; 59 22 EE | Exclusive OR with accumulator (absolute,Y)
	CMP ($C9,X)		  ; C1 C9 | Compare accumulator ((zero page,X))
	BEQ $11			  ; F0 11 | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	LDX #$32			 ; A2 32 | Load immediate value into X register
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $56A2,Y		  ; 59 A2 56 | Exclusive OR with accumulator (absolute,Y)
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $4DA2,Y		  ; 59 A2 4D | Exclusive OR with accumulator (absolute,Y)
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $1522,Y		  ; 59 22 15 | Exclusive OR with accumulator (absolute,Y)
	CMP ($B0,X)		  ; C1 B0 | Compare accumulator ((zero page,X))
	ASL $A2			  ; 06 A2 | Arithmetic shift left (zero page)
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $4DA2,Y		  ; 59 A2 4D | Exclusive OR with accumulator (absolute,Y)
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_633
; Address: $C6DF27
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_633:
	EOR $28AF,Y		  ; 59 AF 28 | Exclusive OR with accumulator (absolute,Y)
	ROR $0429,X		  ; 7E 29 04 | Rotate right (absolute,X)
	BNE $0F			  ; D0 0F | Branch if not equal
	LDA $7E353A		  ; AF 3A 35 7E | Load from absolute long address into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	LDX #$6F			 ; A2 6F | Load immediate value into X register
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $77A2,Y		  ; 59 A2 77 | Exclusive OR with accumulator (absolute,Y)
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $2EA5,Y		  ; 59 A5 2E | Exclusive OR with accumulator (absolute,Y)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $07			  ; D0 07 | Branch if not equal
	STZ $2BB2			; 9C B2 2B | Store zero to absolute

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_635
; Address: $C6DF55
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_635:
	LDX $2BB2			; AE B2 2B | Load from absolute address into X register
	BEQ $0B			  ; F0 0B | Branch if equal
	LDX $2BB4			; AE B4 2B | Load from absolute address into X register
	CPX $06			  ; E4 06 | Compare X register (zero page)
	BEQ $13			  ; F0 13 | Branch if equal

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_636
; Address: $C6DF61
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_636:
	JSL $C0F283		  ; 22 83 F2 C0 | Jump to subroutine long
	LDX $06			  ; A6 06 | Load from zero page into X register
	STX $2BB4			; 8E B4 2B | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_637
; Address: $C6DF6A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_637:
	JSL $C0F253		  ; 22 53 F2 C0 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	STA $2BB2			; 8D B2 2B | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_638
; Address: $C6DF75
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_638:
	STZ $3396			; 9C 96 33 | Store zero to absolute
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2998,X		  ; BD 98 29 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_639
; Address: $C6DF7D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_639:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $554C,X		  ; FE 4C 55 | Increment (absolute,X)
	STZ $3396			; 9C 96 33 | Store zero to absolute
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $29E0,X		  ; BD E0 29 | Load from absolute,X into accumulator
	STA $06			  ; 85 06 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_63A
; Address: $C6DF91
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_63A:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $554C,X		  ; FE 4C 55 | Increment (absolute,X)
	LDA $2BB4			; AD B4 2B | Load from absolute address into accumulator
	STA $06			  ; 85 06 | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_63B
; Address: $C6DFA1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_63B:
	JMP $C37078		  ; 5C 78 70 C3 | Jump to address long
	JMP $C373C4		  ; 5C C4 73 C3 | Jump to address long
	LDX $2C			  ; A6 2C | Load from zero page into X register
	STZ $2950,X		  ; 9E 50 29 | Store zero to absolute,X
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_63D
; Address: $C6DFB1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_63D:
	JSL $C3BF14		  ; 22 14 BF C3 | Jump to subroutine long
	STA $08			  ; 85 08 | Store accumulator to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_63E
; Address: $C6DFB8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_63E:
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_63F
; Address: $C6DFBE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_63F:
	JSL $C3308F		  ; 22 8F 30 C3 | Jump to subroutine long
	STA $BDE1			; 8D E1 BD | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_640
; Address: $C6DFC6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_640:
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BNE $07			  ; D0 07 | Branch if not equal
	LDA #$01			 ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_642
; Address: $C6DFD5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_642:
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	AND $2E			  ; 25 2E | Logical AND with accumulator (zero page)
	BEQ $09			  ; F0 09 | Branch if equal
	LDX $2C			  ; A6 2C | Load from zero page into X register
	LDA $2920,X		  ; BD 20 29 | Load from absolute,X into accumulator
	BNE $02			  ; D0 02 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_644
; Address: $C6DFE7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_644:
	LDA $2A9C			; AD 9C 2A | Load from absolute address into accumulator
	BEQ $F9			  ; F0 F9 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_645
; Address: $C6DFEE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_645:
	LDA $2A9C			; AD 9C 2A | Load from absolute address into accumulator
	BEQ $F9			  ; F0 F9 | Branch if equal
	LDA $33DA			; AD DA 33 | Load from absolute address into accumulator
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $F1			  ; F0 F1 | Branch if equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_646
; Address: $C6DFFD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_646:
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 12 60 C3 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_649
; Address: $C6E015
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_649:
	RTI				  ; 40 | Return from interrupt
	ADC $2240			; 6D 40 22 | Add with carry (absolute)
	BVC $C4			  ; 50 C4 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	STA $3398			; 8D 98 33 | Store accumulator to absolute address
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_64A
; Address: $C6E028
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_64A:
	LDA $33D6			; AD D6 33 | Load from absolute address into accumulator
	CMP $33D8			; CD D8 33 | Compare accumulator (absolute)
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $2BEE			; AD EE 2B | Load from absolute address into accumulator
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $02			  ; D0 02 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_64B
; Address: $C6E03A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_64B:
	LDA #$0B			 ; A9 0B | Load immediate value into accumulator
	CMP $2BEE			; CD EE 2B | Compare accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_64C
; Address: $C6E041
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_64C:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_64D
; Address: $C6E04F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_64D:
	LDA $339C			; AD 9C 33 | Load from absolute address into accumulator
	BNE $02			  ; D0 02 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_64F
; Address: $C6E058
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_64F:
	LDA $08			  ; A5 08 | Load from zero page into accumulator
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	BEQ $F7			  ; F0 F7 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_651
; Address: $C6E063
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_651:
	JSL $C36073		  ; 22 73 60 C3 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $EA			  ; D0 EA | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_652
; Address: $C6E06E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_652:
	LDA $06			  ; A5 06 | Load from zero page into accumulator
	JMP $6063			; 4C 63 60 | Jump to address
	PHX				  ; DA | Push X register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_653
; Address: $C6E076
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_653:
	LDA				  ; BF 80 60 C3 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_654
; Address: $C6E080
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_654:
	STA $8F40			; 8D 40 8F | Store accumulator to absolute address
	RTI				  ; 40 | Return from interrupt
	STA ($40),Y		  ; 91 40 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_655
; Address: $C6E086
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_655:
	JSL $C45345		  ; 22 45 53 C4 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $08			  ; 65 08 | Add with carry (zero page)
	DEC				  ; 3A | Decrement accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,X		  ; BD 00 00 | Load from absolute,X into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $70			  ; 85 70 | Store accumulator to zero page
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_69B
; Address: $C6E236
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_69B:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6268			; 4C 68 62 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_6A3
; Address: $C6E263
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_6A3:
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6241			; 4C 41 62 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_6A5
; Address: $C6E26D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_6A5:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $62D5			; 4C D5 62 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_6B8
; Address: $C6E2CC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_6B8:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6278			; 4C 78 62 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_6BA
; Address: $C6E2DA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_6BA:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6327			; 4C 27 63 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_6C8
; Address: $C6E31E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_6C8:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $62E5			; 4C E5 62 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_6EA
; Address: $C6E3DB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_6EA:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6415			; 4C 15 64 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_6F3
; Address: $C6E40C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_6F3:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $63E6			; 4C E6 63 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_6F4
; Address: $C6E415
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_6F4:
	JSL $C35832		  ; 22 32 58 C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $22			  ; 80 22 | Branch always
	JMP $22C33D		  ; 5C 3D C3 22 | Jump to address long
	LSR $A2C3			; 4E C3 A2 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_6FB
; Address: $C6E440
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_6FB:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6476			; 4C 76 64 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_703
; Address: $C6E46D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_703:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $644B			; 4C 4B 64 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_70A
; Address: $C6E494
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_70A:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $64CE			; 4C CE 64 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_713
; Address: $C6E4C5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_713:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $649F			; 4C 9F 64 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_714
; Address: $C6E4CE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_714:
	JSL $C35832		  ; 22 32 58 C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $22			  ; 80 22 | Branch always
	JMP $22C33D		  ; 5C 3D C3 22 | Jump to address long
	LSR $A2C3			; 4E C3 A2 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_718
; Address: $C6E4ED
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_718:
	LSR				  ; 4A | Logical shift right (accumulator)
	SBC ($4A,X)		  ; E1 4A | Subtract with carry ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	SEP #$2C			 ; E2 2C | Set processor status bits

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_71B
; Address: $C6E4FD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_71B:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $64D7			; 4C D7 64 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_71C
; Address: $C6E506
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_71C:
	JSL $C35832		  ; 22 32 58 C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $22			  ; 80 22 | Branch always
	JMP $22C33D		  ; 5C 3D C3 22 | Jump to address long
	LSR $A2C3			; 4E C3 A2 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_721
; Address: $C6E529
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_721:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $655B			; 4C 5B 65 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_728
; Address: $C6E552
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_728:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6534			; 4C 34 65 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_72B
; Address: $C6E564
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_72B:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $65A1			; 4C A1 65 | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_734
; Address: $C6E598
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_734:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $656F			; 4C 6F 65 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_749
; Address: $C6E617
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_749:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6654			; 4C 54 66 | Jump to address
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	JMP $22C33D		  ; 5C 3D C3 22 | Jump to address long
	INC $47			  ; E6 47 | Increment (zero page)
	LDX #$0B			 ; A2 0B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_750
; Address: $C6E64B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_750:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6622			; 4C 22 66 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_75A
; Address: $C6E682
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_75A:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $66BC			; 4C BC 66 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_75B
; Address: $C6E68D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_75B:
	JSL $C3554B		  ; 22 4B 55 C3 | Jump to subroutine long
	LDA #$20			 ; A9 20 | Load immediate value into accumulator
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	JMP $22C33D		  ; 5C 3D C3 22 | Jump to address long
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX #$04			 ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_761
; Address: $C6E6B3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_761:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $668D			; 4C 8D 66 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_80C
; Address: $C6EA38
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_80C:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6A6E			; 4C 6E 6A | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_814
; Address: $C6EA65
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_814:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6A43			; 4C 43 6A | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_815
; Address: $C6EA6E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_815:
	JSL $C35D9D		  ; 22 9D 5D C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $22			  ; 80 22 | Branch always
	JMP $A9C33D		  ; 5C 3D C3 A9 | Jump to address long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_81B
; Address: $C6EA8F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_81B:
	JSL $C35522		  ; 22 22 55 C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	BRA $22			  ; 80 22 | Branch always
	JMP $A9C33D		  ; 5C 3D C3 A9 | Jump to address long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_821
; Address: $C6EAB4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_821:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6AEE			; 4C EE 6A | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_82A
; Address: $C6EAE5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_82A:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6ABF			; 4C BF 6A | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_82B
; Address: $C6EAEF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_82B:
	JSL $C35FE7		  ; 22 E7 5F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6B56			; 4C 56 6B | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_83D
; Address: $C6EB51
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_83D:
	JSL $C32C9E		  ; 22 9E 2C C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_83E
; Address: $C6EB57
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_83E:
	JSL $C35FE7		  ; 22 E7 5F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6BD0			; 4C D0 6B | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_853
; Address: $C6EBCB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_853:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_86E
; Address: $C6EC49
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_86E:
	JSL $C32C0F		  ; 22 0F 2C C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_88E
; Address: $C6ECE6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_88E:
	JSL $C35FE7		  ; 22 E7 5F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $6E80			; 4C 80 6E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_8D5
; Address: $C6EE7B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_8D5:
	JSL $C32C9E		  ; 22 9E 2C C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_8D6
; Address: $C6EE81
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_8D6:
	JSL $C35FE7		  ; 22 E7 5F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7060			; 4C 60 70 | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_92A
; Address: $C6F05B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_92A:
	JSL $C32C9E		  ; 22 9E 2C C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_932
; Address: $C6F082
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_932:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_934
; Address: $C6F090
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_934:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_936
; Address: $C6F09E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_936:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_93B
; Address: $C6F0BA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_93B:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_93D
; Address: $C6F0C8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_93D:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_93F
; Address: $C6F0D6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_93F:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_941
; Address: $C6F0E4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_941:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_943
; Address: $C6F0F2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_943:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_945
; Address: $C6F100
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_945:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_947
; Address: $C6F10E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_947:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_949
; Address: $C6F11C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_949:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_94C
; Address: $C6F12E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_94C:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_94E
; Address: $C6F13C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_94E:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_950
; Address: $C6F14A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_950:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_952
; Address: $C6F158
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_952:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_954
; Address: $C6F166
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_954:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_956
; Address: $C6F174
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_956:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_958
; Address: $C6F182
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_958:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_95A
; Address: $C6F190
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_95A:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_95C
; Address: $C6F19E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_95C:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_95E
; Address: $C6F1AC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_95E:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_960
; Address: $C6F1BA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_960:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_962
; Address: $C6F1C8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_962:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_964
; Address: $C6F1D6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_964:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_967
; Address: $C6F1E8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_967:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_969
; Address: $C6F1F6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_969:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_96B
; Address: $C6F204
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_96B:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_96D
; Address: $C6F212
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_96D:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_96F
; Address: $C6F220
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_96F:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_971
; Address: $C6F22E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_971:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_973
; Address: $C6F23C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_973:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_975
; Address: $C6F24A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_975:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_978
; Address: $C6F258
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_978:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_97A
; Address: $C6F266
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_97A:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_97C
; Address: $C6F274
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_97C:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_97E
; Address: $C6F282
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_97E:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_980
; Address: $C6F290
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_980:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_983
; Address: $C6F2A2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_983:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_985
; Address: $C6F2B0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_985:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_987
; Address: $C6F2BE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_987:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_989
; Address: $C6F2CC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_989:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_98B
; Address: $C6F2DA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_98B:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_98D
; Address: $C6F2E8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_98D:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_98F
; Address: $C6F2F6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_98F:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_991
; Address: $C6F304
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_991:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_993
; Address: $C6F312
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_993:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_995
; Address: $C6F320
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_995:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_997
; Address: $C6F32E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_997:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_999
; Address: $C6F33C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_999:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_99B
; Address: $C6F34A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_99B:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_99E
; Address: $C6F35C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_99E:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9A5
; Address: $C6F38D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9A5:
	JSL $C32B70		  ; 22 70 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9AA
; Address: $C6F3A9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9AA:
	JSL $C32B70		  ; 22 70 2B C3 | Jump to subroutine long
	LDA #$95			 ; A9 95 | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9B1
; Address: $C6F3CE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9B1:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9B3
; Address: $C6F3DC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9B3:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9B5
; Address: $C6F3EA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9B5:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9B7
; Address: $C6F3F8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9B7:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9BB
; Address: $C6F40D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9BB:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9BD
; Address: $C6F41B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9BD:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9BF
; Address: $C6F429
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9BF:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9C1
; Address: $C6F437
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9C1:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9C3
; Address: $C6F445
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9C3:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9C6
; Address: $C6F45A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9C6:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9C9
; Address: $C6F46C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9C9:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9CB
; Address: $C6F47A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9CB:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9CD
; Address: $C6F488
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9CD:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9D0
; Address: $C6F496
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9D0:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9D2
; Address: $C6F4A4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9D2:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9D5
; Address: $C6F4B9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9D5:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9D7
; Address: $C6F4C7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9D7:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9D9
; Address: $C6F4D5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9D9:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9DB
; Address: $C6F4E3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9DB:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9DD
; Address: $C6F4F1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9DD:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9E0
; Address: $C6F506
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9E0:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	BMI $22			  ; 30 22 | Branch if negative
	JMP $A9C33D		  ; 5C 3D C3 A9 | Jump to address long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9E2
; Address: $C6F518
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9E2:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9E4
; Address: $C6F526
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9E4:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9E6
; Address: $C6F534
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9E6:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9E8
; Address: $C6F542
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9E8:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9EA
; Address: $C6F550
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9EA:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9ED
; Address: $C6F565
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9ED:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9EF
; Address: $C6F573
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9EF:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9F1
; Address: $C6F581
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9F1:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9F3
; Address: $C6F58F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9F3:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9F5
; Address: $C6F59D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9F5:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9FC
; Address: $C6F5C4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9FC:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_9FE
; Address: $C6F5D2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_9FE:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A00
; Address: $C6F5E0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A00:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A02
; Address: $C6F5EE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A02:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A04
; Address: $C6F5FC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A04:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A07
; Address: $C6F611
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A07:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A09
; Address: $C6F61F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A09:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A0B
; Address: $C6F62D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A0B:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A0D
; Address: $C6F63B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A0D:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A0F
; Address: $C6F649
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A0F:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A12
; Address: $C6F65E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A12:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A13
; Address: $C6F665
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A13:
	JSL $C33D5C		  ; 22 5C 3D C3 | Jump to subroutine long
	LDA #$B2			 ; A9 B2 | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A15
; Address: $C6F670
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A15:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A17
; Address: $C6F67E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A17:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A19
; Address: $C6F68C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A19:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A1B
; Address: $C6F69A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A1B:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A1D
; Address: $C6F6A8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A1D:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A20
; Address: $C6F6BD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A20:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A25
; Address: $C6F6D9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A25:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A27
; Address: $C6F6E7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A27:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A29
; Address: $C6F6F5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A29:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A2D
; Address: $C6F710
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A2D:
	JSR $5C22			; 20 22 5C | Jump to subroutine
	AND $A9C3,X		  ; 3D C3 A9 | Logical AND with accumulator (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A2F
; Address: $C6F71C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A2F:
	JSL $C35500		  ; 22 00 55 C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A31
; Address: $C6F72A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A31:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A33
; Address: $C6F738
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A33:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A35
; Address: $C6F746
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A35:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A37
; Address: $C6F754
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A37:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A3B
; Address: $C6F769
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A3B:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A3D
; Address: $C6F777
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A3D:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A3F
; Address: $C6F785
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A3F:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A41
; Address: $C6F793
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A41:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A43
; Address: $C6F7A1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A43:
	JSL $C32BAF		  ; 22 AF 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A46
; Address: $C6F7B6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A46:
	JSL $C32B8D		  ; 22 8D 2B C3 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_A47
; Address: $C6F7BD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_A47:
	JSL $C33D5C		  ; 22 5C 3D C3 | Jump to subroutine long
	LDA #$AD			 ; A9 AD | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_AD6
; Address: $C6FB16
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_AD6:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7B4E			; 4C 4E 7B | Jump to address
	LDA #$00			 ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_ADD
; Address: $C6FB45
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_ADD:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7B21			; 4C 21 7B | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_AEA
; Address: $C6FB8E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_AEA:
	JSL $C36061		  ; 22 61 60 C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7B9F			; 4C 9F 7B | Jump to address
	LDA #$5B			 ; A9 5B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_AEB
; Address: $C6FB9A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_AEB:
	JSL $FF130C		  ; 22 0C 13 FF | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7BAB			; 4C AB 7B | Jump to address
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_AF6
; Address: $C6FBDB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_AF6:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7B5E			; 4C 5E 7B | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_B2A
; Address: $C6FD1A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_B2A:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7D32			; 4C 32 7D | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_B2C
; Address: $C6FD29
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_B2C:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7D25			; 4C 25 7D | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_B30
; Address: $C6FD3F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_B30:
	JSL $C36058		  ; 22 58 60 C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7D66			; 4C 66 7D | Jump to address
	LDA #$19			 ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_B36
; Address: $C6FD61
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_B36:
	JSL $FF130C		  ; 22 0C 13 FF | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $7DAC			; 4C AC 7D | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_B51
; Address: $C6FDEB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_B51:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7E25			; 4C 25 7E | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_B5A
; Address: $C6FE1C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_B5A:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7DF6			; 4C F6 7D | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_BAB
; Address: $C6FFB0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_BAB:
	JSL $C32EB0		  ; 22 B0 2E C3 | Jump to subroutine long
	LDA $04			  ; A5 04 | Load from zero page into accumulator
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $7FEA			; 4C EA 7F | Jump to address

;------------------------------------------------------------------------------
; Bank0C_DmaFunction_BB4
; Address: $C6FFE1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank0C_DmaFunction_BB4:
	JSL $C32FB0		  ; 22 B0 2F C3 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7FBB			; 4C BB 7F | Jump to address
	RTL				  ; 6B | Return from subroutine long
