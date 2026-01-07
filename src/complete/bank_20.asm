;==============================================================================
; Dragon Quest III - Bank $20
; Type: Audio
; Purpose: Audio processing and sound management
; Address Range: $D00000-$D07FFF
; Instructions: 12241
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_20"

;------------------------------------------------------------------------------
; Bank20_AudioFunction_000
; Address: $D08004
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_000:
	AND $56F6			; 2D F6 56 | Logical AND with accumulator (absolute)
	CMP ($2F),Y		  ; D1 2F | Compare accumulator ((zero page),Y)
	STZ $30			  ; 64 30 | Store zero to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	BMI $F6			  ; 30 F6 | Branch if negative
	CMP $F630,Y		  ; D9 30 F6 | Compare accumulator (absolute,Y)
	STA ($31,X)		  ; 81 31 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_001
; Address: $D0801B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_001:
	JSR $F633			; 20 33 F6 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	PLB				  ; AB | Pull data bank register from stack
	ASL $F634			; 0E 34 F6 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	ROR $F634			; 6E 34 F6 | Rotate right (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDX $F634,Y		  ; BE 34 F6 | Load from absolute,Y into X register
	SBC ($34),Y		  ; F1 34 | Subtract with carry ((zero page),Y)
	SEP #$35			 ; E2 35 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	BIT #$36			 ; 89 36 | Test bits in accumulator (immediate)
	INY				  ; C8 | Increment Y register
	CMP ($36),Y		  ; D1 36 | Compare accumulator ((zero page),Y)
	PHX				  ; DA | Push X register to stack
	BPL $37			  ; 10 37 | Branch if positive
	ROL				  ; 2A | Rotate left (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_002
; Address: $D08073
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_002:
	SEC				  ; 38 | Set carry flag
	LSR $F638,X		  ; 5E 38 F6 | Logical shift right (absolute,X)
	SEC				  ; 38 | Set carry flag
	SBC $F638,Y		  ; F9 38 F6 | Subtract with carry (absolute,Y)
	AND #$39			 ; 29 39 | Logical AND with accumulator (immediate)
	EOR $F639,Y		  ; 59 39 F6 | Exclusive OR with accumulator (absolute,Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	AND $DBF6,Y		  ; 39 F6 DB | Logical AND with accumulator (absolute,Y)
	AND $0AF6,Y		  ; 39 F6 0A | Logical AND with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	PLP				  ; 28 | Pull processor status from stack
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	SBC $3A			  ; E5 3A | Subtract with carry (zero page)
	EOR $F63B,X		  ; 5D 3B F6 | Exclusive OR with accumulator (absolute,X)
	ROR $F63B,X		  ; 7E 3B F6 | Rotate right (absolute,X)
	LDY $3B			  ; A4 3B | Load from zero page into Y register
	LDA $F63C,X		  ; BD 3C F6 | Audio system operation
	AND $63F6,X		  ; 3D F6 63 | Logical AND with accumulator (absolute,X)
	AND $F8F6,X		  ; 3D F6 F8 | Logical AND with accumulator (absolute,X)
	AND $2BF6,X		  ; 3D F6 2B | Logical AND with accumulator (absolute,X)
	ROL $34F6,X		  ; 3E F6 34 | Rotate left (absolute,X)
	ROL $7AF6,X		  ; 3E F6 7A | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_003
; Address: $D080CD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_003:
	ROL $B0F6,X		  ; 3E F6 B0 | Rotate left (absolute,X)
	ROL $E6F6,X		  ; 3E F6 E6 | Rotate left (absolute,X)
	ROL $04F6,X		  ; 3E F6 04 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_004
; Address: $D080D8
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_004:
	JSL $3DF63F		  ; 22 3F F6 3D | Jump to subroutine long
	ADC #$3F			 ; 69 3F | Add with carry (immediate)
	STA $C9F63F		  ; 8F 3F F6 C9 | Audio system operation
	ORA $40			  ; 05 40 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	DEC $F640			; CE 40 F6 | Decrement (absolute)
	RTI				  ; 40 | Return from interrupt
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	AND ($41),Y		  ; 31 41 | Logical AND with accumulator ((zero page),Y)
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	LDY #$41			 ; A0 41 | Load immediate value into Y register
	CLV				  ; B8 | Clear overflow flag
	EOR ($F6,X)		  ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
	CMP $F641			; CD 41 F6 | Compare accumulator (absolute)
	INC $F641			; EE 41 F6 | Increment (absolute)
	ASL $42			  ; 06 42 | Hardware register operation
	ROL $42			  ; 26 42 | Hardware register operation
	WDM #$F6			 ; 42 F6 | Reserved instruction
	WDM #$F6			 ; 42 F6 | Reserved instruction
	WDM #$F6			 ; 42 F6 | Reserved instruction
	WDM #$F6			 ; 42 F6 | Reserved instruction
	ADC ($42),Y		  ; 71 42 | Hardware register operation
	WDM #$F6			 ; 42 F6 | Reserved instruction
	LDX $42			  ; A6 42 | Hardware register operation
	WDM #$F6			 ; 42 F6 | Reserved instruction
	ORA $F643,X		  ; 1D 43 F6 | Logical OR with accumulator (absolute,X)
	ROL $43			  ; 26 43 | Rotate left (zero page)
	ADC ($43,X)		  ; 61 43 | Add with carry ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	EOR $F644,Y		  ; 59 44 F6 | Exclusive OR with accumulator (absolute,Y)
	CMP $F644			; CD 44 F6 | Compare accumulator (absolute)
	EOR $F6			  ; 45 F6 | Exclusive OR with accumulator (zero page)
	EOR $F6			  ; 45 F6 | Exclusive OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	EOR $F6			  ; 45 F6 | Exclusive OR with accumulator (zero page)
	STZ $F645,X		  ; 9E 45 F6 | Store zero to absolute,X
	EOR $F6			  ; 45 F6 | Exclusive OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_005
; Address: $D0816F
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_005:
	LSR $F6			  ; 46 F6 | Logical shift right (zero page)
	LSR $F6			  ; 46 F6 | Logical shift right (zero page)
	PHY				  ; 5A | Push Y register to stack
	LSR $F6			  ; 46 F6 | Logical shift right (zero page)
	LDX $F646			; AE 46 F6 | Load from absolute address into X register
	SBC ($46,X)		  ; E1 46 | Subtract with carry ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	STX $47			  ; 86 47 | Store X register to zero page
	STA $ADF647		  ; 8F 47 F6 AD | Audio system operation
	CMP ($47,X)		  ; C1 47 | Compare accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	ASL $F649,X		  ; 1E 49 F6 | Arithmetic shift left (absolute,X)
	EOR #$F6			 ; 49 F6 | Exclusive OR with accumulator (immediate)
	EOR #$F6			 ; 49 F6 | Exclusive OR with accumulator (immediate)
	CMP $F64A			; CD 4A F6 | Compare accumulator (absolute)
	ORA ($4B),Y		  ; 11 4B | Logical OR with accumulator ((zero page),Y)
	STA $F64B,Y		  ; 99 4B F6 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register
	JMP $DDF6			; 4C F6 DD | Jump to address
	JMP $10F6			; 4C F6 10 | Jump to address
	EOR $54F6			; 4D F6 54 | Exclusive OR with accumulator (absolute)
	EOR $A3F6			; 4D F6 A3 | Exclusive OR with accumulator (absolute)
	EOR $E5F6			; 4D F6 E5 | Exclusive OR with accumulator (absolute)
	EOR $23F6			; 4D F6 23 | Exclusive OR with accumulator (absolute)
	LSR $4DF6			; 4E F6 4D | Logical shift right (absolute)
	LSR $77F6			; 4E F6 77 | Logical shift right (absolute)
	LSR $0DF6			; 4E F6 0D | Logical shift right (absolute)
	SBC $4F			  ; E5 4F | Subtract with carry (zero page)
	CLC				  ; 18 | Clear carry flag
	BVC $F6			  ; 50 F6 | Branch if overflow clear
	AND ($50,X)		  ; 21 50 | Logical AND with accumulator ((zero page,X))
	ADC $50			  ; 65 50 | Add with carry (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	BVC $F6			  ; 50 F6 | Branch if overflow clear
	BVC $F6			  ; 50 F6 | Branch if overflow clear
	SBC $F650,Y		  ; F9 50 F6 | Subtract with carry (absolute,Y)
	EOR $F651			; 4D 51 F6 | Exclusive OR with accumulator (absolute)
	DEC $F651			; CE 51 F6 | Decrement (absolute)
	ADC ($53,X)		  ; 61 53 | Add with carry ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $55			  ; 66 55 | Rotate right (zero page)
	INX				  ; E8 | Increment X register
	CLI				  ; 58 | Clear interrupt disable flag
	LDA ($58),Y		  ; B1 58 | Audio system operation
	EOR $2EF6,Y		  ; 59 F6 2E | Exclusive OR with accumulator (absolute,Y)
	EOR $6DF6,Y		  ; 59 F6 6D | Exclusive OR with accumulator (absolute,Y)
	EOR $60F6,Y		  ; 59 F6 60 | Exclusive OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_006
; Address: $D0820D
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_006:
	ORA ($5B),Y		  ; 11 5B | Logical OR with accumulator ((zero page),Y)
	PLB				  ; AB | Pull data bank register from stack
	BIT $F65C			; 2C 5C F6 | Test bits in accumulator (absolute)
	JMP $5C76F6		  ; 5C F6 76 5C | Jump to address long
	CMP ($5C),Y		  ; D1 5C | Compare accumulator ((zero page),Y)
	JMP $5D35F6		  ; 5C F6 35 5D | Jump to address long
	EOR $32F6,X		  ; 5D F6 32 | Exclusive OR with accumulator (absolute,X)
	LSR $89F6,X		  ; 5E F6 89 | Logical shift right (absolute,X)
	LSR $BDF6,X		  ; 5E F6 BD | Logical shift right (absolute,X)
	LSR $16F6,X		  ; 5E F6 16 | Logical shift right (absolute,X)
	CPY $F65F			; CC 5F F6 | Compare Y register (absolute)
	CMP $F929,X		  ; DD 29 F9 | Compare accumulator (absolute,X)
	ROL $F930,X		  ; 3E 30 F9 | Rotate left (absolute,X)
	EOR $F930,X		  ; 5D 30 F9 | Exclusive OR with accumulator (absolute,X)
	ASL $37			  ; 06 37 | Arithmetic shift left (zero page)
	SBC $3788,Y		  ; F9 88 37 | Subtract with carry (absolute,Y)
	SBC $3921,Y		  ; F9 21 39 | Subtract with carry (absolute,Y)
	SBC $3A3C,Y		  ; F9 3C 3A | Subtract with carry (absolute,Y)
	SBC $3C2F,Y		  ; F9 2F 3C | Subtract with carry (absolute,Y)
	SBC $5EF8,Y		  ; F9 F8 5E | Subtract with carry (absolute,Y)
	SBC $648A,Y		  ; F9 8A 64 | Subtract with carry (absolute,Y)
	SBC $7EEC,Y		  ; F9 EC 7E | Subtract with carry (absolute,Y)
	SBC $8640,Y		  ; F9 40 86 | Subtract with carry (absolute,Y)
	SBC $88C3,Y		  ; F9 C3 88 | Subtract with carry (absolute,Y)
	SBC $9647,Y		  ; F9 47 96 | Subtract with carry (absolute,Y)
	SBC $B3AF,Y		  ; F9 AF B3 | Subtract with carry (absolute,Y)
	SBC $BE36,Y		  ; F9 36 BE | Subtract with carry (absolute,Y)
	SBC $D3FD,Y		  ; F9 FD D3 | Subtract with carry (absolute,Y)
	SBC $E69A,Y		  ; F9 9A E6 | Subtract with carry (absolute,Y)
	SBC $F4F6,Y		  ; F9 F6 F4 | Subtract with carry (absolute,Y)
	SBC $F800,Y		  ; F9 00 F8 | Subtract with carry (absolute,Y)
	SBC $FBAC,Y		  ; F9 AC FB | Subtract with carry (absolute,Y)
	SBC $051C,Y		  ; F9 1C 05 | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	PHY				  ; 5A | Push Y register to stack
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	CPY #$05			 ; C0 05 | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	CPX $FA05			; EC 05 FA | Compare X register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_007
; Address: $D08296
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_007:
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_008
; Address: $D0829C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_008:
	PLX				  ; FA | Pull X register from stack
	ADC ($19),Y		  ; 71 19 | Add with carry ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	SBC #$20			 ; E9 20 | Subtract with carry (immediate)
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_009
; Address: $D082A4
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_009:
	AND ($FA,X)		  ; 21 FA | Logical AND with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	AND ($FA,X)		  ; 21 FA | Logical AND with accumulator ((zero page,X))
	AND ($24),Y		  ; 31 24 | Logical AND with accumulator ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	ROL				  ; 2A | Rotate left (accumulator)
	PLX				  ; FA | Pull X register from stack
	INC $FA2F			; EE 2F FA | Increment (absolute)
	BMI $FA			  ; 30 FA | Branch if negative
	BMI $FA			  ; 30 FA | Branch if negative
	LDA ($31,X)		  ; A1 31 | Audio system operation
	PLX				  ; FA | Pull X register from stack
	AND ($FA),Y		  ; 31 FA | Logical AND with accumulator ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	ORA $FA3B,Y		  ; 19 3B FA | Logical OR with accumulator (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	LDA				  ; BF 3C FA 0B | Load from absolute long,X into accumulator
	AND $37FA,X		  ; 3D FA 37 | Logical AND with accumulator (absolute,X)
	PLX				  ; FA | Pull X register from stack
	PHB				  ; 8B | Push data bank register to stack
	LSR $B4FA,X		  ; 5E FA B4 | Logical shift right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_00A
; Address: $D082D5
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_00A:
	PLX				  ; FA | Pull X register from stack
	STA $66			  ; 85 66 | Audio system operation
	PLX				  ; FA | Pull X register from stack
	LDY #$67			 ; A0 67 | Load immediate value into Y register
	PLX				  ; FA | Pull X register from stack
	DEC $FA6A			; CE 6A FA | Decrement (absolute)
	PLP				  ; 28 | Pull processor status from stack
	JMP ($76FA)		  ; 6C FA 76 | Jump to address (absolute indirect)
	BVS $FA			  ; 70 FA | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	TXA				  ; 8A | Transfer X register to accumulator
	PLX				  ; FA | Pull X register from stack
	INC $FA8A			; EE 8A FA | Increment (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA ($FA,X)		  ; A1 FA | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY $73FA,X		  ; BC FA 73 | Load from absolute,X into Y register
	PLX				  ; FA | Pull X register from stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_00B
; Address: $D08328
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_00B:
	PHP				  ; 08 | Push processor status to stack
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BIT $0C			  ; 24 0C | Test bits in accumulator (zero page)
	ORA $0D0D			; 0D 0D 0D | Logical OR with accumulator (absolute)
	ORA $0E0E			; 0D 0E 0E | Logical OR with accumulator (absolute)
	ASL $0E0E			; 0E 0E 0E | Arithmetic shift left (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $11			  ; 10 11 | Branch if positive
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ORA ($12),Y		  ; 11 12 | Logical OR with accumulator ((zero page),Y)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $17			  ; 24 17 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $1A1A,Y		  ; 19 1A 1A | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	ORA $1D1D,X		  ; 1D 1D 1D | Logical OR with accumulator (absolute,X)
	ASL $1E1E,X		  ; 1E 1E 1E | Arithmetic shift left (absolute,X)
	ASL $1F1F,X		  ; 1E 1F 1F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_00C
; Address: $D08376
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_00C:
	JSR $2020			; 20 20 20 | Jump to subroutine
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	AND ($21,X)		  ; 21 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank20_AudioFunction_00F
; Address: $D0838F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_00F:
	JSL $222222		  ; 22 22 22 22 | Jump to subroutine long
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $25			  ; 24 25 | Test bits in accumulator (zero page)
	AND $25			  ; 25 25 | Logical AND with accumulator (zero page)
	AND $25			  ; 25 25 | Logical AND with accumulator (zero page)
	AND $25			  ; 25 25 | Logical AND with accumulator (zero page)
	ROL $27			  ; 26 27 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_010
; Address: $D083B0
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_010:
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	RTI				  ; 40 | Return from interrupt
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	EOR ($42,X)		  ; 41 42 | Hardware register operation
	WDM #$42			 ; 42 42 | Hardware register operation
	WDM #$42			 ; 42 42 | Hardware register operation
	WDM #$42			 ; 42 42 | Hardware register operation
	EOR $45			  ; 45 45 | Exclusive OR with accumulator (zero page)
	LSR $46			  ; 46 46 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$49			 ; 49 49 | Exclusive OR with accumulator (immediate)
	EOR #$4A			 ; 49 4A | Exclusive OR with accumulator (immediate)
	BIT $2C2C			; 2C 2C 2C | Test bits in accumulator (absolute)
	BIT $2E2D			; 2C 2D 2E | Test bits in accumulator (absolute)
	BMI $31			  ; 30 31 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	AND $3A39,Y		  ; 39 39 3A | Logical AND with accumulator (absolute,Y)
	AND $4D3E,X		  ; 3D 3E 4D | Logical AND with accumulator (absolute,X)
	EOR $4D4D			; 4D 4D 4D | Exclusive OR with accumulator (absolute)
	EOR $4E4D			; 4D 4D 4E | Exclusive OR with accumulator (absolute)
	LSR $4E4E			; 4E 4E 4E | Logical shift right (absolute)
	LSR $4F4E			; 4E 4E 4F | Logical shift right (absolute)
	BVC $50			  ; 50 50 | Branch if overflow clear
	BVC $50			  ; 50 50 | Branch if overflow clear
	BVC $50			  ; 50 50 | Branch if overflow clear
	EOR ($51),Y		  ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($51),Y		  ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($52),Y		  ; 51 52 | Exclusive OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $5959,Y		  ; 59 59 59 | Exclusive OR with accumulator (absolute,Y)
	EOR $5A59,Y		  ; 59 59 5A | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_011
; Address: $D08452
; Size: 120 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_011:
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($78,X)		  ; 01 78 | Logical OR with accumulator ((zero page,X))
	CPY $7801			; CC 01 78 | Compare Y register (absolute)
	CPY $7801			; CC 01 78 | Compare Y register (absolute)
	CPY $7801			; CC 01 78 | Compare Y register (absolute)
	CPY $7801			; CC 01 78 | Compare Y register (absolute)
	CPY $77C1			; CC C1 77 | Compare Y register (absolute)
	CPY $7811			; CC 11 78 | Compare Y register (absolute)
	CPY $7825			; CC 25 78 | Compare Y register (absolute)
	CPY $7825			; CC 25 78 | Compare Y register (absolute)
	CPY $7825			; CC 25 78 | Compare Y register (absolute)
	CPY $7825			; CC 25 78 | Compare Y register (absolute)
	CPY $7825			; CC 25 78 | Compare Y register (absolute)
	CPY $78DF			; CC DF 78 | Compare Y register (absolute)
	CPY $78FD			; CC FD 78 | Compare Y register (absolute)
	CPY $791B			; CC 1B 79 | Compare Y register (absolute)
	CPY $ED15			; CC 15 ED | Compare Y register (absolute)
	ADC $79CC,Y		  ; 79 CC 79 | Add with carry (absolute,Y)
	ADC $96CC,Y		  ; 79 CC 96 | Add with carry (absolute,Y)
	ADC $B7CC,Y		  ; 79 CC B7 | Add with carry (absolute,Y)
	SBC $7BCB			; ED CB 7B | Subtract with carry (absolute)
	CPY $795A			; CC 5A 79 | Compare Y register (absolute)
	CPY $79D7			; CC D7 79 | Compare Y register (absolute)
	CPY $79D7			; CC D7 79 | Compare Y register (absolute)
	CPY $79E5			; CC E5 79 | Compare Y register (absolute)
	CPY $6E54			; CC 54 6E | Compare Y register (absolute)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	CPY $6E6F			; CC 6F 6E | Compare Y register (absolute)
	CMP $91			  ; C5 91 | Compare accumulator (zero page)
	BVS $C5			  ; 70 C5 | Branch if overflow set
	SBC $C590,Y		  ; F9 90 C5 | Subtract with carry (absolute,Y)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	EOR $CA3C			; 4D 3C CA | Exclusive OR with accumulator (absolute)
	DEX				  ; CA | Decrement X register
	STA ($3C),Y		  ; 91 3C | Audio system operation
	DEX				  ; CA | Decrement X register
	LDA $CACA3C		  ; AF 3C CA CA | Audio system operation
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	ORA ($3D),Y		  ; 11 3D | Logical OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	RTI				  ; 40 | Return from interrupt
	AND $71CA,X		  ; 3D CA 71 | Logical AND with accumulator (absolute,X)
	AND $9ACA,X		  ; 3D CA 9A | Logical AND with accumulator (absolute,X)
	AND $C7CA,X		  ; 3D CA C7 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_012
; Address: $D084D7
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_012:
	AND $E5CA,X		  ; 3D CA E5 | Logical AND with accumulator (absolute,X)
	AND $16CA,X		  ; 3D CA 16 | Logical AND with accumulator (absolute,X)
	ROL $43CA,X		  ; 3E CA 43 | Rotate left (absolute,X)
	ROL $61CA,X		  ; 3E CA 61 | Rotate left (absolute,X)
	ROL $92CA,X		  ; 3E CA 92 | Rotate left (absolute,X)
	ROL $BFCA,X		  ; 3E CA BF | Rotate left (absolute,X)
	ROL $E4CA,X		  ; 3E CA E4 | Rotate left (absolute,X)
	ROL $02CA,X		  ; 3E CA 02 | Rotate left (absolute,X)
	DEX				  ; CA | Decrement X register
	JMP $CA3F			; 4C 3F CA | Jump to address
	BCC $3F			  ; 90 3F | Branch if carry clear
	DEX				  ; CA | Decrement X register
	CLD				  ; D8 | Clear decimal mode flag
	DEX				  ; CA | Decrement X register
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	ROL				  ; 2A | Rotate left (accumulator)
	RTI				  ; 40 | Return from interrupt
	DEX				  ; CA | Decrement X register
	ROR $CA40,X		  ; 7E 40 CA | Rotate right (absolute,X)
	LDA				  ; BF 40 CA EB | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_013
; Address: $D08509
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_013:
	JSR $CA41			; 20 41 CA | Jump to subroutine
	EOR $CA41,Y		  ; 59 41 CA | Exclusive OR with accumulator (absolute,Y)
	STA $41			  ; 85 41 | Audio system operation
	DEX				  ; CA | Decrement X register
	LDX $CA41			; AE 41 CA | Load from absolute address into X register
	EOR ($CA,X)		  ; 41 CA | Exclusive OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	EOR ($CA,X)		  ; 41 CA | Exclusive OR with accumulator ((zero page,X))
	BIT $CA42			; 2C 42 CA | Test bits in accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	WDM #$CA			 ; 42 CA | Reserved instruction
	STY $42			  ; 84 42 | Hardware register operation
	DEX				  ; CA | Decrement X register
	LDX $CA42			; AE 42 CA | Load from absolute address into X register
	WDM #$CA			 ; 42 CA | Reserved instruction
	SEC				  ; 38 | Set carry flag
	DEX				  ; CA | Decrement X register
	ADC ($43,X)		  ; 61 43 | Add with carry ((zero page,X))
	DEX				  ; CA | Decrement X register
	CMP $9CDD			; CD DD 9C | Compare accumulator (absolute)
	CPY $9D11			; CC 11 9D | Compare Y register (absolute)
	CPY $9D3A			; CC 3A 9D | Compare Y register (absolute)
	CPY $9D69			; CC 69 9D | Compare Y register (absolute)
	CPY $4389			; CC 89 43 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	SBC #$43			 ; E9 43 | Subtract with carry (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_014
; Address: $D08545
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_014:
	LSR $CA44,X		  ; 5E 44 CA | Logical shift right (absolute,X)
	STZ $CA44			; 9C 44 CA | Store zero to absolute
	SED				  ; F8 | Set decimal mode flag
	DEX				  ; CA | Decrement X register
	EOR $CA			  ; 45 CA | Exclusive OR with accumulator (zero page)
	STA ($45,X)		  ; 81 45 | Audio system operation
	DEX				  ; CA | Decrement X register
	ROL				  ; 2A | Rotate left (accumulator)
	LSR $CA			  ; 46 CA | Logical shift right (zero page)
	EOR $CA			  ; 45 CA | Exclusive OR with accumulator (zero page)
	CPX $45			  ; E4 45 | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	ORA $46			  ; 05 46 | Logical OR with accumulator (zero page)
	DEX				  ; CA | Decrement X register
	EOR ($46,X)		  ; 41 46 | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	ROR $46			  ; 66 46 | Rotate right (zero page)
	DEX				  ; CA | Decrement X register
	LDA $46			  ; A5 46 | Audio system operation
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	LSR $CA			  ; 46 CA | Logical shift right (zero page)
	LSR $CA			  ; 46 CA | Logical shift right (zero page)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	CPX $CA47			; EC 47 CA | Compare X register (absolute)
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	DEX				  ; CA | Decrement X register
	EOR ($48,X)		  ; 41 48 | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	DEX				  ; CA | Decrement X register
	LDA ($48,X)		  ; A1 48 | Audio system operation
	DEX				  ; CA | Decrement X register
	LDA				  ; BF 48 CA EB | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	DEX				  ; CA | Decrement X register
	EOR #$CA			 ; 49 CA | Exclusive OR with accumulator (immediate)
	EOR #$CA			 ; 49 CA | Exclusive OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	EOR #$CA			 ; 49 CA | Exclusive OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	EOR #$CA			 ; 49 CA | Exclusive OR with accumulator (immediate)
	EOR #$CA			 ; 49 CA | Exclusive OR with accumulator (immediate)
	EOR #$CA			 ; 49 CA | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	DEX				  ; CA | Decrement X register
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_015
; Address: $D085A0
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_015:
	LSR				  ; 4A | Logical shift right (accumulator)
	DEX				  ; CA | Decrement X register
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	DEX				  ; CA | Decrement X register
	LSR				  ; 4A | Logical shift right (accumulator)
	DEX				  ; CA | Decrement X register
	LSR				  ; 4A | Logical shift right (accumulator)
	DEX				  ; CA | Decrement X register
	PHP				  ; 08 | Push processor status to stack
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	ADC ($4B),Y		  ; 71 4B | Add with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register
	LDY $CA4B			; AC 4B CA | Load from absolute address into Y register
	CMP ($4B),Y		  ; D1 4B | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	PLX				  ; FA | Pull X register from stack
	DEX				  ; CA | Decrement X register
	AND $CA4C			; 2D 4C CA | Logical AND with accumulator (absolute)
	JMP $5BCA			; 4C CA 5B | Jump to address
	JMP $92CA			; 4C CA 92 | Jump to address
	JMP $CACA			; 4C CA CA | Jump to address
	JMP $E1CA			; 4C CA E1 | Jump to address
	JMP $0ACA			; 4C CA 0A | Jump to address
	EOR $44CA			; 4D CA 44 | Exclusive OR with accumulator (absolute)
	EOR $7BCA			; 4D CA 7B | Exclusive OR with accumulator (absolute)
	EOR $A4CA			; 4D CA A4 | Exclusive OR with accumulator (absolute)
	EOR $C5CA			; 4D CA C5 | Exclusive OR with accumulator (absolute)
	EOR $DCCA			; 4D CA DC | Exclusive OR with accumulator (absolute)
	EOR $FDCA			; 4D CA FD | Exclusive OR with accumulator (absolute)
	EOR $30CA			; 4D CA 30 | Exclusive OR with accumulator (absolute)
	LSR $55CA			; 4E CA 55 | Logical shift right (absolute)
	LSR $76CA			; 4E CA 76 | Logical shift right (absolute)
	LSR $9BCA			; 4E CA 9B | Logical shift right (absolute)
	LSR $E5CA			; 4E CA E5 | Logical shift right (absolute)
	LSR $0BCA			; 4E CA 0B | Logical shift right (absolute)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	STA $CA4F,X		  ; 9D 4F CA | Audio system operation
	LDX $CA4F,Y		  ; BE 4F CA | Load from absolute,Y into X register
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	AND $CA50,X		  ; 3D 50 CA | Logical AND with accumulator (absolute,X)
	BVC $CA			  ; 50 CA | Branch if overflow clear
	TAX				  ; AA | Transfer accumulator to X register
	BVC $CA			  ; 50 CA | Branch if overflow clear
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_016
; Address: $D0860F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_016:
	BVC $CA			  ; 50 CA | Branch if overflow clear
	ROL				  ; 2A | Rotate left (accumulator)
	EOR ($CA),Y		  ; 51 CA | Exclusive OR with accumulator ((zero page),Y)
	EOR ($CA),Y		  ; 51 CA | Exclusive OR with accumulator ((zero page),Y)
	EOR ($CA),Y		  ; 51 CA | Exclusive OR with accumulator ((zero page),Y)
	EOR ($CA),Y		  ; 51 CA | Exclusive OR with accumulator ((zero page),Y)
	CPY $51			  ; C4 51 | Compare Y register (zero page)
	DEX				  ; CA | Decrement X register
	SBC #$51			 ; E9 51 | Subtract with carry (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_017
; Address: $D08623
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_017:
	JSR $CA52			; 20 52 CA | Jump to subroutine
	EOR #$52			 ; 49 52 | Exclusive OR with accumulator (immediate)
	DEX				  ; CA | Decrement X register
	ROR $CA52			; 6E 52 CA | Rotate right (absolute)
	STA $CA52,X		  ; 9D 52 CA | Audio system operation
	DEC $52			  ; C6 52 | Decrement (zero page)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	EOR ($53,X)		  ; 41 53 | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	STA $CA53,X		  ; 9D 53 CA | Audio system operation
	DEC $53			  ; C6 53 | Decrement (zero page)
	DEX				  ; CA | Decrement X register
	SBC $CA53,Y		  ; F9 53 CA | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_018
; Address: $D08644
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_018:
	JSL $4BCA54		  ; 22 54 CA 4B | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	ROR $54			  ; 66 54 | Rotate right (zero page)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BMI $55			  ; 30 55 | Branch if negative
	DEX				  ; CA | Decrement X register
	EOR $CA55,Y		  ; 59 55 CA | Exclusive OR with accumulator (absolute,Y)
	DEX				  ; CA | Decrement X register
	LDA $CA55,Y		  ; B9 55 CA | Audio system operation
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	BPL $56			  ; 10 56 | Branch if positive
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	LDA ($56),Y		  ; B1 56 | Audio system operation
	DEX				  ; CA | Decrement X register
	SBC ($56,X)		  ; E1 56 | Subtract with carry ((zero page,X))
	DEX				  ; CA | Decrement X register
	ORA ($57),Y		  ; 11 57 | Logical OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	EOR $CA57			; 4D 57 CA | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_01A
; Address: $D0867C
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_01A:
	DEX				  ; CA | Decrement X register
	BIT #$57			 ; 89 57 | Test bits in accumulator (immediate)
	DEX				  ; CA | Decrement X register
	TAX				  ; AA | Transfer accumulator to X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	ORA $CA58,Y		  ; 19 58 CA | Logical OR with accumulator (absolute,Y)
	JMP $CA58			; 4C 58 CA | Jump to address
	STY $58			  ; 84 58 | Store Y register to zero page
	DEX				  ; CA | Decrement X register
	CLV				  ; B8 | Clear overflow flag
	CLI				  ; 58 | Clear interrupt disable flag
	DEX				  ; CA | Decrement X register
	SBC $58			  ; E5 58 | Subtract with carry (zero page)
	DEX				  ; CA | Decrement X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $36CA,Y		  ; 59 CA 36 | Exclusive OR with accumulator (absolute,Y)
	EOR $6DCA,Y		  ; 59 CA 6D | Exclusive OR with accumulator (absolute,Y)
	EOR $A4CA,Y		  ; 59 CA A4 | Exclusive OR with accumulator (absolute,Y)
	EOR $D3CA,Y		  ; 59 CA D3 | Exclusive OR with accumulator (absolute,Y)
	EOR $06CA,Y		  ; 59 CA 06 | Exclusive OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	DEX				  ; CA | Decrement X register
	AND $CA5A,Y		  ; 39 5A CA | Logical AND with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	DEX				  ; CA | Decrement X register
	DEC $CA5A			; CE 5A CA | Decrement (absolute)
	SEC				  ; 38 | Set carry flag
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	LDX $5B			  ; A6 5B | Load from zero page into X register
	DEX				  ; CA | Decrement X register
	XBA				  ; EB | Exchange accumulator bytes
	DEX				  ; CA | Decrement X register
	ORA #$5C			 ; 09 5C | Logical OR with accumulator (immediate)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_01B
; Address: $D086C2
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_01B:
	JSR $CA5C			; 20 5C CA | Jump to subroutine
	EOR ($5C,X)		  ; 41 5C | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	JMP $5C8ECA		  ; 5C CA 8E 5C | Jump to address long
	DEX				  ; CA | Decrement X register
	LDA $CA5C,X		  ; BD 5C CA | Audio system operation
	CPX $CA5C			; EC 5C CA | Compare X register (absolute)
	EOR $3ECA,X		  ; 5D CA 3E | Exclusive OR with accumulator (absolute,X)
	EOR $75CA,X		  ; 5D CA 75 | Exclusive OR with accumulator (absolute,X)
	EOR $A1CA,X		  ; 5D CA A1 | Exclusive OR with accumulator (absolute,X)
	EOR $D4CA,X		  ; 5D CA D4 | Exclusive OR with accumulator (absolute,X)
	EOR $F9CA,X		  ; 5D CA F9 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_01C
; Address: $D086E4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_01C:
	EOR $1ECA,X		  ; 5D CA 1E | Exclusive OR with accumulator (absolute,X)
	LSR $35CA,X		  ; 5E CA 35 | Logical shift right (absolute,X)
	LSR $68CA,X		  ; 5E CA 68 | Logical shift right (absolute,X)
	LSR $94CA,X		  ; 5E CA 94 | Logical shift right (absolute,X)
	LSR $B9CA,X		  ; 5E CA B9 | Logical shift right (absolute,X)
	LSR $0ECA,X		  ; 5E CA 0E | Logical shift right (absolute,X)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	STA $CA5F,Y		  ; 99 5F CA | Audio system operation
	DEX				  ; CA | Decrement X register
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_01D
; Address: $D08706
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_01D:
	DEX				  ; CA | Decrement X register
	ROL $CA60,X		  ; 3E 60 CA | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_01E
; Address: $D0870C
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_01E:
	DEX				  ; CA | Decrement X register
	SEP #$60			 ; E2 60 | Set processor status bits
	DEX				  ; CA | Decrement X register
	ORA $CA61,Y		  ; 19 61 CA | Logical OR with accumulator (absolute,Y)
	ADC ($CA,X)		  ; 61 CA | Add with carry ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	ADC ($CA,X)		  ; 61 CA | Add with carry ((zero page,X))
	LDY $61			  ; A4 61 | Load from zero page into Y register
	DEX				  ; CA | Decrement X register
	CLD				  ; D8 | Clear decimal mode flag
	ADC ($CA,X)		  ; 61 CA | Add with carry ((zero page,X))
	DEX				  ; CA | Decrement X register
	LSR $62			  ; 46 62 | Logical shift right (zero page)
	DEX				  ; CA | Decrement X register
	ADC $CA62,Y		  ; 79 62 CA | Add with carry (absolute,Y)
	LDY $CA62			; AC 62 CA | Load from absolute address into Y register
	INC $62			  ; E6 62 | Increment (zero page)
	DEX				  ; CA | Decrement X register
	ORA ($63),Y		  ; 11 63 | Logical OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_01F
; Address: $D08736
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_01F:
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	CPX #$63			 ; E0 63 | Compare X register (immediate)
	DEX				  ; CA | Decrement X register
	STZ $CA			  ; 64 CA | Store zero to zero page
	PHA				  ; 48 | Push accumulator to stack
	STZ $CA			  ; 64 CA | Store zero to zero page
	STZ $CA			  ; 64 CA | Store zero to zero page
	STZ $CA			  ; 64 CA | Store zero to zero page
	PHX				  ; DA | Push X register to stack
	STZ $CA			  ; 64 CA | Store zero to zero page
	ADC $CA			  ; 65 CA | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_020
; Address: $D0874F
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_020:
	WDM #$65			 ; 42 65 | Reserved instruction
	DEX				  ; CA | Decrement X register
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $CA			  ; 65 CA | Add with carry (zero page)
	STZ $CA65,X		  ; 9E 65 CA | Store zero to absolute,X
	ADC $CA			  ; 65 CA | Add with carry (zero page)
	ORA $66			  ; 05 66 | Logical OR with accumulator (zero page)
	DEX				  ; CA | Decrement X register
	ROR $CA			  ; 66 CA | Rotate right (zero page)
	STA ($66),Y		  ; 91 66 | Audio system operation
	DEX				  ; CA | Decrement X register
	SBC $CA66			; ED 66 CA | Subtract with carry (absolute)
	DEX				  ; CA | Decrement X register
	AND $CA67,Y		  ; 39 67 CA | Logical AND with accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $68			  ; 10 68 | Branch if positive
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	DEX				  ; CA | Decrement X register
	STX $68			  ; 86 68 | Store X register to zero page
	DEX				  ; CA | Decrement X register
	LDA $CA68,Y		  ; B9 68 CA | Audio system operation
	BEQ $68			  ; F0 68 | Branch if equal
	DEX				  ; CA | Decrement X register
	ROL				  ; 2A | Rotate left (accumulator)
	ADC #$CA			 ; 69 CA | Add with carry (immediate)
	ADC #$CA			 ; 69 CA | Add with carry (immediate)
	ADC #$CA			 ; 69 CA | Add with carry (immediate)
	PHX				  ; DA | Push X register to stack
	ADC #$CA			 ; 69 CA | Add with carry (immediate)
	ORA $CA6A			; 0D 6A CA | Logical OR with accumulator (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_021
; Address: $D08798
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_021:
	ROR				  ; 6A | Rotate right (accumulator)
	DEX				  ; CA | Decrement X register
	ROR				  ; 6A | Rotate right (accumulator)
	DEX				  ; CA | Decrement X register
	DEC $CA6A,X		  ; DE 6A CA | Decrement (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	DEX				  ; CA | Decrement X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_025
; Address: $D087AC
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_025:
	STZ $CA6B			; 9C 6B CA | Store zero to absolute
	CPY $6B			  ; C4 6B | Compare Y register (zero page)
	DEX				  ; CA | Decrement X register
	CPX $CA6B			; EC 6B CA | Compare X register (absolute)
	JMP ($43CA)		  ; 6C CA 43 | Jump to address (absolute indirect)
	JMP ($6CCA)		  ; 6C CA 6C | Jump to address (absolute indirect)
	JMP ($9DCA)		  ; 6C CA 9D | Jump to address (absolute indirect)
	JMP ($C9CA)		  ; 6C CA C9 | Jump to address (absolute indirect)
	JMP ($F5CA)		  ; 6C CA F5 | Jump to address (absolute indirect)
	JMP ($21CA)		  ; 6C CA 21 | PPU graphics register access
	ADC $3CCA			; 6D CA 3C | Add with carry (absolute)
	ADC $69CA			; 6D CA 69 | Add with carry (absolute)
	ADC $96CA			; 6D CA 96 | Add with carry (absolute)
	ADC $C7CA			; 6D CA C7 | Add with carry (absolute)
	ADC $FECA			; 6D CA FE | Add with carry (absolute)
	ADC $23CA			; 6D CA 23 | Add with carry (absolute)
	ROR $4CCA			; 6E CA 4C | Rotate right (absolute)
	ROR $75CA			; 6E CA 75 | Rotate right (absolute)
	ROR $9ACA			; 6E CA 9A | Rotate right (absolute)
	ROR $CECA			; 6E CA CE | Rotate right (absolute)
	ROR $FBCA			; 6E CA FB | Rotate right (absolute)
	ROR $24CA			; 6E CA 24 | Rotate right (absolute)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	LDX $CA6F			; AE 6F CA | Load from absolute address into X register
	DEX				  ; CA | Decrement X register
	BVS $CA			  ; 70 CA | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	BVS $CA			  ; 70 CA | Branch if overflow set
	ADC #$70			 ; 69 70 | Add with carry (immediate)
	DEX				  ; CA | Decrement X register
	PLB				  ; AB | Pull data bank register from stack
	BVS $CA			  ; 70 CA | Branch if overflow set
	BVS $CA			  ; 70 CA | Branch if overflow set
	ADC ($CA),Y		  ; 71 CA | Add with carry ((zero page),Y)
	ADC ($CA),Y		  ; 71 CA | Add with carry ((zero page),Y)
	LDY $CA71			; AC 71 CA | Load from absolute address into Y register
	INC $71			  ; E6 71 | Increment (zero page)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEY				  ; 88 | Decrement Y register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	ORA $CA73,X		  ; 1D 73 CA | Logical OR with accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_026
; Address: $D0882D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_026:
	STZ $CA73,X		  ; 9E 73 CA | Store zero to absolute,X
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	STZ $74			  ; 64 74 | Store zero to zero page
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	CMP ($74,X)		  ; C1 74 | Compare accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	PEA #$CA74		   ; F4 74 CA | Push effective address to stack
	ROL				  ; 2A | Rotate left (accumulator)
	DEX				  ; CA | Decrement X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_027
; Address: $D08847
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_027:
	DEX				  ; CA | Decrement X register
	STA $CA75,X		  ; 9D 75 CA | Audio system operation
	DEX				  ; CA | Decrement X register
	INC $CA75,X		  ; FE 75 CA | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	DEX				  ; CA | Decrement X register
	STY $CA76			; 8C 76 CA | Store Y register to absolute address
	BNE $76			  ; D0 76 | Branch if not equal
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	EOR $CA77			; 4D 77 CA | Exclusive OR with accumulator (absolute)
	STA $CA77			; 8D 77 CA | Audio system operation
	REP #$77			 ; C2 77 | Reset processor status bits
	DEX				  ; CA | Decrement X register
	BEQ $77			  ; F0 77 | Branch if equal
	DEX				  ; CA | Decrement X register
	ASL $CA78,X		  ; 1E 78 CA | Arithmetic shift left (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	LDX #$78			 ; A2 78 | Load immediate value into X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	SEI				  ; 78 | Set interrupt disable flag
	DEX				  ; CA | Decrement X register
	ORA $CA79,Y		  ; 19 79 CA | Logical OR with accumulator (absolute,Y)
	AND $CA79,X		  ; 3D 79 CA | Logical AND with accumulator (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	ADC $85CA,Y		  ; 79 CA 85 | Add with carry (absolute,Y)
	ADC $ADCA,Y		  ; 79 CA AD | Add with carry (absolute,Y)
	ADC $DCCA,Y		  ; 79 CA DC | Add with carry (absolute,Y)
	ADC $0FCA,Y		  ; 79 CA 0F | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	DEX				  ; CA | Decrement X register
	ROL $CA7A,X		  ; 3E 7A CA | Rotate left (absolute,X)
	STY $7A			  ; 84 7A | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank20_AudioFunction_028
; Address: $D08892
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_028:
	DEX				  ; CA | Decrement X register
	LDA #$7A			 ; A9 7A | Audio system operation
	DEX				  ; CA | Decrement X register
	CMP ($7A),Y		  ; D1 7A | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	EOR ($7B,X)		  ; 41 7B | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	ADC $CA7B			; 6D 7B CA | Add with carry (absolute)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	ROR $CA7C			; 6E 7C CA | Rotate right (absolute)
	DEX				  ; CA | Decrement X register
	SBC ($7C,X)		  ; E1 7C | Subtract with carry ((zero page,X))
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	ADC $50CA,X		  ; 7D CA 50 | Add with carry (absolute,X)
	ADC $78CA,X		  ; 7D CA 78 | Add with carry (absolute,X)
	ADC $A3CA,X		  ; 7D CA A3 | Add with carry (absolute,X)
	ADC $EECA,X		  ; 7D CA EE | Add with carry (absolute,X)
	ADC $35CA,X		  ; 7D CA 35 | Add with carry (absolute,X)
	ROR $7CCA,X		  ; 7E CA 7C | Rotate right (absolute,X)
	ROR $C3CA,X		  ; 7E CA C3 | Rotate right (absolute,X)
	ROR $D6CA,X		  ; 7E CA D6 | Rotate right (absolute,X)
	ROR $68CA,X		  ; 7E CA 68 | Rotate right (absolute,X)
	BRA $50			  ; 80 50 | Branch always
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA ($55,X)		  ; 81 55 | Audio system operation
	CLV				  ; B8 | Clear overflow flag
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $9DE8			; CD E8 9D | Compare accumulator (absolute)
	ASL $00CA,X		  ; 1E CA 00 | Arithmetic shift left (absolute,X)
	ORA ($CC,X)		  ; 01 CC | Logical OR with accumulator ((zero page,X))
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BPL $16			  ; 10 16 | Branch if positive
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $D1A8			; CD A8 D1 | Compare accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	INC $00			  ; E6 00 | Increment (zero page)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $8DE8			; CD E8 8D | Compare accumulator (absolute)
	AND $4E			  ; 25 4E | Logical AND with accumulator (zero page)
	NOP				  ; EA | No operation
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_029
; Address: $D08915
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_029:
	CMP $1028			; CD 28 10 | Compare accumulator (absolute)
	BIT $68			  ; 24 68 | Test bits in accumulator (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1028			; CD 28 10 | Compare accumulator (absolute)
	ROL $68			  ; 26 68 | Rotate left (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1028			; CD 28 10 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_02A
; Address: $D08930
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_02A:
	JSL $000068		  ; 22 68 00 00 | Jump to subroutine long
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1028			; CD 28 10 | Compare accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1028			; CD 28 10 | Compare accumulator (absolute)
	BIT $5E			  ; 24 5E | Test bits in accumulator (zero page)
	PLB				  ; AB | Pull data bank register from stack
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1028			; CD 28 10 | Compare accumulator (absolute)
	ROL $5E			  ; 26 5E | Rotate left (zero page)
	BNE $04			  ; D0 04 | Branch if not equal
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1028			; CD 28 10 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_02B
; Address: $D08960
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_02B:
	JSL $00005E		  ; 22 5E 00 00 | Jump to subroutine long
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1028			; CD 28 10 | Compare accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)
	ORA $CC05,X		  ; 1D 05 CC | Logical OR with accumulator (absolute,X)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	LSR $CC05,X		  ; 5E 05 CC | Logical shift right (absolute,X)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($28),Y		  ; 91 28 | Audio system operation
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $9068			; CD 68 90 | Compare accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	LSR $CC07			; 4E 07 CC | Logical shift right (absolute)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	EOR $08			  ; 45 08 | Exclusive OR with accumulator (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $CAA8			; CD A8 CA | Compare accumulator (absolute)
	BIT $3A			  ; 24 3A | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_02C
; Address: $D089AD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_02C:
	PHP				  ; 08 | Push processor status to stack
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1DA8			; CD A8 1D | Compare accumulator (absolute)
	BIT $26			  ; 24 26 | Test bits in accumulator (zero page)
	BMI $09			  ; 30 09 | Branch if negative
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $9B68			; CD 68 9B | Compare accumulator (absolute)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_02D
; Address: $D089C1
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_02D:
	JSL $530000		  ; 22 00 00 53 | Jump to subroutine long
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	EOR $2418			; 4D 18 24 | Exclusive OR with accumulator (absolute)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1D68			; CD 68 1D | Compare accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1D68			; CD 68 1D | Compare accumulator (absolute)
	ROL $0058			; 2E 58 00 | Rotate left (absolute)
	LDA ($0A),Y		  ; B1 0A | Audio system operation
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1D68			; CD 68 1D | Compare accumulator (absolute)
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $9368			; CD 68 93 | Compare accumulator (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $DD68			; CD 68 DD | Compare accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	DEC $00			  ; C6 00 | Decrement (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1D68			; CD 68 1D | Compare accumulator (absolute)
	AND $6C			  ; 25 6C | Logical AND with accumulator (zero page)
	STY $CC0B			; 8C 0B CC | Store Y register to absolute address
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	AND $30			  ; 25 30 | Logical AND with accumulator (zero page)
	LDA				  ; BF 0B CC 5E | Load from absolute long,X into accumulator
	LDY $E8CD			; AC CD E8 | Load from absolute address into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	TSX				  ; BA | Transfer stack pointer to X register
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $CD28			; CD 28 CD | Compare accumulator (absolute)
	ASL $008E,X		  ; 1E 8E 00 | Arithmetic shift left (absolute,X)
	ROL $CC0D,X		  ; 3E 0D CC | Rotate left (absolute,X)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_02E
; Address: $D08A44
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_02E:
	INC				  ; 1A | Increment accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $5ECC			; 0D CC 5E | Logical OR with accumulator (absolute)
	LDY $A8CD			; AC CD A8 | Load from absolute address into Y register
	ORA $EA28,X		  ; 1D 28 EA | Logical OR with accumulator (absolute,X)
	CMP ($0D),Y		  ; D1 0D | Compare accumulator ((zero page),Y)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $8D28			; CD 28 8D | Compare accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_02F
; Address: $D08A60
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_02F:
	JSL $5ECC0E		  ; 22 0E CC 5E | Jump to subroutine long
	LDY $E8CD			; AC CD E8 | Load from absolute address into Y register
	TXA				  ; 8A | Transfer X register to accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL $5ECC			; 0E CC 5E | Arithmetic shift left (absolute)
	LDY $E8CD			; AC CD E8 | Load from absolute address into Y register
	PHB				  ; 8B | Push data bank register to stack
	ROL $DE			  ; 26 DE | Rotate left (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $91A8			; CD A8 91 | Compare accumulator (absolute)
	BIT $DE			  ; 24 DE | Test bits in accumulator (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1DA8			; CD A8 1D | Compare accumulator (absolute)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	ASL $5ECC			; 0E CC 5E | Arithmetic shift left (absolute)
	LDY $A8CD			; AC CD A8 | Load from absolute address into Y register
	CMP $8644,X		  ; DD 44 86 | Compare accumulator (absolute,X)
	BIT $0F			  ; 24 0F | Test bits in accumulator (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $9DA8			; CD A8 9D | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_030
; Address: $D08AA4
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_030:
	JSL $00004A		  ; 22 4A 00 00 | Jump to subroutine long
	STZ $0F			  ; 64 0F | Store zero to zero page
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $0028			; CD 28 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $0028			; CD 28 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP ($1A),Y		  ; D1 1A | Compare accumulator ((zero page),Y)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $0028			; CD 28 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $0028			; CD 28 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	AND ($CC,X)		  ; 21 CC | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_031
; Address: $D08ADB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_031:
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_032
; Address: $D08AE5
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_032:
	JSL $AC5ECC		  ; 22 CC 5E AC | Jump to subroutine long
	CMP $0028			; CD 28 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	DEC $22			  ; C6 22 | Decrement (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $0028			; CD 28 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $0028			; CD 28 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $0028			; CD 28 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	AND $CC			  ; 25 CC | Logical AND with accumulator (zero page)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	AND $CC			  ; 25 CC | Logical AND with accumulator (zero page)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP ($25,X)		  ; C1 25 | Compare accumulator ((zero page,X))
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1028			; CD 28 10 | Compare accumulator (absolute)
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	ROL $CC			  ; 26 CC | Rotate left (zero page)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	STA $4E25			; 8D 25 4E | Audio system operation
	ROL $CC			  ; 26 CC | Rotate left (zero page)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_033
; Address: $D08B4C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_033:
	JSR $0052			; 20 52 00 | Jump to subroutine
	ADC $27			  ; 65 27 | Add with carry (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1BA8			; CD A8 1B | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_034
; Address: $D08B58
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_034:
	JSR $0056			; 20 56 00 | Jump to subroutine
	LDA ($27,X)		  ; A1 27 | Audio system operation
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $8EE8			; CD E8 8E | Compare accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	TSX				  ; BA | Transfer stack pointer to X register
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_035
; Address: $D08B6D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_035:
	CMP $1028			; CD 28 10 | Compare accumulator (absolute)
	AND $8C			  ; 25 8C | Logical AND with accumulator (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $5028			; CD 28 50 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_036
; Address: $D08B7C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_036:
	JSL $000064		  ; 22 64 00 00 | Jump to subroutine long
	NOP				  ; EA | No operation
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $D028			; CD 28 D0 | Compare accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STZ $00			  ; 64 00 | Store zero to zero page
	XBA				  ; EB | Exchange accumulator bytes
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $5028			; CD 28 50 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_037
; Address: $D08B94
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_037:
	JSL $00006E		  ; 22 6E 00 00 | Jump to subroutine long
	CPX $CC27			; EC 27 CC | Compare X register (absolute)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BNE $28			  ; D0 28 | Branch if not equal
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	SBC $CC27			; ED 27 CC | Subtract with carry (absolute)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($1A),Y		  ; 11 1A | Logical OR with accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	ASL $CC4A			; 0E 4A CC | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_038
; Address: $D08BB3
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_038:
	JSR $CC4A			; 20 4A CC | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BPL $1B			  ; 10 1B | Branch if positive
	JMP $0000			; 4C 00 00 | Jump to address
	CPY $4A2E			; CC 2E 4A | Compare Y register (absolute)
	CPY $14A8			; CC A8 14 | Compare Y register (absolute)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	LDA ($4A,X)		  ; A1 4A | Audio system operation
	CPY $4B17			; CC 17 4B | Compare Y register (absolute)
	CPY $D028			; CC 28 D0 | Compare Y register (absolute)
	ASL $001E,X		  ; 1E 1E 00 | Arithmetic shift left (absolute,X)
	AND $4B			  ; 25 4B | Logical AND with accumulator (zero page)
	CPY $4B2B			; CC 2B 4B | Compare Y register (absolute)
	CPY $0B68			; CC 68 0B | Compare Y register (absolute)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $4BCF			; CC CF 4B | Compare Y register (absolute)
	CPY $5068			; CC 68 50 | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	CPY $4C0A			; CC 0A 4C | Compare Y register (absolute)
	CPY $0D28			; CC 28 0D | Compare Y register (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$4C			 ; 29 4C | Logical AND with accumulator (immediate)
	CPY $4CBB			; CC BB 4C | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_039
; Address: $D08BFD
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_039:
	CPY $CD28			; CC 28 CD | Compare Y register (absolute)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	LSR $41CC			; 4E CC 41 | Logical shift right (absolute)
	LSR $99CC			; 4E CC 99 | Logical shift right (absolute)
	ASL $1E0D,X		  ; 1E 0D 1E | Arithmetic shift left (absolute,X)
	JMP $5ECC4E		  ; 5C 4E CC 5E | Jump to address long
	LDY $A8CD			; AC CD A8 | Load from absolute address into Y register
	STX $2C50			; 8E 50 2C | Store X register to absolute address
	CPY $534D			; CC 4D 53 | Compare Y register (absolute)
	CPY $9E99			; CC 99 9E | Compare Y register (absolute)
	LSR $002C			; 4E 2C 00 | Logical shift right (absolute)
	ADC #$53			 ; 69 53 | Add with carry (immediate)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $9228			; CD 28 92 | Compare accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	PHX				  ; DA | Push X register to stack
	CPY $5441			; CC 41 54 | Compare Y register (absolute)
	CPY $0D28			; CC 28 0D | Compare Y register (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STZ $CCD3			; 9C D3 CC | Store zero to absolute
	ASL $CC55			; 0E 55 CC | Arithmetic shift left (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($24),Y		  ; 11 24 | Logical OR with accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $5512			; CC 12 55 | Compare Y register (absolute)
	CPY $0B68			; CC 68 0B | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_03A
; Address: $D08C54
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_03A:
	JSR $004A			; 20 4A 00 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	CPY $5531			; CC 31 55 | Compare Y register (absolute)
	CPY $1068			; CC 68 10 | Compare Y register (absolute)
	ROL $004A			; 2E 4A 00 | Rotate left (absolute)
	STZ $CCD3			; 9C D3 CC | Store zero to absolute
	PEA #$CC55		   ; F4 55 CC | Push effective address to stack
	PLP				  ; 28 | Pull processor status from stack
	SBC $CCD7,Y		  ; F9 D7 CC | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	CPY $9059			; CC 59 90 | Compare Y register (absolute)
	ROL $0050			; 2E 50 00 | Rotate left (absolute)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $9198			; CD 98 91 | Compare accumulator (absolute)
	ROL $0050			; 2E 50 00 | Rotate left (absolute)
	CPX #$56			 ; E0 56 | Compare X register (immediate)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $4AE8			; CD E8 4A | Compare accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	CPY $58D6			; CC D6 58 | Compare Y register (absolute)
	CPY $CD28			; CC 28 CD | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_03B
; Address: $D08C9C
; Size: 127 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_03B:
	DEC				  ; 3A | Decrement accumulator
	PLA				  ; 68 | Pull accumulator from stack
	PHX				  ; DA | Push X register to stack
	CLI				  ; 58 | Clear interrupt disable flag
	CPY $5927			; CC 27 59 | Compare Y register (absolute)
	CPY $8CE8			; CC E8 8C | Compare Y register (absolute)
	CPY $592B			; CC 2B 59 | Compare Y register (absolute)
	CPY $51A8			; CC A8 51 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	TAX				  ; AA | Transfer accumulator to X register
	CPY $592F			; CC 2F 59 | Compare Y register (absolute)
	CPY $5068			; CC 68 50 | Compare Y register (absolute)
	DEC				  ; 3A | Decrement accumulator
	CPY $5933			; CC 33 59 | Compare Y register (absolute)
	CPY $8F68			; CC 68 8F | Compare Y register (absolute)
	CPY $5934			; CC 34 59 | Compare Y register (absolute)
	CPY $0BE8			; CC E8 0B | Compare Y register (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	SBC #$59			 ; E9 59 | Subtract with carry (immediate)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1068			; CD 68 10 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ADC #$5A			 ; 69 5A | Add with carry (immediate)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $11A8			; CD A8 11 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $0AE8			; CD E8 0A | Compare accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	JMP $AC5ECC		  ; 5C CC 5E AC | Jump to address long
	CMP $0D28			; CD 28 0D | Compare accumulator (absolute)
	JMP $AC5ECC		  ; 5C CC 5E AC | Jump to address long
	CMP $1068			; CD 68 10 | Compare accumulator (absolute)
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	EOR ($5D,X)		  ; 41 5D | Exclusive OR with accumulator ((zero page,X))
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $11A8			; CD A8 11 | Compare accumulator (absolute)
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	EOR $5ECC,X		  ; 5D CC 5E | Exclusive OR with accumulator (absolute,X)
	LDY $68CD			; AC CD 68 | Load from absolute address into Y register
	STA $002A1B		  ; 8F 1B 2A 00 | Audio system operation
	DEC $5D			  ; C6 5D | Decrement (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $4D19			; CD 19 4D | Compare accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	ORA $CD06,X		  ; 1D 06 CD | Logical OR with accumulator (absolute,X)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR ($40),Y		  ; 51 40 | Exclusive OR with accumulator ((zero page),Y)
	BRA $06			  ; 80 06 | Branch always

;------------------------------------------------------------------------------
; Bank20_AudioFunction_03C
; Address: $D08D4A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_03C:
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $D057			; CD 57 D0 | Compare accumulator (absolute)
	ASL $CD			  ; 06 CD | Arithmetic shift left (zero page)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	ROL $003E			; 2E 3E 00 | Rotate left (absolute)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8B55			; CD 55 8B | Compare accumulator (absolute)
	BVC $6C			  ; 50 6C | Branch if overflow clear
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8F54			; CD 54 8F | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_03D
; Address: $D08D75
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_03D:
	JSL $490000		  ; 22 00 00 49 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $1393			; CD 93 13 | Compare accumulator (absolute)
	ROL $32			  ; 26 32 | Rotate left (zero page)
	STZ $08			  ; 64 08 | Store zero to zero page
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8D12			; CD 12 8D | Compare accumulator (absolute)
	ROL $22			  ; 26 22 | Rotate left (zero page)
	BRA $08			  ; 80 08 | Branch always
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $9191			; CD 91 91 | Compare accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA #$CD			 ; 09 CD | Logical OR with accumulator (immediate)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	BCC $10			  ; 90 10 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_03E
; Address: $D08DA4
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_03E:
	JSL $00002E		  ; 22 2E 00 00 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	ORA #$CD			 ; 09 CD | Logical OR with accumulator (immediate)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8ACE			; CD CE 8A | Compare accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	BCS $0A			  ; B0 0A | Branch if carry set
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $9068			; CD 68 90 | Compare accumulator (absolute)
	BIT $008E			; 2C 8E 00 | Test bits in accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_03F
; Address: $D08DCE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_03F:
	CPY $6064			; CC 64 60 | Compare Y register (absolute)
	CPY $8028			; CC 28 80 | Compare Y register (absolute)
	STX $0000			; 8E 00 00 | Store X register to absolute address
	STY $D7			  ; 84 D7 | Store Y register to zero page
	CPY $6064			; CC 64 60 | Compare Y register (absolute)
	CPY $4B68			; CC 68 4B | Compare Y register (absolute)
	AND #$8E			 ; 29 8E | Logical AND with accumulator (immediate)
	ROR $CC60			; 6E 60 CC | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_040
; Address: $D08DE7
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_040:
	LDA $A8CC60		  ; AF 60 CC A8 | Audio system operation
	STX $3E19			; 8E 19 3E | Store X register to absolute address
	INC $CC61,X		  ; FE 61 CC | Increment (absolute,X)
	ADC ($CC,X)		  ; 61 CC | Add with carry ((zero page,X))
	INX				  ; E8 | Increment X register
	STA $3222			; 8D 22 32 | Audio system operation
	CPY $63DE			; CC DE 63 | Compare Y register (absolute)
	CPY $4EE8			; CC E8 4E | Compare Y register (absolute)
	DEC				  ; 3A | Decrement accumulator
	EOR $CC64,X		  ; 5D 64 CC | Exclusive OR with accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STZ $CC			  ; 64 CC | Store zero to zero page
	PLP				  ; 28 | Pull processor status from stack
	BPL $22			  ; 10 22 | Branch if positive
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	BVS $65			  ; 70 65 | Branch if overflow set
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1028			; CD 28 10 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_041
; Address: $D08E1C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_041:
	JSR $0042			; 20 42 00 | Jump to subroutine
	ADC $CC			  ; 65 CC | Add with carry (zero page)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BPL $24			  ; 10 24 | Branch if positive
	WDM #$00			 ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank20_AudioFunction_042
; Address: $D08E2C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_042:
	JSR $CC66			; 20 66 CC | Jump to subroutine
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BPL $20			  ; 10 20 | Branch if positive
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $CC			  ; 65 CC | Add with carry (zero page)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BPL $24			  ; 10 24 | Branch if positive
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_043
; Address: $D08E44
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_043:
	JSR $CC66			; 20 66 CC | Jump to subroutine
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BPL $20			  ; 10 20 | Branch if positive
	ADC $CC			  ; 65 CC | Add with carry (zero page)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BPL $24			  ; 10 24 | Branch if positive

;------------------------------------------------------------------------------
; Bank20_AudioFunction_044
; Address: $D08E5C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_044:
	JSR $CC66			; 20 66 CC | Jump to subroutine
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BPL $20			  ; 10 20 | Branch if positive
	PHY				  ; 5A | Push Y register to stack
	ADC $CC			  ; 65 CC | Add with carry (zero page)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_046
; Address: $D08E74
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_046:
	JSR $CC66			; 20 66 CC | Jump to subroutine
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($23),Y		  ; 91 23 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_047
; Address: $D08E7E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_047:
	JSR $EF00			; 20 00 EF | Jump to subroutine
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($39),Y		  ; 11 39 | Logical OR with accumulator ((zero page),Y)
	LDX #$20			 ; A2 20 | Load immediate value into X register
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $1E			  ; 90 1E | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	CPY $000A			; CC 0A 00 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STY $A225			; 8C 25 A2 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank20_AudioFunction_049
; Address: $D08EA7
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_049:
	JSL $A8CA00		  ; 22 00 CA A8 | Jump to subroutine long
	BCC $2C			  ; 90 2C | Branch if carry clear
	BRA $20			  ; 80 20 | Branch always
	DEX				  ; CA | Decrement X register
	BIT $CA00			; 2C 00 CA | Test bits in accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	INC				  ; 1A | Increment accumulator
	BVS $20			  ; 70 20 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $663E			; 0D 3E 66 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_04A
; Address: $D08EC6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_04A:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $0039			; CC 39 00 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_04B
; Address: $D08ED2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_04B:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $0060			; CC 60 00 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STZ $20			  ; 64 20 | Store zero to zero page
	CPY $00A9			; CC A9 00 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_04C
; Address: $D08EE6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_04C:
	STA $501E,Y		  ; 99 1E 50 | Audio system operation
	LDA $CA00			; AD 00 CA | Audio system operation
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($34),Y		  ; 91 34 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_04D
; Address: $D08EF6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_04D:
	JSR $C400			; 20 00 C4 | Jump to subroutine
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $1A			  ; 90 1A | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	DEX				  ; CA | Decrement X register
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	STY $A225			; 8C 25 A2 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank20_AudioFunction_04E
; Address: $D08F0E
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_04E:
	JSR $EF00			; 20 00 EF | Jump to subroutine
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	STZ $20			  ; 64 20 | Store zero to zero page
	CPY $01D8			; CC D8 01 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	SEC				  ; 38 | Set carry flag
	CMP $CA00,X		  ; DD 00 CA | Compare accumulator (absolute,X)
	SEP #$00			 ; E2 00 | Set processor status bits
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BNE $19			  ; D0 19 | Branch if not equal
	CPY $01DD			; CC DD 01 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	DEX				  ; CA | Decrement X register
	INC $01			  ; E6 01 | Increment (zero page)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	DEC				  ; 3A | Decrement accumulator
	CPY $013E			; CC 3E 01 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	DEC				  ; 3A | Decrement accumulator
	CPY $01EA			; CC EA 01 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_04F
; Address: $D08F5D
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_04F:
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	STA $3E1A			; 8D 1A 3E | Audio system operation
	ADC $01			  ; 65 01 | Add with carry (zero page)
	DEX				  ; CA | Decrement X register
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $3616			; 8D 16 36 | Audio system operation
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	PEA #$CA01		   ; F4 01 CA | Push effective address to stack
	PLP				  ; 28 | Pull processor status from stack
	STA $3E1A			; 8D 1A 3E | Audio system operation
	ADC $01			  ; 65 01 | Add with carry (zero page)
	DEX				  ; CA | Decrement X register
	SED				  ; F8 | Set decimal mode flag
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	STA $00261B		  ; 8F 1B 26 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA				  ; BF 01 CA 68 | Load from absolute long,X into accumulator
	STA $00261B		  ; 8F 1B 26 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	SBC $CA01,X		  ; FD 01 CA | Subtract with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	STA ($38),Y		  ; 91 38 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_050
; Address: $D08F9E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_050:
	JSR $D300			; 20 00 D3 | Jump to subroutine
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($58),Y		  ; 91 58 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_051
; Address: $D08FAA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_051:
	JSR $1500			; 20 00 15 | Jump to subroutine
	JMP $CB00			; 4C 00 CB | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	EOR $2078,Y		  ; 59 78 20 | Exclusive OR with accumulator (absolute,Y)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($64),Y		  ; 91 64 | Audio system operation
	ROR $0020			; 6E 20 00 | Rotate right (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	ROR $88			  ; 66 88 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_052
; Address: $D08FCE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_052:
	JSR $D300			; 20 00 D3 | Jump to subroutine
	CPY $007B			; CC 7B 00 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	JMP ($205A)		  ; 6C 5A 20 | Jump to address (absolute indirect)
	CPY $007F			; CC 7F 00 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $445A			; 8D 5A 44 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_053
; Address: $D08FE6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_053:
	JSR $D300			; 20 00 D3 | Jump to subroutine
	CPY $0083			; CC 83 00 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $4E			  ; 10 4E | Branch if positive
	BRA $20			  ; 80 20 | Branch always
	CPY $00CB			; CC CB 00 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STZ $B6			  ; 64 B6 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank20_AudioFunction_054
; Address: $D08FFE
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_054:
	JSR $D300			; 20 00 D3 | Jump to subroutine
	CPY $0113			; CC 13 01 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	JMP $002068		  ; 5C 68 20 00 | Jump to address long
	CPY $0117			; CC 17 01 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA ($3A),Y		  ; 91 3A | Audio system operation
	ROR $0020			; 6E 20 00 | Rotate right (absolute)
	SBC $CB02,X		  ; FD 02 CB | Subtract with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($64),Y		  ; 91 64 | Audio system operation
	ROR $0020			; 6E 20 00 | Rotate right (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($205A)		  ; 6C 5A 20 | Jump to address (absolute indirect)
	CPY $0317			; CC 17 03 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $6B			  ; 90 6B | Branch if carry clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_055
; Address: $D0903A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_055:
	JSR $A700			; 20 00 A7 | Jump to subroutine
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	AND $CB03			; 2D 03 CB | Logical AND with accumulator (absolute)
	INX				  ; E8 | Increment X register
	ROR $B2			  ; 66 B2 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_056
; Address: $D09046
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_056:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $0331			; CC 31 03 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $30			  ; 90 30 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_057
; Address: $D09052
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_057:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $0347			; CC 47 03 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $2E			  ; 90 2E | Branch if carry clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_058
; Address: $D0905E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_058:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $034B			; CC 4B 03 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	LSR $20BA,X		  ; 5E BA 20 | Logical shift right (absolute,X)
	CPY $0286			; CC 86 02 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $B2			  ; 66 B2 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_059
; Address: $D09076
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_059:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $028A			; CC 8A 02 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_05A
; Address: $D09082
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_05A:
	JSR $DF00			; 20 00 DF | Jump to subroutine
	PHX				  ; DA | Push X register to stack
	CPY $02A5			; CC A5 02 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	INC				  ; 1A | Increment accumulator
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CPY $013D			; CC 3D 01 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($1A),Y		  ; 91 1A | Audio system operation
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	STZ $CB03,X		  ; 9E 03 CB | Store zero to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	CPY $03ED			; CC ED 03 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $003A1A		  ; 8F 1A 3A 00 | Audio system operation
	CPY $0152			; CC 52 01 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	INX				  ; E8 | Increment X register
	STA $461A			; 8D 1A 46 | Audio system operation
	PHX				  ; DA | Push X register to stack
	CPY $0167			; CC 67 01 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STX $4A1D			; 8E 1D 4A | Store X register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_05B
; Address: $D090E7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_05B:
	JSR $CB02			; 20 02 CB | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BVC $16			  ; 50 16 | Branch if overflow clear
	PHY				  ; 5A | Push Y register to stack
	CPY $0225			; CC 25 02 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CMP $6820			; CD 20 68 | Compare accumulator (absolute)
	CPY $024B			; CC 4B 02 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STX $422C			; 8E 2C 42 | Hardware register operation
	CPY $0261			; CC 61 02 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($33),Y		  ; 91 33 | Audio system operation
	CPY $0276			; CC 76 02 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $28			  ; D0 28 | Branch if not equal
	LDY $00			  ; A4 00 | Load from zero page into Y register
	CPY $027A			; CC 7A 02 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $22			  ; 50 22 | Branch if overflow clear
	LDY $00			  ; A4 00 | Load from zero page into Y register
	CPY $027E			; CC 7E 02 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_05C
; Address: $D09132
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_05C:
	PLA				  ; 68 | Pull accumulator from stack
	STA ($30),Y		  ; 91 30 | Audio system operation
	CPY $0282			; CC 82 02 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	PHX				  ; DA | Push X register to stack
	PHX				  ; DA | Push X register to stack
	CPY $047C			; CC 7C 04 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	SBC $CB04			; ED 04 CB | Subtract with carry (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	INX				  ; E8 | Increment X register
	PHX				  ; DA | Push X register to stack
	CPY $07FE			; CC FE 07 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BRA $20			  ; 80 20 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	PHX				  ; DA | Push X register to stack
	BIT $92			  ; 24 92 | Test bits in accumulator (zero page)
	CPY $082D			; CC 2D 08 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BRA $27			  ; 80 27 | Branch always
	LSR				  ; 4A | Logical shift right (accumulator)
	AND ($08),Y		  ; 31 08 | Logical AND with accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BRA $2A			  ; 80 2A | Branch always
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack
	BVS $08			  ; 70 08 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	BRA $47			  ; 80 47 | Branch always
	LDY $00			  ; A4 00 | Load from zero page into Y register
	PHP				  ; 08 | Push processor status to stack
	STY $CB08			; 8C 08 CB | Store Y register to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STA				  ; 9F 08 CB E8 | Store accumulator to absolute long,X
	STY $3642			; 8C 42 36 | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDY $08			  ; A4 08 | Load from zero page into Y register
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($3B),Y		  ; 51 3B | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_05D
; Address: $D091BC
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_05D:
	XBA				  ; EB | Exchange accumulator bytes
	CPY $08A9			; CC A9 08 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	INC				  ; 1A | Increment accumulator
	BVS $00			  ; 70 00 | Branch if overflow set
	XBA				  ; EB | Exchange accumulator bytes
	CPY $08AD			; CC AD 08 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BCC $47			  ; 90 47 | Branch if carry clear
	CPY $08B1			; CC B1 08 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BRA $28			  ; 80 28 | Branch always
	ROR $00			  ; 66 00 | Rotate right (zero page)
	PEA #$CCD1		   ; F4 D1 CC | Push effective address to stack
	LDA $CB08,Y		  ; B9 08 CB | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	ROL				  ; 2A | Rotate left (accumulator)
	WDM #$00			 ; 42 00 | Reserved instruction
	BNE $CC			  ; D0 CC | Branch if not equal
	CPY $CB08			; CC 08 CB | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STY $3642			; 8C 42 36 | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	BNE $08			  ; D0 08 | Branch if not equal
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	WDM #$4E			 ; 42 4E | Reserved instruction
	BNE $CC			  ; D0 CC | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	BCC $4A			  ; 90 4A | Branch if carry clear
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	BNE $CC			  ; D0 CC | Branch if not equal
	CMP $CB08,Y		  ; D9 08 CB | Compare accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	TXS				  ; 9A | Transfer X register to stack pointer
	AND $6A			  ; 25 6A | Logical AND with accumulator (zero page)
	CPY $08E1			; CC E1 08 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROL $0046,X		  ; 3E 46 00 | Rotate left (absolute,X)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	SBC $08			  ; E5 08 | Subtract with carry (zero page)
	INX				  ; E8 | Increment X register
	STY $3654			; 8C 54 36 | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_05E
; Address: $D0923B
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_05E:
	STA $004664		  ; 8F 64 46 00 | Audio system operation
	CPY $08EF			; CC EF 08 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	XBA				  ; EB | Exchange accumulator bytes
	CPY $08F3			; CC F3 08 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $9436			; 0D 36 94 | Logical OR with accumulator (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	STA ($3E),Y		  ; 91 3E | Audio system operation
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	CPY $0915			; CC 15 09 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $40			  ; 90 40 | Branch if carry clear
	CPY $0919			; CC 19 09 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $18			  ; 90 18 | Branch if carry clear
	CPY $091D			; CC 1D 09 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $00			  ; 84 00 | Store Y register to zero page
	CPY $0921			; CC 21 09 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	INC				  ; 1A | Increment accumulator
	STZ $00			  ; 64 00 | Store zero to zero page
	SBC $CCD7,Y		  ; F9 D7 CC | Subtract with carry (absolute,Y)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	ASL $00B8,X		  ; 1E B8 00 | Arithmetic shift left (absolute,X)
	ORA $CB0D			; 0D 0D CB | Logical OR with accumulator (absolute)
	ORA $E8CB			; 0D CB E8 | Logical OR with accumulator (absolute)
	STY $3654			; 8C 54 36 | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_05F
; Address: $D092B0
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_05F:
	ORA $E8CB			; 0D CB E8 | Logical OR with accumulator (absolute)
	STA $003E66		  ; 8F 66 3E 00 | Audio system operation
	BNE $CC			  ; D0 CC | Branch if not equal
	BVS $0D			  ; 70 0D | Branch if overflow set
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	BNE $CC			  ; D0 CC | Branch if not equal
	ORA $68CB			; 0D CB 68 | Logical OR with accumulator (absolute)
	BNE $20			  ; D0 20 | Branch if not equal
	LDY $0000,X		  ; BC 00 00 | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	ORA $CECB			; 0D CB CE | Logical OR with accumulator (absolute)
	ORA $68CB			; 0D CB 68 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_061
; Address: $D092DC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_061:
	STZ $CCD3			; 9C D3 CC | Store zero to absolute
	ORA $A8CB			; 0D CB A8 | Logical OR with accumulator (absolute)
	ASL $00C0,X		  ; 1E C0 00 | Arithmetic shift left (absolute,X)
	ORA $2ECB			; 0D CB 2E | Logical OR with accumulator (absolute)
	ASL $28CB			; 0E CB 28 | Arithmetic shift left (absolute)
	BRA $18			  ; 80 18 | Branch always
	STY $CB0E			; 8C 0E CB | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank20_AudioFunction_062
; Address: $D092F7
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_062:
	JSR $CB0F			; 20 0F CB | Jump to subroutine
	INX				  ; E8 | Increment X register
	STY $3654			; 8C 54 36 | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	STA $004664		  ; 8F 64 46 00 | Audio system operation
	CPY $0F8C			; CC 8C 0F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $18			  ; 90 18 | Branch if carry clear
	CPY $0F90			; CC 90 0F | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	XBA				  ; EB | Exchange accumulator bytes
	CPY $0FA3			; CC A3 0F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $20			  ; D0 20 | Branch if not equal
	CPY $0FA7			; CC A7 0F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $38			  ; 50 38 | Branch if overflow clear
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY $0FAB			; CC AB 0F | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROL $0046,X		  ; 3E 46 00 | Rotate left (absolute,X)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA $E8CB0F		  ; AF 0F CB E8 | Audio system operation
	TXA				  ; 8A | Transfer X register to accumulator
	RTI				  ; 40 | Return from interrupt
	CPY $0FB4			; CC B4 0F | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	XBA				  ; EB | Exchange accumulator bytes
	CPY $0FB8			; CC B8 0F | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $9436			; 0D 36 94 | Logical OR with accumulator (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDY $CB0F,X		  ; BC 0F CB | Load from absolute,X into Y register
	PLP				  ; 28 | Pull processor status from stack
	BVC $62			  ; 50 62 | Branch if overflow clear
	CPY $0FDA			; CC DA 0F | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $003E66		  ; 8F 66 3E 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_063
; Address: $D09385
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_063:
	BNE $CC			  ; D0 CC | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	PLP				  ; 28 | Pull processor status from stack
	BCC $28			  ; 90 28 | Branch if carry clear
	ROR $00			  ; 66 00 | Rotate right (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	CPY $0FFE			; CC FE 0F | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	WDM #$42			 ; 42 42 | Hardware register operation
	BNE $CC			  ; D0 CC | Branch if not equal
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	CPY $1002			; CC 02 10 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	JMP $00AE			; 4C AE 00 | Jump to address
	CPY $1006			; CC 06 10 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $53			  ; 50 53 | Branch if overflow clear
	XBA				  ; EB | Exchange accumulator bytes
	CPY $100A			; CC 0A 10 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STY $3654			; 8C 54 36 | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	BPL $CB			  ; 10 CB | Branch if positive
	INX				  ; E8 | Increment X register
	STA $006644		  ; 8F 44 66 00 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	CPY $1017			; CC 17 10 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $18			  ; 90 18 | Branch if carry clear
	CPY $101B			; CC 1B 10 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	CPY $1041			; CC 41 10 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $64			  ; 90 64 | Branch if carry clear
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPY $1065			; CC 65 10 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROL $0046,X		  ; 3E 46 00 | Rotate left (absolute,X)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLY				  ; 7A | Pull Y register from stack
	BPL $CB			  ; 10 CB | Branch if positive
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	JMP $0000			; 4C 00 00 | Jump to address

;------------------------------------------------------------------------------
; Bank20_AudioFunction_064
; Address: $D09414
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_064:
	XBA				  ; EB | Exchange accumulator bytes
	CPY $107F			; CC 7F 10 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	ROL $76			  ; 26 76 | Rotate left (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	CPY $10D7			; CC D7 10 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $9436			; 0D 36 94 | Logical OR with accumulator (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	BPL $CB			  ; 10 CB | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BVC $5F			  ; 50 5F | Branch if overflow clear
	XBA				  ; EB | Exchange accumulator bytes
	CPY $112E			; CC 2E 11 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $1B			  ; 90 1B | Branch if carry clear
	CPY $1361			; CC 61 13 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $66			  ; 90 66 | Branch if carry clear
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	BNE $CC			  ; D0 CC | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	BVC $5F			  ; 50 5F | Branch if overflow clear
	CPY $138B			; CC 8B 13 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	LDX $00			  ; A6 00 | Load from zero page into X register
	CPY $138F			; CC 8F 13 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $2A			  ; 90 2A | Branch if carry clear
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	CPY $13C6			; CC C6 13 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	TXS				  ; 9A | Transfer X register to stack pointer
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	REP #$13			 ; C2 13 | Reset processor status bits
	INX				  ; E8 | Increment X register
	TXS				  ; 9A | Transfer X register to stack pointer
	CLC				  ; 18 | Clear carry flag
	CPY $08B5			; CC B5 08 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	TXS				  ; 9A | Transfer X register to stack pointer
	PHP				  ; 08 | Push processor status to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	CMP $CB08,X		  ; DD 08 CB | Compare accumulator (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $3214			; 8D 14 32 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_065
; Address: $D094A8
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_065:
	ASL $A8CB			; 0E CB A8 | Arithmetic shift left (absolute)
	STA $3214			; 8D 14 32 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ASL $CB10			; 0E 10 CB | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	TXS				  ; 9A | Transfer X register to stack pointer
	CLC				  ; 18 | Clear carry flag
	STZ $CB13,X		  ; 9E 13 CB | Store zero to absolute,X
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $3214			; 8D 14 32 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDX #$13			 ; A2 13 | Load immediate value into X register
	PLP				  ; 28 | Pull processor status from stack
	BRA $1B			  ; 80 1B | Branch always
	DEC				  ; 3A | Decrement accumulator
	PEA #$CCD1		   ; F4 D1 CC | Push effective address to stack
	AND $09			  ; 25 09 | Logical AND with accumulator (zero page)
	INX				  ; E8 | Increment X register
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL $003E,X		  ; 1E 3E 00 | Arithmetic shift left (absolute,X)
	CPY $0FDE			; CC DE 0F | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	INC				  ; 1A | Increment accumulator
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ORA ($CB),Y		  ; 11 CB | Logical OR with accumulator ((zero page),Y)
	CMP $CB11,X		  ; DD 11 CB | Compare accumulator (absolute,X)
	ORA $1B80,Y		  ; 19 80 1B | Logical OR with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	SBC ($11,X)		  ; E1 11 | Subtract with carry ((zero page,X))
	EOR #$12			 ; 49 12 | Exclusive OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	DEC $CB12			; CE 12 CB | Decrement (absolute)
	EOR $13			  ; 45 13 | Exclusive OR with accumulator (zero page)
	INX				  ; E8 | Increment X register
	TXS				  ; 9A | Transfer X register to stack pointer
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPY $13CA			; CC CA 13 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	DEC				  ; 3A | Decrement accumulator
	CPY $13DD			; CC DD 13 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	BIT $34			  ; 24 34 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_066
; Address: $D09535
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_066:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA ($0A,X)		  ; A1 0A | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC ($0A),Y		  ; F1 0A | Subtract with carry ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($24),Y		  ; 11 24 | Logical OR with accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_067
; Address: $D0954F
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_067:
	JSR $CB0B			; 20 0B CB | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $0B			  ; 66 0B | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BPL $24			  ; 10 24 | Branch if positive
	LDA ($0B),Y		  ; B1 0B | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPY $0B			  ; C4 0B | Compare Y register (zero page)
	CPX #$0B			 ; E0 0B | Compare X register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $0FE2			; CC E2 0F | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	INC $0F			  ; E6 0F | Increment (zero page)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	CLC				  ; 18 | Clear carry flag
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPY $0FEA			; CC EA 0F | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BIT $4A			  ; 24 4A | Test bits in accumulator (zero page)
	CPY $0FEE			; CC EE 0F | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	BIT $56			  ; 24 56 | Test bits in accumulator (zero page)
	CPY $0FF2			; CC F2 0F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	CPY $0FF6			; CC F6 0F | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $1349			; CC 49 13 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_068
; Address: $D095D6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_068:
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BIT $56			  ; 24 56 | Test bits in accumulator (zero page)
	CPY $134D			; CC 4D 13 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	CLC				  ; 18 | Clear carry flag
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPY $1351			; CC 51 13 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $1355			; CC 55 13 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_069
; Address: $D095FC
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_069:
	JSL $00003E		  ; 22 3E 00 00 | Jump to subroutine long
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	EOR $CB13,Y		  ; 59 13 CB | Exclusive OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	PHB				  ; 8B | Push data bank register to stack
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	EOR $CB13,X		  ; 5D 13 CB | Exclusive OR with accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	STA $003427		  ; 8F 27 34 00 | Audio system operation
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	LDX $13			  ; A6 13 | Load from zero page into X register
	PLA				  ; 68 | Pull accumulator from stack
	BIT $56			  ; 24 56 | Test bits in accumulator (zero page)
	CPY $13AA			; CC AA 13 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	CLC				  ; 18 | Clear carry flag
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPY $13AE			; CC AE 13 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $13B2			; CC B2 13 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_06A
; Address: $D09644
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_06A:
	JSR $004A			; 20 4A 00 | Jump to subroutine
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	CLC				  ; 18 | Clear carry flag
	BNE $CC			  ; D0 CC | Branch if not equal
	TSX				  ; BA | Transfer stack pointer to X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	INC				  ; 1A | Increment accumulator
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDX $CB13,Y		  ; BE 13 CB | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_06B
; Address: $D09666
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_06B:
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	LDX #$20			 ; A2 20 | Load immediate value into X register
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	BMI $84			  ; 30 84 | Branch if negative

;------------------------------------------------------------------------------
; Bank20_AudioFunction_06C
; Address: $D09676
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_06C:
	JSR $5800			; 20 00 58 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_06D
; Address: $D09680
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_06D:
	JSL $00207E		  ; 22 7E 20 00 | Jump to subroutine long
	LDX $CB18			; AE 18 CB | Load from absolute address into X register
	DEC $18			  ; C6 18 | Decrement (zero page)
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL $5A			  ; 26 5A | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_06E
; Address: $D0968E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_06E:
	JSR $EA00			; 20 00 EA | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $A8CB,Y		  ; 19 CB A8 | Logical OR with accumulator (absolute,Y)
	EOR ($24),Y		  ; 51 24 | Exclusive OR with accumulator ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank20_AudioFunction_06F
; Address: $D0969A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_06F:
	JSR $1F00			; 20 00 1F | Jump to subroutine
	ORA $43CB,Y		  ; 19 CB 43 | Logical OR with accumulator (absolute,Y)
	ORA $E8CB,Y		  ; 19 CB E8 | Logical OR with accumulator (absolute,Y)
	BIT $209E			; 2C 9E 20 | Test bits in accumulator (absolute)
	EOR $CB19,X		  ; 5D 19 CB | Exclusive OR with accumulator (absolute,X)
	ADC $CB19,X		  ; 7D 19 CB | Add with carry (absolute,X)
	INX				  ; E8 | Increment X register
	STY $623C			; 8C 3C 62 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	REP #$19			 ; C2 19 | Reset processor status bits
	INC				  ; 1A | Increment accumulator
	PLP				  ; 28 | Pull processor status from stack
	ORA $8212			; 0D 12 82 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_070
; Address: $D096BE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_070:
	JSR $3000			; 20 00 30 | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	PLY				  ; 7A | Pull Y register from stack
	INC				  ; 1A | Increment accumulator
	PLA				  ; 68 | Pull accumulator from stack
	BCC $18			  ; 90 18 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_071
; Address: $D096CA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_071:
	JSR $AD00			; 20 00 AD | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($18),Y		  ; 91 18 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_073
; Address: $D096DE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_073:
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	PHB				  ; 8B | Push data bank register to stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_074
; Address: $D096EE
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_074:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $32			  ; 10 32 | Branch if positive
	JMP $5A0020		  ; 5C 20 00 5A | Jump to address long
	PLY				  ; 7A | Pull Y register from stack
	PLP				  ; 28 | Pull processor status from stack
	STA $6240			; 8D 40 62 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	BNE $CC			  ; D0 CC | Branch if not equal
	STZ $CB1C,X		  ; 9E 1C CB | Store zero to absolute,X
	PLP				  ; 28 | Pull processor status from stack
	BIT $0052			; 2C 52 00 | Test bits in accumulator (absolute)
	LDX #$1C			 ; A2 1C | Load immediate value into X register
	INX				  ; E8 | Increment X register
	BCC $22			  ; 90 22 | Branch if carry clear
	DEC				  ; 3A | Decrement accumulator
	ORA #$1D			 ; 09 1D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_075
; Address: $D09723
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_075:
	JSR $CB1D			; 20 1D CB | Jump to subroutine
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ROR $1D			  ; 66 1D | Rotate right (zero page)
	PLP				  ; 28 | Pull processor status from stack
	DEC				  ; 3A | Decrement accumulator
	CPY $1D6A			; CC 6A 1D | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ROR $CB1D			; 6E 1D CB | Rotate right (absolute)
	ORA $E8CB,X		  ; 1D CB E8 | Logical OR with accumulator (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	CMP ($1D),Y		  ; D1 1D | Compare accumulator ((zero page),Y)
	ORA $E8CB,X		  ; 1D CB E8 | Logical OR with accumulator (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $0036,X		  ; 1E 36 00 | Arithmetic shift left (absolute,X)
	JMP $F6CCD1		  ; 5C D1 CC F6 | Jump to address long
	ORA $28CB,X		  ; 1D CB 28 | Logical OR with accumulator (absolute,X)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	ORA $A8CB,X		  ; 1D CB A8 | Logical OR with accumulator (absolute,X)
	STA ($16),Y		  ; 91 16 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_076
; Address: $D09771
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_076:
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INC $CB1D,X		  ; FE 1D CB | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $34			  ; 90 34 | Branch if carry clear
	ROL $0040			; 2E 40 00 | Rotate left (absolute)
	BNE $CC			  ; D0 CC | Branch if not equal
	ASL $28CB,X		  ; 1E CB 28 | Arithmetic shift left (absolute,X)
	BRA $2F			  ; 80 2F | Branch always
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	CPY $1E03			; CC 03 1E | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BRA $31			  ; 80 31 | Branch always
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	CPY $1E03			; CC 03 1E | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($40),Y		  ; 91 40 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	WDM #$1E			 ; 42 1E | Reserved instruction
	PLP				  ; 28 | Pull processor status from stack
	BCC $44			  ; 90 44 | Branch if carry clear
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY $1E47			; CC 47 1E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $37			  ; 90 37 | Branch if carry clear
	PHY				  ; 5A | Push Y register to stack
	XBA				  ; EB | Exchange accumulator bytes
	CPY $1E4B			; CC 4B 1E | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($43),Y		  ; 11 43 | Logical OR with accumulator ((zero page),Y)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ASL $68CB,X		  ; 1E CB 68 | Arithmetic shift left (absolute,X)
	WDM #$6A			 ; 42 6A | Reserved instruction
	CPY $1E54			; CC 54 1E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHY				  ; 5A | Push Y register to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ASL $A8CB,X		  ; 1E CB A8 | Arithmetic shift left (absolute,X)
	STA ($16),Y		  ; 91 16 | Audio system operation
	ROR				  ; 6A | Rotate right (accumulator)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	JMP ($CB1E)		  ; 6C 1E CB | Jump to address (absolute indirect)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	BIT $0072			; 2C 72 00 | Test bits in accumulator (absolute)
	CPY $1E71			; CC 71 1E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $1E			  ; 90 1E | Branch if carry clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_077
; Address: $D09801
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_077:
	PLY				  ; 7A | Pull Y register from stack
	CPY $1E8F			; CC 8F 1E | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	AND $0082,Y		  ; 39 82 00 | Logical AND with accumulator (absolute,Y)
	CPY $1E93			; CC 93 1E | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BPL $2C			  ; 10 2C | Branch if positive
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $1E97			; CC 97 1E | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($46),Y		  ; D1 46 | Compare accumulator ((zero page),Y)
	BCC $00			  ; 90 00 | Branch if carry clear
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ASL $28CB,X		  ; 1E CB 28 | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	LDY #$1E			 ; A0 1E | Load immediate value into Y register
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	TAX				  ; AA | Transfer accumulator to X register
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	LDY $1E			  ; A4 1E | Load from zero page into Y register
	PLP				  ; 28 | Pull processor status from stack
	TAX				  ; AA | Transfer accumulator to X register
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $A8CB,X		  ; 1E CB A8 | Arithmetic shift left (absolute,X)
	STY $9E1C			; 8C 1C 9E | Store Y register to absolute address
	CPY $1EAC			; CC AC 1E | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ASL $00AE,X		  ; 1E AE 00 | Arithmetic shift left (absolute,X)
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	ASL $A8CB,X		  ; 1E CB A8 | Arithmetic shift left (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	BIT $60A6			; 2C A6 60 | Test bits in accumulator (absolute)
	CPY $1EE3			; CC E3 1E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $30			  ; 90 30 | Branch if carry clear
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	BIT $CB			  ; 24 CB | Test bits in accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $18			  ; 90 18 | Branch if carry clear
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	BIT $CB			  ; 24 CB | Test bits in accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_078
; Address: $D09890
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_078:
	WDM #$6A			 ; 42 6A | Reserved instruction
	CPY $24DF			; CC DF 24 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHY				  ; 5A | Push Y register to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	CPX $24			  ; E4 24 | Compare X register (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($1E),Y		  ; 91 1E | Audio system operation
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	SBC $CCD7,Y		  ; F9 D7 CC | Subtract with carry (absolute,Y)
	SBC #$24			 ; E9 24 | Subtract with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	SEC				  ; 38 | Set carry flag
	TSX				  ; BA | Transfer stack pointer to X register
	BNE $CC			  ; D0 CC | Branch if not equal
	SBC $CB24			; ED 24 CB | Subtract with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	DEC				  ; 3A | Decrement accumulator
	STZ $0000			; 9C 00 00 | Store zero to absolute
	CPY $24F1			; CC F1 24 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $46			  ; 90 46 | Branch if carry clear
	TSX				  ; BA | Transfer stack pointer to X register
	BNE $CC			  ; D0 CC | Branch if not equal
	BIT $CB			  ; 24 CB | Test bits in accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($46),Y		  ; D1 46 | Compare accumulator ((zero page),Y)
	BCC $00			  ; 90 00 | Branch if carry clear
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	SBC $CB24,Y		  ; F9 24 CB | Subtract with carry (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	BCC $34			  ; 90 34 | Branch if carry clear
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)
	CPY $24FE			; CC FE 24 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	SBC $CCD7,Y		  ; F9 D7 CC | Subtract with carry (absolute,Y)
	AND $CB			  ; 25 CB | Logical AND with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	DEC				  ; 3A | Decrement accumulator
	AND $CB			  ; 25 CB | Logical AND with accumulator (zero page)
	ADC $CB25,X		  ; 7D 25 CB | Add with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	TAX				  ; AA | Transfer accumulator to X register
	STA ($25,X)		  ; 81 25 | Audio system operation
	CPY $25			  ; C4 25 | Compare Y register (zero page)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_079
; Address: $D09914
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_079:
	ASL $00AE,X		  ; 1E AE 00 | Arithmetic shift left (absolute,X)
	INY				  ; C8 | Increment Y register
	AND $CB			  ; 25 CB | Logical AND with accumulator (zero page)
	ROL $CB			  ; 26 CB | Rotate left (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $A62C			; 8C 2C A6 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_07A
; Address: $D09926
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_07A:
	CPY $260F			; CC 0F 26 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_07B
; Address: $D09932
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_07B:
	CPY $265A			; CC 5A 26 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $0000			; 8E 00 00 | Store X register to absolute address
	CPY $266F			; CC 6F 26 | Compare Y register (absolute)
	ORA $2C94,Y		  ; 19 94 2C | Logical OR with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	ROL $CB			  ; 26 CB | Rotate left (zero page)
	PLY				  ; 7A | Pull Y register from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LDA				  ; BF 21 CB AC | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_07C
; Address: $D09958
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_07C:
	JSL $8012CB		  ; 22 CB 12 80 | Jump to subroutine long
	SBC $CB22,X		  ; FD 22 CB | Subtract with carry (absolute,X)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	DEC $4018			; CE 18 40 | Decrement (absolute)
	CPY $1EE7			; CC E7 1E | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	DEC $3A2C			; CE 2C 3A | Decrement (absolute)
	CPY $27E6			; CC E6 27 | Compare Y register (absolute)
	EOR $1497,Y		  ; 59 97 14 | Exclusive OR with accumulator (absolute,Y)
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	CPY $27EA			; CC EA 27 | Compare Y register (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $14			  ; 10 14 | Branch if positive
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	PEA #$CB29		   ; F4 29 CB | Push effective address to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $0094,Y		  ; 19 94 00 | Logical OR with accumulator (absolute,Y)
	EOR $CB2A,Y		  ; 59 2A CB | Exclusive OR with accumulator (absolute,Y)
	CMP ($2A),Y		  ; D1 2A | Compare accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	CPY $2B24			; CC 24 2B | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_07D
; Address: $D099BA
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_07D:
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($1C),Y		  ; 51 1C | Exclusive OR with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	INX				  ; E8 | Increment X register
	BCC $1E			  ; 90 1E | Branch if carry clear
	STZ $0000			; 9C 00 00 | Store zero to absolute
	CPY $2B3E			; CC 3E 2B | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $9E33			; 0D 33 9E | Logical OR with accumulator (absolute)
	CPY $2B53			; CC 53 2B | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BNE $4C			  ; D0 4C | Branch if not equal
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY $2B57			; CC 57 2B | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($2C),Y		  ; 91 2C | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	JMP ($CB2B)		  ; 6C 2B CB | Jump to address (absolute indirect)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	CPY $2B71			; CC 71 2B | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	SEC				  ; 38 | Set carry flag
	CPY $2B75			; CC 75 2B | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	LDX $0000,Y		  ; BE 00 00 | Load from absolute,Y into X register
	ADC $CB2B,Y		  ; 79 2B CB | Add with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $28CB			; 2C CB 28 | Test bits in accumulator (absolute)
	CMP $BE2E			; CD 2E BE | Compare accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	BIT $1BCB			; 2C CB 1B | Test bits in accumulator (absolute)
	AND $A8CB			; 2D CB A8 | Logical AND with accumulator (absolute)
	BPL $14			  ; 10 14 | Branch if positive
	LDX $0000,Y		  ; BE 00 00 | Load from absolute,Y into X register
	CPY $2D35			; CC 35 2D | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA ($31),Y		  ; 91 31 | Audio system operation
	CPY $2D72			; CC 72 2D | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STX $D238			; 8E 38 D2 | Store X register to absolute address
	CPY $2D76			; CC 76 2D | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	LSR $86			  ; 46 86 | Logical shift right (zero page)
	BNE $CC			  ; D0 CC | Branch if not equal

;------------------------------------------------------------------------------
; Bank20_AudioFunction_07E
; Address: $D09A53
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_07E:
	STA $CB35,Y		  ; 99 35 CB | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	BPL $4A			  ; 10 4A | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	STA $CB35,X		  ; 9D 35 CB | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($4A),Y		  ; 91 4A | Audio system operation
	PLY				  ; 7A | Pull Y register from stack
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	LDA ($35,X)		  ; A1 35 | Audio system operation
	INX				  ; E8 | Increment X register
	STA $00D235		  ; 8F 35 D2 00 | Audio system operation
	CPY $35A5			; CC A5 35 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($4A),Y		  ; 91 4A | Audio system operation
	PLY				  ; 7A | Pull Y register from stack
	CPY $35A9			; CC A9 35 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BNE $4C			  ; D0 4C | Branch if not equal
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY $35AD			; CC AD 35 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($2B),Y		  ; 91 2B | Audio system operation
	STA $CCD1			; 8D D1 CC | Audio system operation
	LDA ($35),Y		  ; B1 35 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	STA $003620		  ; 8F 20 36 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLY				  ; 7A | Pull Y register from stack
	AND $A8CB			; 2D CB A8 | Logical AND with accumulator (absolute)
	ORA $4622			; 0D 22 46 | Logical OR with accumulator (absolute)
	CPY $35B5			; CC B5 35 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $4A1A			; 8D 1A 4A | Audio system operation
	AND $A0CB			; 2D CB A0 | Logical AND with accumulator (absolute)
	AND $E8CB			; 2D CB E8 | Logical AND with accumulator (absolute)
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	AND $D6CB			; 2D CB D6 | Logical AND with accumulator (absolute)
	AND $68CB			; 2D CB 68 | Logical AND with accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA $CB35,Y		  ; B9 35 CB | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	STA $4A1A			; 8D 1A 4A | Audio system operation
	BNE $CC			  ; D0 CC | Branch if not equal
	LDA $CB35,X		  ; BD 35 CB | Audio system operation
	INX				  ; E8 | Increment X register
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_07F
; Address: $D09AEF
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_07F:
	CMP ($35,X)		  ; C1 35 | Compare accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $3214			; 8C 14 32 | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	AND $E8CB			; 2D CB E8 | Logical AND with accumulator (absolute)
	BCC $24			  ; 90 24 | Branch if carry clear
	DEC				  ; 3A | Decrement accumulator
	BEQ $2D			  ; F0 2D | Branch if equal
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	PHP				  ; 08 | Push processor status to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	CMP $35			  ; C5 35 | Compare accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ROL $003A			; 2E 3A 00 | Rotate left (absolute)
	CPY $35C9			; CC C9 35 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BCC $26			  ; 90 26 | Branch if carry clear
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	BNE $CC			  ; D0 CC | Branch if not equal
	CMP $CB35			; CD 35 CB | Compare accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA ($22),Y		  ; 91 22 | Audio system operation
	CPY $35D1			; CC D1 35 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STX $2E2A			; 8E 2A 2E | Store X register to absolute address
	BNE $CC			  ; D0 CC | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BCC $28			  ; 90 28 | Branch if carry clear
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	STA $CCD1			; 8D D1 CC | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $04DD			; CC DD 04 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	ROL $0116,X		  ; 3E 16 01 | Rotate left (absolute,X)
	CPY $04E1			; CC E1 04 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BCC $3D			  ; 90 3D | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank20_AudioFunction_080
; Address: $D09B72
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_080:
	CPY $04E5			; CC E5 04 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $2A			  ; 90 2A | Branch if carry clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $04E9			; CC E9 04 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_081
; Address: $D09B84
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_081:
	JSL $000104		  ; 22 04 01 00 | Jump to subroutine long
	CPY $04ED			; CC ED 04 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($32),Y		  ; 91 32 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	SBC ($04),Y		  ; F1 04 | Subtract with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($46),Y		  ; D1 46 | Compare accumulator ((zero page),Y)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $24			  ; 90 24 | Branch if carry clear
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	CPY $0500			; CC 00 05 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_082
; Address: $D09BC0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_082:
	JSR $007A			; 20 7A 00 | Jump to subroutine
	CPY $0516			; CC 16 05 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STX $7A17			; 8E 17 7A | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_083
; Address: $D09BD2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_083:
	CPY $052C			; CC 2C 05 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STX $7A47			; 8E 47 7A | Store X register to absolute address
	BRA $00			  ; 80 00 | Branch always
	CPY $0530			; CC 30 05 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	STA $005C2F		  ; 8F 2F 5C 00 | Audio system operation
	ORA $CA			  ; 05 CA | Logical OR with accumulator (zero page)
	LDA $06			  ; A5 06 | Audio system operation
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_084
; Address: $D09BEF
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_084:
	BCC $28			  ; 90 28 | Branch if carry clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ORA #$CA			 ; 09 CA | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $0905			; CC 05 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $24			  ; 90 24 | Branch if carry clear
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	CPY $090A			; CC 0A 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_085
; Address: $D09C14
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_085:
	JSR $007A			; 20 7A 00 | Jump to subroutine
	CPY $090F			; CC 0F 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STX $7A17			; 8E 17 7A | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_086
; Address: $D09C26
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_086:
	CPY $0914			; CC 14 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STX $7A47			; 8E 47 7A | Store X register to absolute address
	BRA $00			  ; 80 00 | Branch always
	CPY $0919			; CC 19 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	STA $005C2F		  ; 8F 2F 5C 00 | Audio system operation
	ASL $CA09,X		  ; 1E 09 CA | Arithmetic shift left (absolute,X)
	ORA #$CA			 ; 09 CA | Logical OR with accumulator (immediate)
	ORA $FF80,Y		  ; 19 80 FF | Logical OR with accumulator (absolute,Y)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	DEX				  ; CA | Decrement X register
	PHP				  ; 08 | Push processor status to stack
	DEX				  ; CA | Decrement X register
	CLC				  ; 18 | Clear carry flag
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ADC ($07,X)		  ; 61 07 | Add with carry ((zero page,X))
	DEX				  ; CA | Decrement X register
	PHP				  ; 08 | Push processor status to stack
	DEX				  ; CA | Decrement X register
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CPY $CA07			; CC 07 CA | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_088
; Address: $D09C68
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_088:
	JSL $000044		  ; 22 44 00 00 | Jump to subroutine long
	CPY $06E5			; CC E5 06 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	BIT $42			  ; 24 42 | Hardware register operation
	ROL				  ; 2A | Rotate left (accumulator)
	ORA #$CA			 ; 09 CA | Logical OR with accumulator (immediate)
	LSR $CA09			; 4E 09 CA | Logical shift right (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($18),Y		  ; D1 18 | Compare accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ORA #$CA			 ; 09 CA | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	ORA #$CA			 ; 09 CA | Logical OR with accumulator (immediate)
	ORA #$CA			 ; 09 CA | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BVC $2E			  ; 50 2E | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_089
; Address: $D09C9A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_089:
	JSR $D300			; 20 00 D3 | Jump to subroutine
	CPY $2E3F			; CC 3F 2E | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($19),Y		  ; 91 19 | Audio system operation
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_08A
; Address: $D09CA6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_08A:
	JSR $8D00			; 20 00 8D | Jump to subroutine
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ROL $28CB			; 2E CB 28 | Rotate left (absolute)
	BNE $44			  ; D0 44 | Branch if not equal

;------------------------------------------------------------------------------
; Bank20_AudioFunction_08B
; Address: $D09CB2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_08B:
	JSR $D300			; 20 00 D3 | Jump to subroutine
	CPY $2E6B			; CC 6B 2E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	EOR #$A6			 ; 49 A6 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_08C
; Address: $D09CBE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_08C:
	JSR $8100			; 20 00 81 | Jump to subroutine
	ROL $A2CB			; 2E CB A2 | Rotate left (absolute)
	ROL $E8CB			; 2E CB E8 | Rotate left (absolute)
	STX $8E33			; 8E 33 8E | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_08D
; Address: $D09CCE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_08D:
	CPY $2F33			; CC 33 2F | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	AND ($E6),Y		  ; 31 E6 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_08E
; Address: $D09CD6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_08E:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $2F48			; CC 48 2F | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY $2F5D			; CC 5D 2F | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $4224			; 8C 24 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_08F
; Address: $D09CF2
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_08F:
	CPY $2F72			; CC 72 2F | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	CPY $2F88			; CC 88 2F | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	JMP $9ECCD1		  ; 5C D1 CC 9E | Jump to address long
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($16),Y		  ; 91 16 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	ASL $003A,X		  ; 1E 3A 00 | Arithmetic shift left (absolute,X)
	CPY $2FCD			; CC CD 2F | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ASL $0080,X		  ; 1E 80 00 | Arithmetic shift left (absolute,X)
	CPY $2FEE			; CC EE 2F | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	INC				  ; 1A | Increment accumulator
	STZ $00			  ; 64 00 | Store zero to zero page
	CPY $3003			; CC 03 30 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $16			  ; 90 16 | Branch if carry clear
	DEC				  ; 3A | Decrement accumulator
	CLC				  ; 18 | Clear carry flag
	BMI $CB			  ; 30 CB | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BMI $CB			  ; 30 CB | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	STA $362A			; 8D 2A 36 | Audio system operation
	BMI $CB			  ; 30 CB | Branch if negative
	ROR $CB30,X		  ; 7E 30 CB | Rotate right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BMI $CB			  ; 30 CB | Branch if negative
	CMP $30			  ; C5 30 | Compare accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($25),Y		  ; D1 25 | Compare accumulator ((zero page),Y)
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	PHX				  ; DA | Push X register to stack
	BMI $CB			  ; 30 CB | Branch if negative
	AND ($CB),Y		  ; 31 CB | Logical AND with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	PHB				  ; 8B | Push data bank register to stack
	AND ($CB),Y		  ; 31 CB | Logical AND with accumulator ((zero page),Y)
	AND ($CB),Y		  ; 31 CB | Logical AND with accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	BVC $12			  ; 50 12 | Branch if overflow clear
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_090
; Address: $D09D83
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_090:
	STY $31			  ; 84 31 | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	BMI $76			  ; 30 76 | Branch if negative
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STA				  ; 9F 31 CB 68 | Store accumulator to absolute long,X
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $D768			; CD 68 D7 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	PHX				  ; DA | Push X register to stack
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $8BA8			; CD A8 8B | Compare accumulator (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_091
; Address: $D09DAE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_091:
	JSR $D300			; 20 00 D3 | Jump to subroutine
	CPY $31B9			; CC B9 31 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BPL $66			  ; 10 66 | Branch if positive
	LSR $20			  ; 46 20 | Logical shift right (zero page)
	CPY $31D2			; CC D2 31 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_092
; Address: $D09DC6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_092:
	JSR $D300			; 20 00 D3 | Jump to subroutine
	CPY $31E8			; CC E8 31 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $0020,X		  ; 5E 20 00 | Logical shift right (absolute,X)
	CPY $31FE			; CC FE 31 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $56			  ; 10 56 | Branch if positive
	LDX #$20			 ; A2 20 | Load immediate value into X register
	CPY $3213			; CC 13 32 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CMP $5A3A			; CD 3A 5A | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_093
; Address: $D09DEA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_093:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $3228			; CC 28 32 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	ROL $6082,X		  ; 3E 82 60 | Rotate left (absolute,X)
	CPY $323E			; CC 3E 32 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR $8836			; 4D 36 88 | Exclusive OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_094
; Address: $D09E06
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_094:
	CPY $3253			; CC 53 32 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CMP $3634			; CD 34 36 | Compare accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank20_AudioFunction_095
; Address: $D09E12
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_095:
	CPY $3268			; CC 68 32 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_096
; Address: $D09E1A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_096:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $328C			; CC 8C 32 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	ROR $20			  ; 66 20 | Rotate right (zero page)
	CPY $32A2			; CC A2 32 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($58),Y		  ; 51 58 | Exclusive OR with accumulator ((zero page),Y)
	ROR $0020,X		  ; 7E 20 00 | Rotate right (absolute,X)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	CLV				  ; B8 | Clear overflow flag
	PLA				  ; 68 | Pull accumulator from stack
	BCC $66			  ; 90 66 | Branch if carry clear
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_097
; Address: $D09E3E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_097:
	JSR $EF00			; 20 00 EF | Jump to subroutine
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	ORA $3216			; 0D 16 32 | Logical OR with accumulator (absolute)
	CPY $32EE			; CC EE 32 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	CPY $3303			; CC 03 33 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_098
; Address: $D09E60
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_098:
	JSR $003A			; 20 3A 00 | Jump to subroutine
	CPY $3318			; CC 18 33 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA $002E21		  ; 8F 21 2E 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ROL $CB33			; 2E 33 CB | Rotate left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $12			  ; 50 12 | Branch if overflow clear
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPY $3349			; CC 49 33 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	CPY $335F			; CC 5F 33 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($28),Y		  ; D1 28 | Compare accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	BCC $1C			  ; 90 1C | Branch if carry clear
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY $3390			; CC 90 33 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_099
; Address: $D09EAE
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_099:
	CPY $33A5			; CC A5 33 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CPY $33BA			; CC BA 33 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $33E1			; CC E1 33 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($28),Y		  ; 91 28 | Audio system operation
	AND $CB34			; 2D 34 CB | Logical AND with accumulator (absolute)
	INX				  ; E8 | Increment X register
	BCC $28			  ; 90 28 | Branch if carry clear
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)
	CPY $3447			; CC 47 34 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY $345D			; CC 5D 34 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($3A),Y		  ; D1 3A | Compare accumulator ((zero page),Y)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	INC				  ; 1A | Increment accumulator
	CPY $348D			; CC 8D 34 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $CE18			; 8D 18 CE | Audio system operation
	CPY $34A2			; CC A2 34 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $003A4A		  ; 8F 4A 3A 00 | Audio system operation
	CPY $34B7			; CC B7 34 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BNE $2A			  ; D0 2A | Branch if not equal
	DEX				  ; CA | Decrement X register
	RTI				  ; 40 | Return from interrupt
	CPY $34DD			; CC DD 34 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	REP #$00			 ; C2 00 | Reset processor status bits
	CPY $34F2			; CC F2 34 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	TAX				  ; AA | Transfer accumulator to X register
	CPY $3507			; CC 07 35 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	RTI				  ; 40 | Return from interrupt
	PHX				  ; DA | Push X register to stack
	CPY $351C			; CC 1C 35 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	EOR #$D2			 ; 49 D2 | Exclusive OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank20_AudioFunction_09A
; Address: $D09F56
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_09A:
	CPY $3531			; CC 31 35 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	PLY				  ; 7A | Pull Y register from stack
	CPY $3550			; CC 50 35 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	CPY $3565			; CC 65 35 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STZ $2E14,X		  ; 9E 14 2E | Store zero to absolute,X
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLY				  ; 7A | Pull Y register from stack
	PLP				  ; 28 | Pull processor status from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $357E			; CC 7E 35 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $10			  ; 90 10 | Branch if carry clear
	TAX				  ; AA | Transfer accumulator to X register
	CPY $3BD0			; CC D0 3B | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	BNE $14			  ; D0 14 | Branch if not equal
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	STA $00464A		  ; 8F 4A 46 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($50),Y		  ; D1 50 | Compare accumulator ((zero page),Y)
	JMP ($0000)		  ; 6C 00 00 | Jump to address (absolute indirect)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($50),Y		  ; D1 50 | Compare accumulator ((zero page),Y)
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $CB36			; 0E 36 CB | Arithmetic shift left (absolute)
	EOR #$36			 ; 49 36 | Exclusive OR with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($24),Y		  ; 51 24 | Exclusive OR with accumulator ((zero page),Y)
	STX $0000			; 8E 00 00 | Store X register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LSR $CB36			; 4E 36 CB | Logical shift right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	BNE $52			  ; D0 52 | Branch if not equal
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY $3658			; CC 58 36 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_09B
; Address: $D09FED
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_09B:
	PHY				  ; 5A | Push Y register to stack
	CPY $365C			; CC 5C 36 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CMP ($34),Y		  ; D1 34 | Compare accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_09C
; Address: $D09FFF
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_09C:
	ADC $CB36			; 6D 36 CB | Add with carry (absolute)
	INX				  ; E8 | Increment X register
	STA $009220		  ; 8F 20 92 00 | Audio system operation
	CPY $3690			; CC 90 36 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	ROL $0092,X		  ; 3E 92 00 | Rotate left (absolute,X)
	CPY $3694			; CC 94 36 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	CPY $3698			; CC 98 36 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_09D
; Address: $D0A028
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_09D:
	JSR $0072			; 20 72 00 | Jump to subroutine
	CPY $369C			; CC 9C 36 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BPL $28			  ; 10 28 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $36A0			; CC A0 36 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $003429		  ; 8F 29 34 00 | Audio system operation
	CPY $36A4			; CC A4 36 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $48			  ; 90 48 | Branch if carry clear
	TAX				  ; AA | Transfer accumulator to X register
	BNE $CC			  ; D0 CC | Branch if not equal
	XBA				  ; EB | Exchange accumulator bytes
	PLA				  ; 68 | Pull accumulator from stack
	STA $00464A		  ; 8F 4A 46 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($24),Y		  ; 51 24 | Exclusive OR with accumulator ((zero page),Y)
	STX $0000			; 8E 00 00 | Store X register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PEA #$CB36		   ; F4 36 CB | Push effective address to stack
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($2E),Y		  ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	SBC $CB36,Y		  ; F9 36 CB | Subtract with carry (absolute,Y)
	INX				  ; E8 | Increment X register
	STA $00AA20		  ; 8F 20 AA 00 | Audio system operation
	CPY $36FD			; CC FD 36 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_09E
; Address: $D0A088
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_09E:
	BMI $46			  ; 30 46 | Branch if negative
	CPY $3701			; CC 01 37 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BCC $32			  ; 90 32 | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	BNE $CC			  ; D0 CC | Branch if not equal
	INX				  ; E8 | Increment X register
	STA $004620		  ; 8F 20 46 00 | Audio system operation
	CPY $3718			; CC 18 37 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	INC				  ; 1A | Increment accumulator
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CPY $36BA			; CC BA 36 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($14),Y		  ; 51 14 | Exclusive OR with accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	CPY $371D			; CC 1D 37 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	INC				  ; 1A | Increment accumulator
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CPY $3745			; CC 45 37 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	CPY $374A			; CC 4A 37 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ROL $7E			  ; 26 7E | Rotate left (zero page)
	CPY $36BE			; CC BE 36 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPY $36C2			; CC C2 36 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $21			  ; 90 21 | PPU graphics register access
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	DEC $36			  ; C6 36 | Decrement (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	BVC $18			  ; 50 18 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	CPY $36D0			; CC D0 36 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $005E36		  ; 8F 36 5E 00 | Audio system operation
	CPY $36D4			; CC D4 36 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_09F
; Address: $D0A123
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_09F:
	BVC $1E			  ; 50 1E | Branch if overflow clear
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY $36D8			; CC D8 36 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	DEC				  ; 3A | Decrement accumulator
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CPY $36DC			; CC DC 36 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $3A28			; 8D 28 3A | Audio system operation
	SBC $CCD7,Y		  ; F9 D7 CC | Subtract with carry (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $D768			; CD 68 D7 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	PHX				  ; DA | Push X register to stack
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $91A8			; CD A8 91 | Compare accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	CPY $374E			; CC 4E 37 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	PLP				  ; 28 | Pull processor status from stack
	TXA				  ; 8A | Transfer X register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	CPY $3752			; CC 52 37 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ROL				  ; 2A | Rotate left (accumulator)
	CPY $3756			; CC 56 37 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CMP $2E1C			; CD 1C 2E | Compare accumulator (absolute)
	CPY $376C			; CC 6C 37 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	JMP ($0000)		  ; 6C 00 00 | Jump to address (absolute indirect)
	CPY $095F			; CC 5F 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0A0
; Address: $D0A19C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0A0:
	JSL $00005A		  ; 22 5A 00 00 | Jump to subroutine long
	CPY $0963			; CC 63 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	STA $622E			; 8D 2E 62 | Audio system operation
	CPY $0967			; CC 67 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	ORA ($28),Y		  ; 11 28 | Logical OR with accumulator ((zero page),Y)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0A1
; Address: $D0A1BA
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0A1:
	CPY $096B			; CC 6B 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $2C			  ; 90 2C | Branch if carry clear
	CPY $096F			; CC 6F 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	CPY $0985			; CC 85 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	ROL $4032,X		  ; 3E 32 40 | Rotate left (absolute,X)
	CPY $0989			; CC 89 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	WDM #$32			 ; 42 32 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	STA $CA09			; 8D 09 CA | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($16),Y		  ; 51 16 | Exclusive OR with accumulator ((zero page),Y)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STA ($09),Y		  ; 91 09 | Audio system operation
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $8A3D			; 8C 3D 8A | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ORA #$CA			 ; 09 CA | Logical OR with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($40),Y		  ; D1 40 | Compare accumulator ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ORA #$CA			 ; 09 CA | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	STA $622E			; 8D 2E 62 | Audio system operation
	CPY $09C4			; CC C4 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	STA ($27),Y		  ; 91 27 | Audio system operation
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	STA $CCD1			; 8D D1 CC | Audio system operation
	CMP #$09			 ; C9 09 | Compare accumulator (immediate)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $48			  ; 90 48 | Branch if carry clear
	BNE $CC			  ; D0 CC | Branch if not equal
	CMP $CA09			; CD 09 CA | Compare accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$48			 ; 42 48 | Reserved instruction

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0A2
; Address: $D0A23E
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0A2:
	CPY $09D1			; CC D1 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $8A3D			; 8C 3D 8A | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ORA #$CA			 ; 09 CA | Logical OR with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($4C),Y		  ; 91 4C | Audio system operation
	ROR $60			  ; 66 60 | Rotate right (zero page)
	BNE $CC			  ; D0 CC | Branch if not equal
	PHX				  ; DA | Push X register to stack
	ORA #$CA			 ; 09 CA | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	CPY $09DE			; CC DE 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	INC				  ; 1A | Increment accumulator
	RTI				  ; 40 | Return from interrupt
	CPY $09BB			; CC BB 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CPY $09E2			; CC E2 09 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	DEC				  ; 3A | Decrement accumulator
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INC $09			  ; E6 09 | Increment (zero page)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	DEC				  ; 3A | Decrement accumulator
	BNE $CC			  ; D0 CC | Branch if not equal
	NOP				  ; EA | No operation
	ORA #$CA			 ; 09 CA | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	STA $00261C		  ; 8F 1C 26 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA				  ; BF 09 CA 68 | Load from absolute long,X into accumulator
	STA $00261C		  ; 8F 1C 26 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INC $CA09			; EE 09 CA | Increment (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BIT $56			  ; 24 56 | Test bits in accumulator (zero page)
	ORA $4CCA,Y		  ; 19 CA 4C | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0A3
; Address: $D0A2B8
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0A3:
	ORA $28CA,Y		  ; 19 CA 28 | Logical OR with accumulator (absolute,Y)
	STZ $423A			; 9C 3A 42 | Hardware register operation
	BCS $1A			  ; B0 1A | Branch if carry set
	DEX				  ; CA | Decrement X register
	EOR $CA18,Y		  ; 59 18 CA | Exclusive OR with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	ROL $0056			; 2E 56 00 | Rotate left (absolute)
	CPY $1903			; CC 03 19 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	SEC				  ; 38 | Set carry flag
	JMP ($0000)		  ; 6C 00 00 | Jump to address (absolute indirect)
	ORA $DACA,Y		  ; 19 CA DA | Logical OR with accumulator (absolute,Y)
	ORA $28CA,Y		  ; 19 CA 28 | Logical OR with accumulator (absolute,Y)
	STA $6E27			; 8D 27 6E | Audio system operation
	CPY $1907			; CC 07 19 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BMI $92			  ; 30 92 | Branch if negative
	CPY $191C			; CC 1C 19 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0A4
; Address: $D0A2FC
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0A4:
	JSR $CA19			; 20 19 CA | Jump to subroutine
	AND #$19			 ; 29 19 | Logical AND with accumulator (immediate)
	DEX				  ; CA | Decrement X register
	EOR $FF95,Y		  ; 59 95 FF | Exclusive OR with accumulator (absolute,Y)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $55E8			; CD E8 55 | Compare accumulator (absolute)
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	CPY $1AE1			; CC E1 1A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	STA $CCD1			; 8D D1 CC | Audio system operation
	BVS $37			  ; 70 37 | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	BIT $00F2			; 2C F2 00 | Test bits in accumulator (absolute)
	CPY $3795			; CC 95 37 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $3A			  ; 90 3A | Branch if carry clear
	DEC $0000			; CE 00 00 | Decrement (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	CPY $3799			; CC 99 37 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $BA1A			; 8D 1A BA | Audio system operation
	CPY $379D			; CC 9D 37 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	AND ($AA),Y		  ; 31 AA | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0A5
; Address: $D0A352
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0A5:
	CPY $37CB			; CC CB 37 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	CPY $37CF			; CC CF 37 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CMP $7E46			; CD 46 7E | Compare accumulator (absolute)
	CPY $37D3			; CC D3 37 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $33			  ; 90 33 | Branch if carry clear
	CPY $37D7			; CC D7 37 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHX				  ; DA | Push X register to stack
	CPY $37DB			; CC DB 37 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $14			  ; 90 14 | Branch if carry clear
	DEC $0000			; CE 00 00 | Decrement (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ORA $CB38,Y		  ; 19 38 CB | Logical OR with accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	STA $00AA42		  ; 8F 42 AA 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ASL $CB38,X		  ; 1E 38 CB | Arithmetic shift left (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($1A),Y		  ; 51 1A | Exclusive OR with accumulator ((zero page),Y)
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDY $68CD			; AC CD 68 | Load from absolute address into Y register
	PHB				  ; 8B | Push data bank register to stack
	ROL				  ; 2A | Rotate left (accumulator)
	INC $00			  ; E6 00 | Increment (zero page)
	CPY $38BE			; CC BE 38 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $A82A			; 8D 2A A8 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	CPY $38C2			; CC C2 38 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	INC				  ; 1A | Increment accumulator
	STX $00			  ; 86 00 | Store X register to zero page
	CPY $38D8			; CC D8 38 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $28			  ; 90 28 | Branch if carry clear
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY $3909			; CC 09 39 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0A6
; Address: $D0A3E6
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0A6:
	PLA				  ; 68 | Pull accumulator from stack
	ROL $0078			; 2E 78 00 | Rotate left (absolute)
	CPY $393A			; CC 3A 39 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $464C			; 8D 4C 46 | Audio system operation
	CPY $394E			; CC 4E 39 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($4C),Y		  ; 51 4C | Exclusive OR with accumulator ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	STA ($39),Y		  ; 91 39 | Audio system operation
	ROR $CB3A			; 6E 3A CB | Rotate right (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($3C),Y		  ; D1 3C | Compare accumulator ((zero page),Y)
	JMP ($0000)		  ; 6C 00 00 | Jump to address (absolute indirect)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	REP #$3A			 ; C2 3A | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	BCC $36			  ; 90 36 | Branch if carry clear
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($18),Y		  ; 51 18 | Exclusive OR with accumulator ((zero page),Y)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	CPY $CB3A			; CC 3A CB | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $9E26			; 8D 26 9E | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	CPY $3EC7			; CC C7 3E | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $18			  ; 90 18 | Branch if carry clear
	BNE $CC			  ; D0 CC | Branch if not equal
	CPY $CB3E			; CC 3E CB | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	EOR $4A4A			; 4D 4A 4A | Exclusive OR with accumulator (absolute)
	CPY $3ED0			; CC D0 3E | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($4E),Y		  ; D1 4E | Compare accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $3ED5			; CC D5 3E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $40			  ; 90 40 | Branch if carry clear
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	BNE $CC			  ; D0 CC | Branch if not equal
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	LSR $9A			  ; 46 9A | Logical shift right (zero page)
	CPY $3EF7			; CC F7 3E | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0A7
; Address: $D0A47D
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0A7:
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	BMI $3B			  ; 30 3B | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	CLC				  ; 18 | Clear carry flag
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY $3B35			; CC 35 3B | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	CLC				  ; 18 | Clear carry flag
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY $3EFB			; CC FB 3E | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ROL $E8CB,X		  ; 3E CB E8 | Rotate left (absolute,X)
	STA $004618		  ; 8F 18 46 00 | Audio system operation
	CPY $3C9F			; CC 9F 3C | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $3D47			; CC 47 3D | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $3D89			; CC 89 3D | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	AND $50CB,X		  ; 3D CB 50 | Logical AND with accumulator (absolute,X)
	ROL $A8CB,X		  ; 3E CB A8 | Rotate left (absolute,X)
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $3F03			; CC 03 3F | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CLI				  ; 58 | Clear interrupt disable flag
	EOR #$F4			 ; 49 F4 | Exclusive OR with accumulator (immediate)
	CPY $3F07			; CC 07 3F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $D641,Y		  ; 99 41 D6 | Audio system operation
	CPY $3F0B			; CC 0B 3F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	EOR $DC30,Y		  ; 59 30 DC | Exclusive OR with accumulator (absolute,Y)
	EOR ($3F,X)		  ; 41 3F | Exclusive OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	EOR $FE2E,Y		  ; 59 2E FE | Exclusive OR with accumulator (absolute,Y)
	CPY $3F67			; CC 67 3F | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0A8
; Address: $D0A512
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0A8:
	PLA				  ; 68 | Pull accumulator from stack
	EOR $D620,Y		  ; 59 20 D6 | Exclusive OR with accumulator (absolute,Y)
	CPY $3F8D			; CC 8D 3F | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	LDX $0000,Y		  ; BE 00 00 | Load from absolute,Y into X register
	CPY $3FA2			; CC A2 3F | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	CPY $3FD9			; CC D9 3F | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA $00A429		  ; 8F 29 A4 00 | Audio system operation
	CPY $3FFF			; CC FF 3F | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY $4014			; CC 14 40 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLD				  ; D8 | Clear decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $403A			; CC 3A 40 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CLD				  ; D8 | Clear decimal mode flag
	JMP $00A6			; 4C A6 00 | Jump to address
	CPY $404F			; CC 4F 40 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $4085			; CC 85 40 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	BMI $EA			  ; 30 EA | Branch if negative
	CPY $4089			; CC 89 40 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CLD				  ; D8 | Clear decimal mode flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CPY $408D			; CC 8D 40 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $B04B,Y		  ; 99 4B B0 | Audio system operation
	CMP $CB43,Y		  ; D9 43 CB | Compare accumulator (absolute,Y)
	SEP #$43			 ; E2 43 | Set processor status bits
	PLP				  ; 28 | Pull processor status from stack
	STA $AE21,Y		  ; 99 21 AE | Audio system operation
	STA $CCD1			; 8D D1 CC | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	EOR $FE2E,Y		  ; 59 2E FE | Exclusive OR with accumulator (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0A9
; Address: $D0A5B0
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0A9:
	AND ($AA,X)		  ; 21 AA | Logical AND with accumulator ((zero page,X))
	STA $CCD1			; 8D D1 CC | Audio system operation
	AND ($44),Y		  ; 31 44 | Logical AND with accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CPY $4435			; CC 35 44 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	EOR #$F4			 ; 49 F4 | Exclusive OR with accumulator (immediate)
	CPY $444A			; CC 4A 44 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR $00B0			; 4E B0 00 | Logical shift right (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $00			  ; B0 00 | Branch if carry set
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $4467			; CC 67 44 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0AA
; Address: $D0A602
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0AA:
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	CPY $4139			; CC 39 41 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLD				  ; D8 | Clear decimal mode flag
	BMI $92			  ; 30 92 | Branch if negative
	EOR ($CB,X)		  ; 41 CB | Exclusive OR with accumulator ((zero page,X))
	EOR ($CB,X)		  ; 41 CB | Exclusive OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR $82			  ; 46 82 | Logical shift right (zero page)
	CPY $419B			; CC 9B 41 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	WDM #$52			 ; 42 52 | Reserved instruction
	BCS $41			  ; B0 41 | Branch if carry set
	WDM #$CB			 ; 42 CB | Reserved instruction
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	AND ($42),Y		  ; 31 42 | Hardware register operation
	WDM #$CB			 ; 42 CB | Reserved instruction

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0AB
; Address: $D0A63E
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0AB:
	PLA				  ; 68 | Pull accumulator from stack
	CLD				  ; D8 | Clear decimal mode flag
	WDM #$CB			 ; 42 CB | Reserved instruction
	WDM #$CB			 ; 42 CB | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	LDY $CB42,X		  ; BC 42 CB | Load from absolute,X into Y register
	SBC ($42,X)		  ; E1 42 | Hardware register operation
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $362C			; 9C 2C 36 | Store zero to absolute
	CPY $4307			; CC 07 43 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BIT $003A			; 2C 3A 00 | Test bits in accumulator (absolute)
	CPY $4320			; CC 20 43 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	CPY $454E			; CC 4E 45 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLD				  ; D8 | Clear decimal mode flag
	BMI $92			  ; 30 92 | Branch if negative
	CPY $4563			; CC 63 45 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR $82			  ; 46 82 | Logical shift right (zero page)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	EOR $CB			  ; 45 CB | Exclusive OR with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	WDM #$32			 ; 42 32 | Reserved instruction
	STA $CCD1			; 8D D1 CC | Audio system operation
	STA $CB45			; 8D 45 CB | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	AND $0032,X		  ; 3D 32 00 | Logical AND with accumulator (absolute,X)
	STA $CCD1			; 8D D1 CC | Audio system operation
	STA ($45),Y		  ; 91 45 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $CCD1			; 8D D1 CC | Audio system operation
	EOR $CB			  ; 45 CB | Exclusive OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	STA $CCD1			; 8D D1 CC | Audio system operation
	STA $CB45,Y		  ; 99 45 CB | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $362C			; 9C 2C 36 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0AC
; Address: $D0A6C8
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0AC:
	STA $CB45,X		  ; 9D 45 CB | Audio system operation
	CMP ($45,X)		  ; C1 45 | Compare accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	BIT $003C			; 2C 3C 00 | Test bits in accumulator (absolute)
	LSR $CB			  ; 46 CB | Logical shift right (zero page)
	AND $46			  ; 25 46 | Logical AND with accumulator (zero page)
	INX				  ; E8 | Increment X register
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LDA ($43),Y		  ; B1 43 | Audio system operation
	CMP $CB43			; CD 43 CB | Compare accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	CPY $43D1			; CC D1 43 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	ASL $002C			; 0E 2C 00 | Arithmetic shift left (absolute)
	CPY $43D5			; CC D5 43 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $0026			; 0E 26 00 | Arithmetic shift left (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	AND #$46			 ; 29 46 | Logical AND with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	WDM #$C8			 ; 42 C8 | Reserved instruction

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0AD
; Address: $D0A70E
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0AD:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $484A			; CC 4A 48 | Compare Y register (absolute)
	STA $3E9E,Y		  ; 99 9E 3E | Audio system operation
	PHY				  ; 5A | Push Y register to stack
	LSR $CB48			; 4E 48 CB | Logical shift right (absolute)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	EOR #$CB			 ; 49 CB | Exclusive OR with accumulator (immediate)
	LDA $CB49,Y		  ; B9 49 CB | Audio system operation
	INX				  ; E8 | Increment X register
	LSR $0040			; 4E 40 00 | Logical shift right (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	STZ $4B			  ; 64 4B | Store zero to zero page
	INX				  ; E8 | Increment X register
	BPL $78			  ; 10 78 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	CPY $4B68			; CC 68 4B | Compare Y register (absolute)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0AF
; Address: $D0A74E
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0AF:
	CPY $4B7D			; CC 7D 4B | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BIT $7C			  ; 24 7C | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	CPY $4B92			; CC 92 4B | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BCC $30			  ; 90 30 | Branch if carry clear
	ROL $0040			; 2E 40 00 | Rotate left (absolute)
	PHP				  ; 08 | Push processor status to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	DEC $CB4B			; CE 4B CB | Decrement (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($2C),Y		  ; 51 2C | Exclusive OR with accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	RTI				  ; 40 | Return from interrupt
	SBC #$4B			 ; E9 4B | Subtract with carry (immediate)
	INX				  ; E8 | Increment X register
	BMI $4A			  ; 30 4A | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CPY $4BFE			; CC FE 4B | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	AND $4C			  ; 25 4C | Logical AND with accumulator (zero page)
	INX				  ; E8 | Increment X register
	BMI $62			  ; 30 62 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	DEC				  ; 3A | Decrement accumulator
	JMP $51CB			; 4C CB 51 | Jump to address
	JMP $A8CB			; 4C CB A8 | Jump to address
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	EOR #$CB			 ; 49 CB | Exclusive OR with accumulator (immediate)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	STX $3A12			; 8E 12 3A | Store X register to absolute address
	CPY $48F8			; CC F8 48 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ROR $4C			  ; 66 4C | Rotate right (zero page)
	INX				  ; E8 | Increment X register
	STZ $00			  ; 64 00 | Store zero to zero page
	CPY $4C6B			; CC 6B 4C | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $6A15,Y		  ; 19 15 6A | Logical OR with accumulator (absolute,Y)
	CPY $4C6F			; CC 6F 4C | Compare Y register (absolute)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0B0
; Address: $D0A7D9
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0B0:
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	CPY $4C73			; CC 73 4C | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	TXS				  ; 9A | Transfer X register to stack pointer
	WDM #$66			 ; 42 66 | Reserved instruction
	CPY $4C77			; CC 77 4C | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	TXS				  ; 9A | Transfer X register to stack pointer
	BIT $0066			; 2C 66 00 | Test bits in accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	CPY $4C7B			; CC 7B 4C | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $8022,Y		  ; 19 22 80 | Logical OR with accumulator (absolute,Y)
	CPY $4C7F			; CC 7F 4C | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	PLY				  ; 7A | Pull Y register from stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	JMP $E8CB			; 4C CB E8 | Jump to address
	INC				  ; 1A | Increment accumulator
	LDY $00			  ; A4 00 | Load from zero page into Y register
	XBA				  ; EB | Exchange accumulator bytes
	CPY $4C88			; CC 88 4C | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $9C30,Y		  ; 99 30 9C | Audio system operation
	CPY $4C8C			; CC 8C 4C | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	BCC $4C			  ; 90 4C | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	STZ $00			  ; 64 00 | Store zero to zero page
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	JMP $E8CB			; 4C CB E8 | Jump to address
	BIT $0066			; 2C 66 00 | Test bits in accumulator (absolute)
	CPY $4CB7			; CC B7 4C | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $622E,Y		  ; 99 2E 62 | Audio system operation
	CPY $4CBB			; CC BB 4C | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	TXS				  ; 9A | Transfer X register to stack pointer
	PLA				  ; 68 | Pull accumulator from stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA				  ; BF 4C CB 68 | Load from absolute long,X into accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	JMP ($0000)		  ; 6C 00 00 | Jump to address (absolute indirect)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	JMP $E8CB			; 4C CB E8 | Jump to address
	PHX				  ; DA | Push X register to stack
	INC				  ; 1A | Increment accumulator
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0B1
; Address: $D0A87A
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0B1:
	CPY $4C95			; CC 95 4C | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY $4CAB			; CC AB 4C | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $003A,X		  ; 1D 3A 00 | Logical OR with accumulator (absolute,X)
	CPY $4CAF			; CC AF 4C | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	TXS				  ; 9A | Transfer X register to stack pointer
	INC				  ; 1A | Increment accumulator
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	JMP $E8CB			; 4C CB E8 | Jump to address
	STA $2E1E,Y		  ; 99 1E 2E | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	JMP $28CB			; 4C CB 28 | Jump to address
	CMP $8E1E			; CD 1E 8E | Compare accumulator (absolute)
	PHB				  ; 8B | Push data bank register to stack
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	STA $361A			; 8D 1A 36 | Audio system operation
	JMP $BBCB			; 4C CB BB | Jump to address
	LSR $E8CB			; 4E CB E8 | Logical shift right (absolute)
	PHB				  ; 8B | Push data bank register to stack
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CPY $4FC1			; CC C1 4F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	CPY $4FD6			; CC D6 4F | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($42),Y		  ; 91 42 | Hardware register operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	INX				  ; E8 | Increment X register
	BCC $48			  ; 90 48 | Branch if carry clear
	CPY $5006			; CC 06 50 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	DEC				  ; 3A | Decrement accumulator
	CPY $501C			; CC 1C 50 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $5032			; CC 32 50 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($48),Y		  ; 91 48 | Audio system operation
	PHA				  ; 48 | Push accumulator to stack
	BVC $CB			  ; 50 CB | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0B2
; Address: $D0A918
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0B2:
	BVC $CB			  ; 50 CB | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $0000,X		  ; BC 00 00 | Load from absolute,X into Y register
	CPY $5099			; CC 99 50 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $00A0,X		  ; 1E A0 00 | Arithmetic shift left (absolute,X)
	CPY $50C3			; CC C3 50 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CMP ($26),Y		  ; D1 26 | Compare accumulator ((zero page),Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	CPY $50D8			; CC D8 50 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	BIT $00D2			; 2C D2 00 | Test bits in accumulator (absolute)
	CPY $50F4			; CC F4 50 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BPL $1A			  ; 10 1A | Branch if positive
	INX				  ; E8 | Increment X register
	CPY $510A			; CC 0A 51 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($24),Y		  ; 91 24 | Audio system operation
	REP #$00			 ; C2 00 | Reset processor status bits
	CPY $5130			; CC 30 51 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA $682A			; 8D 2A 68 | Audio system operation
	LSR $51			  ; 46 51 | Logical shift right (zero page)
	ADC #$51			 ; 69 51 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	BCC $51			  ; 90 51 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	BCC $12			  ; 90 12 | Branch if carry clear
	STY $00			  ; 84 00 | Store Y register to zero page
	CPY $30B3			; CC B3 30 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($25),Y		  ; 91 25 | Audio system operation
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($2A),Y		  ; 51 2A | Exclusive OR with accumulator ((zero page),Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0B3
; Address: $D0A99F
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0B3:
	STY $D23F			; 8C 3F D2 | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	CMP $E654			; CD 54 E6 | Compare accumulator (absolute)
	CPY $5349			; CC 49 53 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	PHB				  ; 8B | Push data bank register to stack
	LDX $00			  ; A6 00 | Load from zero page into X register
	AND $CB54,Y		  ; 39 54 CB | Logical AND with accumulator (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	BCC $32			  ; 90 32 | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal
	CPX $54			  ; E4 54 | Compare X register (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	ASL $0082,X		  ; 1E 82 00 | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	ORA $C035			; 0D 35 C0 | Logical OR with accumulator (absolute)
	BCS $55			  ; B0 55 | Branch if carry set
	BIT $CB56			; 2C 56 CB | Test bits in accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	CPY $5686			; CC 86 56 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BCC $3B			  ; 90 3B | Branch if carry clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDA $CB56,X		  ; BD 56 CB | Audio system operation
	AND ($57,X)		  ; 21 57 | Logical AND with accumulator ((zero page,X))
	STA $168A,Y		  ; 99 8A 16 | Audio system operation
	CPX $00			  ; E4 00 | Compare X register (zero page)
	STZ $CB57			; 9C 57 CB | Store zero to absolute
	BVC $59			  ; 50 59 | Branch if overflow clear
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($2A),Y		  ; 51 2A | Exclusive OR with accumulator ((zero page),Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ADC ($CB),Y		  ; 71 CB | Add with carry ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $DE44			; 4C 44 DE | Jump to address
	ADC ($CB),Y		  ; 71 CB | Add with carry ((zero page),Y)
	ROR $CB71,X		  ; 7E 71 CB | Rotate right (absolute,X)
	INX				  ; E8 | Increment X register
	BCC $42			  ; 90 42 | Hardware register operation
	LDY $0000,X		  ; BC 00 00 | Load from absolute,X into Y register
	ADC ($CB),Y		  ; 71 CB | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0B4
; Address: $D0AA37
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0B4:
	STA $CB71,Y		  ; 99 71 CB | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPY $CB70			; CC 70 CB | Compare Y register (absolute)
	CMP ($70),Y		  ; D1 70 | Compare accumulator ((zero page),Y)
	STA $160A,Y		  ; 99 0A 16 | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	CPY $59			  ; C4 59 | Compare Y register (zero page)
	INC $CB5A			; EE 5A CB | Increment (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	INC $71			  ; E6 71 | Increment (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	ADC ($CB),Y		  ; 71 CB | Add with carry ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	ORA $3A18			; 0D 18 3A | Logical OR with accumulator (absolute)
	CPY $5C84			; CC 84 5C | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $321A,X		  ; 9D 1A 32 | Audio system operation
	BIT #$5C			 ; 89 5C | Test bits in accumulator (immediate)
	JMP $CA99CB		  ; 5C CB 99 CA | Jump to address long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0B5
; Address: $D0AA78
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0B5:
	JSL $000024		  ; 22 24 00 00 | Jump to subroutine long
	EOR $5ECB,X		  ; 5D CB 5E | Exclusive OR with accumulator (absolute,X)
	LDY $28CD			; AC CD 28 | Load from absolute address into Y register
	STA $2A18			; 8D 18 2A | Audio system operation
	CPY $5E47			; CC 47 5E | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $221A			; 8D 1A 22 | Audio system operation
	BEQ $71			  ; F0 71 | Branch if equal
	ADC ($CB),Y		  ; 71 CB | Add with carry ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $5E9B			; CC 9B 5E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $16			  ; 90 16 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0B6
; Address: $D0AAA9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0B6:
	JSL $D20000		  ; 22 00 00 D2 | Jump to subroutine long
	LSR $FBCB,X		  ; 5E CB FB | Logical shift right (absolute,X)
	LSR $28CB,X		  ; 5E CB 28 | Logical shift right (absolute,X)
	BCC $26			  ; 90 26 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0B7
; Address: $D0AAB5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0B7:
	JSL $0A0000		  ; 22 00 00 0A | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $221A			; 8D 1A 22 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	STA $004C22		  ; 8F 22 4C 00 | Audio system operation
	CPY $721C			; CC 1C 72 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0B8
; Address: $D0AAD7
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0B8:
	STA $2A18,X		  ; 9D 18 2A | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	AND ($5F,X)		  ; 21 5F | Logical AND with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($22),Y		  ; D1 22 | Compare accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	BCC $18			  ; 90 18 | Branch if carry clear
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CPY $5F67			; CC 67 5F | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $2A18,X		  ; 9D 18 2A | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($22),Y		  ; D1 22 | Compare accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	ROL $00			  ; 26 00 | Rotate left (zero page)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA ($5F,X)		  ; A1 5F | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $2E17			; 8C 17 2E | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	CMP $CB5F			; CD 5F CB | Compare accumulator (absolute)
	INX				  ; E8 | Increment X register
	STA $005220		  ; 8F 20 52 00 | Audio system operation
	CPY $5FE7			; CC E7 5F | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHY				  ; 5A | Push Y register to stack
	ASL $CB60,X		  ; 1E 60 CB | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0B9
; Address: $D0AB42
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0B9:
	TAY				  ; A8 | Transfer accumulator to Y register
	BNE $25			  ; D0 25 | Branch if not equal
	DEC				  ; 3A | Decrement accumulator
	CPY $6027			; CC 27 60 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $2E17			; 8C 17 2E | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	JMP $68CB72		  ; 5C 72 CB 68 | Jump to address long
	PHY				  ; 5A | Push Y register to stack
	ADC ($72,X)		  ; 61 72 | Add with carry ((zero page,X))
	ROR $72			  ; 66 72 | Rotate right (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $18			  ; 90 18 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0BA
; Address: $D0AB6F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0BA:
	BVS $72			  ; 70 72 | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	STA $00261B		  ; 8F 1B 26 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0BB
; Address: $D0AB79
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0BB:
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LSR $CB60,X		  ; 5E 60 CB | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $3A1E			; 0D 1E 3A | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0BD
; Address: $D0AB8A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0BD:
	PLA				  ; 68 | Pull accumulator from stack
	STA $00261B		  ; 8F 1B 26 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ADC $CB72,Y		  ; 79 72 CB | Add with carry (absolute,Y)
	ROR $CB72,X		  ; 7E 72 CB | Rotate right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PHB				  ; 8B | Push data bank register to stack
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	LDA ($72),Y		  ; B1 72 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0BE
; Address: $D0ABB0
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0BE:
	JSR $003E			; 20 3E 00 | Jump to subroutine
	CPY $72BA			; CC BA 72 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $26			  ; 90 26 | Branch if carry clear
	CPX $20			  ; E4 20 | Compare X register (zero page)
	CPY $609F			; CC 9F 60 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $2C			  ; 90 2C | Branch if carry clear
	CPX $20			  ; E4 20 | Compare X register (zero page)
	CPY $60E4			; CC E4 60 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $12			  ; 90 12 | Branch if carry clear
	ROR $0020,X		  ; 7E 20 00 | Rotate right (absolute,X)
	CPY $6120			; CC 20 61 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $4062			; 0E 62 40 | Arithmetic shift left (absolute)
	CPY $6168			; CC 68 61 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $542A			; 0E 2A 54 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0BF
; Address: $D0ABEE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0BF:
	JSR $B000			; 20 00 B0 | Jump to subroutine
	ADC ($CB,X)		  ; 61 CB | Add with carry ((zero page,X))
	ADC ($CB,X)		  ; 61 CB | Add with carry ((zero page,X))
	INX				  ; E8 | Increment X register
	INC				  ; 1A | Increment accumulator
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0C0
; Address: $D0ABFA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0C0:
	JSR $CA00			; 20 00 CA | Jump to subroutine
	ADC ($CB,X)		  ; 61 CB | Add with carry ((zero page,X))
	ADC ($CB,X)		  ; 61 CB | Add with carry ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	BCC $26			  ; 90 26 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0C2
; Address: $D0AC06
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0C2:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $61D3			; CC D3 61 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $2C			  ; 90 2C | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0C3
; Address: $D0AC12
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0C3:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $61D7			; CC D7 61 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($42),Y		  ; 51 42 | Hardware register operation
	INC $20			  ; E6 20 | Increment (zero page)
	CPY $620F			; CC 0F 62 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	LSR $8A			  ; 46 8A | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0C4
; Address: $D0AC2A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0C4:
	JSR $3600			; 20 00 36 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	STA $CA18			; 8D 18 CA | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0C5
; Address: $D0AC36
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0C5:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $629B			; CC 9B 62 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	BPL $A6			  ; 10 A6 | Branch if positive

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0C6
; Address: $D0AC42
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0C6:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $62E3			; CC E3 62 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BPL $0C			  ; 10 0C | Branch if positive
	INC $20			  ; E6 20 | Increment (zero page)
	INC				  ; 1A | Increment accumulator
	PLP				  ; 28 | Pull processor status from stack
	BCC $40			  ; 90 40 | Branch if carry clear
	LSR $0060,X		  ; 5E 60 00 | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $CB63			; 6D 63 CB | Add with carry (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0C7
; Address: $D0AC66
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0C7:
	JSR $A400			; 20 00 A4 | Jump to subroutine
	LDA #$63			 ; A9 63 | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	BCC $28			  ; 90 28 | Branch if carry clear
	SEP #$20			 ; E2 20 | Set processor status bits
	CPY $72CF			; CC CF 72 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $2A			  ; 90 2A | Branch if carry clear
	SEP #$20			 ; E2 20 | Set processor status bits
	CPY $72D3			; CC D3 72 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $47			  ; 90 47 | Branch if carry clear
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0C8
; Address: $D0AC8A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0C8:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $72D7			; CC D7 72 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $4E25			; 8D 25 4E | Audio system operation
	ADC #$CB			 ; 69 CB | Add with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	INX				  ; E8 | Increment X register
	STX $5228			; 8E 28 52 | Store X register to absolute address
	SBC $CB6A			; ED 6A CB | Subtract with carry (absolute)
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0C9
; Address: $D0ACAA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0C9:
	PLP				  ; 28 | Pull processor status from stack
	BVC $22			  ; 50 22 | Branch if overflow clear
	STZ $00			  ; 64 00 | Store zero to zero page
	TAX				  ; AA | Transfer accumulator to X register
	JMP ($EFCB)		  ; 6C CB EF | Jump to address (absolute indirect)
	JMP ($28CB)		  ; 6C CB 28 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0CA
; Address: $D0ACB8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0CA:
	JSR $0064			; 20 64 00 | Jump to subroutine
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $EFCB			; 6D CB EF | Add with carry (absolute)
	JMP ($28CB)		  ; 6C CB 28 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0CB
; Address: $D0ACC4
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0CB:
	JSR $006E			; 20 6E 00 | Jump to subroutine
	ADC $EFCB			; 6D CB EF | Add with carry (absolute)
	JMP ($28CB)		  ; 6C CB 28 | Jump to address (absolute indirect)
	BNE $28			  ; D0 28 | Branch if not equal
	STZ $00			  ; 64 00 | Store zero to zero page
	ADC $D6CB			; 6D CB D6 | Add with carry (absolute)
	ADC $28CB			; 6D CB 28 | Add with carry (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	STZ $00			  ; 64 00 | Store zero to zero page
	EOR $CB6E			; 4D 6E CB | Exclusive OR with accumulator (absolute)
	ADC $28CB			; 6D CB 28 | Add with carry (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	ROR $D6CB			; 6E CB D6 | Rotate right (absolute)
	ADC $28CB			; 6D CB 28 | Add with carry (absolute)
	BNE $28			  ; D0 28 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $6E9B			; CC 9B 6E | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $008A34		  ; 8F 34 8A 00 | Audio system operation
	CPY $6EDB			; CC DB 6E | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	CPY $6EF0			; CC F0 6E | Compare Y register (absolute)
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0CC
; Address: $D0AD2B
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0CC:
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	BNE $67			  ; D0 67 | Branch if not equal
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BVC $16			  ; 50 16 | Branch if overflow clear
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	BCC $1F			  ; 90 1F | Branch if carry clear
	STA				  ; 9F 6F CB A4 | Store accumulator to absolute long,X
	PLA				  ; 68 | Pull accumulator from stack
	DEX				  ; CA | Decrement X register
	AND $CB70			; 2D 70 CB | Logical AND with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $16			  ; 90 16 | Branch if carry clear
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPY $72DB			; CC DB 72 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $16			  ; 90 16 | Branch if carry clear
	PHY				  ; 5A | Push Y register to stack
	CPY $70BD			; CC BD 70 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	AND $42			  ; 25 42 | Hardware register operation
	CPY $3B72			; CC 72 3B | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $3221			; 8C 21 32 | Store Y register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BNE $18			  ; D0 18 | Branch if not equal
	CPY $3B7B			; CC 7B 3B | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BVC $2E			  ; 50 2E | Branch if overflow clear
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BNE $34			  ; D0 34 | Branch if not equal
	SBC $CB74,X		  ; FD 74 CB | Subtract with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	BMI $BC			  ; 30 BC | Branch if negative
	CPY $757B			; CC 7B 75 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BCC $18			  ; 90 18 | Branch if carry clear
	CPY $75BD			; CC BD 75 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0CD
; Address: $D0ADCB
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0CD:
	BCC $55			  ; 90 55 | Branch if carry clear
	CPY $75F0			; CC F0 75 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CLI				  ; 58 | Clear interrupt disable flag
	PHY				  ; 5A | Push Y register to stack
	CPY $7641			; CC 41 76 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $00AE			; 4C AE 00 | Jump to address
	CPY $7665			; CC 65 76 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	SEC				  ; 38 | Set carry flag
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $7698			; CC 98 76 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $6230			; 8D 30 62 | Audio system operation
	CPY $76FB			; CC FB 76 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	LDX $00			  ; A6 00 | Load from zero page into X register
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ROL $CB77			; 2E 77 CB | Rotate left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $1E			  ; 90 1E | Branch if carry clear
	LDX $00			  ; A6 00 | Load from zero page into X register
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ADC ($77,X)		  ; 61 77 | Add with carry ((zero page,X))
	STA $4091,Y		  ; 99 91 40 | Audio system operation
	LDX $00			  ; A6 00 | Load from zero page into X register
	LDY $CB77			; AC 77 CB | Load from absolute address into Y register
	ADC $28CB,Y		  ; 79 CB 28 | Add with carry (absolute,Y)
	BVC $2E			  ; 50 2E | Branch if overflow clear
	CPY $87DB			; CC DB 87 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $34			  ; D0 34 | Branch if not equal
	CPY $87E0			; CC E0 87 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $A6			  ; 50 A6 | Branch if overflow clear
	CPY $87E5			; CC E5 87 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	LDX $00			  ; A6 00 | Load from zero page into X register
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	SBC #$87			 ; E9 87 | Subtract with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($40),Y		  ; 91 40 | Audio system operation
	LDX $00			  ; A6 00 | Load from zero page into X register
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	SBC $CB87			; ED 87 CB | Subtract with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0CE
; Address: $D0AE68
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0CE:
	BMI $62			  ; 30 62 | Branch if negative
	CPY $87F2			; CC F2 87 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $2E1A			; 0D 1A 2E | Logical OR with accumulator (absolute)
	CPY $7A30			; CC 30 7A | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $2A16			; 8D 16 2A | Audio system operation
	BNE $CC			  ; D0 CC | Branch if not equal
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $2A12			; 8D 12 2A | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	ASL $0036,X		  ; 1E 36 00 | Arithmetic shift left (absolute,X)
	CPY $7ADD			; CC DD 7A | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA $00221B		  ; 8F 1B 22 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	EOR #$7B			 ; 49 7B | Exclusive OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	STA $00221B		  ; 8F 1B 22 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INC $CB87,X		  ; FE 87 CB | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0CF
; Address: $D0AEBC
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0CF:
	JSL $000072		  ; 22 72 00 00 | Jump to subroutine long
	CPY $7B72			; CC 72 7B | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $0062,X		  ; 1E 62 00 | Arithmetic shift left (absolute,X)
	CPY $7B96			; CC 96 7B | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BPL $2C			  ; 10 2C | Branch if positive
	JMP $BA0000		  ; 5C 00 00 BA | Jump to address long
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	DEC $582E			; CE 2E 58 | Decrement (absolute)
	INC $CB7B			; EE 7B CB | Increment (absolute)
	INC $CB7B,X		  ; FE 7B CB | Increment (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	STA $361C			; 8D 1C 36 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0D0
; Address: $D0AEF0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0D0:
	JSL $32CB7C		  ; 22 7C CB 32 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($32),Y		  ; 91 32 | Audio system operation
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	CPY $7C56			; CC 56 7C | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BVC $16			  ; 50 16 | Branch if overflow clear
	ROR				  ; 6A | Rotate right (accumulator)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0D1
; Address: $D0AF0B
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0D1:
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	ROR				  ; 6A | Rotate right (accumulator)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $16			  ; 90 16 | Branch if carry clear
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	CPY $7CD4			; CC D4 7C | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STX $5A1A			; 8E 1A 5A | Store X register to absolute address
	PHX				  ; DA | Push X register to stack
	CPY $7CF8			; CC F8 7C | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $D768			; CD 68 D7 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	PHX				  ; DA | Push X register to stack
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $D199			; CD 99 D1 | Compare accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	BVC $14			  ; 50 14 | Branch if overflow clear
	DEC				  ; 3A | Decrement accumulator
	CPY $8803			; CC 03 88 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $2C			  ; 50 2C | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0D2
; Address: $D0AF66
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0D2:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $7FFF			; CC FF 7F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $34			  ; 90 34 | Branch if carry clear
	LDY $20			  ; A4 20 | Load from zero page into Y register
	CPY $8050			; CC 50 80 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	ROL $82			  ; 26 82 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0D3
; Address: $D0AF7E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0D3:
	JSR $EB00			; 20 00 EB | Jump to subroutine
	CPY $8083			; CC 83 80 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $46			  ; 50 46 | Branch if overflow clear
	DEC $0040,X		  ; DE 40 00 | Decrement (absolute,X)
	STA ($CB,X)		  ; 81 CB | Audio system operation
	STA ($CB,X)		  ; 81 CB | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	BPL $4C			  ; 10 4C | Branch if positive
	INC $40			  ; E6 40 | Increment (zero page)
	CPY $81F0			; CC F0 81 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0D4
; Address: $D0AF9E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0D4:
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($48),Y		  ; 91 48 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	CPY $8241			; CC 41 82 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BCC $27			  ; 90 27 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0D5
; Address: $D0AFB2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0D5:
	CPY $8295			; CC 95 82 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $2C			  ; 50 2C | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0D6
; Address: $D0AFBA
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0D6:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $8807			; CC 07 88 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $32			  ; 90 32 | Branch if carry clear
	LDX #$20			 ; A2 20 | Load immediate value into X register
	CPY $881B			; CC 1B 88 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $30			  ; 90 30 | Branch if carry clear
	LDX #$20			 ; A2 20 | Load immediate value into X register
	CPY $881F			; CC 1F 88 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $4C			  ; D0 4C | Branch if not equal
	DEC $0040,X		  ; DE 40 00 | Decrement (absolute,X)
	CPY $8823			; CC 23 88 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BCC $25			  ; 90 25 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0D7
; Address: $D0AFED
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0D7:
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	DEY				  ; 88 | Decrement Y register
	PLP				  ; 28 | Pull processor status from stack
	BNE $34			  ; D0 34 | Branch if not equal
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CPY $82DE			; CC DE 82 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $005E2C		  ; 8F 2C 5E 00 | Audio system operation
	CPY $8311			; CC 11 83 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STX $4E32			; 8E 32 4E | Store X register to absolute address
	CPY $8368			; CC 68 83 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STX $4A2D			; 8E 2D 4A | Store X register to absolute address
	CPY $83CE			; CC CE 83 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $4A35			; 8D 35 4A | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0D8
; Address: $D0B02C
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0D8:
	STA $CB			  ; 85 CB | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0D9
; Address: $D0B031
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0D9:
	JMP $0000			; 4C 00 00 | Jump to address
	CPX $86			  ; E4 86 | Compare X register (zero page)
	PLP				  ; 28 | Pull processor status from stack
	EOR $5618			; 4D 18 56 | Exclusive OR with accumulator (absolute)
	CPY $8787			; CC 87 87 | Compare Y register (absolute)
	ORA $3090,Y		  ; 19 90 30 | Logical OR with accumulator (absolute,Y)
	LDY $00			  ; A4 00 | Load from zero page into Y register
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	AND #$89			 ; 29 89 | Logical AND with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BNE $4E			  ; D0 4E | Branch if not equal
	CPY $892D			; CC 2D 89 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $008229		  ; 8F 29 82 00 | Audio system operation
	CPY $8931			; CC 31 89 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	TAX				  ; AA | Transfer accumulator to X register
	CPY $8944			; CC 44 89 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	CPY $8948			; CC 48 89 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $42			  ; 90 42 | Hardware register operation
	CPY $8DE5			; CC E5 8D | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $18			  ; 50 18 | Branch if overflow clear
	LDX $0000,Y		  ; BE 00 00 | Load from absolute,Y into X register
	CPY $895E			; CC 5E 89 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	JMP $D30000		  ; 5C 00 00 D3 | Jump to address long
	CPY $8971			; CC 71 89 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $7623			; 0E 23 76 | Arithmetic shift left (absolute)
	CPY $8975			; CC 75 89 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $10			  ; 90 10 | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $8979			; CC 79 89 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	DEC				  ; 3A | Decrement accumulator
	CPY $897D			; CC 7D 89 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($2C),Y		  ; 11 2C | Logical OR with accumulator ((zero page),Y)
	LDX $0000,Y		  ; BE 00 00 | Load from absolute,Y into X register
	CPY $8981			; CC 81 89 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROL $00A6			; 2E A6 00 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0DA
; Address: $D0B0DE
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0DA:
	CPY $8994			; CC 94 89 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROL $8C			  ; 26 8C | Rotate left (zero page)
	CPY $89B7			; CC B7 89 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $4A3A			; 8E 3A 4A | Store X register to absolute address
	BNE $CC			  ; D0 CC | Branch if not equal
	SBC #$8D			 ; E9 8D | Subtract with carry (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BCC $10			  ; 90 10 | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	SBC $CB8D			; ED 8D CB | Subtract with carry (absolute)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	BMI $BA			  ; 30 BA | Branch if negative
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	SBC ($8D),Y		  ; F1 8D | Subtract with carry ((zero page),Y)
	INX				  ; E8 | Increment X register
	DEC				  ; 3A | Decrement accumulator
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CPY $8DF5			; CC F5 8D | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA $00BA28		  ; 8F 28 BA 00 | Audio system operation
	BNE $CC			  ; D0 CC | Branch if not equal
	SBC $CB8D,Y		  ; F9 8D CB | Subtract with carry (absolute,Y)
	INX				  ; E8 | Increment X register
	STA $4A36			; 8D 36 4A | Audio system operation
	BNE $CC			  ; D0 CC | Branch if not equal
	SBC $CB8D,X		  ; FD 8D CB | Subtract with carry (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BCC $23			  ; 90 23 | Branch if carry clear
	SEI				  ; 78 | Set interrupt disable flag
	CPY $8E01			; CC 01 8E | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $24			  ; D0 24 | Branch if not equal
	BCS $00			  ; B0 00 | Branch if carry set
	CPY $89BB			; CC BB 89 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $7A1F			; 8D 1F 7A | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA				  ; BF 89 CB 28 | Load from absolute long,X into accumulator
	BCC $14			  ; 90 14 | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $89C4			; CC C4 89 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STX $7E22			; 8E 22 7E | Store X register to absolute address
	CPY $89C8			; CC C8 89 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STX $7A1F			; 8E 1F 7A | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0DB
; Address: $D0B179
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0DB:
	STX $A3CB			; 8E CB A3 | Store X register to absolute address
	STX $98CB			; 8E CB 98 | Store X register to absolute address
	STZ $9614,X		  ; 9E 14 96 | Store zero to absolute,X
	STY $5ECB			; 8C CB 5E | Store Y register to absolute address
	LDY $97CD			; AC CD 97 | Load from absolute address into Y register
	STZ $9618,X		  ; 9E 18 96 | Store zero to absolute,X
	STY $5ECB			; 8C CB 5E | Store Y register to absolute address
	LDY $96CD			; AC CD 96 | Load from absolute address into Y register
	STZ $961C,X		  ; 9E 1C 96 | Store zero to absolute,X
	STA $5ECB			; 8D CB 5E | Audio system operation
	LDY $28CD			; AC CD 28 | Load from absolute address into Y register
	BVC $32			  ; 50 32 | Branch if overflow clear
	DEC				  ; 3A | Decrement accumulator
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPY $8EA7			; CC A7 8E | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $3A			  ; D0 3A | Branch if not equal
	DEC				  ; 3A | Decrement accumulator
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPY $8EAB			; CC AB 8E | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	ASL $4838			; 0E 38 48 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	CPY $8EAF			; CC AF 8E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STZ $0040			; 9C 40 00 | Store zero to absolute
	CPY $8EB3			; CC B3 8E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	AND $40A2,X		  ; 3D A2 40 | Logical AND with accumulator (absolute,X)
	CPY $8EB7			; CC B7 8E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	AND $9E			  ; 25 9E | Logical AND with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	CPY $8EBB			; CC BB 8E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	STZ $0020			; 9C 20 00 | Store zero to absolute
	CPY $8EBF			; CC BF 8E | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BNE $1C			  ; D0 1C | Branch if not equal
	STX $40			  ; 86 40 | Store X register to zero page
	CPY $8EC3			; CC C3 8E | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $24			  ; 50 24 | Branch if overflow clear
	LSR $40			  ; 46 40 | Logical shift right (zero page)
	STX $EACB			; 8E CB EA | Store X register to absolute address
	STX $28CB			; 8E CB 28 | Store X register to absolute address
	BNE $48			  ; D0 48 | Branch if not equal
	LSR $40			  ; 46 40 | Logical shift right (zero page)
	INC $CB8E			; EE 8E CB | Increment (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0DC
; Address: $D0B217
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0DC:
	ORA ($8F),Y		  ; 11 8F | Logical OR with accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $408650		  ; 8F 50 86 40 | Audio system operation
	STA $8F4CCB		  ; 8F CB 4C 8F | Audio system operation
	BCC $10			  ; 90 10 | Branch if carry clear
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0DD
; Address: $D0B22A
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0DD:
	JSR $DF00			; 20 00 DF | Jump to subroutine
	PHX				  ; DA | Push X register to stack
	CPY $8F50			; CC 50 8F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPY $8FAE			; CC AE 8F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STY $40			  ; 84 40 | Store Y register to zero page
	CPY $8FB2			; CC B2 8F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $0040			; 6E 40 00 | Rotate right (absolute)
	CPY $8FB6			; CC B6 8F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $32			  ; 50 32 | Branch if overflow clear
	DEC				  ; 3A | Decrement accumulator
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPY $921F			; CC 1F 92 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $3A			  ; D0 3A | Branch if not equal
	DEC				  ; 3A | Decrement accumulator
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPY $9224			; CC 24 92 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	XBA				  ; EB | Exchange accumulator bytes
	CPY $9228			; CC 28 92 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	LDX #$40			 ; A2 40 | Load immediate value into X register
	CPY $922D			; CC 2D 92 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	LDX $40			  ; A6 40 | Load from zero page into X register
	ROL $93			  ; 26 93 | Rotate left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	AND ($12,X)		  ; 21 12 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	CPY $935D			; CC 5D 93 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $4C			  ; 90 4C | Branch if carry clear
	LSR $0040,X		  ; 5E 40 00 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0DE
; Address: $D0B2A5
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0DE:
	BNE $CC			  ; D0 CC | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	BCC $1C			  ; 90 1C | Branch if carry clear
	LSR $0040,X		  ; 5E 40 00 | Logical shift right (absolute,X)
	BNE $CC			  ; D0 CC | Branch if not equal
	ROR $93			  ; 66 93 | Rotate right (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BCC $20			  ; 90 20 | Branch if carry clear
	LSR $0040,X		  ; 5E 40 00 | Logical shift right (absolute,X)
	BNE $CC			  ; D0 CC | Branch if not equal
	ROR				  ; 6A | Rotate right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $405E50		  ; 8F 50 5E 40 | Audio system operation
	BNE $CC			  ; D0 CC | Branch if not equal
	ROR $CB93			; 6E 93 CB | Rotate right (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	CPY $8FBE			; CC BE 8F | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STZ $3222			; 9C 22 32 | Store zero to absolute
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	REP #$8F			 ; C2 8F | Reset processor status bits
	PLP				  ; 28 | Pull processor status from stack
	ASL $003E,X		  ; 1E 3E 00 | Arithmetic shift left (absolute,X)
	CPY $8FC7			; CC C7 8F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $1E			  ; 50 1E | Branch if overflow clear
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $8FCB			; CC CB 8F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $26			  ; D0 26 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $8FCF			; CC CF 8F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	CPY $8FD3			; CC D3 8F | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	AND ($66),Y		  ; 31 66 | Logical AND with accumulator ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	CPY $8FD7			; CC D7 8F | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	ROL $003A			; 2E 3A 00 | Rotate left (absolute)
	CPY $8FDB			; CC DB 8F | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CPY $8FDF			; CC DF 8F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0DF
; Address: $D0B33B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0DF:
	BVC $1E			  ; 50 1E | Branch if overflow clear
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $9372			; CC 72 93 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $26			  ; D0 26 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	ROL $003C			; 2E 3C 00 | Rotate left (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLY				  ; 7A | Pull Y register from stack
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	BMI $44			  ; 30 44 | Branch if negative
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ROR $CB93,X		  ; 7E 93 CB | Rotate right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0E0
; Address: $D0B36C
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0E0:
	JSR $0052			; 20 52 00 | Jump to subroutine
	CPY $8FE3			; CC E3 8F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $D1			  ; B0 D1 | Branch if carry set
	CPY $9382			; CC 82 93 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA $93			  ; A5 93 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	STZ $3221			; 9C 21 32 | Store zero to absolute
	CPY $93A9			; CC A9 93 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	STA $CCD1			; 8D D1 CC | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	ROL $52			  ; 26 52 | Rotate left (zero page)
	CPY $93E3			; CC E3 93 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	AND ($3C,X)		  ; 21 3C | Logical AND with accumulator ((zero page,X))
	CPY $93E7			; CC E7 93 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STA ($CB),Y		  ; 91 CB | Audio system operation
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0E1
; Address: $D0B3DD
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0E1:
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDY $28CD			; AC CD 28 | Load from absolute address into Y register
	DEC				  ; 3A | Decrement accumulator
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDY $28CD			; AC CD 28 | Load from absolute address into Y register
	BRA $30			  ; 80 30 | Branch always
	LSR				  ; 4A | Logical shift right (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	BRA $42			  ; 80 42 | Hardware register operation
	BRA $00			  ; 80 00 | Branch always
	CPY $98			  ; C4 98 | Compare Y register (zero page)
	BVC $99			  ; 50 99 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	ROL $211E,X		  ; 3E 1E 21 | PPU graphics register access
	CPY $9955			; CC 55 99 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	LSR $1E			  ; 46 1E | Logical shift right (zero page)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CPY $9959			; CC 59 99 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BIT $40B2			; 2C B2 40 | Test bits in accumulator (absolute)
	CPY $995D			; CC 5D 99 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	CLI				  ; 58 | Clear interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPY $9972			; CC 72 99 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $00A0,X		  ; 7E A0 00 | Rotate right (absolute,X)
	CPY $9987			; CC 87 99 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP $CB99			; CD 99 CB | Compare accumulator (absolute)
	ORA $CB9A,Y		  ; 19 9A CB | Logical OR with accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	AND $003E,X		  ; 3D 3E 00 | Logical AND with accumulator (absolute,X)
	CPY $9A24			; CC 24 9A | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STX $D642			; 8E 42 D6 | Store X register to absolute address
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	AND $CB9A,Y		  ; 39 9A CB | Logical AND with accumulator (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($33),Y		  ; 91 33 | Audio system operation
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	CPY $9A3E			; CC 3E 9A | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	CPY $9A42			; CC 42 9A | Compare Y register (absolute)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0E2
; Address: $D0B480
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0E2:
	AND $0092,Y		  ; 39 92 00 | Logical AND with accumulator (absolute,Y)
	CPY $9A46			; CC 46 9A | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $8645			; 8D 45 86 | Audio system operation
	CPY $9A4A			; CC 4A 9A | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROR				  ; 6A | Rotate right (accumulator)
	LSR $CB9A			; 4E 9A CB | Logical shift right (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $2D			  ; 90 2D | Branch if carry clear
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	CPY $9A86			; CC 86 9A | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $51			  ; 90 51 | Branch if carry clear
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	CPY $9A8A			; CC 8A 9A | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $5422			; 8D 22 54 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STX $CB9A			; 8E 9A CB | Store X register to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	STA $003E23		  ; 8F 23 3E 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($2E),Y		  ; 91 2E | Audio system operation
	ROR				  ; 6A | Rotate right (accumulator)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	PLA				  ; 68 | Pull accumulator from stack
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	CPY $9A9D			; CC 9D 9A | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($24),Y		  ; 91 24 | Audio system operation
	BRA $00			  ; 80 00 | Branch always
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA ($9A,X)		  ; A1 9A | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	BMI $8E			  ; 30 8E | Branch if negative
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA $9A			  ; A5 9A | Audio system operation
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	BMI $7E			  ; 30 7E | Branch if negative
	BNE $CC			  ; D0 CC | Branch if not equal
	LDA #$9A			 ; A9 9A | Audio system operation
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0E3
; Address: $D0B50F
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0E3:
	STA $8E2A			; 8D 2A 8E | Audio system operation
	BNE $CC			  ; D0 CC | Branch if not equal
	LDA $CB9A			; AD 9A CB | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $24			  ; 90 24 | Branch if carry clear
	STX $0000			; 8E 00 00 | Store X register to absolute address
	PHP				  ; 08 | Push processor status to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA ($9A),Y		  ; B1 9A | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	STA $006434		  ; 8F 34 64 00 | Audio system operation
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	AND $CA0A,X		  ; 3D 0A CA | Logical AND with accumulator (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($36),Y		  ; D1 36 | Compare accumulator ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	CPY $0A47			; CC 47 0A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	ROR				  ; 6A | Rotate right (accumulator)
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	EOR ($0A),Y		  ; 51 0A | Exclusive OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	ADC $0A			  ; 65 0A | Add with carry (zero page)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $0A6F			; CC 6F 0A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BVC $42			  ; 50 42 | Hardware register operation
	CPY $0A79			; CC 79 0A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	CPY $D3F7			; CC F7 D3 | Compare Y register (absolute)
	CPY $51A8			; CC A8 51 | Compare Y register (absolute)
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ADC $CA0A,X		  ; 7D 0A CA | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($46),Y		  ; D1 46 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0E4
; Address: $D0B599
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0E4:
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	BIT $9A			  ; 24 9A | Test bits in accumulator (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	CPY $0A87			; CC 87 0A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	PHY				  ; 5A | Push Y register to stack
	CPY $0A8B			; CC 8B 0A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	CMP $EE3A			; CD 3A EE | Compare accumulator (absolute)
	CPY $0A8F			; CC 8F 0A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	DEC				  ; 3A | Decrement accumulator
	LDX $00			  ; A6 00 | Load from zero page into X register
	CPY $0A93			; CC 93 0A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $BA2A			; 8D 2A BA | Audio system operation
	CPY $0A97			; CC 97 0A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $E440			; 8C 40 E4 | Store Y register to absolute address
	CPY $0A9B			; CC 9B 0A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($0C),Y		  ; 51 0C | Exclusive OR with accumulator ((zero page),Y)
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STY $11			  ; 84 11 | Store Y register to zero page
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	BNE $CC			  ; D0 CC | Branch if not equal
	BIT #$11			 ; 89 11 | Test bits in accumulator (immediate)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	STA $EA34			; 8D 34 EA | Audio system operation
	BNE $CC			  ; D0 CC | Branch if not equal
	STA $CA11			; 8D 11 CA | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	DEC				  ; 3A | Decrement accumulator
	INC $0000			; EE 00 00 | Increment (absolute)
	CPY $1191			; CC 91 11 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0E5
; Address: $D0B615
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0E5:
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $EA38			; 8C 38 EA | Store Y register to absolute address
	CPY $1195			; CC 95 11 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($0C),Y		  ; 51 0C | Exclusive OR with accumulator ((zero page),Y)
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($46),Y		  ; D1 46 | Compare accumulator ((zero page),Y)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	BIT $9A			  ; 24 9A | Test bits in accumulator (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	CPY $1410			; CC 10 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	PHY				  ; 5A | Push Y register to stack
	CPY $1415			; CC 15 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	DEC				  ; 3A | Decrement accumulator
	PHY				  ; 5A | Push Y register to stack
	CPY $1419			; CC 19 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	CMP $EE3A			; CD 3A EE | Compare accumulator (absolute)
	CPY $141D			; CC 1D 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	DEC				  ; 3A | Decrement accumulator
	LDX $00			  ; A6 00 | Load from zero page into X register
	CPY $1421			; CC 21 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $BA2A			; 8D 2A BA | Audio system operation
	CPY $1425			; CC 25 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $E440			; 8C 40 E4 | Store Y register to absolute address
	CPY $142A			; CC 2A 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0E6
; Address: $D0B68F
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0E6:
	EOR ($0C),Y		  ; 51 0C | Exclusive OR with accumulator ((zero page),Y)
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STA				  ; 9F 15 CA 68 | Store accumulator to absolute long,X
	PHB				  ; 8B | Push data bank register to stack
	BNE $CC			  ; D0 CC | Branch if not equal
	LDY $15			  ; A4 15 | Load from zero page into Y register
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	STA $EA34			; 8D 34 EA | Audio system operation
	BNE $CC			  ; D0 CC | Branch if not equal
	TAY				  ; A8 | Transfer accumulator to Y register
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	DEC				  ; 3A | Decrement accumulator
	INC $0000			; EE 00 00 | Increment (absolute)
	CPY $15AC			; CC AC 15 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $EA38			; 8C 38 EA | Store Y register to absolute address
	CPY $15B0			; CC B0 15 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	BIT $0082			; 2C 82 00 | Test bits in accumulator (absolute)
	ADC #$16			 ; 69 16 | Add with carry (immediate)
	DEX				  ; CA | Decrement X register
	STX $CA16			; 8E 16 CA | Store X register to absolute address
	PLP				  ; 28 | Pull processor status from stack
	CMP $EE3A			; CD 3A EE | Compare accumulator (absolute)
	CPY $169E			; CC 9E 16 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	DEC				  ; 3A | Decrement accumulator
	LDX $00			  ; A6 00 | Load from zero page into X register
	CPY $1696			; CC 96 16 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $BA2A			; 8D 2A BA | Audio system operation
	CPY $16A2			; CC A2 16 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $E440			; 8C 40 E4 | Store Y register to absolute address
	CPY $169A			; CC 9A 16 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BCC $0C			  ; 90 0C | Branch if carry clear
	BNE $CC			  ; D0 CC | Branch if not equal
	LDX $16			  ; A6 16 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0E7
; Address: $D0B711
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0E7:
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	STA $00221A		  ; 8F 1A 22 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STA				  ; 9F 0A CA 68 | Store accumulator to absolute long,X
	STA $00221A		  ; 8F 1A 22 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STA $CA11,Y		  ; 99 11 CA | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $2E1A			; 0D 1A 2E | Logical OR with accumulator (absolute)
	CPY $119E			; CC 9E 11 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	STA $00221A		  ; 8F 1A 22 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ROL $CA14			; 2E 14 CA | Rotate left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA $00221A		  ; 8F 1A 22 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $2E1A			; 0D 1A 2E | Logical OR with accumulator (absolute)
	CPY $15B9			; CC B9 15 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $2E1A			; 0D 1A 2E | Logical OR with accumulator (absolute)
	CMP ($16,X)		  ; C1 16 | Compare accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	BCC $16			  ; 90 16 | Branch if carry clear
	CPY $0AA4			; CC A4 0A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	BCC $16			  ; 90 16 | Branch if carry clear
	CPY $1433			; CC 33 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	BCC $16			  ; 90 16 | Branch if carry clear
	CPY $16AA			; CC AA 16 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0E8
; Address: $D0B78C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0E8:
	JSR $0032			; 20 32 00 | Jump to subroutine
	CPY $0AAF			; CC AF 0A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	JMP $3220			; 4C 20 32 | Jump to address
	CPY $11A2			; CC A2 11 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0E9
; Address: $D0B7A1
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0E9:
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	WDM #$00			 ; 42 00 | Reserved instruction
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDX $11			  ; A6 11 | Load from zero page into X register
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	JMP $3220			; 4C 20 32 | Jump to address
	CPY $15BD			; CC BD 15 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	WDM #$00			 ; 42 00 | Reserved instruction
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	REP #$15			 ; C2 15 | Reset processor status bits
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	CPY $16AE			; CC AE 16 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0EA
; Address: $D0B7D4
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0EA:
	JSR $0032			; 20 32 00 | Jump to subroutine
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA $CA16,Y		  ; B9 16 CA | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($16),Y		  ; 91 16 | Audio system operation
	WDM #$00			 ; 42 00 | Reserved instruction
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	BVC $14			  ; 50 14 | Branch if overflow clear
	CPY $11AA			; CC AA 11 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($16),Y		  ; 91 16 | Audio system operation
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY $11AE			; CC AE 11 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($16),Y		  ; 91 16 | Audio system operation
	WDM #$00			 ; 42 00 | Reserved instruction
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	BVC $14			  ; 50 14 | Branch if overflow clear
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	BVC $14			  ; 50 14 | Branch if overflow clear
	CPY $15C6			; CC C6 15 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0EB
; Address: $D0B81A
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0EB:
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($16),Y		  ; 91 16 | Audio system operation
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY $15DD			; CC DD 15 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BPL $12			  ; 10 12 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPY $16BD			; CC BD 16 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BCC $61			  ; 90 61 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	XBA				  ; EB | Exchange accumulator bytes
	CPY $0B34			; CC 34 0B | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $42			  ; 90 42 | Hardware register operation
	JMP $0000			; 4C 00 00 | Jump to address
	CPY $0B3B			; CC 3B 0B | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BCC $56			  ; 90 56 | Branch if carry clear
	XBA				  ; EB | Exchange accumulator bytes
	CPY $11C9			; CC C9 11 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BCC $61			  ; 90 61 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	XBA				  ; EB | Exchange accumulator bytes
	CPY $1455			; CC 55 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $42			  ; 90 42 | Hardware register operation
	JMP $0000			; 4C 00 00 | Jump to address
	CPY $145A			; CC 5A 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STA $005631		  ; 8F 31 56 00 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	CPY $145E			; CC 5E 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BCC $56			  ; 90 56 | Branch if carry clear
	XBA				  ; EB | Exchange accumulator bytes
	CPY $15E2			; CC E2 15 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STA $005631		  ; 8F 31 56 00 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0EC
; Address: $D0B88E
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0EC:
	CPY $15F9			; CC F9 15 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STA $004E31		  ; 8F 31 4E 00 | Audio system operation
	CPY $176D			; CC 6D 17 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	AND ($5A),Y		  ; 31 5A | Logical AND with accumulator ((zero page),Y)
	ADC ($17),Y		  ; 71 17 | Add with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register
	LDY $17			  ; A4 17 | Load from zero page into Y register
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BCC $61			  ; 90 61 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	XBA				  ; EB | Exchange accumulator bytes
	CPY $16CE			; CC CE 16 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	STA $AA29,X		  ; 9D 29 AA | Audio system operation
	ASL $CA0C,X		  ; 1E 0C CA | Arithmetic shift left (absolute,X)
	LSR $0C			  ; 46 0C | Logical shift right (zero page)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $24			  ; 90 24 | Branch if carry clear
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	LDY $CA17,X		  ; BC 17 CA | Load from absolute,X into Y register
	REP #$17			 ; C2 17 | Reset processor status bits
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $5E28			; 8E 28 5E | Store X register to absolute address
	CPY $0C4E			; CC 4E 0C | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $1C			  ; 90 1C | Branch if carry clear
	TSX				  ; BA | Transfer stack pointer to X register
	CPY $0C52			; CC 52 0C | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	DEX				  ; CA | Decrement X register
	STA $E8CA0C		  ; 8F 0C CA E8 | Audio system operation
	AND $00A2,X		  ; 3D A2 00 | Logical AND with accumulator (absolute,X)
	CPY $0C97			; CC 97 0C | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $26			  ; 90 26 | Branch if carry clear
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0ED
; Address: $D0B908
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0ED:
	ORA $28CA			; 0D CA 28 | Logical OR with accumulator (absolute)
	BCC $2C			  ; 90 2C | Branch if carry clear
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	ORA $8CCA			; 0D CA 8C | Logical OR with accumulator (absolute)
	ORA $28CA			; 0D CA 28 | Logical OR with accumulator (absolute)
	BIT $BC			  ; 24 BC | Test bits in accumulator (zero page)
	BCC $0D			  ; 90 0D | Branch if carry clear
	DEX				  ; CA | Decrement X register
	BEQ $0D			  ; F0 0D | Branch if equal
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	ROL $00BC			; 2E BC 00 | Rotate left (absolute)
	SED				  ; F8 | Set decimal mode flag
	ORA $2BCA			; 0D CA 2B | Logical OR with accumulator (absolute)
	ASL $28CA			; 0E CA 28 | Arithmetic shift left (absolute)
	BCC $28			  ; 90 28 | Branch if carry clear
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	CPY $0E33			; CC 33 0E | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $2A			  ; 90 2A | Branch if carry clear
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	CPY $0E37			; CC 37 0E | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $24			  ; 90 24 | Branch if carry clear
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	LDY $CA17,X		  ; BC 17 CA | Load from absolute,X into Y register
	REP #$17			 ; C2 17 | Reset processor status bits
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $8A1E			; 8E 1E 8A | Store X register to absolute address
	BNE $CC			  ; D0 CC | Branch if not equal
	ORA ($CA),Y		  ; 11 CA | Logical OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	BCC $1C			  ; 90 1C | Branch if carry clear
	TSX				  ; BA | Transfer stack pointer to X register
	CPY $11D6			; CC D6 11 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STY $B234			; 8C 34 B2 | Store Y register to absolute address
	BNE $CC			  ; D0 CC | Branch if not equal
	ORA ($CA),Y		  ; 11 CA | Logical OR with accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ORA ($CA),Y		  ; 11 CA | Logical OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	BPL $36			  ; 10 36 | Branch if positive

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0EE
; Address: $D0B985
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0EE:
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	ORA ($CA),Y		  ; 11 CA | Logical OR with accumulator ((zero page),Y)
	SBC $CA11			; ED 11 CA | Subtract with carry (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BIT $BC			  ; 24 BC | Test bits in accumulator (zero page)
	BCC $0D			  ; 90 0D | Branch if carry clear
	DEX				  ; CA | Decrement X register
	ORA $CA12,X		  ; 1D 12 CA | Logical OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	ROL $00BC			; 2E BC 00 | Rotate left (absolute)
	SED				  ; F8 | Set decimal mode flag
	ORA $27CA			; 0D CA 27 | Logical OR with accumulator (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $28			  ; 90 28 | Branch if carry clear
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	CPY $122C			; CC 2C 12 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $2A			  ; 90 2A | Branch if carry clear
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	CPY $1231			; CC 31 12 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $22			  ; 90 22 | Branch if carry clear
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	CPY $1854			; CC 54 18 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $5E28			; 8E 28 5E | Store X register to absolute address
	CPY $14B1			; CC B1 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $1C			  ; 90 1C | Branch if carry clear
	TSX				  ; BA | Transfer stack pointer to X register
	CPY $14B5			; CC B5 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	LDA $CA14,Y		  ; B9 14 CA | Audio system operation
	LDX $CA14,Y		  ; BE 14 CA | Load from absolute,Y into X register
	INX				  ; E8 | Increment X register
	AND $00A4,X		  ; 3D A4 00 | Logical AND with accumulator (absolute,X)
	CPY $14C3			; CC C3 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $26			  ; 90 26 | Branch if carry clear
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	CPY $14C7			; CC C7 14 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0EF
; Address: $D0BA05
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0EF:
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $2C			  ; 90 2C | Branch if carry clear
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	CPY $14CB			; CC CB 14 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $28			  ; 90 28 | Branch if carry clear
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $2A			  ; 90 2A | Branch if carry clear
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	DEX				  ; CA | Decrement X register
	ROR $CA15,X		  ; 7E 15 CA | Rotate right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	INC $00			  ; E6 00 | Increment (zero page)
	CPY $1589			; CC 89 15 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STA $AA29			; 8D 29 AA | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STA $CA15			; 8D 15 CA | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	BCC $22			  ; 90 22 | Branch if carry clear
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	CPY $1854			; CC 54 18 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $8A1E			; 8E 1E 8A | Store X register to absolute address
	BNE $CC			  ; D0 CC | Branch if not equal
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $1C			  ; 90 1C | Branch if carry clear
	TSX				  ; BA | Transfer stack pointer to X register
	CPY $1606			; CC 06 16 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STY $B234			; 8C 34 B2 | Store Y register to absolute address
	BNE $CC			  ; D0 CC | Branch if not equal
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	BNE $CC			  ; D0 CC | Branch if not equal
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BPL $36			  ; 10 36 | Branch if positive
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0F0
; Address: $D0BA87
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0F0:
	CLC				  ; 18 | Clear carry flag
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $28			  ; 90 28 | Branch if carry clear
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	DEX				  ; CA | Decrement X register
	PHA				  ; 48 | Push accumulator to stack
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $2A			  ; 90 2A | Branch if carry clear
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	EOR $CA16			; 4D 16 CA | Exclusive OR with accumulator (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	CPY $1657			; CC 57 16 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BCC $22			  ; 90 22 | Branch if carry clear
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	CPY $1854			; CC 54 18 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $5E28			; 8E 28 5E | Store X register to absolute address
	CPY $17B0			; CC B0 17 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	AND $00A4,X		  ; 3D A4 00 | Logical AND with accumulator (absolute,X)
	CPY $17B4			; CC B4 17 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	ORA $189D,Y		  ; 19 9D 18 | Logical OR with accumulator (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	DEC $CA13,X		  ; DE 13 CA | Decrement (absolute,X)
	CPX $13			  ; E4 13 | Compare X register (zero page)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	DEX				  ; CA | Decrement X register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	STA $4A18			; 8D 18 4A | Audio system operation
	BNE $CC			  ; D0 CC | Branch if not equal
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BPL $16			  ; 10 16 | Branch if positive
	ASL $52CA			; 0E CA 52 | Arithmetic shift left (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STA $00361F		  ; 8F 1F 36 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0F1
; Address: $D0BB0A
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0F1:
	CPY $0F8A			; CC 8A 0F | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	STA $CCD1			; 8D D1 CC | Audio system operation
	STX $CA0F			; 8E 0F CA | Store X register to absolute address
	INX				  ; E8 | Increment X register
	BCC $33			  ; 90 33 | Branch if carry clear
	CPY $0F95			; CC 95 0F | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	AND #$62			 ; 29 62 | Logical AND with accumulator (immediate)
	CPY $0F99			; CC 99 0F | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BPL $16			  ; 10 16 | Branch if positive
	INC $CCDA,X		  ; FE DA CC | Increment (absolute,X)
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STA $00361F		  ; 8F 1F 36 00 | Audio system operation
	CPY $13ED			; CC ED 13 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	STA $CCD1			; 8D D1 CC | Audio system operation
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BCC $33			  ; 90 33 | Branch if carry clear
	CPY $13F7			; CC F7 13 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	AND #$62			 ; 29 62 | Logical AND with accumulator (immediate)
	CPY $13FC			; CC FC 13 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BVC $14			  ; 50 14 | Branch if overflow clear
	DEC				  ; 3A | Decrement accumulator
	CPY $1592			; CC 92 15 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	STA $CCD1			; 8D D1 CC | Audio system operation
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BVC $14			  ; 50 14 | Branch if overflow clear
	DEC				  ; 3A | Decrement accumulator
	CPY $165F			; CC 5F 16 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0F2
; Address: $D0BB93
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0F2:
	BVC $14			  ; 50 14 | Branch if overflow clear
	DEC				  ; 3A | Decrement accumulator
	CPY $17B8			; CC B8 17 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STA $A236			; 8D 36 A2 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STA $CA0F,X		  ; 9D 0F CA | Audio system operation
	INX				  ; E8 | Increment X register
	STA $A236			; 8D 36 A2 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BPL $14			  ; 10 14 | Branch if positive
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)
	CPY $159B			; CC 9B 15 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	BPL $14			  ; 10 14 | Branch if positive
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)
	CPY $1664			; CC 64 16 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDX $0F			  ; A6 0F | Load from zero page into X register
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	CPY $0FAB			; CC AB 0F | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($32),Y		  ; 11 32 | Logical OR with accumulator ((zero page),Y)
	JMP ($0000)		  ; 6C 00 00 | Jump to address (absolute indirect)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDA $28CA0F		  ; AF 0F CA 28 | Audio system operation
	EOR $6E2C			; 4D 2C 6E | Exclusive OR with accumulator (absolute)
	CPY $0FB4			; CC B4 0F | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	EOR $1F4B,Y		  ; 59 4B 1F | Exclusive OR with accumulator (absolute,Y)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CLV				  ; B8 | Clear overflow flag
	DEX				  ; CA | Decrement X register
	REP #$0F			 ; C2 0F | Reset processor status bits
	DEX				  ; CA | Decrement X register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0F3
; Address: $D0BC0C
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0F3:
	JSL $000066		  ; 22 66 00 00 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	BPL $CA			  ; 10 CA | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	BCC $2A			  ; 90 2A | Branch if carry clear
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ORA $10			  ; 05 10 | Logical OR with accumulator (zero page)
	DEX				  ; CA | Decrement X register
	BPL $CA			  ; 10 CA | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($12),Y		  ; 91 12 | Audio system operation
	CPY $1022			; CC 22 10 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	BPL $CA			  ; 10 CA | Branch if positive
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ORA ($CA),Y		  ; 11 CA | Logical OR with accumulator ((zero page),Y)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($1C),Y		  ; 91 1C | Audio system operation
	WDM #$20			 ; 42 20 | Reserved instruction
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	ROL $46			  ; 26 46 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0F4
; Address: $D0BC56
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0F4:
	JSR $D300			; 20 00 D3 | Jump to subroutine
	CPY $9ACF			; CC CF 9A | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $2C			  ; 90 2C | Branch if carry clear
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0F5
; Address: $D0BC62
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0F5:
	JSR $EB00			; 20 00 EB | Jump to subroutine
	CPY $9B92			; CC 92 9B | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA $402E3F		  ; 8F 3F 2E 40 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	RTI				  ; 40 | Return from interrupt
	LSR $0020			; 4E 20 00 | Logical shift right (absolute)
	CPY $9BC2			; CC C2 9B | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STY $4848			; 8C 48 48 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0F6
; Address: $D0BC86
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0F6:
	JSR $D300			; 20 00 D3 | Jump to subroutine
	CPY $9BEC			; CC EC 9B | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0F7
; Address: $D0BC90
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0F7:
	JSR $2064			; 20 64 20 | Jump to subroutine
	XBA				  ; EB | Exchange accumulator bytes
	CPY $9C01			; CC 01 9C | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BCC $1E			  ; 90 1E | Branch if carry clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0F8
; Address: $D0BC9E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0F8:
	JSR $0800			; 20 00 08 | Jump to subroutine
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STZ $A8CB			; 9C CB A8 | Store zero to absolute
	CMP ($28),Y		  ; D1 28 | Compare accumulator ((zero page),Y)
	ROR $0020,X		  ; 7E 20 00 | Rotate right (absolute,X)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	EOR $CB9C			; 4D 9C CB | Exclusive OR with accumulator (absolute)
	INX				  ; E8 | Increment X register
	BCC $2F			  ; 90 2F | Branch if carry clear
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0F9
; Address: $D0BCB6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0F9:
	JSR $D300			; 20 00 D3 | Jump to subroutine
	CPY $9C67			; CC 67 9C | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($42),Y		  ; D1 42 | Hardware register operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0FA
; Address: $D0BCC5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0FA:
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	ADC $CB9C,X		  ; 7D 9C CB | Add with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	BPL $4E			  ; 10 4E | Branch if positive
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0FB
; Address: $D0BCCE
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0FB:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $9C98			; CC 98 9C | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BNE $50			  ; D0 50 | Branch if not equal
	JMP $F70020		  ; 5C 20 00 F7 | Jump to address long
	CPY $9CAE			; CC AE 9C | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CPY $9CC4			; CC C4 9C | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $2E16			; 8D 16 2E | Audio system operation
	CPY $9CE8			; CC E8 9C | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHB				  ; 8B | Push data bank register to stack
	CPY $9CFD			; CC FD 9C | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $31			  ; 90 31 | Branch if carry clear
	ASL $0004,X		  ; 1E 04 00 | Arithmetic shift left (absolute,X)
	CPY $9D13			; CC 13 9D | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	CPY $9D7A			; CC 7A 9D | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA $002A22		  ; 8F 22 2A 00 | Audio system operation
	STA $98CB9D		  ; 8F 9D CB 98 | Audio system operation
	STA $68CB,X		  ; 9D CB 68 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0FC
; Address: $D0BD2B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0FC:
	PHB				  ; 8B | Push data bank register to stack
	BIT $208A			; 2C 8A 20 | Test bits in accumulator (absolute)
	CPY $9DF6			; CC F6 9D | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STX $0020			; 8E 20 00 | Store X register to absolute address
	CPY $9E0C			; CC 0C 9E | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BPL $40			  ; 10 40 | Branch if positive
	LSR $0020			; 4E 20 00 | Logical shift right (absolute)
	CPY $9E22			; CC 22 9E | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	WDM #$7C			 ; 42 7C | Reserved instruction

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0FD
; Address: $D0BD52
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0FD:
	JSR $D300			; 20 00 D3 | Jump to subroutine
	CPY $9E49			; CC 49 9E | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BPL $48			  ; 10 48 | Branch if positive
	LDX #$20			 ; A2 20 | Load immediate value into X register
	CPY $9E73			; CC 73 9E | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CMP $C63E			; CD 3E C6 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0FE
; Address: $D0BD6A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0FE:
	JSR $DF00			; 20 00 DF | Jump to subroutine
	PHX				  ; DA | Push X register to stack
	CPY $9EEC			; CC EC 9E | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_0FF
; Address: $D0BD74
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_0FF:
	JSL $0020B6		  ; 22 B6 20 00 | Jump to subroutine long
	CPY $9F42			; CC 42 9F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	DEC $20			  ; C6 20 | Decrement (zero page)
	CPY $9F58			; CC 58 9F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $2E			  ; 50 2E | Branch if overflow clear
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_100
; Address: $D0BD8E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_100:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $9F6D			; CC 6D 9F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $34			  ; D0 34 | Branch if not equal
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_101
; Address: $D0BD9A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_101:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $9F82			; CC 82 9F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $2A			  ; 90 2A | Branch if carry clear
	PHY				  ; 5A | Push Y register to stack
	PHP				  ; 08 | Push processor status to stack
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	STA				  ; 9F CB E8 8C | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank20_AudioFunction_103
; Address: $D0BDB6
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_103:
	CPY $9FAE			; CC AE 9F | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $361F			; 8D 1F 36 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	CPX $9F			  ; E4 9F | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	STX $3A22			; 8E 22 3A | Store X register to absolute address
	CPY $9FF7			; CC F7 9F | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $22			  ; D0 22 | Branch if not equal
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPY $A009			; CC 09 A0 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	ROL				  ; 2A | Rotate left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $A01B			; CC 1B A0 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STA $003A16		  ; 8F 16 3A 00 | Audio system operation
	CPY $A02D			; CC 2D A0 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ORA $5018			; 0D 18 50 | Logical OR with accumulator (absolute)
	CPY $A03F			; CC 3F A0 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $22			  ; D0 22 | Branch if not equal
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)
	CPY $A051			; CC 51 A0 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BRA $1F			  ; 80 1F | Branch always
	JMP $F5CD6E		  ; 5C 6E CD F5 | Jump to address long
	BVS $CD			  ; 70 CD | Branch if overflow set
	INX				  ; E8 | Increment X register
	STX $3A22			; 8E 22 3A | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank20_AudioFunction_104
; Address: $D0BE20
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_104:
	JSR $CD71			; 20 71 CD | Jump to subroutine
	ADC ($CD),Y		  ; 71 CD | Add with carry ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	CMP $7235			; CD 35 72 | Compare accumulator (absolute)
	CMP $9428			; CD 28 94 | Compare accumulator (absolute)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	AND $CD72,Y		  ; 39 72 CD | Logical AND with accumulator (absolute,Y)
	ROR $72			  ; 66 72 | Rotate right (zero page)
	CMP $8FE8			; CD E8 8F | Compare accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	STA $BECD72		  ; 8F 72 CD BE | Audio system operation
	CMP $5F28			; CD 28 5F | Compare accumulator (absolute)
	CMP $738E			; CD 8E 73 | Compare accumulator (absolute)
	CMP $5F28			; CD 28 5F | Compare accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $73DB			; CD DB 73 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_105
; Address: $D0BE61
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_105:
	CMP $5F28			; CD 28 5F | Compare accumulator (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	CMP $7428			; CD 28 74 | Compare accumulator (absolute)
	CMP $5F28			; CD 28 5F | Compare accumulator (absolute)
	BIT $CD74			; 2C 74 CD | Test bits in accumulator (absolute)
	CMP $DF28			; CD 28 DF | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_106
; Address: $D0BE7C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_106:
	JSL $000044		  ; 22 44 00 00 | Jump to subroutine long
	ADC $CD74,Y		  ; 79 74 CD | Add with carry (absolute,Y)
	CMP $DF28			; CD 28 DF | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_107
; Address: $D0BE88
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_107:
	JSL $00004A		  ; 22 4A 00 00 | Jump to subroutine long
	CMP $751D			; CD 1D 75 | Compare accumulator (absolute)
	CMP $DF28			; CD 28 DF | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_108
; Address: $D0BE94
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_108:
	JSL $000050		  ; 22 50 00 00 | Jump to subroutine long
	BMI $75			  ; 30 75 | Branch if negative
	CMP $7579			; CD 79 75 | Compare accumulator (absolute)
	CMP $DF28			; CD 28 DF | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_109
; Address: $D0BEA0
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_109:
	JSL $000056		  ; 22 56 00 00 | Jump to subroutine long
	STY $CD75			; 8C 75 CD | Store Y register to absolute address
	CMP $0014			; CD 14 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ORA #$67			 ; 09 67 | Logical OR with accumulator (immediate)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $0013			; CD 13 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BMI $69			  ; 30 69 | Branch if negative
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $0012			; CD 12 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BCC $6A			  ; 90 6A | Branch if carry clear
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $0011			; CD 11 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	SEP #$6B			 ; E2 6B | Set processor status bits
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $0028			; CD 28 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ORA $6D			  ; 05 6D | Logical OR with accumulator (zero page)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $CEE8			; CD E8 CE | Compare accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $A063			; CC 63 A0 | Compare Y register (absolute)
	ORA $FF00,Y		  ; 19 00 FF | Logical OR with accumulator (absolute,Y)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $0028			; CD 28 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $0028			; CD 28 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STZ $CD7F			; 9C 7F CD | Store zero to absolute

;------------------------------------------------------------------------------
; Bank20_AudioFunction_10A
; Address: $D0BF13
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_10A:
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LDX #$7F			 ; A2 7F | Load immediate value into X register
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $0028			; CD 28 00 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	LDX $CD7F			; AE 7F CD | Load from absolute address into X register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	DEC				  ; 3A | Decrement accumulator
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $9468			; CD 68 94 | Compare accumulator (absolute)
	ASL $003E,X		  ; 1E 3E 00 | Arithmetic shift left (absolute,X)
	BPL $80			  ; 10 80 | Branch if positive
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $9468			; CD 68 94 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_10B
; Address: $D0BF54
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_10B:
	JSR $003E			; 20 3E 00 | Jump to subroutine
	BRA $CD			  ; 80 CD | Branch always
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	ORA $003C,Y		  ; 19 3C 00 | Logical OR with accumulator (absolute,Y)
	BRA $CD			  ; 80 CD | Branch always
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	AND $3C			  ; 25 3C | Logical AND with accumulator (zero page)
	STA ($CD,X)		  ; 81 CD | Audio system operation
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	BRA $CD			  ; 80 CD | Branch always
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	STA ($CD,X)		  ; 81 CD | Audio system operation
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	INC				  ; 1A | Increment accumulator
	JMP $0000			; 4C 00 00 | Jump to address
	BRA $CD			  ; 80 CD | Branch always
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_10C
; Address: $D0BF9B
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_10C:
	RTI				  ; 40 | Return from interrupt
	BIT $4C			  ; 24 4C | Test bits in accumulator (zero page)
	STA ($CD,X)		  ; 81 CD | Audio system operation
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STY $CD			  ; 84 CD | Store Y register to zero page
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STY $CD			  ; 84 CD | Store Y register to zero page
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	BMI $7A			  ; 30 7A | Branch if negative
	LSR $CD84			; 4E 84 CD | Logical shift right (absolute)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	PLY				  ; 7A | Pull Y register from stack
	STY $CD			  ; 84 CD | Store Y register to zero page
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	BMI $80			  ; 30 80 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $CD			  ; 84 CD | Store Y register to zero page
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	BRA $00			  ; 80 00 | Branch always
	LDA $CD84,X		  ; BD 84 CD | Audio system operation
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	ORA $8630			; 0D 30 86 | Logical OR with accumulator (absolute)
	SEP #$84			 ; E2 84 | Set processor status bits
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $1028			; CD 28 10 | Compare accumulator (absolute)
	STX $00			  ; 86 00 | Store X register to zero page
	STA $CD			  ; 85 CD | Audio system operation
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_10D
; Address: $D0C02B
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_10D:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BMI $74			  ; 30 74 | Branch if negative
	LDA $85			  ; A5 85 | Audio system operation
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $0B28			; CD 28 0B | Compare accumulator (absolute)
	PLX				  ; FA | Pull X register from stack
	STA $CD			  ; 85 CD | Audio system operation
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STZ $86			  ; 64 86 | Store zero to zero page
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	STX $CD			  ; 86 CD | Store X register to zero page
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BVS $86			  ; 70 86 | Branch if overflow set
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STX $CD			  ; 86 CD | Store X register to zero page
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STX $CD			  ; 86 CD | Store X register to zero page
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $FF			  ; 90 FF | Branch if carry clear
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STX $CD			  ; 86 CD | Store X register to zero page
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STX $CD			  ; 86 CD | Store X register to zero page
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	STX $CD			  ; 86 CD | Store X register to zero page
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PHB				  ; 8B | Push data bank register to stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_10E
; Address: $D0C0A8
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_10E:
	LDX $CD86,Y		  ; BE 86 CD | Load from absolute,Y into X register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	STX $FEFF			; 8E FF FE | Store X register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $CD			  ; 86 CD | Store X register to zero page
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BIT #$CD			 ; 89 CD | Test bits in accumulator (immediate)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	BIT #$CD			 ; 89 CD | Test bits in accumulator (immediate)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BIT #$CD			 ; 89 CD | Test bits in accumulator (immediate)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LSR $89			  ; 46 89 | Logical shift right (zero page)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	JMP $CD89			; 4C 89 CD | Jump to address
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($1C),Y		  ; 11 1C | Logical OR with accumulator ((zero page),Y)
	LDX $89			  ; A6 89 | Load from zero page into X register
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $CBE8			; CD E8 CB | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_10F
; Address: $D0C104
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_10F:
	JSR $0056			; 20 56 00 | Jump to subroutine
	TSX				  ; BA | Transfer stack pointer to X register
	BIT #$CD			 ; 89 CD | Test bits in accumulator (immediate)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $24			  ; 90 24 | Branch if carry clear
	JMP $0000			; 4C 00 00 | Jump to address
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $4F68			; CD 68 4F | Compare accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)
	BIT #$CD			 ; 89 CD | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_110
; Address: $D0C123
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_110:
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	BIT #$CD			 ; 89 CD | Test bits in accumulator (immediate)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	CPY $4E1F			; CC 1F 4E | Compare Y register (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $0B68			; CD 68 0B | Compare accumulator (absolute)
	ASL $006A,X		  ; 1E 6A 00 | Arithmetic shift left (absolute,X)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $D0E8			; CD E8 D0 | Compare accumulator (absolute)
	AND ($64,X)		  ; 21 64 | Logical AND with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $11A8			; CD A8 11 | Compare accumulator (absolute)
	BIT $6E			  ; 24 6E | Test bits in accumulator (zero page)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $90E8			; CD E8 90 | Compare accumulator (absolute)
	JMP $0000			; 4C 00 00 | Jump to address
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $D1A8			; CD A8 D1 | Compare accumulator (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $9068			; CD 68 90 | Compare accumulator (absolute)
	ASL $005E,X		  ; 1E 5E 00 | Arithmetic shift left (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $50E8			; CD E8 50 | Compare accumulator (absolute)
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	EOR $5ECD,X		  ; 5D CD 5E | Exclusive OR with accumulator (absolute,X)
	LDY $28CD			; AC CD 28 | Load from absolute address into Y register
	STA $361A			; 8D 1A 36 | Audio system operation
	CPY $A0B3			; CC B3 A0 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $1E			  ; 90 1E | Branch if carry clear
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	CPY $A0DA			; CC DA A0 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STZ $3A30,X		  ; 9E 30 3A | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank20_AudioFunction_111
; Address: $D0C1BA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_111:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $A0DE			; CC DE A0 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ORA $4056,Y		  ; 19 56 40 | Logical OR with accumulator (absolute,Y)
	STA $CCD1			; 8D D1 CC | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_112
; Address: $D0C1CC
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_112:
	LDY $28CD			; AC CD 28 | Load from absolute address into Y register
	STZ $9A1A,X		  ; 9E 1A 9A | Store zero to absolute,X
	BRA $00			  ; 80 00 | Branch always
	CPY $A0E2			; CC E2 A0 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	EOR $9A			  ; 45 9A | Exclusive OR with accumulator (zero page)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDY $28CD			; AC CD 28 | Load from absolute address into Y register
	EOR $361C			; 4D 1C 36 | Exclusive OR with accumulator (absolute)
	CPY $A0E6			; CC E6 A0 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA $00461E		  ; 8F 1E 46 00 | Audio system operation
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	LDY #$CB			 ; A0 CB | Load immediate value into Y register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_113
; Address: $D0C200
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_113:
	JSL $000050		  ; 22 50 00 00 | Jump to subroutine long
	CPY $A101			; CC 01 A1 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	STX $4A2A			; 8E 2A 4A | Store X register to absolute address
	CPY $A105			; CC 05 A1 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($20),Y		  ; 91 20 | Audio system operation
	WDM #$20			 ; 42 20 | Reserved instruction
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	JMP $CBA1			; 4C A1 CB | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	INC				  ; 1A | Increment accumulator
	ROL $0020			; 2E 20 00 | Rotate left (absolute)
	EOR ($A1),Y		  ; 51 A1 | Exclusive OR with accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	LDA ($CB,X)		  ; A1 CB | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	STA $00361E		  ; 8F 1E 36 00 | Audio system operation
	CPY $A17D			; CC 7D A1 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPY $A181			; CC 81 A1 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	BCC $18			  ; 90 18 | Branch if carry clear
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY $A196			; CC 96 A1 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BNE $1E			  ; D0 1E | Branch if not equal
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $A1AB			; CC AB A1 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	BIT $86			  ; 24 86 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_114
; Address: $D0C264
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_114:
	XBA				  ; EB | Exchange accumulator bytes
	CPY $A1C0			; CC C0 A1 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_115
; Address: $D0C26C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_115:
	JSL $00004E		  ; 22 4E 00 00 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	CPY $A1D5			; CC D5 A1 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STZ $5624			; 9C 24 56 | Store zero to absolute
	PHX				  ; DA | Push X register to stack
	CPY $A1F1			; CC F1 A1 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $006224		  ; 8F 24 62 00 | Audio system operation
	LDY $CB			  ; A4 CB | Load from zero page into Y register
	LDY $CB			  ; A4 CB | Load from zero page into Y register
	PLP				  ; 28 | Pull processor status from stack
	BPL $54			  ; 10 54 | Branch if positive
	STZ $00			  ; 64 00 | Store zero to zero page
	CPY $1E42			; CC 42 1E | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_116
; Address: $D0C29C
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_116:
	JSL $000036		  ; 22 36 00 00 | Jump to subroutine long
	CPY $A4E7			; CC E7 A4 | Compare Y register (absolute)
	INX				  ; E8 | Increment X register
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY $A4EB			; CC EB A4 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROL $50			  ; 26 50 | Rotate left (zero page)
	CPY $A4EF			; CC EF A4 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CPY $A505			; CC 05 A5 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ADC #$A8			 ; 69 A8 | Add with carry (immediate)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LDA #$CB			 ; A9 CB | Audio system operation
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STA $AA			  ; 85 AA | Audio system operation
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_117
; Address: $D0C2FB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_117:
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	AND $CBAB			; 2D AB CB | Logical AND with accumulator (absolute)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($44),Y		  ; 91 44 | Audio system operation
	STX $40			  ; 86 40 | Store X register to zero page
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STA $CBAB,X		  ; 9D AB CB | Audio system operation
	INX				  ; E8 | Increment X register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_118
; Address: $D0C316
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_118:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $ABA2			; CC A2 AB | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BPL $3C			  ; 10 3C | Branch if positive
	TXS				  ; 9A | Transfer X register to stack pointer
	RTI				  ; 40 | Return from interrupt
	CPY $ABB7			; CC B7 AB | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	ROR $00			  ; 66 00 | Rotate right (zero page)
	BVC $1F			  ; 50 1F | Branch if overflow clear
	CMP $2386			; CD 86 23 | Compare accumulator (absolute)
	CMP $1617			; CD 17 16 | Compare accumulator (absolute)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CMP $CD23,X		  ; DD 23 CD | Compare accumulator (absolute,X)
	SEP #$23			 ; E2 23 | Set processor status bits
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)
	STA $CD24			; 8D 24 CD | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LSR $CD28,X		  ; 5E 28 CD | Logical shift right (absolute,X)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BVS $2B			  ; 70 2B | Branch if overflow set
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BMI $CD			  ; 30 CD | Branch if negative
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LDA #$31			 ; A9 31 | Audio system operation
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_119
; Address: $D0C386
; Size: 121 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_119:
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $9028			; CD 28 90 | Compare accumulator (absolute)
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	CPY $70C8			; CC C8 70 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STA $441E			; 8D 1E 44 | Audio system operation
	CPY $B638			; CC 38 B6 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP ($AE,X)		  ; C1 AE | Compare accumulator ((zero page,X))
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BNE $B1			  ; D0 B1 | Branch if not equal
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STZ $CBB2			; 9C B2 CB | Store zero to absolute
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	SBC ($B2,X)		  ; E1 B2 | Subtract with carry ((zero page,X))
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ROL $B3			  ; 26 B3 | Rotate left (zero page)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_11A
; Address: $D0C41B
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_11A:
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	STA $AE16			; 8D 16 AE | Audio system operation
	DEC $CBB6			; CE B6 CB | Decrement (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	STA $60A218		  ; 8F 18 A2 60 | Audio system operation
	CPY $1B01			; CC 01 1B | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	ROR $3A			  ; 66 3A | Rotate right (zero page)
	RTI				  ; 40 | Return from interrupt
	DEX				  ; CA | Decrement X register
	LDA $CA1D,Y		  ; B9 1D CA | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	BCC $34			  ; 90 34 | Branch if carry clear
	DEC $0060			; CE 60 00 | Decrement (absolute)
	CPY $40AA			; CC AA 40 | Compare Y register (absolute)
	CMP $52A8			; CD A8 52 | Compare accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	TXS				  ; 9A | Transfer X register to stack pointer
	RTI				  ; 40 | Return from interrupt
	PLY				  ; 7A | Pull Y register from stack
	CMP $43CE			; CD CE 43 | Compare accumulator (absolute)
	CMP $D2A8			; CD A8 D2 | Compare accumulator (absolute)
	BMI $9A			  ; 30 9A | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CMP $446A			; CD 6A 44 | Compare accumulator (absolute)
	CMP $92A8			; CD A8 92 | Compare accumulator (absolute)
	BMI $AA			  ; 30 AA | Branch if negative
	RTI				  ; 40 | Return from interrupt
	STA $CD44,X		  ; 9D 44 CD | Audio system operation
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX $0040			; AE 40 00 | Load from absolute address into X register
	CPX #$44			 ; E0 44 | Compare X register (immediate)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8BE8			; CD E8 8B | Compare accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	EOR $CD			  ; 45 CD | Exclusive OR with accumulator (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	LSR $CD			  ; 46 CD | Logical shift right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_11B
; Address: $D0C4A0
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_11B:
	JSL $0040D6		  ; 22 D6 40 00 | Jump to subroutine long
	LSR $CD			  ; 46 CD | Logical shift right (zero page)
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	CMP $9BE8			; CD E8 9B | Compare accumulator (absolute)
	INC $0041,X		  ; FE 41 00 | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	CMP $4918			; CD 18 49 | Compare accumulator (absolute)
	CMP $92A8			; CD A8 92 | Compare accumulator (absolute)
	INC $0041,X		  ; FE 41 00 | Increment (absolute,X)
	ORA $CD49,X		  ; 1D 49 CD | Logical OR with accumulator (absolute,X)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	INC $0041,X		  ; FE 41 00 | Increment (absolute,X)
	JMP $CD49			; 4C 49 CD | Jump to address
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	DEC $CD4B			; CE 4B CD | Decrement (absolute)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BPL $8D			  ; 10 8D | Branch if positive
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8014			; CD 14 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CPY #$95			 ; C0 95 | Compare Y register (immediate)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8013			; CD 13 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8012			; CD 12 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8011			; CD 11 80 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STA $CD96,X		  ; 9D 96 CD | Audio system operation
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	BIT $36			  ; 24 36 | Test bits in accumulator (zero page)
	CPY $976D			; CC 6D 97 | Compare Y register (absolute)
	CMP $92E8			; CD E8 92 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_11C
; Address: $D0C524
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_11C:
	JSL $000032		  ; 22 32 00 00 | Jump to subroutine long
	CMP $97CE			; CD CE 97 | Compare accumulator (absolute)
	CMP $92E8			; CD E8 92 | Compare accumulator (absolute)
	ASL $0001			; 0E 01 00 | Arithmetic shift left (absolute)
	CPX $97			  ; E4 97 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_11D
; Address: $D0C536
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_11D:
	CMP $981B			; CD 1B 98 | Compare accumulator (absolute)
	CMP $92E8			; CD E8 92 | Compare accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	ASL $0001			; 0E 01 00 | Arithmetic shift left (absolute)
	BMI $98			  ; 30 98 | Branch if negative
	CMP $9867			; CD 67 98 | Compare accumulator (absolute)
	CMP $CF68			; CD 68 CF | Compare accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	STA $CCD1			; 8D D1 CC | Audio system operation
	CLV				  ; B8 | Clear overflow flag
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	CPY $37BF			; CC BF 37 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STX $2E21			; 8E 21 2E | Store X register to absolute address
	SEC				  ; 38 | Set carry flag
	DEX				  ; CA | Decrement X register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $3228			; 8C 28 32 | Store Y register to absolute address
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $9868			; CD 68 98 | Compare accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $94A8			; CD A8 94 | Compare accumulator (absolute)
	ROL $0036			; 2E 36 00 | Rotate left (absolute)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1068			; CD 68 10 | Compare accumulator (absolute)
	BIT $0054			; 2C 54 00 | Test bits in accumulator (absolute)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $11A8			; CD A8 11 | Compare accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	CLI				  ; 58 | Clear interrupt disable flag
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $1068			; CD 68 10 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_11E
; Address: $D0C5B4
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_11E:
	JSL $000060		  ; 22 60 00 00 | Jump to subroutine long
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $0B68			; CD 68 0B | Compare accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	JMP $F70000		  ; 5C 00 00 F7 | Jump to address long
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $0BE8			; CD E8 0B | Compare accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_11F
; Address: $D0C5D2
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_11F:
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $8D28			; CD 28 8D | Compare accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $9168			; CD 68 91 | Compare accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $8BA8			; CD A8 8B | Compare accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $5759			; CD 59 57 | Compare accumulator (absolute)
	ASL $004E,X		  ; 1E 4E 00 | Arithmetic shift left (absolute,X)
	ADC #$38			 ; 69 38 | Add with carry (immediate)
	DEX				  ; CA | Decrement X register
	ADC $CA38,X		  ; 7D 38 CA | Add with carry (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BVC $20			  ; 50 20 | Branch if overflow clear
	CPY $38ED			; CC ED 38 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BVC $0C			  ; 50 0C | Branch if overflow clear
	JMP $F70000		  ; 5C 00 00 F7 | Jump to address long
	CPY $38E9			; CC E9 38 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STA $3222			; 8D 22 32 | Audio system operation
	CPY $38F1			; CC F1 38 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	STA $004032		  ; 8F 32 40 00 | Audio system operation
	CPY $3930			; CC 30 39 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	STA $2E17			; 8D 17 2E | Audio system operation
	CPY $3A06			; CC 06 3A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	STA $5223			; 8D 23 52 | Audio system operation
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP $9897			; CD 97 98 | Compare accumulator (absolute)
	CMP $91A8			; CD A8 91 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_120
; Address: $D0C650
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_120:
	JSR $003E			; 20 3E 00 | Jump to subroutine
	CMP ($CC),Y		  ; D1 CC | Compare accumulator ((zero page),Y)
	STA $A8CD,Y		  ; 99 CD A8 | Audio system operation
	LSR $20			  ; 46 20 | Logical shift right (zero page)
	CPY $1E6A			; CC 6A 1E | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_122
; Address: $D0C66E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_122:
	CPY $1E6E			; CC 6E 1E | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	STA $BE40			; 8D 40 BE | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_123
; Address: $D0C676
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_123:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $1E72			; CC 72 1E | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	BCC $3A			  ; 90 3A | Branch if carry clear
	WDM #$00			 ; 42 00 | Reserved instruction
	CPY $2085			; CC 85 20 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $41			  ; 10 41 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	CPY $209A			; CC 9A 20 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_125
; Address: $D0C69D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_125:
	JSL $AC5ECA		  ; 22 CA 5E AC | Jump to subroutine long
	CMP $9297			; CD 97 92 | Compare accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_129
; Address: $D0C6B5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_129:
	JSL $AC5ECA		  ; 22 CA 5E AC | Jump to subroutine long
	CMP $9BD9			; CD D9 9B | Compare accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_12A
; Address: $D0C6BE
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_12A:
	JSR $9400			; 20 00 94 | Jump to subroutine
	AND ($CA,X)		  ; 21 CA | Logical AND with accumulator ((zero page,X))
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	BIT #$22			 ; 89 22 | Test bits in accumulator (immediate)
	DEX				  ; CA | Decrement X register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $003A,X		  ; 1E 3A 00 | Arithmetic shift left (absolute,X)
	BPL $23			  ; 10 23 | Branch if positive
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	INC				  ; 1A | Increment accumulator
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_12B
; Address: $D0C6ED
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_12B:
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	INC				  ; 1A | Increment accumulator
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $92A8			; CD A8 92 | Compare accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $92A8			; CD A8 92 | Compare accumulator (absolute)
	ASL $0036,X		  ; 1E 36 00 | Arithmetic shift left (absolute,X)
	CPY $AC5E			; CC 5E AC | Compare Y register (absolute)
	CMP $8D28			; CD 28 8D | Compare accumulator (absolute)
	ADC $6A			  ; 65 6A | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_12C
; Address: $D0C71E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_12C:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $B6FA			; CC FA B6 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BPL $19			  ; 10 19 | Branch if positive
	TSX				  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_12D
; Address: $D0C72A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_12D:
	JSR $F700			; 20 00 F7 | Jump to subroutine
	CPY $B6FE			; CC FE B6 | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_12E
; Address: $D0C740
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_12E:
	JSL $000082		  ; 22 82 00 00 | Jump to subroutine long
	CPY $9984			; CC 84 99 | Compare Y register (absolute)
	CMP $9759			; CD 59 97 | Compare accumulator (absolute)
	BIT $DA			  ; 24 DA | Test bits in accumulator (zero page)
	CPY $9988			; CC 88 99 | Compare Y register (absolute)
	CMP $90E8			; CD E8 90 | Compare accumulator (absolute)
	ORA $0102,Y		  ; 19 02 01 | Logical OR with accumulator (absolute,Y)
	CPY $999C			; CC 9C 99 | Compare Y register (absolute)
	CMP $9E68			; CD 68 9E | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_12F
; Address: $D0C764
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_12F:
	JSR $006E			; 20 6E 00 | Jump to subroutine
	XBA				  ; EB | Exchange accumulator bytes
	CPY $99A0			; CC A0 99 | Compare Y register (absolute)
	CMP $1728			; CD 28 17 | Compare accumulator (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	LDY $99			  ; A4 99 | Load from zero page into Y register
	CMP $99A9			; CD A9 99 | Compare accumulator (absolute)
	CMP $1728			; CD 28 17 | Compare accumulator (absolute)
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	LDY $99			  ; A4 99 | Load from zero page into Y register
	CMP $99AD			; CD AD 99 | Compare accumulator (absolute)
	CMP $1728			; CD 28 17 | Compare accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_130
; Address: $D0C78C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_130:
	LDY $99			  ; A4 99 | Load from zero page into Y register
	CMP $99B1			; CD B1 99 | Compare accumulator (absolute)
	CMP $9268			; CD 68 92 | Compare accumulator (absolute)
	STA $CCD1			; 8D D1 CC | Audio system operation
	LDY $28CD			; AC CD 28 | Load from absolute address into Y register
	DEC $00			  ; C6 00 | Decrement (zero page)
	LDY $99			  ; A4 99 | Load from zero page into Y register
	CMP $99B5			; CD B5 99 | Compare accumulator (absolute)
	CMP $9E68			; CD 68 9E | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_131
; Address: $D0C7AC
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_131:
	JSR $00A2			; 20 A2 00 | Jump to subroutine
	XBA				  ; EB | Exchange accumulator bytes
	CPY $99B9			; CC B9 99 | Compare Y register (absolute)
	CMP $9728			; CD 28 97 | Compare accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	DEC $00			  ; C6 00 | Decrement (zero page)
	STA $CCD1			; 8D D1 CC | Audio system operation
	LDY $68CD			; AC CD 68 | Load from absolute address into Y register
	ROL				  ; 2A | Rotate left (accumulator)
	LDY $99			  ; A4 99 | Load from zero page into Y register
	CMP $99D0			; CD D0 99 | Compare accumulator (absolute)
	CMP $8B68			; CD 68 8B | Compare accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	STA $EBCD,Y		  ; 99 CD EB | Audio system operation
	STA $28CD,Y		  ; 99 CD 28 | Audio system operation
	BCC $34			  ; 90 34 | Branch if carry clear
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	XBA				  ; EB | Exchange accumulator bytes
	CPY $9A11			; CC 11 9A | Compare Y register (absolute)
	CMP $9028			; CD 28 90 | Compare accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	CPY $9A15			; CC 15 9A | Compare Y register (absolute)
	CMP $D028			; CD 28 D0 | Compare accumulator (absolute)
	ROL $00AA			; 2E AA 00 | Rotate left (absolute)
	CPY $9A0D			; CC 0D 9A | Compare Y register (absolute)
	CMP $91A8			; CD A8 91 | Compare accumulator (absolute)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BNE $9A			  ; D0 9A | Branch if not equal
	CMP $9B59			; CD 59 9B | Compare accumulator (absolute)
	CMP $9068			; CD 68 90 | Compare accumulator (absolute)
	BIT $0032			; 2C 32 00 | Test bits in accumulator (absolute)
	CPY $9B6E			; CC 6E 9B | Compare Y register (absolute)
	CMP $8B68			; CD 68 8B | Compare accumulator (absolute)
	AND ($F4,X)		  ; 21 F4 | Logical AND with accumulator ((zero page,X))
	LDY $CD9E,X		  ; BC 9E CD | Load from absolute,X into Y register
	STZ $CD9F,X		  ; 9E 9F CD | Store zero to absolute,X
	PLP				  ; 28 | Pull processor status from stack
	STA $2E24			; 8D 24 2E | Audio system operation
	STA				  ; 9F A0 CD C8 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank20_AudioFunction_132
; Address: $D0C82C
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_132:
	LDY #$CD			 ; A0 CD | Load immediate value into Y register
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	STZ $5ECD			; 9C CD 5E | Store zero to absolute
	LDY $12CD			; AC CD 12 | Load from absolute address into Y register
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STY $CD9D			; 8C 9D CD | Store Y register to absolute address
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BIT $9E			  ; 24 9E | Test bits in accumulator (zero page)
	CMP $AC5E			; CD 5E AC | Compare accumulator (absolute)
	CMP $8B68			; CD 68 8B | Compare accumulator (absolute)
	AND $0058			; 2D 58 00 | Logical AND with accumulator (absolute)
	BCC $2C			  ; 90 2C | Branch if carry clear
	DEX				  ; CA | Decrement X register
	BIT $68CA			; 2C CA 68 | Test bits in accumulator (absolute)
	STA ($3B),Y		  ; 91 3B | Audio system operation
	SEI				  ; 78 | Set interrupt disable flag
	XBA				  ; EB | Exchange accumulator bytes
	CPY $2C9A			; CC 9A 2C | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STA ($2B),Y		  ; 91 2B | Audio system operation
	DEX				  ; CA | Decrement X register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	INC $2B			  ; E6 2B | Increment (zero page)
	DEX				  ; CA | Decrement X register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BIT $5ECA			; 2C CA 5E | Test bits in accumulator (absolute)
	LDY $E8CD			; AC CD E8 | Load from absolute address into Y register
	BCC $27			  ; 90 27 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	CPY $2EA3			; CC A3 2E | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	EOR $004C			; 4D 4C 00 | Exclusive OR with accumulator (absolute)
	STA $CA2E,Y		  ; 99 2E CA | Audio system operation
	STZ $CA2E,X		  ; 9E 2E CA | Store zero to absolute,X
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($3A),Y		  ; D1 3A | Compare accumulator ((zero page),Y)
	JMP ($0000)		  ; 6C 00 00 | Jump to address (absolute indirect)
	CPY $2EA7			; CC A7 2E | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	AND $5ECA			; 2D CA 5E | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_133
; Address: $D0C8BC
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_133:
	LDY $12CD			; AC CD 12 | Load from absolute address into Y register
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	NOP				  ; EA | No operation
	AND $5ECA			; 2D CA 5E | Logical AND with accumulator (absolute)
	LDY $11CD			; AC CD 11 | Load from absolute address into Y register
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ROL $5ECA			; 2E CA 5E | Rotate left (absolute)
	LDY $68CD			; AC CD 68 | Load from absolute address into Y register
	PHB				  ; 8B | Push data bank register to stack
	BMI $CA			  ; 30 CA | Branch if negative
	STA $CA30,Y		  ; 99 30 CA | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($1D),Y		  ; 11 1D | Logical OR with accumulator ((zero page),Y)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CPY $30C8			; CC C8 30 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)
	CPY $30DD			; CC DD 30 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	STA $764B			; 8D 4B 76 | Audio system operation
	CPY $30F2			; CC F2 30 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BCC $2F			  ; 90 2F | Branch if carry clear
	DEX				  ; CA | Decrement X register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	SBC $2F			  ; E5 2F | Subtract with carry (zero page)
	DEX				  ; CA | Decrement X register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	BMI $CA			  ; 30 CA | Branch if negative
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack
	EOR ($AA,X)		  ; 41 AA | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	DEX				  ; CA | Decrement X register
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CPX $CA31			; EC 31 CA | Compare X register (absolute)
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	EOR ($32,X)		  ; 41 32 | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_134
; Address: $D0C94E
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_134:
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	DEX				  ; CA | Decrement X register
	LSR $CDAC,X		  ; 5E AC CD | Logical shift right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $3631			; 9C 31 36 | Store zero to absolute
	XBA				  ; EB | Exchange accumulator bytes
	CPY $332D			; CC 2D 33 | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	CPY $3A8D			; CC 8D 3A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	CPY $3A9F			; CC 9F 3A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	CPY $3AB1			; CC B1 3A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	CPY $3AC4			; CC C4 3A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $002C,X		  ; 1E 2C 00 | Arithmetic shift left (absolute,X)
	CPY $3AD6			; CC D6 3A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_135
; Address: $D0C9A4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_135:
	JSR $002C			; 20 2C 00 | Jump to subroutine
	CPY $3AB2			; CC B2 3A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_136
; Address: $D0C9B0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_136:
	JSL $00002C		  ; 22 2C 00 00 | Jump to subroutine long
	CPY $3AE8			; CC E8 3A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	INC				  ; 1A | Increment accumulator
	CPY $3AFA			; CC FA 3A | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $3B0C			; CC 0C 3B | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_137
; Address: $D0C9D4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_137:
	JSL $000034		  ; 22 34 00 00 | Jump to subroutine long
	CPY $3B1E			; CC 1E 3B | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BIT $34			  ; 24 34 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_138
; Address: $D0C9E6
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_138:
	CPY $3B30			; CC 30 3B | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	BIT $4A			  ; 24 4A | Test bits in accumulator (zero page)
	CPY $3B42			; CC 42 3B | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	BVS $2D			  ; 70 2D | Branch if overflow set
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	CPY $A328			; CC 28 A3 | Compare Y register (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $A028,X		  ; 7E 28 A0 | Rotate right (absolute,X)
	CPY $B828			; CC 28 B8 | Compare Y register (absolute)
	ORA ($CC,X)		  ; 01 CC | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CMP ($01),Y		  ; D1 01 | Compare accumulator ((zero page),Y)
	CPY $8928			; CC 28 89 | Compare Y register (absolute)
	CPY $9E28			; CC 28 9E | Compare Y register (absolute)
	CPY $B328			; CC 28 B3 | Compare Y register (absolute)
	CPY $4528			; CC 28 45 | Compare Y register (absolute)
	ORA $CC			  ; 05 CC | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	CPY $7928			; CC 28 79 | Compare Y register (absolute)
	ORA #$CC			 ; 09 CC | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA #$CC			 ; 09 CC | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $ED28			; CC 28 ED | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $2628			; CC 28 26 | Compare Y register (absolute)
	CPY $7728			; CC 28 77 | Compare Y register (absolute)
	CPY $0928			; CC 28 09 | Compare Y register (absolute)
	CPY $8A28			; CC 28 8A | Compare Y register (absolute)
	CPY $AD28			; CC 28 AD | Compare Y register (absolute)
	ORA $28CC			; 0D CC 28 | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_139
; Address: $D0CA48
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_139:
	ASL $28CC			; 0E CC 28 | Arithmetic shift left (absolute)
	ASL $28CC			; 0E CC 28 | Arithmetic shift left (absolute)
	CPY $4F28			; CC 28 4F | Compare Y register (absolute)
	CPY $D128			; CC 28 D1 | Compare Y register (absolute)
	CPY $2128			; CC 28 21 | PPU graphics register access
	BPL $CC			  ; 10 CC | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	ORA ($CC),Y		  ; 11 CC | Logical OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	EOR ($12),Y		  ; 51 12 | Exclusive OR with accumulator ((zero page),Y)
	CPY $B928			; CC 28 B9 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_13A
; Address: $D0CA6D
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_13A:
	CPY $7028			; CC 28 70 | Compare Y register (absolute)
	ORA $28CC,X		  ; 1D CC 28 | Logical OR with accumulator (absolute,X)
	LDY $CC25			; AC 25 CC | Load from absolute address into Y register
	PLP				  ; 28 | Pull processor status from stack
	ASL $28CC,X		  ; 1E CC 28 | Arithmetic shift left (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	ROL $CC			  ; 26 CC | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ADC ($26),Y		  ; 71 26 | Add with carry ((zero page),Y)
	CPY $C728			; CC 28 C7 | Compare Y register (absolute)
	ROL $CC			  ; 26 CC | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ROR $28C5			; 6E C5 28 | Rotate right (absolute)
	CMP ($6F,X)		  ; C1 6F | Compare accumulator ((zero page,X))
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	WDM #$71			 ; 42 71 | Reserved instruction
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	LDA $28C572		  ; AF 72 C5 28 | Audio system operation
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	PHX				  ; DA | Push X register to stack
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_13B
; Address: $D0CAA4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_13B:
	AND $CC			  ; 25 CC | Logical AND with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CMP #$ED			 ; C9 ED | Compare accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_13C
; Address: $D0CAAB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_13C:
	JSR $CD03			; 20 03 CD | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_13D
; Address: $D0CAB1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_13D:
	CMP $6F28			; CD 28 6F | Compare accumulator (absolute)
	ROR $28CC			; 6E CC 28 | Rotate right (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CPY $4028			; CC 28 40 | Compare Y register (absolute)
	JMP ($28CC)		  ; 6C CC 28 | Jump to address (absolute indirect)
	PHX				  ; DA | Push X register to stack
	JMP ($28CC)		  ; 6C CC 28 | Jump to address (absolute indirect)
	LDA				  ; BF 6D CC 28 | Load from absolute long,X into accumulator
	BVS $CC			  ; 70 CC | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_13E
; Address: $D0CACB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_13E:
	JSR $CC68			; 20 68 CC | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	ADC #$CC			 ; 69 CC | Add with carry (immediate)
	PLP				  ; 28 | Pull processor status from stack
	LDA ($6A,X)		  ; A1 6A | Audio system operation
	CPY $B028			; CC 28 B0 | Compare Y register (absolute)
	AND $19CD,Y		  ; 39 CD 19 | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	CMP $8418			; CD 18 84 | Compare accumulator (absolute)
	CMP $9528			; CD 28 95 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_13F
; Address: $D0CAE5
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_13F:
	CMP $C528			; CD 28 C5 | Compare accumulator (absolute)
	CMP $1528			; CD 28 15 | Compare accumulator (absolute)
	CPY $4E28			; CC 28 4E | Compare Y register (absolute)
	ADC ($CC),Y		  ; 71 CC | Add with carry ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	LDA ($71),Y		  ; B1 71 | Audio system operation
	CPY $A528			; CC 28 A5 | Compare Y register (absolute)
	ORA $28CD,Y		  ; 19 CD 28 | Logical OR with accumulator (absolute,Y)
	INC $28CB			; EE CB 28 | Increment (absolute)
	INX				  ; E8 | Increment X register
	INC $28CB			; EE CB 28 | Increment (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BIT $CB			  ; 24 CB | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	SEP #$ED			 ; E2 ED | Set processor status bits
	PLP				  ; 28 | Pull processor status from stack
	SEP #$ED			 ; E2 ED | Set processor status bits
	PLP				  ; 28 | Pull processor status from stack
	CMP ($3A),Y		  ; D1 3A | Compare accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	SBC $28CB			; ED CB 28 | Subtract with carry (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	JMP $28CB68		  ; 5C 68 CB 28 | Jump to address long
	CMP $CB68,Y		  ; D9 68 CB | Compare accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	STA $28CB			; 8D CB 28 | Audio system operation
	INC $28CB			; EE CB 28 | Increment (absolute)
	ROR $28CD			; 6E CD 28 | Rotate right (absolute)
	BVS $CD			  ; 70 CD | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	ROR				  ; 6A | Rotate right (accumulator)
	CMP $3A28			; CD 28 3A | Compare accumulator (absolute)
	BVC $CD			  ; 50 CD | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	EOR ($CD),Y		  ; 51 CD | Exclusive OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	ADC $CD54,X		  ; 7D 54 CD | Add with carry (absolute,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_140
; Address: $D0CB4F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_140:
	JSL $28CD55		  ; 22 55 CD 28 | Jump to subroutine long
	CMP $B228			; CD 28 B2 | Compare accumulator (absolute)
	CMP $8F28			; CD 28 8F | Compare accumulator (absolute)
	CMP $4528			; CD 28 45 | Compare accumulator (absolute)
	ADC ($CD,X)		  ; 61 CD | Add with carry ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CMP $4E28			; CD 28 4E | Compare accumulator (absolute)
	CMP $A128			; CD 28 A1 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_141
; Address: $D0CB6D
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_141:
	CMP $D528			; CD 28 D5 | Compare accumulator (absolute)
	CMP $6828			; CD 28 68 | Compare accumulator (absolute)
	STZ $CD			  ; 64 CD | Store zero to zero page
	PLP				  ; 28 | Pull processor status from stack
	CMP $F028			; CD 28 F0 | Compare accumulator (absolute)
	CMP $0C28			; CD 28 0C | Compare accumulator (absolute)
	CMP $8028			; CD 28 80 | Compare accumulator (absolute)
	CMP $4228			; CD 28 42 | Hardware register operation
	STA ($CD,X)		  ; 81 CD | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	STX $CD			  ; 86 CD | Store X register to zero page
	PLP				  ; 28 | Pull processor status from stack
	DEY				  ; 88 | Decrement Y register
	CMP $1E28			; CD 28 1E | Compare accumulator (absolute)
	CMP $0528			; CD 28 05 | Compare accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	CMP $0F28			; CD 28 0F | Compare accumulator (absolute)
	BIT #$CD			 ; 89 CD | Test bits in accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ADC #$EE			 ; 69 EE | Add with carry (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	INC $28CB			; EE CB 28 | Increment (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ORA $A4			  ; 05 A4 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLY				  ; 7A | Pull Y register from stack
	INC $28CB			; EE CB 28 | Increment (absolute)
	PHB				  ; 8B | Push data bank register to stack
	INC $28CB			; EE CB 28 | Increment (absolute)
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	STZ $CBEE			; 9C EE CB | Store zero to absolute
	PLP				  ; 28 | Pull processor status from stack
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	CMP $3B28			; CD 28 3B | Compare accumulator (absolute)
	AND #$CD			 ; 29 CD | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	CMP $6C28			; CD 28 6C | Compare accumulator (absolute)
	CMP $9128			; CD 28 91 | Compare accumulator (absolute)
	LDA $A528CB		  ; AF CB 28 A5 | Audio system operation
	BCS $CB			  ; B0 CB | Branch if carry set
	PLP				  ; 28 | Pull processor status from stack
	LDA ($CB),Y		  ; B1 CB | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	TXS				  ; 9A | Transfer X register to stack pointer
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	INC $28CB			; EE CB 28 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_142
; Address: $D0CBE7
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_142:
	ORA $4A			  ; 05 4A | Logical OR with accumulator (zero page)
	CMP $5228			; CD 28 52 | Compare accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $9F28			; CD 28 9F | Compare accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $2628			; CD 28 26 | Compare accumulator (absolute)
	INC $28CB			; EE CB 28 | Increment (absolute)
	JMP $28CD			; 4C CD 28 | Jump to address
	ASL $CD4D,X		  ; 1E 4D CD | Arithmetic shift left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	INC $28CB			; EE CB 28 | Increment (absolute)
	BCC $CD			  ; 90 CD | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	JMP $CD93			; 4C 93 CD | Jump to address
	PLP				  ; 28 | Pull processor status from stack
	BPL $94			  ; 10 94 | Branch if positive
	CMP $BE28			; CD 28 BE | Compare accumulator (absolute)
	LDA $28CB,Y		  ; B9 CB 28 | Audio system operation
	LDX $CD10,Y		  ; BE 10 CD | Load from absolute,Y into X register
	PLP				  ; 28 | Pull processor status from stack
	SBC $CBEE,Y		  ; F9 EE CB | Subtract with carry (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	LDA $CBEE			; AD EE CB | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	DEC $EE			  ; C6 EE | Decrement (zero page)
	PLP				  ; 28 | Pull processor status from stack
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	EOR $C574,Y		  ; 59 74 C5 | Exclusive OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	CMP $01			  ; C5 01 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_143
; Address: $D0CC37
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_143:
	JSL $28C575		  ; 22 75 C5 28 | Jump to subroutine long
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	ADC ($76),Y		  ; 71 76 | Add with carry ((zero page),Y)
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	LDA ($76,X)		  ; A1 76 | Audio system operation
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	ORA $C577,Y		  ; 19 77 C5 | Logical OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_144
; Address: $D0CC60
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_144:
	ADC $28C5,Y		  ; 79 C5 28 | Add with carry (absolute,Y)
	ADC $28C5,Y		  ; 79 C5 28 | Add with carry (absolute,Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	ADC $28C5,Y		  ; 79 C5 28 | Add with carry (absolute,Y)
	LSR $C57A,X		  ; 5E 7A C5 | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CPY #$7A			 ; C0 7A | Compare Y register (immediate)
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	LDY $77			  ; A4 77 | Load from zero page into Y register
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	LDA $77			  ; A5 77 | Audio system operation
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	AND $C578,X		  ; 3D 78 C5 | Logical AND with accumulator (absolute,X)
	ORA $9195,Y		  ; 19 95 91 | Logical OR with accumulator (absolute,Y)
	CMP $18			  ; C5 18 | Compare accumulator (zero page)
	CMP $17			  ; C5 17 | Compare accumulator (zero page)
	CMP $16			  ; C5 16 | Compare accumulator (zero page)
	CMP $15			  ; C5 15 | Compare accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	LDA ($93,X)		  ; A1 93 | Audio system operation
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	LDX $C593			; AE 93 C5 | Load from absolute address into X register
	PLP				  ; 28 | Pull processor status from stack
	CMP $28			  ; C5 28 | Compare accumulator (zero page)
	INY				  ; C8 | Increment Y register
	CMP $2D			  ; C5 2D | Compare accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BCC $40			  ; 90 40 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	ROL $F060			; 2E 60 F0 | Rotate left (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	DEC				  ; 3A | Decrement accumulator
	BRA $A0			  ; 80 A0 | Branch always
	WDM #$0C			 ; 42 0C | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BNE $40			  ; D0 40 | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	AND $E070,X		  ; 3D 70 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ROL $1080,X		  ; 3E 80 10 | Rotate left (absolute,X)
	EOR ($10,X)		  ; 41 10 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_145
; Address: $D0CCCA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_145:
	JSR $4040			; 20 40 40 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	BNE $42			  ; D0 42 | Hardware register operation
	BIT $40			  ; 24 40 | Test bits in accumulator (zero page)
	EOR ($90,X)		  ; 41 90 | Exclusive OR with accumulator ((zero page,X))
	BPL $41			  ; 10 41 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	WDM #$88			 ; 42 88 | Reserved instruction
	BEQ $40			  ; F0 40 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	WDM #$38			 ; 42 38 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_146
; Address: $D0CCE7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_146:
	WDM #$3C			 ; 42 3C | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_147
; Address: $D0CCED
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_147:
	WDM #$40			 ; 42 40 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	BRA $90			  ; 80 90 | Branch always
	WDM #$44			 ; 42 44 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	EOR $70			  ; 45 70 | Exclusive OR with accumulator (zero page)
	BNE $40			  ; D0 40 | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	EOR $70			  ; 45 70 | Exclusive OR with accumulator (zero page)
	BNE $40			  ; D0 40 | Branch if not equal
	BIT $4540			; 2C 40 45 | Test bits in accumulator (absolute)
	BVS $D0			  ; 70 D0 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BMI $40			  ; 30 40 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	EOR #$C8			 ; 49 C8 | Exclusive OR with accumulator (immediate)
	BVC $42			  ; 50 42 | Hardware register operation
	JMP $4A40			; 4C 40 4A | Jump to address
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	BNE $40			  ; D0 40 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	JMP $D048			; 4C 48 D0 | Jump to address

;------------------------------------------------------------------------------
; Bank20_AudioFunction_148
; Address: $D0CD23
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_148:
	RTI				  ; 40 | Return from interrupt
	BVC $40			  ; 50 40 | Branch if overflow clear
	EOR $B088			; 4D 88 B0 | Exclusive OR with accumulator (absolute)
	EOR ($64,X)		  ; 41 64 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	EOR $F098			; 4D 98 F0 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_149
; Address: $D0CD31
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_149:
	RTI				  ; 40 | Return from interrupt
	LSR $20B0			; 4E B0 20 | Logical shift right (absolute)
	EOR ($5C,X)		  ; 41 5C | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $80			  ; F0 80 | Branch if equal
	CLI				  ; 58 | Clear interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BVC $88			  ; 50 88 | Branch if overflow clear
	BVS $42			  ; 70 42 | Hardware register operation
	JMP ($5140)		  ; 6C 40 51 | Jump to address (absolute indirect)
	BVS $C0			  ; 70 C0 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	BVS $42			  ; 70 42 | Hardware register operation
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ADC $5740,X		  ; 7D 40 57 | Add with carry (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_14A
; Address: $D0CD59
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_14A:
	EOR ($70,X)		  ; 41 70 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	EOR $1090,Y		  ; 59 90 10 | Exclusive OR with accumulator (absolute,Y)
	WDM #$74			 ; 42 74 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	PHY				  ; 5A | Push Y register to stack
	CLC				  ; 18 | Clear carry flag
	AND ($C2,X)		  ; 21 C2 | Logical AND with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	PHY				  ; 5A | Push Y register to stack
	INY				  ; C8 | Increment Y register
	BVC $C2			  ; 50 C2 | Branch if overflow clear
	STY $5C40			; 8C 40 5C | Store Y register to absolute address
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	JMP $411058		  ; 5C 58 10 41 | Jump to address long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_14B
; Address: $D0CD78
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_14B:
	STY $40			  ; 84 40 | Store Y register to zero page
	EOR $50E0,X		  ; 5D E0 50 | Exclusive OR with accumulator (absolute,X)
	EOR ($98,X)		  ; 41 98 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	EOR $F0E8,X		  ; 5D E8 F0 | Exclusive OR with accumulator (absolute,X)
	EOR ($9C,X)		  ; 41 9C | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LSR $B088,X		  ; 5E 88 B0 | Logical shift right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BCC $40			  ; 90 40 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR ($94,X)		  ; 41 94 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ADC ($08,X)		  ; 61 08 | Add with carry ((zero page,X))
	ORA ($42),Y		  ; 11 42 | Hardware register operation
	BCS $40			  ; B0 40 | Branch if carry set
	ADC ($60,X)		  ; 61 60 | Add with carry ((zero page,X))
	STA ($AC,X)		  ; 81 AC | Audio system operation
	RTI				  ; 40 | Return from interrupt
	ADC ($58,X)		  ; 61 58 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_14C
; Address: $D0CDA0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_14C:
	JSR $B442			; 20 42 B4 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BVS $C0			  ; 70 C0 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	LDY $40			  ; A4 40 | Load from zero page into Y register
	BCC $C0			  ; 90 C0 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	STZ $A0			  ; 64 A0 | Store zero to zero page
	BPL $42			  ; 10 42 | Hardware register operation
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	BNE $40			  ; D0 40 | Branch if not equal
	LDY $6840,X		  ; BC 40 68 | Load from absolute,X into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_14D
; Address: $D0CDBE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_14D:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	ROR $3058			; 6E 58 30 | Rotate right (absolute)
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	ROR $D120			; 6E 20 D1 | Rotate right (absolute)
	EOR ($CC,X)		  ; 41 CC | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BVS $E0			  ; 70 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BVS $70			  ; 70 70 | Branch if overflow set
	CPX #$40			 ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_14E
; Address: $D0CDD8
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_14E:
	CPY $40			  ; C4 40 | Compare Y register (zero page)
	ADC ($40),Y		  ; 71 40 | Add with carry ((zero page),Y)
	STA ($41),Y		  ; 91 41 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BRA $41			  ; 80 41 | Branch always
	BNE $40			  ; D0 40 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	BCC $43			  ; 90 43 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	BMI $70			  ; 30 70 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	ADC $4088,Y		  ; 79 88 40 | Add with carry (absolute,Y)
	STA ($EC,X)		  ; 81 EC | Audio system operation
	RTI				  ; 40 | Return from interrupt
	ADC $60F8,Y		  ; 79 F8 60 | Add with carry (absolute,Y)
	EOR ($E8,X)		  ; 41 E8 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX $40			  ; E4 40 | Compare X register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	PEA #$8340		   ; F4 40 83 | Push effective address to stack
	BCC $B0			  ; 90 B0 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	BEQ $40			  ; F0 40 | Branch if equal
	STA $C8			  ; 85 C8 | Audio system operation
	BVC $43			  ; 50 43 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	EOR ($85,X)		  ; 41 85 | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_14F
; Address: $D0CE1E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_14F:
	STA ($42),Y		  ; 91 42 | Hardware register operation
	EOR ($86,X)		  ; 41 86 | Exclusive OR with accumulator ((zero page,X))
	BRA $F0			  ; 80 F0 | Branch always
	RTI				  ; 40 | Return from interrupt
	EOR ($87,X)		  ; 41 87 | Exclusive OR with accumulator ((zero page,X))
	BCC $E0			  ; 90 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	EOR ($88,X)		  ; 41 88 | Exclusive OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	BNE $40			  ; D0 40 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	BIT #$90			 ; 89 90 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_150
; Address: $D0CE36
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_150:
	BCC $40			  ; 90 40 | Branch if carry clear
	BPL $41			  ; 10 41 | Branch if positive
	TXA				  ; 8A | Transfer X register to accumulator
	BCC $90			  ; 90 90 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	EOR ($8C,X)		  ; 41 8C | Exclusive OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BCS $40			  ; B0 40 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	STA $D108			; 8D 08 D1 | Audio system operation
	REP #$1C			 ; C2 1C | Reset processor status bits
	EOR ($8F,X)		  ; 41 8F | Exclusive OR with accumulator ((zero page,X))
	BCC $20			  ; 90 20 | Branch if carry clear
	EOR ($18,X)		  ; 41 18 | Exclusive OR with accumulator ((zero page,X))
	EOR ($90,X)		  ; 41 90 | Exclusive OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_151
; Address: $D0CE54
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_151:
	JSR $D841			; 20 41 D8 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	BIT $9341			; 2C 41 93 | Test bits in accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	ORA ($43,X)		  ; 01 43 | Logical OR with accumulator ((zero page,X))
	BMI $41			  ; 30 41 | Branch if negative
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	EOR ($24,X)		  ; 41 24 | Exclusive OR with accumulator ((zero page,X))
	EOR ($97,X)		  ; 41 97 | Exclusive OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	EOR ($28,X)		  ; 41 28 | Exclusive OR with accumulator ((zero page,X))
	EOR ($98,X)		  ; 41 98 | Exclusive OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	BRA $83			  ; 80 83 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($98,X)		  ; 41 98 | Exclusive OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	BCC $81			  ; 90 81 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	EOR ($98,X)		  ; 41 98 | Exclusive OR with accumulator ((zero page,X))
	BMI $91			  ; 30 91 | Branch if negative
	STA ($44,X)		  ; 81 44 | Audio system operation
	EOR ($99,X)		  ; 41 99 | Exclusive OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $41			  ; 50 41 | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	EOR ($99,X)		  ; 41 99 | Exclusive OR with accumulator ((zero page,X))
	BMI $51			  ; 30 51 | Branch if negative
	EOR ($3C,X)		  ; 41 3C | Exclusive OR with accumulator ((zero page,X))
	EOR ($99,X)		  ; 41 99 | Exclusive OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	BMI $41			  ; 30 41 | Branch if negative
	BVC $41			  ; 50 41 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_152
; Address: $D0CE94
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_152:
	STA $3140,Y		  ; 99 40 31 | Audio system operation
	EOR ($58,X)		  ; 41 58 | Exclusive OR with accumulator ((zero page,X))
	EOR ($9A,X)		  ; 41 9A | Exclusive OR with accumulator ((zero page,X))
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	EOR ($9A,X)		  ; 41 9A | Exclusive OR with accumulator ((zero page,X))
	BVS $F0			  ; 70 F0 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_153
; Address: $D0CEA5
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_153:
	EOR ($9B,X)		  ; 41 9B | Exclusive OR with accumulator ((zero page,X))
	BVS $F0			  ; 70 F0 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	JMP $9B41			; 4C 41 9B | Jump to address
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	STZ $41			  ; 64 41 | Store zero to zero page
	STZ $F078			; 9C 78 F0 | Store zero to absolute
	RTI				  ; 40 | Return from interrupt
	EOR ($9D,X)		  ; 41 9D | Exclusive OR with accumulator ((zero page,X))
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	JMP $609E41		  ; 5C 41 9E 60 | Jump to address long
	BCS $41			  ; B0 41 | Branch if carry set
	EOR ($9F,X)		  ; 41 9F | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND ($41),Y		  ; 31 41 | Logical AND with accumulator ((zero page),Y)
	BVS $41			  ; 70 41 | Branch if overflow set
	LDY #$D8			 ; A0 D8 | Load immediate value into Y register
	BNE $41			  ; D0 41 | Branch if not equal
	JMP ($A041)		  ; 6C 41 A0 | Jump to address (absolute indirect)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $42			  ; 90 42 | Hardware register operation
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($A2,X)		  ; 41 A2 | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_154
; Address: $D0CED8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_154:
	CPX #$42			 ; E0 42 | Hardware register operation
	EOR ($A3,X)		  ; 41 A3 | Exclusive OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	BCS $81			  ; B0 81 | Branch if carry set
	DEY				  ; 88 | Decrement Y register
	EOR ($A3,X)		  ; 41 A3 | Exclusive OR with accumulator ((zero page,X))
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	CPY #$94			 ; C0 94 | Compare Y register (immediate)
	EOR ($A3,X)		  ; 41 A3 | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_155
; Address: $D0CEEA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_155:
	LDA ($C0),Y		  ; B1 C0 | Audio system operation
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR ($A4,X)		  ; 41 A4 | Exclusive OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_156
; Address: $D0CEF0
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_156:
	BVS $42			  ; 70 42 | Hardware register operation
	EOR ($A4,X)		  ; 41 A4 | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_157
; Address: $D0CEF6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_157:
	BEQ $40			  ; F0 40 | Branch if equal
	BCC $41			  ; 90 41 | Branch if carry clear
	LDA $78			  ; A5 78 | Audio system operation
	BVC $41			  ; 50 41 | Branch if overflow clear
	STY $A641			; 8C 41 A6 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	BEQ $42			  ; F0 42 | Hardware register operation
	BRA $41			  ; 80 41 | Branch always
	LDX $E8			  ; A6 E8 | Load from zero page into X register
	STY $41			  ; 84 41 | Store Y register to zero page
	LDX $88			  ; A6 88 | Load from zero page into X register
	BPL $41			  ; 10 41 | Branch if positive
	LDY #$41			 ; A0 41 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_158
; Address: $D0CF14
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_158:
	JSR $9C41			; 20 41 9C | Jump to subroutine
	EOR ($A8,X)		  ; 41 A8 | Exclusive OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CMP ($43,X)		  ; C1 43 | Compare accumulator ((zero page,X))
	EOR ($A8,X)		  ; 41 A8 | Exclusive OR with accumulator ((zero page,X))
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	WDM #$C8			 ; 42 C8 | Reserved instruction
	EOR ($A8,X)		  ; 41 A8 | Exclusive OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	WDM #$CC			 ; 42 CC | Reserved instruction
	EOR ($A8,X)		  ; 41 A8 | Exclusive OR with accumulator ((zero page,X))
	BVS $C1			  ; 70 C1 | Branch if overflow set
	WDM #$D8			 ; 42 D8 | Reserved instruction
	EOR ($A8,X)		  ; 41 A8 | Exclusive OR with accumulator ((zero page,X))
	BVC $11			  ; 50 11 | Branch if overflow clear
	EOR ($18,X)		  ; 41 18 | Exclusive OR with accumulator ((zero page,X))
	WDM #$A9			 ; 42 A9 | Reserved instruction
	SED				  ; F8 | Set decimal mode flag
	BCC $42			  ; 90 42 | Hardware register operation
	BNE $41			  ; D0 41 | Branch if not equal
	LDA #$70			 ; A9 70 | Audio system operation
	ADC ($42,X)		  ; 61 42 | Hardware register operation
	EOR ($A9,X)		  ; 41 A9 | Exclusive OR with accumulator ((zero page,X))
	BVS $10			  ; 70 10 | Branch if overflow set
	WDM #$DC			 ; 42 DC | Reserved instruction
	EOR ($A9,X)		  ; 41 A9 | Exclusive OR with accumulator ((zero page,X))
	BMI $91			  ; 30 91 | Branch if negative
	EOR ($E0,X)		  ; 41 E0 | Game work RAM access
	EOR ($AA,X)		  ; 41 AA | Exclusive OR with accumulator ((zero page,X))
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	WDM #$A8			 ; 42 A8 | Reserved instruction
	EOR ($AA,X)		  ; 41 AA | Exclusive OR with accumulator ((zero page,X))
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_159
; Address: $D0CF57
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_159:
	EOR ($AC,X)		  ; 41 AC | Exclusive OR with accumulator ((zero page,X))
	EOR ($AA,X)		  ; 41 AA | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SBC ($41,X)		  ; E1 41 | Subtract with carry ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	EOR ($AA,X)		  ; 41 AA | Exclusive OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	LDA ($41,X)		  ; A1 41 | Audio system operation
	LDY $AA41,X		  ; BC 41 AA | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($42,X)		  ; 01 42 | Hardware register operation
	BCS $41			  ; B0 41 | Branch if carry set
	TAX				  ; AA | Transfer accumulator to X register
	BVS $F0			  ; 70 F0 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	CPY #$41			 ; C0 41 | Compare Y register (immediate)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_15A
; Address: $D0CF73
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_15A:
	JSR $40C1			; 20 C1 40 | Jump to subroutine
	CPY $41			  ; C4 41 | Compare Y register (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	WDM #$AA			 ; 42 AA | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $41			  ; F0 41 | Branch if equal
	WDM #$AA			 ; 42 AA | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	LDY #$41			 ; A0 41 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	WDM #$AA			 ; 42 AA | Reserved instruction
	CLV				  ; B8 | Clear overflow flag
	BEQ $40			  ; F0 40 | Branch if equal
	BPL $42			  ; 10 42 | Hardware register operation
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_15B
; Address: $D0CF91
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_15B:
	JSR $4211			; 20 11 42 | Hardware register operation
	WDM #$AB			 ; 42 AB | Reserved instruction
	CLV				  ; B8 | Clear overflow flag
	BCS $80			  ; B0 80 | Branch if carry set
	WDM #$AC			 ; 42 AC | Reserved instruction

;------------------------------------------------------------------------------
; Bank20_AudioFunction_15C
; Address: $D0CF9D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_15C:
	JSR $42A1			; 20 A1 42 | Hardware register operation
	LDY $41			  ; A4 41 | Load from zero page into Y register
	LDY $5050			; AC 50 50 | Load from absolute address into Y register
	EOR ($E4,X)		  ; 41 E4 | Exclusive OR with accumulator ((zero page,X))
	EOR ($AC,X)		  ; 41 AC | Exclusive OR with accumulator ((zero page,X))
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BRA $E8			  ; 80 E8 | Branch always
	EOR ($AC,X)		  ; 41 AC | Exclusive OR with accumulator ((zero page,X))
	BVC $70			  ; 50 70 | Branch if overflow clear
	BRA $EC			  ; 80 EC | Branch always

;------------------------------------------------------------------------------
; Bank20_AudioFunction_15D
; Address: $D0CFB3
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_15D:
	EOR ($AC,X)		  ; 41 AC | Exclusive OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BCS $80			  ; B0 80 | Branch if carry set
	PEA #$AD41		   ; F4 41 AD | Push effective address to stack
	SEI				  ; 78 | Set interrupt disable flag
	BNE $41			  ; D0 41 | Branch if not equal
	BEQ $41			  ; F0 41 | Branch if equal
	LDA $9080			; AD 80 90 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	EOR ($AE,X)		  ; 41 AE | Exclusive OR with accumulator ((zero page,X))
	BNE $F0			  ; D0 F0 | Branch if not equal
	EOR ($B4,X)		  ; 41 B4 | Exclusive OR with accumulator ((zero page,X))
	EOR ($B0,X)		  ; 41 B0 | Exclusive OR with accumulator ((zero page,X))
	LDY #$31			 ; A0 31 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_15E
; Address: $D0CFD0
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_15E:
	JSR $B142			; 20 42 B1 | Jump to subroutine
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	EOR ($1C,X)		  ; 41 1C | Exclusive OR with accumulator ((zero page,X))
	WDM #$B2			 ; 42 B2 | Reserved instruction
	CLD				  ; D8 | Clear decimal mode flag
	BVC $81			  ; 50 81 | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	WDM #$B2			 ; 42 B2 | Reserved instruction
	INY				  ; C8 | Increment Y register
	BNE $C2			  ; D0 C2 | Branch if not equal
	WDM #$B2			 ; 42 B2 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	EOR ($43),Y		  ; 51 43 | Exclusive OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	WDM #$B2			 ; 42 B2 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	LDA ($43,X)		  ; A1 43 | Audio system operation
	WDM #$B2			 ; 42 B2 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	STA ($41,X)		  ; 81 41 | Audio system operation
	BVS $42			  ; 70 42 | Hardware register operation
	PLA				  ; 68 | Pull accumulator from stack
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BIT $42			  ; 24 42 | Hardware register operation
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_15F
; Address: $D0CFFE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_15F:
	JSR $2841			; 20 41 28 | Jump to subroutine
	WDM #$B7			 ; 42 B7 | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	BCS $40			  ; B0 40 | Branch if carry set
	BIT $B742			; 2C 42 B7 | Test bits in accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BMI $41			  ; 30 41 | Branch if negative
	BMI $42			  ; 30 42 | Hardware register operation
	CLV				  ; B8 | Clear overflow flag
	ADC ($40,X)		  ; 61 40 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_161
; Address: $D0D016
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_161:
	JSR $5842			; 20 42 58 | Jump to subroutine
	WDM #$B9			 ; 42 B9 | Reserved instruction
	SEC				  ; 38 | Set carry flag
	BNE $41			  ; D0 41 | Branch if not equal
	STZ $42			  ; 64 42 | Hardware register operation
	LDA $C110,Y		  ; B9 10 C1 | Audio system operation
	EOR ($60,X)		  ; 41 60 | Exclusive OR with accumulator ((zero page,X))
	WDM #$BA			 ; 42 BA | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_162
; Address: $D0D028
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_162:
	BCS $41			  ; B0 41 | Branch if carry set
	JMP $BB42			; 4C 42 BB | Jump to address
	CLI				  ; 58 | Clear interrupt disable flag
	BEQ $40			  ; F0 40 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	WDM #$BB			 ; 42 BB | Reserved instruction
	PHA				  ; 48 | Push accumulator to stack
	EOR ($54,X)		  ; 41 54 | Exclusive OR with accumulator ((zero page,X))
	WDM #$BC			 ; 42 BC | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_163
; Address: $D0D03A
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_163:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BVC $42			  ; 50 42 | Hardware register operation
	LDY $70D0,X		  ; BC D0 70 | Load from absolute,X into Y register
	WDM #$6C			 ; 42 6C | Reserved instruction
	WDM #$BD			 ; 42 BD | Reserved instruction
	BCS $80			  ; B0 80 | Branch if carry set
	WDM #$68			 ; 42 68 | Reserved instruction
	WDM #$BD			 ; 42 BD | Reserved instruction
	CMP ($40,X)		  ; C1 40 | Compare accumulator ((zero page,X))
	WDM #$BE			 ; 42 BE | Reserved instruction
	BPL $B1			  ; 10 B1 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	WDM #$BE			 ; 42 BE | Reserved instruction
	INX				  ; E8 | Increment X register
	BMI $41			  ; 30 41 | Branch if negative
	STY $42			  ; 84 42 | Hardware register operation
	LDX $81C8,Y		  ; BE C8 81 | Load from absolute,Y into X register
	BIT #$42			 ; 89 42 | Hardware register operation
	LDA				  ; BF 88 D0 40 | Load from absolute long,X into accumulator
	WDM #$C0			 ; 42 C0 | Reserved instruction
	BVS $B0			  ; 70 B0 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$C1			 ; 42 C1 | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	WDM #$C2			 ; 42 C2 | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_165
; Address: $D0D07B
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_165:
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$41			 ; A0 41 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	WDM #$C3			 ; 42 C3 | Reserved instruction
	AND ($82),Y		  ; 31 82 | Logical AND with accumulator ((zero page),Y)
	STZ $C442			; 9C 42 C4 | Store zero to absolute
	BRA $B0			  ; 80 B0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BCC $42			  ; 90 42 | Hardware register operation
	DEC $70			  ; C6 70 | Decrement (zero page)
	BNE $40			  ; D0 40 | Branch if not equal
	WDM #$C7			 ; 42 C7 | Reserved instruction
	BVS $B0			  ; 70 B0 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	STY $C842			; 8C 42 C8 | Store Y register to absolute address
	BVS $90			  ; 70 90 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	WDM #$C8			 ; 42 C8 | Reserved instruction
	BRA $C0			  ; 80 C0 | Branch always
	EOR ($BC,X)		  ; 41 BC | Exclusive OR with accumulator ((zero page,X))
	WDM #$C8			 ; 42 C8 | Reserved instruction
	SEI				  ; 78 | Set interrupt disable flag
	STA ($43),Y		  ; 91 43 | Audio system operation
	CPY #$42			 ; C0 42 | Hardware register operation
	INY				  ; C8 | Increment Y register
	PLA				  ; 68 | Pull accumulator from stack
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	CPY $42			  ; C4 42 | Hardware register operation
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	EOR ($C8,X)		  ; 41 C8 | Exclusive OR with accumulator ((zero page,X))
	WDM #$C9			 ; 42 C9 | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$43			 ; E0 43 | Compare X register (immediate)
	LDY $42			  ; A4 42 | Hardware register operation
	CMP #$80			 ; C9 80 | Compare accumulator (immediate)
	BCS $42			  ; B0 42 | Hardware register operation
	TAY				  ; A8 | Transfer accumulator to Y register
	WDM #$C9			 ; 42 C9 | Reserved instruction
	BEQ $E0			  ; F0 E0 | Game work RAM access
	LDY $C942			; AC 42 C9 | Load from absolute address into Y register
	CLD				  ; D8 | Clear decimal mode flag
	BCS $42			  ; B0 42 | Hardware register operation
	BCS $42			  ; B0 42 | Hardware register operation
	CMP #$B0			 ; C9 B0 | Compare accumulator (immediate)
	BVS $81			  ; 70 81 | Branch if overflow set
	WDM #$C9			 ; 42 C9 | Reserved instruction
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $81			  ; 90 81 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_166
; Address: $D0D0D8
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_166:
	CLD				  ; D8 | Clear decimal mode flag
	WDM #$C9			 ; 42 C9 | Reserved instruction
	BCS $40			  ; B0 40 | Branch if carry set
	REP #$D4			 ; C2 D4 | Reset processor status bits
	WDM #$C9			 ; 42 C9 | Reserved instruction
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $C2			  ; 50 C2 | Branch if overflow clear
	BNE $42			  ; D0 42 | Hardware register operation
	DEX				  ; CA | Decrement X register
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	CPY $CA42			; CC 42 CA | Compare Y register (absolute)
	CLV				  ; B8 | Clear overflow flag
	BEQ $43			  ; F0 43 | Branch if equal
	CPX $42			  ; E4 42 | Hardware register operation
	DEX				  ; CA | Decrement X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $40			  ; B0 40 | Branch if carry set
	INX				  ; E8 | Increment X register
	WDM #$CB			 ; 42 CB | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	CMP ($82),Y		  ; D1 82 | Compare accumulator ((zero page),Y)
	WDM #$CB			 ; 42 CB | Reserved instruction

;------------------------------------------------------------------------------
; Bank20_AudioFunction_167
; Address: $D0D0FF
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_167:
	JSR $41A1			; 20 A1 41 | Jump to subroutine
	CPX #$42			 ; E0 42 | Hardware register operation
	PLP				  ; 28 | Pull processor status from stack
	AND ($41,X)		  ; 21 41 | Logical AND with accumulator ((zero page,X))
	BEQ $42			  ; F0 42 | Hardware register operation
	CPY $D0F8			; CC F8 D0 | Compare Y register (absolute)
	CPX $CC42			; EC 42 CC | Compare X register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($44,X)		  ; 61 44 | Add with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	WDM #$CD			 ; 42 CD | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	SBC ($43),Y		  ; F1 43 | Subtract with carry ((zero page),Y)
	PEA #$CE42		   ; F4 42 CE | Push effective address to stack
	BVC $10			  ; 50 10 | Branch if overflow clear
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BVC $20			  ; 50 20 | Branch if overflow clear
	WDM #$CF			 ; 42 CF | Reserved instruction
	BNE $81			  ; D0 81 | Branch if not equal
	EOR ($DD,X)		  ; 41 DD | Exclusive OR with accumulator ((zero page,X))
	BNE $78			  ; D0 78 | Branch if not equal
	BMI $41			  ; 30 41 | Branch if negative
	CPX #$44			 ; E0 44 | Compare X register (immediate)
	CMP ($C0),Y		  ; D1 C0 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_168
; Address: $D0D136
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_168:
	JSR $1041			; 20 41 10 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	CMP ($40,X)		  ; C1 40 | Compare accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_169
; Address: $D0D142
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_169:
	BEQ $41			  ; F0 41 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	LDY #$43			 ; A0 43 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_16A
; Address: $D0D14D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_16A:
	JSR $8351			; 20 51 83 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BVC $40			  ; 50 40 | Branch if overflow clear
	AND $43			  ; 25 43 | Logical AND with accumulator (zero page)
	CLV				  ; B8 | Clear overflow flag
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_16B
; Address: $D0D15C
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_16B:
	JSR $D543			; 20 43 D5 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	BVC $41			  ; 50 41 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	BRA $43			  ; 80 43 | Branch always
	AND $D643,Y		  ; 39 43 D6 | Logical AND with accumulator (absolute,Y)
	BCC $80			  ; 90 80 | Branch if carry clear
	EOR ($43,X)		  ; 41 43 | Exclusive OR with accumulator ((zero page,X))
	CMP ($83),Y		  ; D1 83 | Compare accumulator ((zero page),Y)
	EOR #$43			 ; 49 43 | Exclusive OR with accumulator (immediate)
	BMI $41			  ; 30 41 | Branch if negative
	BIT $D743			; 2C 43 D7 | Test bits in accumulator (absolute)
	BVC $E0			  ; 50 E0 | Game work RAM access
	EOR ($43),Y		  ; 51 43 | Exclusive OR with accumulator ((zero page),Y)
	CLD				  ; D8 | Clear decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_16C
; Address: $D0D184
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_16C:
	BCS $40			  ; B0 40 | Branch if carry set
	BMI $43			  ; 30 43 | Branch if negative
	CLD				  ; D8 | Clear decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	EOR ($5C,X)		  ; 41 5C | Exclusive OR with accumulator ((zero page,X))
	CMP $F0A0,Y		  ; D9 A0 F0 | Compare accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	CMP $0058,Y		  ; D9 58 00 | Compare accumulator (absolute,Y)
	EOR ($60,X)		  ; 41 60 | Exclusive OR with accumulator ((zero page,X))
	PHX				  ; DA | Push X register to stack
	BCS $01			  ; B0 01 | Branch if carry set
	WDM #$3C			 ; 42 3C | Reserved instruction
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_16D
; Address: $D0D1A1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_16D:
	JSR $4161			; 20 61 41 | Jump to subroutine
	STZ $43			  ; 64 43 | Store zero to zero page
	PHX				  ; DA | Push X register to stack
	BCS $B0			  ; B0 B0 | Branch if carry set
	CMP ($68,X)		  ; C1 68 | Compare accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BVC $40			  ; 50 40 | Branch if overflow clear
	DEY				  ; 88 | Decrement Y register
	BEQ $40			  ; F0 40 | Branch if equal
	JMP $DC43			; 4C 43 DC | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_16E
; Address: $D0D1BA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_16E:
	SBC ($40,X)		  ; E1 40 | Subtract with carry ((zero page,X))
	BCC $50			  ; 90 50 | Branch if carry clear
	WDM #$58			 ; 42 58 | Reserved instruction
	CPX #$58			 ; E0 58 | Compare X register (immediate)
	BNE $40			  ; D0 40 | Branch if not equal
	BVS $43			  ; 70 43 | Branch if overflow set
	SBC ($58,X)		  ; E1 58 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_16F
; Address: $D0D1CC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_16F:
	JSL $436C41		  ; 22 41 6C 43 | Jump to subroutine long
	SBC ($E8,X)		  ; E1 E8 | Subtract with carry ((zero page,X))
	BEQ $83			  ; F0 83 | Branch if equal
	ADC $E243,Y		  ; 79 43 E2 | Add with carry (absolute,Y)
	BVC $60			  ; 50 60 | Branch if overflow clear
	EOR ($74,X)		  ; 41 74 | Exclusive OR with accumulator ((zero page,X))
	SEP #$30			 ; E2 30 | Set processor status bits
	SBC ($43,X)		  ; E1 43 | Subtract with carry ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BEQ $C0			  ; F0 C0 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	STY $E343			; 8C 43 E3 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_170
; Address: $D0D1EB
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_170:
	WDM #$90			 ; 42 90 | Reserved instruction
	CPX $80			  ; E4 80 | Compare X register (zero page)
	CPX #$42			 ; E0 42 | Hardware register operation
	CPX $18			  ; E4 18 | Compare X register (zero page)
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
	BRA $43			  ; 80 43 | Branch always
	CPX $10			  ; E4 10 | Compare X register (zero page)
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	STA $43			  ; 85 43 | Audio system operation
	CPX $98			  ; E4 98 | Compare X register (zero page)
	CMP ($42),Y		  ; D1 42 | Hardware register operation
	TYA				  ; 98 | Transfer Y register to accumulator
	SBC $68			  ; E5 68 | Subtract with carry (zero page)
	BEQ $40			  ; F0 40 | Branch if equal
	INC $68			  ; E6 68 | Increment (zero page)
	STA ($44),Y		  ; 91 44 | Audio system operation
	LDY #$43			 ; A0 43 | Load immediate value into Y register
	BMI $41			  ; 30 41 | Branch if negative
	EOR ($9C,X)		  ; 41 9C | Exclusive OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BEQ $42			  ; F0 42 | Hardware register operation
	TAY				  ; A8 | Transfer accumulator to Y register
	SBC #$98			 ; E9 98 | Subtract with carry (immediate)
	CPY #$82			 ; C0 82 | Compare Y register (immediate)
	LDY $43			  ; A4 43 | Load from zero page into Y register
	NOP				  ; EA | No operation
	TYA				  ; 98 | Transfer Y register to accumulator
	STA ($75,X)		  ; 81 75 | Audio system operation
	BCS $43			  ; B0 43 | Branch if carry set

;------------------------------------------------------------------------------
; Bank20_AudioFunction_171
; Address: $D0D22A
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_171:
	CPX $20A0			; EC A0 20 | Compare X register (absolute)
	LDY $EC43			; AC 43 EC | Load from absolute address into Y register
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	EOR ($C0,X)		  ; 41 C0 | Exclusive OR with accumulator ((zero page,X))
	CPX $6158			; EC 58 61 | Compare X register (absolute)
	EOR ($C8,X)		  ; 41 C8 | Exclusive OR with accumulator ((zero page,X))
	CPX $A148			; EC 48 A1 | Compare X register (absolute)
	WDM #$C4			 ; 42 C4 | Reserved instruction
	SBC $B0D8			; ED D8 B0 | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	INC $B0D8			; EE D8 B0 | Increment (absolute)
	RTI				  ; 40 | Return from interrupt
	LDY $EF43,X		  ; BC 43 EF | Load from absolute,X into Y register
	CLD				  ; D8 | Clear decimal mode flag
	ADC ($41),Y		  ; 71 41 | Add with carry ((zero page),Y)
	CLV				  ; B8 | Clear overflow flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BMI $42			  ; 30 42 | Hardware register operation
	BNE $43			  ; D0 43 | Branch if not equal
	SBC ($50),Y		  ; F1 50 | Subtract with carry ((zero page),Y)
	EOR ($41),Y		  ; 51 41 | Exclusive OR with accumulator ((zero page),Y)
	CPY $F143			; CC 43 F1 | Compare Y register (absolute)
	RTI				  ; 40 | Return from interrupt
	REP #$82			 ; C2 82 | Reset processor status bits
	CMP $F243,Y		  ; D9 43 F2 | Compare accumulator (absolute,Y)
	BRA $A0			  ; 80 A0 | Branch always
	WDM #$D4			 ; 42 D4 | Reserved instruction
	TAY				  ; A8 | Transfer accumulator to Y register
	CPX #$41			 ; E0 41 | Compare X register (immediate)
	CPX #$43			 ; E0 43 | Compare X register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR ($DC,X)		  ; 41 DC | Exclusive OR with accumulator ((zero page,X))
	PEA #$4118		   ; F4 18 41 | Push effective address to stack
	WDM #$E8			 ; 42 E8 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	SBC ($42,X)		  ; E1 42 | Hardware register operation
	CPX $43			  ; E4 43 | Compare X register (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	BMI $41			  ; 30 41 | Branch if negative
	BEQ $43			  ; F0 43 | Branch if equal
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	WDM #$EC			 ; 42 EC | Reserved instruction
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_172
; Address: $D0D297
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_172:
	JSR $41E1			; 20 E1 41 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	STA ($43,X)		  ; 81 43 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_173
; Address: $D0D2A0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_173:
	ORA #$44			 ; 09 44 | Logical OR with accumulator (immediate)
	SBC $D088,Y		  ; F9 88 D0 | Subtract with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	PEA #$F943		   ; F4 43 F9 | Push effective address to stack
	INX				  ; E8 | Increment X register
	BPL $42			  ; 10 42 | Hardware register operation
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($FC,X)		  ; 41 FC | Exclusive OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_175
; Address: $D0D2BD
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_175:
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $40			  ; F0 40 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	SBC $0180,X		  ; FD 80 01 | Subtract with carry (absolute,X)
	EOR ($14,X)		  ; 41 14 | Exclusive OR with accumulator ((zero page,X))
	SBC $F0E8,X		  ; FD E8 F0 | Subtract with carry (absolute,X)
	WDM #$20			 ; 42 20 | Reserved instruction
	INC $B170,X		  ; FE 70 B1 | Increment (absolute,X)
	INC $01E8,X		  ; FE E8 01 | Increment (absolute,X)
	EOR ($2C,X)		  ; 41 2C | Exclusive OR with accumulator ((zero page,X))
	INC $00F8,X		  ; FE F8 00 | Increment (absolute,X)
	EOR ($30,X)		  ; 41 30 | Exclusive OR with accumulator ((zero page,X))
	BVS $B0			  ; 70 B0 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	AND ($41),Y		  ; 31 41 | Logical AND with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	EOR ($E0),Y		  ; 51 E0 | Game work RAM access
	AND $0144,Y		  ; 39 44 01 | Logical AND with accumulator (absolute,Y)
	EOR #$41			 ; 49 41 | Exclusive OR with accumulator (immediate)
	EOR ($34,X)		  ; 41 34 | Exclusive OR with accumulator ((zero page,X))
	ORA ($59,X)		  ; 01 59 | Logical OR with accumulator ((zero page,X))
	BNE $40			  ; D0 40 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	CMP ($70),Y		  ; D1 70 | Compare accumulator ((zero page),Y)
	WDM #$3C			 ; 42 3C | Reserved instruction
	ADC ($C0,X)		  ; 61 C0 | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	LDA $4130,Y		  ; B9 30 41 | Audio system operation
	EOR ($30),Y		  ; 51 30 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($50,X)		  ; 41 50 | Exclusive OR with accumulator ((zero page,X))
	ADC ($D0,X)		  ; 61 D0 | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	JMP $0444			; 4C 44 04 | Jump to address
	ADC #$00			 ; 69 00 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_176
; Address: $D0D323
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_176:
	EOR ($58,X)		  ; 41 58 | Exclusive OR with accumulator ((zero page,X))
	ORA $61			  ; 05 61 | Logical OR with accumulator (zero page)
	BEQ $40			  ; F0 40 | Branch if equal
	ORA $89			  ; 05 89 | Logical OR with accumulator (zero page)
	BVS $42			  ; 70 42 | Hardware register operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_177
; Address: $D0D332
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_177:
	ASL $71			  ; 06 71 | Arithmetic shift left (zero page)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	JMP $991344		  ; 5C 44 13 99 | Jump to address long
	BVS $40			  ; 70 40 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	ADC $41B0,Y		  ; 79 B0 41 | Add with carry (absolute,Y)
	JMP ($1744)		  ; 6C 44 17 | Jump to address (absolute indirect)
	STA ($10),Y		  ; 91 10 | Audio system operation
	WDM #$68			 ; 42 68 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	WDM #$74			 ; 42 74 | Reserved instruction
	ORA #$69			 ; 09 69 | Logical OR with accumulator (immediate)
	EOR ($70,X)		  ; 41 70 | Exclusive OR with accumulator ((zero page,X))
	ORA #$61			 ; 09 61 | Logical OR with accumulator (immediate)
	BNE $40			  ; D0 40 | Branch if not equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC ($D0,X)		  ; 61 D0 | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	EOR ($84,X)		  ; 41 84 | Exclusive OR with accumulator ((zero page,X))
	ADC $4110,Y		  ; 79 10 41 | Add with carry (absolute,Y)
	BRA $44			  ; 80 44 | Branch always
	ADC #$C0			 ; 69 C0 | Add with carry (immediate)
	RTI				  ; 40 | Return from interrupt
	STZ $44			  ; 64 44 | Store zero to zero page
	ORA $5079,Y		  ; 19 79 50 | Logical OR with accumulator (absolute,Y)
	EOR ($90,X)		  ; 41 90 | Exclusive OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ADC ($D0),Y		  ; 71 D0 | Add with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	STY $1B44			; 8C 44 1B | Store Y register to absolute address
	STA ($20,X)		  ; 81 20 | Audio system operation
	EOR ($9C,X)		  ; 41 9C | Exclusive OR with accumulator ((zero page,X))
	AND #$21			 ; 29 21 | PPU graphics register access
	EOR ($A0,X)		  ; 41 A0 | Exclusive OR with accumulator ((zero page,X))
	EOR ($C0),Y		  ; 51 C0 | Exclusive OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	SBC #$C0			 ; E9 C0 | Subtract with carry (immediate)
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_17A
; Address: $D0D3A4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_17A:
	JSL $01B141		  ; 22 41 B1 01 | Jump to subroutine long
	LDA ($44),Y		  ; B1 44 | Audio system operation
	AND #$A1			 ; 29 A1 | Logical AND with accumulator (immediate)
	EOR ($AC,X)		  ; 41 AC | Exclusive OR with accumulator ((zero page,X))
	SBC $C0D0,Y		  ; F9 D0 C0 | Subtract with carry (absolute,Y)
	LDY $2344,X		  ; BC 44 23 | Load from absolute,X into Y register
	LDA ($80,X)		  ; A1 80 | Audio system operation
	CMP ($44,X)		  ; C1 44 | Compare accumulator ((zero page,X))
	BIT $D9			  ; 24 D9 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_17B
; Address: $D0D3BE
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_17B:
	JSR $B441			; 20 41 B4 | Jump to subroutine
	BIT $A9			  ; 24 A9 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	BIT $C1			  ; 24 C1 | Test bits in accumulator (zero page)
	BCS $02			  ; B0 02 | Branch if carry set
	CMP $2444			; CD 44 24 | Compare accumulator (absolute)
	CMP $8310,Y		  ; D9 10 83 | Compare accumulator (absolute,Y)
	CMP ($44),Y		  ; D1 44 | Compare accumulator ((zero page),Y)
	AND $79			  ; 25 79 | Logical AND with accumulator (zero page)
	BRA $41			  ; 80 41 | Branch always
	CPY $44			  ; C4 44 | Compare Y register (zero page)
	AND $A9			  ; 25 A9 | Logical AND with accumulator (zero page)
	BEQ $41			  ; F0 41 | Branch if equal
	INY				  ; C8 | Increment Y register
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	LDY $44			  ; A4 44 | Load from zero page into Y register
	EOR ($F2,X)		  ; 41 F2 | Exclusive OR with accumulator ((zero page,X))
	REP #$20			 ; C2 20 | Reset processor status bits
	EOR ($27,X)		  ; 41 27 | Exclusive OR with accumulator ((zero page,X))
	ADC #$60			 ; 69 60 | Add with carry (immediate)
	ORA ($D2),Y		  ; 11 D2 | Logical OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ROL $99			  ; 26 99 | Rotate left (zero page)
	EOR ($A8,X)		  ; 41 A8 | Exclusive OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	STA $41D0,Y		  ; 99 D0 41 | Audio system operation
	EOR $28			  ; 45 28 | Exclusive OR with accumulator (zero page)
	EOR $4200,Y		  ; 59 00 42 | Hardware register operation
	PHP				  ; 08 | Push processor status to stack
	EOR $28			  ; 45 28 | Exclusive OR with accumulator (zero page)
	EOR $40A0,Y		  ; 59 A0 40 | Exclusive OR with accumulator (absolute,Y)
	EOR $28			  ; 45 28 | Exclusive OR with accumulator (zero page)
	ORA $40C1,Y		  ; 19 C1 40 | Logical OR with accumulator (absolute,Y)
	BPL $45			  ; 10 45 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	ORA $41D1,Y		  ; 19 D1 41 | Logical OR with accumulator (absolute,Y)
	EOR $28			  ; 45 28 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_17C
; Address: $D0D41D
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_17C:
	SBC ($80),Y		  ; F1 80 | Subtract with carry ((zero page),Y)
	EOR ($18,X)		  ; 41 18 | Exclusive OR with accumulator ((zero page,X))
	EOR $28			  ; 45 28 | Exclusive OR with accumulator (zero page)
	SBC ($30),Y		  ; F1 30 | Subtract with carry ((zero page),Y)
	WDM #$1C			 ; 42 1C | Reserved instruction
	EOR $29			  ; 45 29 | Exclusive OR with accumulator (zero page)
	LDA ($E0),Y		  ; B1 E0 | Game work RAM access
	STA ($E8,X)		  ; 81 E8 | Audio system operation
	AND #$69			 ; 29 69 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	WDM #$EC			 ; 42 EC | Reserved instruction
	AND #$61			 ; 29 61 | Logical AND with accumulator (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $44			  ; F0 44 | Branch if equal
	AND #$19			 ; 29 19 | Logical AND with accumulator (immediate)
	SBC ($40,X)		  ; E1 40 | Subtract with carry ((zero page,X))
	PEA #$2944		   ; F4 44 29 | Push effective address to stack
	LDA $41E1,Y		  ; B9 E1 41 | Audio system operation
	SED				  ; F8 | Set decimal mode flag
	AND #$31			 ; 29 31 | Logical AND with accumulator (immediate)
	AND ($41),Y		  ; 31 41 | Logical AND with accumulator ((zero page),Y)
	AND #$31			 ; 29 31 | Logical AND with accumulator (immediate)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	EOR $29			  ; 45 29 | Exclusive OR with accumulator (zero page)
	ADC #$90			 ; 69 90 | Add with carry (immediate)
	EOR ($38,X)		  ; 41 38 | Exclusive OR with accumulator ((zero page,X))
	EOR $29			  ; 45 29 | Exclusive OR with accumulator (zero page)
	BIT #$51			 ; 89 51 | Test bits in accumulator (immediate)
	EOR ($3C,X)		  ; 41 3C | Exclusive OR with accumulator ((zero page,X))
	EOR $29			  ; 45 29 | Exclusive OR with accumulator (zero page)
	BIT #$61			 ; 89 61 | Test bits in accumulator (immediate)
	WDM #$40			 ; 42 40 | Reserved instruction
	EOR $29			  ; 45 29 | Exclusive OR with accumulator (zero page)
	EOR ($61),Y		  ; 51 61 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($44,X)		  ; 41 44 | Exclusive OR with accumulator ((zero page,X))
	EOR $29			  ; 45 29 | Exclusive OR with accumulator (zero page)
	EOR ($51),Y		  ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
	WDM #$48			 ; 42 48 | Reserved instruction
	EOR $29			  ; 45 29 | Exclusive OR with accumulator (zero page)
	SBC $81D0,Y		  ; F9 D0 81 | Subtract with carry (absolute,Y)
	JMP $2A45			; 4C 45 2A | Jump to address
	ADC #$90			 ; 69 90 | Add with carry (immediate)
	EOR ($20,X)		  ; 41 20 | Exclusive OR with accumulator ((zero page,X))
	EOR $2A			  ; 45 2A | Exclusive OR with accumulator (zero page)
	ADC #$51			 ; 69 51 | Add with carry (immediate)
	EOR ($24,X)		  ; 41 24 | Exclusive OR with accumulator ((zero page,X))
	EOR $2A			  ; 45 2A | Exclusive OR with accumulator (zero page)
	ADC #$61			 ; 69 61 | Add with carry (immediate)
	WDM #$28			 ; 42 28 | Reserved instruction
	EOR $2A			  ; 45 2A | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_17D
; Address: $D0D489
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_17D:
	EOR ($61),Y		  ; 51 61 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($2C,X)		  ; 41 2C | Exclusive OR with accumulator ((zero page,X))
	EOR $2A			  ; 45 2A | Exclusive OR with accumulator (zero page)
	EOR ($51),Y		  ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
	WDM #$30			 ; 42 30 | Reserved instruction
	EOR $2A			  ; 45 2A | Exclusive OR with accumulator (zero page)
	LDA ($E0),Y		  ; B1 E0 | Game work RAM access
	EOR ($34,X)		  ; 41 34 | Exclusive OR with accumulator ((zero page,X))
	EOR $2A			  ; 45 2A | Exclusive OR with accumulator (zero page)
	BIT #$01			 ; 89 01 | Test bits in accumulator (immediate)
	WDM #$54			 ; 42 54 | Reserved instruction
	EOR $2B			  ; 45 2B | Exclusive OR with accumulator (zero page)
	STA $4221,Y		  ; 99 21 42 | Hardware register operation
	BVC $45			  ; 50 45 | Branch if overflow clear
	ADC #$90			 ; 69 90 | Add with carry (immediate)
	EOR ($60,X)		  ; 41 60 | Exclusive OR with accumulator ((zero page,X))
	EOR $2B			  ; 45 2B | Exclusive OR with accumulator (zero page)
	STA $41D1,Y		  ; 99 D1 41 | Audio system operation
	STZ $45			  ; 64 45 | Store zero to zero page
	BIT $9069			; 2C 69 90 | Test bits in accumulator (absolute)
	EOR ($58,X)		  ; 41 58 | Exclusive OR with accumulator ((zero page,X))
	EOR $2C			  ; 45 2C | Exclusive OR with accumulator (zero page)
	LDA #$F1			 ; A9 F1 | Audio system operation
	EOR ($5C,X)		  ; 41 5C | Exclusive OR with accumulator ((zero page,X))
	EOR $2C			  ; 45 2C | Exclusive OR with accumulator (zero page)
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	WDM #$6C			 ; 42 6C | Reserved instruction
	EOR $2D			  ; 45 2D | Exclusive OR with accumulator (zero page)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	EOR ($68,X)		  ; 41 68 | Exclusive OR with accumulator ((zero page,X))
	EOR $2F			  ; 45 2F | Exclusive OR with accumulator (zero page)
	STA ($C0),Y		  ; 91 C0 | Audio system operation
	BRA $74			  ; 80 74 | Branch always
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	ADC $40C0,Y		  ; 79 C0 40 | Add with carry (absolute,Y)
	BVS $45			  ; 70 45 | Branch if overflow set
	BMI $91			  ; 30 91 | Branch if negative
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	EOR ($8C,X)		  ; 41 8C | Exclusive OR with accumulator ((zero page,X))
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	STA ($F0),Y		  ; 91 F0 | Audio system operation
	EOR ($90,X)		  ; 41 90 | Exclusive OR with accumulator ((zero page,X))
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	ORA ($F1,X)		  ; 01 F1 | Logical OR with accumulator ((zero page,X))
	EOR ($94,X)		  ; 41 94 | Exclusive OR with accumulator ((zero page,X))
	EOR $31			  ; 45 31 | Exclusive OR with accumulator (zero page)
	BIT #$E0			 ; 89 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank20_AudioFunction_17E
; Address: $D0D4F1
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_17E:
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	EOR $31			  ; 45 31 | Exclusive OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR ($7C,X)		  ; 41 7C | Exclusive OR with accumulator ((zero page,X))
	EOR $31			  ; 45 31 | Exclusive OR with accumulator (zero page)
	BIT #$E0			 ; 89 E0 | Game work RAM access
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	EOR $31			  ; 45 31 | Exclusive OR with accumulator (zero page)
	SBC ($E0),Y		  ; F1 E0 | Game work RAM access
	EOR ($84,X)		  ; 41 84 | Exclusive OR with accumulator ((zero page,X))
	EOR $31			  ; 45 31 | Exclusive OR with accumulator (zero page)
	SBC ($E0),Y		  ; F1 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	STZ $3245			; 9C 45 32 | Store zero to absolute
	SBC ($E0),Y		  ; F1 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR $33			  ; 45 33 | Exclusive OR with accumulator (zero page)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	LDY $45			  ; A4 45 | Load from zero page into Y register
	ORA #$C1			 ; 09 C1 | Logical OR with accumulator (immediate)
	LDY #$45			 ; A0 45 | Load immediate value into Y register
	EOR $C191,Y		  ; 59 91 C1 | Exclusive OR with accumulator (absolute,Y)
	LDY $3545			; AC 45 35 | Load from absolute address into Y register
	AND ($81),Y		  ; 31 81 | Logical AND with accumulator ((zero page),Y)
	WDM #$A8			 ; 42 A8 | Reserved instruction
	EOR $35			  ; 45 35 | Exclusive OR with accumulator (zero page)
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	STA ($B4,X)		  ; 81 B4 | Audio system operation
	EOR $36			  ; 45 36 | Exclusive OR with accumulator (zero page)
	ADC #$30			 ; 69 30 | Add with carry (immediate)
	EOR ($B0,X)		  ; 41 B0 | Exclusive OR with accumulator ((zero page,X))
	EOR $36			  ; 45 36 | Exclusive OR with accumulator (zero page)
	STA $8120,Y		  ; 99 20 81 | Audio system operation
	LDY $3745,X		  ; BC 45 37 | Load from absolute,X into Y register
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	EOR $37			  ; 45 37 | Exclusive OR with accumulator (zero page)
	ADC ($50),Y		  ; 71 50 | Add with carry ((zero page),Y)
	EOR ($C4,X)		  ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
	EOR $38			  ; 45 38 | Exclusive OR with accumulator (zero page)
	ADC ($60),Y		  ; 71 60 | Add with carry ((zero page),Y)
	EOR ($C0,X)		  ; 41 C0 | Exclusive OR with accumulator ((zero page,X))
	EOR $39			  ; 45 39 | Exclusive OR with accumulator (zero page)
	LDA ($B0,X)		  ; A1 B0 | Audio system operation
	CMP ($45),Y		  ; D1 45 | Compare accumulator ((zero page),Y)
	AND $D0A9,Y		  ; 39 A9 D0 | Logical AND with accumulator (absolute,Y)
	BRA $D4			  ; 80 D4 | Branch always

;------------------------------------------------------------------------------
; Bank20_AudioFunction_17F
; Address: $D0D559
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_17F:
	EOR $3A			  ; 45 3A | Exclusive OR with accumulator (zero page)
	LDA ($B0,X)		  ; A1 B0 | Audio system operation
	INY				  ; C8 | Increment Y register
	EOR $3A			  ; 45 3A | Exclusive OR with accumulator (zero page)
	LDA #$D0			 ; A9 D0 | Audio system operation
	BRA $CC			  ; 80 CC | Branch always
	EOR $3A			  ; 45 3A | Exclusive OR with accumulator (zero page)
	ADC #$F1			 ; 69 F1 | Add with carry (immediate)
	EOR ($E0,X)		  ; 41 E0 | Game work RAM access
	EOR $3A			  ; 45 3A | Exclusive OR with accumulator (zero page)
	BIT #$11			 ; 89 11 | Test bits in accumulator (immediate)
	STA ($E4,X)		  ; 81 E4 | Audio system operation
	EOR $3B			  ; 45 3B | Exclusive OR with accumulator (zero page)
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	WDM #$D8			 ; 42 D8 | Reserved instruction
	EOR $3B			  ; 45 3B | Exclusive OR with accumulator (zero page)
	BIT #$11			 ; 89 11 | Test bits in accumulator (immediate)
	STA ($DC,X)		  ; 81 DC | Audio system operation
	EOR $3B			  ; 45 3B | Exclusive OR with accumulator (zero page)
	ADC #$B1			 ; 69 B1 | Add with carry (immediate)
	BEQ $45			  ; F0 45 | Branch if equal
	ADC #$D1			 ; 69 D1 | Add with carry (immediate)
	BRA $F4			  ; 80 F4 | Branch always
	EOR $3C			  ; 45 3C | Exclusive OR with accumulator (zero page)
	ADC #$B1			 ; 69 B1 | Add with carry (immediate)
	INX				  ; E8 | Increment X register
	EOR $3C			  ; 45 3C | Exclusive OR with accumulator (zero page)
	ADC #$D1			 ; 69 D1 | Add with carry (immediate)
	BRA $EC			  ; 80 EC | Branch always
	EOR $3C			  ; 45 3C | Exclusive OR with accumulator (zero page)
	LDA #$D0			 ; A9 D0 | Audio system operation
	BRA $FC			  ; 80 FC | Branch always
	EOR $3D			  ; 45 3D | Exclusive OR with accumulator (zero page)
	LDA #$D0			 ; A9 D0 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	EOR $3E			  ; 45 3E | Exclusive OR with accumulator (zero page)
	SBC ($C0),Y		  ; F1 C0 | Subtract with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	BPL $46			  ; 10 46 | Branch if positive
	ROL $40F1,X		  ; 3E F1 40 | Rotate left (absolute,X)
	EOR ($14,X)		  ; 41 14 | Exclusive OR with accumulator ((zero page,X))
	LSR $3F			  ; 46 3F | Logical shift right (zero page)
	CMP $40A0,Y		  ; D9 A0 40 | Compare accumulator (absolute,Y)
	LSR $40			  ; 46 40 | Logical shift right (zero page)
	CMP ($20),Y		  ; D1 20 | Compare accumulator ((zero page),Y)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	LSR $41			  ; 46 41 | Logical shift right (zero page)
	SBC $40D0,Y		  ; F9 D0 40 | Subtract with carry (absolute,Y)
	LSR $42			  ; 46 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_180
; Address: $D0D5C1
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_180:
	LDA $4230,Y		  ; B9 30 42 | Hardware register operation
	LSR $43			  ; 46 43 | Logical shift right (zero page)
	LDA $7121,Y		  ; B9 21 71 | Audio system operation
	BIT $46			  ; 24 46 | Test bits in accumulator (zero page)
	EOR ($21),Y		  ; 51 21 | PPU graphics register access
	EOR ($28,X)		  ; 41 28 | Exclusive OR with accumulator ((zero page,X))
	LSR $43			  ; 46 43 | Logical shift right (zero page)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	EOR $54			  ; 45 54 | Exclusive OR with accumulator (zero page)
	LSR $45			  ; 46 45 | Logical shift right (zero page)
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	EOR ($18,X)		  ; 41 18 | Exclusive OR with accumulator ((zero page,X))
	LSR $45			  ; 46 45 | Logical shift right (zero page)
	SBC $4100,Y		  ; F9 00 41 | Subtract with carry (absolute,Y)
	LSR $45			  ; 46 45 | Logical shift right (zero page)
	ADC ($B1),Y		  ; 71 B1 | Add with carry ((zero page),Y)
	BMI $46			  ; 30 46 | Branch if negative
	LSR $09			  ; 46 09 | Logical shift right (zero page)
	CMP ($42),Y		  ; D1 42 | Hardware register operation
	BIT $4646			; 2C 46 46 | Test bits in accumulator (absolute)
	STA ($11,X)		  ; 81 11 | Audio system operation
	EOR ($3C,X)		  ; 41 3C | Exclusive OR with accumulator ((zero page,X))
	LSR $46			  ; 46 46 | Logical shift right (zero page)
	BIT #$10			 ; 89 10 | Test bits in accumulator (immediate)
	EOR ($40,X)		  ; 41 40 | Exclusive OR with accumulator ((zero page,X))
	LSR $47			  ; 46 47 | Logical shift right (zero page)
	AND $40F1,Y		  ; 39 F1 40 | Logical AND with accumulator (absolute,Y)
	LSR $47			  ; 46 47 | Logical shift right (zero page)
	STA ($F0),Y		  ; 91 F0 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	LSR $47			  ; 46 47 | Logical shift right (zero page)
	SBC #$90			 ; E9 90 | Subtract with carry (immediate)
	WDM #$48			 ; 42 48 | Reserved instruction
	LSR $48			  ; 46 48 | Logical shift right (zero page)
	LDA ($60),Y		  ; B1 60 | Audio system operation
	EOR ($44,X)		  ; 41 44 | Exclusive OR with accumulator ((zero page,X))
	LSR $48			  ; 46 48 | Logical shift right (zero page)
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	EOR ($50,X)		  ; 41 50 | Exclusive OR with accumulator ((zero page,X))
	LSR $49			  ; 46 49 | Logical shift right (zero page)
	BIT #$20			 ; 89 20 | Test bits in accumulator (immediate)
	EOR ($4C,X)		  ; 41 4C | Exclusive OR with accumulator ((zero page,X))
	LSR $4A			  ; 46 4A | Logical shift right (zero page)
	STA ($70),Y		  ; 91 70 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_181
; Address: $D0D624
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_181:
	JSR $4A46			; 20 46 4A | Jump to subroutine
	SBC ($40,X)		  ; E1 40 | Subtract with carry ((zero page,X))
	EOR ($5C,X)		  ; 41 5C | Exclusive OR with accumulator ((zero page,X))
	LSR $4B			  ; 46 4B | Logical shift right (zero page)
	BIT #$D0			 ; 89 D0 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_182
; Address: $D0D62F
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_182:
	EOR ($58,X)		  ; 41 58 | Exclusive OR with accumulator ((zero page,X))
	LSR $4C			  ; 46 4C | Logical shift right (zero page)
	STA ($E0,X)		  ; 81 E0 | Game work RAM access
	WDM #$68			 ; 42 68 | Reserved instruction
	LSR $4C			  ; 46 4C | Logical shift right (zero page)
	ADC #$60			 ; 69 60 | Add with carry (immediate)
	JMP ($4D46)		  ; 6C 46 4D | Jump to address (absolute indirect)
	STA ($E0,X)		  ; 81 E0 | Game work RAM access
	WDM #$60			 ; 42 60 | Reserved instruction
	LSR $4D			  ; 46 4D | Logical shift right (zero page)
	ADC #$60			 ; 69 60 | Add with carry (immediate)
	STZ $46			  ; 64 46 | Store zero to zero page
	BVC $A1			  ; 50 A1 | Branch if overflow clear
	BNE $41			  ; D0 41 | Branch if not equal
	LSR $51			  ; 46 51 | Logical shift right (zero page)
	LDA ($80),Y		  ; B1 80 | Audio system operation
	BVS $46			  ; 70 46 | Branch if overflow set
	LDA #$C0			 ; A9 C0 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	LSR $54			  ; 46 54 | Logical shift right (zero page)
	CMP $4150,Y		  ; D9 50 41 | Compare accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	LSR $55			  ; 46 55 | Logical shift right (zero page)
	CMP $4090,Y		  ; D9 90 40 | Compare accumulator (absolute,Y)
	STY $46			  ; 84 46 | Store Y register to zero page
	EOR ($91,X)		  ; 41 91 | Exclusive OR with accumulator ((zero page,X))
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	LSR $58			  ; 46 58 | Logical shift right (zero page)
	LDA ($90),Y		  ; B1 90 | Audio system operation
	EOR ($8C,X)		  ; 41 8C | Exclusive OR with accumulator ((zero page,X))
	LSR $59			  ; 46 59 | Logical shift right (zero page)
	SBC ($B0),Y		  ; F1 B0 | Subtract with carry ((zero page),Y)
	WDM #$88			 ; 42 88 | Reserved instruction
	LSR $59			  ; 46 59 | Logical shift right (zero page)
	AND #$B1			 ; 29 B1 | Logical AND with accumulator (immediate)
	WDM #$94			 ; 42 94 | Reserved instruction
	LSR $5A			  ; 46 5A | Logical shift right (zero page)
	AND ($A1),Y		  ; 31 A1 | Logical AND with accumulator ((zero page),Y)
	WDM #$90			 ; 42 90 | Reserved instruction
	LSR $5B			  ; 46 5B | Logical shift right (zero page)
	ORA ($B1),Y		  ; 11 B1 | Logical OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	STZ $5C46			; 9C 46 5C | Store zero to absolute
	ORA ($21),Y		  ; 11 21 | PPU graphics register access
	EOR ($98,X)		  ; 41 98 | Exclusive OR with accumulator ((zero page,X))
	LSR $5D			  ; 46 5D | Logical shift right (zero page)
	STA ($50,X)		  ; 81 50 | Audio system operation
	EOR ($A4,X)		  ; 41 A4 | Exclusive OR with accumulator ((zero page,X))
	LSR $5E			  ; 46 5E | Logical shift right (zero page)
	SBC ($20),Y		  ; F1 20 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_183
; Address: $D0D69B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_183:
	WDM #$A0			 ; 42 A0 | Reserved instruction
	LSR $5E			  ; 46 5E | Logical shift right (zero page)
	CMP #$60			 ; C9 60 | Compare accumulator (immediate)
	LDY $5F46			; AC 46 5F | Load from absolute address into Y register
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LSR $24			  ; 46 24 | Logical shift right (zero page)
	CLV				  ; B8 | Clear overflow flag
	BVS $71			  ; 70 71 | Branch if overflow set
	BPL $80			  ; 10 80 | Branch if positive
	BIT $38			  ; 24 38 | Test bits in accumulator (zero page)
	STA ($92,X)		  ; 81 92 | Audio system operation
	STY $18			  ; 84 18 | Store Y register to zero page
	BRA $25			  ; 80 25 | Branch always
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_184
; Address: $D0D6BE
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_184:
	BRA $26			  ; 80 26 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BRA $27			  ; 80 27 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $B1			  ; 50 B1 | Branch if overflow clear
	STA ($38,X)		  ; 81 38 | Audio system operation
	BRA $27			  ; 80 27 | Branch always
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CMP ($83),Y		  ; D1 83 | Compare accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	BRA $27			  ; 80 27 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDA ($83),Y		  ; B1 83 | Audio system operation
	PHA				  ; 48 | Push accumulator to stack
	BRA $28			  ; 80 28 | Branch always
	BVS $E0			  ; 70 E0 | Game work RAM access
	BRA $82			  ; 80 82 | Branch always

;------------------------------------------------------------------------------
; Bank20_AudioFunction_185
; Address: $D0D6E0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_185:
	JSR $2980			; 20 80 29 | Jump to subroutine
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	BRA $2A			  ; 80 2A | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_186
; Address: $D0D6EB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_186:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $80			  ; 30 80 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	CLV				  ; B8 | Clear overflow flag
	BVS $71			  ; 70 71 | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	BRA $3A			  ; 80 3A | Branch always

;------------------------------------------------------------------------------
; Bank20_AudioFunction_187
; Address: $D0D6F8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_187:
	JSR $F241			; 20 41 F2 | Jump to subroutine
	BVS $80			  ; 70 80 | Branch if overflow set
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank20_AudioFunction_188
; Address: $D0D6FF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_188:
	SEC				  ; 38 | Set carry flag
	STA ($92,X)		  ; 81 92 | Audio system operation
	STY $78			  ; 84 78 | Store Y register to zero page
	BRA $3C			  ; 80 3C | Branch always
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_189
; Address: $D0D70A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_189:
	BVC $80			  ; 50 80 | Branch if overflow clear
	AND $A050,X		  ; 3D 50 A0 | Logical AND with accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_18A
; Address: $D0D711
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_18A:
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $3F			  ; 80 3F | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_18B
; Address: $D0D719
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_18B:
	BRA $40			  ; 80 40 | Branch always
	CLV				  ; B8 | Clear overflow flag
	BRA $91			  ; 80 91 | Branch always
	DEY				  ; 88 | Decrement Y register
	BRA $43			  ; 80 43 | Branch always
	BCC $30			  ; 90 30 | Branch if carry clear
	LDA ($85,X)		  ; A1 85 | Audio system operation
	BRA $80			  ; 80 80 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BCS $80			  ; B0 80 | Branch if carry set
	BMI $61			  ; 30 61 | Branch if negative
	STA $C0			  ; 85 C0 | Audio system operation
	BRA $44			  ; 80 44 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	BRA $44			  ; 80 44 | Branch always
	BMI $61			  ; 30 61 | Branch if negative
	STA $C8			  ; 85 C8 | Audio system operation
	BRA $46			  ; 80 46 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $80			  ; 90 80 | Branch if carry clear
	LSR $68			  ; 46 68 | Logical shift right (zero page)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	BCC $C0			  ; 90 C0 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $47			  ; 80 47 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	BCC $C0			  ; 90 C0 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	BRA $49			  ; 80 49 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank20_AudioFunction_18C
; Address: $D0D762
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_18C:
	BRA $10			  ; 80 10 | Branch always
	STX $D8			  ; 86 D8 | Store X register to zero page
	BRA $4C			  ; 80 4C | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	BNE $60			  ; D0 60 | Branch if not equal
	BNE $80			  ; D0 80 | Branch if not equal
	BVC $88			  ; 50 88 | Branch if overflow clear
	BPL $51			  ; 10 51 | Branch if positive
	BEQ $80			  ; F0 80 | Branch if equal
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	CPX #$11			 ; E0 11 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $52			  ; 80 52 | Branch always
	BRA $00			  ; 80 00 | Branch always
	AND ($83,X)		  ; 21 83 | Logical AND with accumulator ((zero page,X))
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_18D
; Address: $D0D788
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_18D:
	INX				  ; E8 | Increment X register
	BRA $54			  ; 80 54 | Branch always
	BVS $E0			  ; 70 E0 | Game work RAM access
	BEQ $87			  ; F0 87 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	STA ($55,X)		  ; 81 55 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	BNE $C0			  ; D0 C0 | Branch if not equal
	STA ($56,X)		  ; 81 56 | Audio system operation
	TYA				  ; 98 | Transfer Y register to accumulator
	BMI $31			  ; 30 31 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	STA ($58,X)		  ; 81 58 | Audio system operation
	CLI				  ; 58 | Clear interrupt disable flag
	BCS $80			  ; B0 80 | Branch if carry set
	BPL $81			  ; 10 81 | Branch if positive
	PHY				  ; 5A | Push Y register to stack
	PLP				  ; 28 | Pull processor status from stack
	EOR ($B2),Y		  ; 51 B2 | Exclusive OR with accumulator ((zero page),Y)
	STA ($30,X)		  ; 81 30 | Audio system operation
	STA ($5A,X)		  ; 81 5A | Audio system operation
	RTI				  ; 40 | Return from interrupt
	STA ($B2,X)		  ; 81 B2 | Audio system operation
	STA ($38,X)		  ; 81 38 | Audio system operation
	STA ($5B,X)		  ; 81 5B | Audio system operation
	CLI				  ; 58 | Clear interrupt disable flag
	BCS $20			  ; B0 20 | Branch if carry set

;------------------------------------------------------------------------------
; Bank20_AudioFunction_18E
; Address: $D0D7B9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_18E:
	JSR $5B81			; 20 81 5B | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	BPL $21			  ; 10 21 | PPU graphics register access
	PLP				  ; 28 | Pull processor status from stack
	STA ($66,X)		  ; 81 66 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_18F
; Address: $D0D7C3
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_18F:
	BMI $61			  ; 30 61 | Branch if negative
	STY $50			  ; 84 50 | Store Y register to zero page
	STA ($66,X)		  ; 81 66 | Audio system operation
	INX				  ; E8 | Increment X register
	BNE $31			  ; D0 31 | Branch if not equal
	CLI				  ; 58 | Clear interrupt disable flag
	STA ($67,X)		  ; 81 67 | Audio system operation
	CLI				  ; 58 | Clear interrupt disable flag
	BCS $20			  ; B0 20 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	STA ($69,X)		  ; 81 69 | Audio system operation
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	CPX #$81			 ; E0 81 | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	STA ($6A,X)		  ; 81 6A | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	BNE $50			  ; D0 50 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	STA ($6C,X)		  ; 81 6C | Audio system operation
	BVS $E0			  ; 70 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank20_AudioFunction_190
; Address: $D0D7E8
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_190:
	JSR $6082			; 20 82 60 | Jump to subroutine
	STA ($71,X)		  ; 81 71 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	BNE $30			  ; D0 30 | Branch if not equal
	BRA $81			  ; 80 81 | Branch always
	ADC ($20),Y		  ; 71 20 | Add with carry ((zero page),Y)
	EOR ($72,X)		  ; 41 72 | Exclusive OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	STA ($72,X)		  ; 81 72 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	BNE $A0			  ; D0 A0 | Branch if not equal
	BVS $81			  ; 70 81 | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag
	BCS $E0			  ; B0 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	STA ($75,X)		  ; 81 75 | Audio system operation
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	SBC ($81),Y		  ; F1 81 | Subtract with carry ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	STA ($76,X)		  ; 81 76 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $01			  ; 70 01 | Branch if overflow set
	STA $90			  ; 85 90 | Audio system operation
	STA ($7C,X)		  ; 81 7C | Audio system operation
	INX				  ; E8 | Increment X register
	BNE $11			  ; D0 11 | Branch if not equal
	STA $B0			  ; 85 B0 | Audio system operation
	STA ($7C,X)		  ; 81 7C | Audio system operation
	BCS $60			  ; B0 60 | Branch if carry set
	ORA ($82),Y		  ; 11 82 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_191
; Address: $D0D822
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_191:
	CLV				  ; B8 | Clear overflow flag
	STA ($7D,X)		  ; 81 7D | Audio system operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_192
; Address: $D0D826
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_192:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	LDY #$81			 ; A0 81 | Load immediate value into Y register
	ROR $B058,X		  ; 7E 58 B0 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_194
; Address: $D0D833
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_194:
	JSR $F241			; 20 41 F2 | Jump to subroutine
	STA ($C8,X)		  ; 81 C8 | Audio system operation
	STA ($81,X)		  ; 81 81 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	BNE $80			  ; D0 80 | Branch if not equal
	CPY #$81			 ; C0 81 | Compare Y register (immediate)
	STA $58			  ; 85 58 | Audio system operation
	BCS $10			  ; B0 10 | Branch if carry set
	BEQ $81			  ; F0 81 | Branch if equal
	STA $48			  ; 85 48 | Audio system operation
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	STA ($85,X)		  ; 81 85 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	STA ($92),Y		  ; 91 92 | Audio system operation
	STA $C8			  ; 85 C8 | Audio system operation
	LDY #$F1			 ; A0 F1 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	STX $78			  ; 86 78 | Store X register to zero page
	BEQ $60			  ; F0 60 | Branch if equal
	BNE $81			  ; D0 81 | Branch if not equal
	BIT #$70			 ; 89 70 | Test bits in accumulator (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	STA ($8B,X)		  ; 81 8B | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$81			 ; E0 81 | Compare X register (immediate)
	STA $50A0			; 8D A0 50 | Audio system operation
	CMP ($87,X)		  ; C1 87 | Compare accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	STA ($8D,X)		  ; 81 8D | Audio system operation
	LDY $48			  ; A4 48 | Load from zero page into Y register
	STA ($84,X)		  ; 81 84 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	STX $2894			; 8E 94 28 | Store X register to absolute address
	ADC ($84),Y		  ; 71 84 | Add with carry ((zero page),Y)
	BPL $82			  ; 10 82 | Branch if positive
	STA $409048		  ; 8F 48 90 40 | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	BCC $58			  ; 90 58 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_196
; Address: $D0D892
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_196:
	JSR $9182			; 20 82 91 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	BMI $11			  ; 30 11 | Branch if negative
	STA $38			  ; 85 38 | Audio system operation
	BRA $00			  ; 80 00 | Branch always
	STA ($82,X)		  ; 81 82 | Audio system operation
	BMI $82			  ; 30 82 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_197
; Address: $D0D8A4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_197:
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	EOR ($12),Y		  ; 51 12 | Exclusive OR with accumulator ((zero page),Y)
	STY $60			  ; 84 60 | Store Y register to zero page
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	CMP ($81),Y		  ; D1 81 | Compare accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_198
; Address: $D0D8B9
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_198:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BVS $E0			  ; 70 E0 | Game work RAM access
	BRA $82			  ; 80 82 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	STA ($87,X)		  ; 81 87 | Audio system operation
	BVC $82			  ; 50 82 | Branch if overflow clear
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $88			  ; C4 88 | Compare Y register (zero page)
	CMP ($84,X)		  ; C1 84 | Compare accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	STA $88C4,Y		  ; 99 C4 88 | Audio system operation
	ADC ($83),Y		  ; 71 83 | Add with carry ((zero page),Y)
	BVS $82			  ; 70 82 | Branch if overflow set
	STA				  ; 9F C0 90 D1 | Store accumulator to absolute long,X
	STY $A0			  ; 84 A0 | Store Y register to zero page
	STA				  ; 9F C0 90 D1 | Store accumulator to absolute long,X
	CPY #$82			 ; C0 82 | Compare Y register (immediate)
	STA				  ; 9F 78 F0 D0 | Store accumulator to absolute long,X
	TAY				  ; A8 | Transfer accumulator to Y register
	STA				  ; 9F 10 21 52 | Store accumulator to absolute long,X
	BCS $82			  ; B0 82 | Branch if carry set
	LDY #$88			 ; A0 88 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_199
; Address: $D0D8F8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_199:
	JSR $8681			; 20 81 86 | Jump to subroutine
	BRA $82			  ; 80 82 | Branch always
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_19A
; Address: $D0D901
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_19A:
	STA $90			  ; 85 90 | Audio system operation
	LDY #$E8			 ; A0 E8 | Load immediate value into Y register
	BNE $61			  ; D0 61 | Branch if not equal

;------------------------------------------------------------------------------
; Bank20_AudioFunction_19B
; Address: $D0D908
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_19B:
	STY $98			  ; 84 98 | Store Y register to zero page
	LDY #$44			 ; A0 44 | Load immediate value into Y register
	DEY				  ; 88 | Decrement Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_19C
; Address: $D0D910
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_19C:
	INY				  ; C8 | Increment Y register
	LDA ($78,X)		  ; A1 78 | Audio system operation
	ADC ($86,X)		  ; 61 86 | Add with carry ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	LDA ($34,X)		  ; A1 34 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	BCS $84			  ; B0 84 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	ADC ($87),Y		  ; 71 87 | Add with carry ((zero page),Y)
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	EOR ($32),Y		  ; 51 32 | Exclusive OR with accumulator ((zero page),Y)
	STY $F0			  ; 84 F0 | Store Y register to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	EOR ($82),Y		  ; 51 82 | Exclusive OR with accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	TAX				  ; AA | Transfer accumulator to X register
	BCC $30			  ; 90 30 | Branch if carry clear
	ADC ($86,X)		  ; 61 86 | Add with carry ((zero page,X))
	BNE $82			  ; D0 82 | Branch if not equal
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	AND ($A2),Y		  ; 31 A2 | Logical AND with accumulator ((zero page),Y)
	CLD				  ; D8 | Clear decimal mode flag
	PLB				  ; AB | Pull data bank register from stack
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($82,X)		  ; E1 82 | Subtract with carry ((zero page,X))
	CPX #$82			 ; E0 82 | Compare X register (immediate)
	DEY				  ; 88 | Decrement Y register
	BPL $B1			  ; 10 B1 | Branch if positive
	BPL $83			  ; 10 83 | Branch if positive
	INX				  ; E8 | Increment X register
	BNE $91			  ; D0 91 | Branch if not equal
	STY $18			  ; 84 18 | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	BNE $40			  ; D0 40 | Branch if not equal
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	CPY #$90			 ; C0 90 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_19D
; Address: $D0D969
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_19D:
	LDA ($83),Y		  ; B1 83 | Audio system operation
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	BPL $21			  ; 10 21 | PPU graphics register access
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	BCS $60			  ; B0 60 | Branch if carry set
	ORA ($82),Y		  ; 11 82 | Logical OR with accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	LDA $50A0,Y		  ; B9 A0 50 | Audio system operation
	CMP ($87,X)		  ; C1 87 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_19E
; Address: $D0D980
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_19E:
	JSR $B983			; 20 83 B9 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	AND ($C2),Y		  ; 31 C2 | Logical AND with accumulator ((zero page),Y)
	STY $28			  ; 84 28 | Store Y register to zero page
	TSX				  ; BA | Transfer stack pointer to X register
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BMI $83			  ; 30 83 | Branch if negative
	REP #$C0			 ; C2 C0 | Reset processor status bits
	BCC $D1			  ; 90 D1 | Branch if carry clear
	STY $70			  ; 84 70 | Store Y register to zero page
	REP #$E0			 ; C2 E0 | Game work RAM access
	BNE $71			  ; D0 71 | Branch if not equal
	BCC $83			  ; 90 83 | Branch if carry clear
	REP #$2C			 ; C2 2C | Reset processor status bits
	EOR $A1E2,Y		  ; 59 E2 A1 | Exclusive OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	REP #$C8			 ; C2 C8 | Reset processor status bits
	LDY #$61			 ; A0 61 | Load immediate value into Y register
	LDA ($80,X)		  ; A1 80 | Audio system operation
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	BVC $83			  ; 50 83 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	EOR ($F2),Y		  ; 51 F2 | Exclusive OR with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_19F
; Address: $D0D9BB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_19F:
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	AND ($82,X)		  ; 21 82 | Logical AND with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	EOR ($83,X)		  ; 41 83 | Exclusive OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP $78			  ; C5 78 | Compare accumulator (zero page)
	SBC ($83,X)		  ; E1 83 | Subtract with carry ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	CMP $7C			  ; C5 7C | Compare accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	BMI $83			  ; 30 83 | Branch if negative
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1A0
; Address: $D0D9D6
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1A0:
	CMP $F1F8,X		  ; DD F8 F1 | Compare accumulator (absolute,X)
	STY $A8			  ; 84 A8 | Store Y register to zero page
	DEC $E070,X		  ; DE 70 E0 | Game work RAM access
	BCC $04			  ; 90 04 | Branch if carry clear
	LDA ($83,X)		  ; A1 83 | Audio system operation
	ASL $51			  ; 06 51 | Arithmetic shift left (zero page)
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CLV				  ; B8 | Clear overflow flag
	ROL $F0F9,X		  ; 3E F9 F0 | Rotate left (absolute,X)
	LDA ($86),Y		  ; B1 86 | Audio system operation
	BCS $83			  ; B0 83 | Branch if carry set
	ROL $5129,X		  ; 3E 29 51 | Rotate left (absolute,X)
	STA $E8			  ; 85 E8 | Audio system operation
	ROL $60B1,X		  ; 3E B1 60 | Rotate left (absolute,X)
	STA ($85),Y		  ; 91 85 | Audio system operation
	BEQ $83			  ; F0 83 | Branch if equal
	ROL $8141,X		  ; 3E 41 81 | Rotate left (absolute,X)
	STY $3E			  ; 84 3E | Store Y register to zero page
	STA $B130,Y		  ; 99 30 B1 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STY $3E			  ; 84 3E | Store Y register to zero page
	SBC #$E0			 ; E9 E0 | Game work RAM access
	AND ($85),Y		  ; 31 85 | Logical AND with accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	ORA ($21),Y		  ; 11 21 | PPU graphics register access
	CPY #$83			 ; C0 83 | Compare Y register (immediate)
	STA $6130,Y		  ; 99 30 61 | Audio system operation
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	LDA ($84,X)		  ; A1 84 | Audio system operation
	CPX #$83			 ; E0 83 | Compare X register (immediate)
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	STA ($02,X)		  ; 81 02 | Audio system operation
	STA $D0			  ; 85 D0 | Audio system operation
	EOR ($99,X)		  ; 41 99 | Exclusive OR with accumulator ((zero page,X))
	BMI $01			  ; 30 01 | Branch if negative
	STA $D8			  ; 85 D8 | Audio system operation
	LDA ($50,X)		  ; A1 50 | Audio system operation
	STA ($83),Y		  ; 91 83 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	STY $53			  ; 84 53 | Store Y register to zero page
	ADC $9100,Y		  ; 79 00 91 | Add with carry (absolute,Y)
	BPL $84			  ; 10 84 | Branch if positive
	PHY				  ; 5A | Push Y register to stack
	LDA ($70),Y		  ; B1 70 | Audio system operation
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	AND #$84			 ; 29 84 | Logical AND with accumulator (immediate)
	JMP $E0B051		  ; 5C 51 B0 E0 | Game work RAM access
	ORA $21			  ; 05 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1A1
; Address: $D0DA53
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1A1:
	STY $62			  ; 84 62 | Store Y register to zero page
	AND $7058			; 2D 58 70 | Logical AND with accumulator (absolute)
	BRA $38			  ; 80 38 | Branch always
	STY $63			  ; 84 63 | Store Y register to zero page
	EOR #$90			 ; 49 90 | Exclusive OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BMI $84			  ; 30 84 | Branch if negative
	ROR				  ; 6A | Rotate right (accumulator)
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BRA $6C			  ; 80 6C | Branch always
	STY $D0D0			; 8C D0 D0 | Store Y register to absolute address
	STA ($00,X)		  ; 81 00 | Audio system operation
	BRA $F1			  ; 80 F1 | Branch always
	BRA $C1			  ; 80 C1 | Branch always
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	LDA ($E0),Y		  ; B1 E0 | Game work RAM access
	STY $1F			  ; 84 1F | Store Y register to zero page
	SBC ($81,X)		  ; E1 81 | Subtract with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ADC ($A2,X)		  ; 61 A2 | Add with carry ((zero page,X))
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	ASL $B4			  ; 06 B4 | Arithmetic shift left (zero page)
	WDM #$41			 ; 42 41 | Reserved instruction
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	ASL $42B4			; 0E B4 42 | Hardware register operation
	EOR ($23,X)		  ; 41 23 | Exclusive OR with accumulator ((zero page,X))
	STA $B816			; 8D 16 B8 | Audio system operation
	WDM #$A1			 ; 42 A1 | Reserved instruction
	SEP #$05			 ; E2 05 | Set processor status bits
	STA $C017			; 8D 17 C0 | Audio system operation
	WDM #$81			 ; 42 81 | Reserved instruction
	SBC ($85,X)		  ; E1 85 | Subtract with carry ((zero page,X))
	BIT #$17			 ; 89 17 | Test bits in accumulator (immediate)
	CPY $42			  ; C4 42 | Hardware register operation
	LDA ($60,X)		  ; A1 60 | Audio system operation
	CPY $C142			; CC 42 C1 | Compare Y register (absolute)
	CPX #$05			 ; E0 05 | Compare X register (immediate)
	STY $17			  ; 84 17 | Store Y register to zero page
	CPY $A142			; CC 42 A1 | Compare Y register (absolute)
	CPX #$81			 ; E0 81 | Compare X register (immediate)
	BNE $42			  ; D0 42 | Hardware register operation
	LDA ($A0,X)		  ; A1 A0 | Audio system operation
	STA ($86,X)		  ; 81 86 | Audio system operation
	ASL $D4			  ; 06 D4 | Arithmetic shift left (zero page)
	WDM #$C1			 ; 42 C1 | Reserved instruction
	LDA ($01,X)		  ; A1 01 | Audio system operation
	BIT #$06			 ; 89 06 | Test bits in accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1A2
; Address: $D0DACA
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1A2:
	WDM #$A1			 ; 42 A1 | Reserved instruction
	LDA ($84,X)		  ; A1 84 | Audio system operation
	STX $12			  ; 86 12 | Store X register to zero page
	BVS $40			  ; 70 40 | Branch if overflow set
	LDA ($21,X)		  ; A1 21 | PPU graphics register access
	STY $86			  ; 84 86 | Store Y register to zero page
	BPL $E0			  ; 10 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	AND ($E1,X)		  ; 21 E1 | Logical AND with accumulator ((zero page,X))
	STY $3396			; 8C 96 33 | Store Y register to absolute address
	CPX #$42			 ; E0 42 | Hardware register operation
	AND ($81,X)		  ; 21 81 | Logical AND with accumulator ((zero page,X))
	CPX #$42			 ; E0 42 | Hardware register operation
	AND ($81),Y		  ; 31 81 | Logical AND with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$42			 ; E0 42 | Hardware register operation
	LDA ($A5,X)		  ; A1 A5 | Audio system operation
	CPX #$42			 ; E0 42 | Hardware register operation
	SBC ($86),Y		  ; F1 86 | Subtract with carry ((zero page),Y)
	INY				  ; C8 | Increment Y register
	BIT $E4			  ; 24 E4 | Test bits in accumulator (zero page)
	WDM #$F1			 ; 42 F1 | Reserved instruction
	INC $C1			  ; E6 C1 | Increment (zero page)
	ORA ($E4),Y		  ; 11 E4 | Logical OR with accumulator ((zero page),Y)
	WDM #$21			 ; 42 21 | PPU graphics register access
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CPX $42			  ; E4 42 | Hardware register operation
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	STA ($83,X)		  ; 81 83 | Audio system operation
	AND ($E8),Y		  ; 31 E8 | Logical AND with accumulator ((zero page),Y)
	WDM #$E1			 ; 42 E1 | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1A3
; Address: $D0DB13
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1A3:
	STY $319C			; 8C 9C 31 | Store Y register to absolute address
	INX				  ; E8 | Increment X register
	WDM #$21			 ; 42 21 | PPU graphics register access
	STY $319C			; 8C 9C 31 | Store Y register to absolute address
	INX				  ; E8 | Increment X register
	WDM #$C1			 ; 42 C1 | Reserved instruction
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	STA $EC22			; 8D 22 EC | Audio system operation
	WDM #$C1			 ; 42 C1 | Reserved instruction
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1A4
; Address: $D0DB2A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1A4:
	JSL $D142EC		  ; 22 EC 42 D1 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	ORA $EC09			; 0D 09 EC | Logical OR with accumulator (absolute)
	WDM #$41			 ; 42 41 | Reserved instruction
	ORA $EC22			; 0D 22 EC | Logical OR with accumulator (absolute)
	WDM #$C1			 ; 42 C1 | Reserved instruction
	LDY #$0A			 ; A0 0A | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1A5
; Address: $D0DB3E
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1A5:
	STA $42EC2A		  ; 8F 2A EC 42 | Hardware register operation
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	CPX $D142			; EC 42 D1 | Compare X register (absolute)
	BRA $02			  ; 80 02 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $C142			; EC 42 C1 | Compare X register (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	CPX $E142			; EC 42 E1 | Compare X register (absolute)
	CPX #$8B			 ; E0 8B | Compare X register (immediate)
	CPX $E142			; EC 42 E1 | Compare X register (absolute)
	BRA $82			  ; 80 82 | Branch always
	CPX $F142			; EC 42 F1 | Compare X register (absolute)
	BRA $82			  ; 80 82 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $6142			; EC 42 61 | Compare X register (absolute)
	LDA $82			  ; A5 82 | Audio system operation
	CPX $0142			; EC 42 01 | Compare X register (absolute)
	AND ($8C,X)		  ; 21 8C | Logical AND with accumulator ((zero page,X))
	BMI $EC			  ; 30 EC | Branch if negative
	WDM #$01			 ; 42 01 | Reserved instruction
	STA ($02,X)		  ; 81 02 | Audio system operation
	BMI $EC			  ; 30 EC | Branch if negative
	WDM #$11			 ; 42 11 | Reserved instruction
	STA ($82,X)		  ; 81 82 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $E142			; EC 42 E1 | Compare X register (absolute)
	LDX $82			  ; A6 82 | Load from zero page into X register
	BMI $EC			  ; 30 EC | Branch if negative
	WDM #$01			 ; 42 01 | Reserved instruction
	AND ($8C,X)		  ; 21 8C | Logical AND with accumulator ((zero page,X))
	BMI $EC			  ; 30 EC | Branch if negative
	WDM #$01			 ; 42 01 | Reserved instruction
	STA ($02,X)		  ; 81 02 | Audio system operation
	BMI $EC			  ; 30 EC | Branch if negative
	WDM #$11			 ; 42 11 | Reserved instruction
	STA ($82,X)		  ; 81 82 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $E142			; EC 42 E1 | Compare X register (absolute)
	LDX $82			  ; A6 82 | Load from zero page into X register
	BMI $EC			  ; 30 EC | Branch if negative
	WDM #$81			 ; 42 81 | Reserved instruction
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BEQ $42			  ; F0 42 | Hardware register operation
	STA ($00,X)		  ; 81 00 | Audio system operation
	BEQ $42			  ; F0 42 | Hardware register operation
	STA ($00),Y		  ; 91 00 | Audio system operation
	BPL $F0			  ; 10 F0 | Branch if positive
	WDM #$C1			 ; 42 C1 | Reserved instruction
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1A6
; Address: $D0DBC5
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1A6:
	BEQ $42			  ; F0 42 | Hardware register operation
	AND ($83,X)		  ; 21 83 | Logical AND with accumulator ((zero page,X))
	ORA $F432			; 0D 32 F4 | Logical OR with accumulator (absolute)
	WDM #$11			 ; 42 11 | Reserved instruction
	STA ($44,X)		  ; 81 44 | Audio system operation
	STY $21			  ; 84 21 | PPU graphics register access
	PEA #$C142		   ; F4 42 C1 | Push effective address to stack
	ADC ($02,X)		  ; 61 02 | Add with carry ((zero page,X))
	ORA #$F4			 ; 09 F4 | Logical OR with accumulator (immediate)
	WDM #$91			 ; 42 91 | Reserved instruction
	CPY $47			  ; C4 47 | Compare Y register (zero page)
	AND ($F4,X)		  ; 21 F4 | Logical AND with accumulator ((zero page,X))
	WDM #$21			 ; 42 21 | PPU graphics register access
	EOR ($82,X)		  ; 41 82 | Exclusive OR with accumulator ((zero page,X))
	STY $30			  ; 84 30 | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	WDM #$31			 ; 42 31 | Reserved instruction
	EOR ($02,X)		  ; 41 02 | Exclusive OR with accumulator ((zero page,X))
	ORA #$F8			 ; 09 F8 | Logical OR with accumulator (immediate)
	WDM #$41			 ; 42 41 | Reserved instruction
	ADC $02			  ; 65 02 | Add with carry (zero page)
	SED				  ; F8 | Set decimal mode flag
	WDM #$01			 ; 42 01 | Reserved instruction
	LDA ($12,X)		  ; A1 12 | Audio system operation
	LSR				  ; 4A | Logical shift right (accumulator)
	WDM #$01			 ; 42 01 | Reserved instruction
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	WDM #$01			 ; 42 01 | Reserved instruction
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	WDM #$01			 ; 42 01 | Reserved instruction
	STY $000C			; 8C 0C 00 | Store Y register to absolute address
	AND ($61,X)		  ; 21 61 | Logical AND with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	STZ $042D,X		  ; 9E 2D 04 | Store zero to absolute,X
	AND ($41,X)		  ; 21 41 | Logical AND with accumulator ((zero page,X))
	STA ($04,X)		  ; 81 04 | Audio system operation
	AND $4404			; 2D 04 44 | Logical AND with accumulator (absolute)
	AND ($41),Y		  ; 31 41 | Logical AND with accumulator ((zero page),Y)
	EOR ($1E,X)		  ; 41 1E | Exclusive OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	LDA ($47,X)		  ; A1 47 | Audio system operation
	STA ($1E,X)		  ; 81 1E | Audio system operation
	AND $4404			; 2D 04 44 | Logical AND with accumulator (absolute)
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	ASL $3895			; 0E 95 38 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1A7
; Address: $D0DC3C
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1A7:
	PHP				  ; 08 | Push processor status to stack
	ORA ($81),Y		  ; 11 81 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	EOR ($A5,X)		  ; 41 A5 | Exclusive OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	SBC ($81,X)		  ; E1 81 | Subtract with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP ($1100)		  ; 6C 00 11 | Jump to address (absolute indirect)
	LDA ($49,X)		  ; A1 49 | Audio system operation
	STY $28			  ; 84 28 | Store Y register to zero page
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	CMP ($21,X)		  ; C1 21 | PPU graphics register access
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	SBC ($81,X)		  ; E1 81 | Subtract with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($21,X)		  ; C1 21 | PPU graphics register access
	DEY				  ; 88 | Decrement Y register
	BMI $04			  ; 30 04 | Branch if negative
	ORA ($A1,X)		  ; 01 A1 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA ($25,X)		  ; 01 25 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	STA ($24,X)		  ; 81 24 | Audio system operation
	ORA #$84			 ; 09 84 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	AND ($82,X)		  ; 21 82 | Logical AND with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $40			  ; 80 40 | Branch always
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	STA $3591			; 8D 91 35 | Audio system operation
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	STA ($C5,X)		  ; 81 C5 | Audio system operation
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	STA ($60,X)		  ; 81 60 | Audio system operation
	BCC $94			  ; 90 94 | Branch if carry clear
	EOR ($10,X)		  ; 41 10 | Exclusive OR with accumulator ((zero page,X))
	STA ($40,X)		  ; 81 40 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1A8
; Address: $D0DCB2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1A8:
	EOR ($10,X)		  ; 41 10 | Exclusive OR with accumulator ((zero page,X))
	STA ($40),Y		  ; 91 40 | Audio system operation
	STY $14			  ; 84 14 | Store Y register to zero page
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	AND ($65,X)		  ; 21 65 | Logical AND with accumulator ((zero page,X))
	STY $14			  ; 84 14 | Store Y register to zero page
	EOR ($10,X)		  ; 41 10 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1A9
; Address: $D0DCC3
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1A9:
	JSL $848461		  ; 22 61 84 84 | Jump to subroutine long
	BCC $40			  ; 90 40 | Branch if carry clear
	LDA ($04,X)		  ; A1 04 | Audio system operation
	STA $17			  ; 85 17 | Audio system operation
	BCC $40			  ; 90 40 | Branch if carry clear
	AND ($85,X)		  ; 21 85 | Logical AND with accumulator ((zero page,X))
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	BCC $40			  ; 90 40 | Branch if carry clear
	SBC ($A0,X)		  ; E1 A0 | Subtract with carry ((zero page,X))
	STA $143E94		  ; 8F 94 3E 14 | Audio system operation
	SBC ($40,X)		  ; E1 40 | Subtract with carry ((zero page,X))
	ROL $4314,X		  ; 3E 14 43 | Rotate left (absolute,X)
	SBC ($40),Y		  ; F1 40 | Subtract with carry ((zero page),Y)
	ORA $4314			; 0D 14 43 | Logical OR with accumulator (absolute)
	STA ($65,X)		  ; 81 65 | Audio system operation
	ORA $4314			; 0D 14 43 | Logical OR with accumulator (absolute)
	CMP ($A0,X)		  ; C1 A0 | Compare accumulator ((zero page,X))
	ORA ($96),Y		  ; 11 96 | Logical OR with accumulator ((zero page),Y)
	LSR $18			  ; 46 18 | Logical shift right (zero page)
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	LSR $18			  ; 46 18 | Logical shift right (zero page)
	CMP ($C0),Y		  ; D1 C0 | Compare accumulator ((zero page),Y)
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	STA ($E5,X)		  ; 81 E5 | Audio system operation
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	LSR $18			  ; 46 18 | Logical shift right (zero page)
	SBC ($81,X)		  ; E1 81 | Subtract with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STZ $3100			; 9C 00 31 | Store zero to absolute
	LDA ($C7,X)		  ; A1 C7 | Audio system operation
	STY $1E			  ; 84 1E | Store Y register to zero page
	BCS $42			  ; B0 42 | Hardware register operation
	ADC ($20,X)		  ; 61 20 | Add with carry ((zero page,X))
	STX $3892			; 8E 92 38 | Store X register to absolute address
	ADC ($C0,X)		  ; 61 C0 | Add with carry ((zero page,X))
	STA ($81,X)		  ; 81 81 | Audio system operation
	SEC				  ; 38 | Set carry flag
	ADC ($C0,X)		  ; 61 C0 | Add with carry ((zero page,X))
	STA ($12,X)		  ; 81 12 | Audio system operation
	LDA ($C4,X)		  ; A1 C4 | Audio system operation
	STA ($92,X)		  ; 81 92 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1AA
; Address: $D0DD37
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1AA:
	SEC				  ; 38 | Set carry flag
	ADC ($82,X)		  ; 61 82 | Add with carry ((zero page,X))
	ROL $4320			; 2E 20 43 | Rotate left (absolute)
	SBC ($81,X)		  ; E1 81 | Subtract with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BCS $00			  ; B0 00 | Branch if carry set
	ORA ($E1,X)		  ; 01 E1 | Logical OR with accumulator ((zero page,X))
	STA $3795			; 8D 95 37 | Audio system operation
	BIT $43			  ; 24 43 | Test bits in accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BIT $43			  ; 24 43 | Test bits in accumulator (zero page)
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	BIT $43			  ; 24 43 | Test bits in accumulator (zero page)
	ADC ($25,X)		  ; 61 25 | Add with carry ((zero page,X))
	BIT $43			  ; 24 43 | Test bits in accumulator (zero page)
	AND ($A1,X)		  ; 21 A1 | Logical AND with accumulator ((zero page,X))
	ASL $3A95			; 0E 95 3A | Arithmetic shift left (absolute)
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	STA $04			  ; 85 04 | Audio system operation
	DEC				  ; 3A | Decrement accumulator
	EOR ($65,X)		  ; 41 65 | Exclusive OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	SBC ($81,X)		  ; E1 81 | Subtract with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY $3100,X		  ; BC 00 31 | Load from absolute,X into Y register
	LDA ($C7,X)		  ; A1 C7 | Audio system operation
	STY $1E			  ; 84 1E | Store Y register to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	WDM #$11			 ; 42 11 | Reserved instruction
	BPL $0F			  ; 10 0F | Branch if positive
	BNE $40			  ; D0 40 | Branch if not equal
	STA ($04,X)		  ; 81 04 | Audio system operation
	BCC $12			  ; 90 12 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	STA ($80),Y		  ; 91 80 | Audio system operation
	LSR				  ; 4A | Logical shift right (accumulator)
	BIT $4328			; 2C 28 43 | Test bits in accumulator (absolute)
	SBC ($81,X)		  ; E1 81 | Subtract with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $B100			; CC 00 B1 | Compare Y register (absolute)
	CPY $C7			  ; C4 C7 | Compare Y register (zero page)
	CPY $40			  ; C4 40 | Compare Y register (zero page)
	ORA ($43,X)		  ; 01 43 | Logical OR with accumulator ((zero page,X))
	STX $390C			; 8E 0C 39 | Store X register to absolute address
	BIT $C143			; 2C 43 C1 | Test bits in accumulator (absolute)
	STY $320D			; 8C 0D 32 | Store Y register to absolute address
	BMI $43			  ; 30 43 | Branch if negative
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1AB
; Address: $D0DDBB
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1AB:
	ASL $2C50			; 0E 50 2C | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	SBC ($40),Y		  ; F1 40 | Subtract with carry ((zero page),Y)
	REP #$03			 ; C2 03 | Reset processor status bits
	BVC $2C			  ; 50 2C | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVC $2C			  ; 50 2C | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	ORA #$2C			 ; 09 2C | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA $82			  ; 05 82 | Logical OR with accumulator (zero page)
	WDM #$61			 ; 42 61 | Reserved instruction
	EOR ($0A),Y		  ; 51 0A | Exclusive OR with accumulator ((zero page),Y)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($4C),Y		  ; 11 4C | Logical OR with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	ORA ($82),Y		  ; 11 82 | Logical OR with accumulator ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	AND ($82,X)		  ; 21 82 | Logical AND with accumulator ((zero page,X))
	CPY $1B			  ; C4 1B | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	SBC ($A6),Y		  ; F1 A6 | Subtract with carry ((zero page),Y)
	CPY $9B			  ; C4 9B | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	STA ($00),Y		  ; 91 00 | Audio system operation
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1AC
; Address: $D0DE09
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1AC:
	JSL $B14344		  ; 22 44 43 B1 | Jump to subroutine long
	REP #$CD			 ; C2 CD | Reset processor status bits
	TXA				  ; 8A | Transfer X register to accumulator
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	EOR ($87),Y		  ; 51 87 | Exclusive OR with accumulator ((zero page),Y)
	LSR $9D			  ; 46 9D | Logical shift right (zero page)
	PEA #$2240		   ; F4 40 22 | Push effective address to stack
	STA ($83,X)		  ; 81 83 | Audio system operation
	ASL $40FC			; 0E FC 40 | Arithmetic shift left (absolute)
	SEP #$81			 ; E2 81 | Set processor status bits
	ASL $4100			; 0E 00 41 | Arithmetic shift left (absolute)
	ORA ($81),Y		  ; 11 81 | Logical OR with accumulator ((zero page),Y)
	EOR $84			  ; 45 84 | Exclusive OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	BPL $44			  ; 10 44 | Branch if positive
	LDA ($65,X)		  ; A1 65 | Audio system operation
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1AD
; Address: $D0DE32
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1AD:
	STA $102D,X		  ; 9D 2D 10 | Audio system operation
	ADC ($07,X)		  ; 61 07 | Add with carry ((zero page,X))
	STX $1D			  ; 86 1D | Store X register to zero page
	AND $4410			; 2D 10 44 | Logical AND with accumulator (absolute)
	STA ($42,X)		  ; 81 42 | Hardware register operation
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	CMP ($26,X)		  ; C1 26 | Compare accumulator ((zero page,X))
	EOR ($61,X)		  ; 41 61 | Exclusive OR with accumulator ((zero page,X))
	CMP ($89,X)		  ; C1 89 | Compare accumulator ((zero page,X))
	STA $28			  ; 85 28 | Audio system operation
	BPL $44			  ; 10 44 | Branch if positive
	ADC ($81,X)		  ; 61 81 | Add with carry ((zero page,X))
	STA ($85,X)		  ; 81 85 | Audio system operation
	ORA ($44),Y		  ; 11 44 | Logical OR with accumulator ((zero page),Y)
	ADC ($81),Y		  ; 71 81 | Add with carry ((zero page),Y)
	STA ($16,X)		  ; 81 16 | Audio system operation
	ASL $11			  ; 06 11 | Arithmetic shift left (zero page)
	LDA ($A5,X)		  ; A1 A5 | Audio system operation
	STA ($96,X)		  ; 81 96 | Audio system operation
	AND #$11			 ; 29 11 | Logical AND with accumulator (immediate)
	CMP ($E2,X)		  ; C1 E2 | Compare accumulator ((zero page,X))
	ORA $378D			; 0D 8D 37 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
	STA ($0F),Y		  ; 91 0F | Audio system operation
	LSR $14			  ; 46 14 | Logical shift right (zero page)
	SBC ($81,X)		  ; E1 81 | Subtract with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STY $E143			; 8C 43 E1 | Store Y register to absolute address
	LDY #$07			 ; A0 07 | Load immediate value into Y register
	BCC $1E			  ; 90 1E | Branch if carry clear
	BCC $43			  ; 90 43 | Branch if carry clear
	SBC ($40,X)		  ; E1 40 | Subtract with carry ((zero page,X))
	ASL $4390,X		  ; 1E 90 43 | Arithmetic shift left (absolute,X)
	SBC ($40),Y		  ; F1 40 | Subtract with carry ((zero page),Y)
	BPL $09			  ; 10 09 | Branch if positive
	BCC $43			  ; 90 43 | Branch if carry clear
	ORA ($64,X)		  ; 01 64 | Logical OR with accumulator ((zero page,X))
	BPL $1E			  ; 10 1E | Branch if positive
	BCC $43			  ; 90 43 | Branch if carry clear
	CMP ($42,X)		  ; C1 42 | Hardware register operation
	BIT #$0D			 ; 89 0D | Test bits in accumulator (immediate)
	AND $94			  ; 25 94 | Logical AND with accumulator (zero page)
	STA ($41,X)		  ; 81 41 | Audio system operation
	ORA $86			  ; 05 86 | Logical OR with accumulator (zero page)
	CMP ($21,X)		  ; C1 21 | PPU graphics register access
	BIT #$0C			 ; 89 0C | Test bits in accumulator (immediate)
	EOR ($84,X)		  ; 41 84 | Exclusive OR with accumulator ((zero page,X))
	ORA $91			  ; 05 91 | Logical OR with accumulator (zero page)
	WDM #$43			 ; 42 43 | Reserved instruction

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1AE
; Address: $D0DEB7
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1AE:
	STA $243D			; 8D 3D 24 | Audio system operation
	EOR ($32,X)		  ; 41 32 | Exclusive OR with accumulator ((zero page,X))
	STA $2442			; 8D 42 24 | Audio system operation
	EOR ($52,X)		  ; 41 52 | Exclusive OR with accumulator ((zero page,X))
	BNE $8D			  ; D0 8D | Branch if not equal
	WDM #$24			 ; 42 24 | Reserved instruction
	EOR ($72,X)		  ; 41 72 | Exclusive OR with accumulator ((zero page,X))
	STY $14			  ; 84 14 | Store Y register to zero page
	BIT $41			  ; 24 41 | Test bits in accumulator (zero page)
	BCC $48			  ; 90 48 | Branch if carry clear
	BIT $41			  ; 24 41 | Test bits in accumulator (zero page)
	BCC $4A			  ; 90 4A | Branch if carry clear
	BIT $41			  ; 24 41 | Test bits in accumulator (zero page)
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	EOR ($D2,X)		  ; 41 D2 | Exclusive OR with accumulator ((zero page,X))
	AND ($4D,X)		  ; 21 4D | Logical AND with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	EOR ($E2,X)		  ; 41 E2 | Exclusive OR with accumulator ((zero page,X))
	EOR ($8D,X)		  ; 41 8D | Exclusive OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	EOR ($D2,X)		  ; 41 D2 | Exclusive OR with accumulator ((zero page,X))
	CMP ($8A,X)		  ; C1 8A | Compare accumulator ((zero page,X))
	BIT $4128			; 2C 28 41 | Test bits in accumulator (absolute)
	STA $2C1D			; 8D 1D 2C | Audio system operation
	EOR ($32,X)		  ; 41 32 | Exclusive OR with accumulator ((zero page,X))
	STA $2C1F			; 8D 1F 2C | Audio system operation
	EOR ($12,X)		  ; 41 12 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STA $2C20			; 8D 20 2C | Audio system operation
	EOR ($12,X)		  ; 41 12 | Exclusive OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	STY $2C22			; 8C 22 2C | Store Y register to absolute address
	EOR ($02,X)		  ; 41 02 | Exclusive OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	STY $2C23			; 8C 23 2C | Store Y register to absolute address
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	STA ($C1,X)		  ; 81 C1 | Audio system operation
	STX $13			  ; 86 13 | Store X register to zero page
	STZ $C143			; 9C 43 C1 | Store zero to absolute
	ORA $9F			  ; 05 9F | Logical OR with accumulator (zero page)
	LDY #$43			 ; A0 43 | Load immediate value into Y register
	SBC ($81,X)		  ; E1 81 | Subtract with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	ORA $85			  ; 05 85 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1AF
; Address: $D0DF3E
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1AF:
	LDY $43			  ; A4 43 | Load from zero page into Y register
	REP #$02			 ; C2 02 | Reset processor status bits
	BPL $8B			  ; 10 8B | Branch if positive
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	EOR ($02,X)		  ; 41 02 | Exclusive OR with accumulator ((zero page,X))
	BPL $8C			  ; 10 8C | Branch if positive
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	EOR ($42,X)		  ; 41 42 | Hardware register operation
	BPL $8D			  ; 10 8D | Branch if positive
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	EOR ($C2,X)		  ; 41 C2 | Exclusive OR with accumulator ((zero page,X))
	BPL $8B			  ; 10 8B | Branch if positive
	WDM #$48			 ; 42 48 | Reserved instruction
	EOR ($02,X)		  ; 41 02 | Exclusive OR with accumulator ((zero page,X))
	BPL $8C			  ; 10 8C | Branch if positive
	WDM #$48			 ; 42 48 | Reserved instruction
	EOR ($42,X)		  ; 41 42 | Hardware register operation
	BPL $8D			  ; 10 8D | Branch if positive
	WDM #$48			 ; 42 48 | Reserved instruction
	EOR ($A2,X)		  ; 41 A2 | Exclusive OR with accumulator ((zero page,X))
	REP #$87			 ; C2 87 | Reset processor status bits
	TXA				  ; 8A | Transfer X register to accumulator
	PHA				  ; 48 | Push accumulator to stack
	EOR ($E2,X)		  ; 41 E2 | Exclusive OR with accumulator ((zero page,X))
	EOR ($CA,X)		  ; 41 CA | Exclusive OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	AND #$4C			 ; 29 4C | Logical AND with accumulator (immediate)
	EOR ($C2,X)		  ; 41 C2 | Exclusive OR with accumulator ((zero page,X))
	STA ($4A,X)		  ; 81 4A | Audio system operation
	ROL				  ; 2A | Rotate left (accumulator)
	JMP $A241			; 4C 41 A2 | Jump to address
	CMP ($CA,X)		  ; C1 CA | Compare accumulator ((zero page,X))
	STX $2B			  ; 86 2B | Store X register to zero page
	JMP $2241			; 4C 41 22 | Jump to address
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	STA $2C			  ; 85 2C | Audio system operation
	JMP $0241			; 4C 41 02 | Jump to address
	EOR ($8B,X)		  ; 41 8B | Exclusive OR with accumulator ((zero page,X))
	STY $2D			  ; 84 2D | Store Y register to zero page
	JMP $0241			; 4C 41 02 | Jump to address
	STA ($0B,X)		  ; 81 0B | Audio system operation
	STY $2F			  ; 84 2F | Store Y register to zero page
	JMP $D241			; 4C 41 D2 | Jump to address
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	PLP				  ; 28 | Pull processor status from stack
	BVC $41			  ; 50 41 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1B0
; Address: $D0DFA2
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1B0:
	SEP #$45			 ; E2 45 | Set processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$50			 ; 29 50 | Logical AND with accumulator (immediate)
	EOR ($02,X)		  ; 41 02 | Exclusive OR with accumulator ((zero page,X))
	STX $8A			  ; 86 8A | Store X register to zero page
	TYA				  ; 98 | Transfer Y register to accumulator
	BVC $41			  ; 50 41 | Branch if overflow clear
	SEP #$05			 ; E2 05 | Set processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	BIT $4150			; 2C 50 41 | Test bits in accumulator (absolute)
	REP #$45			 ; C2 45 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	AND $4150			; 2D 50 41 | Logical AND with accumulator (absolute)
	LDX #$85			 ; A2 85 | Load immediate value into X register
	BVC $41			  ; 50 41 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1B1
; Address: $D0DFC5
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1B1:
	JSL $988E86		  ; 22 86 8E 98 | Jump to subroutine long
	EOR ($32,X)		  ; 41 32 | Exclusive OR with accumulator ((zero page,X))
	DEC $0E			  ; C6 0E | Decrement (zero page)
	STA $543B,Y		  ; 99 3B 54 | Audio system operation
	EOR ($42,X)		  ; 41 42 | Hardware register operation
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	STA $543C,Y		  ; 99 3C 54 | Audio system operation
	EOR ($81,X)		  ; 41 81 | Exclusive OR with accumulator ((zero page,X))
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	LDX $0F			  ; A6 0F | Load from zero page into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($C6,X)		  ; 41 C6 | Exclusive OR with accumulator ((zero page,X))
	ORA #$99			 ; 09 99 | Logical OR with accumulator (immediate)
	LDY $0143			; AC 43 01 | Load from absolute address into Y register
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $B0			  ; 10 B0 | Branch if positive
	STX $88			  ; 86 88 | Store X register to zero page
	STA $A022,Y		  ; 99 22 A0 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	LDA ($C3,X)		  ; A1 C3 | Audio system operation
	STX $B40B			; 8E 0B B4 | Store X register to absolute address
	EOR ($C7,X)		  ; 41 C7 | Exclusive OR with accumulator ((zero page,X))
	STA $B833,X		  ; 9D 33 B8 | Audio system operation
	STA $07			  ; 85 07 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1B2
; Address: $D0E008
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1B2:
	JSR $4168			; 20 68 41 | Jump to subroutine
	LDX #$42			 ; A2 42 | Hardware register operation
	STX $8A			  ; 86 8A | Store X register to zero page
	ORA $416C,Y		  ; 19 6C 41 | Logical OR with accumulator (absolute,Y)
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	LDA ($03,X)		  ; A1 03 | Audio system operation
	STX $1C0C			; 8E 0C 1C | Store X register to absolute address
	LDA ($41,X)		  ; A1 41 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1B3
; Address: $D0E022
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1B3:
	BIT #$86			 ; 89 86 | Test bits in accumulator (immediate)
	AND $20			  ; 25 20 | Logical AND with accumulator (zero page)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	STY $4812			; 8C 12 48 | Store Y register to absolute address
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	JMP $4143			; 4C 43 41 | Jump to address
	STA $500D			; 8D 0D 50 | Audio system operation
	LDA ($41,X)		  ; A1 41 | Audio system operation
	ORA #$54			 ; 09 54 | Logical OR with accumulator (immediate)
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	ADC ($A2,X)		  ; 61 A2 | Add with carry ((zero page,X))
	BIT #$8C			 ; 89 8C | Test bits in accumulator (immediate)
	ROL $5C			  ; 26 5C | Rotate left (zero page)
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1B4
; Address: $D0E058
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1B4:
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	STZ $43			  ; 64 43 | Store zero to zero page
	LDA ($C2,X)		  ; A1 C2 | Audio system operation
	DEY				  ; 88 | Decrement Y register
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($E1,X)		  ; 01 E1 | Logical OR with accumulator ((zero page,X))
	ASL $8A			  ; 06 8A | Arithmetic shift left (zero page)
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	ORA ($81),Y		  ; 11 81 | Logical OR with accumulator ((zero page),Y)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL $24			  ; 06 24 | Arithmetic shift left (zero page)
	STA ($A2,X)		  ; 81 A2 | Audio system operation
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	EOR ($04),Y		  ; 51 04 | Exclusive OR with accumulator ((zero page),Y)
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	ORA $4428,Y		  ; 19 28 44 | Logical OR with accumulator (absolute,Y)
	SBC ($41,X)		  ; E1 41 | Subtract with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND ($2C,X)		  ; 21 2C | Logical AND with accumulator ((zero page,X))
	CMP ($C3,X)		  ; C1 C3 | Compare accumulator ((zero page,X))
	ORA $8F			  ; 05 8F | Logical OR with accumulator (zero page)
	BMI $44			  ; 30 44 | Branch if negative
	AND ($A2,X)		  ; 21 A2 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1B5
; Address: $D0E09A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1B5:
	BIT #$0E			 ; 89 0E | Test bits in accumulator (immediate)
	JMP ($7143)		  ; 6C 43 71 | Jump to address (absolute indirect)
	EOR $C5			  ; 45 C5 | Exclusive OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	AND ($41),Y		  ; 31 41 | Logical AND with accumulator ((zero page),Y)
	CMP $84			  ; C5 84 | Compare accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BVS $43			  ; 70 43 | Branch if overflow set
	AND ($C2,X)		  ; 21 C2 | Logical AND with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	LDA ($20,X)		  ; A1 20 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $7C20			; 8D 20 7C | Audio system operation
	LDA ($C0,X)		  ; A1 C0 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1B6
; Address: $D0E0BE
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1B6:
	JSR $437C			; 20 7C 43 | Jump to subroutine
	LDA ($C0),Y		  ; B1 C0 | Audio system operation
	ORA $7C0B			; 0D 0B 7C | Logical OR with accumulator (absolute)
	EOR ($E3,X)		  ; 41 E3 | Exclusive OR with accumulator ((zero page,X))
	ORA $7C20			; 0D 20 7C | Logical OR with accumulator (absolute)
	ADC ($20,X)		  ; 61 20 | Add with carry ((zero page,X))
	ORA #$8D			 ; 09 8D | Logical OR with accumulator (immediate)
	BIT $80			  ; 24 80 | Test bits in accumulator (zero page)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	STY $01			  ; 84 01 | Store Y register to zero page
	BIT $80			  ; 24 80 | Test bits in accumulator (zero page)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ORA $8010			; 0D 10 80 | Logical OR with accumulator (absolute)
	EOR ($23,X)		  ; 41 23 | Exclusive OR with accumulator ((zero page,X))
	ORA $8024			; 0D 24 80 | Logical OR with accumulator (absolute)
	ADC ($03,X)		  ; 61 03 | Add with carry ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	ORA $842C			; 0D 2C 84 | Logical OR with accumulator (absolute)
	EOR ($C3,X)		  ; 41 C3 | Exclusive OR with accumulator ((zero page,X))
	ORA $370D			; 0D 0D 37 | Logical OR with accumulator (absolute)
	BIT #$43			 ; 89 43 | Test bits in accumulator (immediate)
	CMP ($02,X)		  ; C1 02 | Compare accumulator ((zero page,X))
	STA $BC3C0F		  ; 8F 0F 3C BC | Audio system operation
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ASL $BC0A			; 0E 0A BC | Arithmetic shift left (absolute)
	ORA $A5			  ; 05 A5 | Logical OR with accumulator (zero page)
	ORA #$14			 ; 09 14 | Logical OR with accumulator (immediate)
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	LDA $E4			  ; A5 E4 | Audio system operation
	CPY $3613			; CC 13 36 | Compare Y register (absolute)
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	EOR $A4			  ; 45 A4 | Exclusive OR with accumulator (zero page)
	EOR $3912			; 4D 12 39 | Exclusive OR with accumulator (absolute)
	CPY #$43			 ; C0 43 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1B7
; Address: $D0E11E
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1B7:
	DEC $3990			; CE 90 39 | Decrement (absolute)
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	LDA ($8D,X)		  ; A1 8D | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	AND $43C0,Y		  ; 39 C0 43 | Logical AND with accumulator (absolute,Y)
	LDA $21			  ; A5 21 | PPU graphics register access
	ORA $3607			; 0D 07 36 | Logical OR with accumulator (absolute)
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	LDX #$C2			 ; A2 C2 | Load immediate value into X register
	STA $43C00A		  ; 8F 0A C0 43 | Audio system operation
	ORA $E5			  ; 05 E5 | Logical OR with accumulator (zero page)
	ASL $94			  ; 06 94 | Arithmetic shift left (zero page)
	AND ($C0),Y		  ; 31 C0 | Logical AND with accumulator ((zero page),Y)
	ADC $81			  ; 65 81 | Add with carry (zero page)
	ORA $32			  ; 05 32 | Logical OR with accumulator (zero page)
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	ADC ($C2,X)		  ; 61 C2 | Add with carry ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	ORA #$C0			 ; 09 C0 | Logical OR with accumulator (immediate)
	REP #$82			 ; C2 82 | Reset processor status bits
	REP #$8B			 ; C2 8B | Reset processor status bits
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	STY $C00D			; 8C 0D C0 | Store Y register to absolute address
	EOR $83			  ; 45 83 | Exclusive OR with accumulator (zero page)
	ORA $C01F			; 0D 1F C0 | Logical OR with accumulator (absolute)
	ORA $E3			  ; 05 E3 | Logical OR with accumulator (zero page)
	AND ($C0,X)		  ; 21 C0 | Logical AND with accumulator ((zero page,X))
	CMP $62			  ; C5 62 | Compare accumulator (zero page)
	INY				  ; C8 | Increment Y register
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	SBC ($C8,X)		  ; E1 C8 | Subtract with carry ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	ADC ($88,X)		  ; 61 88 | Add with carry ((zero page,X))
	ASL $23			  ; 06 23 | Arithmetic shift left (zero page)
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	SBC ($87,X)		  ; E1 87 | Subtract with carry ((zero page,X))
	ORA $21			  ; 05 21 | PPU graphics register access
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	AND $81			  ; 25 81 | Logical AND with accumulator (zero page)
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	STA $0D			  ; 85 0D | Audio system operation
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	STA ($82,X)		  ; 81 82 | Audio system operation
	STX $0B			  ; 86 0B | Store X register to zero page
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	AND ($C8),Y		  ; 31 C8 | Logical AND with accumulator ((zero page),Y)
	DEC $A0			  ; C6 A0 | Decrement (zero page)
	AND ($C4,X)		  ; 21 C4 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1B8
; Address: $D0E1A1
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1B8:
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	CPY $43			  ; C4 43 | Compare Y register (zero page)
	SBC ($A0),Y		  ; F1 A0 | Subtract with carry ((zero page),Y)
	CPY $43			  ; C4 43 | Compare Y register (zero page)
	STY $E80D			; 8C 0D E8 | Store Y register to absolute address
	EOR ($03,X)		  ; 41 03 | Exclusive OR with accumulator ((zero page,X))
	STY $E41E			; 8C 1E E4 | Store Y register to absolute address
	EOR ($23,X)		  ; 41 23 | Exclusive OR with accumulator ((zero page,X))
	STA $87			  ; 85 87 | Audio system operation
	ASL $41F0,X		  ; 1E F0 41 | Arithmetic shift left (absolute,X)
	STY $EC31			; 8C 31 EC | Store Y register to absolute address
	EOR ($62,X)		  ; 41 62 | Exclusive OR with accumulator ((zero page,X))
	SBC ($04,X)		  ; E1 04 | Subtract with carry ((zero page,X))
	STX $15			  ; 86 15 | Store X register to zero page
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($E5,X)		  ; 41 E5 | Exclusive OR with accumulator ((zero page,X))
	CPX #$89			 ; E0 89 | Compare X register (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	INY				  ; C8 | Increment Y register
	LDY #$8A			 ; A0 8A | Load immediate value into Y register
	ORA $2D			  ; 05 2D | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ADC ($CB,X)		  ; 61 CB | Add with carry ((zero page,X))
	STA ($2D),Y		  ; 91 2D | Audio system operation
	INY				  ; C8 | Increment Y register
	ASL $8E			  ; 06 8E | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	EOR ($62,X)		  ; 41 62 | Exclusive OR with accumulator ((zero page,X))
	ASL $8E			  ; 06 8E | Arithmetic shift left (zero page)
	EOR ($42,X)		  ; 41 42 | Hardware register operation
	STA $DC1D			; 8D 1D DC | Audio system operation
	EOR ($22,X)		  ; 41 22 | Exclusive OR with accumulator ((zero page,X))
	STA $DC1E			; 8D 1E DC | Audio system operation
	EOR ($02,X)		  ; 41 02 | Exclusive OR with accumulator ((zero page,X))
	STY $DC1F			; 8C 1F DC | Store Y register to absolute address
	EOR ($22,X)		  ; 41 22 | Exclusive OR with accumulator ((zero page,X))
	LDX #$82			 ; A2 82 | Load immediate value into X register
	CPX #$41			 ; E0 41 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1B9
; Address: $D0E211
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1B9:
	JSL $8F8342		  ; 22 42 83 8F | Jump to subroutine long
	ORA $41E0			; 0D E0 41 | Logical OR with accumulator (absolute)
	SEP #$C3			 ; E2 C3 | Set processor status bits
	STX $E00F			; 8E 0F E0 | Game work RAM access
	EOR ($25,X)		  ; 41 25 | Exclusive OR with accumulator ((zero page,X))
	STA $86			  ; 85 86 | Audio system operation
	ROL $F8			  ; 26 F8 | Rotate left (zero page)
	EOR ($E5,X)		  ; 41 E5 | Exclusive OR with accumulator ((zero page,X))
	LDY $49			  ; A4 49 | Load from zero page into Y register
	PLP				  ; 28 | Pull processor status from stack
	EOR ($15,X)		  ; 41 15 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1BA
; Address: $D0E22F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1BA:
	LSR				  ; 4A | Logical shift right (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	EOR ($D5,X)		  ; 41 D5 | Exclusive OR with accumulator ((zero page,X))
	LDX #$09			 ; A2 09 | Load immediate value into X register
	PLP				  ; 28 | Pull processor status from stack
	EOR ($95,X)		  ; 41 95 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1BB
; Address: $D0E23C
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1BB:
	JSL $260B09		  ; 22 09 0B 26 | Jump to subroutine long
	WDM #$85			 ; 42 85 | Reserved instruction
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	WDM #$92			 ; 42 92 | Reserved instruction
	ASL $8B			  ; 06 8B | Arithmetic shift left (zero page)
	WDM #$12			 ; 42 12 | Reserved instruction
	EOR $93			  ; 45 93 | Exclusive OR with accumulator (zero page)
	WDM #$E2			 ; 42 E2 | Reserved instruction
	LSR $94			  ; 46 94 | Logical shift right (zero page)
	ORA $4204,Y		  ; 19 04 42 | Hardware register operation
	SEP #$05			 ; E2 05 | Set processor status bits
	STY $0419			; 8C 19 04 | Store Y register to absolute address
	WDM #$02			 ; 42 02 | Reserved instruction
	ASL $90			  ; 06 90 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	WDM #$E2			 ; 42 E2 | Reserved instruction
	STX $8F			  ; 86 8F | Store X register to zero page
	ORA $4208,Y		  ; 19 08 42 | Hardware register operation
	REP #$83			 ; C2 83 | Reset processor status bits
	STX $8F			  ; 86 8F | Store X register to zero page
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	WDM #$A2			 ; 42 A2 | Reserved instruction
	ASL $8F			  ; 06 8F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	WDM #$A2			 ; 42 A2 | Reserved instruction
	STX $081D			; 8E 1D 08 | Store X register to absolute address
	WDM #$82			 ; 42 82 | Reserved instruction
	STX $081E			; 8E 1E 08 | Store X register to absolute address
	WDM #$82			 ; 42 82 | Reserved instruction
	STX $081F			; 8E 1F 08 | Store X register to absolute address
	WDM #$62			 ; 42 62 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	STX $0820			; 8E 20 08 | Store X register to absolute address
	WDM #$85			 ; 42 85 | Reserved instruction
	REP #$47			 ; C2 47 | Reset processor status bits
	WDM #$85			 ; 42 85 | Reserved instruction
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1BC
; Address: $D0E2A8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1BC:
	JSR $420C			; 20 0C 42 | Hardware register operation
	PHP				  ; 08 | Push processor status to stack
	PEA #$4541		   ; F4 41 45 | Push effective address to stack
	REP #$C7			 ; C2 C7 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1BD
; Address: $D0E2B5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1BD:
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	PEA #$0241		   ; F4 41 02 | Push effective address to stack
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1BE
; Address: $D0E2BD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1BE:
	JSR $41F4			; 20 F4 41 | Jump to subroutine
	EOR $02			  ; 45 02 | Exclusive OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	PEA #$B241		   ; F4 41 B2 | Push effective address to stack
	LDA $87			  ; A5 87 | Audio system operation
	SED				  ; F8 | Set decimal mode flag
	EOR ($65,X)		  ; 41 65 | Exclusive OR with accumulator ((zero page,X))
	CMP $87			  ; C5 87 | Compare accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	EOR ($B2,X)		  ; 41 B2 | Exclusive OR with accumulator ((zero page,X))
	ORA $88			  ; 05 88 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1BF
; Address: $D0E2D9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1BF:
	JSR $41F8			; 20 F8 41 | Jump to subroutine
	ADC $05			  ; 65 05 | Add with carry (zero page)
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1C0
; Address: $D0E2E0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1C0:
	JSR $41F8			; 20 F8 41 | Jump to subroutine
	AND ($E3,X)		  ; 21 E3 | Logical AND with accumulator ((zero page,X))
	ORA ($8D),Y		  ; 11 8D | Logical OR with accumulator ((zero page),Y)
	CPY $A143			; CC 43 A1 | Compare Y register (absolute)
	SBC ($8D,X)		  ; E1 8D | Subtract with carry ((zero page,X))
	STX $39			  ; 86 39 | Store X register to zero page
	CPY $C143			; CC 43 C1 | Compare Y register (absolute)
	CPX $0D			  ; E4 0D | Compare X register (zero page)
	AND $43CC,Y		  ; 39 CC 43 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1C1
; Address: $D0E2F8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1C1:
	JSL $0943A2		  ; 22 A2 43 09 | Jump to subroutine long
	BPL $14			  ; 10 14 | Branch if positive
	WDM #$E2			 ; 42 E2 | Reserved instruction
	AND ($44,X)		  ; 21 44 | Logical AND with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	WDM #$D2			 ; 42 D2 | Reserved instruction
	ASL $90			  ; 06 90 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1C2
; Address: $D0E30B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1C2:
	JSR $A242			; 20 42 A2 | Jump to subroutine
	STA $42201E		  ; 8F 1E 20 42 | Hardware register operation
	LDX #$A3			 ; A2 A3 | Load immediate value into X register
	BPL $18			  ; 10 18 | Branch if positive
	WDM #$D2			 ; 42 D2 | Reserved instruction
	BCC $12			  ; 90 12 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	WDM #$B2			 ; 42 B2 | Reserved instruction
	SEP #$C4			 ; E2 C4 | Set processor status bits
	STY $2413			; 8C 13 24 | Store Y register to absolute address
	WDM #$A2			 ; 42 A2 | Reserved instruction
	STA $0A			  ; 85 0A | Audio system operation
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	WDM #$42			 ; 42 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1C3
; Address: $D0E332
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1C3:
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BIT $B242			; 2C 42 B2 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1C4
; Address: $D0E338
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1C4:
	JSL $188CC6		  ; 22 C6 8C 18 | Jump to subroutine long
	BMI $42			  ; 30 42 | Hardware register operation
	WDM #$62			 ; 42 62 | Reserved instruction
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	WDM #$92			 ; 42 92 | Reserved instruction
	STY $0E			  ; 84 0E | Store Y register to zero page
	CLC				  ; 18 | Clear carry flag
	WDM #$42			 ; 42 42 | Hardware register operation
	REP #$46			 ; C2 46 | Reset processor status bits
	BIT #$1B			 ; 89 1B | Test bits in accumulator (immediate)
	WDM #$92			 ; 42 92 | Reserved instruction
	STX $8E			  ; 86 8E | Store X register to zero page

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1C5
; Address: $D0E358
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1C5:
	JSR $6242			; 20 42 62 | Jump to subroutine
	SEP #$03			 ; E2 03 | Set processor status bits
	ASL $2411			; 0E 11 24 | Arithmetic shift left (absolute)
	WDM #$02			 ; 42 02 | Reserved instruction
	LDX #$C4			 ; A2 C4 | Load immediate value into X register
	DEY				  ; 88 | Decrement Y register
	INC				  ; 1A | Increment accumulator
	PLP				  ; 28 | Pull processor status from stack
	WDM #$B2			 ; 42 B2 | Reserved instruction
	STY $8F			  ; 84 8F | Store Y register to zero page
	INC				  ; 1A | Increment accumulator
	BIT $6242			; 2C 42 62 | Test bits in accumulator (absolute)
	STX $301D			; 8E 1D 30 | Store X register to absolute address
	WDM #$E2			 ; 42 E2 | Reserved instruction
	ADC ($C4,X)		  ; 61 C4 | Add with carry ((zero page,X))
	WDM #$62			 ; 42 62 | Reserved instruction
	SEP #$C3			 ; E2 C3 | Set processor status bits
	ORA #$11			 ; 09 11 | Logical OR with accumulator (immediate)
	WDM #$12			 ; 42 12 | Reserved instruction
	CPY $09			  ; C4 09 | Compare Y register (zero page)
	WDM #$B2			 ; 42 B2 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	WDM #$F2			 ; 42 F2 | Reserved instruction
	STY $10			  ; 84 10 | Store Y register to zero page
	CLC				  ; 18 | Clear carry flag
	WDM #$E2			 ; 42 E2 | Reserved instruction
	EOR ($C6,X)		  ; 41 C6 | Exclusive OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	WDM #$12			 ; 42 12 | Reserved instruction
	DEC $89			  ; C6 89 | Decrement (zero page)
	INC				  ; 1A | Increment accumulator
	WDM #$22			 ; 42 22 | Reserved instruction
	REP #$C6			 ; C2 C6 | Reset processor status bits
	BIT #$1C			 ; 89 1C | Test bits in accumulator (immediate)
	WDM #$22			 ; 42 22 | Reserved instruction

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1C6
; Address: $D0E3AF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1C6:
	WDM #$07			 ; 42 07 | Reserved instruction
	BIT #$1D			 ; 89 1D | Test bits in accumulator (immediate)
	WDM #$F2			 ; 42 F2 | Reserved instruction
	LSR $90			  ; 46 90 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1C8
; Address: $D0E3C1
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1C8:
	JSR $9242			; 20 42 92 | Jump to subroutine
	SEP #$43			 ; E2 43 | Set processor status bits
	BIT $42			  ; 24 42 | Hardware register operation
	ASL $2411			; 0E 11 24 | Arithmetic shift left (absolute)
	WDM #$32			 ; 42 32 | Reserved instruction
	STX $2414			; 8E 14 24 | Store X register to absolute address
	WDM #$E2			 ; 42 E2 | Reserved instruction
	CMP ($C4,X)		  ; C1 C4 | Compare accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	WDM #$12			 ; 42 12 | Reserved instruction
	CMP $09			  ; C5 09 | Compare accumulator (zero page)
	ORA $4228,Y		  ; 19 28 42 | Hardware register operation
	CMP $09			  ; C5 09 | Compare accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	WDM #$F2			 ; 42 F2 | Reserved instruction
	BPL $19			  ; 10 19 | Branch if positive
	BIT $B242			; 2C 42 B2 | Test bits in accumulator (absolute)
	EOR $0F			  ; 45 0F | Exclusive OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BIT $9242			; 2C 42 92 | Test bits in accumulator (absolute)
	STY $301C			; 8C 1C 30 | Store Y register to absolute address
	WDM #$A2			 ; 42 A2 | Reserved instruction
	WDM #$87			 ; 42 87 | Reserved instruction
	PHB				  ; 8B | Push data bank register to stack
	ORA $4230,X		  ; 1D 30 42 | Hardware register operation
	REP #$82			 ; C2 82 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	BMI $42			  ; 30 42 | Hardware register operation
	LSR $8E			  ; 46 8E | Logical shift right (zero page)
	BMI $42			  ; 30 42 | Hardware register operation
	STX $301C			; 8E 1C 30 | Store X register to absolute address
	WDM #$42			 ; 42 42 | Hardware register operation
	STX $301D			; 8E 1D 30 | Store X register to absolute address
	WDM #$92			 ; 42 92 | Reserved instruction
	REP #$44			 ; C2 44 | Reset processor status bits
	WDM #$32			 ; 42 32 | Reserved instruction
	EOR $0E			  ; 45 0E | Exclusive OR with accumulator (zero page)
	WDM #$92			 ; 42 92 | Reserved instruction
	WDM #$45			 ; 42 45 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	WDM #$92			 ; 42 92 | Reserved instruction
	WDM #$46			 ; 42 46 | Reserved instruction
	WDM #$32			 ; 42 32 | Reserved instruction

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1C9
; Address: $D0E443
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1C9:
	EOR $0E			  ; 45 0E | Exclusive OR with accumulator (zero page)
	ORA $4234,Y		  ; 19 34 42 | Hardware register operation
	ORA ($26),Y		  ; 11 26 | Logical OR with accumulator ((zero page),Y)
	EOR #$98			 ; 49 98 | Exclusive OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BNE $43			  ; D0 43 | Branch if not equal
	WDM #$92			 ; 42 92 | Reserved instruction
	ORA #$D4			 ; 09 D4 | Logical OR with accumulator (immediate)
	LDX #$84			 ; A2 84 | Load immediate value into X register
	STY $D40C			; 8C 0C D4 | Store Y register to absolute address
	WDM #$83			 ; 42 83 | Reserved instruction
	TXA				  ; 8A | Transfer X register to accumulator
	STY $89			  ; 84 89 | Store Y register to zero page
	CMP ($84,X)		  ; C1 84 | Compare accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	SBC $01			  ; E5 01 | Subtract with carry (zero page)
	STX $07			  ; 86 07 | Store X register to zero page
	SBC ($8A,X)		  ; E1 8A | Subtract with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BMI $D4			  ; 30 D4 | Branch if negative

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1CA
; Address: $D0E488
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1CA:
	JSL $33098C		  ; 22 8C 09 33 | Jump to subroutine long
	SEP #$8C			 ; E2 8C | Set processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$8D			 ; A2 8D | Load immediate value into X register
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1CB
; Address: $D0E49D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1CB:
	JSL $3891CE		  ; 22 CE 91 38 | Jump to subroutine long
	STA $A4			  ; 85 A4 | Audio system operation
	CMP $3813			; CD 13 38 | Compare accumulator (absolute)
	ORA $E5			  ; 05 E5 | Logical OR with accumulator (zero page)
	CPY $3614			; CC 14 36 | Compare Y register (absolute)
	EOR $25			  ; 45 25 | Exclusive OR with accumulator (zero page)
	CPY $3315			; CC 15 33 | Compare Y register (absolute)
	STA $E5			  ; 85 E5 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BMI $D4			  ; 30 D4 | Branch if negative

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1CC
; Address: $D0E4C0
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1CC:
	JSL $0C8BC3		  ; 22 C3 8B 0C | Jump to subroutine long
	WDM #$83			 ; 42 83 | Reserved instruction
	TXA				  ; 8A | Transfer X register to accumulator
	STY $89			  ; 84 89 | Store Y register to zero page
	CMP ($84,X)		  ; C1 84 | Compare accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	SBC $01			  ; E5 01 | Subtract with carry (zero page)
	STX $87			  ; 86 87 | Store X register to zero page
	ROL				  ; 2A | Rotate left (accumulator)
	LDA ($8A,X)		  ; A1 8A | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	AND $43D4			; 2D D4 43 | Logical AND with accumulator (absolute)
	PHB				  ; 8B | Push data bank register to stack
	ORA #$30			 ; 09 30 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1CE
; Address: $D0E4F8
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1CE:
	SEP #$8C			 ; E2 8C | Set processor status bits
	CMP $3692			; CD 92 36 | Compare accumulator (absolute)
	CMP $E4			  ; C5 E4 | Compare accumulator (zero page)
	CPY $3614			; CC 14 36 | Compare Y register (absolute)
	EOR $25			  ; 45 25 | Exclusive OR with accumulator (zero page)
	CPY $3315			; CC 15 33 | Compare Y register (absolute)
	STA $65			  ; 85 65 | Audio system operation
	BMI $D4			  ; 30 D4 | Branch if negative
	CMP $25			  ; C5 25 | Compare accumulator (zero page)
	DEX				  ; CA | Decrement X register
	AND $43D4			; 2D D4 43 | Logical AND with accumulator (absolute)
	ORA $46			  ; 05 46 | Logical OR with accumulator (zero page)
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	REP #$25			 ; C2 25 | Reset processor status bits
	CMP $97			  ; C5 97 | Compare accumulator (zero page)
	CMP ($8C,X)		  ; C1 8C | Compare accumulator ((zero page,X))
	ORA $D4			  ; 05 D4 | Logical OR with accumulator (zero page)
	STA ($81,X)		  ; 81 81 | Audio system operation
	DEY				  ; 88 | Decrement Y register
	ASL $D4			  ; 06 D4 | Arithmetic shift left (zero page)
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	ORA ($82,X)		  ; 01 82 | Logical OR with accumulator ((zero page,X))
	STX $0A			  ; 86 0A | Store X register to zero page
	CMP ($82,X)		  ; C1 82 | Compare accumulator ((zero page,X))
	STA $0D			  ; 85 0D | Audio system operation
	STA ($03,X)		  ; 81 03 | Audio system operation
	STA $10			  ; 85 10 | Audio system operation
	AND $41			  ; 25 41 | Logical AND with accumulator (zero page)
	STY $04			  ; 84 04 | Store Y register to zero page
	AND ($D4,X)		  ; 21 D4 | Logical AND with accumulator ((zero page,X))
	ADC ($08,X)		  ; 61 08 | Add with carry ((zero page,X))
	ORA $23			  ; 05 23 | Logical OR with accumulator (zero page)
	SBC ($88,X)		  ; E1 88 | Subtract with carry ((zero page,X))
	ORA $25			  ; 05 25 | Logical OR with accumulator (zero page)
	ADC ($89,X)		  ; 61 89 | Add with carry ((zero page,X))
	ASL $28			  ; 06 28 | Arithmetic shift left (zero page)
	AND ($8A,X)		  ; 21 8A | Logical AND with accumulator ((zero page,X))
	AND #$D4			 ; 29 D4 | Logical AND with accumulator (immediate)
	ADC ($8A,X)		  ; 61 8A | Add with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	LDX #$CA			 ; A2 CA | Load immediate value into X register
	STY $D42A			; 8C 2A D4 | Store Y register to absolute address
	EOR $63			  ; 45 63 | Exclusive OR with accumulator (zero page)
	DEX				  ; CA | Decrement X register
	ORA $D42A			; 0D 2A D4 | Logical OR with accumulator (absolute)
	STA $23			  ; 85 23 | Audio system operation
	DEX				  ; CA | Decrement X register
	ASL $D429			; 0E 29 D4 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1CF
; Address: $D0E598
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1CF:
	CMP $63			  ; C5 63 | Compare accumulator (zero page)
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA $A4			  ; 05 A4 | Logical OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BPL $25			  ; 10 25 | Branch if positive
	AND $E4			  ; 25 E4 | Logical AND with accumulator (zero page)
	BPL $22			  ; 10 22 | Branch if positive
	EOR $44			  ; 45 44 | Exclusive OR with accumulator (zero page)
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1D0
; Address: $D0E5B4
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1D0:
	JSL $90C384		  ; 22 84 C3 90 | Jump to subroutine long
	BPL $D4			  ; 10 D4 | Branch if positive
	CPY $42			  ; C4 42 | Hardware register operation
	BCC $0D			  ; 90 0D | Branch if carry clear
	REP #$43			 ; C2 43 | Reset processor status bits
	REP #$8F			 ; C2 8F | Reset processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($8E,X)		  ; C1 8E | Compare accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	WDM #$83			 ; 42 83 | Reserved instruction
	CMP ($8D,X)		  ; C1 8D | Compare accumulator ((zero page,X))
	ASL $D4			  ; 06 D4 | Arithmetic shift left (zero page)
	CMP $A0			  ; C5 A0 | Compare accumulator (zero page)
	BPL $3C			  ; 10 3C | Branch if positive
	WDM #$A5			 ; 42 A5 | Reserved instruction
	LDX #$83			 ; A2 83 | Load immediate value into X register
	TXA				  ; 8A | Transfer X register to accumulator
	BPL $40			  ; 10 40 | Branch if positive
	WDM #$82			 ; 42 82 | Reserved instruction
	LDA ($C1,X)		  ; A1 C1 | Audio system operation
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	WDM #$01			 ; 42 01 | Reserved instruction
	STZ $91			  ; 64 91 | Store zero to zero page
	BCC $45			  ; 90 45 | Branch if carry clear
	CPY $8E			  ; C4 8E | Compare Y register (zero page)
	BPL $48			  ; 10 48 | Branch if positive
	WDM #$82			 ; 42 82 | Reserved instruction
	CPY $92			  ; C4 92 | Compare Y register (zero page)
	BPL $48			  ; 10 48 | Branch if positive
	WDM #$85			 ; 42 85 | Reserved instruction
	STX $4C3C			; 8E 3C 4C | Store X register to absolute address
	WDM #$85			 ; 42 85 | Reserved instruction
	JMP $2242			; 4C 42 22 | Jump to address

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1D1
; Address: $D0E610
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1D1:
	JSL $258889		  ; 22 89 88 25 | Jump to subroutine long
	BVC $42			  ; 50 42 | Hardware register operation
	ASL $49			  ; 06 49 | Arithmetic shift left (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	AND $54			  ; 25 54 | Logical AND with accumulator (zero page)
	WDM #$C2			 ; 42 C2 | Reserved instruction
	CPY $90			  ; C4 90 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1D2
; Address: $D0E621
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1D2:
	BPL $48			  ; 10 48 | Branch if positive
	WDM #$62			 ; 42 62 | Reserved instruction
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1D3
; Address: $D0E628
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1D3:
	JSR $4258			; 20 58 42 | Hardware register operation
	LDX #$A3			 ; A2 A3 | Load immediate value into X register
	INY				  ; C8 | Increment Y register
	CLI				  ; 58 | Clear interrupt disable flag
	WDM #$82			 ; 42 82 | Reserved instruction
	PHA				  ; 48 | Push accumulator to stack
	STX $5C27			; 8E 27 5C | Store X register to absolute address
	WDM #$42			 ; 42 42 | Hardware register operation
	PHA				  ; 48 | Push accumulator to stack
	ORA $5C29			; 0D 29 5C | Logical OR with accumulator (absolute)
	WDM #$52			 ; 42 52 | Reserved instruction
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$60			 ; 29 60 | Logical AND with accumulator (immediate)
	WDM #$A2			 ; 42 A2 | Reserved instruction
	CMP #$94			 ; C9 94 | Compare accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1D4
; Address: $D0E64D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1D4:
	WDM #$62			 ; 42 62 | Reserved instruction
	DEX				  ; CA | Decrement X register
	ROL				  ; 2A | Rotate left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1D5
; Address: $D0E654
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1D5:
	WDM #$E5			 ; 42 E5 | Reserved instruction
	LSR $3B91			; 4E 91 3B | Logical shift right (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1D6
; Address: $D0E65B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1D6:
	WDM #$51			 ; 42 51 | Reserved instruction
	ADC ($D4,X)		  ; 61 D4 | Add with carry ((zero page,X))
	LDX #$51			 ; A2 51 | Load immediate value into X register
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($01),Y		  ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
	ORA $51			  ; 05 51 | Logical OR with accumulator (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	LDA ($08),Y		  ; B1 08 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1D7
; Address: $D0E66D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1D7:
	JSL $43D851		  ; 22 51 D8 43 | Jump to subroutine long
	LDA ($43,X)		  ; A1 43 | Audio system operation
	STA $0E			  ; 85 0E | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1D9
; Address: $D0E67F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1D9:
	JSL $8483C1		  ; 22 C1 83 84 | Jump to subroutine long
	CPX #$43			 ; E0 43 | Compare X register (immediate)
	WDM #$C2			 ; 42 C2 | Reserved instruction
	BIT #$0F			 ; 89 0F | Test bits in accumulator (immediate)
	CPX $43			  ; E4 43 | Compare X register (zero page)
	ADC ($45,X)		  ; 61 45 | Add with carry ((zero page,X))
	STY $3195			; 8C 95 31 | Store Y register to absolute address
	CPX $0143			; EC 43 01 | Compare X register (absolute)
	SBC ($88,X)		  ; E1 88 | Subtract with carry ((zero page,X))
	STX $F023			; 8E 23 F0 | Store X register to absolute address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1DA
; Address: $D0E6A0
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1DA:
	BEQ $43			  ; F0 43 | Branch if equal
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	ASL $F00C			; 0E 0C F0 | Arithmetic shift left (absolute)
	LDA ($23,X)		  ; A1 23 | Audio system operation
	ASL $F023			; 0E 23 F0 | Arithmetic shift left (absolute)
	AND ($22,X)		  ; 21 22 | Logical AND with accumulator ((zero page,X))
	BIT #$1C			 ; 89 1C | Test bits in accumulator (immediate)
	BRA $42			  ; 80 42 | Hardware register operation
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	BIT #$86			 ; 89 86 | Test bits in accumulator (immediate)
	AND $7C			  ; 25 7C | Logical AND with accumulator (zero page)
	WDM #$82			 ; 42 82 | Reserved instruction
	TXA				  ; 8A | Transfer X register to accumulator
	STY $42			  ; 84 42 | Hardware register operation
	AND ($E1,X)		  ; 21 E1 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BCC $23			  ; 90 23 | Branch if carry clear
	PEA #$2143		   ; F4 43 21 | PPU graphics register access
	EOR ($83,X)		  ; 41 83 | Exclusive OR with accumulator ((zero page,X))
	PEA #$3143		   ; F4 43 31 | Push effective address to stack
	EOR ($03,X)		  ; 41 03 | Exclusive OR with accumulator ((zero page,X))
	BPL $0D			  ; 10 0D | Branch if positive
	PEA #$0143		   ; F4 43 01 | Push effective address to stack
	STZ $03			  ; 64 03 | Store zero to zero page
	BPL $23			  ; 10 23 | Branch if positive
	PEA #$8243		   ; F4 43 82 | Push effective address to stack
	REP #$06			 ; C2 06 | Reset processor status bits
	TXA				  ; 8A | Transfer X register to accumulator
	WDM #$71			 ; 42 71 | Reserved instruction
	REP #$C5			 ; C2 C5 | Reset processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	REP #$03			 ; C2 03 | Reset processor status bits
	ORA $8F			  ; 05 8F | Logical OR with accumulator (zero page)
	STZ $6242			; 9C 42 62 | Store zero to absolute
	STA $91			  ; 85 91 | Audio system operation
	STZ $4142			; 9C 42 41 | Store zero to absolute
	STA $378D			; 8D 8D 37 | Audio system operation
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1DB
; Address: $D0E704
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1DB:
	JSL $948645		  ; 22 45 86 94 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	LDY #$42			 ; A0 42 | Hardware register operation
	SEP #$42			 ; E2 42 | Hardware register operation
	STY $A42D			; 8C 2D A4 | Store Y register to absolute address
	WDM #$E1			 ; 42 E1 | Reserved instruction
	CMP ($09,X)		  ; C1 09 | Compare accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	LDY $40			  ; A4 40 | Load from zero page into Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $42AC			; 0E AC 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1DC
; Address: $D0E723
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1DC:
	ORA $AC0E			; 0D 0E AC | Logical OR with accumulator (absolute)
	WDM #$C1			 ; 42 C1 | Reserved instruction
	BIT $22			  ; 24 22 | Test bits in accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	SBC ($64,X)		  ; E1 64 | Subtract with carry ((zero page,X))
	LDX #$93			 ; A2 93 | Load immediate value into X register
	BIT #$10			 ; 89 10 | Test bits in accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	CMP ($A4,X)		  ; C1 A4 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1DD
; Address: $D0E737
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1DD:
	JSL $148A93		  ; 22 93 8A 14 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	LDA ($A4,X)		  ; A1 A4 | Audio system operation
	LDX #$92			 ; A2 92 | Load immediate value into X register
	TXA				  ; 8A | Transfer X register to accumulator
	RTI				  ; 40 | Return from interrupt
	STA ($A4,X)		  ; 81 A4 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1DE
; Address: $D0E745
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1DE:
	JSL $188A92		  ; 22 92 8A 18 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	STA ($64,X)		  ; 81 64 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1DF
; Address: $D0E74C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1DF:
	JSL $188992		  ; 22 92 89 18 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	ADC ($64,X)		  ; 61 64 | Add with carry ((zero page,X))
	LDX #$91			 ; A2 91 | Load immediate value into X register
	BIT #$1C			 ; 89 1C | Test bits in accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ADC ($24,X)		  ; 61 24 | Add with carry ((zero page,X))
	LDX #$91			 ; A2 91 | Load immediate value into X register
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1E0
; Address: $D0E75D
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1E0:
	JSR $8140			; 20 40 81 | Jump to subroutine
	CPX $21			  ; E4 21 | PPU graphics register access
	BIT $40			  ; 24 40 | Test bits in accumulator (zero page)
	LDA ($E4,X)		  ; A1 E4 | Audio system operation
	LDA ($92,X)		  ; A1 92 | Audio system operation
	BIT $40			  ; 24 40 | Test bits in accumulator (zero page)
	ORA ($34,X)		  ; 01 34 | Logical OR with accumulator ((zero page,X))
	BMI $D0			  ; 30 D0 | Branch if negative
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	EOR ($A3,X)		  ; 41 A3 | Exclusive OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	STA $3462			; 8D 62 34 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	LDA ($FD,X)		  ; A1 FD | Audio system operation
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	LDA ($FD,X)		  ; A1 FD | Audio system operation
	RTI				  ; 40 | Return from interrupt
	LDA ($FD,X)		  ; A1 FD | Audio system operation
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1E1
; Address: $D0E78F
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1E1:
	RTI				  ; 40 | Return from interrupt
	LDA ($FD,X)		  ; A1 FD | Audio system operation
	RTI				  ; 40 | Return from interrupt
	LDA ($FD,X)		  ; A1 FD | Audio system operation
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	ORA $9C			  ; 05 9C | Logical OR with accumulator (zero page)
	JMP $C140			; 4C 40 C1 | Jump to address
	TAX				  ; AA | Transfer accumulator to X register
	PLB				  ; AB | Pull data bank register from stack
	ROR $4050			; 6E 50 40 | Rotate right (absolute)
	AND ($6E,X)		  ; 21 6E | Logical AND with accumulator ((zero page,X))
	LDX $B8			  ; A6 B8 | Load from zero page into X register
	STA $4054,Y		  ; 99 54 40 | Audio system operation
	AND ($FA,X)		  ; 21 FA | Logical AND with accumulator ((zero page,X))
	LDY $F3E8,X		  ; BC E8 F3 | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	AND ($A8,X)		  ; 21 A8 | Logical AND with accumulator ((zero page,X))
	BIT #$A0			 ; 89 A0 | Test bits in accumulator (immediate)
	ROL $7C			  ; 26 7C | Rotate left (zero page)
	RTI				  ; 40 | Return from interrupt
	CMP ($23,X)		  ; C1 23 | Compare accumulator ((zero page,X))
	ASL $8F			  ; 06 8F | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	EOR ($A5,X)		  ; 41 A5 | Exclusive OR with accumulator ((zero page,X))
	LDX $408C,Y		  ; BE 8C 40 | Load from absolute,Y into X register
	CMP ($F3,X)		  ; C1 F3 | Compare accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	LDA ($F3,X)		  ; A1 F3 | Audio system operation
	LDY $CE			  ; A4 CE | Load from zero page into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	SBC ($FB,X)		  ; E1 FB | Subtract with carry ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	LDA ($3A,X)		  ; A1 3A | Audio system operation
	NOP				  ; EA | No operation
	JMP $40AC			; 4C AC 40 | Jump to address
	EOR ($78,X)		  ; 41 78 | Exclusive OR with accumulator ((zero page,X))
	ASL $E1			  ; 06 E1 | Arithmetic shift left (zero page)
	ORA $40B4,Y		  ; 19 B4 40 | Logical OR with accumulator (absolute,Y)
	STA ($B5,X)		  ; 81 B5 | Audio system operation
	PHX				  ; DA | Push X register to stack
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1E2
; Address: $D0E7F9
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1E2:
	STA ($26,X)		  ; 81 26 | Audio system operation
	TXS				  ; 9A | Transfer X register to stack pointer
	CLI				  ; 58 | Clear interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	ADC ($E2,X)		  ; 61 E2 | Add with carry ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$2B			 ; 89 2B | Test bits in accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ADC ($E6,X)		  ; 61 E6 | Add with carry ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	STA $E4AB,Y		  ; 99 AB E4 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	ORA ($6D,X)		  ; 01 6D | Logical OR with accumulator ((zero page,X))
	AND ($E8),Y		  ; 31 E8 | Logical AND with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	EOR ($6F,X)		  ; 41 6F | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1E3
; Address: $D0E817
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1E3:
	JSR $81BD			; 20 BD 81 | Jump to subroutine
	CPX $E140			; EC 40 E1 | Compare X register (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	LDX $EB			  ; A6 EB | Load from zero page into X register
	TXS				  ; 9A | Transfer X register to stack pointer
	BEQ $40			  ; F0 40 | Branch if equal
	SBC ($F3,X)		  ; E1 F3 | Subtract with carry ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	EOR ($61,X)		  ; 41 61 | Exclusive OR with accumulator ((zero page,X))
	CMP ($C8),Y		  ; D1 C8 | Compare accumulator ((zero page),Y)
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1E4
; Address: $D0E836
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1E4:
	JSR $0141			; 20 41 01 | Jump to subroutine
	BIT $07			  ; 24 07 | Test bits in accumulator (zero page)
	BCC $1C			  ; 90 1C | Branch if carry clear
	BMI $41			  ; 30 41 | Branch if negative
	LDA ($2B,X)		  ; A1 2B | Audio system operation
	TXS				  ; 9A | Transfer X register to stack pointer
	LDX $3468			; AE 68 34 | Load from absolute address into X register
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	BIT $B11A			; 2C 1A B1 | Test bits in accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($81,X)		  ; 41 81 | Exclusive OR with accumulator ((zero page,X))
	ROL $2D			  ; 26 2D | Rotate left (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	RTI				  ; 40 | Return from interrupt
	EOR ($81,X)		  ; 41 81 | Exclusive OR with accumulator ((zero page,X))
	ROR $2C			  ; 66 2C | Rotate right (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	LDA ($44),Y		  ; B1 44 | Audio system operation
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	LDA $92BC24		  ; AF 24 BC 92 | Audio system operation
	CLI				  ; 58 | Clear interrupt disable flag
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1E5
; Address: $D0E864
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1E5:
	BIT $CF			  ; 24 CF | Test bits in accumulator (zero page)
	JMP $2CC141		  ; 5C 41 C1 2C | Jump to address long
	CLD				  ; D8 | Clear decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1E6
; Address: $D0E86F
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1E6:
	EOR ($81,X)		  ; 41 81 | Exclusive OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $41			  ; 64 41 | Store zero to zero page
	STA ($F7,X)		  ; 81 F7 | Audio system operation
	DEC $7CD7,X		  ; DE D7 7C | Decrement (absolute,X)
	EOR ($61,X)		  ; 41 61 | Exclusive OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $8068			; 8D 68 80 | Audio system operation
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
	SBC #$11			 ; E9 11 | Subtract with carry (immediate)
	STY $41			  ; 84 41 | Store Y register to zero page
	ORA ($E7,X)		  ; 01 E7 | Logical OR with accumulator ((zero page,X))
	BIT $9C			  ; 24 9C | Test bits in accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	EOR ($81,X)		  ; 41 81 | Exclusive OR with accumulator ((zero page,X))
	STX $8C9F			; 8E 9F 8C | Store X register to absolute address
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	STA $90AC,X		  ; 9D AC 90 | Audio system operation
	EOR ($E1,X)		  ; 41 E1 | Exclusive OR with accumulator ((zero page,X))
	STX $4194			; 8E 94 41 | Store X register to absolute address
	STA ($3E,X)		  ; 81 3E | Audio system operation
	ROL $FA			  ; 26 FA | Rotate left (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR ($61,X)		  ; 41 61 | Exclusive OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	PHB				  ; 8B | Push data bank register to stack
	SBC #$2C			 ; E9 2C | Subtract with carry (immediate)
	STZ $2141			; 9C 41 21 | PPU graphics register access
	ROR $97			  ; 66 97 | Rotate right (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR $41B0,X		  ; 5D B0 41 | Exclusive OR with accumulator (absolute,X)
	STA ($64,X)		  ; 81 64 | Audio system operation
	EOR #$B8			 ; 49 B8 | Exclusive OR with accumulator (immediate)
	EOR ($E1,X)		  ; 41 E1 | Exclusive OR with accumulator ((zero page,X))
	STZ $92			  ; 64 92 | Store zero to zero page
	EOR #$B4			 ; 49 B4 | Exclusive OR with accumulator (immediate)
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	ASL $3AD1			; 0E D1 3A | Arithmetic shift left (absolute)
	LDY $4141,X		  ; BC 41 41 | Load from absolute,X into Y register
	LDA $C031,X		  ; BD 31 C0 | Audio system operation
	EOR ($81,X)		  ; 41 81 | Exclusive OR with accumulator ((zero page,X))
	DEC $C451,X		  ; DE 51 C4 | Decrement (absolute,X)
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1E7
; Address: $D0E8E3
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1E7:
	LDY $C84B			; AC 4B C8 | Load from absolute address into Y register
	EOR ($A1,X)		  ; 41 A1 | Exclusive OR with accumulator ((zero page,X))
	ROR $BD			  ; 66 BD | Rotate right (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY $A141			; CC 41 A1 | Compare Y register (absolute)
	PHX				  ; DA | Push X register to stack
	BNE $41			  ; D0 41 | Branch if not equal
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	EOR ($61,X)		  ; 41 61 | Exclusive OR with accumulator ((zero page,X))
	ADC $E599,Y		  ; 79 99 E5 | Add with carry (absolute,Y)
	ADC $10			  ; 65 10 | Add with carry (zero page)
	WDM #$C1			 ; 42 C1 | Reserved instruction
	STA $42383C		  ; 8F 3C 38 42 | Hardware register operation
	EOR ($64,X)		  ; 41 64 | Exclusive OR with accumulator ((zero page,X))
	ORA $7591,X		  ; 1D 91 75 | Logical OR with accumulator (absolute,X)
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	STA				  ; 9F A9 74 42 | Store accumulator to absolute long,X
	ORA ($E7,X)		  ; 01 E7 | Logical OR with accumulator ((zero page,X))
	ORA $379C			; 0D 9C 37 | Logical OR with accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$81			 ; 42 81 | Reserved instruction
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	LDX $7C			  ; A6 7C | Load from zero page into X register
	DEY				  ; 88 | Decrement Y register
	WDM #$01			 ; 42 01 | Reserved instruction
	ROR				  ; 6A | Rotate right (accumulator)
	BPL $A8			  ; 10 A8 | Branch if positive
	EOR ($98,X)		  ; 41 98 | Exclusive OR with accumulator ((zero page,X))
	WDM #$C1			 ; 42 C1 | Reserved instruction
	LDA ($2A),Y		  ; B1 2A | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1E8
; Address: $D0E933
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1E8:
	RTI				  ; 40 | Return from interrupt
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	STY $4064			; 8C 64 40 | Store Y register to absolute address
	LDA ($6B,X)		  ; A1 6B | Audio system operation
	LDX $689D			; AE 9D 68 | Load from absolute address into X register
	RTI				  ; 40 | Return from interrupt
	STA ($B5,X)		  ; 81 B5 | Audio system operation
	LSR $40B8			; 4E B8 40 | Logical shift right (absolute)
	ORA ($EE,X)		  ; 01 EE | Logical OR with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	EOR ($A1,X)		  ; 41 A1 | Exclusive OR with accumulator ((zero page,X))
	ROR $BA9D			; 6E 9D BA | Rotate right (absolute)
	BPL $41			  ; 10 41 | Branch if positive
	ORA ($2C,X)		  ; 01 2C | Logical OR with accumulator ((zero page,X))
	BCS $50			  ; B0 50 | Branch if carry set
	BVS $41			  ; 70 41 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1E9
; Address: $D0E95E
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1E9:
	STA ($35,X)		  ; 81 35 | Audio system operation
	BVS $74			  ; 70 74 | Branch if overflow set
	EOR ($21,X)		  ; 41 21 | PPU graphics register access
	JMP ($B09F)		  ; 6C 9F B0 | Jump to address (absolute indirect)
	ADC $4178,X		  ; 7D 78 41 | Add with carry (absolute,X)
	AND ($29,X)		  ; 21 29 | Logical AND with accumulator ((zero page,X))
	LDY $48			  ; A4 48 | Load from zero page into Y register
	LDY #$41			 ; A0 41 | Load immediate value into Y register
	CMP ($EB,X)		  ; C1 EB | Compare accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	LDA $41A46B		  ; AF 6B A4 41 | Audio system operation
	STA ($72,X)		  ; 81 72 | Audio system operation
	AND $B5CA			; 2D CA B5 | Logical AND with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
	BIT $B1D7			; 2C D7 B1 | Test bits in accumulator (absolute)
	LDY $A141			; AC 41 A1 | Load from absolute address into Y register
	STA ($CA),Y		  ; 91 CA | Audio system operation
	EOR $44			  ; 45 44 | Exclusive OR with accumulator (zero page)
	WDM #$E1			 ; 42 E1 | Reserved instruction
	AND ($83,X)		  ; 21 83 | Logical AND with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$A1			 ; 42 A1 | Reserved instruction
	STA $643F8E		  ; 8F 8E 3F 64 | Audio system operation
	WDM #$82			 ; 42 82 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	ORA $82			  ; 05 82 | Logical OR with accumulator (zero page)
	BCC $0D			  ; 90 0D | Branch if carry clear
	STZ $03			  ; 64 03 | Store zero to zero page
	STA ($0D),Y		  ; 91 0D | Audio system operation
	STA ($0D),Y		  ; 91 0D | Audio system operation
	BIT $84			  ; 24 84 | Test bits in accumulator (zero page)
	BCC $0E			  ; 90 0E | Branch if carry clear
	STA $480E			; 8D 0E 48 | Audio system operation
	CMP ($8B,X)		  ; C1 8B | Compare accumulator ((zero page,X))
	STA $2F			  ; 85 2F | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	STY $401E			; 8C 1E 40 | Store Y register to absolute address
	EOR ($83,X)		  ; 41 83 | Exclusive OR with accumulator ((zero page,X))
	ORA $4450			; 0D 50 44 | Logical OR with accumulator (absolute)
	STA $4C09			; 8D 09 4C | Audio system operation
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	STA $10			  ; 85 10 | Audio system operation
	JMP $028344		  ; 5C 44 83 02 | Jump to address long
	TXA				  ; 8A | Transfer X register to accumulator
	BPL $70			  ; 10 70 | Branch if positive
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	STA ($1B),Y		  ; 91 1B | Audio system operation
	CMP ($06,X)		  ; C1 06 | Compare accumulator ((zero page,X))
	STA $1B			  ; 85 1B | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1EA
; Address: $D0E9FD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1EA:
	JMP ($C344)		  ; 6C 44 C3 | Jump to address (absolute indirect)
	PHB				  ; 8B | Push data bank register to stack
	ASL $4474			; 0E 74 44 | Arithmetic shift left (absolute)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $4460,X		  ; 1E 60 44 | Arithmetic shift left (absolute,X)
	EOR $07			  ; 45 07 | Exclusive OR with accumulator (zero page)
	ORA $4458,X		  ; 1D 58 44 | Logical OR with accumulator (absolute,X)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1EB
; Address: $D0EA1F
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1EB:
	JSR $4464			; 20 64 44 | Jump to subroutine
	SBC ($80),Y		  ; F1 80 | Subtract with carry ((zero page),Y)
	ASL $4034			; 0E 34 40 | Arithmetic shift left (absolute)
	STA ($81),Y		  ; 91 81 | Audio system operation
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BVC $40			  ; 50 40 | Branch if overflow clear
	STA ($A0,X)		  ; 81 A0 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVS $42			  ; 70 42 | Hardware register operation
	CMP ($E0),Y		  ; D1 E0 | Game work RAM access
	WDM #$83			 ; 42 83 | Reserved instruction
	WDM #$11			 ; 42 11 | Reserved instruction
	SBC ($42,X)		  ; E1 42 | Hardware register operation
	STY $0B			  ; 84 0B | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	ADC ($A1,X)		  ; 61 A1 | Add with carry ((zero page,X))
	STA $0A			  ; 85 0A | Audio system operation
	STA ($61,X)		  ; 81 61 | Audio system operation
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	ORA $14			  ; 05 14 | Logical OR with accumulator (zero page)
	EOR ($81,X)		  ; 41 81 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	ORA ($A1,X)		  ; 01 A1 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BRA $44			  ; 80 44 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	BRA $44			  ; 80 44 | Branch always
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	BRA $44			  ; 80 44 | Branch always
	ORA ($25,X)		  ; 01 25 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	BRA $44			  ; 80 44 | Branch always
	LDA ($84,X)		  ; A1 84 | Audio system operation
	STX $92			  ; 86 92 | Store X register to zero page
	INC				  ; 1A | Increment accumulator
	STY $44			  ; 84 44 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1EC
; Address: $D0EA7D
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1EC:
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($4C),Y		  ; 11 4C | Logical OR with accumulator ((zero page),Y)
	LDA ($AD,X)		  ; A1 AD | Audio system operation
	CLI				  ; 58 | Clear interrupt disable flag
	CPY #$05			 ; C0 05 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $05			  ; 80 05 | Branch always
	ORA ($61),Y		  ; 11 61 | Logical OR with accumulator ((zero page),Y)
	EOR #$84			 ; 49 84 | Exclusive OR with accumulator (immediate)
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	ASL $683C,X		  ; 1E 3C 68 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BEQ $41			  ; F0 41 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	CMP $0840,Y		  ; D9 40 08 | Compare accumulator (absolute,Y)
	AND $78A8,Y		  ; 39 A8 78 | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	AND $38C8,Y		  ; 39 C8 38 | Logical AND with accumulator (absolute,Y)
	EOR ($0C,X)		  ; 41 0C | Exclusive OR with accumulator ((zero page,X))
	AND $68B0,Y		  ; 39 B0 68 | Logical AND with accumulator (absolute,Y)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	AND $6868,Y		  ; 39 68 68 | Logical AND with accumulator (absolute,Y)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	AND $3830,Y		  ; 39 30 38 | Logical AND with accumulator (absolute,Y)
	EOR ($04,X)		  ; 41 04 | Exclusive OR with accumulator ((zero page,X))
	AND $A830,Y		  ; 39 30 A8 | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	AND $7860,Y		  ; 39 60 78 | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	AND $2868,Y		  ; 39 68 28 | Logical AND with accumulator (absolute,Y)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	AND $0868,Y		  ; 39 68 08 | Logical AND with accumulator (absolute,Y)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	JMP $41A0			; 4C A0 41 | Jump to address
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	AND $0C42,Y		  ; 39 42 0C | Logical AND with accumulator (absolute,Y)
	CPY $4110			; CC 10 41 | Compare Y register (absolute)
	CPX $4190			; EC 90 41 | Compare X register (absolute)
	CMP ($41),Y		  ; D1 41 | Compare accumulator ((zero page),Y)
	CMP ($41),Y		  ; D1 41 | Compare accumulator ((zero page),Y)
	CMP ($41),Y		  ; D1 41 | Compare accumulator ((zero page),Y)
	EOR #$2C			 ; 49 2C | Exclusive OR with accumulator (immediate)
	LDA ($42,X)		  ; A1 42 | Hardware register operation
	EOR $18CC			; 4D CC 18 | Exclusive OR with accumulator (absolute)
	BVC $4C			  ; 50 4C | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1ED
; Address: $D0EB05
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1ED:
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR ($04,X)		  ; 41 04 | Exclusive OR with accumulator ((zero page,X))
	LDA ($44,X)		  ; A1 44 | Audio system operation
	INY				  ; C8 | Increment Y register
	BRA $04			  ; 80 04 | Branch always
	CPY $D0			  ; C4 D0 | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHY				  ; 5A | Push Y register to stack
	CPX $81			  ; E4 81 | Compare X register (zero page)
	EOR ($0C,X)		  ; 41 0C | Exclusive OR with accumulator ((zero page,X))
	EOR $7044,X		  ; 5D 44 70 | Exclusive OR with accumulator (absolute,X)
	EOR ($04,X)		  ; 41 04 | Exclusive OR with accumulator ((zero page,X))
	EOR $0928,X		  ; 5D 28 09 | Exclusive OR with accumulator (absolute,X)
	WDM #$08			 ; 42 08 | Reserved instruction
	ADC ($48,X)		  ; 61 48 | Add with carry ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$04			 ; 42 04 | Reserved instruction
	ADC ($C8,X)		  ; 61 C8 | Add with carry ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	ROR $78			  ; 66 78 | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	LDY #$41			 ; A0 41 | Load immediate value into Y register
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1EE
; Address: $D0EB3B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1EE:
	JSR $4099			; 20 99 40 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1EF
; Address: $D0EB40
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1EF:
	DEY				  ; 88 | Decrement Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ADC $5064			; 6D 64 50 | Add with carry (absolute)
	ROR $10C0			; 6E C0 10 | Rotate right (absolute)
	ROR $784C			; 6E 4C 78 | Rotate right (absolute)
	PHP				  ; 08 | Push processor status to stack
	ADC ($A0),Y		  ; 71 A0 | Add with carry ((zero page),Y)
	CPX #$43			 ; E0 43 | Compare X register (immediate)
	JMP $0C43D1		  ; 5C D1 43 0C | Jump to address long
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BNE $E8			  ; D0 E8 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	JMP $41F0			; 4C F0 41 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	ADC $70E8,Y		  ; 79 E8 70 | Add with carry (absolute,Y)
	LDY $42D8			; AC D8 42 | Hardware register operation
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1F0
; Address: $D0EB78
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1F0:
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	BRA $8C			  ; 80 8C | Branch always
	BVS $43			  ; 70 43 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	LDA ($43,X)		  ; A1 43 | Audio system operation
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	WDM #$08			 ; 42 08 | Reserved instruction
	STY $4C			  ; 84 4C | Store Y register to zero page
	BEQ $41			  ; F0 41 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	STA $08			  ; 85 08 | Audio system operation
	CMP $0440,Y		  ; D9 40 04 | Compare accumulator (absolute,Y)
	STA $28			  ; 85 28 | Audio system operation
	BCS $42			  ; B0 42 | Hardware register operation
	STA $48			  ; 85 48 | Audio system operation
	LDA #$43			 ; A9 43 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $3928			; 8D 28 39 | Audio system operation
	WDM #$0C			 ; 42 0C | Reserved instruction
	BCC $98			  ; 90 98 | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	CPY $88			  ; C4 88 | Compare Y register (zero page)
	STA				  ; 9F C4 18 43 | Store accumulator to absolute long,X
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $4438			; 9C 38 44 | Store zero to absolute
	LDA $44B908		  ; AF 08 B9 44 | Audio system operation
	BCS $FC			  ; B0 FC | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $42			  ; 10 42 | Hardware register operation
	BCS $70			  ; B0 70 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	BNE $B1			  ; D0 B1 | Branch if not equal
	EOR ($0C,X)		  ; 41 0C | Exclusive OR with accumulator ((zero page,X))
	LDA $6890,Y		  ; B9 90 68 | Audio system operation
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	LDA $68B8,Y		  ; B9 B8 68 | Audio system operation
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	LDX $8048,Y		  ; BE 48 80 | Load from absolute,Y into X register
	EOR ($04,X)		  ; 41 04 | Exclusive OR with accumulator ((zero page,X))
	LDX $D1B4,Y		  ; BE B4 D1 | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	REP #$C4			 ; C2 C4 | Reset processor status bits
	BVS $43			  ; 70 43 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1F1
; Address: $D0EBEE
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1F1:
	INY				  ; C8 | Increment Y register
	PEA #$4458		   ; F4 58 44 | Push effective address to stack
	AND $4511,X		  ; 3D 11 45 | Logical AND with accumulator (absolute,X)
	DEC $A878			; CE 78 A8 | Decrement (absolute)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BNE $98			  ; D0 98 | Branch if not equal
	CPX #$41			 ; E0 41 | Compare X register (immediate)
	CMP ($BC),Y		  ; D1 BC | Compare accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	WDM #$00			 ; 42 00 | Reserved instruction
	BNE $C8			  ; D0 C8 | Branch if not equal
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	BVS $88			  ; 70 88 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	CMP $3860,X		  ; DD 60 38 | Compare accumulator (absolute,X)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	CMP $E9F0,X		  ; DD F0 E9 | Compare accumulator (absolute,X)
	BRA $08			  ; 80 08 | Branch always
	DEC $69F0,X		  ; DE F0 69 | Decrement (absolute,X)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	EOR #$41			 ; 49 41 | Exclusive OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	SBC $60			  ; E5 60 | Subtract with carry (zero page)
	PLX				  ; FA | Pull X register from stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	SBC ($D8,X)		  ; E1 D8 | Subtract with carry ((zero page,X))
	CPY #$42			 ; C0 42 | Hardware register operation
	PHP				  ; 08 | Push processor status to stack
	SEP #$30			 ; E2 30 | Set processor status bits
	ORA ($44),Y		  ; 11 44 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1F2
; Address: $D0EC40
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1F2:
	JSR $0841			; 20 41 08 | Jump to subroutine
	BEQ $90			  ; F0 90 | Branch if equal
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	INC $90			  ; E6 90 | Increment (zero page)
	ADC $0842,Y		  ; 79 42 08 | Add with carry (absolute,Y)
	INX				  ; E8 | Increment X register
	BRA $09			  ; 80 09 | Branch always
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1F3
; Address: $D0EC53
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1F3:
	INX				  ; E8 | Increment X register
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BEQ $D0			  ; F0 D0 | Branch if equal
	AND $0883,Y		  ; 39 83 08 | Logical AND with accumulator (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	JMP $40B8			; 4C B8 40 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	PEA #$C878		   ; F4 78 C8 | Push effective address to stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	CMP ($28,X)		  ; C1 28 | Compare accumulator ((zero page,X))
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CMP ($88,X)		  ; C1 88 | Compare accumulator ((zero page,X))
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	CMP ($D8),Y		  ; D1 D8 | Compare accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ORA $986D			; 0D 6D 98 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ASL $9879			; 0E 79 98 | Arithmetic shift left (absolute)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	LDA #$60			 ; A9 60 | Audio system operation
	WDM #$00			 ; 42 00 | Reserved instruction
	BPL $81			  ; 10 81 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($79),Y		  ; 11 79 | Logical OR with accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	LDA ($28),Y		  ; B1 28 | Audio system operation
	WDM #$00			 ; 42 00 | Reserved instruction
	ADC ($B0),Y		  ; 71 B0 | Add with carry ((zero page),Y)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($71),Y		  ; 11 71 | Logical OR with accumulator ((zero page),Y)
	EOR ($0C,X)		  ; 41 0C | Exclusive OR with accumulator ((zero page,X))
	ADC $4208,X		  ; 7D 08 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1F4
; Address: $D0ECB1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1F4:
	CLC				  ; 18 | Clear carry flag
	SBC ($78),Y		  ; F1 78 | Subtract with carry ((zero page),Y)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	ORA $F889,Y		  ; 19 89 F8 | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	EOR $4171,Y		  ; 59 71 41 | Exclusive OR with accumulator (absolute,Y)
	EOR ($70),Y		  ; 51 70 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($04,X)		  ; 41 04 | Exclusive OR with accumulator ((zero page,X))
	ORA $3889,X		  ; 1D 89 38 | Logical OR with accumulator (absolute,X)
	WDM #$08			 ; 42 08 | Reserved instruction
	ASL $007D,X		  ; 1E 7D 00 | Arithmetic shift left (absolute,X)
	WDM #$00			 ; 42 00 | Reserved instruction
	ADC ($40),Y		  ; 71 40 | Add with carry ((zero page),Y)
	WDM #$00			 ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1F5
; Address: $D0ECD4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1F5:
	JSR $B8D9			; 20 D9 B8 | Jump to subroutine
	WDM #$00			 ; 42 00 | Reserved instruction
	AND ($D1,X)		  ; 21 D1 | Logical AND with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1F6
; Address: $D0ECDE
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1F6:
	JSL $43B8D5		  ; 22 D5 B8 43 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ORA #$E2			 ; 09 E2 | Logical OR with accumulator (immediate)
	EOR ($0C,X)		  ; 41 0C | Exclusive OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	STA ($F8),Y		  ; 91 F8 | Audio system operation
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	STA $40A8,Y		  ; 99 A8 40 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	CMP ($D8,X)		  ; C1 D8 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	CMP ($E8,X)		  ; C1 E8 | Compare accumulator ((zero page,X))
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	EOR #$E9			 ; 49 E9 | Exclusive OR with accumulator (immediate)
	EOR ($09,X)		  ; 41 09 | Exclusive OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CMP ($18,X)		  ; C1 18 | Compare accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND #$99			 ; 29 99 | Logical AND with accumulator (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	AND #$59			 ; 29 59 | Logical AND with accumulator (immediate)
	SBC ($41,X)		  ; E1 41 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1F7
; Address: $D0ED14
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1F7:
	PHP				  ; 08 | Push processor status to stack
	AND #$D9			 ; 29 D9 | Logical AND with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	WDM #$08			 ; 42 08 | Reserved instruction
	AND #$95			 ; 29 95 | Logical AND with accumulator (immediate)
	CPX #$41			 ; E0 41 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	AND #$D9			 ; 29 D9 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $E8			  ; E5 E8 | Subtract with carry (zero page)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	ORA $4201			; 0D 01 42 | Hardware register operation
	PHP				  ; 08 | Push processor status to stack
	ROL $68C9			; 2E C9 68 | Rotate left (absolute)
	BIT #$08			 ; 89 08 | Test bits in accumulator (immediate)
	STA ($08,X)		  ; 81 08 | Audio system operation
	ORA ($F9),Y		  ; 11 F9 | Logical OR with accumulator ((zero page),Y)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BIT #$D8			 ; 89 D8 | Test bits in accumulator (immediate)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA $41F9,Y		  ; 19 F9 41 | Logical OR with accumulator (absolute,Y)
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	CMP #$38			 ; C9 38 | Compare accumulator (immediate)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	STA $4178,Y		  ; 99 78 41 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	SBC ($78),Y		  ; F1 78 | Subtract with carry ((zero page),Y)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	CMP ($C8,X)		  ; C1 C8 | Compare accumulator ((zero page,X))
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	BMI $BD			  ; 30 BD | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	STA ($69,X)		  ; 81 69 | Audio system operation
	WDM #$0C			 ; 42 0C | Reserved instruction
	EOR $41B8,Y		  ; 59 B8 41 | Exclusive OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	CMP $4158,Y		  ; D9 58 41 | Compare accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	AND $5105,Y		  ; 39 05 51 | Logical AND with accumulator (absolute,Y)
	AND $C105,Y		  ; 39 05 C1 | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	AND $E905,Y		  ; 39 05 E9 | Logical AND with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	AND $0075,Y		  ; 39 75 00 | Logical AND with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	AND $899D,Y		  ; 39 9D 89 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1F8
; Address: $D0ED86
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1F8:
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	ORA ($B9,X)		  ; 01 B9 | Logical OR with accumulator ((zero page,X))
	CMP ($08,X)		  ; C1 08 | Compare accumulator ((zero page,X))
	SBC ($28),Y		  ; F1 28 | Subtract with carry ((zero page),Y)
	REP #$08			 ; C2 08 | Reset processor status bits
	ORA ($79,X)		  ; 01 79 | Logical OR with accumulator ((zero page,X))
	REP #$08			 ; C2 08 | Reset processor status bits
	SEI				  ; 78 | Set interrupt disable flag
	INY				  ; C8 | Increment Y register
	BRA $09			  ; 80 09 | Branch always
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	ORA ($42,X)		  ; 01 42 | Hardware register operation
	SBC $4250,X		  ; FD 50 42 | Hardware register operation
	JMP $6849			; 4C 49 68 | Jump to address
	WDM #$04			 ; 42 04 | Reserved instruction
	LSR $1959			; 4E 59 19 | Logical shift right (absolute)
	PHP				  ; 08 | Push processor status to stack
	STA $4230			; 8D 30 42 | Hardware register operation
	STA $41D0			; 8D D0 41 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	BVC $61			  ; 50 61 | Branch if overflow clear
	BVC $42			  ; 50 42 | Hardware register operation
	BVC $A1			  ; 50 A1 | Branch if overflow clear
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	LDA $30			  ; A5 30 | Audio system operation
	WDM #$00			 ; 42 00 | Reserved instruction
	LDA $D0			  ; A5 D0 | Audio system operation
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	ADC $4148,X		  ; 7D 48 41 | Add with carry (absolute,X)
	ADC $40F8,X		  ; 7D F8 40 | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	LDA $68			  ; A5 68 | Audio system operation
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR $0841,Y		  ; 59 41 08 | Exclusive OR with accumulator (absolute,Y)
	EOR $914D,Y		  ; 59 4D 91 | Exclusive OR with accumulator (absolute,Y)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	EOR $F8D5,Y		  ; 59 D5 F8 | Exclusive OR with accumulator (absolute,Y)
	WDM #$08			 ; 42 08 | Reserved instruction
	EOR $70D5,Y		  ; 59 D5 70 | Exclusive OR with accumulator (absolute,Y)
	EOR $F87D,X		  ; 5D 7D F8 | Exclusive OR with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	EOR $687D,X		  ; 5D 7D 68 | Exclusive OR with accumulator (absolute,X)
	WDM #$00			 ; 42 00 | Reserved instruction
	BMI $89			  ; 30 89 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1F9
; Address: $D0EE01
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1F9:
	SEC				  ; 38 | Set carry flag
	STA $0848,Y		  ; 99 48 08 | Audio system operation
	BMI $A9			  ; 30 A9 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	LDA #$48			 ; A9 48 | Audio system operation
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1FB
; Address: $D0EE15
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1FB:
	JSR $4899			; 20 99 48 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	STA $0848,Y		  ; 99 48 08 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	BIT #$48			 ; 89 48 | Test bits in accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1FC
; Address: $D0EE24
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1FC:
	JSR $4879			; 20 79 48 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	ADC $0848,Y		  ; 79 48 08 | Add with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	LDA #$48			 ; A9 48 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	ORA $084C			; 0D 4C 08 | Logical OR with accumulator (absolute)
	BNE $28			  ; D0 28 | Branch if not equal
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	LDA				  ; BF 44 08 34 | Load from absolute long,X into accumulator
	CPY #$49			 ; C0 49 | Compare Y register (immediate)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	BCS $EA			  ; B0 EA | Branch if carry set
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	DEY				  ; 88 | Decrement Y register
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	EOR $3408			; 4D 08 34 | Exclusive OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1FE
; Address: $D0EE5D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1FE:
	EOR $3408			; 4D 08 34 | Exclusive OR with accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	ROL $084F,X		  ; 3E 4F 08 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROR				  ; 6A | Rotate right (accumulator)
	WDM #$08			 ; 42 08 | Reserved instruction
	BEQ $88			  ; F0 88 | Branch if equal
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_1FF
; Address: $D0EE6F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_1FF:
	BVC $E9			  ; 50 E9 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	BEQ $3C			  ; F0 3C | Branch if equal
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	INX				  ; E8 | Increment X register
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	LDX $084C,Y		  ; BE 4C 08 | Load from absolute,Y into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	DEC $0844			; CE 44 08 | Decrement (absolute)
	BPL $9E			  ; 10 9E | Branch if positive
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_200
; Address: $D0EE8E
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_200:
	LDA $084D			; AD 4D 08 | Audio system operation
	LDY #$89			 ; A0 89 | Load immediate value into Y register
	EOR $08			  ; 45 08 | Exclusive OR with accumulator (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	WDM #$08			 ; 42 08 | Reserved instruction
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA $084A,Y		  ; B9 4A 08 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BNE $1B			  ; D0 1B | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	LDX $0849			; AE 49 08 | Load from absolute address into X register
	CPX #$7D			 ; E0 7D | Compare X register (immediate)
	EOR $3408			; 4D 08 34 | Exclusive OR with accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	DEY				  ; 88 | Decrement Y register
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	BVS $7A			  ; 70 7A | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	CPY #$39			 ; C0 39 | Compare Y register (immediate)
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	BNE $C9			  ; D0 C9 | Branch if not equal
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	CPX $0848			; EC 48 08 | Compare X register (absolute)
	LDY #$8F			 ; A0 8F | Load immediate value into Y register
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	DEC $0842			; CE 42 08 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_202
; Address: $D0EEE7
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_202:
	JSR $4499			; 20 99 44 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	STA $0844,Y		  ; 99 44 08 | Audio system operation
	BPL $AD			  ; 10 AD | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BNE $1B			  ; D0 1B | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	CPX #$1D			 ; E0 1D | Compare X register (immediate)
	EOR $08			  ; 45 08 | Exclusive OR with accumulator (zero page)
	CPY #$BA			 ; C0 BA | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR $084F,Y		  ; 59 4F 08 | Exclusive OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	EOR $3408			; 4D 08 34 | Exclusive OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	STA $084C			; 8D 4C 08 | Audio system operation
	BEQ $2D			  ; F0 2D | Branch if equal
	EOR $3408			; 4D 08 34 | Exclusive OR with accumulator (absolute)
	CMP #$41			 ; C9 41 | Compare accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	TXA				  ; 8A | Transfer X register to accumulator
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	BPL $8B			  ; 10 8B | Branch if positive
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	LDY #$49			 ; A0 49 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	LDY #$19			 ; A0 19 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	CPY #$2B			 ; C0 2B | Compare Y register (immediate)
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	BEQ $2C			  ; F0 2C | Branch if equal
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	BMI $8B			  ; 30 8B | Branch if negative
	EOR $3408			; 4D 08 34 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_203
; Address: $D0EF41
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_203:
	JSR $4A8F			; 20 8F 4A | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	LDA $084D			; AD 4D 08 | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	LDA $084D,X		  ; BD 4D 08 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	LSR $0846,X		  ; 5E 46 08 | Logical shift right (absolute,X)
	BEQ $C8			  ; F0 C8 | Branch if equal

;------------------------------------------------------------------------------
; Bank20_AudioFunction_204
; Address: $D0EF62
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_204:
	PHP				  ; 08 | Push processor status to stack
	BEQ $D8			  ; F0 D8 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BPL $59			  ; 10 59 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $39			  ; 10 39 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	EOR $0847,Y		  ; 59 47 08 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_205
; Address: $D0EF78
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_205:
	JSR $4759			; 20 59 47 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	CMP $0446,Y		  ; D9 46 04 | Compare accumulator (absolute,Y)
	BEQ $99			  ; F0 99 | Branch if equal
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	CPY #$79			 ; C0 79 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_206
; Address: $D0EF8D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_206:
	DEX				  ; CA | Decrement X register
	PHP				  ; 08 | Push processor status to stack
	BRA $1A			  ; 80 1A | Branch always
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	BVS $AC			  ; 70 AC | Branch if overflow set
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BVC $CD			  ; 50 CD | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	PHX				  ; DA | Push X register to stack
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_207
; Address: $D0EFAB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_207:
	SBC $0844			; ED 44 08 | Subtract with carry (absolute)
	BRA $FB			  ; 80 FB | Branch always
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHP				  ; 08 | Push processor status to stack
	EOR $08			  ; 45 08 | Exclusive OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_208
; Address: $D0EFBF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_208:
	ORA $0847			; 0D 47 08 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	TXA				  ; 8A | Transfer X register to accumulator
	PHP				  ; 08 | Push processor status to stack
	BEQ $BA			  ; F0 BA | Branch if equal
	LSR $04			  ; 46 04 | Logical shift right (zero page)
	LDY #$5C			 ; A0 5C | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_209
; Address: $D0EFD5
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_209:
	PHP				  ; 08 | Push processor status to stack
	BVS $1D			  ; 70 1D | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $350844		  ; 5C 44 08 35 | Jump to address long
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP ($0844)		  ; 6C 44 08 | Jump to address (absolute indirect)
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	BNE $D0			  ; D0 D0 | Branch if not equal
	INX				  ; E8 | Increment X register
	BRA $08			  ; 80 08 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	WDM #$08			 ; 42 08 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	CMP ($E8,X)		  ; C1 E8 | Compare accumulator ((zero page,X))
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	ASL $D879			; 0E 79 D8 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BPL $D1			  ; 10 D1 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $08			  ; 80 08 | Branch always
	ORA ($51),Y		  ; 11 51 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	ORA ($A1),Y		  ; 11 A1 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	ORA ($B9),Y		  ; 11 B9 | Logical OR with accumulator ((zero page),Y)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	EOR ($B8),Y		  ; 51 B8 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	LDA ($E8),Y		  ; B1 E8 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ADC ($48),Y		  ; 71 48 | Add with carry ((zero page),Y)
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	LDA ($E8,X)		  ; A1 E8 | Audio system operation
	STA ($08,X)		  ; 81 08 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_20B
; Address: $D0F02B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_20B:
	JSR $0951			; 20 51 09 | Jump to subroutine
	WDM #$08			 ; 42 08 | Reserved instruction
	AND $4088,X		  ; 3D 88 40 | Logical AND with accumulator (absolute,X)
	ORA $4040,X		  ; 1D 40 40 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_20C
; Address: $D0F03B
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_20C:
	AND $4040,X		  ; 3D 40 40 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	EOR $4040,X		  ; 5D 40 40 | Exclusive OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	AND $40D8,X		  ; 3D D8 40 | Logical AND with accumulator (absolute,X)
	ADC $D8			  ; 65 D8 | Add with carry (zero page)
	RTI				  ; 40 | Return from interrupt
	AND ($A8,X)		  ; 21 A8 | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	EOR $B8			  ; 45 B8 | Exclusive OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	EOR $40A8,Y		  ; 59 A8 40 | Exclusive OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ADC ($58,X)		  ; 61 58 | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	CMP ($42,X)		  ; C1 42 | Hardware register operation
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	JMP $010033		  ; 5C 33 00 01 | Jump to address long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	JMP $840033		  ; 5C 33 00 84 | Jump to address long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	SBC $4700,X		  ; FD 00 47 | Subtract with carry (absolute,X)
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	JMP $000100		  ; 5C 00 01 00 | Jump to address long
	DEX				  ; CA | Decrement X register
	PLA				  ; 68 | Pull accumulator from stack
	INC $CA00,X		  ; FE 00 CA | Increment (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ADC $00FF			; 6D FF 00 | Add with carry (absolute)
	CMP $000D			; CD 0D 00 | Compare accumulator (absolute)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	CMP $0009			; CD 09 00 | Compare accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	STY $06			  ; 84 06 | Store Y register to zero page
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($9B,X)		  ; 01 9B | Logical OR with accumulator ((zero page,X))
	WDM #$0A			 ; 42 0A | Reserved instruction
	EOR $0108,Y		  ; 59 08 01 | Exclusive OR with accumulator (absolute,Y)
	CMP ($44,X)		  ; C1 44 | Compare accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_20D
; Address: $D0F0BA
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_20D:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR $10			  ; 45 10 | Exclusive OR with accumulator (zero page)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	WDM #$07			 ; 42 07 | Reserved instruction
	BRA $4D			  ; 80 4D | Branch always
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	CPY #$C6			 ; C0 C6 | Compare Y register (immediate)
	ORA $7200			; 0D 00 72 | Logical OR with accumulator (absolute)
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	CPY $0007			; CC 07 00 | Compare Y register (absolute)
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	CPY $0007			; CC 07 00 | Compare Y register (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	ORA $4701			; 0D 01 47 | Logical OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	ASL $0701			; 0E 01 07 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $8701			; 0D 01 87 | Logical OR with accumulator (absolute)
	WDM #$06			 ; 42 06 | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	REP #$10			 ; C2 10 | Reset processor status bits
	BPL $01			  ; 10 01 | Branch if positive
	STY $C7			  ; 84 C7 | Store Y register to zero page
	EOR $0111,Y		  ; 59 11 01 | Exclusive OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	DEC $08			  ; C6 08 | Decrement (zero page)
	BRA $5F			  ; 80 5F | Branch always
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	EOR $0114,Y		  ; 59 14 01 | Exclusive OR with accumulator (absolute,Y)
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($C8,X)		  ; 01 C8 | Logical OR with accumulator ((zero page,X))
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	BRA $70			  ; 80 70 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_20E
; Address: $D0F149
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_20E:
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $4701,Y		  ; 19 01 47 | Logical OR with accumulator (absolute,Y)
	INY				  ; C8 | Increment Y register
	INC				  ; 1A | Increment accumulator
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	WDM #$08			 ; 42 08 | Reserved instruction
	BRA $26			  ; 80 26 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	DEC $05			  ; C6 05 | Decrement (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ORA $C001,X		  ; 1D 01 C0 | Logical OR with accumulator (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	ASL $0701,X		  ; 1E 01 07 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	LDY #$C3			 ; A0 C3 | Load immediate value into Y register
	INC				  ; 1A | Increment accumulator
	BRA $42			  ; 80 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_20F
; Address: $D0F184
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_20F:
	JSL $C80001		  ; 22 01 00 C8 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $30			  ; 86 30 | Store X register to zero page
	BIT $CA01			; 2C 01 CA | Test bits in accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_210
; Address: $D0F199
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_210:
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP ($0125)		  ; 6C 25 01 | Jump to address (absolute indirect)
	LSR				  ; 4A | Logical shift right (accumulator)
	BRA $6C			  ; 80 6C | Branch always
	ROL $01			  ; 26 01 | Rotate left (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	BRA $6D			  ; 80 6D | Branch always
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	BVS $28			  ; 70 28 | Branch if overflow set
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BMI $2A			  ; 30 2A | Branch if negative
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	CPY $0411			; CC 11 04 | Compare Y register (absolute)
	EOR $2D			  ; 45 2D | Exclusive OR with accumulator (zero page)
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	DEC $05			  ; C6 05 | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_211
; Address: $D0F1D8
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_211:
	ROL $C701			; 2E 01 C7 | Rotate left (absolute)
	DEC $05			  ; C6 05 | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CPY $000F			; CC 0F 00 | Compare Y register (absolute)
	BVC $30			  ; 50 30 | Branch if overflow clear
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	DEC $07			  ; C6 07 | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	EOR $0134,Y		  ; 59 34 01 | Exclusive OR with accumulator (absolute,Y)
	REP #$04			 ; C2 04 | Reset processor status bits
	BRA $4D			  ; 80 4D | Branch always
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	BRA $58			  ; 80 58 | Branch always
	CPY #$49			 ; C0 49 | Compare Y register (immediate)
	ASL $68			  ; 06 68 | Arithmetic shift left (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $6800,Y		  ; 19 00 68 | Logical OR with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	ORA ($8A,X)		  ; 01 8A | Logical OR with accumulator ((zero page,X))
	ORA $7080,Y		  ; 19 80 70 | Logical OR with accumulator (absolute,Y)
	AND $0801,Y		  ; 39 01 08 | Logical AND with accumulator (absolute,Y)
	STY $08			  ; 84 08 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	DEC				  ; 3A | Decrement accumulator
	ORA ($88,X)		  ; 01 88 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($60,X)		  ; 01 60 | Logical OR with accumulator ((zero page,X))
	STA ($16,X)		  ; 81 16 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($C4,X)		  ; 01 C4 | Logical OR with accumulator ((zero page,X))
	EOR #$15			 ; 49 15 | Exclusive OR with accumulator (immediate)
	ASL $68			  ; 06 68 | Arithmetic shift left (zero page)
	AND $0001,X		  ; 3D 01 00 | Logical AND with accumulator (absolute,X)
	DEC $0A			  ; C6 0A | Decrement (zero page)
	STX $59			  ; 86 59 | Store X register to zero page
	ROL $C001,X		  ; 3E 01 C0 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_212
; Address: $D0F254
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_212:
	ASL $68			  ; 06 68 | Arithmetic shift left (zero page)
	ORA ($5B,X)		  ; 01 5B | Logical OR with accumulator ((zero page,X))
	WDM #$01			 ; 42 01 | Reserved instruction
	DEY				  ; 88 | Decrement Y register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BIT $0140			; 2C 40 01 | Test bits in accumulator (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	JMP ($0141)		  ; 6C 41 01 | Jump to address (absolute indirect)
	CMP ($43,X)		  ; C1 43 | Compare accumulator ((zero page,X))
	BRA $6F			  ; 80 6F | Branch always
	TAX				  ; AA | Transfer accumulator to X register
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $5A			  ; 80 5A | Branch always
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	EOR ($47),Y		  ; 51 47 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	ADC $0145			; 6D 45 01 | Add with carry (absolute)
	DEX				  ; CA | Decrement X register
	ROR $0146			; 6E 46 01 | Rotate right (absolute)
	ORA ($C8,X)		  ; 01 C8 | Logical OR with accumulator ((zero page,X))
	BRA $04			  ; 80 04 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	ORA $0100			; 0D 00 01 | Logical OR with accumulator (absolute)
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)
	BRA $85			  ; 80 85 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	ASL $2C			  ; 06 2C | Arithmetic shift left (zero page)
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	EOR #$11			 ; 49 11 | Exclusive OR with accumulator (immediate)
	JMP $8701			; 4C 01 87 | Jump to address
	WDM #$06			 ; 42 06 | Reserved instruction
	ROL $014D,X		  ; 3E 4D 01 | Rotate left (absolute,X)
	EOR $C4			  ; 45 C4 | Exclusive OR with accumulator (zero page)
	BRA $5B			  ; 80 5B | Branch always
	LSR $4001			; 4E 01 40 | Logical shift right (absolute)
	CMP $06			  ; C5 06 | Compare accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_213
; Address: $D0F2D5
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_213:
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	BRA $1A			  ; 80 1A | Branch always
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVC $01			  ; 50 01 | Branch if overflow clear
	WDM #$07			 ; 42 07 | Reserved instruction
	BRA $3F			  ; 80 3F | Branch always
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	REP #$08			 ; C2 08 | Reset processor status bits
	BRA $5B			  ; 80 5B | Branch always
	EOR ($01),Y		  ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
	CMP #$0B			 ; C9 0B | Compare accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	BRA $5B			  ; 80 5B | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	WDM #$0A			 ; 42 0A | Reserved instruction
	EOR $4401,Y		  ; 59 01 44 | Exclusive OR with accumulator (absolute,Y)
	REP #$09			 ; C2 09 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	PHY				  ; 5A | Push Y register to stack
	ORA ($88,X)		  ; 01 88 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $3D			  ; 80 3D | Branch always
	ORA ($C8,X)		  ; 01 C8 | Logical OR with accumulator ((zero page,X))
	STX $1E			  ; 86 1E | Store X register to zero page
	BRA $1E			  ; 80 1E | Branch always
	JMP $430401		  ; 5C 01 04 43 | Jump to address long
	BRA $6A			  ; 80 6A | Branch always
	EOR $9B01,X		  ; 5D 01 9B | Exclusive OR with accumulator (absolute,X)
	ROR $01			  ; 66 01 | Rotate right (zero page)
	STY $C2			  ; 84 C2 | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	LSR $0401,X		  ; 5E 01 04 | Logical shift right (absolute,X)
	EOR ($05,X)		  ; 41 05 | Exclusive OR with accumulator ((zero page,X))
	EOR $015F,Y		  ; 59 5F 01 | Exclusive OR with accumulator (absolute,Y)
	CPY $43			  ; C4 43 | Compare Y register (zero page)
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_214
; Address: $D0F345
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_214:
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	EOR $0161,Y		  ; 59 61 01 | Exclusive OR with accumulator (absolute,Y)
	STY $C8			  ; 84 C8 | Store Y register to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($C8,X)		  ; 01 C8 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_215
; Address: $D0F356
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_215:
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($88,X)		  ; 01 88 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STZ $01			  ; 64 01 | Store zero to zero page
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	ADC $01			  ; 65 01 | Add with carry (zero page)
	CPY $43			  ; C4 43 | Compare Y register (zero page)
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	CPY $07			  ; C4 07 | Compare Y register (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_216
; Address: $D0F37D
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_216:
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $84			  ; 06 84 | Arithmetic shift left (zero page)
	BVC $6C			  ; 50 6C | Branch if overflow clear
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	REP #$08			 ; C2 08 | Reset processor status bits
	EOR $0167,Y		  ; 59 67 01 | Exclusive OR with accumulator (absolute,Y)
	EOR ($42,X)		  ; 41 42 | Hardware register operation
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	ADC $4B			  ; 65 4B | Add with carry (zero page)
	CMP ($42,X)		  ; C1 42 | Hardware register operation
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	ADC $C001			; 6D 01 C0 | Add with carry (absolute)
	EOR $0D			  ; 45 0D | Exclusive OR with accumulator (zero page)
	BRA $0E			  ; 80 0E | Branch always
	ROR $C001			; 6E 01 C0 | Rotate right (absolute)
	EOR $0C			  ; 45 0C | Exclusive OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))
	WDM #$06			 ; 42 06 | Reserved instruction
	BRA $59			  ; 80 59 | Branch always
	BVS $01			  ; 70 01 | Branch if overflow set
	REP #$05			 ; C2 05 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($01),Y		  ; 71 01 | Add with carry ((zero page),Y)
	CPY $0F			  ; C4 0F | Compare Y register (zero page)
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	WDM #$06			 ; 42 06 | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	WDM #$06			 ; 42 06 | Reserved instruction
	BRA $40			  ; 80 40 | Branch always
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	CMP $10			  ; C5 10 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_217
; Address: $D0F3D5
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_217:
	BRA $61			  ; 80 61 | Branch always
	LDY #$07			 ; A0 07 | Load immediate value into Y register
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	STA $0C			  ; 85 0C | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $19			  ; C5 19 | Compare accumulator (zero page)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	BRA $1E			  ; 80 1E | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	ADC $5B01,Y		  ; 79 01 5B | Add with carry (absolute,Y)
	REP #$03			 ; C2 03 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	ORA ($DB,X)		  ; 01 DB | Logical OR with accumulator ((zero page,X))
	REP #$03			 ; C2 03 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	WDM #$13			 ; 42 13 | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	JMP $870184		  ; 5C 84 01 87 | Jump to address long
	EOR $0186,Y		  ; 59 86 01 | Exclusive OR with accumulator (absolute,Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	REP #$0F			 ; C2 0F | Reset processor status bits
	BRA $49			  ; 80 49 | Branch always
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	EOR ($10,X)		  ; 41 10 | Exclusive OR with accumulator ((zero page,X))
	BRA $59			  ; 80 59 | Branch always
	BRA $01			  ; 80 01 | Branch always
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	EOR $0181,Y		  ; 59 81 01 | Exclusive OR with accumulator (absolute,Y)
	ORA ($42,X)		  ; 01 42 | Hardware register operation
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($45,X)		  ; 01 45 | Logical OR with accumulator ((zero page,X))
	BRA $5C			  ; 80 5C | Branch always
	DEY				  ; 88 | Decrement Y register
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	STA $C701			; 8D 01 C7 | Audio system operation
	EOR ($0A,X)		  ; 41 0A | Exclusive OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	BIT #$01			 ; 89 01 | Test bits in accumulator (immediate)
	REP #$10			 ; C2 10 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank20_AudioFunction_218
; Address: $D0F45A
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_218:
	BRA $5A			  ; 80 5A | Branch always
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	EOR $018C,Y		  ; 59 8C 01 | Exclusive OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $01			  ; 90 01 | Branch if carry clear
	STZ $4701			; 9C 01 47 | Store zero to absolute
	CMP #$14			 ; C9 14 | Compare accumulator (immediate)
	BRA $5F			  ; 80 5F | Branch always
	STA ($01),Y		  ; 91 01 | Audio system operation
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	BVC $94			  ; 50 94 | Branch if overflow clear
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	BRA $6C			  ; 80 6C | Branch always
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	WDM #$06			 ; 42 06 | Reserved instruction
	BRA $5C			  ; 80 5C | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	STA $C701,Y		  ; 99 01 C7 | Audio system operation
	REP #$09			 ; C2 09 | Reset processor status bits
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA ($8A,X)		  ; 01 8A | Logical OR with accumulator ((zero page,X))
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	ADC ($9B),Y		  ; 71 9B | Add with carry ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $18			  ; 80 18 | Branch always
	STX $4101			; 8E 01 41 | Store X register to absolute address
	PHP				  ; 08 | Push processor status to stack
	BRA $37			  ; 80 37 | Branch always
	STA $44E001		  ; 8F 01 E0 44 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_219
; Address: $D0F4D3
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_219:
	STA $C001,X		  ; 9D 01 C0 | Audio system operation
	DEC $16			  ; C6 16 | Decrement (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	STZ $1001,X		  ; 9E 01 10 | Store zero to absolute,X
	BRA $52			  ; 80 52 | Branch always
	WDM #$00			 ; 42 00 | Reserved instruction
	TXA				  ; 8A | Transfer X register to accumulator
	STX $07			  ; 86 07 | Store X register to zero page
	JMP ($019F)		  ; 6C 9F 01 | Jump to address (absolute indirect)
	BRA $2F			  ; 80 2F | Branch always
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	BMI $A1			  ; 30 A1 | Branch if negative
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STY $2E			  ; 84 2E | Store Y register to zero page
	LDX #$01			 ; A2 01 | Load immediate value into X register
	STA ($43,X)		  ; 81 43 | Audio system operation
	ORA #$84			 ; 09 84 | Logical OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDY $01			  ; A4 01 | Load from zero page into Y register
	CMP ($43,X)		  ; C1 43 | Compare accumulator ((zero page,X))
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	LDA $01			  ; A5 01 | Audio system operation
	CMP ($C9,X)		  ; C1 C9 | Compare accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	LSR $01A6			; 4E A6 01 | Logical shift right (absolute)
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STY $5B			  ; 84 5B | Store Y register to zero page
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	EOR #$09			 ; 49 09 | Exclusive OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	CMP #$0B			 ; C9 0B | Compare accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	BPL $04			  ; 10 04 | Branch if positive
	BVS $AC			  ; 70 AC | Branch if overflow set
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDA $C101			; AD 01 C1 | Audio system operation
	EOR #$10			 ; 49 10 | Exclusive OR with accumulator (immediate)
	BRA $42			  ; 80 42 | Hardware register operation
	LDX $C101			; AE 01 C1 | Load from absolute address into X register
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BRA $3A			  ; 80 3A | Branch always
	LDA $43E001		  ; AF 01 E0 43 | Audio system operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_21A
; Address: $D0F549
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_21A:
	PLA				  ; 68 | Pull accumulator from stack
	BCS $01			  ; B0 01 | Branch if carry set
	LSR				  ; 4A | Logical shift right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	LDA ($01),Y		  ; B1 01 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	INY				  ; C8 | Increment Y register
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $53			  ; 80 53 | Branch always
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	ORA $C3			  ; 05 C3 | Logical OR with accumulator (zero page)
	ASL $7200			; 0E 00 72 | Arithmetic shift left (absolute)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	BRA $59			  ; 80 59 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	ORA $7200			; 0D 00 72 | Logical OR with accumulator (absolute)
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	WDM #$05			 ; 42 05 | Reserved instruction
	EOR $01B8,Y		  ; 59 B8 01 | Exclusive OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	LDA $8501,Y		  ; B9 01 85 | Audio system operation
	LSR $11			  ; 46 11 | Logical shift right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	TSX				  ; BA | Transfer stack pointer to X register
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	CMP $0B			  ; C5 0B | Compare accumulator (zero page)
	BRA $5B			  ; 80 5B | Branch always
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	BRA $71			  ; 80 71 | Branch always
	LDA $4701,X		  ; BD 01 47 | Audio system operation
	ORA ($BE,X)		  ; 01 BE | Logical OR with accumulator ((zero page,X))
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	LDY $8001,X		  ; BC 01 80 | Load from absolute,X into Y register
	LSR $14			  ; 46 14 | Logical shift right (zero page)
	LDA				  ; BF 01 C0 C4 | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	BRA $6A			  ; 80 6A | Branch always
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_21B
; Address: $D0F5C4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_21B:
	DEX				  ; CA | Decrement X register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	WDM #$06			 ; 42 06 | Reserved instruction
	CMP $01			  ; C5 01 | Compare accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ROR $01C6			; 6E C6 01 | Rotate right (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_21C
; Address: $D0F5DE
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_21C:
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	WDM #$06			 ; 42 06 | Reserved instruction
	STZ $55			  ; 64 55 | Store zero to zero page
	CPY #$CA			 ; C0 CA | Compare Y register (immediate)
	STX $00			  ; 86 00 | Store X register to zero page
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	LDY #$47			 ; A0 47 | Load immediate value into Y register
	DEX				  ; CA | Decrement X register
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ASL $6800			; 0E 00 68 | Arithmetic shift left (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPY $4701			; CC 01 47 | Compare Y register (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BIT $01CD			; 2C CD 01 | Test bits in accumulator (absolute)
	STA $C3			  ; 85 C3 | Audio system operation
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	EOR $01CE,Y		  ; 59 CE 01 | Exclusive OR with accumulator (absolute,Y)
	LDY #$0B			 ; A0 0B | Load immediate value into Y register
	ORA $6800,Y		  ; 19 00 68 | Logical OR with accumulator (absolute,Y)
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $0A			  ; 80 0A | Branch always
	BNE $01			  ; D0 01 | Branch if not equal
	STA ($47,X)		  ; 81 47 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	CMP ($01),Y		  ; D1 01 | Compare accumulator ((zero page),Y)
	CMP ($47,X)		  ; C1 47 | Compare accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	LSR $01D4,X		  ; 5E D4 01 | Logical shift right (absolute,X)
	EOR ($C8,X)		  ; 41 C8 | Exclusive OR with accumulator ((zero page,X))
	BRA $51			  ; 80 51 | Branch always

;------------------------------------------------------------------------------
; Bank20_AudioFunction_21D
; Address: $D0F647
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_21D:
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	BRA $42			  ; 80 42 | Hardware register operation
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	CMP #$15			 ; C9 15 | Compare accumulator (immediate)
	JMP $0101D9		  ; 5C D9 01 01 | Jump to address long
	ORA $2680			; 0D 80 26 | Logical OR with accumulator (absolute)
	PHX				  ; DA | Push X register to stack
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	JMP $0006			; 4C 06 00 | Jump to address
	ORA ($E8,X)		  ; 01 E8 | Logical OR with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	CPY $0F			  ; C4 0F | Compare Y register (zero page)
	BRA $5B			  ; 80 5B | Branch always
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	CMP ($CA,X)		  ; C1 CA | Compare accumulator ((zero page,X))
	ASL $01EB			; 0E EB 01 | Arithmetic shift left (absolute)
	EOR ($C4,X)		  ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
	BRA $29			  ; 80 29 | Branch always
	CPX $0101			; EC 01 01 | Compare X register (absolute)
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	JMP $8101DC		  ; 5C DC 01 81 | Jump to address long
	REP #$24			 ; C2 24 | Reset processor status bits
	CMP $8101,X		  ; DD 01 81 | Compare accumulator (absolute,X)
	ORA $5D00			; 0D 00 5D | Logical OR with accumulator (absolute)
	DEC $4101,X		  ; DE 01 41 | Decrement (absolute,X)
	REP #$08			 ; C2 08 | Reset processor status bits
	BRA $02			  ; 80 02 | Branch always
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	EOR $01E1,Y		  ; 59 E1 01 | Exclusive OR with accumulator (absolute,Y)
	STA ($45,X)		  ; 81 45 | Audio system operation
	ASL $2B80			; 0E 80 2B | Arithmetic shift left (absolute)
	SEP #$01			 ; E2 01 | Set processor status bits
	STA ($45,X)		  ; 81 45 | Audio system operation
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CPX $01			  ; E4 01 | Compare X register (zero page)
	STA ($4B,X)		  ; 81 4B | Audio system operation
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	SBC $01			  ; E5 01 | Subtract with carry (zero page)
	ORA ($C3,X)		  ; 01 C3 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	INC $01			  ; E6 01 | Increment (zero page)
	CMP ($C4,X)		  ; C1 C4 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_21E
; Address: $D0F6C3
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_21E:
	PLA				  ; 68 | Pull accumulator from stack
	NOP				  ; EA | No operation
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	SBC $C101			; ED 01 C1 | Subtract with carry (absolute)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PHY				  ; 5A | Push Y register to stack
	INC $0101			; EE 01 01 | Increment (absolute)
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $01			  ; F0 01 | Branch if equal
	ORA ($43,X)		  ; 01 43 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	EOR $01F4,Y		  ; 59 F4 01 | Exclusive OR with accumulator (absolute,Y)
	EOR ($43,X)		  ; 41 43 | Exclusive OR with accumulator ((zero page,X))
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	EOR $01F7,Y		  ; 59 F7 01 | Exclusive OR with accumulator (absolute,Y)
	CPY $19			  ; C4 19 | Compare Y register (zero page)
	BRA $5A			  ; 80 5A | Branch always
	SED				  ; F8 | Set decimal mode flag
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	ORA $6A80,Y		  ; 19 80 6A | Logical OR with accumulator (absolute,Y)
	SBC $9B01,Y		  ; F9 01 9B | Subtract with carry (absolute,Y)
	CPY $14			  ; C4 14 | Compare Y register (zero page)
	PLX				  ; FA | Pull X register from stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CMP $0018			; CD 18 00 | Compare accumulator (absolute)
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	EOR #$26			 ; 49 26 | Exclusive OR with accumulator (immediate)
	ORA ($5B,X)		  ; 01 5B | Logical OR with accumulator ((zero page,X))
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	CMP #$1F			 ; C9 1F | Compare accumulator (immediate)
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	SBC $C101,X		  ; FD 01 C1 | Subtract with carry (absolute,X)
	LSR $0E			  ; 46 0E | Logical shift right (zero page)
	BRA $28			  ; 80 28 | Branch always
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	EOR ($CA,X)		  ; 41 CA | Exclusive OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR ($C7,X)		  ; 41 C7 | Exclusive OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	BPL $02			  ; 10 02 | Branch if positive
	EOR ($4D,X)		  ; 41 4D | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_21F
; Address: $D0F73F
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_21F:
	ASL $6800			; 0E 00 68 | Arithmetic shift left (absolute)
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	BRA $5B			  ; 80 5B | Branch always
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	CMP ($45,X)		  ; C1 45 | Compare accumulator ((zero page,X))
	CMP ($48,X)		  ; C1 48 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $0213,Y		  ; 59 13 02 | Exclusive OR with accumulator (absolute,Y)
	STA ($4A,X)		  ; 81 4A | Audio system operation
	PHY				  ; 5A | Push Y register to stack
	EOR ($4C,X)		  ; 41 4C | Exclusive OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	EOR ($D0,X)		  ; 41 D0 | Exclusive OR with accumulator ((zero page,X))
	ASL $5400			; 0E 00 54 | Arithmetic shift left (absolute)
	STA ($C3,X)		  ; 81 C3 | Audio system operation
	BRA $23			  ; 80 23 | Branch always
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	ORA ($C3,X)		  ; 01 C3 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	CMP ($44,X)		  ; C1 44 | Compare accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	ORA $8002,Y		  ; 19 02 80 | Logical OR with accumulator (absolute,Y)
	WDM #$06			 ; 42 06 | Reserved instruction
	ORA $A002,X		  ; 1D 02 A0 | Logical OR with accumulator (absolute,X)
	LSR $21			  ; 46 21 | PPU graphics register access
	PLA				  ; 68 | Pull accumulator from stack
	ASL $4102,X		  ; 1E 02 41 | Arithmetic shift left (absolute,X)
	BRA $42			  ; 80 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank20_AudioFunction_220
; Address: $D0F79D
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_220:
	JSR $C102			; 20 02 C1 | Jump to subroutine
	CPY $0019			; CC 19 00 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	AND ($02,X)		  ; 21 02 | Logical AND with accumulator ((zero page,X))
	EOR ($C4,X)		  ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
	AND $22			  ; 25 22 | Logical AND with accumulator (zero page)
	ORA ($C4,X)		  ; 01 C4 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($CA,X)		  ; C1 CA | Compare accumulator ((zero page,X))
	EOR $0224,Y		  ; 59 24 02 | Exclusive OR with accumulator (absolute,Y)
	CMP ($C4,X)		  ; C1 C4 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $09			  ; 80 09 | Branch always
	ROL $02			  ; 26 02 | Rotate left (zero page)
	ORA ($CD,X)		  ; 01 CD | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA #$27			 ; 09 27 | Logical OR with accumulator (immediate)
	ORA ($C4,X)		  ; 01 C4 | Logical OR with accumulator ((zero page,X))
	ORA $6800,X		  ; 1D 00 68 | Logical OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_221
; Address: $D0F7D2
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_221:
	PHP				  ; 08 | Push processor status to stack
	BRA $6A			  ; 80 6A | Branch always
	EOR ($C2,X)		  ; 41 C2 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $34			  ; 80 34 | Branch always
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	BRA $46			  ; 80 46 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $022C,Y		  ; 59 2C 02 | Exclusive OR with accumulator (absolute,Y)
	CPY #$C5			 ; C0 C5 | Compare Y register (immediate)
	BRA $5B			  ; 80 5B | Branch always
	AND $8002			; 2D 02 80 | Logical AND with accumulator (absolute)
	EOR $06			  ; 45 06 | Exclusive OR with accumulator (zero page)
	BRA $6D			  ; 80 6D | Branch always
	ROL $8402			; 2E 02 84 | Rotate left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BRA $44			  ; 80 44 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BMI $02			  ; 30 02 | Branch if negative
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	AND ($02),Y		  ; 31 02 | Logical AND with accumulator ((zero page),Y)
	STY $43			  ; 84 43 | Store Y register to zero page
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	EOR $0233,X		  ; 5D 33 02 | Exclusive OR with accumulator (absolute,X)
	STY $C3			  ; 84 C3 | Store Y register to zero page
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	ORA #$48			 ; 09 48 | Logical OR with accumulator (immediate)
	STY $C3			  ; 84 C3 | Store Y register to zero page
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	ROR $0236			; 6E 36 02 | Rotate right (absolute)
	CPY $42			  ; C4 42 | Hardware register operation
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$06			 ; 42 06 | Reserved instruction
	SEC				  ; 38 | Set carry flag
	CPY #$C4			 ; C0 C4 | Compare Y register (immediate)
	AND $4002,Y		  ; 39 02 40 | Logical AND with accumulator (absolute,Y)
	CMP $07			  ; C5 07 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_222
; Address: $D0F852
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_222:
	PLA				  ; 68 | Pull accumulator from stack
	DEC				  ; 3A | Decrement accumulator
	CPY #$C5			 ; C0 C5 | Compare Y register (immediate)
	REP #$04			 ; C2 04 | Reset processor status bits
	BRA $00			  ; 80 00 | Branch always
	CMP $04			  ; C5 04 | Compare accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	AND $8002,X		  ; 3D 02 80 | Logical AND with accumulator (absolute,X)
	EOR $0D			  ; 45 0D | Exclusive OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ROL $C002,X		  ; 3E 02 C0 | Rotate left (absolute,X)
	REP #$06			 ; C2 06 | Reset processor status bits
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($02,X)		  ; 41 02 | Exclusive OR with accumulator ((zero page,X))
	BRA $88			  ; 80 88 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BRA $42			  ; 80 42 | Hardware register operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $0244,Y		  ; 59 44 02 | Exclusive OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	BRA $5A			  ; 80 5A | Branch always
	EOR $02			  ; 45 02 | Exclusive OR with accumulator (zero page)
	DEC $08			  ; C6 08 | Decrement (zero page)
	BRA $4A			  ; 80 4A | Branch always
	LSR $02			  ; 46 02 | Logical shift right (zero page)
	BRA $44			  ; 80 44 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_223
; Address: $D0F8B0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_223:
	JSR $0E84			; 20 84 0E | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	EOR #$02			 ; 49 02 | Exclusive OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR ($44,X)		  ; 41 44 | Exclusive OR with accumulator ((zero page,X))
	ORA $5680			; 0D 80 56 | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	CPX #$83			 ; E0 83 | Compare X register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	TXA				  ; 8A | Transfer X register to accumulator
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_224
; Address: $D0F8D1
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_224:
	JMP $0002			; 4C 02 00 | Jump to address
	STA $6800,Y		  ; 99 00 68 | Audio system operation
	EOR $4102			; 4D 02 41 | Exclusive OR with accumulator (absolute)
	DEC $0A			  ; C6 0A | Decrement (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	CMP ($C6,X)		  ; C1 C6 | Compare accumulator ((zero page,X))
	BRA $5D			  ; 80 5D | Branch always
	BVC $02			  ; 50 02 | Branch if overflow clear
	ORA ($CF,X)		  ; 01 CF | Logical OR with accumulator ((zero page,X))
	BPL $80			  ; 10 80 | Branch if positive
	AND $0251,X		  ; 3D 51 02 | Logical AND with accumulator (absolute,X)
	STA ($CF,X)		  ; 81 CF | Audio system operation
	BPL $80			  ; 10 80 | Branch if positive
	EOR $0252,Y		  ; 59 52 02 | Exclusive OR with accumulator (absolute,Y)
	DEX				  ; CA | Decrement X register
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	ROR $0254			; 6E 54 02 | Rotate right (absolute)
	CMP ($CA,X)		  ; C1 CA | Compare accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	EOR ($47,X)		  ; 41 47 | Exclusive OR with accumulator ((zero page,X))
	STA ($49,X)		  ; 81 49 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($C3,X)		  ; 01 C3 | Logical OR with accumulator ((zero page,X))
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	ROL $0259,X		  ; 3E 59 02 | Rotate left (absolute,X)
	CMP ($C5,X)		  ; C1 C5 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC ($5A,X)		  ; 61 5A | Add with carry ((zero page,X))
	CMP ($45,X)		  ; C1 45 | Compare accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($46,X)		  ; 01 46 | Logical OR with accumulator ((zero page,X))
	BRA $5B			  ; 80 5B | Branch always
	JMP $444102		  ; 5C 02 41 44 | Jump to address long
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_225
; Address: $D0F935
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_225:
	CMP ($43,X)		  ; C1 43 | Compare accumulator ((zero page,X))
	ASL $4F00			; 0E 00 4F | Arithmetic shift left (absolute)
	LSR $8102,X		  ; 5E 02 81 | Logical shift right (absolute,X)
	EOR #$08			 ; 49 08 | Exclusive OR with accumulator (immediate)
	CMP ($42,X)		  ; C1 42 | Hardware register operation
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	ADC ($02,X)		  ; 61 02 | Add with carry ((zero page,X))
	BVS $48			  ; 70 48 | Branch if overflow set
	ASL $6800			; 0E 00 68 | Arithmetic shift left (absolute)
	ROR $02			  ; 66 02 | Rotate right (zero page)
	BPL $48			  ; 10 48 | Branch if positive
	ASL $4580			; 0E 80 45 | Arithmetic shift left (absolute)
	ADC #$02			 ; 69 02 | Add with carry (immediate)
	BPL $48			  ; 10 48 | Branch if positive

;------------------------------------------------------------------------------
; Bank20_AudioFunction_226
; Address: $D0F95B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_226:
	BRA $5B			  ; 80 5B | Branch always
	ROR				  ; 6A | Rotate right (accumulator)
	BVC $48			  ; 50 48 | Branch if overflow clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank20_AudioFunction_227
; Address: $D0F966
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_227:
	BPL $C8			  ; 10 C8 | Branch if positive
	JMP ($5002)		  ; 6C 02 50 | Jump to address (absolute indirect)
	INY				  ; C8 | Increment Y register
	BRA $5B			  ; 80 5B | Branch always
	ADC $5002			; 6D 02 50 | Add with carry (absolute)
	BRA $22			  ; 80 22 | Branch always
	BVC $C5			  ; 50 C5 | Branch if overflow clear
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $0002			; 6E 02 00 | Rotate right (absolute)
	INY				  ; C8 | Increment Y register
	BPL $06			  ; 10 06 | Branch if positive
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	ADC ($02,X)		  ; 61 02 | Add with carry ((zero page,X))
	STA ($47,X)		  ; 81 47 | Audio system operation
	BRA $14			  ; 80 14 | Branch always
	BVS $02			  ; 70 02 | Branch if overflow set
	STA ($C6,X)		  ; 81 C6 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($02),Y		  ; 71 02 | Add with carry ((zero page),Y)
	CMP ($C6,X)		  ; C1 C6 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $48			  ; 80 48 | Branch always
	STA ($C6,X)		  ; 81 C6 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($C6,X)		  ; C1 C6 | Compare accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($44,X)		  ; 41 44 | Exclusive OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($C4,X)		  ; 01 C4 | Logical OR with accumulator ((zero page,X))
	ORA $5B00,X		  ; 1D 00 5B | Logical OR with accumulator (absolute,X)
	STY $0102			; 8C 02 01 | Store Y register to absolute address
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHY				  ; 5A | Push Y register to stack
	EOR ($48,X)		  ; 41 48 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CMP ($C4,X)		  ; C1 C4 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_228
; Address: $D0F9D3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_228:
	JSR $0284			; 20 84 02 | Jump to subroutine
	BRA $C2			  ; 80 C2 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_229
; Address: $D0F9DD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_229:
	EOR ($C4,X)		  ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
	BRA $04			  ; 80 04 | Branch always
	STA ($02),Y		  ; 91 02 | Audio system operation
	ORA ($C4,X)		  ; 01 C4 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_22A
; Address: $D0F9E6
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_22A:
	JSR $5F00			; 20 00 5F | Jump to subroutine
	EOR ($C4,X)		  ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	STX $0702			; 8E 02 07 | Store X register to absolute address
	CPY $0F			  ; C4 0F | Compare Y register (zero page)
	BRA $47			  ; 80 47 | Branch always
	ORA $C5			  ; 05 C5 | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	PLA				  ; 68 | Pull accumulator from stack
	EOR $1C			  ; 45 1C | Exclusive OR with accumulator (zero page)
	EOR $0295,Y		  ; 59 95 02 | Exclusive OR with accumulator (absolute,Y)
	CMP $C4			  ; C5 C4 | Compare accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $5B			  ; 80 5B | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	STA $E102,Y		  ; 99 02 E1 | Audio system operation
	TXS				  ; 9A | Transfer X register to stack pointer
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	JMP $E1029B		  ; 5C 9B 02 E1 | Jump to address long
	STZ $E102			; 9C 02 E1 | Store zero to absolute
	BRA $3C			  ; 80 3C | Branch always
	STA $0002,X		  ; 9D 02 00 | Audio system operation
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	STZ $E102,X		  ; 9E 02 E1 | Store zero to absolute,X
	EOR $029F,Y		  ; 59 9F 02 | Exclusive OR with accumulator (absolute,Y)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $3D			  ; 80 3D | Branch always
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	ORA $A1			  ; 05 A1 | Logical OR with accumulator (zero page)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	LDX #$02			 ; A2 02 | Load immediate value into X register
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $1B			  ; 80 1B | Branch always
	LDY $02			  ; A4 02 | Load from zero page into Y register
	STA ($45,X)		  ; 81 45 | Audio system operation
	ASL $6800			; 0E 00 68 | Arithmetic shift left (absolute)
	LDA $02			  ; A5 02 | Audio system operation
	CMP ($45,X)		  ; C1 45 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_22B
; Address: $D0FA79
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_22B:
	ASL $1280			; 0E 80 12 | Arithmetic shift left (absolute)
	LDX $02			  ; A6 02 | Load from zero page into X register
	LDY #$82			 ; A0 82 | Load immediate value into Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	EOR $02A8,Y		  ; 59 A8 02 | Exclusive OR with accumulator (absolute,Y)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $3B			  ; 80 3B | Branch always
	LDA #$02			 ; A9 02 | Audio system operation
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $3E			  ; 80 3E | Branch always
	TAX				  ; AA | Transfer accumulator to X register
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	EOR $02AB			; 4D AB 02 | Exclusive OR with accumulator (absolute)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	LDY $E102			; AC 02 E1 | Load from absolute address into Y register
	BRA $5A			  ; 80 5A | Branch always
	LDA $E102			; AD 02 E1 | Audio system operation
	LDX $E102			; AE 02 E1 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_22C
; Address: $D0FABA
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_22C:
	JSR $02AF			; 20 AF 02 | Jump to subroutine
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	BCS $02			  ; B0 02 | Branch if carry set
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $18			  ; 80 18 | Branch always
	LDA ($02),Y		  ; B1 02 | Audio system operation
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $2C			  ; 80 2C | Branch always
	STA ($44,X)		  ; 81 44 | Audio system operation
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BMI $B3			  ; 30 B3 | Branch if negative
	EOR ($C6,X)		  ; 41 C6 | Exclusive OR with accumulator ((zero page,X))
	BRA $6A			  ; 80 6A | Branch always
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $02B5,X		  ; 1E B5 02 | Arithmetic shift left (absolute,X)
	EOR ($48,X)		  ; 41 48 | Exclusive OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $59			  ; 80 59 | Branch always
	BRA $44			  ; 80 44 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	DEC $07			  ; C6 07 | Decrement (zero page)
	CLV				  ; B8 | Clear overflow flag
	DEC $0F			  ; C6 0F | Decrement (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	LDA $E102,Y		  ; B9 02 E1 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_22D
; Address: $D0FB08
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_22D:
	TSX				  ; BA | Transfer stack pointer to X register
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $3B			  ; 80 3B | Branch always
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	ASL $02BC,X		  ; 1E BC 02 | Arithmetic shift left (absolute,X)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	LDA $E102,X		  ; BD 02 E1 | Audio system operation
	BRA $5B			  ; 80 5B | Branch always
	LDX $E102,Y		  ; BE 02 E1 | Load from absolute,Y into X register
	LDA				  ; BF 02 E1 DF | Load from absolute long,X into accumulator
	BRA $6A			  ; 80 6A | Branch always
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $4F			  ; 80 4F | Branch always
	CMP ($02,X)		  ; C1 02 | Compare accumulator ((zero page,X))
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	ADC $02C2			; 6D C2 02 | Add with carry (absolute)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $30			  ; 80 30 | Branch always
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $59			  ; 80 59 | Branch always
	CPY $02			  ; C4 02 | Compare Y register (zero page)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	CMP $02			  ; C5 02 | Compare accumulator (zero page)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	LSR $02C6,X		  ; 5E C6 02 | Logical shift right (absolute,X)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $5B			  ; 80 5B | Branch always
	INY				  ; C8 | Increment Y register
	EOR ($C9,X)		  ; 41 C9 | Exclusive OR with accumulator ((zero page,X))
	AND $02C9			; 2D C9 02 | Logical AND with accumulator (absolute)
	ORA ($C6,X)		  ; 01 C6 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	CMP ($C2,X)		  ; C1 C2 | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $CB			  ; 45 CB | Exclusive OR with accumulator (zero page)
	BRA $CA			  ; 80 CA | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY $0002			; CC 02 00 | Compare Y register (absolute)
	CMP $2002			; CD 02 20 | Compare accumulator (absolute)
	EOR #$10			 ; 49 10 | Exclusive OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	DEC $2002			; CE 02 20 | Decrement (absolute)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	LDY #$83			 ; A0 83 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	BNE $02			  ; D0 02 | Branch if not equal
	LDY #$86			 ; A0 86 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank20_AudioFunction_22E
; Address: $D0FB9F
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_22E:
	PHP				  ; 08 | Push processor status to stack
	CMP ($02),Y		  ; D1 02 | Compare accumulator ((zero page),Y)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $5B			  ; 80 5B | Branch always
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $6A			  ; 80 6A | Branch always
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $3A			  ; 80 3A | Branch always
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $40			  ; 80 40 | Branch always
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $50			  ; 80 50 | Branch always
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	EOR $02D9,Y		  ; 59 D9 02 | Exclusive OR with accumulator (absolute,Y)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	PHX				  ; DA | Push X register to stack
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	INC				  ; 1A | Increment accumulator
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $53			  ; 80 53 | Branch always
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $42			  ; 80 42 | Hardware register operation
	CMP $E102,X		  ; DD 02 E1 | Compare accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	DEC $E102,X		  ; DE 02 E1 | Decrement (absolute,X)
	BRA $4A			  ; 80 4A | Branch always
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $5A			  ; 80 5A | Branch always
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $50			  ; 80 50 | Branch always
	SBC ($02,X)		  ; E1 02 | Subtract with carry ((zero page,X))
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	EOR $02E2			; 4D E2 02 | Exclusive OR with accumulator (absolute)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	EOR $02E3,Y		  ; 59 E3 02 | Exclusive OR with accumulator (absolute,Y)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $42			  ; 80 42 | Hardware register operation
	CPX $02			  ; E4 02 | Compare X register (zero page)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $4C			  ; 80 4C | Branch always
	SBC $02			  ; E5 02 | Subtract with carry (zero page)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	INC $02			  ; E6 02 | Increment (zero page)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $48			  ; 80 48 | Branch always

;------------------------------------------------------------------------------
; Bank20_AudioFunction_22F
; Address: $D0FC3E
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_22F:
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	INX				  ; E8 | Increment X register
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	SBC #$02			 ; E9 02 | Subtract with carry (immediate)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	NOP				  ; EA | No operation
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	CPX $E102			; EC 02 E1 | Compare X register (absolute)
	BRA $37			  ; 80 37 | Branch always
	SBC $E102			; ED 02 E1 | Subtract with carry (absolute)
	BRA $34			  ; 80 34 | Branch always
	INC $E102			; EE 02 E1 | Increment (absolute)
	EOR $02EF,Y		  ; 59 EF 02 | Exclusive OR with accumulator (absolute,Y)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	BRA $43			  ; 80 43 | Branch always
	BEQ $02			  ; F0 02 | Branch if equal
	ORA ($C6,X)		  ; 01 C6 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND ($F1),Y		  ; 31 F1 | Logical AND with accumulator ((zero page),Y)
	EOR ($C6,X)		  ; 41 C6 | Exclusive OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	RTI				  ; 40 | Return from interrupt
	CMP $09			  ; C5 09 | Compare accumulator (zero page)
	EOR $F3			  ; 45 F3 | Exclusive OR with accumulator (zero page)
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	LSR $F4			  ; 46 F4 | Logical shift right (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_230
; Address: $D0FC9F
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_230:
	JSR $0401			; 20 01 04 | Jump to subroutine
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	CMP ($0F,X)		  ; C1 0F | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ADC $C101,X		  ; 7D 01 C1 | Add with carry (absolute,X)
	CMP ($0F,X)		  ; C1 0F | Compare accumulator ((zero page,X))
	BVC $01			  ; 50 01 | Branch if overflow clear
	ROR $8501,X		  ; 7E 01 85 | Rotate right (absolute,X)
	EOR ($0E,X)		  ; 41 0E | Exclusive OR with accumulator ((zero page,X))
	ORA $8300,Y		  ; 19 00 83 | Logical OR with accumulator (absolute,Y)
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	WDM #$04			 ; 42 04 | Reserved instruction
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STA $01			  ; 85 01 | Audio system operation
	REP #$05			 ; C2 05 | Reset processor status bits
	PEA #$8B01		   ; F4 01 8B | Push effective address to stack

;------------------------------------------------------------------------------
; Bank20_AudioFunction_231
; Address: $D0FCD0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_231:
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDA #$01			 ; A9 01 | Audio system operation
	EOR $C3			  ; 45 C3 | Exclusive OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ROL $02			  ; 26 02 | Rotate left (zero page)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	CMP ($0C,X)		  ; C1 0C | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank20_AudioFunction_232
; Address: $D0FCF5
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_232:
	JSR $DF01			; 20 01 DF | Jump to subroutine
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	WDM #$11			 ; 42 11 | Reserved instruction
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY $0008			; CC 08 00 | Compare Y register (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank20_AudioFunction_233
; Address: $D0FD0E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_233:
	ORA ($F2,X)		  ; 01 F2 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY $1F			  ; C4 1F | Compare Y register (zero page)
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	EOR ($C4,X)		  ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CMP ($44,X)		  ; C1 44 | Compare accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	EOR ($47,X)		  ; 41 47 | Exclusive OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	ORA $C102			; 0D 02 C1 | Logical OR with accumulator (absolute)
	EOR #$09			 ; 49 09 | Exclusive OR with accumulator (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $8102			; 0E 02 81 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	EOR ($C4,X)		  ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank20_AudioFunction_234
; Address: $D0FD4F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_234:
	INC				  ; 1A | Increment accumulator
	ORA ($C4,X)		  ; 01 C4 | Logical OR with accumulator ((zero page,X))
	ASL $C000			; 0E 00 C0 | Arithmetic shift left (absolute)
	EOR ($CD,X)		  ; 41 CD | Exclusive OR with accumulator ((zero page,X))
	ASL $F800			; 0E 00 F8 | Arithmetic shift left (absolute)
	STA ($C3,X)		  ; 81 C3 | Audio system operation
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	LSR $0102			; 4E 02 01 | Logical shift right (absolute)
	DEC $0A			  ; C6 0A | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_235
; Address: $D0FD6D
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_235:
	JSR $5300			; 20 00 53 | Jump to subroutine
	STA ($C9,X)		  ; 81 C9 | Audio system operation
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	ORA ($C6,X)		  ; 01 C6 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	EOR $0102,X		  ; 5D 02 01 | Exclusive OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	LDX $6201			; AE 01 62 | Load from absolute address into X register
	CMP ($C8,X)		  ; C1 C8 | Compare accumulator ((zero page,X))
	ORA $F800			; 0D 00 F8 | Logical OR with accumulator (absolute)
	STZ $02			  ; 64 02 | Store zero to zero page
	BVC $C8			  ; 50 C8 | Branch if overflow clear
	ASL $C000			; 0E 00 C0 | Arithmetic shift left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($C4,X)		  ; 01 C4 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	BRA $00			  ; 80 00 | Branch always
	STA $8102			; 8D 02 81 | Audio system operation
	CPY $1A			  ; C4 1A | Compare Y register (zero page)
	STZ $8F02,X		  ; 9E 02 8F | Store zero to absolute,X
	EOR ($44,X)		  ; 41 44 | Exclusive OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PEA #$9701		   ; F4 01 97 | Push effective address to stack
	STA $012447		  ; 8F 47 24 01 | Audio system operation
	TSX				  ; BA | Transfer stack pointer to X register
	STA $0094C3		  ; 8F C3 94 00 | Audio system operation
	LDY $4F0B,X		  ; BC 0B 4F | Load from absolute,X into Y register
	LDA $070B,X		  ; BD 0B 07 | Audio system operation
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	JMP ($4700)		  ; 6C 00 47 | Jump to address (absolute indirect)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	JMP ($C700)		  ; 6C 00 C7 | Jump to address (absolute indirect)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	JMP ($8500)		  ; 6C 00 85 | Jump to address (absolute indirect)
	WDM #$05			 ; 42 05 | Reserved instruction
	JMP ($C500)		  ; 6C 00 C5 | Jump to address (absolute indirect)
	REP #$05			 ; C2 05 | Reset processor status bits
	JMP ($4400)		  ; 6C 00 44 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_236
; Address: $D0FDF1
; Size: 122 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_236:
	WDM #$05			 ; 42 05 | Reserved instruction
	JMP ($0700)		  ; 6C 00 07 | Jump to address (absolute indirect)
	JMP ($0700)		  ; 6C 00 07 | Jump to address (absolute indirect)
	LSR $04			  ; 46 04 | Logical shift right (zero page)
	JMP ($8700)		  ; 6C 00 87 | Jump to address (absolute indirect)
	JMP ($0A00)		  ; 6C 00 0A | Jump to address (absolute indirect)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ROR $4A00,X		  ; 7E 00 4A | Rotate right (absolute,X)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ROR $8A00,X		  ; 7E 00 8A | Rotate right (absolute,X)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ROR $8700,X		  ; 7E 00 87 | Rotate right (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	JMP ($8400)		  ; 6C 00 84 | Jump to address (absolute indirect)
	JMP ($8400)		  ; 6C 00 84 | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	JMP ($0700)		  ; 6C 00 07 | Jump to address (absolute indirect)
	JMP ($4700)		  ; 6C 00 47 | Jump to address (absolute indirect)
	JMP ($4400)		  ; 6C 00 44 | Jump to address (absolute indirect)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	JMP ($CA00)		  ; 6C 00 CA | Jump to address (absolute indirect)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR $0A00,X		  ; 7E 00 0A | Rotate right (absolute,X)
	STY $06			  ; 84 06 | Store Y register to zero page
	ROR $4700,X		  ; 7E 00 47 | Rotate right (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	JMP ($1B00)		  ; 6C 00 1B | Jump to address (absolute indirect)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $0A0F,X		  ; 9D 0F 0A | Audio system operation
	STY $06			  ; 84 06 | Store Y register to zero page
	ROR $5800,X		  ; 7E 00 58 | Rotate right (absolute,X)
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY $0E			  ; C4 0E | Compare Y register (zero page)
	ORA $07C7,Y		  ; 19 C7 07 | Logical OR with accumulator (absolute,Y)
	ORA $07C7,Y		  ; 19 C7 07 | Logical OR with accumulator (absolute,Y)
	STA $9B0F,X		  ; 9D 0F 9B | Audio system operation
	STA $C70F,X		  ; 9D 0F C7 | Audio system operation
	CMP $08			  ; C5 08 | Compare accumulator (zero page)
	JMP ($4A00)		  ; 6C 00 4A | Jump to address (absolute indirect)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR $0E00,X		  ; 7E 00 0E | Rotate right (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	DEY				  ; 88 | Decrement Y register
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	JMP ($C400)		  ; 6C 00 C4 | Jump to address (absolute indirect)
	CMP #$0E			 ; C9 0E | Compare accumulator (immediate)
	JMP ($4700)		  ; 6C 00 47 | Jump to address (absolute indirect)
	WDM #$08			 ; 42 08 | Reserved instruction
	JMP ($0700)		  ; 6C 00 07 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_237
; Address: $D0FEC3
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_237:
	CPY $05			  ; C4 05 | Compare Y register (zero page)
	JMP ($0400)		  ; 6C 00 04 | Jump to address (absolute indirect)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	JMP ($C400)		  ; 6C 00 C4 | Jump to address (absolute indirect)
	CMP $07			  ; C5 07 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	JMP ($4400)		  ; 6C 00 44 | Jump to address (absolute indirect)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	JMP ($4400)		  ; 6C 00 44 | Jump to address (absolute indirect)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	JMP ($4A00)		  ; 6C 00 4A | Jump to address (absolute indirect)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	ROR $F900,X		  ; 7E 00 F9 | Rotate right (absolute,X)
	LSR $0A			  ; 46 0A | Logical shift right (zero page)
	CLC				  ; 18 | Clear carry flag
	STA $18			  ; 85 18 | Audio system operation
	EOR $18			  ; 45 18 | Exclusive OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	JMP ($CA00)		  ; 6C 00 CA | Jump to address (absolute indirect)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ROR $8A00,X		  ; 7E 00 8A | Rotate right (absolute,X)
	ROR $0A00,X		  ; 7E 00 0A | Rotate right (absolute,X)
	STY $04			  ; 84 04 | Store Y register to zero page
	ROR $0700,X		  ; 7E 00 07 | Rotate right (absolute,X)
	EOR #$11			 ; 49 11 | Exclusive OR with accumulator (immediate)
	JMP ($4700)		  ; 6C 00 47 | Jump to address (absolute indirect)
	WDM #$06			 ; 42 06 | Reserved instruction
	JMP ($4500)		  ; 6C 00 45 | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	JMP ($0400)		  ; 6C 00 04 | Jump to address (absolute indirect)
	EOR #$0F			 ; 49 0F | Exclusive OR with accumulator (immediate)
	JMP ($0400)		  ; 6C 00 04 | Jump to address (absolute indirect)
	JMP ($DB00)		  ; 6C 00 DB | Jump to address (absolute indirect)
	STA $480F,X		  ; 9D 0F 48 | Audio system operation
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	JMP ($8800)		  ; 6C 00 88 | Jump to address (absolute indirect)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	JMP ($8800)		  ; 6C 00 88 | Jump to address (absolute indirect)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	JMP ($C800)		  ; 6C 00 C8 | Jump to address (absolute indirect)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	JMP ($8800)		  ; 6C 00 88 | Jump to address (absolute indirect)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	JMP ($0800)		  ; 6C 00 08 | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	JMP ($4800)		  ; 6C 00 48 | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank20_AudioFunction_238
; Address: $D0FF76
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank20_AudioFunction_238:
	JMP ($8400)		  ; 6C 00 84 | Jump to address (absolute indirect)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP ($8400)		  ; 6C 00 84 | Jump to address (absolute indirect)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP ($8400)		  ; 6C 00 84 | Jump to address (absolute indirect)
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP ($8400)		  ; 6C 00 84 | Jump to address (absolute indirect)
	PHA				  ; 48 | Push accumulator to stack
	JMP ($4400)		  ; 6C 00 44 | Jump to address (absolute indirect)
	WDM #$06			 ; 42 06 | Reserved instruction
	JMP ($4400)		  ; 6C 00 44 | Jump to address (absolute indirect)
	REP #$06			 ; C2 06 | Reset processor status bits
	JMP ($C400)		  ; 6C 00 C4 | Jump to address (absolute indirect)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	JMP ($0400)		  ; 6C 00 04 | Jump to address (absolute indirect)
	CMP ($02,X)		  ; C1 02 | Compare accumulator ((zero page,X))
	JMP ($4400)		  ; 6C 00 44 | Jump to address (absolute indirect)
	CMP ($02,X)		  ; C1 02 | Compare accumulator ((zero page,X))
	JMP ($8400)		  ; 6C 00 84 | Jump to address (absolute indirect)
	CMP ($02,X)		  ; C1 02 | Compare accumulator ((zero page,X))
	JMP ($C400)		  ; 6C 00 C4 | Jump to address (absolute indirect)
	EOR ($03,X)		  ; 41 03 | Exclusive OR with accumulator ((zero page,X))
	JMP ($C400)		  ; 6C 00 C4 | Jump to address (absolute indirect)
	EOR ($04,X)		  ; 41 04 | Exclusive OR with accumulator ((zero page,X))
	JMP ($0400)		  ; 6C 00 04 | Jump to address (absolute indirect)
	WDM #$03			 ; 42 03 | Reserved instruction
	JMP ($0400)		  ; 6C 00 04 | Jump to address (absolute indirect)
	REP #$03			 ; C2 03 | Reset processor status bits
	JMP ($0400)		  ; 6C 00 04 | Jump to address (absolute indirect)
	WDM #$04			 ; 42 04 | Reserved instruction
	JMP ($4400)		  ; 6C 00 44 | Jump to address (absolute indirect)
	REP #$02			 ; C2 02 | Reset processor status bits
	JMP ($8400)		  ; 6C 00 84 | Jump to address (absolute indirect)
	WDM #$03			 ; 42 03 | Reserved instruction
	JMP ($8400)		  ; 6C 00 84 | Jump to address (absolute indirect)
	WDM #$04			 ; 42 04 | Reserved instruction
	JMP ($0400)		  ; 6C 00 04 | Jump to address (absolute indirect)
	CMP ($05,X)		  ; C1 05 | Compare accumulator ((zero page,X))
	JMP ($4400)		  ; 6C 00 44 | Jump to address (absolute indirect)
	CMP ($05,X)		  ; C1 05 | Compare accumulator ((zero page,X))
