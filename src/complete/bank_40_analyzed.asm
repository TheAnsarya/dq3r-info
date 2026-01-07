;==============================================================================
; Dragon Quest III - Bank $40
; Type: Dma
; Purpose: Mixed functionality: GameLogic(1, 100.0%)
; Address Range: $E00000-$E07FFF
; Instructions: 9084
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_40"

;------------------------------------------------------------------------------
; Bank40_DmaFunction_000
; Address: $E08000
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_000:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STX $01			  ; 86 01 | Store X register to zero page
	ORA $9B			  ; 05 9B | Logical OR with accumulator (zero page)
	BIT #$CF			 ; 89 CF | Test bits in accumulator (immediate)
	EOR $0E			  ; 45 0E | Exclusive OR with accumulator (zero page)
	BPL $0E			  ; 10 0E | Branch if positive
	BPL $37			  ; 10 37 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	SBC $1C21			; ED 21 1C | Subtract with carry (absolute)
	AND ($14,X)		  ; 21 14 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $1B			  ; 10 1B | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	JMP $716E60		  ; 5C 60 6E 71 | Jump to address long
	BVS $04			  ; 70 04 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_001
; Address: $E08036
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_001:
	JSR $7C00			; 20 00 7C | Jump to subroutine
	LDA				  ; BF 00 9F 00 | Load from absolute long,X into accumulator
	STA				  ; 9F 00 36 39 | Store accumulator to absolute long,X
	BVC $3F			  ; 50 3F | Branch if overflow clear
	JMP $5F7F			; 4C 7F 5F | Jump to address
	PHP				  ; 08 | Push processor status to stack
	ORA $043E,Y		  ; 19 3E 04 | Logical OR with accumulator (absolute,Y)
	ASL $005F			; 0E 5F 00 | Arithmetic shift left (absolute)
	ROR $2F00			; 6E 00 2F | Rotate right (absolute)
	BPL $39			  ; 10 39 | Branch if positive
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	BPL $0E			  ; 10 0E | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	SEP #$00			 ; E2 00 | Set processor status bits
	RTI				  ; 40 | Return from interrupt
	INC $04			  ; E6 04 | Increment (zero page)
	CPX $12			  ; E4 12 | Compare X register (zero page)
	PHX				  ; DA | Push X register to stack
	WDM #$40			 ; 42 40 | Reserved instruction
	ROR $7E62			; 6E 62 7E | Rotate right (absolute)
	ROR $5608			; 6E 08 56 | Rotate right (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_002
; Address: $E0807E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_002:
	JSL $22B217		  ; 22 17 B2 22 | Jump to subroutine long
	ROR $44			  ; 66 44 | Rotate right (zero page)
	ROR $04			  ; 66 04 | Rotate right (zero page)
	SBC $DF17,X		  ; FD 17 DF | Subtract with carry (absolute,X)
	REP #$32			 ; C2 32 | Reset processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC $1FEA			; CE EA 1F | Decrement (absolute)
	WDM #$27			 ; 42 27 | Reserved instruction
	STY $07			  ; 84 07 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank40_DmaFunction_003
; Address: $E08096
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_003:
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	BEQ $01			  ; F0 01 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	DEC $36			  ; C6 36 | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack
	BEQ $30			  ; F0 30 | Branch if equal
	SEP #$DE			 ; E2 DE | Set processor status bits
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_004
; Address: $E080AB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_004:
	BRA $98			  ; 80 98 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	SBC $F600,Y		  ; F9 00 F6 | Subtract with carry (absolute,Y)
	INC $E600,X		  ; FE 00 E6 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BRA $18			  ; 80 18 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_005
; Address: $E080BD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_005:
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	JMP $732C60		  ; 5C 60 2C 73 | Jump to address long
	BVS $04			  ; 70 04 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_006
; Address: $E080D6
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_006:
	JSR $7C00			; 20 00 7C | Jump to subroutine
	LDA				  ; BF 00 9F 00 | Load from absolute long,X into accumulator
	STA				  ; 9F 00 76 79 | Store accumulator to absolute long,X
	BPL $0F			  ; 10 0F | Branch if positive
	JMP $4F3B			; 4C 3B 4F | Jump to address
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F 00 6F 20 | Store accumulator to absolute long,X
	ROR $6F00,X		  ; 7E 00 6F | Rotate right (absolute,X)
	BPL $01			  ; 10 01 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	SEP #$00			 ; E2 00 | Set processor status bits
	RTI				  ; 40 | Return from interrupt
	INC $04			  ; E6 04 | Increment (zero page)
	SEP #$12			 ; E2 12 | Set processor status bits
	PHX				  ; DA | Push X register to stack
	WDM #$40			 ; 42 40 | Reserved instruction
	ROR $7E62			; 6E 62 7E | Rotate right (absolute)
	ROR $5708			; 6E 08 57 | Rotate right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_007
; Address: $E0811E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_007:
	JSL $24B617		  ; 22 17 B6 24 | Jump to subroutine long
	ROR $44			  ; 66 44 | Rotate right (zero page)
	ADC $07			  ; 65 07 | Add with carry (zero page)
	DEC $30C2,X		  ; DE C2 30 | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_008
; Address: $E0812B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_008:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVS $87			  ; 70 87 | Branch if overflow set
	NOP				  ; EA | No operation
	ASL $2744,X		  ; 1E 44 27 | Arithmetic shift left (absolute,X)
	STA $07			  ; 85 07 | Store accumulator to zero page
	ASL $3D			  ; 06 3D | Arithmetic shift left (zero page)
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPY $34			  ; C4 34 | Compare Y register (zero page)
	INC $DEEA,X		  ; FE EA DE | Increment (absolute,X)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank40_DmaFunction_00A
; Address: $E0814D
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_00A:
	JSR $70F0			; 20 F0 70 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	INC $F600,X		  ; FE 00 F6 | Increment (absolute,X)
	PEA #$9C08		   ; F4 08 9C | Push effective address to stack
	SEC				  ; 38 | Set carry flag
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	BVS $04			  ; 70 04 | Branch if overflow set
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $3D00,Y		  ; 19 00 3D | Logical OR with accumulator (absolute,Y)
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $3F			  ; 25 3F | Logical AND with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	SEI				  ; 78 | Set interrupt disable flag
	JMP $052F15		  ; 5C 15 2F 05 | Jump to address long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_00B
; Address: $E081A1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_00B:
	ASL $294B,X		  ; 1E 4B 29 | Arithmetic shift left (absolute,X)
	BIT $130D			; 2C 0D 13 | Test bits in accumulator (absolute)
	ORA $3F0D,Y		  ; 19 0D 3F | Logical OR with accumulator (absolute,Y)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BIT $3F00			; 2C 00 3F | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_00C
; Address: $E081B7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_00C:
	JSR $202E			; 20 2E 20 | Jump to subroutine
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	BMI $03			  ; 30 03 | Branch if negative
	CPY #$E0			 ; C0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_00D
; Address: $E081C6
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_00D:
	BEQ $44			  ; F0 44 | Branch if equal
	BEQ $14			  ; F0 14 | Branch if equal
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BIT $34			  ; 24 34 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CPY $E8			  ; C4 E8 | Compare Y register (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPX $02			  ; E4 02 | Compare X register (zero page)
	CPX $02			  ; E4 02 | Compare X register (zero page)
	CPY #$B2			 ; C0 B2 | Compare Y register (immediate)
	LDY #$9A			 ; A0 9A | Load immediate value into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $38			  ; 10 38 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PEA #$1808		   ; F4 08 18 | Push effective address to stack
	BVC $F4			  ; 50 F4 | Branch if overflow clear
	STY $84C2			; 8C C2 84 | Store Y register to absolute address
	REP #$04			 ; C2 04 | Reset processor status bits
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $E4			  ; 80 E4 | Branch always
	PLX				  ; FA | Pull X register from stack
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BMI $C8			  ; 30 C8 | Branch if negative
	BEQ $08			  ; F0 08 | Branch if equal
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	BCS $F0			  ; B0 F0 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_00E
; Address: $E0821B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_00E:
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $20			  ; 80 20 | Branch always
	BRA $04			  ; 80 04 | Branch always
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	ORA ($7D,X)		  ; 01 7D | Logical OR with accumulator ((zero page,X))
	ORA ($5F,X)		  ; 01 5F | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_010
; Address: $E08247
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_010:
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA $3E2C,X		  ; 1D 2C 3E | Logical OR with accumulator (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($70,X)		  ; 01 70 | Logical OR with accumulator ((zero page,X))
	ROR $1E			  ; 66 1E | Rotate right (zero page)
	EOR $35			  ; 45 35 | Exclusive OR with accumulator (zero page)
	ROL $1728			; 2E 28 17 | Rotate left (absolute)
	PHP				  ; 08 | Push processor status to stack
	AND $310C			; 2D 0C 31 | Logical AND with accumulator (absolute)
	ROL $1F00			; 2E 00 1F | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_011
; Address: $E08279
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_011:
	JSR $0628			; 20 28 06 | Jump to subroutine
	CPY #$E0			 ; C0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	BEQ $44			  ; F0 44 | Branch if equal
	BEQ $14			  ; F0 14 | Branch if equal
	LDY #$1C			 ; A0 1C | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $D4			  ; 84 D4 | Store Y register to zero page
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CPY $E8			  ; C4 E8 | Compare Y register (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPX $02			  ; E4 02 | Compare X register (zero page)
	PEA #$F0C2		   ; F4 C2 F0 | Push effective address to stack
	CPY #$9A			 ; C0 9A | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	BMI $18			  ; 30 18 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PEA #$9808		   ; F4 08 98 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_012
; Address: $E082AC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_012:
	JSR $7870			; 20 70 78 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CPY $84E2			; CC E2 84 | Compare Y register (absolute)
	SEP #$84			 ; E2 84 | Set processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_013
; Address: $E082B6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_013:
	BRA $40			  ; 80 40 | Branch always
	BRA $64			  ; 80 64 | Branch always
	BRA $D0			  ; 80 D0 | Branch always
	SED				  ; F8 | Set decimal mode flag
	STZ $9C			  ; 64 9C | Store zero to zero page
	BMI $C8			  ; 30 C8 | Branch if negative
	BEQ $08			  ; F0 08 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_014
; Address: $E082C7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_014:
	SED				  ; F8 | Set decimal mode flag
	BMI $80			  ; 30 80 | Branch if negative
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY $08			  ; C4 08 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	BMI $30			  ; 30 30 | Branch if negative
	BMI $10			  ; 30 10 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_015
; Address: $E082DE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_015:
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($8E,X)		  ; 01 8E | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA $9F			  ; 05 9F | Logical OR with accumulator (zero page)
	BIT #$C9			 ; 89 C9 | Test bits in accumulator (immediate)
	EOR $5E18			; 4D 18 5E | Exclusive OR with accumulator (absolute)
	WDM #$41			 ; 42 41 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BVC $EF			  ; 50 EF | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank40_DmaFunction_016
; Address: $E082FA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_016:
	JSR $085F			; 20 5F 08 | Jump to subroutine
	JMP $D9DDE1		  ; 5C E1 DD D9 | Jump to address long
	DEC $8B			  ; C6 8B | Decrement (zero page)
	DEC $CE			  ; C6 CE | Decrement (zero page)
	ORA #$49			 ; 09 49 | Logical OR with accumulator (immediate)
	EOR ($E7),Y		  ; 51 E7 | Exclusive OR with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	REP #$E0			 ; C2 E0 | Game work RAM access
	BCC $E0			  ; 90 E0 | Game work RAM access
	CMP ($E0),Y		  ; D1 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_018
; Address: $E0831A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_018:
	SEC				  ; 38 | Set carry flag
	BRA $8F			  ; 80 8F | Branch always
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 00 13 1C | Store accumulator to absolute long,X
	ROL $3E23,X		  ; 3E 23 3E | Rotate left (absolute,X)
	AND $337C,Y		  ; 39 7C 33 | Logical AND with accumulator (absolute,Y)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_019
; Address: $E08332
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_019:
	JSL $411841		  ; 22 41 18 41 | Jump to subroutine long
	BVS $00			  ; 70 00 | Branch if overflow set
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	SEP #$00			 ; E2 00 | Set processor status bits
	ROL $64			  ; 26 64 | Rotate left (zero page)
	BEQ $50			  ; F0 50 | Branch if equal

;------------------------------------------------------------------------------
; Bank40_DmaFunction_01A
; Address: $E0834D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_01A:
	BCC $90			  ; 90 90 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	ROR $7E02			; 6E 02 7E | Rotate right (absolute)
	INC $F408			; EE 08 F4 | Increment (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BCC $68			  ; 90 68 | Branch if carry clear
	BPL $60			  ; 10 60 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_01B
; Address: $E08361
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_01B:
	JSR $A0C0			; 20 C0 A0 | Jump to subroutine
	CPY $22E4			; CC E4 22 | Compare Y register (absolute)
	ROL $1458			; 2E 58 14 | Rotate left (absolute)
	PLX				  ; FA | Pull X register from stack
	INC $F6E6,X		  ; FE E6 F6 | Increment (absolute,X)
	ASL $0098			; 0E 98 00 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	DEC $BE00,X		  ; DE 00 BE | Decrement (absolute,X)
	ORA $B900,X		  ; 1D 00 B9 | Logical OR with accumulator (absolute,X)
	SBC $E200,Y		  ; F9 00 E2 | Subtract with carry (absolute,Y)
	ASL $CE72,X		  ; 1E 72 CE | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STZ $9868			; 9C 68 98 | Store zero to absolute
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_01C
; Address: $E0838D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_01C:
	JSR $303C			; 20 3C 30 | Jump to subroutine
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	ASL $E680,X		  ; 1E 80 E6 | Arithmetic shift left (absolute,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_01D
; Address: $E0839C
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_01D:
	JSR $C0F0			; 20 F0 C0 | Jump to subroutine
	CLV				  ; B8 | Clear overflow flag
	ORA ($6E,X)		  ; 01 6E | Logical OR with accumulator ((zero page,X))
	ORA ($9F,X)		  ; 01 9F | Logical OR with accumulator ((zero page,X))
	STA $DF			  ; 85 DF | Store accumulator to zero page
	EOR #$09			 ; 49 09 | Exclusive OR with accumulator (immediate)
	EOR $5E58			; 4D 58 5E | Exclusive OR with accumulator (absolute)
	REP #$C1			 ; C2 C1 | Reset processor status bits
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STY $EF			  ; 84 EF | Store Y register to zero page
	PHA				  ; 48 | Push accumulator to stack
	BMI $4F			  ; 30 4F | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	SBC ($CD,X)		  ; E1 CD | Subtract with carry ((zero page,X))
	BIT #$C6			 ; 89 C6 | Test bits in accumulator (immediate)
	ASL $4E			  ; 06 4E | Arithmetic shift left (zero page)
	ADC #$49			 ; 69 49 | Add with carry (immediate)
	SBC $71			  ; E5 71 | Subtract with carry (zero page)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_01F
; Address: $E083D1
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_01F:
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	CPX #$91			 ; E0 91 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_021
; Address: $E083D8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_021:
	DEC				  ; 3A | Decrement accumulator
	BRA $88			  ; 80 88 | Branch always
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 00 7F 00 | Store accumulator to absolute long,X
	ORA #$3E			 ; 09 3E | Logical OR with accumulator (immediate)
	LSR $6E39			; 4E 39 6E | Logical shift right (absolute)
	AND ($12),Y		  ; 31 12 | Logical AND with accumulator ((zero page),Y)
	ASL $003F,X		  ; 1E 3F 00 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_022
; Address: $E083F2
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_022:
	JSL $013841		  ; 22 41 38 01 | Jump to subroutine long
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ASL $0F04,X		  ; 1E 04 0F | Arithmetic shift left (absolute,X)
	ORA $2060,X		  ; 1D 60 20 | Logical OR with accumulator (absolute,X)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BIT $2C			  ; 24 2C | Test bits in accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	BMI $FE			  ; 30 FE | Branch if negative
	INC $E6			  ; E6 E6 | Increment (zero page)
	ASL $0098,X		  ; 1E 98 00 | Arithmetic shift left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	LDX $1E00,Y		  ; BE 00 1E | Load from absolute,Y into X register
	LDA $F900,Y		  ; B9 00 F9 | Load from absolute,Y into accumulator
	ASL $F6			  ; 06 F6 | Arithmetic shift left (zero page)
	DEC $9C60			; CE 60 9C | Decrement (absolute)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	ROR $FC0C			; 6E 0C FC | Rotate right (absolute)
	STY $00			  ; 84 00 | Store Y register to zero page
	SBC $4100,Y		  ; F9 00 41 | Subtract with carry (absolute,Y)
	BRA $12			  ; 80 12 | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	BCC $00			  ; 90 00 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	EOR $030C			; 4D 0C 03 | Exclusive OR with accumulator (absolute)
	BPL $0D			  ; 10 0D | Branch if positive
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	AND #$13			 ; 29 13 | Logical AND with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_025
; Address: $E0845F
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_025:
	CMP ($66,X)		  ; C1 66 | Compare accumulator ((zero page,X))
	ADC $652B			; 6D 2B 65 | Add with carry (absolute)
	LDA				  ; BF 4B F6 48 | Load from absolute long,X into accumulator
	CPY $0741			; CC 41 07 | Compare Y register (absolute)
	DEY				  ; 88 | Decrement Y register
	ROL $19F1,X		  ; 3E F1 19 | Rotate left (absolute,X)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	CPX #$23			 ; E0 23 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BPL $2E			  ; 10 2E | Branch if positive
	BMI $26			  ; 30 26 | Branch if negative
	AND $1713,X		  ; 3D 13 17 | Logical AND with accumulator (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	AND ($10,X)		  ; 21 10 | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	BRA $D8			  ; 80 D8 | Branch always
	PEA #$C480		   ; F4 80 C4 | Push effective address to stack
	CPY $FE08			; CC 08 FE | Compare Y register (absolute)
	BMI $FA			  ; 30 FA | Branch if negative
	CPY $FA			  ; C4 FA | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BMI $34			  ; 30 34 | Branch if negative
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	DEC $B448			; CE 48 B4 | Decrement (absolute)
	BRA $FC			  ; 80 FC | Branch always
	BEQ $78			  ; F0 78 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	STY $EC			  ; 84 EC | Store Y register to zero page
	BMI $48			  ; 30 48 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_026
; Address: $E084D8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_026:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STZ $8E00			; 9C 00 8E | Store zero to absolute
	DEC				  ; 3A | Decrement accumulator
	SEC				  ; 38 | Set carry flag
	INC				  ; 1A | Increment accumulator
	SEI				  ; 78 | Set interrupt disable flag
	STZ $E4			  ; 64 E4 | Store zero to zero page
	BPL $08			  ; 10 08 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	BCS $BC			  ; B0 BC | Branch if carry set
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BRA $1E			  ; 80 1E | Branch always
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_027
; Address: $E084FC
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_027:
	JSR $0C20			; 20 20 0C | Jump to subroutine
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	EOR ($07,X)		  ; 41 07 | Exclusive OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $030C			; 0D 0C 03 | Logical OR with accumulator (absolute)
	BPL $0D			  ; 10 0D | Branch if positive
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	AND #$13			 ; 29 13 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_029
; Address: $E0851E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_029:
	JSR $2641			; 20 41 26 | Jump to subroutine
	AND $450B			; 2D 0B 45 | Logical AND with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	ROR $1971,X		  ; 7E 71 19 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_02A
; Address: $E08532
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_02A:
	BPL $60			  ; 10 60 | Branch if positive
	BPL $60			  ; 10 60 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_02D
; Address: $E08546
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_02D:
	JSR $0D3C			; 20 3C 0D | Jump to subroutine
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_02E
; Address: $E08552
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_02E:
	JSR $2012			; 20 12 20 | Jump to subroutine
	BPL $3F			  ; 10 3F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_02F
; Address: $E0855D
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_02F:
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	DEC $B448			; CE 48 B4 | Decrement (absolute)
	BRA $FC			  ; 80 FC | Branch always
	BEQ $78			  ; F0 78 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BPL $10			  ; 10 10 | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	TXS				  ; 9A | Transfer X register to stack pointer
	INC $4830,X		  ; FE 30 48 | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STX $7600			; 8E 00 76 | Store X register to absolute address
	PEA #$444C		   ; F4 4C 44 | Push effective address to stack
	PLP				  ; 28 | Pull processor status from stack
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BMI $8C			  ; 30 8C | Branch if negative
	LDX $F802,Y		  ; BE 02 F8 | Load from absolute,Y into X register
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	BMI $00			  ; 30 00 | Branch if negative
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ROL $7C08,X		  ; 3E 08 7C | Rotate left (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($2E,X)		  ; 01 2E | Logical OR with accumulator ((zero page,X))
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_030
; Address: $E085C2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_030:
	JSL $0D1507		  ; 22 07 15 0D | Jump to subroutine long
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $36			  ; 06 36 | Arithmetic shift left (zero page)
	BPL $14			  ; 10 14 | Branch if positive
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	ASL $2C			  ; 06 2C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_031
; Address: $E085E0
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_031:
	JSR $CC00			; 20 00 CC | Jump to subroutine
	CLV				  ; B8 | Clear overflow flag
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_032
; Address: $E085E9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_032:
	JSR $207C			; 20 7C 20 | Jump to subroutine
	ROL $5EC4,X		  ; 3E C4 5E | Rotate left (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $20			  ; 30 20 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_033
; Address: $E085FA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_033:
	JSR $84E0			; 20 E0 84 | Jump to subroutine
	BCC $68			  ; 90 68 | Branch if carry clear
	BNE $44			  ; D0 44 | Branch if not equal
	CPX #$A8			 ; E0 A8 | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_034
; Address: $E0860B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_034:
	JMP ($2808)		  ; 6C 08 28 | Jump to address (absolute indirect)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_035
; Address: $E08610
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_035:
	JSR $1810			; 20 10 18 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_036
; Address: $E0861D
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_036:
	CPY #$F4			 ; C0 F4 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA $1F00,X		  ; 1D 00 1F | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	AND ($7F,X)		  ; 21 7F | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	AND ($2B,X)		  ; 21 2B | Logical AND with accumulator ((zero page,X))
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	BPL $02			  ; 10 02 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BIT $7410			; 2C 10 74 | Test bits in accumulator (absolute)
	LSR $292E			; 4E 2E 29 | Logical shift right (absolute)
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BVC $00			  ; 50 00 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $F8			  ; 80 F8 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_037
; Address: $E086A3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_037:
	BCC $FC			  ; 90 FC | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	CPX $1818			; EC 18 18 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_038
; Address: $E086A9
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_038:
	BVS $F8			  ; 70 F8 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_039
; Address: $E086AD
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_039:
	JSR $C654			; 20 54 C6 | Jump to subroutine
	BVC $90			  ; 50 90 | Branch if overflow clear
	CLV				  ; B8 | Clear overflow flag
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $88			  ; F0 88 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	AND ($08),Y		  ; 31 08 | Logical AND with accumulator ((zero page),Y)
	BIT $6026			; 2C 26 60 | Test bits in accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BNE $D0			  ; D0 D0 | Branch if not equal
	LDY $1AA8			; AC A8 1A | Load from absolute address into Y register
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SBC $FFF0,Y		  ; F9 F0 FF | Subtract with carry (absolute,Y)
	BEQ $D8			  ; F0 D8 | Branch if equal
	BEQ $E8			  ; F0 E8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	BPL $E0			  ; 10 E0 | Game work RAM access
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	AND ($7F,X)		  ; 21 7F | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	AND ($2B,X)		  ; 21 2B | Logical AND with accumulator ((zero page,X))
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	BPL $02			  ; 10 02 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	STY $3410			; 8C 10 34 | Store Y register to absolute address
	STZ $07			  ; 64 07 | Store zero to zero page
	JMP $00241C		  ; 5C 1C 24 00 | Jump to address long
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	STA				  ; 9F 0F FF 0F | Store accumulator to absolute long,X
	PHP				  ; 08 | Push processor status to stack
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	BCC $FC			  ; 90 FC | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	CPX $1818			; EC 18 18 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_03A
; Address: $E08729
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_03A:
	BVS $F8			  ; 70 F8 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_03B
; Address: $E0872D
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_03B:
	JSR $C050			; 20 50 C0 | Jump to subroutine
	BVC $90			  ; 50 90 | Branch if overflow clear
	CLV				  ; B8 | Clear overflow flag
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $88			  ; F0 88 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ROL $6A2C			; 2E 2C 6A | Rotate left (absolute)
	JMP ($7472)		  ; 6C 72 74 | Jump to address (absolute indirect)
	BCC $04			  ; 90 04 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $D8			  ; F0 D8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $60			  ; 80 60 | Branch always
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	ROL $3801,X		  ; 3E 01 38 | Rotate left (absolute,X)
	ASL $020C			; 0E 0C 02 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA $0704			; 0D 04 07 | Logical OR with accumulator (absolute)
	BPL $17			  ; 10 17 | Branch if positive
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0929			; 0D 29 09 | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	ORA $1D5D,Y		  ; 19 5D 1D | Logical OR with accumulator (absolute,Y)
	LDA				  ; BF 3E BF 3E | Load from absolute long,X into accumulator
	ASL $1E0C			; 0E 0C 1E | Arithmetic shift left (absolute)
	ASL $3E1C,X		  ; 1E 1C 3E | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	ROR $7E7A,X		  ; 7E 7A 7E | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ASL $001B,X		  ; 1E 1B 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_03C
; Address: $E087C8
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_03C:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $10			  ; 70 10 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $20			  ; 10 20 | Branch if positive
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	BNE $E8			  ; D0 E8 | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	CLI				  ; 58 | Clear interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	CLV				  ; B8 | Clear overflow flag
	BCS $D0			  ; B0 D0 | Branch if carry set
	PHP				  ; 08 | Push processor status to stack
	BNE $10			  ; D0 10 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	DEY				  ; 88 | Decrement Y register
	BEQ $18			  ; F0 18 | Branch if equal
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	BCC $08			  ; 90 08 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank40_DmaFunction_03D
; Address: $E087FA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_03D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_03E
; Address: $E08801
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_03E:
	RTI				  ; 40 | Return from interrupt
	BEQ $80			  ; F0 80 | Branch if equal
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	BCS $F8			  ; B0 F8 | Branch if carry set
	BPL $E8			  ; 10 E8 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_03F
; Address: $E0880C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_03F:
	BEQ $B0			  ; F0 B0 | Branch if equal
	BPL $D0			  ; 10 D0 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_041
; Address: $E08816
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_041:
	JSR $1010			; 20 10 10 | Jump to subroutine
	BVS $60			  ; 70 60 | Branch if overflow set
	BVS $B8			  ; 70 B8 | Branch if overflow set
	BEQ $28			  ; F0 28 | Branch if equal
	BNE $00			  ; D0 00 | Branch if not equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ROL $7C02,X		  ; 3E 02 7C | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_042
; Address: $E08843
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_042:
	ORA #$70			 ; 09 70 | Logical OR with accumulator (immediate)
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA $0310,X		  ; 1D 10 03 | Logical OR with accumulator (absolute,X)
	ORA #$2E			 ; 09 2E | Logical OR with accumulator (immediate)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $7C			  ; F0 7C | Branch if equal
	JMP ($4746)		  ; 6C 46 47 | Jump to address (absolute indirect)
	EOR $7719,Y		  ; 59 19 77 | Exclusive OR with accumulator (absolute,Y)
	ROL $19			  ; 26 19 | Rotate left (zero page)
	ASL $3F0F			; 0E 0F 3F | Arithmetic shift left (absolute)
	STA				  ; 9F 00 9E 29 | Store accumulator to absolute long,X
	AND $2E2F,Y		  ; 39 2F 2E | Logical AND with accumulator (absolute,Y)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CPY $B800			; CC 00 B8 | Compare Y register (absolute)
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_043
; Address: $E0888F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_043:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BMI $20			  ; 30 20 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_044
; Address: $E088A1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_044:
	JSR $843E			; 20 3E 84 | Jump to subroutine
	ASL $00F0			; 0E F0 00 | Arithmetic shift left (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	BCS $08			  ; B0 08 | Branch if carry set
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_045
; Address: $E088B0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_045:
	JSR $84E0			; 20 E0 84 | Jump to subroutine
	BRA $78			  ; 80 78 | Branch always
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BMI $10			  ; 30 10 | Branch if negative
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	BNE $0F			  ; D0 0F | Branch if not equal
	ROL $36D4,X		  ; 3E D4 36 | Rotate left (absolute,X)
	SEP #$46			 ; E2 46 | Set processor status bits
	CPY #$1A			 ; C0 1A | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	INC $9864			; EE 64 98 | Increment (absolute)
	BVS $F0			  ; 70 F0 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	CPY #$F9			 ; C0 F9 | Compare Y register (immediate)
	ADC $4894,Y		  ; 79 94 48 | Add with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_046
; Address: $E088DA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_046:
	STZ $74F4			; 9C F4 74 | Store zero to absolute
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $0B			  ; 70 0B | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_047
; Address: $E088FC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_047:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $1B			  ; 10 1B | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	JMP $716E60		  ; 5C 60 6E 71 | Jump to address long
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $07			  ; 10 07 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_048
; Address: $E08916
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_048:
	JSR $7C00			; 20 00 7C | Jump to subroutine
	LDA				  ; BF 00 9F 00 | Load from absolute long,X into accumulator
	STA				  ; 9F 00 D0 00 | Store accumulator to absolute long,X
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	PLX				  ; FA | Pull X register from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_049
; Address: $E08935
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_049:
	JSR $6000			; 20 00 60 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PHX				  ; DA | Push X register to stack
	ROL $F6E4,X		  ; 3E E4 F6 | Rotate left (absolute,X)
	SBC $DF17,X		  ; FD 17 DF | Subtract with carry (absolute,X)
	REP #$32			 ; C2 32 | Reset processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC $1FEA			; CE EA 1F | Decrement (absolute)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	BEQ $01			  ; F0 01 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	JMP $732C60		  ; 5C 60 2C 73 | Jump to address long
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $07			  ; 10 07 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_04A
; Address: $E08976
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_04A:
	JSR $7C00			; 20 00 7C | Jump to subroutine
	LDA				  ; BF 00 9F 00 | Load from absolute long,X into accumulator
	STA				  ; 9F 00 D0 00 | Store accumulator to absolute long,X
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_04C
; Address: $E08995
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_04C:
	JSR $6000			; 20 00 60 | Jump to subroutine
	STX $2700			; 8E 00 27 | Store X register to absolute address
	DEC $3634,X		  ; DE 34 36 | Decrement (absolute,X)
	CPX $F5			  ; E4 F5 | Compare X register (zero page)
	DEC $30C2,X		  ; DE C2 30 | Decrement (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVS $87			  ; 70 87 | Branch if overflow set
	NOP				  ; EA | No operation
	ASL $3704,X		  ; 1E 04 37 | Arithmetic shift left (absolute,X)
	ORA $47			  ; 05 47 | Logical OR with accumulator (zero page)
	ASL $3D			  ; 06 3D | Arithmetic shift left (zero page)
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ADC $7F06,X		  ; 7D 06 7F | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	ORA $2F			  ; 05 2F | Logical OR with accumulator (zero page)
	AND $3B			  ; 25 3B | Logical AND with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	SEI				  ; 78 | Set interrupt disable flag
	JMP $150F15		  ; 5C 15 0F 15 | Jump to address long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BEQ $7C			  ; F0 7C | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	BPL $18			  ; 10 18 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BMI $04			  ; 30 04 | Branch if negative
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	CPY #$24			 ; C0 24 | Compare Y register (immediate)
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	LDY #$98			 ; A0 98 | Load immediate value into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $38			  ; 10 38 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_04D
; Address: $E08A28
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_04D:
	PEA #$1808		   ; F4 08 18 | Push effective address to stack
	BVC $F4			  ; 50 F4 | Branch if overflow clear
	STY $84C0			; 8C C0 84 | Store Y register to absolute address
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	PLX				  ; FA | Pull X register from stack
	ROL $7F03,X		  ; 3E 03 7F | Rotate left (absolute,X)
	ORA ($7D,X)		  ; 01 7D | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $3C21			; 2D 21 3C | Logical AND with accumulator (absolute)
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA $3E2C,X		  ; 1D 2C 3E | Logical OR with accumulator (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($27),Y		  ; 11 27 | Logical OR with accumulator ((zero page),Y)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($70,X)		  ; 01 70 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BCS $1C			  ; B0 1C | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	BNE $C8			  ; D0 C8 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	BMI $04			  ; 30 04 | Branch if negative
	ASL $DC			  ; 06 DC | Arithmetic shift left (zero page)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	STY $F0			  ; 84 F0 | Store Y register to zero page
	CPY $F0			  ; C4 F0 | Compare Y register (zero page)
	BNE $C0			  ; D0 C0 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	BMI $18			  ; 30 18 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PEA #$9808		   ; F4 08 98 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_04E
; Address: $E08AAC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_04E:
	JSR $7870			; 20 70 78 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CPY $84E0			; CC E0 84 | Compare Y register (absolute)
	CPX #$84			 ; E0 84 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_050
; Address: $E08ABB
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_050:
	BRA $D0			  ; 80 D0 | Branch always
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $3901,X		  ; 3E 01 39 | Rotate left (absolute,X)
	ASL $3C			  ; 06 3C | Arithmetic shift left (zero page)
	EOR #$4F			 ; 49 4F | Exclusive OR with accumulator (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	BPL $E0			  ; 10 E0 | Game work RAM access
	JMP $40E0			; 4C E0 40 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPY #$78			 ; C0 78 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BVS $30			  ; 70 30 | Branch if overflow set
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY $22E4			; CC E4 22 | Compare Y register (absolute)
	ROL $1458			; 2E 58 14 | Rotate left (absolute)
	PLX				  ; FA | Pull X register from stack
	INC $F6E6,X		  ; FE E6 F6 | Increment (absolute,X)
	ASL $0088			; 0E 88 00 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	DEC $BE00,X		  ; DE 00 BE | Decrement (absolute,X)
	ORA $B900,X		  ; 1D 00 B9 | Logical OR with accumulator (absolute,X)
	SBC $0100,Y		  ; F9 00 01 | Subtract with carry (absolute,Y)
	ROL $3901,X		  ; 3E 01 39 | Rotate left (absolute,X)
	LSR $5C			  ; 46 5C | Logical shift right (zero page)
	EOR #$4F			 ; 49 4F | Exclusive OR with accumulator (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	BVC $E0			  ; 50 E0 | Game work RAM access
	CPY $DDE0			; CC E0 DD | Compare Y register (absolute)
	STA $CBC6,Y		  ; 99 C6 CB | Store accumulator to absolute,Y
	ASL $4E			  ; 06 4E | Arithmetic shift left (zero page)
	ADC #$49			 ; 69 49 | Add with carry (immediate)
	SBC $71			  ; E5 71 | Subtract with carry (zero page)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_052
; Address: $E08B51
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_052:
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	CPX #$91			 ; E0 91 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_054
; Address: $E08B58
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_054:
	DEC				  ; 3A | Decrement accumulator
	BRA $88			  ; 80 88 | Branch always
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 00 7F 00 | Store accumulator to absolute long,X
	BVS $30			  ; 70 30 | Branch if overflow set
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	BIT $2C			  ; 24 2C | Test bits in accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	BMI $FE			  ; 30 FE | Branch if negative
	INC $E6			  ; E6 E6 | Increment (zero page)
	ASL $0088,X		  ; 1E 88 00 | Arithmetic shift left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	LDX $1E00,Y		  ; BE 00 1E | Load from absolute,Y into X register
	LDA $F900,Y		  ; B9 00 F9 | Load from absolute,Y into accumulator
	BPL $1F			  ; 10 1F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	ROR $4E			  ; 66 4E | Rotate right (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	BMI $18			  ; 30 18 | Branch if negative
	BMI $1E			  ; 30 1E | Branch if negative
	EOR ($E0),Y		  ; 51 E0 | Game work RAM access
	ADC $652B			; 6D 2B 65 | Add with carry (absolute)
	LDA				  ; BF 4B F6 48 | Load from absolute long,X into accumulator
	CPY $0741			; CC 41 07 | Compare Y register (absolute)
	DEY				  ; 88 | Decrement Y register
	ROL $18F1,X		  ; 3E F1 18 | Rotate left (absolute,X)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	CPX #$23			 ; E0 23 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BRA $7E			  ; 80 7E | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_055
; Address: $E08BD5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_055:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_057
; Address: $E08BE1
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_057:
	BCC $D4			  ; 90 D4 | Branch if carry clear
	BCS $FC			  ; B0 FC | Branch if carry set
	BEQ $78			  ; F0 78 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	STY $EC			  ; 84 EC | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	BPL $08			  ; 10 08 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STZ $8E00			; 9C 00 8E | Store zero to absolute
	BPL $1F			  ; 10 1F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	EOR ($1E,X)		  ; 41 1E | Exclusive OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $0E			  ; 26 0E | Rotate left (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	BMI $18			  ; 30 18 | Branch if negative
	BMI $5E			  ; 30 5E | Branch if negative
	ORA ($60),Y		  ; 11 60 | Logical OR with accumulator ((zero page),Y)
	AND $450B			; 2D 0B 45 | Logical AND with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	ROR $1871,X		  ; 7E 71 18 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_058
; Address: $E08C32
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_058:
	BPL $60			  ; 10 60 | Branch if positive
	BPL $60			  ; 10 60 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_05A
; Address: $E08C3B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_05A:
	JSR $000F			; 20 0F 00 | Jump to subroutine
	BCC $D4			  ; 90 D4 | Branch if carry clear
	BCS $FC			  ; B0 FC | Branch if carry set
	BEQ $78			  ; F0 78 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BPL $10			  ; 10 10 | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	TXS				  ; 9A | Transfer X register to stack pointer
	INC $1068,X		  ; FE 68 10 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STX $0000			; 8E 00 00 | Store X register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_05C
; Address: $E08C6F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_05C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $1F1A,X		  ; 1E 1A 1F | Arithmetic shift left (absolute,X)
	BPL $1E			  ; 10 1E | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_05D
; Address: $E08C7E
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_05D:
	JSR $003E			; 20 3E 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	ROR $ED80,X		  ; 7E 80 ED | Rotate right (absolute,X)
	ROL $0446			; 2E 46 04 | Rotate left (absolute)
	BRA $00			  ; 80 00 | Branch always
	BIT $047C			; 2C 7C 04 | Test bits in accumulator (absolute)
	LDY $3E02,X		  ; BC 02 3E | Load from absolute,X into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	AND ($10),Y		  ; 31 10 | Logical AND with accumulator ((zero page),Y)
	ASL $1F1A,X		  ; 1E 1A 1F | Arithmetic shift left (absolute,X)
	BPL $3E			  ; 10 3E | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	ROR $ED80,X		  ; 7E 80 ED | Rotate right (absolute,X)
	ROL $0446			; 2E 46 04 | Rotate left (absolute)
	BRA $00			  ; 80 00 | Branch always
	BIT $047C			; 2C 7C 04 | Test bits in accumulator (absolute)
	LDX $5ABB,Y		  ; BE BB 5A | Load from absolute,Y into X register
	ADC ($30),Y		  ; 71 30 | Add with carry ((zero page),Y)
	CMP ($40,X)		  ; C1 40 | Compare accumulator ((zero page,X))
	STA $30B10E		  ; 8F 0E B1 30 | Store accumulator to absolute long address
	CMP ($40,X)		  ; C1 40 | Compare accumulator ((zero page,X))
	ASL $1052			; 0E 52 10 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	ROL $3E30,X		  ; 3E 30 3E | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	INC $FE0E,X		  ; FE 0E FE | Increment (absolute,X)
	BMI $FE			  ; 30 FE | Branch if negative
	RTI				  ; 40 | Return from interrupt
	INC $FE0E,X		  ; FE 0E FE | Increment (absolute,X)
	BPL $7D			  ; 10 7D | Branch if positive
	AND $0647			; 2D 47 06 | Logical AND with accumulator (absolute)
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ROL $06			  ; 26 06 | Rotate left (zero page)
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	AND $2C24			; 2D 24 2C | Logical AND with accumulator (absolute)
	LDX $BE06,Y		  ; BE 06 BE | Load from absolute,Y into X register
	STA ($BF,X)		  ; 81 BF | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	ASL $DF			  ; 06 DF | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_05F
; Address: $E08D1C
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_05F:
	JSR $24F7			; 20 F7 24 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($BB,X)		  ; 21 BB | Logical AND with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	SBC ($30),Y		  ; F1 30 | Subtract with carry ((zero page),Y)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STZ $E09E,X		  ; 9E 9E E0 | Game work RAM access
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $87			  ; 80 87 | Branch always
	ASL $21			  ; 06 21 | PPU graphics register access
	INC				  ; 1A | Increment accumulator
	ROL $BE30,X		  ; 3E 30 BE | Rotate left (absolute,X)
	INC $FF9E,X		  ; FE 9E FF | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	LDA $0647			; AD 47 06 | Load from absolute address into accumulator
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY $931C,X		  ; BC 1C 93 | Load from absolute,X into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $29			  ; 10 29 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_060
; Address: $E08D8F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_060:
	JSR $3F02			; 20 02 3F | Jump to subroutine
	LDY $06BE			; AC BE 06 | Load from absolute address into Y register
	LDX $DF80,Y		  ; BE 80 DF | Load from absolute,Y into X register
	BPL $77			  ; 10 77 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_061
; Address: $E08D9E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_061:
	JSR $80F7			; 20 F7 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_062
; Address: $E08DB5
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_062:
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $62			  ; 80 62 | Branch always
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	ORA $2024			; 0D 24 20 | Logical OR with accumulator (absolute)
	BMI $08			  ; 30 08 | Branch if negative
	BPL $32			  ; 10 32 | Branch if positive
	AND $1D00,X		  ; 3D 00 1D | Logical AND with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	ORA $2C56,X		  ; 1D 56 2C | Logical OR with accumulator (absolute,X)
	JMP $6333			; 4C 33 63 | Jump to address
	CLC				  ; 18 | Clear carry flag
	BIT $FF00			; 2C 00 FF | Test bits in accumulator (absolute)
	CPY $B0F6			; CC F6 B0 | Compare Y register (absolute)
	CPY $1848			; CC 48 18 | Compare Y register (absolute)
	ROR $09			  ; 66 09 | Rotate right (zero page)
	INC $E475			; EE 75 E4 | Increment (absolute)
	CPY $B0CE			; CC CE B0 | Compare Y register (absolute)
	LDY $7C4A,X		  ; BC 4A 7C | Load from absolute,X into Y register
	INC				  ; 1A | Increment accumulator
	ORA $E2E6,Y		  ; 19 E6 E2 | Logical OR with accumulator (absolute,Y)
	BPL $0C			  ; 10 0C | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $6218,Y		  ; 99 18 62 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank40_DmaFunction_063
; Address: $E08E03
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_063:
	JSR $0022			; 20 22 00 | Jump to subroutine
	ASL $0D0A,X		  ; 1E 0A 0D | Arithmetic shift left (absolute,X)
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)
	BMI $08			  ; 30 08 | Branch if negative
	BPL $32			  ; 10 32 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC $3D20,X		  ; FE 20 3D | Increment (absolute,X)
	ORA $1F2A,X		  ; 1D 2A 1F | Logical OR with accumulator (absolute,X)
	BIT $334C			; 2C 4C 33 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	AND $DF24			; 2D 24 DF | Logical AND with accumulator (absolute)
	CPY $90F6			; CC F6 90 | Compare Y register (absolute)
	CPY $1848			; CC 48 18 | Compare Y register (absolute)
	ROR $09			  ; 66 09 | Rotate right (zero page)
	INC $F724			; EE 24 F7 | Increment (absolute)
	CPY $90EE			; CC EE 90 | Compare Y register (absolute)
	STZ $7C4A			; 9C 4A 7C | Store zero to absolute
	INC				  ; 1A | Increment accumulator
	ORA $E2E6,Y		  ; 19 E6 E2 | Logical OR with accumulator (absolute,Y)
	BPL $0C			  ; 10 0C | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_064
; Address: $E08E60
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_064:
	JSR $310C			; 20 0C 31 | Jump to subroutine
	ORA $0C08,Y		  ; 19 08 0C | Logical OR with accumulator (absolute,Y)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $CC74,X		  ; 7E 74 CC | Rotate right (absolute,X)
	INY				  ; C8 | Increment Y register
	CLV				  ; B8 | Clear overflow flag
	BMI $D0			  ; 30 D0 | Branch if negative
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $80			  ; 90 80 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_065
; Address: $E08E92
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_065:
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	BNE $20			  ; D0 20 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_066
; Address: $E08EA2
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_066:
	JSR $310C			; 20 0C 31 | Jump to subroutine
	ORA $0C08,Y		  ; 19 08 0C | Logical OR with accumulator (absolute,Y)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	BIT $1300			; 2C 00 13 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	CPX $B2			  ; E4 B2 | Compare X register (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $CC74,X		  ; 7E 74 CC | Rotate right (absolute,X)
	INY				  ; C8 | Increment Y register
	CLV				  ; B8 | Clear overflow flag
	BMI $A0			  ; 30 A0 | Branch if negative
	BNE $80			  ; D0 80 | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0B00			; 0E 00 0B | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_067
; Address: $E08EFD
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_067:
	ORA $0E00			; 0D 00 0E | Logical OR with accumulator (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL $8A04			; 0E 04 8A | Arithmetic shift left (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BPL $23			  ; 10 23 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LSR				  ; 4A | Logical shift right (accumulator)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	NOP				  ; EA | No operation
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA $8B			  ; 05 8B | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$05			 ; E0 05 | Compare X register (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	TXA				  ; 8A | Transfer X register to accumulator
	INC				  ; 1A | Increment accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $90			  ; 10 90 | Branch if positive
	ADC ($01,X)		  ; 61 01 | Add with carry ((zero page,X))
	JMP $8804			; 4C 04 88 | Jump to address
	ROL $43			  ; 26 43 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_06A
; Address: $E08FE0
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_06A:
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	JMP $485448		  ; 5C 48 54 48 | Jump to address long
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $39			  ; 80 39 | Branch always
	AND #$3C			 ; 29 3C | Logical AND with accumulator (immediate)
	BIT $405C			; 2C 5C 40 | Test bits in accumulator (absolute)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $F7			  ; 80 F7 | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BIT $40FF			; 2C FF 40 | Test bits in accumulator (absolute)
	STA ($F3,X)		  ; 81 F3 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $0B			  ; D0 0B | Branch if not equal
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	ORA $8A			  ; 05 8A | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	STX $9C06			; 8E 06 9C | Store X register to absolute address
	BVC $00			  ; 50 00 | Branch if overflow clear
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ROL $1102			; 2E 02 11 | Rotate left (absolute)
	ROL $43			  ; 26 43 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_06B
; Address: $E09054
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_06B:
	JSL $8F3607		  ; 22 07 36 8F | Jump to subroutine long
	STA $01CF00		  ; 8F 00 CF 01 | Store accumulator to absolute long address
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_06C
; Address: $E09063
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_06C:
	JSR $283C			; 20 3C 28 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	TXS				  ; 9A | Transfer X register to stack pointer
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_06E
; Address: $E09072
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_06E:
	JSR $20FB			; 20 FB 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_06F
; Address: $E0907E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_06F:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_071
; Address: $E0908D
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_071:
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$1A			 ; E0 1A | Compare X register (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $CE01			; 8D 01 CE | Store accumulator to absolute address
	STY $5D40			; 8C 40 5D | Store Y register to absolute address
	STA ($0E,X)		  ; 81 0E | Store accumulator to (zero page,X)
	EOR $1B50,Y		  ; 59 50 1B | Exclusive OR with accumulator (absolute,Y)
	ORA ($1B),Y		  ; 11 1B | Logical OR with accumulator ((zero page),Y)
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	LSR $37			  ; 46 37 | Logical shift right (zero page)
	LDY #$06			 ; A0 06 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_072
; Address: $E090DD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_072:
	STY $60			  ; 84 60 | Store Y register to zero page
	BRA $36			  ; 80 36 | Branch always
	PHP				  ; 08 | Push processor status to stack
	STZ $48			  ; 64 48 | Store zero to zero page
	LDA $7581,Y		  ; B9 81 75 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_073
; Address: $E090E7
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_073:
	CLC				  ; 18 | Clear carry flag
	STY $08			  ; 84 08 | Store Y register to zero page
	CLV				  ; B8 | Clear overflow flag
	LDY #$AB			 ; A0 AB | Load immediate value into Y register
	TXA				  ; 8A | Transfer X register to accumulator
	RTI				  ; 40 | Return from interrupt
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	BCC $73			  ; 90 73 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY $28			  ; C4 28 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	STY $B480			; 8C 80 B4 | Store Y register to absolute address
	INY				  ; C8 | Increment Y register
	BMI $C0			  ; 30 C0 | Branch if negative

;------------------------------------------------------------------------------
; Bank40_DmaFunction_074
; Address: $E09117
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_074:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY $CE00			; AC 00 CE | Load from absolute address into Y register
	STA $8E			  ; 85 8E | Store accumulator to zero page
	STA $0C			  ; 85 0C | Store accumulator to zero page
	BCC $5D			  ; 90 5D | Branch if carry clear
	BVC $1F			  ; 50 1F | Branch if overflow clear
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($23,X)		  ; 01 23 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDY #$06			 ; A0 06 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_075
; Address: $E0915F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_075:
	STY $57			  ; 84 57 | Store Y register to zero page
	EOR #$96			 ; 49 96 | Exclusive OR with accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	ROL $08			  ; 26 08 | Rotate left (zero page)
	EOR #$F5			 ; 49 F5 | Exclusive OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $08			  ; 84 08 | Store Y register to zero page
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_076
; Address: $E0916E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_076:
	LDY #$AB			 ; A0 AB | Load immediate value into Y register
	EOR ($E3,X)		  ; 41 E3 | Exclusive OR with accumulator ((zero page,X))
	BRA $E3			  ; 80 E3 | Branch always
	EOR ($C3,X)		  ; 41 C3 | Exclusive OR with accumulator ((zero page,X))
	BCC $73			  ; 90 73 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_077
; Address: $E09180
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_077:
	JSR $4000			; 20 00 40 | Jump to subroutine
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY $28			  ; C4 28 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BNE $0C			  ; D0 0C | Branch if not equal
	BRA $B4			  ; 80 B4 | Branch always
	INY				  ; C8 | Increment Y register
	BMI $C0			  ; 30 C0 | Branch if negative

;------------------------------------------------------------------------------
; Bank40_DmaFunction_078
; Address: $E09199
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_078:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_07A
; Address: $E091D2
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_07A:
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 38 40 C0 | Load from absolute long,X into accumulator
	BPL $00			  ; 10 00 | Branch if positive
	ADC $8200			; 6D 00 82 | Add with carry (absolute)
	ORA #$7C			 ; 09 7C | Logical OR with accumulator (immediate)
	ASL $CC			  ; 06 CC | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $E830,X		  ; 1E 30 E8 | Arithmetic shift left (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	CPY #$44			 ; C0 44 | Compare Y register (immediate)
	BCC $A0			  ; 90 A0 | Branch if carry clear
	BVS $30			  ; 70 30 | Branch if overflow set
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	BMI $06			  ; 30 06 | Branch if negative
	CPY #$7A			 ; C0 7A | Compare Y register (immediate)
	CPY $28			  ; C4 28 | Compare Y register (zero page)
	BCS $00			  ; B0 00 | Branch if carry set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_07D
; Address: $E09234
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_07D:
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 38 40 C0 | Load from absolute long,X into accumulator
	ADC $8700			; 6D 00 87 | Add with carry (absolute)
	PLP				  ; 28 | Pull processor status from stack
	TXA				  ; 8A | Transfer X register to accumulator
	ORA #$7C			 ; 09 7C | Logical OR with accumulator (immediate)
	ASL $CC			  ; 06 CC | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA $9A34,Y		  ; 19 34 9A | Logical OR with accumulator (absolute,Y)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BVS $30			  ; 70 30 | Branch if overflow set
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	BMI $05			  ; 30 05 | Branch if negative
	REP #$FA			 ; C2 FA | Reset processor status bits

;------------------------------------------------------------------------------
; Bank40_DmaFunction_07E
; Address: $E0925D
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_07E:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($21,X)		  ; 61 21 | PPU graphics register access
	AND ($3F,X)		  ; 21 3F | Logical AND with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $E7			  ; 80 E7 | Branch always
	SBC $C3			  ; E5 C3 | Subtract with carry (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	BRA $00			  ; 80 00 | Branch always
	CPX $FE			  ; E4 FE | Compare X register (zero page)
	WDM #$7E			 ; 42 7E | Reserved instruction
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $E7			  ; 80 E7 | Branch always
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPX $FE			  ; E4 FE | Compare X register (zero page)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCS $10			  ; B0 10 | Branch if carry set
	INC $E14E			; EE 4E E1 | Increment (absolute)
	EOR ($60,X)		  ; 41 60 | Exclusive OR with accumulator ((zero page,X))
	INC $CF40,X		  ; FE 40 CF | Increment (absolute,X)
	STA				  ; 9F 00 DF 10 | Store accumulator to absolute long,X
	LSR $41FF			; 4E FF 41 | Logical shift right (absolute)
	STA ($E7,X)		  ; 81 E7 | Store accumulator to (zero page,X)
	SEP #$02			 ; E2 02 | Set processor status bits
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_07F
; Address: $E0936B
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_07F:
	AND $C1C3,Y		  ; 39 C3 C1 | Logical AND with accumulator (absolute,Y)
	LDA				  ; BF 01 79 E0 | Load from absolute long,X into accumulator
	SBC $FF04,X		  ; FD 04 FF | Subtract with carry (absolute,X)
	AND $C1FF,Y		  ; 39 FF C1 | Logical AND with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($E1,X)		  ; 01 E1 | Logical OR with accumulator ((zero page,X))
	ADC ($C3,X)		  ; 61 C3 | Add with carry ((zero page,X))
	WDM #$FF			 ; 42 FF | Reserved instruction
	CPY #$D3			 ; C0 D3 | Compare Y register (immediate)
	LDA ($01,X)		  ; A1 01 | Load from (zero page,X) into accumulator
	BCS $10			  ; B0 10 | Branch if carry set
	CPY $C38C			; CC 8C C3 | Compare Y register (absolute)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	WDM #$FE			 ; 42 FE | Reserved instruction
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	STA				  ; 9F 01 DF 10 | Store accumulator to absolute long,X
	STY $83FF			; 8C FF 83 | Store Y register to absolute address
	STA ($E7,X)		  ; 81 E7 | Store accumulator to (zero page,X)
	SEP #$C2			 ; E2 C2 | Set processor status bits
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	ORA $E118,Y		  ; 19 18 E1 | Logical OR with accumulator (absolute,Y)
	CPX #$43			 ; E0 43 | Compare X register (immediate)
	LDA				  ; BF 01 79 E0 | Load from absolute long,X into accumulator
	CPY #$FD			 ; C0 FD | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_080
; Address: $E09400
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_080:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BPL $3C			  ; 10 3C | Branch if positive
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($34),Y		  ; 11 34 | Logical OR with accumulator ((zero page),Y)
	AND $2F28,Y		  ; 39 28 2F | Logical AND with accumulator (absolute,Y)
	BPL $3F			  ; 10 3F | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_081
; Address: $E09434
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_081:
	JSL $2E501E		  ; 22 1E 50 2E | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	STZ $11			  ; 64 11 | Store zero to zero page
	WDM #$19			 ; 42 19 | Reserved instruction
	BVC $0E			  ; 50 0E | Branch if overflow clear
	STZ $6418,X		  ; 9E 18 64 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank40_DmaFunction_082
; Address: $E09445
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_082:
	JSR $82C8			; 20 C8 82 | Jump to subroutine
	ROL $29			  ; 26 29 | Rotate left (zero page)
	LSR $7A4B			; 4E 4B 7A | Logical shift right (absolute)
	INC $7C18,X		  ; FE 18 7C | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_083
; Address: $E09454
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_083:
	JSL $BA85BC		  ; 22 BC 85 BA | Jump to subroutine long
	AND #$B6			 ; 29 B6 | Logical AND with accumulator (immediate)
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	CPY $B804			; CC 04 B8 | Compare Y register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_084
; Address: $E09464
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_084:
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_085
; Address: $E09469
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_085:
	JSR $3227			; 20 27 32 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($34),Y		  ; 11 34 | Logical OR with accumulator ((zero page),Y)
	AND $FF00,Y		  ; 39 00 FF | Logical AND with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ROL $1E			  ; 26 1E | Rotate left (zero page)
	BVC $2E			  ; 50 2E | Branch if overflow clear
	LSR				  ; 4A | Logical shift right (accumulator)
	STZ $11			  ; 64 11 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank40_DmaFunction_086
; Address: $E0947E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_086:
	WDM #$19			 ; 42 19 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $7408			; 8E 08 74 | Store X register to absolute address
	BMI $C8			  ; 30 C8 | Branch if negative
	ROL $29			  ; 26 29 | Rotate left (zero page)
	LSR $FF00			; 4E 00 FF | Logical shift right (absolute)
	INC $7C08,X		  ; FE 08 7C | Increment (absolute,X)
	LDY $BA85,X		  ; BC 85 BA | Load from absolute,X into Y register
	AND #$B6			 ; 29 B6 | Logical AND with accumulator (immediate)
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	CPY $1342			; CC 42 13 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_087
; Address: $E094A2
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_087:
	JSR $190C			; 20 0C 19 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	BIT $1200			; 2C 00 12 | Test bits in accumulator (absolute)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $72			  ; 64 72 | Store zero to zero page
	CLD				  ; D8 | Clear decimal mode flag
	JMP $B888			; 4C 88 B8 | Jump to address
	BMI $D0			  ; 30 D0 | Branch if negative
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $80			  ; 90 80 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_088
; Address: $E094D0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_088:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $44			  ; 80 44 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	BNE $20			  ; D0 20 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	WDM #$13			 ; 42 13 | Reserved instruction

;------------------------------------------------------------------------------
; Bank40_DmaFunction_089
; Address: $E094E4
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_089:
	JSR $190C			; 20 0C 19 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	BVC $0E			  ; 50 0E | Branch if overflow clear
	BIT $1200			; 2C 00 12 | Test bits in accumulator (absolute)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLY				  ; 7A | Pull Y register from stack
	STZ $72			  ; 64 72 | Store zero to zero page
	CLD				  ; D8 | Clear decimal mode flag
	JMP $B888			; 4C 88 B8 | Jump to address
	BMI $50			  ; 30 50 | Branch if negative

;------------------------------------------------------------------------------
; Bank40_DmaFunction_08A
; Address: $E0950B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_08A:
	INY				  ; C8 | Increment Y register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $44			  ; 80 44 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_08B
; Address: $E0951B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_08B:
	JSR $00F0			; 20 F0 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $3F38,Y		  ; 79 38 3F | Add with carry (absolute,Y)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	INC $E780,X		  ; FE 80 E7 | Increment (absolute,X)
	ROL $FE			  ; 26 FE | Rotate left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_08C
; Address: $E09557
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_08C:
	BRA $00			  ; 80 00 | Branch always
	BMI $38			  ; 30 38 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_08E
; Address: $E0955F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_08E:
	BCS $00			  ; B0 00 | Branch if carry set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $3F38,Y		  ; 79 38 3F | Add with carry (absolute,Y)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	INC $E780,X		  ; FE 80 E7 | Increment (absolute,X)
	ROL $FE			  ; 26 FE | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BMI $38			  ; 30 38 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_08F
; Address: $E0959E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_08F:
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $3902,X		  ; 1E 02 39 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $A7E7			; 0E E7 A7 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	DEC $9C88			; CE 88 9C | Decrement (absolute)
	BPL $FC			  ; 10 FC | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_090
; Address: $E095C9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_090:
	PHP				  ; 08 | Push processor status to stack
	DEC $EE40,X		  ; DE 40 EE | Decrement (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_091
; Address: $E095D1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_091:
	JSR $7E18			; 20 18 7E | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	BPL $F8			  ; 10 F8 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_092
; Address: $E095DA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_092:
	JSR $000C			; 20 0C 00 | Jump to subroutine
	STY $16			  ; 84 16 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_093
; Address: $E095E5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_093:
	JSL $3B0979		  ; 22 79 09 3B | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_094
; Address: $E095F4
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_094:
	JSL $3F093F		  ; 22 3F 09 3F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $7F0F			; 0E 0F 7F | Arithmetic shift left (absolute)
	JMP $24E7			; 4C E7 24 | Jump to address
	DEC $FC58,X		  ; DE 58 FC | Decrement (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	DEC $EE40,X		  ; DE 40 EE | Decrement (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BCS $38			  ; B0 38 | Branch if carry set

;------------------------------------------------------------------------------
; Bank40_DmaFunction_095
; Address: $E09613
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_095:
	JSR $7E4C			; 20 4C 7E | Jump to subroutine
	BIT $FE			  ; 24 FE | Test bits in accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_096
; Address: $E0961C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_096:
	JSR $000C			; 20 0C 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	EOR $5100,Y		  ; 59 00 51 | Exclusive OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	PHP				  ; 08 | Push processor status to stack
	ROR $5F24,X		  ; 7E 24 5F | Rotate right (absolute,X)
	EOR $7C09			; 4D 09 7C | Exclusive OR with accumulator (absolute)
	BPL $20			  ; 10 20 | Branch if positive
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	ASL $1C29,X		  ; 1E 29 1C | Arithmetic shift left (absolute,X)
	ORA $2C			  ; 05 2C | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_097
; Address: $E09658
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_097:
	JSR $0012			; 20 12 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $E5			  ; B0 E5 | Branch if carry set
	BRA $FF			  ; 80 FF | Branch always
	ADC $FFE4,X		  ; 7D E4 FF | Add with carry (absolute,X)
	EOR $9B48,Y		  ; 59 48 9B | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_098
; Address: $E0966F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_098:
	BRA $28			  ; 80 28 | Branch always
	ROL $3C30			; 2E 30 3C | Rotate left (absolute)
	BPL $1A			  ; 10 1A | Branch if positive
	CPX $00			  ; E4 00 | Compare X register (zero page)
	LDX $08			  ; A6 08 | Load from zero page into X register
	STZ $00			  ; 64 00 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	ROR $5F24,X		  ; 7E 24 5F | Rotate right (absolute,X)
	EOR $0809			; 4D 09 08 | Exclusive OR with accumulator (absolute)
	ASL $0622			; 0E 22 06 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_09A
; Address: $E0969A
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_09A:
	JSR $0012			; 20 12 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $E5			  ; B0 E5 | Branch if carry set
	BRA $FF			  ; 80 FF | Branch always
	ADC $FFE4,X		  ; 7D E4 FF | Add with carry (absolute,X)
	EOR $8448,Y		  ; 59 48 84 | Exclusive OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	ROL $3C30			; 2E 30 3C | Rotate left (absolute)
	BPL $1A			  ; 10 1A | Branch if positive
	CPX $00			  ; E4 00 | Compare X register (zero page)
	LDX $08			  ; A6 08 | Load from zero page into X register
	ROL $1706			; 2E 06 17 | Rotate left (absolute)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $BA08			; 6E 08 BA | Rotate right (absolute)
	INY				  ; C8 | Increment Y register
	BPL $20			  ; 10 20 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BCC $80			  ; 90 80 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_09B
; Address: $E096F0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_09B:
	BCC $00			  ; 90 00 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BNE $20			  ; D0 20 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $3F			  ; 10 3F | Branch if positive
	ROL $1706			; 2E 06 17 | Rotate left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	BRA $6E			  ; 80 6E | Branch always
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_09D
; Address: $E0972A
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_09D:
	JSR $8050			; 20 50 80 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	STZ $00			  ; 64 00 | Store zero to zero page
	BCC $00			  ; 90 00 | Branch if carry clear
	INY				  ; C8 | Increment Y register
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	ASL $0B04			; 0E 04 0B | Arithmetic shift left (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	DEY				  ; 88 | Decrement Y register
	STZ $0008			; 9C 08 00 | Store zero to absolute
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0A04			; 0E 04 0A | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	LSR $6704,X		  ; 5E 04 67 | Logical shift right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_09E
; Address: $E097DB
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_09E:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ROL $2E10,X		  ; 3E 10 2E | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $3F06			; 2E 06 3F | Rotate left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0F01,X		  ; 1E 01 0F | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1900,X		  ; 9D 00 19 | Store accumulator to absolute,X
	PHP				  ; 08 | Push processor status to stack
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	STY $02			  ; 84 02 | Store Y register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	STY $8381			; 8C 81 83 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank40_DmaFunction_09F
; Address: $E09828
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_09F:
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	LSR $6704,X		  ; 5E 04 67 | Logical shift right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0A0
; Address: $E0983D
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0A0:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $7D06			; 2E 06 7D | Rotate left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ASL $13			  ; 06 13 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ASL $0F0C			; 0E 0C 0F | Arithmetic shift left (absolute)
	STZ $9608			; 9C 08 96 | Store zero to absolute
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3B00,X		  ; 9D 00 3B | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	STZ $0800,X		  ; 9E 00 08 | Store zero to absolute,X
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STY $02			  ; 84 02 | Store Y register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ASL $1C14,X		  ; 1E 14 1C | Arithmetic shift left (absolute,X)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STA $024E01		  ; 8F 01 4E 02 | Store accumulator to absolute long address
	SBC $DD41			; ED 41 DD | Subtract with carry (absolute)
	LDA ($DF,X)		  ; A1 DF | Load from (zero page,X) into accumulator
	LDA $806E00		  ; AF 00 6E 80 | Load from absolute long address into accumulator
	INC $0184			; EE 84 01 | Increment (absolute)
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	BVC $02			  ; 50 02 | Branch if overflow clear
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	STZ $8908,X		  ; 9E 08 89 | Store zero to absolute,X
	ORA $08EF			; 0D EF 08 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	EOR $5B05			; 4D 05 5B | Exclusive OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0A1
; Address: $E098D2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0A1:
	BVS $0E			  ; 70 0E | Branch if overflow set
	CMP $100F			; CD 0F 10 | Compare accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $A4			  ; 05 A4 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0A3
; Address: $E098E5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0A3:
	JSR $30B8			; 20 B8 30 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	CPY #$B8			 ; C0 B8 | Compare Y register (immediate)
	BCC $5C			  ; 90 5C | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0A4
; Address: $E098F5
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0A4:
	JSR $0040			; 20 40 00 | Jump to subroutine
	BMI $C0			  ; 30 C0 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	INC $D946			; EE 46 D9 | Increment (absolute)
	LDA ($DF,X)		  ; A1 DF | Load from (zero page,X) into accumulator
	LDA $806E00		  ; AF 00 6E 80 | Load from absolute long address into accumulator
	ASL $47			  ; 06 47 | Arithmetic shift left (zero page)
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	BVC $02			  ; 50 02 | Branch if overflow clear
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	BIT #$81			 ; 89 81 | Test bits in accumulator (immediate)
	ORA $08EF,X		  ; 1D EF 08 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	EOR $5B05			; 4D 05 5B | Exclusive OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	STA ($87,X)		  ; 81 87 | Store accumulator to (zero page,X)
	BVS $0E			  ; 70 0E | Branch if overflow set
	CMP $101F,X		  ; DD 1F 10 | Compare accumulator (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $A4			  ; 05 A4 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0A6
; Address: $E09967
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0A6:
	JSR $30B8			; 20 B8 30 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	CPY #$B8			 ; C0 B8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0A7
; Address: $E0996D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0A7:
	BCC $5C			  ; 90 5C | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0A8
; Address: $E09977
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0A8:
	JSR $0040			; 20 40 00 | Jump to subroutine
	BMI $C0			  ; 30 C0 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0A9
; Address: $E099A2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0A9:
	INC $3EB0,X		  ; FE B0 3E | Increment (absolute,X)
	SBC $133C,X		  ; FD 3C 13 | Subtract with carry (absolute,X)
	BIT $0041			; 2C 41 00 | Test bits in accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0AA
; Address: $E099B2
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0AA:
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	INY				  ; C8 | Increment Y register
	PEA #$8E32		   ; F4 32 8E | Push effective address to stack
	INX				  ; E8 | Increment X register
	DEC				  ; 3A | Decrement accumulator
	CPY #$44			 ; C0 44 | Compare Y register (immediate)
	BCC $A0			  ; 90 A0 | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	BMI $04			  ; 30 04 | Branch if negative
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	PLY				  ; 7A | Pull Y register from stack
	CPY $28			  ; C4 28 | Compare Y register (zero page)
	BCS $00			  ; B0 00 | Branch if carry set
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FF84			; EE 84 FF | Increment (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0AB
; Address: $E09A04
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0AB:
	INC $3EB0,X		  ; FE B0 3E | Increment (absolute,X)
	LDA $2F3C,X		  ; BD 3C 2F | Load from absolute,X into accumulator
	RTI				  ; 40 | Return from interrupt
	STA ($07,X)		  ; 81 07 | Store accumulator to (zero page,X)
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0AC
; Address: $E09A14
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0AC:
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	ADC $8700			; 6D 00 87 | Add with carry (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	INY				  ; C8 | Increment Y register
	PEA #$8932		   ; F4 32 89 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0AD
; Address: $E09A2A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0AD:
	TXS				  ; 9A | Transfer X register to stack pointer
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	BMI $04			  ; 30 04 | Branch if negative
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0AE
; Address: $E09A3D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0AE:
	JSR $0000			; 20 00 00 | Jump to subroutine
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $87			  ; 80 87 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0AF
; Address: $E09A9C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0AF:
	CLV				  ; B8 | Clear overflow flag
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $61			  ; E5 61 | Subtract with carry (zero page)
	ORA $0007,Y		  ; 19 07 00 | Logical OR with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C7			  ; 80 C7 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0B0
; Address: $E09ADE
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0B0:
	SED				  ; F8 | Set decimal mode flag
	CPY #$1B			 ; C0 1B | Compare Y register (immediate)
	AND $110D,X		  ; 3D 0D 11 | Logical AND with accumulator (absolute,X)
	ORA ($2E,X)		  ; 01 2E | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($4F,X)		  ; 01 4F | Logical OR with accumulator ((zero page,X))
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	ORA $011F			; 0D 1F 01 | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	BMI $03			  ; 30 03 | Branch if negative
	ROR $FE28			; 6E 28 FE | Rotate right (absolute)
	BRA $E7			  ; 80 E7 | Branch always
	INC $8E			  ; E6 8E | Increment (zero page)
	DEY				  ; 88 | Decrement Y register
	BPL $3E			  ; 10 3E | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0B1
; Address: $E09B0B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0B1:
	JSR $C0FA			; 20 FA C0 | Jump to subroutine
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	LDY $7000,X		  ; BC 00 70 | Load from absolute,X into Y register
	INX				  ; E8 | Increment X register
	BEQ $88			  ; F0 88 | Branch if equal
	BPL $F8			  ; 10 F8 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0B2
; Address: $E09B1A
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0B2:
	JSR $C4F8			; 20 F8 C4 | Jump to subroutine
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	CPY #$77			 ; C0 77 | Compare Y register (immediate)
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	ROR $3F2A			; 6E 2A 3F | Rotate right (absolute)
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ASL $0100,X		  ; 1E 00 01 | Arithmetic shift left (absolute,X)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	LSR $2067			; 4E 67 20 | Logical shift right (absolute)
	INC $B780,X		  ; FE 80 B7 | Increment (absolute,X)
	CPY #$8E			 ; C0 8E | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	ROL $FA30,X		  ; 3E 30 FA | Rotate left (absolute,X)
	CPY #$4E			 ; C0 4E | Compare Y register (immediate)
	ROR $BE20,X		  ; 7E 20 BE | Rotate right (absolute,X)
	BVS $B8			  ; 70 B8 | Branch if overflow set
	BEQ $C0			  ; F0 C0 | Branch if equal
	INC $FC88,X		  ; FE 88 FC | Increment (absolute,X)
	BMI $F8			  ; 30 F8 | Branch if negative
	CPY $F0			  ; C4 F0 | Compare Y register (zero page)
	PHY				  ; 5A | Push Y register to stack
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0B4
; Address: $E09B67
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0B4:
	JSR $115F			; 20 5F 11 | Jump to subroutine
	BPL $4F			  ; 10 4F | Branch if positive
	ORA #$56			 ; 09 56 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0B5
; Address: $E09B70
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0B5:
	JSR $000F			; 20 0F 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	AND ($17,X)		  ; 21 17 | Logical AND with accumulator ((zero page,X))
	BMI $09			  ; 30 09 | Branch if negative
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	LDA $9D80,X		  ; BD 80 9D | Load from absolute,X into accumulator
	BCC $2F			  ; 90 2F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0B6
; Address: $E09B85
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0B6:
	JSL $FD6277		  ; 22 77 62 FD | Jump to subroutine long
	CPY $CF			  ; C4 CF | Compare Y register (zero page)
	ADC $D508,Y		  ; 79 08 D5 | Add with carry (absolute,Y)
	BNE $82			  ; D0 82 | Branch if not equal
	BEQ $92			  ; F0 92 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0B7
; Address: $E09B94
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0B7:
	JSR $68FA			; 20 FA 68 | Jump to subroutine
	REP #$F4			 ; C2 F4 | Reset processor status bits
	BMI $C4			  ; 30 C4 | Branch if negative
	STX $08			  ; 86 08 | Store X register to zero page
	ROL				  ; 2A | Rotate left (accumulator)
	BPL $4F			  ; 10 4F | Branch if positive
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	BIT $5F			  ; 24 5F | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0B9
; Address: $E09BAD
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0B9:
	BPL $4F			  ; 10 4F | Branch if positive
	ORA #$34			 ; 09 34 | Logical OR with accumulator (immediate)
	AND ($0F,X)		  ; 21 0F | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND ($17,X)		  ; 21 17 | Logical AND with accumulator ((zero page,X))
	BMI $09			  ; 30 09 | Branch if negative
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SBC $9D40,X		  ; FD 40 9D | Subtract with carry (absolute,X)
	BCC $2F			  ; 90 2F | Branch if carry clear
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $CFE4,X		  ; FD E4 CF | Subtract with carry (absolute,X)
	ADC $0E08,Y		  ; 79 08 0E | Add with carry (absolute,Y)
	CPY #$42			 ; C0 42 | Hardware register operation
	BEQ $92			  ; F0 92 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	INC $F238,X		  ; FE 38 F2 | Increment (absolute,X)
	SEP #$F4			 ; E2 F4 | Set processor status bits
	BMI $C4			  ; 30 C4 | Branch if negative
	STX $08			  ; 86 08 | Store X register to zero page
	ORA ($3A),Y		  ; 11 3A | Logical OR with accumulator ((zero page),Y)
	ORA #$13			 ; 09 13 | Logical OR with accumulator (immediate)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	BRA $CE			  ; 80 CE | Branch always
	DEY				  ; 88 | Decrement Y register
	BRA $C8			  ; 80 C8 | Branch always
	BPL $20			  ; 10 20 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BCC $80			  ; 90 80 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0BA
; Address: $E09C11
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0BA:
	BRA $30			  ; 80 30 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BNE $20			  ; D0 20 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($3A),Y		  ; 11 3A | Logical OR with accumulator ((zero page),Y)
	ORA #$13			 ; 09 13 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	ORA $0602			; 0D 02 06 | Logical OR with accumulator (absolute)
	BNE $BA			  ; D0 BA | Branch if not equal
	BRA $CE			  ; 80 CE | Branch always
	DEY				  ; 88 | Decrement Y register
	BRA $C8			  ; 80 C8 | Branch always
	BPL $88			  ; 10 88 | Branch if positive
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0BB
; Address: $E09C51
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0BB:
	BPL $44			  ; 10 44 | Branch if positive
	BRA $30			  ; 80 30 | Branch always
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0BD
; Address: $E09C6F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0BD:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BCC $F0			  ; 90 F0 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	BMI $30			  ; 30 30 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0BE
; Address: $E09CE0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0BE:
	JSR $1320			; 20 20 13 | Jump to subroutine
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0BF
; Address: $E09D21
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0BF:
	RTI				  ; 40 | Return from interrupt
	BCC $80			  ; 90 80 | Branch if carry clear
	BPL $10			  ; 10 10 | Branch if positive
	BVS $60			  ; 70 60 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	BPL $1C			  ; 10 1C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $18			  ; 70 18 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0C1
; Address: $E09D37
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0C1:
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0C2
; Address: $E09D3D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0C2:
	SED				  ; F8 | Set decimal mode flag
	BPL $F8			  ; 10 F8 | Branch if positive
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0C3
; Address: $E09D7B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0C3:
	SED				  ; F8 | Set decimal mode flag
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$F2			 ; E0 F2 | Compare X register (immediate)
	SEP #$F0			 ; E2 F0 | Set processor status bits
	BEQ $73			  ; F0 73 | Branch if equal
	CPX $C4			  ; E4 C4 | Compare X register (zero page)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	SBC #$E9			 ; E9 E9 | Subtract with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0C4
; Address: $E09D96
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0C4:
	STY $FF			  ; 84 FF | Store Y register to zero page
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	DEC $FF			  ; C6 FF | Decrement (zero page)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	ROR $FCFE,X		  ; 7E FE FC | Rotate right (absolute,X)
	INC $B8FE,X		  ; FE FE B8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	INC $FF58,X		  ; FE 58 FF | Increment (absolute,X)
	INC $FF54,X		  ; FE 54 FF | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BCC $40			  ; 90 40 | Branch if carry clear
	BMI $8C			  ; 30 8C | Branch if negative

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0C5
; Address: $E09DCF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0C5:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	BEQ $40			  ; F0 40 | Branch if equal
	BNE $FE			  ; D0 FE | Branch if not equal
	LDY $66FF,X		  ; BC FF 66 | Load from absolute,X into Y register
	BCS $48			  ; B0 48 | Branch if carry set

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0C6
; Address: $E09DE4
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0C6:
	CPX $9C			  ; E4 9C | Compare X register (zero page)
	DEC				  ; 3A | Decrement accumulator
	LSR $F3			  ; 46 F3 | Logical shift right (zero page)
	STA $B393ED		  ; 8F ED 93 B3 | Store accumulator to absolute long address
	BMI $0F			  ; 30 0F | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	ROR $FD83,X		  ; 7E 83 FD | Rotate right (absolute,X)
	INC $FC81,X		  ; FE 81 FC | Increment (absolute,X)
	INC $8003,X		  ; FE 03 80 | Increment (absolute,X)
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BPL $1C			  ; 10 1C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ROL $FF3C,X		  ; 3E 3C FF | Rotate left (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	INC $FFF9,X		  ; FE F9 FF | Increment (absolute,X)
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0C7
; Address: $E09E20
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0C7:
	JSR $4040			; 20 40 40 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0C8
; Address: $E09E2B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0C8:
	JSR $C020			; 20 20 C0 | Jump to subroutine
	EOR $70A7,Y		  ; 59 A7 70 | Exclusive OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0C9
; Address: $E09E32
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0C9:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDA				  ; BF 3C FC 60 | Load from absolute long,X into accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0CA
; Address: $E09E61
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0CA:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0CB
; Address: $E09E6D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0CB:
	JSR $2050			; 20 50 20 | Jump to subroutine
	BCC $D0			  ; 90 D0 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0CD
; Address: $E09E78
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0CD:
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0CF
; Address: $E09E9D
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0CF:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BPL $10			  ; 10 10 | Branch if positive
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	LSR $46			  ; 46 46 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BMI $20			  ; 30 20 | Branch if negative
	SBC ($E1),Y		  ; F1 E1 | Subtract with carry ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	PEA #$79E4		   ; F4 E4 79 | Push effective address to stack
	ADC #$E9			 ; 69 E9 | Add with carry (immediate)
	CMP #$F3			 ; C9 F3 | Compare accumulator (immediate)
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0D0
; Address: $E09ED0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0D0:
	JSR $C0F0			; 20 F0 C0 | Jump to subroutine
	SBC ($30),Y		  ; F1 30 | Subtract with carry ((zero page),Y)
	CPY #$F7			 ; C0 F7 | Compare Y register (immediate)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	STA ($EF,X)		  ; 81 EF | Store accumulator to (zero page,X)
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	STZ $9F			  ; 64 9F | Store zero to zero page
	STA				  ; 9F 3F 3C FF | Store accumulator to absolute long,X
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	INC $7F00,X		  ; FE 00 7F | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0D1
; Address: $E09EF4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0D1:
	JSR $C0FF			; 20 FF C0 | Jump to subroutine
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BVS $FE			  ; 70 FE | Branch if overflow set
	INY				  ; C8 | Increment Y register
	BEQ $20			  ; F0 20 | Branch if equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $7A7B,X		  ; 1E 7B 7A | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0D2
; Address: $E09F29
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0D2:
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	ROL $383F,X		  ; 3E 3F 38 | Rotate left (absolute,X)
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0D3
; Address: $E09F34
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0D3:
	JSR $447F			; 20 7F 44 | Jump to subroutine
	BPL $3F			  ; 10 3F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BMI $3F			  ; 30 3F | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $F8			  ; 30 F8 | Branch if negative
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA $E0E050		  ; 8F 50 E0 E0 | Game work RAM access
	BVS $DF			  ; 70 DF | Branch if overflow set
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BEQ $10			  ; F0 10 | Branch if equal
	BPL $10			  ; 10 10 | Branch if positive
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0D4
; Address: $E09F8A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0D4:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $F0			  ; 10 F0 | Branch if positive
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0D5
; Address: $E09F9B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0D5:
	JSR $0000			; 20 00 00 | Jump to subroutine
	EOR $F2B3			; 4D B3 F2 | Exclusive OR with accumulator (absolute)
	STX $7E4E			; 8E 4E 7E | Store X register to absolute address
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $3EFF,X		  ; FE FF 3E | Increment (absolute,X)
	AND $3C3F,Y		  ; 39 3F 3C | Logical AND with accumulator (absolute,Y)
	SBC ($70),Y		  ; F1 70 | Subtract with carry ((zero page),Y)
	ROL $041A,X		  ; 3E 1A 04 | Rotate left (absolute,X)
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	INC $7F00,X		  ; FE 00 7F | Increment (absolute,X)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0D6
; Address: $E09FE4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0D6:
	SBC $17BA			; ED BA 17 | Subtract with carry (absolute)
	INC $B3ED			; EE ED B3 | Increment (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	LDA $A7BE			; AD BE A7 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0D8
; Address: $E0A000
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0D8:
	JSR $28E0			; 20 E0 28 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $34			  ; 64 34 | Store zero to zero page
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $4C9F			; EC 9F 4C | Compare X register (absolute)
	CPX $50			  ; E4 50 | Compare X register (zero page)
	ROL $00E0			; 2E E0 00 | Rotate left (absolute)
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	BPL $FC			  ; 10 FC | Branch if positive
	LDY $FF43,X		  ; BC 43 FF | Load from absolute,X into Y register
	CPX $7E10			; EC 10 7E | Compare X register (absolute)
	BRA $4C			  ; 80 4C | Branch always
	WDM #$E6			 ; 42 E6 | Reserved instruction
	TXS				  ; 9A | Transfer X register to stack pointer
	PLB				  ; AB | Pull data bank register from stack
	LDY $5B6B			; AC 6B 5B | Load from absolute address into Y register
	AND #$39			 ; 29 39 | Logical AND with accumulator (immediate)
	ORA $1F0D,X		  ; 1D 0D 1F | Logical OR with accumulator (absolute,X)
	LSR $FE31			; 4E 31 FE | Logical shift right (absolute)
	ADC $380F,Y		  ; 79 0F 38 | Add with carry (absolute,Y)
	ORA $030F			; 0D 0F 03 | Logical OR with accumulator (absolute)
	STX $078C			; 8E 8C 07 | Store X register to absolute address
	ASL $13			  ; 06 13 | Arithmetic shift left (zero page)
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	CMP $F64D			; CD 4D F6 | Compare accumulator (absolute)
	PHB				  ; 8B | Push data bank register to stack
	STY $06FE			; 8C FE 06 | Store Y register to absolute address
	DEC $FF			  ; C6 FF | Decrement (zero page)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	BIT #$EF			 ; 89 EF | Test bits in accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ROR $02			  ; 66 02 | Rotate right (zero page)
	STA $3E10,Y		  ; 99 10 3E | Store accumulator to absolute,Y
	ROL $C9			  ; 26 C9 | Rotate left (zero page)
	CMP ($D9),Y		  ; D1 D9 | Compare accumulator ((zero page),Y)
	SBC ($D6,X)		  ; E1 D6 | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0D9
; Address: $E0A08C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0D9:
	DEX				  ; CA | Decrement X register
	SBC ($7F,X)		  ; E1 7F | Subtract with carry ((zero page,X))
	ROR $FF01,X		  ; 7E 01 FF | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0DA
; Address: $E0A097
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0DA:
	SBC $C670			; ED 70 C6 | Subtract with carry (absolute)
	PLY				  ; 7A | Pull Y register from stack
	WDM #$3C			 ; 42 3C | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	ASL $0DE0,X		  ; 1E E0 0D | Arithmetic shift left (absolute,X)
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ORA $1D3F			; 0D 3F 1D | Logical OR with accumulator (absolute)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $013F			; 0D 3F 01 | Logical OR with accumulator (absolute)
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	CMP $7E7F,X		  ; DD 7F 7E | Compare accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0DB
; Address: $E0A0C6
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0DB:
	PEA #$FBB9		   ; F4 B9 FB | Push effective address to stack
	SEP #$E9			 ; E2 E9 | Set processor status bits
	SBC ($46),Y		  ; F1 46 | Subtract with carry ((zero page),Y)
	CMP $49FE,Y		  ; D9 FE 49 | Compare accumulator (absolute,Y)
	INC $FE0F,X		  ; FE 0F FE | Increment (absolute,X)
	LDA $F86FFC		  ; AF FC 6F F8 | Load from absolute long address into accumulator
	SED				  ; F8 | Set decimal mode flag
	BEQ $3F			  ; F0 3F | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BCC $4C			  ; 90 4C | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INC $FFDC,X		  ; FE DC FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $10			  ; F0 10 | Branch if equal
	BPL $F0			  ; 10 F0 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	ROL $2400,X		  ; 3E 00 24 | Rotate left (absolute,X)
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	BIT $002C			; 2C 2C 00 | Test bits in accumulator (absolute)
	ORA $090E			; 0D 0E 09 | Logical OR with accumulator (absolute)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0DC
; Address: $E0A14C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0DC:
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC ($38),Y		  ; 71 38 | Add with carry ((zero page),Y)
	STA ($58),Y		  ; 91 58 | Store accumulator to (zero page),Y
	LDX $C4A0			; AE A0 C4 | Load from absolute address into X register
	LDY #$C4			 ; A0 C4 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0DD
; Address: $E0A16B
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0DD:
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BRA $F9			  ; 80 F9 | Branch always
	ASL $B9			  ; 06 B9 | Arithmetic shift left (zero page)
	LSR $FE			  ; 46 FE | Logical shift right (zero page)
	CPX $18			  ; E4 18 | Compare X register (zero page)
	CPX $18			  ; E4 18 | Compare X register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	ORA $3C7F,Y		  ; 19 7F 3C | Logical OR with accumulator (absolute,Y)
	LDA				  ; BF 28 FC 68 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0DF
; Address: $E0A1B1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0DF:
	ROL $3F10,X		  ; 3E 10 3F | Rotate left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	ADC $FC20,X		  ; 7D 20 FC | Add with carry (absolute,X)
	EOR ($E9,X)		  ; 41 E9 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	RTI				  ; 40 | Return from interrupt
	BEQ $3E			  ; F0 3E | Branch if equal
	LDX $5F01,Y		  ; BE 01 5F | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0E0
; Address: $E0A1C7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0E0:
	JSR $D405			; 20 05 D4 | Jump to subroutine
	ORA $9F			  ; 05 9F | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA ($03),Y		  ; B1 03 | Load from (zero page),Y into accumulator
	EOR ($1E,X)		  ; 41 1E | Exclusive OR with accumulator ((zero page,X))
	CPX #$47			 ; E0 47 | Compare X register (immediate)
	DEC				  ; 3A | Decrement accumulator
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0E1
; Address: $E0A1DA
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0E1:
	AND ($60),Y		  ; 31 60 | Logical AND with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $183D,X		  ; 1D 3D 18 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $3D			  ; 10 3D | Branch if positive
	BPL $3C			  ; 10 3C | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	PLB				  ; AB | Pull data bank register from stack
	ASL $24			  ; 06 24 | Arithmetic shift left (zero page)
	WDM #$45			 ; 42 45 | Reserved instruction
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	LSR $3100			; 4E 00 31 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0E2
; Address: $E0A211
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0E2:
	JSR $6976			; 20 76 69 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F E0 9F A0 | Store accumulator to absolute long,X
	ROR $4E71			; 6E 71 4E | Rotate right (absolute)
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	STA $E1E150		  ; 8F 50 E1 E1 | Store accumulator to absolute long address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVS $DF			  ; 70 DF | Branch if overflow set
	LDA ($FF,X)		  ; A1 FF | Load from (zero page,X) into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $10			  ; F0 10 | Branch if equal
	BPL $10			  ; 10 10 | Branch if positive
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0E3
; Address: $E0A24C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0E3:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $F0			  ; 10 F0 | Branch if positive
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0E4
; Address: $E0A25D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0E4:
	JSR $0000			; 20 00 00 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0E5
; Address: $E0A279
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0E5:
	BRA $00			  ; 80 00 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0E6
; Address: $E0A291
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0E6:
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0E7
; Address: $E0A2A2
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0E7:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	STA $3D11,Y		  ; 99 11 3D | Store accumulator to absolute,Y
	INC $EEF3			; EE F3 EE | Increment (absolute)
	SBC ($DF),Y		  ; F1 DF | Subtract with carry ((zero page),Y)
	DEC $EB66,X		  ; DE 66 EB | Decrement (absolute,X)
	SBC $3B			  ; E5 3B | Subtract with carry (zero page)
	SBC $F624,X		  ; FD 24 F6 | Subtract with carry (absolute,X)
	PHX				  ; DA | Push X register to stack
	SEP #$B8			 ; E2 B8 | Set processor status bits
	CPX $3C			  ; E4 3C | Compare X register (zero page)
	DEC $7F			  ; C6 7F | Decrement (zero page)
	ROL $3FE3,X		  ; 3E E3 3F | Rotate left (absolute,X)
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	STA $481D,X		  ; 9D 1D 48 | Store accumulator to absolute,X
	PHA				  ; 48 | Push accumulator to stack
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0E8
; Address: $E0A32A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0E8:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $0081,X		  ; 7E 81 00 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0E9
; Address: $E0A361
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0E9:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $70			  ; F0 70 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	BCS $30			  ; B0 30 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0EB
; Address: $E0A398
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0EB:
	JSR $2D20			; 20 20 2D | Jump to subroutine
	AND $1212			; 2D 12 12 | Logical AND with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0F0
; Address: $E0A3D5
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0F0:
	JSR $E8FE			; 20 FE E8 | Jump to subroutine
	DEC $B0FC,X		  ; DE FC B0 | Decrement (absolute,X)
	LDY $D0EC,X		  ; BC EC D0 | Load from absolute,X into Y register
	ORA $0D1F			; 0D 1F 0D | Logical OR with accumulator (absolute)
	ORA $0E00,X		  ; 1D 00 0E | Logical OR with accumulator (absolute,X)
	BEQ $3F			  ; F0 3F | Branch if equal
	INC $5F01,X		  ; FE 01 5F | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0F1
; Address: $E0A408
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0F1:
	STA $F4			  ; 85 F4 | Store accumulator to zero page
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $03			  ; B0 03 | Branch if carry set
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0F2
; Address: $E0A416
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0F2:
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	PLX				  ; FA | Pull X register from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $30			  ; 10 30 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	STA ($02,X)		  ; 81 02 | Store accumulator to (zero page,X)
	ASL $B010			; 0E 10 B0 | Arithmetic shift left (absolute)
	CPY #$1B			 ; C0 1B | Compare Y register (immediate)
	BMI $70			  ; 30 70 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 1E 7C F0 | Store accumulator to absolute long,X
	BRA $81			  ; 80 81 | Branch always
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0F3
; Address: $E0A4AF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0F3:
	JSR $F0F0			; 20 F0 F0 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	BMI $30			  ; 30 30 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0F4
; Address: $E0A4C5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0F4:
	JSR $0060			; 20 60 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	STZ $1BE0			; 9C E0 1B | Store zero to absolute
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0F5
; Address: $E0A4D5
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0F5:
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0F6
; Address: $E0A4D8
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0F6:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	STA $FC7F0F		  ; 8F 0F 7F FC | Store accumulator to absolute long address
	BRA $FC			  ; 80 FC | Branch always
	SED				  ; F8 | Set decimal mode flag
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	BMI $30			  ; 30 30 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0F7
; Address: $E0A523
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0F7:
	JSR $2040			; 20 40 20 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BCC $00			  ; 90 00 | Branch if carry clear
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $70			  ; F0 70 | Branch if equal
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	PLA				  ; 68 | Pull accumulator from stack
	BMI $30			  ; 30 30 | Branch if negative
	BVC $50			  ; 50 50 | Branch if overflow clear
	BVC $50			  ; 50 50 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0F8
; Address: $E0A546
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0F8:
	JSR $3128			; 20 28 31 | Jump to subroutine
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	AND $122D			; 2D 2D 12 | Logical AND with accumulator (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0FC
; Address: $E0A57A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0FC:
	JSR $0020			; 20 20 00 | Jump to subroutine
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0FD
; Address: $E0A5A3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0FD:
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	BRA $E8			  ; 80 E8 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_0FE
; Address: $E0A5B1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_0FE:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_100
; Address: $E0A5BB
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_100:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROL $00			  ; 26 00 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0F02			; 0E 02 0F | Arithmetic shift left (absolute)
	ASL $4F61,X		  ; 1E 61 4F | Arithmetic shift left (absolute,X)
	STA ($74),Y		  ; 91 74 | Store accumulator to (zero page),Y
	TXA				  ; 8A | Transfer X register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $42			  ; A4 42 | Hardware register operation
	TSX				  ; BA | Transfer stack pointer to X register
	TXS				  ; 9A | Transfer X register to stack pointer
	NOP				  ; EA | No operation
	ADC $6D19,Y		  ; 79 19 6D | Add with carry (absolute,Y)
	AND $007F			; 2D 7F 00 | Logical AND with accumulator (absolute)
	AND ($FE,X)		  ; 21 FE | Logical AND with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank40_DmaFunction_101
; Address: $E0A63C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_101:
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	ORA #$7F			 ; 09 7F | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_102
; Address: $E0A643
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_102:
	RTI				  ; 40 | Return from interrupt
	BMI $20			  ; 30 20 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BPL $1C			  ; 10 1C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ASL $4F0C			; 0E 0C 4F | Arithmetic shift left (absolute)
	LSR $5657			; 4E 57 56 | Logical shift right (absolute)
	RTI				  ; 40 | Return from interrupt
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	INC $FF4C,X		  ; FE 4C FF | Increment (absolute,X)
	ORA $0E04			; 0D 04 0E | Logical OR with accumulator (absolute)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA $1605			; 0D 05 16 | Logical OR with accumulator (absolute)
	ORA $0409,Y		  ; 19 09 04 | Logical OR with accumulator (absolute,Y)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_103
; Address: $E0A688
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_103:
	JSR $A000			; 20 00 A0 | Jump to subroutine
	BRA $90			  ; 80 90 | Branch always
	BRA $D0			  ; 80 D0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $76			  ; F0 76 | Branch if equal
	AND $1C3F,Y		  ; 39 3F 1C | Logical AND with accumulator (absolute,Y)
	AND $003F,Y		  ; 39 3F 00 | Logical AND with accumulator (absolute,Y)
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	INC $73FF			; EE FF 73 | Increment (absolute)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	JMP $23FF			; 4C FF 23 | Jump to address
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPX #$C6			 ; E0 C6 | Compare X register (immediate)
	CPY #$B9			 ; C0 B9 | Compare Y register (immediate)
	EOR $7FBC,Y		  ; 59 BC 7F | Exclusive OR with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	BRA $86			  ; 80 86 | Branch always
	CPX #$39			 ; E0 39 | Compare X register (immediate)
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_104
; Address: $E0A6F9
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_104:
	BRA $FC			  ; 80 FC | Branch always
	INC $0301,X		  ; FE 01 03 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	BEQ $30			  ; F0 30 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	LSR $000E			; 4E 0E 00 | Logical shift right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $C701,Y		  ; 39 01 C7 | Logical AND with accumulator (absolute,Y)
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	BPL $F1			  ; 10 F1 | Branch if positive
	BEQ $CE			  ; F0 CE | Branch if equal
	CPY $607C			; CC 7C 60 | Compare Y register (absolute)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BNE $FF			  ; D0 FF | Branch if not equal
	JMP $00FC			; 4C FC 00 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	STY $4280			; 8C 80 42 | Hardware register operation
	RTI				  ; 40 | Return from interrupt
	LDA $D4B8,Y		  ; B9 B8 D4 | Load from absolute,Y into accumulator
	BRA $00			  ; 80 00 | Branch always
	BEQ $80			  ; F0 80 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	INC $FF18,X		  ; FE 18 FF | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $0C			  ; 80 0C | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	CPX $E0			  ; E4 E0 | Game work RAM access
	BNE $99			  ; D0 99 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BVC $FE			  ; 50 FE | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank40_DmaFunction_105
; Address: $E0A7D6
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_105:
	DEY				  ; 88 | Decrement Y register
	LDA $FF32FF		  ; AF FF 32 FF | Load from absolute long address into accumulator
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ASL $21			  ; 06 21 | PPU graphics register access
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_106
; Address: $E0A805
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_106:
	RTI				  ; 40 | Return from interrupt
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $60			  ; F0 60 | Branch if equal

;------------------------------------------------------------------------------
; Bank40_DmaFunction_107
; Address: $E0A80A
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_107:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($3B),Y		  ; 11 3B | Logical OR with accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	LSR $6F4C			; 4E 4C 6F | Logical shift right (absolute)
	ROR $3A3E			; 6E 3E 3A | Rotate right (absolute)
	LDX $DBB4,Y		  ; BE B4 DB | Load from absolute,Y into X register
	PHX				  ; DA | Push X register to stack
	CMP ($01),Y		  ; D1 01 | Compare accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	LDY $FD			  ; A4 FD | Load from zero page into Y register
	WDM #$FE			 ; 42 FE | Reserved instruction
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	STY $F888			; 8C 88 F8 | Store Y register to absolute address
	BVS $70			  ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank40_DmaFunction_10A
; Address: $E0A84C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_10A:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	DEY				  ; 88 | Decrement Y register
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank40_DmaFunction_10B
; Address: $E0A857
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_10B:
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $D6			  ; 80 D6 | Branch always
	PLX				  ; FA | Pull X register from stack
	TAX				  ; AA | Transfer accumulator to X register
	XBA				  ; EB | Exchange accumulator bytes
	STA $048E			; 8D 8E 04 | Store accumulator to absolute address
	WDM #$FF			 ; 42 FF | Reserved instruction
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	DEY				  ; 88 | Decrement Y register
	BVC $FF			  ; 50 FF | Branch if overflow clear
	WDM #$DF			 ; 42 DF | Reserved instruction
	STA ($D7,X)		  ; 81 D7 | Store accumulator to (zero page,X)
	ORA $CF			  ; 05 CF | Logical OR with accumulator (zero page)
	STA $0040			; 8D 40 00 | Store accumulator to absolute address
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BCC $80			  ; 90 80 | Branch if carry clear
	BVC $40			  ; 50 40 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_10C
; Address: $E0A89F
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_10C:
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $FFFD,X		  ; FD FD FF | Subtract with carry (absolute,X)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA ($FF),Y		  ; B1 FF | Load from (zero page),Y into accumulator
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	STZ $B71C			; 9C 1C B7 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	AND $F739,Y		  ; 39 39 F7 | Logical AND with accumulator (absolute,Y)
	PEA #$7F0F		   ; F4 0F 7F | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_10E
; Address: $E0A900
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_10E:
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDA #$EF			 ; A9 EF | Load immediate value into accumulator
	CPX $B4			  ; E4 B4 | Compare X register (zero page)
	BCC $DC			  ; 90 DC | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_10F
; Address: $E0A929
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_10F:
	JSR $80E0			; 20 E0 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $FC			  ; 90 FC | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	CPX $B820			; EC 20 B8 | Compare X register (absolute)
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	CPX #$A4			 ; E0 A4 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_110
; Address: $E0A963
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_110:
	JSR $30B4			; 20 B4 30 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHY				  ; 5A | Push Y register to stack
	PHP				  ; 08 | Push processor status to stack
	AND $1604			; 2D 04 16 | Logical AND with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_112
; Address: $E0A974
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_112:
	JSR $40FC			; 20 FC 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ROR $2E08,X		  ; 7E 08 2E | Rotate right (absolute,X)
	LDX $82			  ; A6 82 | Load from zero page into X register
	REP #$8E			 ; C2 8E | Reset processor status bits
	SEI				  ; 78 | Set interrupt disable flag
	BVS $81			  ; 70 81 | Branch if overflow set
	INC $03			  ; E6 03 | Increment (zero page)
	STA ($F7,X)		  ; 81 F7 | Store accumulator to (zero page,X)
	ORA $27FF			; 0D FF 27 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_113
; Address: $E0A99C
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_113:
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	BMI $FF			  ; 30 FF | Branch if negative
	ADC $2F48,Y		  ; 79 48 2F | Add with carry (absolute,Y)
	ROL $EE			  ; 26 EE | Rotate left (zero page)
	INY				  ; C8 | Increment Y register
	INC $ECAC,X		  ; FE AC EC | Increment (absolute,X)
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	BNE $D8			  ; D0 D8 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	BEQ $A0			  ; F0 A0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	INY				  ; C8 | Increment Y register
	PLX				  ; FA | Pull X register from stack
	BIT $20FE			; 2C FE 20 | Test bits in accumulator (absolute)
	BNE $FC			  ; D0 FC | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_114
; Address: $E0A9CE
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_114:
	JSR $0001			; 20 01 00 | Jump to subroutine
	BRA $01			  ; 80 01 | Branch always
	BRA $03			  ; 80 03 | Branch always
	CMP ($03,X)		  ; C1 03 | Compare accumulator ((zero page,X))
	CMP ($03,X)		  ; C1 03 | Compare accumulator ((zero page,X))
	SBC ($99,X)		  ; E1 99 | Subtract with carry ((zero page,X))
	ORA #$BA			 ; 09 BA | Logical OR with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	ADC $7532,X		  ; 7D 32 75 | Add with carry (absolute,X)
	ADC #$25			 ; 69 25 | Add with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	EOR ($DE,X)		  ; 41 DE | Exclusive OR with accumulator ((zero page,X))
	ROL $762F,X		  ; 3E 2F 76 | Rotate left (absolute,X)
	JMP ($183F)		  ; 6C 3F 18 | Jump to address (absolute indirect)
	BPL $60			  ; 10 60 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	DEC $2EC2,X		  ; DE C2 2E | Decrement (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $81			  ; F0 81 | Branch if equal
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_115
; Address: $E0AA3E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_115:
	BRA $FF			  ; 80 FF | Branch always
	CPX $B888			; EC 88 B8 | Compare X register (absolute)
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	DEY				  ; 88 | Decrement Y register
	LDY #$E8			 ; A0 E8 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BEQ $80			  ; F0 80 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	LSR $930E			; 4E 0E 93 | Logical shift right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BMI $00			  ; 30 00 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $70			  ; 10 70 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_116
; Address: $E0AA8C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_116:
	INX				  ; E8 | Increment X register
	BRA $10			  ; 80 10 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	BPL $F0			  ; 10 F0 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_117
; Address: $E0AA9B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_117:
	BEQ $80			  ; F0 80 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $20			  ; F0 20 | Branch if equal
	ORA ($96,X)		  ; 01 96 | Logical OR with accumulator ((zero page,X))
	CPY #$2E			 ; C0 2E | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_118
; Address: $E0AAA7
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_118:
	JSL $D76366		  ; 22 66 63 D7 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	BVS $03			  ; 70 03 | Branch if overflow set
	SBC ($81,X)		  ; E1 81 | Subtract with carry ((zero page,X))
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	STA $FF			  ; 85 FF | Store accumulator to zero page
	BMI $FF			  ; 30 FF | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	AND $13			  ; 25 13 | Logical AND with accumulator (zero page)
	AND #$4E			 ; 29 4E | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_119
; Address: $E0AAE6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_119:
	STZ $375B,X		  ; 9E 5B 37 | Store zero to absolute,X
	LDX $262C			; AE 2C 26 | Load from absolute address into X register
	AND $6E36			; 2D 36 6E | Logical AND with accumulator (absolute)
	BMI $FF			  ; 30 FF | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_11A
; Address: $E0AAF5
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_11A:
	RTI				  ; 40 | Return from interrupt
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $AE			  ; 80 AE | Branch always
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($03,X)		  ; 81 03 | Store accumulator to (zero page,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $12			  ; 06 12 | Arithmetic shift left (zero page)
	ASL $1612,X		  ; 1E 12 16 | Arithmetic shift left (absolute,X)
	AND $13			  ; 25 13 | Logical AND with accumulator (zero page)
	EOR #$8E			 ; 49 8E | Exclusive OR with accumulator (immediate)
	STA				  ; 9F 12 1E 1B | Store accumulator to absolute long,X
	ROL $262C			; 2E 2C 26 | Rotate left (absolute)
	AND $6E36			; 2D 36 6E | Logical AND with accumulator (absolute)
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	BRA $9F			  ; 80 9F | Branch always
	LDA				  ; BF 00 2E 11 | Load from absolute long,X into accumulator
	EOR $BA09,Y		  ; 59 09 BA | Exclusive OR with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ADC $7532,X		  ; 7D 32 75 | Add with carry (absolute,X)
	ADC #$25			 ; 69 25 | Add with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR ($DE,X)		  ; 41 DE | Exclusive OR with accumulator ((zero page,X))
	ROL $762F,X		  ; 3E 2F 76 | Rotate left (absolute,X)
	JMP ($183F)		  ; 6C 3F 18 | Jump to address (absolute indirect)
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	LDA ($80,X)		  ; A1 80 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_11B
; Address: $E0AB8E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_11B:
	JSR $0001			; 20 01 00 | Jump to subroutine
	BRA $01			  ; 80 01 | Branch always
	CPY #$03			 ; C0 03 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_11C
; Address: $E0AB9B
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_11C:
	CMP ($83,X)		  ; C1 83 | Compare accumulator ((zero page,X))
	SBC ($03,X)		  ; E1 03 | Subtract with carry ((zero page,X))
	SBC ($F3,X)		  ; E1 F3 | Subtract with carry ((zero page,X))
	AND $D739,Y		  ; 39 39 D7 | Logical AND with accumulator (absolute,Y)
	CPY $7B			  ; C4 7B | Compare Y register (zero page)
	PHY				  ; 5A | Push Y register to stack
	AND $B63C,X		  ; 3D 3C B6 | Logical AND with accumulator (absolute,X)
	PLX				  ; FA | Pull X register from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $F040			; CC 40 F0 | Compare Y register (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC				  ; 1A | Increment accumulator
	BCC $FE			  ; 90 FE | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	INC $F400,X		  ; FE 00 F4 | Increment (absolute,X)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_11D
; Address: $E0ABC7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_11D:
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_11E
; Address: $E0ABD3
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_11E:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $79			  ; 80 79 | Branch always
	ADC #$FA			 ; 69 FA | Add with carry (immediate)
	NOP				  ; EA | No operation
	ADC $7532,X		  ; 7D 32 75 | Add with carry (absolute,X)
	ADC #$25			 ; 69 25 | Add with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	EOR ($DE,X)		  ; 41 DE | Exclusive OR with accumulator ((zero page,X))
	ROL $762F,X		  ; 3E 2F 76 | Rotate left (absolute,X)
	JMP ($183F)		  ; 6C 3F 18 | Jump to address (absolute indirect)
	BPL $00			  ; 10 00 | Branch if positive
	LSR $6E54			; 4E 54 6E | Logical shift right (absolute)
	STA				  ; 9F 9F 8E 8E | Store accumulator to absolute long,X
	STZ $7476			; 9C 76 74 | Store zero to absolute
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_120
; Address: $E0AC36
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_120:
	STA				  ; 9F 60 9E 61 | Store accumulator to absolute long,X
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $2ED4			; CE D4 2E | Decrement (absolute)
	INC $E4			  ; E6 E4 | Increment (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_121
; Address: $E0AC91
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_121:
	JSR $01FE			; 20 FE 01 | Jump to subroutine
	CPY #$37			 ; C0 37 | Compare Y register (immediate)
	CPY #$E6			 ; C0 E6 | Compare Y register (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $01			  ; 80 01 | Branch always
	LSR $02			  ; 46 02 | Logical shift right (zero page)
	STX $E682			; 8E 82 E6 | Store X register to absolute address
	CLD				  ; D8 | Clear decimal mode flag
	BNE $03			  ; D0 03 | Branch if not equal
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	DEC $03			  ; C6 03 | Decrement (zero page)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	BCC $FF			  ; 90 FF | Branch if carry clear
	STA $32320F		  ; 8F 0F 32 32 | Store accumulator to absolute long address
	LDX $DEBE,Y		  ; BE BE DE | Load from absolute,Y into X register
	DEC $F5FD,X		  ; DE FD F5 | Decrement (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	TYA				  ; 98 | Transfer Y register to accumulator
	DEC $7171			; CE 71 71 | Decrement (absolute)
	ROR $CCCE,X		  ; 7E CE CC | Rotate right (absolute,X)
	CPX $E0			  ; E4 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	BRA $C0			  ; 80 C0 | Branch always
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_122
; Address: $E0ACF4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_122:
	LSR $80FF			; 4E FF 80 | Logical shift right (absolute)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	BPL $F0			  ; 10 F0 | Branch if positive
	BRA $D0			  ; 80 D0 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_123
; Address: $E0AD22
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_123:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($F6,X)		  ; 01 F6 | Logical OR with accumulator ((zero page,X))
	ORA $6600			; 0D 00 66 | Logical OR with accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $03			  ; 50 03 | Branch if overflow clear
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $FF95,X		  ; FE 95 FF | Increment (absolute,X)
	BVC $FF			  ; 50 FF | Branch if overflow clear
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	AND ($16,X)		  ; 21 16 | Logical AND with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $5B0B			; 4E 0B 5B | Logical shift right (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	BPL $7F			  ; 10 7F | Branch if positive
	BMI $7F			  ; 30 7F | Branch if negative

;------------------------------------------------------------------------------
; Bank40_DmaFunction_124
; Address: $E0AD95
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_124:
	JSR $40EF			; 20 EF 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CMP #$DF			 ; C9 DF | Compare accumulator (immediate)
	BRA $BF			  ; 80 BF | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	LDA $0700AE		  ; AF AE 00 07 | Load from absolute long address into accumulator
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	DEY				  ; 88 | Decrement Y register
	ASL $791E,X		  ; 1E 1E 79 | Arithmetic shift left (absolute,X)
	ADC $CFCF,Y		  ; 79 CF CF | Add with carry (absolute,Y)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ROR $84CE,X		  ; 7E CE 84 | Rotate right (absolute,X)
	PEA #$02F0		   ; F4 F0 02 | Push effective address to stack
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_125
; Address: $E0ADD4
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_125:
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	INY				  ; C8 | Increment Y register
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	LSR $80FF			; 4E FF 80 | Logical shift right (absolute)
	INC $FC10,X		  ; FE 10 FC | Increment (absolute,X)
	LDA $FAA9,Y		  ; B9 A9 FA | Load from absolute,Y into accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $F552,X		  ; 7D 52 F5 | Add with carry (absolute,X)
	SBC #$45			 ; E9 45 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA ($FE,X)		  ; A1 FE | Load from (zero page,X) into accumulator
	INC $B6AF,X		  ; FE AF B6 | Increment (absolute,X)
	JMP ($583F)		  ; 6C 3F 58 | Jump to address (absolute indirect)
	BPL $EC			  ; 10 EC | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	AND $DF			  ; 25 DF | Logical AND with accumulator (zero page)
	JMP $E0FC			; 4C FC E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_126
; Address: $E0AE0A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_126:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	AND $FD			  ; 25 FD | Logical AND with accumulator (zero page)
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_127
; Address: $E0AE33
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_127:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ASL $791E,X		  ; 1E 1E 79 | Arithmetic shift left (absolute,X)
	ADC $0000,Y		  ; 79 00 00 | Add with carry (absolute,Y)
	INC				  ; 1A | Increment accumulator
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_128
; Address: $E0AE86
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_128:
	JSR $6000			; 20 00 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BNE $00			  ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank40_DmaFunction_129
; Address: $E0AE8C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_129:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_12A
; Address: $E0AEA4
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_12A:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $F0			  ; 90 F0 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $90			  ; F0 90 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	BEQ $80			  ; F0 80 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	ADC $BA69,Y		  ; 79 69 BA | Add with carry (absolute,Y)
	TAX				  ; AA | Transfer accumulator to X register
	SBC $F5D2,X		  ; FD D2 F5 | Subtract with carry (absolute,X)
	SBC #$25			 ; E9 25 | Subtract with carry (immediate)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	ADC ($FE,X)		  ; 61 FE | Add with carry ((zero page,X))
	INC $F68F,X		  ; FE 8F F6 | Increment (absolute,X)
	LDY $281F			; AC 1F 28 | Load from absolute address into Y register
	PHP				  ; 08 | Push processor status to stack
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ROL $2A			  ; 26 2A | Rotate left (zero page)
	LSR $46			  ; 46 46 | Logical shift right (zero page)
	JMP $3C3E			; 4C 3E 3C | Jump to address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $3E			  ; 10 3E | Branch if positive
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	BMI $4E			  ; 30 4E | Branch if negative
	AND ($3E),Y		  ; 31 3E | Logical AND with accumulator ((zero page),Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $FEDA,X		  ; DE DA FE | Decrement (absolute,X)
	SBC $ACBD,X		  ; FD BD AC | Subtract with carry (absolute,X)
	BIT $55D7			; 2C D7 55 | Test bits in accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	INX				  ; E8 | Increment X register
	CLI				  ; 58 | Clear interrupt disable flag
	STY $FF			  ; 84 FF | Store Y register to zero page
	PLP				  ; 28 | Pull processor status from stack
	EOR $FD			  ; 45 FD | Exclusive OR with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00E800		  ; AF 00 E8 00 | Load from absolute long address into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $B0			  ; 10 B0 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_12B
; Address: $E0AF45
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_12B:
	BRA $E0			  ; 80 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BPL $F0			  ; 10 F0 | Branch if positive
	BRA $D0			  ; 80 D0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	ASL $4702,X		  ; 1E 02 47 | Arithmetic shift left (absolute,X)
	BCC $90			  ; 90 90 | Branch if carry clear
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	SBC $03			  ; E5 03 | Subtract with carry (zero page)
	INC $FF45,X		  ; FE 45 FF | Increment (absolute,X)
	BCC $FF			  ; 90 FF | Branch if carry clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $4100,X		  ; 1E 00 41 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	PHX				  ; DA | Push X register to stack
	PHX				  ; DA | Push X register to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FF40,X		  ; FE 40 FF | Increment (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	JMP $9240			; 4C 40 92 | Jump to address
	BCC $A9			  ; 90 A9 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BCC $FE			  ; 90 FE | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	ASL $4507,X		  ; 1E 07 45 | Arithmetic shift left (absolute,X)
	EOR $B0			  ; 45 B0 | Exclusive OR with accumulator (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	SBC $05			  ; E5 05 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_12C
; Address: $E0AFDC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_12C:
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	AND $2A0A			; 2D 0A 2A | Logical AND with accumulator (absolute)
	AND $580A			; 2D 0A 58 | Logical AND with accumulator (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	BVC $3F			  ; 50 3F | Branch if overflow clear
	BPL $7F			  ; 10 7F | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_12E
; Address: $E0B019
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_12E:
	JSR $65FA			; 20 FA 65 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	LSR $40			  ; 46 40 | Logical shift right (zero page)
	AND ($30),Y		  ; 31 30 | Logical AND with accumulator ((zero page),Y)
	DEC $FBDE,X		  ; DE DE FB | Decrement (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ROR				  ; 6A | Rotate right (accumulator)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	INC $FF10,X		  ; FE 10 FF | Increment (absolute,X)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_12F
; Address: $E0B044
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_12F:
	JSR $5000			; 20 00 50 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	BRA $D6			  ; 80 D6 | Branch always
	BNE $A9			  ; D0 A9 | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVC $FE			  ; 50 FE | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_130
; Address: $E0B08C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_130:
	JSR $6000			; 20 00 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$59			 ; C0 59 | Compare Y register (immediate)
	EOR ($7A),Y		  ; 51 7A | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_131
; Address: $E0B0A3
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_131:
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $B2FD			; ED FD B2 | Subtract with carry (absolute)
	SBC #$45			 ; E9 45 | Subtract with carry (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ADC #$02			 ; 69 02 | Add with carry (immediate)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT #$FE			 ; 89 FE | Test bits in accumulator (immediate)
	INC $F65F,X		  ; FE 5F F6 | Increment (absolute,X)
	CPX $681F			; EC 1F 68 | Compare X register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	INC $FD6E,X		  ; FE 6E FD | Increment (absolute,X)
	CMP $515B,Y		  ; D9 5B 51 | Compare accumulator (absolute,Y)
	AND $A524			; 2D 24 A5 | Logical AND with accumulator (absolute)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	BPL $FF			  ; 10 FF | Branch if positive
	BRA $FF			  ; 80 FF | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_132
; Address: $E0B0DC
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_132:
	ORA ($49,X)		  ; 01 49 | Logical OR with accumulator ((zero page,X))
	ORA ($94,X)		  ; 01 94 | Logical OR with accumulator ((zero page,X))
	EOR #$49			 ; 49 49 | Exclusive OR with accumulator (immediate)
	LDY $B6AC			; AC AC B6 | Load from absolute address into Y register
	JMP $00CC			; 4C CC 00 | Jump to address
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	STY $FF			  ; 84 FF | Store Y register to zero page
	PHA				  ; 48 | Push accumulator to stack
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	STA ($91),Y		  ; 91 91 | Store accumulator to (zero page),Y
	PHY				  ; 5A | Push Y register to stack
	ADC $EAFD			; 6D FD EA | Add with carry (absolute)
	SBC #$45			 ; E9 45 | Subtract with carry (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	WDM #$E9			 ; 42 E9 | Reserved instruction
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	STA $F62FFE		  ; 8F FE 2F F6 | Store accumulator to absolute long address
	CPX $E85F			; EC 5F E8 | Compare X register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $1492,Y		  ; 19 92 14 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	AND $2727,Y		  ; 39 27 27 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_133
; Address: $E0B147
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_133:
	JSL $1E2422		  ; 22 22 24 1E | Jump to subroutine long
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LSR $BFC1,X		  ; 5E C1 BF | Logical shift right (absolute,X)
	BRA $27			  ; 80 27 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_134
; Address: $E0B157
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_134:
	CLC				  ; 18 | Clear carry flag
	ROL $19			  ; 26 19 | Rotate left (zero page)
	ASL $0301,X		  ; 1E 01 03 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $2B19,X		  ; 5D 19 2B | Exclusive OR with accumulator (absolute,X)
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	STY $FD			  ; 84 FD | Store Y register to zero page
	PHA				  ; 48 | Push accumulator to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	STY $FF			  ; 84 FF | Store Y register to zero page
	PHA				  ; 48 | Push accumulator to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($DB,X)		  ; 01 DB | Logical OR with accumulator ((zero page,X))
	LDA #$A9			 ; A9 A9 | Load immediate value into accumulator
	LDY $F60C			; AC 0C F6 | Load from absolute address into Y register
	PHP				  ; 08 | Push processor status to stack
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	BRA $FF			  ; 80 FF | Branch always
	PHP				  ; 08 | Push processor status to stack
	LSR $0C00			; 4E 00 0C | Logical shift right (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_135
; Address: $E0B1A4
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_135:
	BCC $80			  ; 90 80 | Branch if carry clear
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ROR $9507,X		  ; 7E 07 95 | Rotate right (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR $D5			  ; 45 D5 | Exclusive OR with accumulator (zero page)
	LDA $2A0A			; AD 0A 2A | Load from absolute address into accumulator
	AND $580A			; 2D 0A 58 | Logical AND with accumulator (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	BNE $3F			  ; D0 3F | Branch if not equal

;------------------------------------------------------------------------------
; Bank40_DmaFunction_137
; Address: $E0B1F7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_137:
	JSR $207F			; 20 7F 20 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	ADC $FF			  ; 65 FF | Add with carry (zero page)
	RTI				  ; 40 | Return from interrupt
	CPY #$C6			 ; C0 C6 | Compare Y register (immediate)
	ADC $42			  ; 65 42 | Hardware register operation
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_138
; Address: $E0B205
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_138:
	JSL $A58089		  ; 22 89 80 A5 | Jump to subroutine long
	LDY $95DC			; AC DC 95 | Load from absolute address into Y register
	DEC				  ; 3A | Decrement accumulator
	SBC $0160,Y		  ; F9 60 01 | Subtract with carry (absolute,Y)
	SBC $F50F,X		  ; FD 0F F5 | Subtract with carry (absolute,X)
	SBC $F62B,X		  ; FD 2B F6 | Subtract with carry (absolute,X)
	EOR ($EF),Y		  ; 51 EF | Exclusive OR with accumulator ((zero page),Y)
	ADC $14			  ; 65 14 | Add with carry (zero page)
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BPL $11			  ; 10 11 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	TXA				  ; 8A | Transfer X register to accumulator
	LDA ($11),Y		  ; B1 11 | Load from (zero page),Y into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $0130,Y		  ; B9 30 01 | Load from absolute,Y into accumulator
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ROR $FD23,X		  ; 7E 23 FD | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 3D 5F 5C | Load from absolute long,X into accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	BEQ $FF			  ; F0 FF | Branch if equal
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_139
; Address: $E0B28C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_139:
	SBC $F8E8,X		  ; FD E8 F8 | Subtract with carry (absolute,X)
	BCS $28			  ; B0 28 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	BMI $FE			  ; 30 FE | Branch if negative
	BVC $FB			  ; 50 FB | Branch if overflow clear
	CPY #$FA			 ; C0 FA | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_13B
; Address: $E0B29C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_13B:
	JSR $80F8			; 20 F8 80 | Jump to subroutine
	BEQ $21			  ; F0 21 | PPU graphics register access
	AND ($9A,X)		  ; 21 9A | Logical AND with accumulator ((zero page,X))
	CMP $6A7D,X		  ; DD 7D 6A | Compare accumulator (absolute,X)
	SBC #$A5			 ; E9 A5 | Subtract with carry (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$E9			 ; E2 E9 | Set processor status bits
	WDM #$21			 ; 42 21 | PPU graphics register access
	CMP $4FFE,Y		  ; D9 FE 4F | Compare accumulator (absolute,Y)
	INC $F60F,X		  ; FE 0F F6 | Increment (absolute,X)
	LDA				  ; BF EC 7F E8 | Load from absolute long,X into accumulator
	INX				  ; E8 | Increment X register
	ORA $1412,Y		  ; 19 12 14 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	AND $2727,Y		  ; 39 27 27 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_13C
; Address: $E0B2C7
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_13C:
	JSL $1E2422		  ; 22 22 24 1E | Jump to subroutine long
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY $5E			  ; C4 5E | Compare Y register (zero page)
	CMP ($BF,X)		  ; C1 BF | Compare accumulator ((zero page,X))
	BRA $27			  ; 80 27 | Branch always
	CLC				  ; 18 | Clear carry flag
	ROL $19			  ; 26 19 | Rotate left (zero page)
	ASL $0301,X		  ; 1E 01 03 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $D966,X		  ; DE 66 D9 | Decrement (absolute,X)
	ADC ($C9,X)		  ; 61 C9 | Add with carry ((zero page,X))
	ADC ($E6),Y		  ; 71 E6 | Add with carry ((zero page),Y)
	ORA $0BFD,X		  ; 1D FD 0B | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	EOR $4630			; 4D 30 46 | Exclusive OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	LDX #$0C			 ; A2 0C | Load immediate value into X register
	BCS $02			  ; B0 02 | Branch if carry set
	JMP $300E00		  ; 5C 00 0E 30 | Jump to address long
	DEC $C4C9			; CE C9 C4 | Decrement (absolute)
	LDA $2AAA			; AD AA 2A | Load from absolute address into accumulator
	BIT $1A			  ; 24 1A | Test bits in accumulator (zero page)
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	BMI $D6			  ; 30 D6 | Branch if negative
	INC $FB4B,X		  ; FE 4B FB | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_13E
; Address: $E0B31C
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_13E:
	JSR $C0E0			; 20 E0 C0 | Jump to subroutine
	CPY #$35			 ; C0 35 | Compare Y register (immediate)
	BIT $657C			; 2C 7C 65 | Test bits in accumulator (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	CMP $EE60,Y		  ; D9 60 EE | Compare accumulator (absolute,Y)
	SBC #$91			 ; E9 91 | Subtract with carry (immediate)
	SBC $FE01,Y		  ; F9 01 FE | Subtract with carry (absolute,Y)
	SBC $37			  ; E5 37 | Subtract with carry (zero page)
	SBC $C63B			; ED 3B C6 | Subtract with carry (absolute)
	AND ($4F),Y		  ; 31 4F | Logical AND with accumulator ((zero page),Y)
	LDA $00AD13		  ; AF 13 AD 00 | Load from absolute long address into accumulator
	NOP				  ; EA | No operation
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ORA $17			  ; 05 17 | Logical OR with accumulator (zero page)
	ROL $1808			; 2E 08 18 | Rotate left (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA $1D			  ; 05 1D | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROL $1800,X		  ; 3E 00 18 | Rotate left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $1301			; 0D 01 13 | Logical OR with accumulator (absolute)
	ASL $4F			  ; 06 4F | Arithmetic shift left (zero page)
	STA				  ; 9F 1F 00 01 | Store accumulator to absolute long,X
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	CPX $0E			  ; E4 0E | Compare X register (zero page)
	NOP				  ; EA | No operation
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $9A			  ; 24 9A | Test bits in accumulator (zero page)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	PHX				  ; DA | Push X register to stack
	AND ($B1),Y		  ; 31 B1 | Logical AND with accumulator ((zero page),Y)
	INC $DB8B,X		  ; FE 8B DB | Increment (absolute,X)
	BRA $41			  ; 80 41 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_13F
; Address: $E0B3BB
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_13F:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $03			  ; 80 03 | Branch always
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $1D07			; 0E 07 1D | Arithmetic shift left (absolute)
	ASL $28			  ; 06 28 | Arithmetic shift left (zero page)
	EOR $B510,Y		  ; 59 10 B5 | Exclusive OR with accumulator (absolute,Y)
	ADC $01			  ; 65 01 | Add with carry (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ROL $7D13,X		  ; 3E 13 7D | Rotate left (absolute,X)
	SBC $0000			; ED 00 00 | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	STA				  ; 9F 1F 3F 3E | Store accumulator to absolute long,X
	ADC $F5FF,X		  ; 7D FF F5 | Add with carry (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	BCS $FF			  ; B0 FF | Branch if carry set
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $3D07			; 0E 07 3D | Arithmetic shift left (absolute)
	ASL $E8			  ; 06 E8 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_140
; Address: $E0B429
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_140:
	JSL $351019		  ; 22 19 10 35 | Jump to subroutine long
	LDY $0125,X		  ; BC 25 01 | Load from absolute,X into Y register
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	INC $FD13,X		  ; FE 13 FD | Increment (absolute,X)
	SBC $0415			; ED 15 04 | Subtract with carry (absolute)
	BIT $4E			  ; 24 4E | Test bits in accumulator (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $9A			  ; 24 9A | Test bits in accumulator (zero page)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	INC				  ; 1A | Increment accumulator
	SBC ($71),Y		  ; F1 71 | Subtract with carry ((zero page),Y)
	INC $DB8B,X		  ; FE 8B DB | Increment (absolute,X)
	BRA $41			  ; 80 41 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $01			  ; 80 01 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_143
; Address: $E0B489
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_143:
	NOP				  ; EA | No operation
	INX				  ; E8 | Increment X register
	TAX				  ; AA | Transfer accumulator to X register
	BIT $52FF			; 2C FF 52 | Test bits in accumulator (absolute)
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	JMP $A6B5BC		  ; 5C BC B5 A6 | Jump to address long
	DEC				  ; 3A | Decrement accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $F51F,X		  ; FD 1F F5 | Subtract with carry (absolute,X)
	SBC $E61B,X		  ; FD 1B E6 | Subtract with carry (absolute,X)
	ADC $04			  ; 65 04 | Add with carry (zero page)
	STY $4E			  ; 84 4E | Store Y register to zero page
	ROL				  ; 2A | Rotate left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	BIT $1A			  ; 24 1A | Test bits in accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	SBC ($D1),Y		  ; F1 D1 | Subtract with carry ((zero page),Y)
	LDX $9B0B,Y		  ; BE 0B 9B | Load from absolute,Y into X register
	BRA $81			  ; 80 81 | Branch always
	BRA $00			  ; 80 00 | Branch always
	EOR #$09			 ; 49 09 | Exclusive OR with accumulator (immediate)
	ORA #$7F			 ; 09 7F | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BIT $6D2C			; 2C 2C 6D | Test bits in accumulator (absolute)
	ADC $5B5B			; 6D 5B 5B | Add with carry (absolute)
	PLP				  ; 28 | Pull processor status from stack
	NOP				  ; EA | No operation
	CMP $CE60,Y		  ; D9 60 CE | Compare accumulator (absolute,Y)
	SBC #$31			 ; E9 31 | Subtract with carry (immediate)
	SBC $FE91,Y		  ; F9 91 FE | Subtract with carry (absolute,Y)
	INC $EF41,X		  ; FE 41 EF | Increment (absolute,X)
	EOR #$BB			 ; 49 BB | Exclusive OR with accumulator (immediate)
	DEC $31			  ; C6 31 | Decrement (zero page)
	LDA $B600			; AD 00 B6 | Load from absolute address into accumulator
	PHX				  ; DA | Push X register to stack
	CPX $D610			; EC 10 D6 | Compare X register (absolute)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $04			  ; 25 04 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_144
; Address: $E0B550
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_144:
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ADC $E8FF,Y		  ; 79 FF E8 | Add with carry (absolute,Y)
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $20			  ; 80 20 | Branch always
	SBC $FBC0,X		  ; FD C0 FB | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_145
; Address: $E0B576
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_145:
	JSR $01E8			; 20 E8 01 | Jump to subroutine
	BEQ $82			  ; F0 82 | Branch if equal
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	CMP $DE60,Y		  ; D9 60 DE | Compare accumulator (absolute,Y)
	ROR $C9			  ; 66 C9 | Rotate right (zero page)
	AND ($E9),Y		  ; 31 E9 | Logical AND with accumulator ((zero page),Y)
	STA ($F6),Y		  ; 91 F6 | Store accumulator to (zero page),Y
	INC $FF41,X		  ; FE 41 FF | Increment (absolute,X)
	ORA #$3B			 ; 09 3B | Logical OR with accumulator (immediate)
	INC $31			  ; E6 31 | Increment (zero page)
	STA $A610			; 8D 10 A6 | Store accumulator to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $6600			; EC 00 66 | Compare X register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	STY $000C			; 8C 0C 00 | Store Y register to absolute address
	PHP				  ; 08 | Push processor status to stack
	CMP $9B9F,X		  ; DD 9F 9B | Compare accumulator (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	BMI $30			  ; 30 30 | Branch if negative
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	PLX				  ; FA | Pull X register from stack
	BCC $FE			  ; 90 FE | Branch if carry clear

;------------------------------------------------------------------------------
; Bank40_DmaFunction_147
; Address: $E0B5FB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_147:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BVC $F2			  ; 50 F2 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_148
; Address: $E0B604
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_148:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	PLX				  ; FA | Pull X register from stack
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $01			  ; 80 01 | Branch always
	BRA $01			  ; 80 01 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CMP $DE60,Y		  ; D9 60 DE | Compare accumulator (absolute,Y)
	ROR $D9			  ; 66 D9 | Rotate right (zero page)
	ADC ($C9,X)		  ; 61 C9 | Add with carry ((zero page,X))
	AND ($E6),Y		  ; 31 E6 | Logical AND with accumulator ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA ($6F,X)		  ; 01 6F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND ($CF),Y		  ; 31 CF | Logical AND with accumulator ((zero page),Y)
	EOR $8630			; 4D 30 86 | Exclusive OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	LDX #$04			 ; A2 04 | Load immediate value into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR $3610			; 4E 10 36 | Logical shift right (absolute)
	ORA $0F09,Y		  ; 19 09 0F | Logical OR with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BCC $FF			  ; 90 FF | Branch if carry clear
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	INC $CDFF			; EE FF CD | Increment (absolute)
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	BNE $D2			  ; D0 D2 | Branch if not equal
	BRA $B6			  ; 80 B6 | Branch always
	LDY $FF			  ; A4 FF | Load from zero page into Y register
	RTI				  ; 40 | Return from interrupt
	BVC $7B			  ; 50 7B | Branch if overflow clear
	BRA $D2			  ; 80 D2 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_149
; Address: $E0B6FD
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_149:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	EOR #$40			 ; 49 40 | Exclusive OR with accumulator (immediate)
	LDY $F6B5,X		  ; BC B5 F6 | Load from absolute,X into Y register
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $F5DF,X		  ; FD DF F5 | Subtract with carry (absolute,X)
	SBC $E65B,X		  ; FD 5B E6 | Subtract with carry (absolute,X)
	STY $4E			  ; 84 4E | Store Y register to zero page
	ROL				  ; 2A | Rotate left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	BIT $1A			  ; 24 1A | Test bits in accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	INC				  ; 1A | Increment accumulator
	SBC ($D1),Y		  ; F1 D1 | Subtract with carry ((zero page),Y)
	LDX $9B0B,Y		  ; BE 0B 9B | Load from absolute,Y into X register
	BRA $81			  ; 80 81 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$78			 ; C0 78 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	STZ $F39E,X		  ; 9E 9E F3 | Store zero to absolute,X
	STX $FE8E			; 8E 8E FE | Store X register to absolute address
	ROR $2777,X		  ; 7E 77 27 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag
	STY $72FF			; 8C FF 72 | Store Y register to absolute address
	ORA $7F			  ; 05 7F | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $4100,X		  ; 1E 00 41 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	DEC $F6DE,X		  ; DE DE F6 | Decrement (absolute,X)
	SBC $00ED			; ED ED 00 | Subtract with carry (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FF40,X		  ; FE 40 FF | Increment (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	STZ $64FF,X		  ; 9E FF 64 | Store zero to absolute,X
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0700			; 0D 00 07 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($DC,X)		  ; 01 DC | Logical OR with accumulator ((zero page,X))
	ROL $F43E,X		  ; 3E 3E F4 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_14A
; Address: $E0B7A6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_14A:
	ROR $7F1E,X		  ; 7E 1E 7F | Rotate right (absolute,X)
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	STZ $FF			  ; 64 FF | Store zero to zero page
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_14B
; Address: $E0B7E4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_14B:
	BCS $20			  ; B0 20 | Branch if carry set
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	CPX #$24			 ; E0 24 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_14E
; Address: $E0B7F8
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_14E:
	JSR $A0F8			; 20 F8 A0 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BCS $FC			  ; B0 FC | Branch if carry set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	AND $2B0C			; 2D 0C 2B | Logical AND with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	BPL $B4			  ; 10 B4 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_14F
; Address: $E0B849
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_14F:
	JSR $0068			; 20 68 00 | Jump to subroutine
	ROL $7E02,X		  ; 3E 02 7E | Rotate left (absolute,X)
	BPL $74			  ; 10 74 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_150
; Address: $E0B858
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_150:
	JSR $00EC			; 20 EC 00 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SBC #$70			 ; E9 70 | Subtract with carry (immediate)
	DEC $D966,X		  ; DE 66 D9 | Decrement (absolute,X)
	ADC ($D9,X)		  ; 61 D9 | Add with carry ((zero page,X))
	AND ($EE,X)		  ; 21 EE | Logical AND with accumulator ((zero page,X))
	INC $7F09,X		  ; FE 09 7F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_151
; Address: $E0B88D
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_151:
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND ($EF),Y		  ; 31 EF | Logical AND with accumulator ((zero page),Y)
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	STX $1A			  ; 86 1A | Store X register to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	JMP $200E00		  ; 5C 00 0E 20 | Jump to address long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA $030F			; 0D 0F 03 | Logical OR with accumulator (absolute)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLB				  ; AB | Pull data bank register from stack
	ADC $D8FF			; 6D FF D8 | Add with carry (absolute)
	LDA				  ; BF 14 17 00 | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	BCC $DF			  ; 90 DF | Branch if carry clear
	LDX $1500,Y		  ; BE 00 15 | Load from absolute,Y into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0D1F,X		  ; 1E 1F 0D | Arithmetic shift left (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STY $80			  ; 84 80 | Store Y register to zero page
	CPX $E0			  ; E4 E0 | Game work RAM access
	BVS $DA			  ; 70 DA | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	BMI $E9			  ; 30 E9 | Branch if negative
	INX				  ; E8 | Increment X register
	CMP $38DC,X		  ; DD DC 38 | Compare accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	LDY #$FC			 ; A0 FC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_152
; Address: $E0B994
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_152:
	BVS $FE			  ; 70 FE | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag
	INC $FE30,X		  ; FE 30 FE | Increment (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $FF08FF		  ; 5C FF 08 FF | Jump to address long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_153
; Address: $E0B9F6
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_153:
	JSL $001400		  ; 22 00 14 00 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	DEC $03			  ; C6 03 | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	SBC #$E0			 ; E9 E0 | Game work RAM access
	LDA $AC			  ; A5 AC | Load from zero page into accumulator
	JMP $3ABE15		  ; 5C 15 BE 3A | Jump to address long
	SBC $0160,Y		  ; F9 60 01 | Subtract with carry (absolute,Y)
	SBC $F50F,X		  ; FD 0F F5 | Subtract with carry (absolute,X)
	SBC $FE23,X		  ; FD 23 FE | Subtract with carry (absolute,X)
	EOR ($EF),Y		  ; 51 EF | Exclusive OR with accumulator ((zero page),Y)
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BPL $11			  ; 10 11 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	TXA				  ; 8A | Transfer X register to accumulator
	LDA ($11),Y		  ; B1 11 | Load from (zero page),Y into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEP #$60			 ; E2 60 | Set processor status bits
	ADC $8E38,Y		  ; 79 38 8E | Add with carry (absolute,Y)
	ASL $3373			; 0E 73 33 | Arithmetic shift left (absolute)
	BMI $10			  ; 30 10 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_154
; Address: $E0BA51
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_154:
	INC $FF18,X		  ; FE 18 FF | Increment (absolute,X)
	ASL $33FF			; 0E FF 33 | Arithmetic shift left (absolute)
	BPL $3F			  ; 10 3F | Branch if positive
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_156
; Address: $E0BA68
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_156:
	JSR $D000			; 20 00 D0 | Jump to subroutine
	CPY #$4C			 ; C0 4C | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BVS $FF			  ; 70 FF | Branch if overflow set
	ORA $377F,X		  ; 1D 7F 37 | Logical OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $040F			; 0D 0F 04 | Logical OR with accumulator (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_157
; Address: $E0BA92
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_157:
	JSL $3F087F		  ; 22 7F 08 3F | Jump to subroutine long
	ORA $0400			; 0D 00 04 | Logical OR with accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_158
; Address: $E0BAAC
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_158:
	JSR $9C00			; 20 00 9C | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	STX $03			  ; 86 03 | Store X register to zero page
	ADC $02			  ; 65 02 | Add with carry (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SBC $EC			  ; E5 EC | Subtract with carry (zero page)
	DEC				  ; 3A | Decrement accumulator
	SBC $0160,Y		  ; F9 60 01 | Subtract with carry (absolute,Y)
	SBC $F54F,X		  ; FD 4F F5 | Subtract with carry (absolute,X)
	SBC $F62B,X		  ; FD 2B F6 | Subtract with carry (absolute,X)
	EOR ($EF),Y		  ; 51 EF | Exclusive OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $B86E,X		  ; 5E 6E B8 | Logical shift right (absolute,X)
	INX				  ; E8 | Increment X register
	JMP ($00B0)		  ; 6C B0 00 | Jump to address (absolute indirect)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_159
; Address: $E0BB17
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_159:
	JSR $4428			; 20 28 44 | Jump to subroutine
	BRA $C8			  ; 80 C8 | Branch always
	BPL $20			  ; 10 20 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TSX				  ; BA | Transfer stack pointer to X register
	DEC				  ; 3A | Decrement accumulator
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_15A
; Address: $E0BB32
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_15A:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ADC $FF			  ; 65 FF | Add with carry (zero page)
	BCC $FF			  ; 90 FF | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $0800,X		  ; 3E 00 08 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_15C
; Address: $E0BB78
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_15C:
	JSL $001400		  ; 22 00 14 00 | Jump to subroutine long
	DEC $D966,X		  ; DE 66 D9 | Decrement (absolute,X)
	ADC ($C9,X)		  ; 61 C9 | Add with carry ((zero page,X))
	ADC ($E6),Y		  ; 71 E6 | Add with carry ((zero page),Y)
	AND $8BFD,X		  ; 3D FD 8B | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	EOR $4630			; 4D 30 46 | Exclusive OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	LDX #$0C			 ; A2 0C | Load immediate value into X register
	BCS $02			  ; B0 02 | Branch if carry set
	DEC $1770			; CE 70 17 | Decrement (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($04,X)		  ; 81 04 | Store accumulator to (zero page,X)
	ASL $0706			; 0E 06 07 | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	JMP $FAFA5C		  ; 5C 5C FA FA | Jump to address long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_15D
; Address: $E0BC0C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_15D:
	LDA				  ; BF BF FF 9B | Load from absolute long,X into accumulator
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_15E
; Address: $E0BC1C
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_15E:
	STX $FF			  ; 86 FF | Store X register to zero page
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $D966,X		  ; DE 66 D9 | Decrement (absolute,X)
	ADC ($C9,X)		  ; 61 C9 | Add with carry ((zero page,X))
	ADC ($E6),Y		  ; 71 E6 | Add with carry ((zero page),Y)
	STA $09FF,X		  ; 9D FF 09 | Store accumulator to absolute,X
	PHP				  ; 08 | Push processor status to stack
	EOR $4630			; 4D 30 46 | Exclusive OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	LDX #$0C			 ; A2 0C | Load immediate value into X register
	BCS $00			  ; B0 00 | Branch if carry set
	DEC $6E00,X		  ; DE 00 6E | Decrement (absolute,X)
	BMI $17			  ; 30 17 | Branch if negative
	ORA ($0A),Y		  ; 11 0A | Logical OR with accumulator ((zero page),Y)
	ORA #$27			 ; 09 27 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_15F
; Address: $E0BC8A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_15F:
	JSR $4000			; 20 00 40 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	BMI $38			  ; 30 38 | Branch if negative
	BVS $70			  ; 70 70 | Branch if overflow set
	ROR $B83E,X		  ; 7E 3E B8 | Rotate right (absolute,X)
	BNE $F0			  ; D0 F0 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $20			  ; 90 20 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	BNE $F0			  ; D0 F0 | Branch if not equal
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	LDY #$60			 ; A0 60 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_160
; Address: $E0BCCA
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_160:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BNE $FC			  ; D0 FC | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $C0			  ; 10 C0 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_161
; Address: $E0BD27
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_161:
	JSR $0030			; 20 30 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX $0C			  ; E4 0C | Compare X register (zero page)
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	INC $393E,X		  ; FE 3E 39 | Increment (absolute,X)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	INC $E9F6			; EE F6 E9 | Increment (absolute)
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$58			 ; E0 58 | Compare X register (immediate)
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	CPX #$B9			 ; E0 B9 | Compare X register (immediate)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_164
; Address: $E0BDB9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_164:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_165
; Address: $E0BDCD
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_165:
	RTI				  ; 40 | Return from interrupt
	BCC $80			  ; 90 80 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_166
; Address: $E0BDDF
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_166:
	BEQ $03			  ; F0 03 | Branch if equal
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ASL $7D			  ; 06 7D | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $1F05			; 0D 05 1F | Logical OR with accumulator (absolute)
	ORA ($7F),Y		  ; 11 7F | Logical OR with accumulator ((zero page),Y)
	SBC $FDE5			; ED E5 FD | Subtract with carry (absolute)
	SBC $64FA,Y		  ; F9 FA 64 | Subtract with carry (absolute,Y)
	EOR $21			  ; 45 21 | PPU graphics register access
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	BMI $40			  ; 30 40 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	PEA #$00E7		   ; F4 E7 00 | Push effective address to stack
	ORA ($A5,X)		  ; 01 A5 | Logical OR with accumulator ((zero page,X))
	LDA ($50,X)		  ; A1 50 | Load from (zero page,X) into accumulator
	EOR ($C8),Y		  ; 51 C8 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	BMI $30			  ; 30 30 | Branch if negative
	SBC $FED9,Y		  ; F9 D9 FE | Subtract with carry (absolute,Y)
	PEA #$EC94		   ; F4 94 EC | Push effective address to stack
	STZ $32BA			; 9C BA 32 | Store zero to absolute
	CMP $5FE6,Y		  ; D9 E6 5F | Compare accumulator (absolute,Y)
	SBC ($B7,X)		  ; E1 B7 | Subtract with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	CPY #$3A			 ; C0 3A | Compare Y register (immediate)
	STY $12			  ; 84 12 | Store Y register to zero page
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $1F1D			; 0D 1D 1F | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_167
; Address: $E0BE6C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_167:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ORA $2725			; 0D 25 27 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_168
; Address: $E0BE78
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_168:
	RTI				  ; 40 | Return from interrupt
	EOR ($9C,X)		  ; 41 9C | Exclusive OR with accumulator ((zero page,X))
	STA				  ; 9F A0 A0 40 | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	LSR $46			  ; 46 46 | Logical shift right (zero page)
	EOR #$49			 ; 49 49 | Exclusive OR with accumulator (immediate)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ORA #$7F			 ; 09 7F | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	BMI $F0			  ; 30 F0 | Branch if negative
	CPX #$30			 ; E0 30 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_169
; Address: $E0BEA5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_169:
	JSR $4060			; 20 60 40 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SBC ($C1,X)		  ; E1 C1 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_16A
; Address: $E0BEB0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_16A:
	JSR $C0F8			; 20 F8 C0 | Jump to subroutine
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CLD				  ; D8 | Clear decimal mode flag
	BMI $F8			  ; 30 F8 | Branch if negative
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_16B
; Address: $E0BEEF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_16B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $02			  ; F0 02 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_16D
; Address: $E0BF23
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_16D:
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	BMI $70			  ; 30 70 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_16E
; Address: $E0BF28
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_16E:
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BMI $20			  ; 30 20 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_16F
; Address: $E0BF2D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_16F:
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_170
; Address: $E0BF37
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_170:
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA $000D			; 0D 0D 00 | Logical OR with accumulator (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	BPL $7E			  ; 10 7E | Branch if positive
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $7E			  ; 10 7E | Branch if positive
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $000D			; 0D 0D 00 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_171
; Address: $E0BFA9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_171:
	RTI				  ; 40 | Return from interrupt
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BMI $20			  ; 30 20 | Branch if negative
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BPL $3C			  ; 10 3C | Branch if positive
	SEC				  ; 38 | Set carry flag
	ROL $5E2C			; 2E 2C 5E | Rotate left (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank40_DmaFunction_172
; Address: $E0BFD9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_172:
	CLC				  ; 18 | Clear carry flag
	BPL $3C			  ; 10 3C | Branch if positive
	ROL $7E00,X		  ; 3E 00 7E | Rotate left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_174
; Address: $E0C009
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_174:
	JSR $C0F0			; 20 F0 C0 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	BMI $F0			  ; 30 F0 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	STY $C18C			; 8C 8C C1 | Store Y register to absolute address
	CMP ($42,X)		  ; C1 42 | Hardware register operation
	WDM #$64			 ; 42 64 | Reserved instruction
	STZ $21			  ; 64 21 | PPU graphics register access
	AND ($32,X)		  ; 21 32 | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	BIT $7F			  ; 24 7F | Test bits in accumulator (zero page)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SEP #$F4			 ; E2 F4 | Set processor status bits
	CPX $35			  ; E4 35 | Compare X register (zero page)
	SBC $FBED,X		  ; FD ED FB | Subtract with carry (absolute,X)
	BRA $F3			  ; 80 F3 | Branch always
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)
	AND ($F7,X)		  ; 21 F7 | Logical AND with accumulator ((zero page,X))
	STA $FF			  ; 85 FF | Store accumulator to zero page
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	STZ $E0FF			; 9C FF E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	INC $FF20,X		  ; FE 20 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_175
; Address: $E0C092
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_175:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FE			  ; 80 FE | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $FFB8,X		  ; FE B8 FF | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	LSR $46			  ; 46 46 | Logical shift right (zero page)
	EOR #$49			 ; 49 49 | Exclusive OR with accumulator (immediate)
	STY $C18C			; 8C 8C C1 | Store Y register to absolute address
	CMP ($64,X)		  ; C1 64 | Compare accumulator ((zero page,X))
	STZ $38			  ; 64 38 | Store zero to zero page
	CLC				  ; 18 | Clear carry flag
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ORA #$7F			 ; 09 7F | Logical OR with accumulator (immediate)
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	BIT $7F			  ; 24 7F | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	BVS $60			  ; 70 60 | Branch if overflow set
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SBC ($C1,X)		  ; E1 C1 | Subtract with carry ((zero page,X))
	SEP #$F3			 ; E2 F3 | Set processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_176
; Address: $E0C0F1
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_176:
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SBC ($80,X)		  ; E1 80 | Subtract with carry ((zero page,X))
	SBC ($F3,X)		  ; E1 F3 | Subtract with carry ((zero page,X))
	STA $7C7F8F		  ; 8F 8F 7F 7C | Store accumulator to absolute long address
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	BVS $FF			  ; 70 FF | Branch if overflow set
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_177
; Address: $E0C11A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_177:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	INC $C0F0			; EE F0 C0 | Increment (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_179
; Address: $E0C12A
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_179:
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	AND ($7F,X)		  ; 21 7F | Logical AND with accumulator ((zero page,X))
	LSR $38FF,X		  ; 5E FF 38 | Logical shift right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BMI $F0			  ; 30 F0 | Branch if negative
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal

;------------------------------------------------------------------------------
; Bank40_DmaFunction_17A
; Address: $E0C16B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_17A:
	JSR $0363			; 20 63 03 | Jump to subroutine
	BMI $F8			  ; 30 F8 | Branch if negative
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BCS $F8			  ; B0 F8 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_17B
; Address: $E0C179
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_17B:
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $2719,Y		  ; 19 19 27 | Logical OR with accumulator (absolute,Y)
	CLD				  ; D8 | Clear decimal mode flag
	JMP ($81FF)		  ; 6C FF 81 | Jump to address (absolute indirect)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BPL $FF			  ; 10 FF | Branch if positive
	RTI				  ; 40 | Return from interrupt
	LDX $7CB8,Y		  ; BE B8 7C | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BRA $F8			  ; 80 F8 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_17C
; Address: $E0C1A9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_17C:
	JSR $00F0			; 20 F0 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $F0			  ; 80 F0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$12			 ; E0 12 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_17D
; Address: $E0C1C2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_17D:
	JSR $4720			; 20 20 47 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	STY $C08C			; 8C 8C C0 | Store Y register to absolute address
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BMI $20			  ; 30 20 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_17E
; Address: $E0C1E3
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_17E:
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	CPX $C4			  ; E4 C4 | Compare X register (zero page)
	SBC $F9E9,Y		  ; F9 E9 F9 | Subtract with carry (absolute,Y)
	SBC #$20			 ; E9 20 | Subtract with carry (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	CPY #$E7			 ; C0 E7 | Compare Y register (immediate)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	DEC $3C3F			; CE 3F 3C | Decrement (absolute)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_17F
; Address: $E0C218
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_17F:
	JSR $C0FF			; 20 FF C0 | Jump to subroutine
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BVS $F8			  ; 70 F8 | Branch if overflow set
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_180
; Address: $E0C227
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_180:
	JSR $C0F0			; 20 F0 C0 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_181
; Address: $E0C233
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_181:
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank40_DmaFunction_182
; Address: $E0C239
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_182:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$6F			 ; C0 6F | Compare Y register (immediate)
	ADC $3E7F,X		  ; 7D 7F 3E | Add with carry (absolute,X)
	ADC ($3F),Y		  ; 71 3F | Add with carry ((zero page),Y)
	BIT $303F			; 2C 3F 30 | Test bits in accumulator (absolute)
	BIT $077F			; 2C 7F 07 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_184
; Address: $E0C25E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_184:
	JSR $FF3F			; 20 3F FF | Jump to subroutine
	INC $F8F8,X		  ; FE F8 F8 | Increment (absolute,X)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $F0			  ; 80 F0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $F810,X		  ; FE 10 F8 | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	JMP ($6CFF)		  ; 6C FF 6C | Jump to address (absolute indirect)
	ROR $7E34,X		  ; 7E 34 7E | Rotate right (absolute,X)
	BPL $38			  ; 10 38 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	ROR $7E28,X		  ; 7E 28 7E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_185
; Address: $E0C296
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_185:
	JSR $103C			; 20 3C 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ADC $737F,X		  ; 7D 7F 73 | Add with carry (absolute,X)
	ROL $187F,X		  ; 3E 7F 18 | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_186
; Address: $E0C2AD
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_186:
	JSR $080F			; 20 0F 08 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BMI $7F			  ; 30 7F | Branch if negative
	SEC				  ; 38 | Set carry flag
	ASL $03FF			; 0E FF 03 | Arithmetic shift left (absolute)
	CPY $00FF			; CC FF 00 | Compare Y register (absolute)
	INC $FC70,X		  ; FE 70 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA				  ; 9F 00 FF 00 | Store accumulator to absolute long,X
	BCS $00			  ; B0 00 | Branch if carry set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_187
; Address: $E0C2DB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_187:
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROR $707F,X		  ; 7E 7F 70 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_189
; Address: $E0C313
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_189:
	ADC $7300,X		  ; 7D 00 73 | Add with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_18A
; Address: $E0C32C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_18A:
	BEQ $00			  ; F0 00 | Branch if equal
	LDX $7700,Y		  ; BE 00 77 | Load from absolute,Y into X register
	BRA $00			  ; 80 00 | Branch always
	STZ $64			  ; 64 64 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank40_DmaFunction_18B
; Address: $E0C342
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_18B:
	JSR $3320			; 20 20 33 | Jump to subroutine
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BIT $7F			  ; 24 7F | Test bits in accumulator (zero page)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CPX $C4			  ; E4 C4 | Compare X register (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_18C
; Address: $E0C374
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_18C:
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	STY $FF			  ; 84 FF | Store Y register to zero page
	DEC $0BFF			; CE FF 0B | Decrement (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FE			  ; F0 FE | Branch if equal
	INC $B8FE,X		  ; FE FE B8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	INC $FFD4,X		  ; FE D4 FF | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	BEQ $C0			  ; F0 C0 | Branch if equal
	BCC $90			  ; 90 90 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank40_DmaFunction_18D
; Address: $E0C3E4
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_18D:
	BVS $60			  ; 70 60 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	BPL $7C			  ; 10 7C | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	BPL $38			  ; 10 38 | Branch if positive
	BMI $F0			  ; 30 F0 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BMI $F8			  ; 30 F8 | Branch if negative
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LSR $9F9F			; 4E 9F 9F | Logical shift right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	ASL $1CFF,X		  ; 1E FF 1C | Arithmetic shift left (absolute,X)
	ROR $BC6E			; 6E 6E BC | Rotate right (absolute)
	CLV				  ; B8 | Clear overflow flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROR $FC30,X		  ; 7E 30 FC | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROR $7F			  ; 66 7F | Rotate right (zero page)
	SBC $06FF,X		  ; FD FF 06 | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_18E
; Address: $E0C471
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_18E:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	BCS $FF			  ; B0 FF | Branch if carry set
	CPY $11FF			; CC FF 11 | Compare Y register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BVS $20			  ; 70 20 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_18F
; Address: $E0C4BC
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_18F:
	JSR $2030			; 20 30 20 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	LDA				  ; BF BF CF CF | Load from absolute long,X into accumulator
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	RTI				  ; 40 | Return from interrupt
	ASL $A7			  ; 06 A7 | Arithmetic shift left (zero page)
	JMP $13FF			; 4C FF 13 | Jump to address
	LDA				  ; BF 04 9F 03 | Load from absolute long,X into accumulator
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	DEC $07CC			; CE CC 07 | Decrement (absolute)
	ASL $8383,X		  ; 1E 83 83 | Arithmetic shift left (absolute,X)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $B0			  ; F0 B0 | Branch if equal
	INY				  ; C8 | Increment Y register
	INC $FF04,X		  ; FE 04 FF | Increment (absolute,X)
	ASL $83FF,X		  ; 1E FF 83 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank40_DmaFunction_190
; Address: $E0C50C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_190:
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $F8			  ; 80 F8 | Branch always
	LSR $7A7B,X		  ; 5E 7B 7A | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_191
; Address: $E0C52B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_191:
	JSR $3C3F			; 20 3F 3C | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	BPL $7F			  ; 10 7F | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_192
; Address: $E0C53E
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_192:
	BMI $3F			  ; 30 3F | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$31			 ; C0 31 | Compare Y register (immediate)
	AND ($FA,X)		  ; 21 FA | Logical AND with accumulator ((zero page,X))
	PEA #$75E4		   ; F4 E4 75 | Push effective address to stack
	ADC $E9			  ; 65 E9 | Add with carry (zero page)
	CMP #$EB			 ; C9 EB | Compare accumulator (immediate)
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_193
; Address: $E0C570
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_193:
	JSR $F0F1			; 20 F1 F0 | Jump to subroutine
	BRA $F7			  ; 80 F7 | Branch always
	ADC ($F7,X)		  ; 61 F7 | Add with carry ((zero page,X))
	STA ($EF,X)		  ; 81 EF | Store accumulator to (zero page,X)
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	AND $737F,X		  ; 3D 7F 73 | Logical AND with accumulator (absolute,X)
	ROR $FCFF,X		  ; 7E FF FC | Rotate right (absolute,X)
	INC $FF30,X		  ; FE 30 FF | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_194
; Address: $E0C594
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_194:
	CMP $B3FF,Y		  ; D9 FF B3 | Compare accumulator (absolute,Y)
	WDM #$FF			 ; 42 FF | Reserved instruction
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$FE			 ; E0 FE | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_195
; Address: $E0C59E
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_195:
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $30			  ; F0 30 | Branch if equal
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $7F			  ; 10 7F | Branch if positive
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CLD				  ; D8 | Clear decimal mode flag
	BNE $7C			  ; D0 7C | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	BCS $B0			  ; B0 B0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank40_DmaFunction_196
; Address: $E0C60B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_196:
	JSR $40E0			; 20 E0 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_197
; Address: $E0C612
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_197:
	JSR $D0FC			; 20 FC D0 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_198
; Address: $E0C61A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_198:
	JSR $40F0			; 20 F0 40 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	JMP ($347E)		  ; 6C 7E 34 | Jump to address (absolute indirect)
	BMI $78			  ; 30 78 | Branch if negative

;------------------------------------------------------------------------------
; Bank40_DmaFunction_19A
; Address: $E0C62C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_19A:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	ROR $3C20,X		  ; 7E 20 3C | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_19D
; Address: $E0C641
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_19D:
	BPL $00			  ; 10 00 | Branch if positive
	DEC $46			  ; C6 46 | Decrement (zero page)
	ADC ($21,X)		  ; 61 21 | PPU graphics register access
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA $0605			; 0D 05 06 | Logical OR with accumulator (absolute)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	AND ($7F,X)		  ; 21 7F | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	BVS $60			  ; 70 60 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	BCS $F0			  ; B0 F0 | Branch if carry set
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_19F
; Address: $E0C689
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_19F:
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1A0
; Address: $E0C691
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1A0:
	BEQ $B0			  ; F0 B0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $3C			  ; 80 3C | Branch always
	ROL $4F25,X		  ; 3E 25 4F | Rotate left (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	SBC $F5			  ; E5 F5 | Subtract with carry (zero page)
	STZ $6E			  ; 64 6E | Store zero to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC ($0E,X)		  ; 61 0E | Add with carry ((zero page,X))
	BEQ $17			  ; F0 17 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC ($11),Y		  ; 71 11 | Add with carry ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $26			  ; 06 26 | Arithmetic shift left (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	ROL $4E			  ; 26 4E | Rotate left (zero page)
	LSR $3131			; 4E 31 31 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1A1
; Address: $E0C6D1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1A1:
	JSR $29F6			; 20 F6 29 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 60 1F 20 | Store accumulator to absolute long,X
	ROL $4E11			; 2E 11 4E | Rotate left (absolute)
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1A2
; Address: $E0C6EC
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1A2:
	JSR $5A01			; 20 01 5A | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $2D			  ; 05 2D | Logical OR with accumulator (zero page)
	ASL $1352			; 0E 52 13 | Arithmetic shift left (absolute)
	PHY				  ; 5A | Push Y register to stack
	INC				  ; 1A | Increment accumulator
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $3C0F,X		  ; 1D 0F 3C | Logical OR with accumulator (absolute,X)
	ROR $7F12,X		  ; 7E 12 7F | Rotate right (absolute,X)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $0906			; 0E 06 09 | Arithmetic shift left (absolute)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $3E01			; 0E 01 3E | Arithmetic shift left (absolute)
	ORA $2266			; 0D 66 22 | Logical OR with accumulator (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $0600			; 0D 00 06 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ROL $7F01,X		  ; 3E 01 7F | Rotate left (absolute,X)
	ORA $0904			; 0D 04 09 | Logical OR with accumulator (absolute)
	ASL $0906			; 0E 06 09 | Arithmetic shift left (absolute)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ROL $5E1D,X		  ; 3E 1D 5E | Rotate left (absolute,X)
	ORA $0D03,X		  ; 1D 03 0D | Logical OR with accumulator (absolute,X)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $0600			; 0D 00 06 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	BPL $7E			  ; 10 7E | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1A3
; Address: $E0C768
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1A3:
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	BPL $D3			  ; 10 D3 | Branch if positive
	LSR				  ; 4A | Logical shift right (accumulator)
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $1C			  ; 10 1C | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PHY				  ; 5A | Push Y register to stack
	ROL $00DB,X		  ; 3E DB 00 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $6A			  ; 10 6A | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1A4
; Address: $E0C78F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1A4:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR				  ; 6A | Rotate right (accumulator)
	EOR $FC1D,X		  ; 5D 1D FC | Exclusive OR with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1A5
; Address: $E0C7A5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1A5:
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	SBC ($4F,X)		  ; E1 4F | Subtract with carry ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $4F7F,Y		  ; 19 7F 4F | Logical OR with accumulator (absolute,Y)
	INC $FC0F,X		  ; FE 0F FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $7F			  ; F0 7F | Branch if equal
	BEQ $3F			  ; F0 3F | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1A6
; Address: $E0C7BF
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1A6:
	JSR $79F8			; 20 F8 79 | Jump to subroutine
	CMP $BD4A,X		  ; DD 4A BD | Compare accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	ADC #$FB			 ; 69 FB | Add with carry (immediate)
	SBC #$73			 ; E9 73 | Subtract with carry (immediate)
	ADC ($66),Y		  ; 71 66 | Add with carry ((zero page),Y)
	EOR ($FE),Y		  ; 51 FE | Exclusive OR with accumulator ((zero page),Y)
	INC $FE2F,X		  ; FE 2F FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $3F			  ; 70 3F | Branch if overflow set
	BMI $5F			  ; 30 5F | Branch if negative
	LDA $BC31,X		  ; BD 31 BC | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1A7
; Address: $E0C7E5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1A7:
	JSR $56CE			; 20 CE 56 | Jump to subroutine
	DEC $5E			  ; C6 5E | Decrement (zero page)
	ADC ($3F),Y		  ; 71 3F | Add with carry ((zero page),Y)
	AND #$F7			 ; 29 F7 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1A8
; Address: $E0C7F4
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1A8:
	CLC				  ; 18 | Clear carry flag
	PHY				  ; 5A | Push Y register to stack
	ASL $1BE7,X		  ; 1E E7 1B | Arithmetic shift left (absolute,X)
	AND $1EF3,X		  ; 3D F3 1E | Logical AND with accumulator (absolute,X)
	ADC ($BE),Y		  ; 71 BE | Add with carry ((zero page),Y)
	LDA				  ; BF 23 CD 51 | Load from absolute long,X into accumulator
	CPY $5C			  ; C4 5C | Compare Y register (zero page)
	DEC $5E			  ; C6 5E | Decrement (zero page)
	ROR $3F73,X		  ; 7E 73 3F | Rotate right (absolute,X)
	ADC ($3F),Y		  ; 71 3F | Add with carry ((zero page),Y)
	AND #$F7			 ; 29 F7 | Logical AND with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	EOR $18E7,Y		  ; 59 E7 18 | Exclusive OR with accumulator (absolute,Y)
	ASL $3AE7,X		  ; 1E E7 3A | Arithmetic shift left (absolute,X)
	ORA $1E73,X		  ; 1D 73 1E | Logical OR with accumulator (absolute,X)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ASL $4F61,X		  ; 1E 61 4F | Arithmetic shift left (absolute,X)
	STA ($74),Y		  ; 91 74 | Store accumulator to (zero page),Y
	TXA				  ; 8A | Transfer X register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $42			  ; A4 42 | Hardware register operation
	TSX				  ; BA | Transfer stack pointer to X register
	TXS				  ; 9A | Transfer X register to stack pointer
	NOP				  ; EA | No operation
	ADC $0019,Y		  ; 79 19 00 | Add with carry (absolute,Y)
	AND ($FE,X)		  ; 21 FE | Logical AND with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	NOP				  ; EA | No operation
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1AA
; Address: $E0C847
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1AA:
	JSR $181C			; 20 1C 18 | Jump to subroutine
	ASL $0F1C,X		  ; 1E 1C 0F | Arithmetic shift left (absolute,X)
	ASL $4F4F			; 0E 4F 4F | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BPL $FC			  ; 10 FC | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC $FF0C,X		  ; FE 0C FF | Increment (absolute,X)
	LSR $7EFF			; 4E FF 7E | Logical shift right (absolute)
	AND $1C3F,Y		  ; 39 3F 1C | Logical AND with accumulator (absolute,Y)
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	BPL $3D			  ; 10 3D | Branch if positive
	ASL $0300,X		  ; 1E 00 03 | Arithmetic shift left (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	INC $FF			  ; E6 FF | Increment (zero page)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1AB
; Address: $E0C88C
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1AB:
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	STA $C6FF,Y		  ; 99 FF C6 | Store accumulator to absolute,Y
	BPL $7F			  ; 10 7F | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $1C3F,Y		  ; 39 3F 1C | Logical AND with accumulator (absolute,Y)
	ORA $003F,Y		  ; 19 3F 00 | Logical OR with accumulator (absolute,Y)
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BPL $C8			  ; 10 C8 | Branch if positive
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1AC
; Address: $E0C8DB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1AC:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	AND $3E1E,X		  ; 3D 1E 3E | Logical AND with accumulator (absolute,X)
	ADC #$EF			 ; 69 EF | Add with carry (immediate)
	ROR $0A1F			; 6E 1F 0A | Rotate right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC ($0E,X)		  ; 61 0E | Add with carry ((zero page,X))
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SBC ($40),Y		  ; F1 40 | Subtract with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1AD
; Address: $E0C900
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1AD:
	JMP $64FCB8		  ; 5C B8 FC 64 | Jump to address long
	PLX				  ; FA | Pull X register from stack
	AND #$F7			 ; 29 F7 | Logical AND with accumulator (immediate)
	LDA $F876AE		  ; AF AE 76 F8 | Load from absolute long address into accumulator
	BVC $50			  ; 50 50 | Branch if overflow clear
	SEP #$18			 ; E2 18 | Set processor status bits
	STX $70			  ; 86 70 | Store X register to zero page
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	STA $000602		  ; 8F 02 06 00 | Store accumulator to absolute long address
	ORA $0F04			; 0D 04 0F | Logical OR with accumulator (absolute)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ASL $3E03,X		  ; 1E 03 3E | Arithmetic shift left (absolute,X)
	ORA $1D5E,X		  ; 1D 5E 1D | Logical OR with accumulator (absolute,X)
	ORA $0F05			; 0D 05 0F | Logical OR with accumulator (absolute)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1AE
; Address: $E0C93E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1AE:
	BPL $7C			  ; 10 7C | Branch if positive
	BMI $A0			  ; 30 A0 | Branch if negative
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BMI $20			  ; 30 20 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	BCC $80			  ; 90 80 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	PLX				  ; FA | Pull X register from stack
	CLV				  ; B8 | Clear overflow flag
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1AF
; Address: $E0C954
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1AF:
	JSR $40F0			; 20 F0 40 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1B0
; Address: $E0C95A
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1B0:
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ROL $32BF,X		  ; 3E BF 32 | Rotate left (absolute,X)
	LDA				  ; BF 23 CD 51 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LSR $3A76			; 4E 76 3A | Logical shift right (absolute)
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	ORA $18E7,Y		  ; 19 E7 18 | Logical OR with accumulator (absolute,Y)
	LSR $3E67,X		  ; 5E 67 3E | Logical shift right (absolute,X)
	AND ($1F),Y		  ; 31 1F | Logical AND with accumulator ((zero page),Y)
	BMI $FD			  ; 30 FD | Branch if negative
	JMP $C4FD			; 4C FD C4 | Jump to address
	PLB				  ; AB | Pull data bank register from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $AE5C			; 6E 5C AE | Rotate right (absolute)
	JMP $6F14A8		  ; 5C A8 14 6F | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	INC $7A			  ; E6 7A | Increment (zero page)
	INC $7C			  ; E6 7C | Increment (zero page)
	CPY $8CF8			; CC F8 8C | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $5B0E			; 0E 0E 5B | Arithmetic shift left (absolute)
	STA $069E,Y		  ; 99 9E 06 | Store accumulator to absolute,Y
	SED				  ; F8 | Set decimal mode flag
	STA $E8F5			; 8D F5 E8 | Store accumulator to absolute address
	PEA #$FCFA		   ; F4 FA FC | Push effective address to stack
	ADC ($6E),Y		  ; 71 6E | Add with carry ((zero page),Y)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ADC ($F9,X)		  ; 61 F9 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1B1
; Address: $E0C9B7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1B1:
	STZ $F90F,X		  ; 9E 0F F9 | Store zero to absolute,X
	STA $F0BFF1		  ; 8F F1 BF F0 | Store accumulator to absolute long address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1B2
; Address: $E0C9C0
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1B2:
	BEQ $70			  ; F0 70 | Branch if equal
	PHX				  ; DA | Push X register to stack
	JMP ($99EC)		  ; 6C EC 99 | Jump to address (absolute indirect)
	ADC $9F60,Y		  ; 79 60 9F | Add with carry (absolute,Y)
	AND ($2F),Y		  ; 31 2F | Logical AND with accumulator ((zero page),Y)
	STA $1EA73F		  ; 8F 3F A7 1E | Store accumulator to absolute long address
	STX $9F			  ; 86 9F | Store X register to zero page
	SBC $EE			  ; E5 EE | Subtract with carry (zero page)
	ADC $9FF0,Y		  ; 79 F0 9F | Add with carry (absolute,Y)
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	SBC $DE8F,X		  ; FD 8F DE | Subtract with carry (absolute,X)
	LDA $F9A4,X		  ; BD A4 F9 | Load from absolute,X into accumulator
	CPX #$9E			 ; E0 9E | Compare X register (immediate)
	LDX $99			  ; A6 99 | Load from zero page into X register
	AND ($C9,X)		  ; 21 C9 | Logical AND with accumulator ((zero page,X))
	EOR ($E6),Y		  ; 51 E6 | Exclusive OR with accumulator ((zero page),Y)
	ADC $3B7C,X		  ; 7D 7C 3B | Add with carry (absolute,X)
	SBC $EFB1			; ED B1 EF | Subtract with carry (absolute)
	CMP $E650			; CD 50 E6 | Compare accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	BVS $02			  ; 70 02 | Branch if overflow set
	LDA $7BA73B		  ; AF 3B A7 7B | Load from absolute long address into accumulator
	STX $93			  ; 86 93 | Store X register to zero page
	STX $DAE7			; 8E E7 DA | Store X register to absolute address
	LDX $EAC8,Y		  ; BE C8 EA | Load from absolute,Y into X register
	LDX $2EF3			; AE F3 2E | Load from absolute address into X register
	DEC $0EB3			; CE B3 0E | Decrement (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	ASL $3C40			; 0E 40 3C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1F04			; 0E 04 1F | Arithmetic shift left (absolute)
	ASL $0D2F			; 0E 2F 0D | Arithmetic shift left (absolute)
	ASL $1F08			; 0E 08 1F | Arithmetic shift left (absolute)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1B3
; Address: $E0CA5A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1B3:
	JSL $7F107F		  ; 22 7F 10 7F | Jump to subroutine long
	AND $7F			  ; 25 7F | Logical AND with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1B4
; Address: $E0CA7C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1B4:
	CLC				  ; 18 | Clear carry flag
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	ASL $0312,X		  ; 1E 12 03 | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1B5
; Address: $E0CA90
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1B5:
	JSL $3F117F		  ; 22 7F 11 3F | Jump to subroutine long
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	ROR $24			  ; 66 24 | Rotate right (zero page)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHY				  ; 5A | Push Y register to stack
	ROR $3C7E,X		  ; 7E 7E 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $E7			  ; 66 E7 | Rotate right (zero page)
	WDM #$C3			 ; 42 C3 | Reserved instruction
	ROL $00			  ; 26 00 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	WDM #$24			 ; 42 24 | Reserved instruction
	ROR $DB			  ; 66 DB | Rotate right (zero page)
	WDM #$E7			 ; 42 E7 | Reserved instruction
	ROR $DB			  ; 66 DB | Rotate right (zero page)
	ROR $1818,X		  ; 7E 18 18 | Rotate right (absolute,X)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	PHY				  ; 5A | Push Y register to stack
	WDM #$C3			 ; 42 C3 | Reserved instruction
	ROR $E7			  ; 66 E7 | Rotate right (zero page)
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	WDM #$00			 ; 42 00 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	BPL $08			  ; 10 08 | Branch if positive
	BIT $42C3			; 2C C3 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1B6
; Address: $E0CB0B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1B6:
	ROR $3C99,X		  ; 7E 99 3C | Rotate right (absolute,X)
	ROR $18			  ; 66 18 | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $663C,X		  ; 7E 3C 66 | Rotate right (absolute,X)
	ROR $E7			  ; 66 E7 | Rotate right (zero page)
	WDM #$42			 ; 42 42 | Hardware register operation
	WDM #$80			 ; 42 80 | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1B7
; Address: $E0CB24
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1B7:
	BCC $80			  ; 90 80 | Branch if carry clear
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BVC $FF			  ; 50 FF | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	BEQ $5F			  ; F0 5F | Branch if equal
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	WDM #$BF			 ; 42 BF | Reserved instruction
	SBC $FE1F,Y		  ; F9 1F FE | Subtract with carry (absolute,Y)
	INC $8007,X		  ; FE 07 80 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	WDM #$42			 ; 42 42 | Hardware register operation
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $6624,X		  ; 7E 24 66 | Rotate right (absolute,X)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BVS $EF			  ; 70 EF | Branch if overflow set
	BVS $E7			  ; 70 E7 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($AE),Y		  ; F1 AE | Subtract with carry ((zero page),Y)
	BEQ $3F			  ; F0 3F | Branch if equal
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1B8
; Address: $E0CBD1
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1B8:
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1BA
; Address: $E0CBDE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1BA:
	JSR $F707			; 20 07 F7 | Jump to subroutine
	ASL $0EF7			; 0E F7 0E | Arithmetic shift left (absolute)
	ASL $7D8F,X		  ; 1E 8F 7D | Arithmetic shift left (absolute,X)
	SBC $F83F,X		  ; FD 3F F8 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1BB
; Address: $E0CBED
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1BB:
	JSR $10FA			; 20 FA 10 | Jump to subroutine
	INC $FA07,X		  ; FE 07 FA | Increment (absolute,X)
	ASL $FA			  ; 06 FA | Arithmetic shift left (zero page)
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	ORA $0DF0			; 0D F0 0D | Logical OR with accumulator (absolute)
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	AND $0001,Y		  ; 39 01 00 | Logical AND with accumulator (absolute,Y)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ROR $7E3C,X		  ; 7E 3C 7E | Rotate right (absolute,X)
	LSR $4E1C,X		  ; 5E 1C 4E | Logical shift right (absolute,X)
	LSR $4E0C			; 4E 0C 4E | Logical shift right (absolute)
	ROL $6EEF			; 2E EF 6E | Rotate left (absolute)
	ROR $7E20,X		  ; 7E 20 7E | Rotate right (absolute,X)
	BPL $7E			  ; 10 7E | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ROR $7E08,X		  ; 7E 08 7E | Rotate right (absolute,X)
	ROR $7EAD,X		  ; 7E AD 7E | Rotate right (absolute,X)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	BIT $346E			; 2C 6E 34 | Test bits in accumulator (absolute)
	ROR $66DB,X		  ; 7E DB 66 | Rotate right (absolute,X)
	ROR $DB			  ; 66 DB | Rotate right (zero page)
	WDM #$18			 ; 42 18 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $7E3C,X		  ; 7E 3C 7E | Rotate right (absolute,X)
	ROR $7EFF,X		  ; 7E FF 7E | Rotate right (absolute,X)
	ROR $7E			  ; 66 7E | Rotate right (zero page)
	PHY				  ; 5A | Push Y register to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $6A			  ; 10 6A | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1BC
; Address: $E0CC63
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1BC:
	JSR $42DB			; 20 DB 42 | Hardware register operation
	ROR $99			  ; 66 99 | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	STA $6E18,Y		  ; 99 18 6E | Store accumulator to absolute,Y
	BIT $3C18			; 2C 18 3C | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	ROR				  ; 6A | Rotate right (accumulator)
	PHY				  ; 5A | Push Y register to stack
	WDM #$FF			 ; 42 FF | Reserved instruction

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1BD
; Address: $E0CC79
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1BD:
	PHY				  ; 5A | Push Y register to stack
	ROR $24			  ; 66 24 | Rotate right (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	INC $0700,X		  ; FE 00 07 | Increment (absolute,X)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	LDX $FF			  ; A6 FF | Load from zero page into X register
	PHX				  ; DA | Push X register to stack
	ASL $391E,X		  ; 1E 1E 39 | Arithmetic shift left (absolute,X)
	AND $EEEF,Y		  ; 39 EF EE | Logical AND with accumulator (absolute,Y)
	ADC $7F79,Y		  ; 79 79 7F | Add with carry (absolute,Y)
	ROR $B4FE			; 6E FE B4 | Rotate right (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	INC				  ; 1A | Increment accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	INX				  ; E8 | Increment X register
	ORA $02FF,Y		  ; 19 FF 02 | Logical OR with accumulator (absolute,Y)
	INC $FC20,X		  ; FE 20 FC | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $F0			  ; 90 F0 | Branch if carry clear
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $90			  ; F0 90 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	BEQ $80			  ; F0 80 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	ROR $7EFF			; 6E FF 7E | Rotate right (absolute)
	CLC				  ; 18 | Clear carry flag
	ROR $3C81,X		  ; 7E 81 3C | Rotate right (absolute,X)
	WDM #$00			 ; 42 00 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	ROR $7EFD,X		  ; 7E FD 7E | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROR $1800,X		  ; 7E 00 18 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ADC $A8FF,X		  ; 7D FF A8 | Add with carry (absolute,X)
	INX				  ; E8 | Increment X register
	BVC $FF			  ; 50 FF | Branch if overflow clear
	STY $FF			  ; 84 FF | Store Y register to zero page
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1BE
; Address: $E0CD39
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1BE:
	SBC $AA00,X		  ; FD 00 AA | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	BCC $F0			  ; 90 F0 | Branch if carry clear
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1BF
; Address: $E0CD50
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1BF:
	JSR $80E8			; 20 E8 80 | Jump to subroutine
	BCS $40			  ; B0 40 | Branch if carry set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1C0
; Address: $E0CD59
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1C0:
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1C1
; Address: $E0CD84
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1C1:
	BCC $80			  ; 90 80 | Branch if carry clear
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $1F5F			; 0E 5F 1F | Arithmetic shift left (absolute)
	ASL $3CBF,X		  ; 1E BF 3C | Arithmetic shift left (absolute,X)
	LDA				  ; BF 35 3F 34 | Load from absolute long,X into accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	RTI				  ; 40 | Return from interrupt
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLI				  ; 58 | Clear interrupt disable flag
	ADC $0170,Y		  ; 79 70 01 | Add with carry (absolute,Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1C2
; Address: $E0CDD8
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1C2:
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ROR $7D23,X		  ; 7E 23 7D | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	LDY #$94			 ; A0 94 | Load immediate value into Y register
	BVC $1A			  ; 50 1A | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	STZ $800E,X		  ; 9E 0E 80 | Store zero to absolute,X
	BRA $C0			  ; 80 C0 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $F8			  ; 80 F8 | Branch always
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ROR $BEC4,X		  ; 7E C4 BE | Rotate right (absolute,X)
	INC $F6C9,X		  ; FE C9 F6 | Increment (absolute,X)
	STA $2AEA			; 8D EA 2A | Store accumulator to absolute address
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX $00			  ; E4 00 | Compare X register (zero page)
	SEP #$15			 ; E2 15 | Set processor status bits
	TXA				  ; 8A | Transfer X register to accumulator
	NOP				  ; EA | No operation
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDA ($57),Y		  ; B1 57 | Load from (zero page),Y into accumulator
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $5751			; AD 51 57 | Load from absolute address into accumulator
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $0130,Y		  ; B9 30 01 | Load from absolute,Y into accumulator
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ROR $FD33,X		  ; 7E 33 FD | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1C3
; Address: $E0CE68
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1C3:
	SEC				  ; 38 | Set carry flag
	LDY #$94			 ; A0 94 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	INC				  ; 1A | Increment accumulator
	PHA				  ; 48 | Push accumulator to stack
	STA $800C,X		  ; 9D 0C 80 | Store accumulator to absolute,X
	BRA $C0			  ; 80 C0 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $F8			  ; 80 F8 | Branch always
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ROR $BFC4,X		  ; 7E C4 BF | Rotate right (absolute,X)
	LDA				  ; BF 3D 7F 7B | Load from absolute long,X into accumulator
	PLY				  ; 7A | Pull Y register from stack
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1C5
; Address: $E0CE94
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1C5:
	BMI $FF			  ; 30 FF | Branch if negative
	BVC $FE			  ; 50 FE | Branch if overflow clear
	CPY #$FA			 ; C0 FA | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	INC $FCE8,X		  ; FE E8 FC | Increment (absolute,X)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1C6
; Address: $E0CEC8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1C6:
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $FC			  ; 80 FC | Branch always
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1C7
; Address: $E0CEDF
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1C7:
	BRA $B5			  ; 80 B5 | Branch always
	BIT $A59C			; 2C 9C A5 | Test bits in accumulator (absolute)
	NOP				  ; EA | No operation
	INY				  ; C8 | Increment Y register
	ADC ($EE),Y		  ; 71 EE | Add with carry ((zero page),Y)
	SBC #$B1			 ; E9 B1 | Subtract with carry (immediate)
	SBC $FEC1,Y		  ; F9 C1 FE | Subtract with carry (absolute,Y)
	SBC $37			  ; E5 37 | Subtract with carry (zero page)
	CMP $7B			  ; C5 7B | Compare accumulator (zero page)
	DEC $71			  ; C6 71 | Decrement (zero page)
	SBC $D600			; ED 00 D6 | Subtract with carry (absolute)
	NOP				  ; EA | No operation
	AND $B9B4			; 2D B4 B9 | Logical AND with accumulator (absolute)
	AND $AB			  ; 25 AB | Logical AND with accumulator (zero page)
	STX $6D73			; 8E 73 6D | Store X register to absolute address
	BIT #$9F			 ; 89 9F | Test bits in accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX $DEB3			; EC B3 DE | Compare X register (absolute)
	STY $2CF3			; 8C F3 2C | Store Y register to absolute address
	INY				  ; C8 | Increment Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1C8
; Address: $E0CF1E
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1C8:
	EOR ($57,X)		  ; 41 57 | Exclusive OR with accumulator ((zero page,X))
	INC $C689,X		  ; FE 89 C6 | Increment (absolute,X)
	ORA $0A8A			; 0D 8A 0A | Logical OR with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPY $10			  ; C4 10 | Compare Y register (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA ($EB),Y		  ; 91 EB | Store accumulator to (zero page),Y
	BCS $51			  ; B0 51 | Branch if carry set
	BVC $01			  ; 50 01 | Branch if overflow clear
	EOR ($A8,X)		  ; 41 A8 | Exclusive OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $50			  ; 50 50 | Branch if overflow clear
	BIT $455C			; 2C 5C 45 | Test bits in accumulator (absolute)
	DEC $D962,X		  ; DE 62 D9 | Decrement (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1C9
; Address: $E0CF68
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1C9:
	INC $E9B6			; EE B6 E9 | Increment (absolute)
	STA ($F9),Y		  ; 91 F9 | Store accumulator to (zero page),Y
	EOR ($FE,X)		  ; 41 FE | Exclusive OR with accumulator ((zero page,X))
	SBC $57			  ; E5 57 | Subtract with carry (zero page)
	SBC $C67B			; ED 7B C6 | Subtract with carry (absolute)
	ADC ($4F),Y		  ; 71 4F | Add with carry ((zero page),Y)
	LDA $00A513		  ; AF 13 A5 00 | Load from absolute long address into accumulator
	NOP				  ; EA | No operation
	LDY $B6			  ; A4 B6 | Load from zero page into Y register
	ROL $1EA3			; 2E A3 1E | Rotate left (absolute)
	STX $6D77			; 8E 77 6D | Store X register to absolute address
	BIT #$9F			 ; 89 9F | Test bits in accumulator (immediate)
	REP #$E8			 ; C2 E8 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1CA
; Address: $E0CF92
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1CA:
	NOP				  ; EA | No operation
	STX $2CF2			; 8E F2 2C | Store X register to absolute address
	INY				  ; C8 | Increment Y register
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1CB
; Address: $E0CF9E
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1CB:
	RTI				  ; 40 | Return from interrupt
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ORA $17			  ; 05 17 | Logical OR with accumulator (zero page)
	ORA $17			  ; 05 17 | Logical OR with accumulator (zero page)
	ROL $1808			; 2E 08 18 | Rotate left (absolute)
	ORA $1B00,X		  ; 1D 00 1B | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROL $1800,X		  ; 3E 00 18 | Rotate left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BCS $F0			  ; B0 F0 | Branch if carry set
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $1301			; 0D 01 13 | Logical OR with accumulator (absolute)
	ASL $4F			  ; 06 4F | Arithmetic shift left (zero page)
	ORA $3DBF			; 0D BF 3D | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	INC $44			  ; E6 44 | Increment (zero page)
	CPY $0E			  ; C4 0E | Compare Y register (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$C9			 ; 09 C9 | Logical OR with accumulator (immediate)
	ORA ($91),Y		  ; 11 91 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1CC
; Address: $E0D041
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1CC:
	JSL $517023		  ; 22 23 70 51 | Jump to subroutine long
	BVC $00			  ; 50 00 | Branch if overflow clear
	BCC $93			  ; 90 93 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	BIT #$A8			 ; 89 A8 | Test bits in accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $50			  ; 50 50 | Branch if overflow clear
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1CD
; Address: $E0D064
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1CD:
	ASL $1D07			; 0E 07 1D | Arithmetic shift left (absolute)
	ASL $28			  ; 06 28 | Arithmetic shift left (zero page)
	EOR $B510,Y		  ; 59 10 B5 | Exclusive OR with accumulator (absolute,Y)
	ADC $01			  ; 65 01 | Add with carry (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	SBC $C0			  ; E5 C0 | Subtract with carry (zero page)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BVS $E0			  ; 70 E0 | Game work RAM access
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1CE
; Address: $E0D089
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1CE:
	RTI				  ; 40 | Return from interrupt
	TXS				  ; 9A | Transfer X register to stack pointer
	PHP				  ; 08 | Push processor status to stack
	AND $BEBC			; 2D BC BE | Logical AND with accumulator (absolute)
	ROL $80			  ; 26 80 | Rotate left (zero page)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CPY #$6C			 ; C0 6C | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	LDX $AFF4			; AE F4 AF | Load from absolute address into X register
	NOP				  ; EA | No operation
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	STA				  ; 9F 1F 3F 3E | Store accumulator to absolute long,X
	ADC $F6FF,X		  ; 7D FF F6 | Add with carry (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $34FF,X		  ; 1E FF 34 | Arithmetic shift left (absolute,X)
	BVC $FF			  ; 50 FF | Branch if overflow clear
	BCS $FF			  ; B0 FF | Branch if carry set
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $3D07			; 0E 07 3D | Arithmetic shift left (absolute)
	ASL $E8			  ; 06 E8 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1CF
; Address: $E0D0C9
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1CF:
	JSL $351019		  ; 22 19 10 35 | Jump to subroutine long
	LDY $0125,X		  ; BC 25 01 | Load from absolute,X into Y register
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	SBC $C0			  ; E5 C0 | Subtract with carry (zero page)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BVS $E0			  ; 70 E0 | Game work RAM access
	LDY $1760,X		  ; BC 60 17 | Load from absolute,X into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	BIT $BDBC			; 2C BC BD | Test bits in accumulator (absolute)
	BIT $80			  ; 24 80 | Test bits in accumulator (zero page)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPY #$6F			 ; C0 6F | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1D0
; Address: $E0D0FB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1D0:
	LDA $E8AFF4		  ; AF F4 AF E8 | Load from absolute long address into accumulator
	ASL $0A0A			; 0E 0A 0A | Arithmetic shift left (absolute)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1D1
; Address: $E0D120
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1D1:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BVS $50			  ; 70 50 | Branch if overflow set
	BVC $00			  ; 50 00 | Branch if overflow clear
	BNE $D0			  ; D0 D0 | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $50			  ; 50 50 | Branch if overflow clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	STA				  ; 9F 1E 7F 7D | Store accumulator to absolute long,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	INC $F6FF,X		  ; FE FF F6 | Increment (absolute,X)
	NOP				  ; EA | No operation
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	ROR				  ; 6A | Rotate right (accumulator)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	JMP $BEB5BC		  ; 5C BC B5 BE | Jump to address long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1D2
; Address: $E0D18F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1D2:
	JSL $010103		  ; 22 03 01 01 | Jump to subroutine long
	INC $80			  ; E6 80 | Increment (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1D3
; Address: $E0D1A3
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1D3:
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BCC $00			  ; 90 00 | Branch if carry clear
	ROL				  ; 2A | Rotate left (accumulator)
	TSX				  ; BA | Transfer stack pointer to X register
	LDA $BD2D,X		  ; BD 2D BD | Load from absolute,X into accumulator
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$6F			 ; C0 6F | Compare Y register (immediate)
	CPY #$AF			 ; C0 AF | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1D4
; Address: $E0D1BB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1D4:
	LDA $C8AFE4		  ; AF E4 AF C8 | Load from absolute long address into accumulator
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $0A0A			; 0E 0A 0A | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1D5
; Address: $E0D1E2
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1D5:
	JSR $5070			; 20 70 50 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	BPL $10			  ; 10 10 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $50			  ; 50 50 | Branch if overflow clear
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	EOR #$09			 ; 49 09 | Exclusive OR with accumulator (immediate)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA #$7F			 ; 09 7F | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	AND $7F2D			; 2D 2D 7F | Logical AND with accumulator (absolute)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $5AFF			; 2C FF 5A | Test bits in accumulator (absolute)
	INC $DFE2,X		  ; FE E2 DF | Increment (absolute,X)
	ROR $CD			  ; 66 CD | Rotate right (zero page)
	INX				  ; E8 | Increment X register
	BCS $F9			  ; B0 F9 | Branch if carry set
	LDA ($FE,X)		  ; A1 FE | Load from (zero page,X) into accumulator
	INC $FE41,X		  ; FE 41 FE | Increment (absolute,X)
	EOR #$D3			 ; 49 D3 | Exclusive OR with accumulator (immediate)
	INC $75			  ; E6 75 | Increment (zero page)
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	PHX				  ; DA | Push X register to stack
	CPX $C400			; EC 00 C4 | Compare X register (absolute)
	INC $2E33			; EE 33 2E | Increment (absolute)
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F 85 FF C9 | Store accumulator to absolute long,X
	CMP $ACA3			; CD A3 AC | Compare accumulator (absolute)
	BIT $48E2			; 2C E2 48 | Test bits in accumulator (absolute)
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	ADC $5B40			; 6D 40 5B | Add with carry (absolute)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1D6
; Address: $E0D298
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1D6:
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	INY				  ; C8 | Increment Y register
	SBC $F8E0,X		  ; FD E0 F8 | Subtract with carry (absolute,X)
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	CPY #$FB			 ; C0 FB | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	SBC $E880,Y		  ; F9 80 E8 | Subtract with carry (absolute,Y)
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$CE			 ; C0 CE | Compare Y register (immediate)
	CMP $DE60,Y		  ; D9 60 DE | Compare accumulator (absolute,Y)
	ROR $E9			  ; 66 E9 | Rotate right (zero page)
	ORA ($F9),Y		  ; 11 F9 | Logical OR with accumulator ((zero page),Y)
	LDA ($FE,X)		  ; A1 FE | Load from (zero page,X) into accumulator
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA #$53			 ; 09 53 | Logical OR with accumulator (immediate)
	INC $71			  ; E6 71 | Increment (zero page)
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	PHX				  ; DA | Push X register to stack
	JMP ($2400)		  ; 6C 00 24 | Jump to address (absolute indirect)
	ASL $13			  ; 06 13 | Arithmetic shift left (zero page)
	STX $6E73			; 8E 73 6E | Store X register to absolute address
	DEY				  ; 88 | Decrement Y register
	STA				  ; 9F 85 FF C8 | Store accumulator to absolute long,X
	BRA $FF			  ; 80 FF | Branch always
	BCC $CE			  ; 90 CE | Branch if carry clear
	STY $2CF2			; 8C F2 2C | Store Y register to absolute address
	SEP #$C8			 ; E2 C8 | Set processor status bits
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	ADC $5B40			; 6D 40 5B | Add with carry (absolute)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	LDA				  ; BF AB 7F 6A | Load from absolute long,X into accumulator
	PHX				  ; DA | Push X register to stack
	PLX				  ; FA | Pull X register from stack
	BMI $30			  ; 30 30 | Branch if negative
	LDA ($FF,X)		  ; A1 FF | Load from (zero page,X) into accumulator
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	BCC $FB			  ; 90 FB | Branch if carry clear
	BVS $00			  ; 70 00 | Branch if overflow set
	BVC $F2			  ; 50 F2 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1D7
; Address: $E0D326
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1D7:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SBC #$70			 ; E9 70 | Subtract with carry (immediate)
	DEC $D966,X		  ; DE 66 D9 | Decrement (absolute,X)
	ADC ($E9,X)		  ; 61 E9 | Add with carry ((zero page,X))
	LDA ($E6),Y		  ; B1 E6 | Load from (zero page),Y into accumulator
	EOR $03FC			; 4D FC 03 | Exclusive OR with accumulator (absolute)
	ROR $7108,X		  ; 7E 08 71 | Rotate right (absolute,X)
	EOR $10			  ; 45 10 | Exclusive OR with accumulator (zero page)
	LDX $1A			  ; A6 1A | Load from zero page into X register
	LDX #$0C			 ; A2 0C | Load immediate value into X register
	BNE $02			  ; D0 02 | Branch if not equal
	JMP ($2701)		  ; 6C 01 27 | Jump to address (absolute indirect)
	STX $7B			  ; 86 7B | Store X register to zero page
	ROR $9B			  ; 66 9B | Rotate right (zero page)
	STX $93			  ; 86 93 | Store X register to zero page
	STA $DCE7			; 8D E7 DC | Store accumulator to absolute address
	LDA				  ; BF C0 7E 10 | Load from absolute long,X into accumulator
	STX $2CF7			; 8E F7 2C | Store X register to absolute address
	SEP #$CE			 ; E2 CE | Set processor status bits
	LDX #$0C			 ; A2 0C | Load immediate value into X register
	ADC ($58,X)		  ; 61 58 | Add with carry ((zero page,X))
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $E4			  ; 80 E4 | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	INC				  ; 1A | Increment accumulator
	ASL $90FF			; 0E FF 90 | Arithmetic shift left (absolute)
	AND $FF			  ; 25 FF | Logical AND with accumulator (zero page)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1D8
; Address: $E0D39C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1D8:
	JSR $0076			; 20 76 00 | Jump to subroutine
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	INC $DBFF,X		  ; FE FF DB | Increment (absolute,X)
	LDA $FF			  ; A5 FF | Load from zero page into accumulator
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	EOR #$40			 ; 49 40 | Exclusive OR with accumulator (immediate)
	CMP $BCD4,X		  ; DD D4 BC | Compare accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $FD27,X		  ; FD 27 FD | Subtract with carry (absolute,X)
	INC $80			  ; E6 80 | Increment (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1DA
; Address: $E0D3E6
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1DA:
	BPL $40			  ; 10 40 | Branch if positive
	PLB				  ; AB | Pull data bank register from stack
	LDA $AD2D,X		  ; BD 2D AD | Load from absolute,X into accumulator
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$EF			 ; C0 EF | Compare Y register (immediate)
	CPY #$6F			 ; C0 6F | Compare Y register (immediate)
	REP #$BF			 ; C2 BF | Reset processor status bits
	SBC #$BF			 ; E9 BF | Subtract with carry (immediate)
	CPX $AF			  ; E4 AF | Compare X register (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	BPL $10			  ; 10 10 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1DB
; Address: $E0D421
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1DB:
	JSR $70A0			; 20 A0 70 | Jump to subroutine
	BVC $50			  ; 50 50 | Branch if overflow clear
	BCC $90			  ; 90 90 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $50			  ; 50 50 | Branch if overflow clear
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($DC,X)		  ; 01 DC | Logical OR with accumulator ((zero page,X))
	ROL $FE36,X		  ; 3E 36 FE | Rotate left (absolute,X)
	ROR $1B7F			; 6E 7F 1B | Rotate right (absolute)
	ORA $1B3F			; 0D 3F 1B | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1DC
; Address: $E0D472
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1DC:
	JSR $6AFF			; 20 FF 6A | Jump to subroutine
	BIT $3F			  ; 24 3F | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $1F			  ; 10 1F | Branch if positive
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1DD
; Address: $E0D4A4
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1DD:
	BCS $20			  ; B0 20 | Branch if carry set
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1DF
; Address: $E0D4A9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1DF:
	JSR $A0E8			; 20 E8 A0 | Jump to subroutine
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)
	BCS $00			  ; B0 00 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1E1
; Address: $E0D4B8
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1E1:
	JSR $A078			; 20 78 A0 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BCS $FC			  ; B0 FC | Branch if carry set
	ASL $0E2F			; 0E 2F 0E | Arithmetic shift left (absolute)
	ASL $145E			; 0E 5E 14 | Arithmetic shift left (absolute)
	LDY $6828,X		  ; BC 28 68 | Load from absolute,X into Y register
	ROL $7E04,X		  ; 3E 04 7E | Rotate left (absolute,X)
	BPL $7C			  ; 10 7C | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CMP $DE60,Y		  ; D9 60 DE | Compare accumulator (absolute,Y)
	ROR $D9			  ; 66 D9 | Rotate right (zero page)
	ADC ($C9,X)		  ; 61 C9 | Add with carry ((zero page,X))
	AND ($E6),Y		  ; 31 E6 | Logical AND with accumulator ((zero page),Y)
	ORA $071C,X		  ; 1D 1C 07 | Logical OR with accumulator (absolute,X)
	ASL $7108			; 0E 08 71 | Arithmetic shift left (absolute)
	EOR $8630			; 4D 30 86 | Exclusive OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	LDX #$0C			 ; A2 0C | Load immediate value into X register
	BPL $02			  ; 10 02 | Branch if positive
	ORA ($17),Y		  ; 11 17 | Logical OR with accumulator ((zero page),Y)
	STX $7B			  ; 86 7B | Store X register to zero page
	ROR $93			  ; 66 93 | Rotate right (zero page)
	STX $8C93			; 8E 93 8C | Store X register to absolute address
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BPL $8E			  ; 10 8E | Branch if positive
	BIT $CCF2			; 2C F2 CC | Test bits in accumulator (absolute)
	ADC ($58,X)		  ; 61 58 | Add with carry ((zero page,X))
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BMI $08			  ; 30 08 | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	ASL $041F			; 0E 1F 04 | Arithmetic shift left (absolute)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1E2
; Address: $E0D557
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1E2:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STY $00			  ; 84 00 | Store Y register to zero page
	CPX $E0			  ; E4 E0 | Game work RAM access
	BVS $DA			  ; 70 DA | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	BMI $ED			  ; 30 ED | Branch if negative
	LDY $4CDD			; AC DD 4C | Load from absolute address into Y register
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	INC $FE18,X		  ; FE 18 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1E3
; Address: $E0D598
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1E3:
	JSR $8CFE			; 20 FE 8C | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	DEC $03			  ; C6 03 | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	SBC #$E0			 ; E9 E0 | Game work RAM access
	LDA $AC			  ; A5 AC | Load from zero page into accumulator
	JMP $3AB615		  ; 5C 15 B6 3A | Jump to address long
	LDA $0120,Y		  ; B9 20 01 | Load from absolute,Y into accumulator
	SBC $F50F,X		  ; FD 0F F5 | Subtract with carry (absolute,X)
	SBC $F62B,X		  ; FD 2B F6 | Subtract with carry (absolute,X)
	ORA ($EF),Y		  ; 11 EF | Logical OR with accumulator ((zero page),Y)
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	AND $B5			  ; 25 B5 | Logical AND with accumulator (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	PLP				  ; 28 | Pull processor status from stack
	LDA $1D1C			; AD 1C 1D | Load from absolute address into accumulator
	BRA $C3			  ; 80 C3 | Branch always
	CPY #$EF			 ; C0 EF | Compare Y register (immediate)
	CPY #$6F			 ; C0 6F | Compare Y register (immediate)
	LDA				  ; BF F0 AF E8 | Load from absolute long,X into accumulator
	LDA				  ; BF D4 AF 88 | Load from absolute long,X into accumulator
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $0A0A			; 0E 0A 0A | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1E4
; Address: $E0D5F3
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1E4:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $10			  ; 10 10 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	BVC $50			  ; 50 50 | Branch if overflow clear
	BPL $10			  ; 10 10 | Branch if positive
	BNE $50			  ; D0 50 | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $50			  ; 50 50 | Branch if overflow clear
	SEP #$60			 ; E2 60 | Set processor status bits
	ADC $8E38,Y		  ; 79 38 8E | Add with carry (absolute,Y)
	ASL $3373			; 0E 73 33 | Arithmetic shift left (absolute)
	BMI $10			  ; 30 10 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1E5
; Address: $E0D631
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1E5:
	INC $FF08,X		  ; FE 08 FF | Increment (absolute,X)
	ASL $33FF			; 0E FF 33 | Arithmetic shift left (absolute)
	BPL $3F			  ; 10 3F | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1E6
; Address: $E0D648
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1E6:
	JSR $D000			; 20 00 D0 | Jump to subroutine
	CPY #$4C			 ; C0 4C | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	INC				  ; 1A | Increment accumulator
	ORA $040F			; 0D 0F 04 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1000			; 0D 00 10 | Logical OR with accumulator (absolute)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ASL $1100			; 0E 00 11 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1E8
; Address: $E0D6DF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1E8:
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $0E			  ; 10 0E | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVS $40			  ; 70 40 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1E9
; Address: $E0D71B
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1E9:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	DEC $D966,X		  ; DE 66 D9 | Decrement (absolute,X)
	ADC ($D9,X)		  ; 61 D9 | Add with carry ((zero page,X))
	ADC ($E6,X)		  ; 61 E6 | Add with carry ((zero page,X))
	AND $93FC			; 2D FC 93 | Logical AND with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	EOR $4630			; 4D 30 46 | Exclusive OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	LDX #$0C			 ; A2 0C | Load immediate value into X register
	BCS $02			  ; B0 02 | Branch if carry set
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ROR $9B			  ; 66 9B | Rotate right (zero page)
	STX $93			  ; 86 93 | Store X register to zero page
	STX $D8E7			; 8E E7 D8 | Store X register to absolute address
	LDA				  ; BF C9 FF 00 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	BPL $2E			  ; 10 2E | Branch if positive
	CPY $0CB2			; CC B2 0C | Compare Y register (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	ORA $3B40			; 0D 40 3B | Logical OR with accumulator (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FBFD,X		  ; FD FD FB | Subtract with carry (absolute,X)
	STA				  ; 9F 40 FF 9C | Store accumulator to absolute long,X
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1EA
; Address: $E0D7A8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1EA:
	BMI $10			  ; 30 10 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $30			  ; 10 30 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $2C			  ; 10 2C | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	STY $8848			; 8C 48 88 | Store Y register to absolute address
	BPL $48			  ; 10 48 | Branch if positive
	BMI $60			  ; 30 60 | Branch if negative

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1EB
; Address: $E0D7CD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1EB:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BMI $10			  ; 30 10 | Branch if negative
	BEQ $28			  ; F0 28 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	LDY $E800,X		  ; BC 00 E8 | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1EC
; Address: $E0D7E4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1EC:
	JSL $1D411A		  ; 22 1A 41 1D | Jump to subroutine long
	WDM #$0E			 ; 42 0E | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	JMP $0400			; 4C 00 04 | Jump to address
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1ED
; Address: $E0D802
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1ED:
	JSR $400F			; 20 0F 40 | Jump to subroutine
	AND ($40,X)		  ; 21 40 | Logical AND with accumulator ((zero page,X))
	BMI $80			  ; 30 80 | Branch if negative
	BRA $3E			  ; 80 3E | Branch always
	BRA $07			  ; 80 07 | Branch always
	BRA $41			  ; 80 41 | Branch always
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	LSR $4F00,X		  ; 5E 00 4F | Logical shift right (absolute,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	LDX $F83C,Y		  ; BE 3C F8 | Load from absolute,Y into X register
	SED				  ; F8 | Set decimal mode flag
	ASL $1A9C,X		  ; 1E 9C 1A | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $3B78,Y		  ; 19 78 3B | Logical OR with accumulator (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	INC $FE7F,X		  ; FE 7F FE | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PEA #$8606		   ; F4 06 86 | Push effective address to stack
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1EF
; Address: $E0D840
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1EF:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	AND ($40,X)		  ; 21 40 | Logical AND with accumulator ((zero page,X))
	BMI $80			  ; 30 80 | Branch if negative
	BRA $3E			  ; 80 3E | Branch always
	BRA $07			  ; 80 07 | Branch always
	BRA $41			  ; 80 41 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1F0
; Address: $E0D851
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1F0:
	JSR $3000			; 20 00 30 | Jump to subroutine
	LSR $4F00,X		  ; 5E 00 4F | Logical shift right (absolute,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	LDX $F81C,Y		  ; BE 1C F8 | Load from absolute,Y into X register
	SED				  ; F8 | Set decimal mode flag
	ASL $1A9C,X		  ; 1E 9C 1A | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $3B78,Y		  ; 19 78 3B | Logical OR with accumulator (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	INC $FE7F,X		  ; FE 7F FE | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PEA #$8606		   ; F4 06 86 | Push effective address to stack
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	BVS $7E			  ; 70 7E | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	BPL $08			  ; 10 08 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STX $03			  ; 86 03 | Store X register to zero page
	ADC $02			  ; 65 02 | Add with carry (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SBC $DCE4			; ED E4 DC | Subtract with carry (absolute)
	DEC				  ; 3A | Decrement accumulator
	LDA $0120,Y		  ; B9 20 01 | Load from absolute,Y into accumulator
	SBC $FD47,X		  ; FD 47 FD | Subtract with carry (absolute,X)
	SBC $F62B,X		  ; FD 2B F6 | Subtract with carry (absolute,X)
	ORA ($EF),Y		  ; 11 EF | Logical OR with accumulator ((zero page),Y)
	ADC ($C0,X)		  ; 61 C0 | Add with carry ((zero page,X))
	LDX $40			  ; A6 40 | Load from zero page into X register
	ORA $9041,Y		  ; 19 41 90 | Logical OR with accumulator (absolute,Y)
	AND #$AD			 ; 29 AD | Logical AND with accumulator (immediate)
	STX $80			  ; 86 80 | Store X register to zero page
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	CMP ($6F,X)		  ; C1 6F | Compare accumulator ((zero page,X))
	CPY #$AF			 ; C0 AF | Compare Y register (immediate)
	SEP #$BF			 ; E2 BF | Set processor status bits

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1F1
; Address: $E0D8DA
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1F1:
	SBC #$BF			 ; E9 BF | Subtract with carry (immediate)
	LDA $00F78A		  ; AF 8A F7 00 | Load from absolute long address into accumulator
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BMI $31			  ; 30 31 | Branch if negative
	ASL $0621			; 0E 21 06 | Arithmetic shift left (absolute)
	WDM #$21			 ; 42 21 | PPU graphics register access
	WDM #$30			 ; 42 30 | Reserved instruction
	BRA $7C			  ; 80 7C | Branch always
	BRA $3E			  ; 80 3E | Branch always
	BRA $07			  ; 80 07 | Branch always
	BRA $41			  ; 80 41 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	AND $5E00,Y		  ; 39 00 5E | Logical AND with accumulator (absolute,Y)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	LDX $788C,Y		  ; BE 8C 78 | Load from absolute,Y into X register
	JMP $3E88			; 4C 88 3E | Jump to address
	STZ $181A			; 9C 1A 18 | Store zero to absolute
	ORA $3B78,Y		  ; 19 78 3B | Logical OR with accumulator (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	INC $FE7F,X		  ; FE 7F FE | Increment (absolute,X)
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	PEA #$8606		   ; F4 06 86 | Push effective address to stack
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	BVS $7E			  ; 70 7E | Branch if overflow set
	BRA $68			  ; 80 68 | Branch always
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BPL $16			  ; 10 16 | Branch if positive
	SBC $E3F8,Y		  ; F9 F8 E3 | Subtract with carry (absolute,Y)
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	INC $F4F0,X		  ; FE F0 F4 | Increment (absolute,X)
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	DEC $CE			  ; C6 CE | Decrement (zero page)
	ASL $7C50,X		  ; 1E 50 7C | Arithmetic shift left (absolute,X)
	BRA $FC			  ; 80 FC | Branch always
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BVS $70			  ; 70 70 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1F2
; Address: $E0D9A1
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1F2:
	BPL $6A			  ; 10 6A | Branch if positive
	BMI $AD			  ; 30 AD | Branch if negative
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR $99			  ; 66 99 | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $3C3C			; 6E 3C 3C | Rotate right (absolute)
	CLC				  ; 18 | Clear carry flag
	PLY				  ; 7A | Pull Y register from stack
	CLC				  ; 18 | Clear carry flag
	PHY				  ; 5A | Push Y register to stack
	WDM #$FF			 ; 42 FF | Reserved instruction
	PHY				  ; 5A | Push Y register to stack
	ROR $24			  ; 66 24 | Rotate right (zero page)
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PLY				  ; 7A | Pull Y register from stack
	STA ($18,X)		  ; 81 18 | Store accumulator to (zero page,X)
	WDM #$E7			 ; 42 E7 | Reserved instruction
	ROR $18			  ; 66 18 | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	ROR $3C3C,X		  ; 7E 3C 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	WDM #$7E			 ; 42 7E | Reserved instruction
	PHY				  ; 5A | Push Y register to stack
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	DEC $D966,X		  ; DE 66 D9 | Decrement (absolute,X)
	ADC ($D9,X)		  ; 61 D9 | Add with carry ((zero page,X))
	ADC ($E6,X)		  ; 61 E6 | Add with carry ((zero page,X))
	LDA $13FC			; AD FC 13 | Load from absolute address into accumulator
	INC $4F00,X		  ; FE 00 4F | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	EOR $4630			; 4D 30 46 | Exclusive OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	LDX #$0C			 ; A2 0C | Load immediate value into X register
	BCS $02			  ; B0 02 | Branch if carry set
	ORA ($6F,X)		  ; 01 6F | Logical OR with accumulator ((zero page,X))
	BMI $11			  ; 30 11 | Branch if negative
	ROR $9B			  ; 66 9B | Rotate right (zero page)
	STX $93			  ; 86 93 | Store X register to zero page
	STX $D9E7			; 8E E7 D9 | Store X register to absolute address
	LDA				  ; BF C8 7F 00 | Load from absolute long,X into accumulator
	BPL $2C			  ; 10 2C | Branch if positive
	CPY $0CB2			; CC B2 0C | Compare Y register (absolute)
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1F3
; Address: $E0DA17
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1F3:
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	ORA $3B40			; 0D 40 3B | Logical OR with accumulator (absolute)
	BRA $F6			  ; 80 F6 | Branch always
	DEY				  ; 88 | Decrement Y register
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	ORA ($31),Y		  ; 11 31 | Logical OR with accumulator ((zero page),Y)
	PLY				  ; 7A | Pull Y register from stack
	ASL $0F40			; 0E 40 0F | Arithmetic shift left (absolute)
	ASL $0F1E			; 0E 1E 0F | Arithmetic shift left (absolute)
	DEC				  ; 3A | Decrement accumulator
	EOR ($4F,X)		  ; 41 4F | Exclusive OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	STX $BCB0			; 8E B0 BC | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1F5
; Address: $E0DA45
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1F5:
	JSR $F0E0			; 20 E0 F0 | Jump to subroutine
	BPL $18			  ; 10 18 | Branch if positive
	STY $C488			; 8C 88 C4 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1F6
; Address: $E0DA4F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1F6:
	JSR $40E0			; 20 E0 40 | Jump to subroutine
	BEQ $A0			  ; F0 A0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $98			  ; F0 98 | Branch if equal
	BEQ $1C			  ; F0 1C | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1F7
; Address: $E0DA5E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1F7:
	JSR $E83E			; 20 3E E8 | Jump to subroutine
	BPL $C0			  ; 10 C0 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BMI $F4			  ; 30 F4 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SEP #$60			 ; E2 60 | Set processor status bits

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1F8
; Address: $E0DA6F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1F8:
	JSR $E8FC			; 20 FC E8 | Jump to subroutine
	BNE $1C			  ; D0 1C | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	ROR $86FC			; 6E FC 86 | Rotate right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1F9
; Address: $E0DA7C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1F9:
	JSR $00FE			; 20 FE 00 | Jump to subroutine
	ROR $1008,X		  ; 7E 08 10 | Rotate right (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1FA
; Address: $E0DA83
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1FA:
	JSR $0899			; 20 99 08 | Jump to subroutine
	ROR $99			  ; 66 99 | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	STA $6E18,Y		  ; 99 18 6E | Store accumulator to absolute,Y
	ROR $3C18			; 6E 18 3C | Rotate right (absolute)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1FB
; Address: $E0DA93
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1FB:
	ROR				  ; 6A | Rotate right (accumulator)
	CLC				  ; 18 | Clear carry flag
	WDM #$FF			 ; 42 FF | Reserved instruction
	ROR $24			  ; 66 24 | Rotate right (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	WDM #$11			 ; 42 11 | Reserved instruction
	ORA ($5E,X)		  ; 01 5E | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F 6F 9F 2F | Store accumulator to absolute long,X
	LDA $418303		  ; AF 03 83 41 | Load from absolute long address into accumulator
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	STA				  ; 9F 00 CF 00 | Store accumulator to absolute long,X
	LDA $0088,X		  ; BD 88 00 | Load from absolute,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	INC $FAD4,X		  ; FE D4 FA | Increment (absolute,X)
	BEQ $F9			  ; F0 F9 | Branch if equal
	BCC $BF			  ; 90 BF | Branch if carry clear
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA				  ; BF 6E FF 6E | Load from absolute long,X into accumulator
	DEY				  ; 88 | Decrement Y register
	BVC $F4			  ; 50 F4 | Branch if overflow clear
	BIT $F4			  ; 24 F4 | Test bits in accumulator (zero page)
	ASL $B6			  ; 06 B6 | Arithmetic shift left (zero page)
	ASL $60			  ; 06 60 | Arithmetic shift left (zero page)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	CLD				  ; D8 | Clear decimal mode flag
	BVC $4C			  ; 50 4C | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $50			  ; 30 50 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BIT $5828			; 2C 28 58 | Test bits in accumulator (absolute)
	BPL $50			  ; 10 50 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1FC
; Address: $E0DB2D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1FC:
	JSR $0020			; 20 20 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1FD
; Address: $E0DB40
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1FD:
	AND #$16			 ; 29 16 | Logical AND with accumulator (immediate)
	WDM #$21			 ; 42 21 | PPU graphics register access
	WDM #$30			 ; 42 30 | Reserved instruction
	SEI				  ; 78 | Set interrupt disable flag
	STY $3A			  ; 84 3A | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	BRA $41			  ; 80 41 | Branch always
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	LSR $4F00,X		  ; 5E 00 4F | Logical shift right (absolute,X)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	LDX $186E,Y		  ; BE 6E 18 | Load from absolute,Y into X register
	ROR $E73C,X		  ; 7E 3C E7 | Rotate right (absolute,X)
	BIT $9D			  ; 24 9D | Test bits in accumulator (zero page)
	PHY				  ; 5A | Push Y register to stack
	ROR				  ; 6A | Rotate right (accumulator)
	PHY				  ; 5A | Push Y register to stack
	LDA $28			  ; A5 28 | Load from zero page into accumulator
	BPL $08			  ; 10 08 | Branch if positive
	WDM #$00			 ; 42 00 | Reserved instruction
	ROR $7E			  ; 66 7E | Rotate right (zero page)
	LDA $38DF,X		  ; BD DF 38 | Load from absolute,X into accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1FE
; Address: $E0DB81
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1FE:
	JSR $2466			; 20 66 24 | Jump to subroutine
	LDA $955A,X		  ; BD 5A 95 | Load from absolute,X into accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	PHY				  ; 5A | Push Y register to stack
	LDA $28			  ; A5 28 | Load from zero page into accumulator
	BPL $08			  ; 10 08 | Branch if positive
	ROL $7E04,X		  ; 3E 04 7E | Rotate left (absolute,X)
	LDA $18FF,X		  ; BD FF 18 | Load from absolute,X into accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_1FF
; Address: $E0DBA0
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_1FF:
	JSL $246600		  ; 22 00 66 24 | Jump to subroutine long
	LDA $955A,X		  ; BD 5A 95 | Load from absolute,X into accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	PHY				  ; 5A | Push Y register to stack
	LDA $28			  ; A5 28 | Load from zero page into accumulator
	BPL $08			  ; 10 08 | Branch if positive
	ROL $7E04,X		  ; 3E 04 7E | Rotate left (absolute,X)
	LDA $18FF,X		  ; BD FF 18 | Load from absolute,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ROR $6618			; 6E 18 66 | Rotate right (absolute)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	STA $955A,X		  ; 9D 5A 95 | Store accumulator to absolute,X
	ROR				  ; 6A | Rotate right (accumulator)
	PHY				  ; 5A | Push Y register to stack
	LDA $28			  ; A5 28 | Load from zero page into accumulator
	BPL $08			  ; 10 08 | Branch if positive
	ROR $18			  ; 66 18 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_200
; Address: $E0DBD3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_200:
	ROR $BD66,X		  ; 7E 66 BD | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_201
; Address: $E0DBE7
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_201:
	JSR $6090			; 20 90 60 | Jump to subroutine
	BCC $20			  ; 90 20 | Branch if carry clear
	LDY $8200			; AC 00 82 | Load from absolute address into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BCC $00			  ; 90 00 | Branch if carry clear
	BNE $00			  ; D0 00 | Branch if not equal
	LDY $0000,X		  ; BC 00 00 | Load from absolute,X into Y register
	ASL $0A04			; 0E 04 0A | Arithmetic shift left (absolute)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	LDA				  ; BF 4A BF 6E | Load from absolute long,X into accumulator
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	ASL $66			  ; 06 66 | Arithmetic shift left (zero page)
	ASL $60			  ; 06 60 | Arithmetic shift left (zero page)
	ROR $0D3F,X		  ; 7E 3F 0D | Rotate right (absolute,X)
	ASL $46			  ; 06 46 | Arithmetic shift left (zero page)
	AND ($64,X)		  ; 21 64 | Logical AND with accumulator ((zero page,X))
	BPL $92			  ; 10 92 | Branch if positive
	JMP ($2A94)		  ; 6C 94 2A | Jump to address (absolute indirect)
	LDY $8203			; AC 03 82 | Load from absolute address into Y register
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	AND $3600			; 2D 00 36 | Logical AND with accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	LDX $A8FC,Y		  ; BE FC A8 | Load from absolute,Y into X register
	CLI				  ; 58 | Clear interrupt disable flag
	LSR $5A94,X		  ; 5E 94 5A | Logical shift right (absolute,X)
	BPL $79			  ; 10 79 | Branch if positive
	BPL $BF			  ; 10 BF | Branch if positive
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA				  ; BF 6E FF 6E | Load from absolute long,X into accumulator
	BRA $A8			  ; 80 A8 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $34			  ; 10 34 | Branch if positive
	ASL $AE			  ; 06 AE | Arithmetic shift left (zero page)
	STX $60			  ; 86 60 | Store X register to zero page
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	CLV				  ; B8 | Clear overflow flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_202
; Address: $E0DCB8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_202:
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $7BFF,X		  ; 7D FF 7B | Add with carry (absolute,X)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY $30			  ; C4 30 | Compare Y register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BPL $16			  ; 10 16 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $6A			  ; 10 6A | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_203
; Address: $E0DCE3
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_203:
	JSR $42CB			; 20 CB 42 | Hardware register operation
	ROR $BD			  ; 66 BD | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	ROR $6E3C,X		  ; 7E 3C 6E | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR				  ; 6A | Rotate right (accumulator)
	LSR $1CEB,X		  ; 5E EB 1C | Logical shift right (absolute,X)
	WDM #$7E			 ; 42 7E | Reserved instruction
	ROR $2424,X		  ; 7E 24 24 | Rotate right (absolute,X)
	WDM #$83			 ; 42 83 | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	ADC $7BFF,X		  ; 7D FF 7B | Add with carry (absolute,X)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY $30			  ; C4 30 | Compare Y register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BPL $16			  ; 10 16 | Branch if positive
	PEA #$F0F9		   ; F4 F9 F0 | Push effective address to stack
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	INC $F4F0,X		  ; FE F0 F4 | Increment (absolute,X)
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	DEC $CE			  ; C6 CE | Decrement (zero page)
	ASL $7C50,X		  ; 1E 50 7C | Arithmetic shift left (absolute,X)
	BRA $FC			  ; 80 FC | Branch always
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BVS $70			  ; 70 70 | Branch if overflow set
	ORA $062F			; 0D 2F 06 | Logical OR with accumulator (absolute)
	LSR $21			  ; 46 21 | PPU graphics register access
	WDM #$30			 ; 42 30 | Reserved instruction
	SEI				  ; 78 | Set interrupt disable flag
	STY $3A			  ; 84 3A | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_204
; Address: $E0DD4E
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_204:
	BRA $41			  ; 80 41 | Branch always
	ORA ($2D,X)		  ; 01 2D | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $8700			; 4D 00 87 | Exclusive OR with accumulator (absolute)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	LDX $A8FC,Y		  ; BE FC A8 | Load from absolute,Y into X register
	CLI				  ; 58 | Clear interrupt disable flag
	LSR $3A94,X		  ; 5E 94 3A | Logical shift right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $3B18,Y		  ; 19 18 3B | Logical OR with accumulator (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	INC $FE7F,X		  ; FE 7F FE | Increment (absolute,X)
	BRA $A8			  ; 80 A8 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $3C			  ; 10 3C | Branch if positive
	PEA #$E606		   ; F4 06 E6 | Push effective address to stack
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	BVS $7E			  ; 70 7E | Branch if overflow set
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	ASL $0706,X		  ; 1E 06 07 | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	SEI				  ; 78 | Set interrupt disable flag
	ORA $1F0D			; 0D 0D 1F | Logical OR with accumulator (absolute)
	BMI $10			  ; 30 10 | Branch if negative
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ORA $13FF			; 0D FF 13 | Logical OR with accumulator (absolute)
	BIT $7F			  ; 24 7F | Test bits in accumulator (zero page)
	BPL $1F			  ; 10 1F | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_205
; Address: $E0DDCA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_205:
	JSR $F800			; 20 00 F8 | Jump to subroutine
	BEQ $FC			  ; F0 FC | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BCC $FC			  ; 90 FC | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_207
; Address: $E0DDFF
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_207:
	SEC				  ; 38 | Set carry flag
	BRA $B1			  ; 80 B1 | Branch always
	EOR ($C2,X)		  ; 41 C2 | Exclusive OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	BMI $80			  ; 30 80 | Branch if negative
	STA $02FFC1		  ; 8F C1 FF 02 | Store accumulator to absolute long address
	BRA $E9			  ; 80 E9 | Branch always
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	INC $FD01			; EE 01 FD | Increment (absolute)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BRA $1F			  ; 80 1F | Branch always
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_209
; Address: $E0DE2E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_209:
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BPL $FF			  ; 10 FF | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_20A
; Address: $E0DE38
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_20A:
	WDM #$FF			 ; 42 FF | Reserved instruction
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1B,X)		  ; 01 1B | Logical OR with accumulator ((zero page,X))
	ASL $0706			; 0E 06 07 | Arithmetic shift left (absolute)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	LSR $0B07			; 4E 07 0B | Logical shift right (absolute)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	STY $E7			  ; 84 E7 | Store Y register to zero page
	LSR $CCCE			; 4E CE CC | Logical shift right (absolute)
	ROR $FF7E,X		  ; 7E 7E FF | Rotate right (absolute,X)
	INC $B0F0,X		  ; FE F0 B0 | Increment (absolute,X)
	STA ($41,X)		  ; 81 41 | Store accumulator to (zero page,X)
	SEP #$12			 ; E2 12 | Set processor status bits
	ASL $FE4C,X		  ; 1E 4C FE | Arithmetic shift left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	INC $FF20,X		  ; FE 20 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_20B
; Address: $E0DEB6
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_20B:
	BPL $FF			  ; 10 FF | Branch if positive
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	AND ($40,X)		  ; 21 40 | Logical AND with accumulator ((zero page,X))
	LSR $80			  ; 46 80 | Logical shift right (zero page)
	STZ $7704			; 9C 04 77 | Store zero to absolute
	DEC $777F,X		  ; DE 7F 77 | Decrement (absolute,X)
	SBC $EEFF,Y		  ; F9 FF EE | Subtract with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($E0,X)		  ; 61 E0 | Game work RAM access
	STA				  ; 9F 16 FF 5C | Store accumulator to absolute long,X
	BCS $FF			  ; B0 FF | Branch if carry set
	STY $FF			  ; 84 FF | Store Y register to zero page
	INC $F8C8,X		  ; FE C8 F8 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_20C
; Address: $E0DEE4
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_20C:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	LDX $7BD6			; AE D6 7B | Load from absolute address into X register
	SBC $7D			  ; E5 7D | Subtract with carry (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP ($DA83)		  ; 6C 83 DA | Jump to address (absolute indirect)
	ASL $E0			  ; 06 E0 | Game work RAM access
	CPY #$78			 ; C0 78 | Compare Y register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	BRA $18			  ; 80 18 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	ASL $0706,X		  ; 1E 06 07 | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0800			; 0D 00 08 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $1C			  ; 05 1C | Logical OR with accumulator (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA $0F1F			; 0D 1F 0F | Logical OR with accumulator (absolute)
	AND $3E1F,Y		  ; 39 1F 3E | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_20E
; Address: $E0DF5E
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_20E:
	JSR $8323			; 20 23 83 | Jump to subroutine
	STA $617E8E		  ; 8F 8E 7E 61 | Store accumulator to absolute long address
	ADC ($01,X)		  ; 61 01 | Add with carry ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	REP #$FF			 ; C2 FF | Reset processor status bits
	STY $61FF			; 8C FF 61 | Store Y register to absolute address
	INC $E001,X		  ; FE 01 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	CLD				  ; D8 | Clear decimal mode flag
	INC $FE07,X		  ; FE 07 FE | Increment (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	STZ $D0F1			; 9C F1 D0 | Store zero to absolute
	ORA $1819			; 0D 19 18 | Logical OR with accumulator (absolute)
	ORA $FF00,X		  ; 1D 00 FF | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $FE13,X		  ; FE 13 FE | Increment (absolute,X)
	STA ($F9),Y		  ; 91 F9 | Store accumulator to (zero page),Y
	BIT $262C			; 2C 2C 26 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_20F
; Address: $E0DFBD
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_20F:
	JSL $7C2226		  ; 22 26 22 7C | Jump to subroutine long
	ROR $1776			; 6E 76 17 | Rotate right (absolute)
	DEC $87			  ; C6 87 | Decrement (zero page)
	CMP $2133,Y		  ; D9 33 21 | PPU graphics register access
	AND ($FE,X)		  ; 21 FE | Logical AND with accumulator ((zero page,X))
	CPY $FFCC			; CC CC FF | Compare Y register (absolute)
	BRA $FE			  ; 80 FE | Branch always
	STA ($37,X)		  ; 81 37 | Store accumulator to (zero page,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_210
; Address: $E0DFD7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_210:
	JSR $CCF3			; 20 F3 CC | Jump to subroutine
	CPY $00FE			; CC FE 00 | Compare Y register (absolute)
	CPY $2000			; CC 00 20 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_213
; Address: $E0DFF0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_213:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	BPL $30			  ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_214
; Address: $E0E004
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_214:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BVC $50			  ; 50 50 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank40_DmaFunction_216
; Address: $E0E020
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_216:
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0107,Y		  ; 19 07 01 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $1100			; 0E 00 11 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ROL $6518,X		  ; 3E 18 65 | Rotate left (absolute,X)
	ROL $E0			  ; 26 E0 | Game work RAM access
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	ASL $193F			; 0E 3F 19 | Arithmetic shift left (absolute)
	ROL $0F17,X		  ; 3E 17 0F | Rotate left (absolute,X)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	ADC #$29			 ; 69 29 | Add with carry (immediate)
	AND #$7F			 ; 29 7F | Logical AND with accumulator (immediate)
	STA ($11),Y		  ; 91 11 | Store accumulator to (zero page),Y
	ROR $9999,X		  ; 7E 99 99 | Rotate right (absolute,X)
	DEC $787C			; CE 7C 78 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_217
; Address: $E0E10C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_217:
	ROL $FE2C			; 2E 2C FE | Rotate left (absolute)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	STA $CCFF,Y		  ; 99 FF CC | Store accumulator to absolute,Y
	INC $FC60,X		  ; FE 60 FC | Increment (absolute,X)
	BIT $C4FE			; 2C FE C4 | Test bits in accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_218
; Address: $E0E14E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_218:
	JSL $000022		  ; 22 22 00 00 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_219
; Address: $E0E15E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_219:
	JSL $1070FF		  ; 22 FF 70 10 | Jump to subroutine long
	ASL $0302,X		  ; 1E 02 03 | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	STA $00			  ; 85 00 | Store accumulator to zero page
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	STA $FF			  ; 85 FF | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank40_DmaFunction_21A
; Address: $E0E180
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_21A:
	JSR $01C0			; 20 C0 01 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	EOR $BF			  ; 45 BF | Exclusive OR with accumulator (zero page)
	CPY #$78			 ; C0 78 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_21B
; Address: $E0E18F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_21B:
	JSR $E0F0			; 20 F0 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($7D,X)		  ; E1 7D | Subtract with carry ((zero page,X))
	INC $F881,X		  ; FE 81 F8 | Increment (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$BF			 ; E0 BF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_21C
; Address: $E0E19E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_21C:
	JSR $DFFF			; 20 FF DF | Jump to subroutine
	LDA				  ; BF 3F 7F 3F | Load from absolute long,X into accumulator
	JMP $FF83FF		  ; 5C FF 83 FF | Jump to address long
	JMP $FF23FF		  ; 5C FF 23 FF | Jump to address long
	AND $0DFF,Y		  ; 39 FF 0D | Logical AND with accumulator (absolute,Y)
	ROL $EF			  ; 26 EF | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_21D
; Address: $E0E1BE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_21D:
	JSR $DCF7			; 20 F7 DC | Jump to subroutine
	INC $FCFC,X		  ; FE FC FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BNE $FC			  ; D0 FC | Branch if not equal
	INC $F8C0,X		  ; FE C0 F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_21E
; Address: $E0E1D6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_21E:
	BVS $F8			  ; 70 F8 | Branch if overflow set
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ADC ($21,X)		  ; 61 21 | PPU graphics register access
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_221
; Address: $E0E204
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_221:
	LDA				  ; BF BF 6B 6B | Load from absolute long,X into accumulator
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $69FF			; AD FF 69 | Load from absolute address into accumulator
	ORA $42			  ; 05 42 | Hardware register operation
	WDM #$49			 ; 42 49 | Reserved instruction
	EOR #$6D			 ; 49 6D | Exclusive OR with accumulator (immediate)
	ADC $FFFF			; 6D FF FF | Add with carry (absolute)
	WDM #$FF			 ; 42 FF | Reserved instruction
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	CMP $5DFF,X		  ; DD FF 5D | Compare accumulator (absolute,X)
	BCS $FE			  ; B0 FE | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INC $FFEF,X		  ; FE EF FF | Increment (absolute,X)
	PEA #$F0FE		   ; F4 FE F0 | Push effective address to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_222
; Address: $E0E252
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_222:
	JSR $8BFF			; 20 FF 8B | Jump to subroutine
	INC $FFA3,X		  ; FE A3 FF | Increment (absolute,X)
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	ORA $E4			  ; 05 E4 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_223
; Address: $E0E260
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_223:
	JSL $E0DF04		  ; 22 04 DF E0 | Game work RAM access
	BRA $60			  ; 80 60 | Branch always
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $D3E6,X		  ; 1D E6 D3 | Logical OR with accumulator (absolute,X)
	LDA $CB9499		  ; AF 99 94 CB | Load from absolute long address into accumulator
	INC $FF			  ; E6 FF | Increment (zero page)
	BRA $FF			  ; 80 FF | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BRA $60			  ; 80 60 | Branch always
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BCC $C8			  ; 90 C8 | Branch if carry clear
	CLV				  ; B8 | Clear overflow flag
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_224
; Address: $E0E28F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_224:
	INC $00			  ; E6 00 | Increment (zero page)
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $9F1E,X		  ; FE 1E 9F | Increment (absolute,X)
	BCS $40			  ; B0 40 | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_225
; Address: $E0E2A5
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_225:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BIT $2C			  ; 24 2C | Test bits in accumulator (zero page)
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	INC $F6B4,X		  ; FE B4 F6 | Increment (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative
	BCC $FE			  ; 90 FE | Branch if carry clear
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank40_DmaFunction_226
; Address: $E0E2D5
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_226:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SEP #$02			 ; E2 02 | Set processor status bits
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	LDX $4B			  ; A6 4B | Load from zero page into X register
	ROR $75			  ; 66 75 | Rotate right (zero page)
	LDA $B3			  ; A5 B3 | Load from zero page into accumulator
	DEC				  ; 3A | Decrement accumulator
	PLP				  ; 28 | Pull processor status from stack
	ORA ($33),Y		  ; 11 33 | Logical OR with accumulator ((zero page),Y)
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STY $84FF			; 8C FF 84 | Store Y register to absolute address
	LSR $BE			  ; 46 BE | Logical shift right (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $51			  ; 65 51 | Add with carry (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	ADC #$A8			 ; 69 A8 | Add with carry (immediate)
	LDA $37D728		  ; AF 28 D7 37 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_227
; Address: $E0E32A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_227:
	BCS $D0			  ; B0 D0 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	EOR $E986,Y		  ; 59 86 E9 | Exclusive OR with accumulator (absolute,Y)
	ASL $AF			  ; 06 AF | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_22A
; Address: $E0E349
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_22A:
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	BMI $30			  ; 30 30 | Branch if negative
	ADC $41			  ; 65 41 | Add with carry (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank40_DmaFunction_22B
; Address: $E0E366
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_22B:
	ADC ($C1),Y		  ; 71 C1 | Add with carry ((zero page),Y)
	PEA #$EFF4		   ; F4 F4 EF | Push effective address to stack
	ASL $810E,X		  ; 1E 0E 81 | Arithmetic shift left (absolute,X)
	CPY #$AF			 ; C0 AF | Compare Y register (immediate)
	REP #$6F			 ; C2 6F | Reset processor status bits
	STA ($EF,X)		  ; 81 EF | Store accumulator to (zero page,X)
	BCS $FF			  ; B0 FF | Branch if carry set
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_22C
; Address: $E0E381
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_22C:
	JSR $1A18			; 20 18 1A | Jump to subroutine
	ROL $1F02,X		  ; 3E 02 1F | Rotate left (absolute,X)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	BEQ $90			  ; F0 90 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_22F
; Address: $E0E3B4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_22F:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_230
; Address: $E0E3CD
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_230:
	BRA $84			  ; 80 84 | Branch always
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	CPY #$83			 ; C0 83 | Compare Y register (immediate)
	CPY #$87			 ; C0 87 | Compare Y register (immediate)
	STA $5D90,Y		  ; 99 90 5D | Store accumulator to absolute,Y
	TAX				  ; AA | Transfer accumulator to X register
	LDX $AE4C,Y		  ; BE 4C AE | Load from absolute,Y into X register
	JMP $A496			; 4C 96 A4 | Jump to address
	INY				  ; C8 | Increment Y register
	BVC $88			  ; 50 88 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BCC $FF			  ; 90 FF | Branch if carry clear
	INX				  ; E8 | Increment X register
	PEA #$FC6E		   ; F4 6E FC | Push effective address to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ADC #$41			 ; 69 41 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	INC $E6			  ; E6 E6 | Increment (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	STA ($6F,X)		  ; 81 6F | Store accumulator to (zero page,X)
	REP #$AF			 ; C2 AF | Reset processor status bits
	REP #$6F			 ; C2 6F | Reset processor status bits
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	CPX $FF			  ; E4 FF | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_231
; Address: $E0E41C
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_231:
	JSL $FF01FF		  ; 22 FF 01 FF | Jump to subroutine long
	BRA $69			  ; 80 69 | Branch always
	EOR ($AB,X)		  ; 41 AB | Exclusive OR with accumulator ((zero page,X))
	ROR $C6			  ; 66 C6 | Rotate right (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$A9			 ; A9 A9 | Load immediate value into accumulator
	ASL $87C0			; 0E C0 87 | Arithmetic shift left (absolute)
	STA ($6F,X)		  ; 81 6F | Store accumulator to (zero page,X)
	REP #$AF			 ; C2 AF | Reset processor status bits
	CPY $6F			  ; C4 6F | Compare Y register (zero page)
	LDA ($FF,X)		  ; A1 FF | Load from (zero page,X) into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDY $C8			  ; A4 C8 | Load from zero page into Y register
	PLX				  ; FA | Pull X register from stack
	PHA				  ; 48 | Push accumulator to stack
	ADC $ECDA,Y		  ; 79 DA EC | Add with carry (absolute,Y)
	STZ $B4			  ; 64 B4 | Store zero to zero page
	JMP ($FA76)		  ; 6C 76 FA | Jump to address (absolute indirect)
	INC $FF0C,X		  ; FE 0C FF | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($75,X)		  ; 01 75 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_232
; Address: $E0E46C
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_232:
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$81			 ; C0 81 | Compare Y register (immediate)
	CPY #$83			 ; C0 83 | Compare Y register (immediate)
	LDY $C8			  ; A4 C8 | Load from zero page into Y register
	ADC ($F9),Y		  ; 71 F9 | Add with carry ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	CPX $3474			; EC 74 34 | Compare X register (absolute)
	STZ $B4			  ; 64 B4 | Store zero to zero page
	JMP ($FA76)		  ; 6C 76 FA | Jump to address (absolute indirect)
	ORA ($F9,X)		  ; 01 F9 | Logical OR with accumulator ((zero page,X))
	SBC $7400,X		  ; FD 00 74 | Subtract with carry (absolute,X)
	DEY				  ; 88 | Decrement Y register
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $60			  ; F0 60 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	TXS				  ; 9A | Transfer X register to stack pointer
	BCC $5D			  ; 90 5D | Branch if carry clear
	TAX				  ; AA | Transfer accumulator to X register
	LDX $AE4C,Y		  ; BE 4C AE | Load from absolute,Y into X register
	JMP $A496			; 4C 96 A4 | Jump to address
	INY				  ; C8 | Increment Y register
	BVC $88			  ; 50 88 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BCC $FF			  ; 90 FF | Branch if carry clear
	INX				  ; E8 | Increment X register
	PEA #$FC6E		   ; F4 6E FC | Push effective address to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $81			  ; 05 81 | Logical OR with accumulator (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	CPY #$83			 ; C0 83 | Compare Y register (immediate)
	CMP ($87,X)		  ; C1 87 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_233
; Address: $E0E4FE
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_233:
	CPY #$87			 ; C0 87 | Compare Y register (immediate)
	STZ $5F96,X		  ; 9E 96 5F | Store zero to absolute,X
	TAX				  ; AA | Transfer accumulator to X register
	LDX $AE4C,Y		  ; BE 4C AE | Load from absolute,Y into X register
	JMP $A496			; 4C 96 A4 | Jump to address
	INY				  ; C8 | Increment Y register
	BVC $88			  ; 50 88 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	PEA #$FC6E		   ; F4 6E FC | Push effective address to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	TAX				  ; AA | Transfer accumulator to X register
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $71F9,Y		  ; F9 F9 71 | Subtract with carry (absolute,Y)
	ADC ($39),Y		  ; 71 39 | Add with carry ((zero page),Y)
	ROR $C02E			; 6E 2E C0 | Rotate right (absolute)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	PLX				  ; FA | Pull X register from stack
	ROR $FF80,X		  ; 7E 80 FF | Rotate right (absolute,X)
	SBC $7906,Y		  ; F9 06 79 | Subtract with carry (absolute,Y)
	STX $6E			  ; 86 6E | Store X register to zero page
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PLB				  ; AB | Pull data bank register from stack
	CLD				  ; D8 | Clear decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP ($2767)		  ; 6C 67 27 | Jump to address (absolute indirect)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_234
; Address: $E0E54B
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_234:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	BRA $DC			  ; 80 DC | Branch always
	CPX $6703			; EC 03 67 | Compare X register (absolute)
	BRA $60			  ; 80 60 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	LSR $930E			; 4E 0E 93 | Logical shift right (absolute)
	ORA ($3B),Y		  ; 11 3B | Logical OR with accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_235
; Address: $E0E58E
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_235:
	LSR $004C			; 4E 4C 00 | Logical shift right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDY $7100			; AC 00 71 | Load from absolute address into Y register
	EOR ($67,X)		  ; 41 67 | Exclusive OR with accumulator ((zero page,X))
	CPX $AAEC			; EC EC AA | Compare X register (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	CPY #$81			 ; C0 81 | Compare Y register (immediate)
	BRA $63			  ; 80 63 | Branch always
	CPY #$AF			 ; C0 AF | Compare Y register (immediate)
	CMP ($6F,X)		  ; C1 6F | Compare accumulator ((zero page,X))
	STX $FF			  ; 86 FF | Store X register to zero page
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	TAX				  ; AA | Transfer accumulator to X register
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	STA $32320F		  ; 8F 0F 32 32 | Store accumulator to absolute long address
	LDX $DEBE,Y		  ; BE BE DE | Load from absolute,Y into X register
	DEC $FDFD,X		  ; DE FD FD | Decrement (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	TYA				  ; 98 | Transfer Y register to accumulator
	DEC $7171			; CE 71 71 | Decrement (absolute)
	ROR $CCCE,X		  ; 7E CE CC | Rotate right (absolute,X)
	CPX $E0			  ; E4 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	LSR $80FF			; 4E FF 80 | Logical shift right (absolute)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	BPL $F0			  ; 10 F0 | Branch if positive
	BRA $F0			  ; 80 F0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_236
; Address: $E0E627
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_236:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BCC $F0			  ; 90 F0 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank40_DmaFunction_239
; Address: $E0E640
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_239:
	BRA $00			  ; 80 00 | Branch always
	BRA $6F			  ; 80 6F | Branch always
	RTI				  ; 40 | Return from interrupt
	BCS $00			  ; B0 00 | Branch if carry set
	ROR $46			  ; 66 46 | Rotate right (zero page)
	SBC $A9ED			; ED ED A9 | Subtract with carry (absolute)
	LDA #$1A			 ; A9 1A | Load immediate value into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $6F			  ; 80 6F | Branch always
	CPY #$AF			 ; C0 AF | Compare Y register (immediate)
	DEC $7F			  ; C6 7F | Decrement (zero page)
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY #$84			 ; C0 84 | Compare Y register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	CPX $50			  ; E4 50 | Compare X register (zero page)
	BNE $DA			  ; D0 DA | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$4A			 ; 69 4A | Add with carry (immediate)
	INX				  ; E8 | Increment X register
	EOR $F46C,Y		  ; 59 6C F4 | Exclusive OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	INC $FE0C,X		  ; FE 0C FE | Increment (absolute,X)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	INC $0700,X		  ; FE 00 07 | Increment (absolute,X)
	ADC $B6FF			; 6D FF B6 | Add with carry (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	ASL $791E,X		  ; 1E 1E 79 | Arithmetic shift left (absolute,X)
	ADC $CFCF,Y		  ; 79 CF CF | Add with carry (absolute,Y)
	INC $B4FE,X		  ; FE FE B4 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC				  ; 1A | Increment accumulator
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	INY				  ; C8 | Increment Y register
	DEC $A0FF			; CE FF A0 | Decrement (absolute)
	INC $FC10,X		  ; FE 10 FC | Increment (absolute,X)
	ROR $3A3E			; 6E 3E 3A | Rotate right (absolute)
	LDX $DBB4,Y		  ; BE B4 DB | Load from absolute,Y into X register
	PHX				  ; DA | Push X register to stack
	CMP ($FB),Y		  ; D1 FB | Compare accumulator ((zero page),Y)
	LDA #$EF			 ; A9 EF | Load immediate value into accumulator
	CPX $B4			  ; E4 B4 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_23A
; Address: $E0E6CF
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_23A:
	BCC $68			  ; 90 68 | Branch if carry clear
	INC				  ; 1A | Increment accumulator
	LDY $FD			  ; A4 FD | Load from zero page into Y register
	WDM #$FE			 ; 42 FE | Reserved instruction
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $FC			  ; 90 FC | Branch if carry clear
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	BPL $F1			  ; 10 F1 | Branch if positive
	BEQ $CE			  ; F0 CE | Branch if equal
	CPY $607C			; CC 7C 60 | Compare Y register (absolute)
	STY $F888			; 8C 88 F8 | Store Y register to absolute address
	BVS $70			  ; 70 70 | Branch if overflow set
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BNE $FF			  ; D0 FF | Branch if not equal
	JMP $00FC			; 4C FC 00 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BEQ $9D			  ; F0 9D | Branch if equal
	LDA $AF4ABE		  ; AF BE 4A AF | Load from absolute long address into accumulator
	EOR $A297			; 4D 97 A2 | Exclusive OR with accumulator (absolute)
	DEX				  ; CA | Decrement X register
	BVC $88			  ; 50 88 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BVC $FF			  ; 50 FF | Branch if overflow clear
	STA $7F			  ; 85 7F | Store accumulator to zero page
	INX				  ; E8 | Increment X register
	ADC $36FA			; 6D FA 36 | Add with carry (absolute)
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	CPX $B7EC			; EC EC B7 | Compare X register (absolute)
	CPY $E0FC			; CC FC E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_23B
; Address: $E0E72A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_23B:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	AND $FF			  ; 25 FF | Logical AND with accumulator (zero page)
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STZ $5D96,X		  ; 9E 96 5D | Store zero to absolute,X
	LDA $AF4BBF		  ; AF BF 4B AF | Load from absolute long address into accumulator
	LDY $D4			  ; A4 D4 | Load from zero page into Y register
	RTI				  ; 40 | Return from interrupt
	BCC $40			  ; 90 40 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank40_DmaFunction_23C
; Address: $E0E772
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_23C:
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	STX $7F			  ; 86 7F | Store X register to zero page
	SBC #$7F			 ; E9 7F | Subtract with carry (immediate)
	SBC ($6F),Y		  ; F1 6F | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BPL $D4			  ; 10 D4 | Branch if positive
	STZ $54			  ; 64 54 | Store zero to zero page
	JMP ($F2CE)		  ; 6C CE F2 | Jump to address (absolute indirect)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	PEA #$7C08		   ; F4 08 7C | Push effective address to stack
	BRA $FE			  ; 80 FE | Branch always
	STY $807C			; 8C 7C 80 | Store Y register to absolute address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF FF 7F FF | Load from absolute long,X into accumulator
	ADC $A8FF,X		  ; 7D FF A8 | Add with carry (absolute,X)
	INX				  ; E8 | Increment X register
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	LDA $FF			  ; A5 FF | Load from zero page into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	SBC $AA00,X		  ; FD 00 AA | Subtract with carry (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_23D
; Address: $E0E7C1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_23D:
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	BCS $F0			  ; B0 F0 | Branch if carry set
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_23E
; Address: $E0E7D0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_23E:
	JSR $80FC			; 20 FC 80 | Jump to subroutine
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_23F
; Address: $E0E7E3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_23F:
	JSR $80E0			; 20 E0 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	CPX $B820			; EC 20 B8 | Compare X register (absolute)
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank40_DmaFunction_243
; Address: $E0E80A
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_243:
	BRA $00			  ; 80 00 | Branch always
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	SEP #$E2			 ; E2 E2 | Set processor status bits
	LDA $09AD			; AD AD 09 | Load from absolute address into accumulator
	ORA #$C0			 ; 09 C0 | Logical OR with accumulator (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_244
; Address: $E0E836
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_244:
	CPY #$A7			 ; C0 A7 | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$A2			 ; E0 A2 | Compare X register (immediate)
	LDX #$0D			 ; A2 0D | Load immediate value into X register
	ORA $80C0			; 0D C0 80 | Logical OR with accumulator (absolute)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $60			  ; 80 60 | Branch always
	CPY #$A7			 ; C0 A7 | Compare Y register (immediate)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	NOP				  ; EA | No operation
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	BRA $B4			  ; 80 B4 | Branch always
	BVC $94			  ; 50 94 | Branch if overflow clear
	BVS $74			  ; 70 74 | Branch if overflow set
	BNE $DA			  ; D0 DA | Branch if not equal
	JMP $6AD8			; 4C D8 6A | Jump to address
	EOR ($F2),Y		  ; 51 F2 | Exclusive OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	INC $FE04,X		  ; FE 04 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_245
; Address: $E0E878
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_245:
	INC $DF04,X		  ; FE 04 DF | Increment (absolute,X)
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$9A			 ; E0 9A | Compare X register (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	LSR $3F56,X		  ; 5E 56 3F | Logical shift right (absolute,X)
	LDA				  ; BF 4D AF 4A | Load from absolute long,X into accumulator
	LDX #$D7			 ; A2 D7 | Load immediate value into X register
	LSR $96			  ; 46 96 | Logical shift right (zero page)
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	STA ($7F),Y		  ; 91 7F | Store accumulator to (zero page),Y
	CPX $7F			  ; E4 7F | Compare X register (zero page)
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BIT #$89			 ; 89 89 | Test bits in accumulator (immediate)
	PHY				  ; 5A | Push Y register to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL $BFB6,X		  ; 3E B6 BF | Rotate left (absolute,X)
	LDA $A2974D		  ; AF 4D 97 A2 | Load from absolute long address into accumulator
	WDM #$97			 ; 42 97 | Reserved instruction
	LSR $89			  ; 46 89 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	PEA #$FA6F		   ; F4 6F FA | Push effective address to stack
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	ORA $5412,Y		  ; 19 12 54 | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	LDA $2727,Y		  ; B9 27 27 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_247
; Address: $E0E92E
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_247:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STY $1E			  ; 84 1E | Store Y register to zero page
	STA ($3F,X)		  ; 81 3F | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	ROL $19			  ; 26 19 | Rotate left (zero page)
	ASL $0301,X		  ; 1E 01 03 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	NOP				  ; EA | No operation
	CLI				  ; 58 | Clear interrupt disable flag
	CMP $6464,X		  ; DD 64 64 | Compare accumulator (absolute,X)
	CPY $44			  ; C4 44 | Compare Y register (zero page)
	BIT $78			  ; 24 78 | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	PHX				  ; DA | Push X register to stack
	AND ($F8,X)		  ; 21 F8 | Logical AND with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	CPX $18			  ; E4 18 | Compare X register (zero page)
	STZ $98			  ; 64 98 | Store zero to zero page
	SEI				  ; 78 | Set interrupt disable flag
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STY $4280			; 8C 80 42 | Hardware register operation
	RTI				  ; 40 | Return from interrupt
	LDA $D4B8,Y		  ; B9 B8 D4 | Load from absolute,Y into accumulator
	PLX				  ; FA | Pull X register from stack
	TAX				  ; AA | Transfer accumulator to X register
	BRA $FC			  ; 80 FC | Branch always
	RTI				  ; 40 | Return from interrupt
	INC $FF18,X		  ; FE 18 FF | Increment (absolute,X)
	WDM #$FF			 ; 42 FF | Reserved instruction
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	DEY				  ; 88 | Decrement Y register
	BVC $FF			  ; 50 FF | Branch if overflow clear
	BCC $80			  ; 90 80 | Branch if carry clear
	BVC $40			  ; 50 40 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_249
; Address: $E0E990
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_249:
	BRA $F0			  ; 80 F0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank40_DmaFunction_24D
; Address: $E0E99E
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_24D:
	JSR $807C			; 20 7C 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ROR $A9E0,X		  ; 7E E0 A9 | Rotate right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $60			  ; 80 60 | Branch always
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	LDY #$FE			 ; A0 FE | Load immediate value into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX #$AB			 ; A2 AB | Load immediate value into X register
	RTI				  ; 40 | Return from interrupt
	BVC $54			  ; 50 54 | Branch if overflow clear
	BEQ $B4			  ; F0 B4 | Branch if equal
	BVC $1A			  ; 50 1A | Branch if overflow clear
	JMP $6AD8			; 4C D8 6A | Jump to address
	EOR ($F2),Y		  ; 51 F2 | Exclusive OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $FE05,X		  ; FE 05 FE | Increment (absolute,X)
	INC $5F04,X		  ; FE 04 5F | Increment (absolute,X)
	LDX $FF			  ; A6 FF | Load from zero page into X register
	XBA				  ; EB | Exchange accumulator bytes
	STA $048E			; 8D 8E 04 | Store accumulator to absolute address
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	WDM #$DF			 ; 42 DF | Reserved instruction
	STA ($D7,X)		  ; 81 D7 | Store accumulator to (zero page,X)
	ORA $CF			  ; 05 CF | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($F2,X)		  ; 01 F2 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_24E
; Address: $E0EA02
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_24E:
	PLY				  ; 7A | Pull Y register from stack
	PLP				  ; 28 | Pull processor status from stack
	AND $1604,X		  ; 3D 04 16 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_24F
; Address: $E0EA10
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_24F:
	JSR $087E			; 20 7E 08 | Jump to subroutine
	ROL $0704			; 2E 04 07 | Rotate left (absolute)
	STY $84			  ; 84 84 | Store Y register to zero page
	EOR $3B49,Y		  ; 59 49 3B | Exclusive OR with accumulator (absolute,Y)
	LDX $AE56,Y		  ; BE 56 AE | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_250
; Address: $E0EA29
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_250:
	LSR $97			  ; 46 97 | Logical shift right (zero page)
	LDA $D7			  ; A5 D7 | Load from zero page into accumulator
	WDM #$84			 ; 42 84 | Reserved instruction
	PHA				  ; 48 | Push accumulator to stack
	BEQ $6F			  ; F0 6F | Branch if equal
	SBC $FE37,X		  ; FD 37 FE | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_251
; Address: $E0EA43
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_251:
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	CPX #$BC			 ; E0 BC | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_252
; Address: $E0EA4A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_252:
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	LDY $3D3C			; AC 3C 3D | Load from absolute address into Y register
	LDY $80			  ; A4 80 | Load from zero page into Y register
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	LDA				  ; BF F4 AF E8 | Load from absolute long,X into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_253
; Address: $E0EA61
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_253:
	JSR $7224			; 20 24 72 | Jump to subroutine
	AND $5924			; 2D 24 59 | Logical AND with accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	BRA $81			  ; 80 81 | Branch always
	LSR $8F58,X		  ; 5E 58 8F | Logical shift right (absolute,X)
	STX $AAAF			; 8E AF AA | Store X register to absolute address
	CMP ($DB),Y		  ; D1 DB | Compare accumulator ((zero page),Y)
	ORA ($82,X)		  ; 01 82 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_254
; Address: $E0EA83
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_254:
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BCC $00			  ; 90 00 | Branch if carry clear
	TAX				  ; AA | Transfer accumulator to X register
	DEC				  ; 3A | Decrement accumulator
	AND $65AD,X		  ; 3D AD 65 | Logical AND with accumulator (absolute,X)
	JMP $8080C0		  ; 5C C0 80 80 | Jump to address long
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	LDA $D8BFE4		  ; AF E4 BF D8 | Load from absolute long address into accumulator
	LDX $20			  ; A6 20 | Load from zero page into X register
	AND ($72,X)		  ; 21 72 | Logical AND with accumulator ((zero page,X))
	BIT $5824			; 2C 24 58 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_255
; Address: $E0EAA9
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_255:
	CLD				  ; D8 | Clear decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	JMP $8B8F54		  ; 5C 54 8F 8B | Jump to address long
	LDA $D07DA9		  ; AF A9 7D D0 | Load from absolute long address into accumulator
	CMP $8101,Y		  ; D9 01 81 | Compare accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $7B			  ; 06 7B | Arithmetic shift left (zero page)
	ROR $93			  ; 66 93 | Rotate right (zero page)
	STY $8997			; 8C 97 89 | Store Y register to absolute address
	BNE $7F			  ; D0 7F | Branch if not equal
	BCC $DC			  ; 90 DC | Branch if carry clear
	STY $2CF2			; 8C F2 2C | Store Y register to absolute address
	CPY $08B1			; CC B1 08 | Compare Y register (absolute)
	ADC $50			  ; 65 50 | Add with carry (zero page)
	ROR $9B			  ; 66 9B | Rotate right (zero page)
	ASL $7B			  ; 06 7B | Arithmetic shift left (zero page)
	ROR $9B			  ; 66 9B | Rotate right (zero page)
	STX $93			  ; 86 93 | Store X register to zero page
	STY $D867			; 8C 67 D8 | Store Y register to absolute address
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	BRA $F6			  ; 80 F6 | Branch always
	BPL $8C			  ; 10 8C | Branch if positive
	BIT $CCF2			; 2C F2 CC | Test bits in accumulator (absolute)
	ADC ($58,X)		  ; 61 58 | Add with carry ((zero page,X))
	EOR $20			  ; 45 20 | Exclusive OR with accumulator (zero page)
	ORA $7200,Y		  ; 19 00 72 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	JMP ($0080)		  ; 6C 80 00 | Jump to address (absolute indirect)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_256
; Address: $E0EB23
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_256:
	CPY #$AF			 ; C0 AF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BPL $40			  ; 10 40 | Branch if positive
	PLB				  ; AB | Pull data bank register from stack
	AND $6FAD,X		  ; 3D AD 6F | Logical AND with accumulator (absolute,X)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$EF			 ; C0 EF | Compare Y register (immediate)
	CPY #$6F			 ; C0 6F | Compare Y register (immediate)
	REP #$BF			 ; C2 BF | Reset processor status bits
	LDA $DABFE4		  ; AF E4 BF DA | Load from absolute long address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_258
; Address: $E0EB49
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_258:
	CLD				  ; D8 | Clear decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	STA $A9AF8B		  ; 8F 8B AF A9 | Store accumulator to absolute long address
	ADC $D9D0,X		  ; 7D D0 D9 | Add with carry (absolute,X)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $667B			; 0E 7B 66 | Arithmetic shift left (absolute)
	STX $9B			  ; 86 9B | Store X register to zero page
	STY $77			  ; 84 77 | Store Y register to zero page
	CPY $907F			; CC 7F 90 | Compare Y register (absolute)
	INC $F880,X		  ; FE 80 F8 | Increment (absolute,X)
	BPL $8C			  ; 10 8C | Branch if positive
	BIT $CCF2			; 2C F2 CC | Test bits in accumulator (absolute)
	LDX #$0C			 ; A2 0C | Load immediate value into X register
	ADC ($58,X)		  ; 61 58 | Add with carry ((zero page,X))
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	BVS $04			  ; 70 04 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_259
; Address: $E0EB81
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_259:
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	LDA $35			  ; A5 35 | Load from zero page into accumulator
	DEC				  ; 3A | Decrement accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC $9F5C,X		  ; 7D 5C 9F | Add with carry (absolute,X)
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	CPY #$EF			 ; C0 EF | Compare Y register (immediate)
	CPY #$6F			 ; C0 6F | Compare Y register (immediate)
	LDA				  ; BF F0 AF E8 | Load from absolute long,X into accumulator
	LDA				  ; BF C4 7F 8A | Load from absolute long,X into accumulator
	INC $28			  ; E6 28 | Increment (zero page)
	AND #$A8			 ; 29 A8 | Logical AND with accumulator (immediate)
	BIT $74			  ; 24 74 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	BRA $80			  ; 80 80 | Branch always
	ASL $51DF,X		  ; 1E DF 51 | Arithmetic shift left (absolute,X)
	STA $AC88			; 8D 88 AC | Store accumulator to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register
	CLD				  ; D8 | Clear decimal mode flag
	BVC $80			  ; 50 80 | Branch if overflow clear
	ADC ($C0,X)		  ; 61 C0 | Add with carry ((zero page,X))
	LDX $40			  ; A6 40 | Load from zero page into X register
	ORA $9041,Y		  ; 19 41 90 | Logical OR with accumulator (absolute,Y)
	LDA #$6D			 ; A9 6D | Load immediate value into accumulator
	JMP $80069F		  ; 5C 9F 06 80 | Jump to address long
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_25A
; Address: $E0EBD4
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_25A:
	CMP ($6F,X)		  ; C1 6F | Compare accumulator ((zero page,X))
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	LDA $D4BFE9		  ; AF E9 BF D4 | Load from absolute long address into accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	ROR $9B			  ; 66 9B | Rotate right (zero page)
	STX $93			  ; 86 93 | Store X register to zero page
	STX $DC67			; 8E 67 DC | Store X register to absolute address
	LDY $D1BF,X		  ; BC BF D1 | Load from absolute,X into Y register
	BEQ $10			  ; F0 10 | Branch if equal
	BIT $CCF3			; 2C F3 CC | Test bits in accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	ORA $3B40			; 0D 40 3B | Logical OR with accumulator (absolute)
	ASL $7BE8			; 0E E8 7B | Arithmetic shift left (absolute)
	ROR $9B			  ; 66 9B | Rotate right (zero page)
	STX $93			  ; 86 93 | Store X register to zero page
	STX $DD67			; 8E 67 DD | Store X register to absolute address
	LDA $90FF,Y		  ; B9 FF 90 | Load from absolute,Y into accumulator
	BPL $2C			  ; 10 2C | Branch if positive
	CPY $0CB2			; CC B2 0C | Compare Y register (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	ORA $7B00			; 0D 00 7B | Logical OR with accumulator (absolute)
	INX				  ; E8 | Increment X register
	INC $7D7E,X		  ; FE 7E 7D | Increment (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	SEP #$F2			 ; E2 F2 | Set processor status bits
	PLY				  ; 7A | Pull Y register from stack
	ROR $3C3C,X		  ; 7E 3C 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SEP #$63			 ; E2 63 | Set processor status bits
	ROL $72			  ; 26 72 | Rotate left (zero page)
	ROR $0034,X		  ; 7E 34 00 | Rotate right (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ROR $3337,X		  ; 7E 37 33 | Rotate right (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	ASL $2376,X		  ; 1E 76 23 | Arithmetic shift left (absolute,X)
	AND ($61),Y		  ; 31 61 | Logical AND with accumulator ((zero page),Y)
	ADC ($30),Y		  ; 71 30 | Add with carry ((zero page),Y)
	ROR $DB99,X		  ; 7E 99 DB | Rotate right (absolute,X)
	STA $1818,Y		  ; 99 18 18 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ROL $7736,X		  ; 3E 36 77 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_25C
; Address: $E0ED62
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_25C:
	ROL $363E,X		  ; 3E 3E 36 | Rotate left (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	BMI $7D			  ; 30 7D | Branch if negative
	INC $007E,X		  ; FE 7E 00 | Increment (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ROR $4A5A,X		  ; 7E 5A 4A | Rotate right (absolute,X)
	LSR $4E5E,X		  ; 5E 5E 4E | Logical shift right (absolute,X)
	LSR $4E			  ; 46 4E | Logical shift right (zero page)
	LSR $E246			; 4E 46 E2 | Logical shift right (absolute)
	LSR $64			  ; 46 64 | Logical shift right (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $003C,X		  ; 7E 3C 00 | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	ROR $642C,X		  ; 7E 2C 64 | Rotate right (absolute,X)
	LSR $C647			; 4E 47 C6 | Logical shift right (absolute)
	LDA $0000C7		  ; AF C7 00 00 | Load from absolute long address into accumulator
	ROL $3A37,X		  ; 3E 37 3A | Rotate left (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	BMI $FC			  ; 30 FC | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	ROL $3836,X		  ; 3E 36 38 | Rotate left (absolute,X)
	ROL $3634,X		  ; 3E 34 36 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ASL $0607			; 0E 07 06 | Arithmetic shift left (absolute)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_25D
; Address: $E0EE44
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_25D:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHY				  ; 5A | Push Y register to stack
	ROL $3E3E			; 2E 3E 3E | Rotate left (absolute)
	ASL $001B			; 0E 1B 00 | Arithmetic shift left (absolute)
	ROR $62			  ; 66 62 | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	ROR $C2			  ; 66 C2 | Rotate right (zero page)
	SEP #$66			 ; E2 66 | Set processor status bits
	STZ $00			  ; 64 00 | Store zero to zero page
	ASL $0E3F,X		  ; 1E 3F 0E | Arithmetic shift left (absolute,X)
	ASL $0E0C			; 0E 0C 0E | Arithmetic shift left (absolute)
	ROR $6666,X		  ; 7E 66 66 | Rotate right (absolute,X)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	SED				  ; F8 | Set decimal mode flag
	ROR $3736,X		  ; 7E 36 37 | Rotate right (absolute,X)
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $3F1E			; 0E 1E 3F | Arithmetic shift left (absolute)
	ADC ($31,X)		  ; 61 31 | Add with carry ((zero page,X))
	BVS $61			  ; 70 61 | Branch if overflow set
	JMP ($3C34)		  ; 6C 34 3C | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $003C,X		  ; 7E 3C 00 | Rotate right (absolute,X)
	ASL $0E0C			; 0E 0C 0E | Arithmetic shift left (absolute)
	ASL $0E0C			; 0E 0C 0E | Arithmetic shift left (absolute)
	INC $EE6C			; EE 6C EE | Increment (absolute)
	JMP ($4C6A)		  ; 6C 6A 4C | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_25E
; Address: $E0EFA0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_25E:
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $7E7E,X		  ; 7E 7E 7E | Rotate right (absolute,X)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $7E			  ; 66 7E | Rotate right (zero page)
	ROR $E7			  ; 66 E7 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_25F
; Address: $E0EFCB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_25F:
	JSL $08363E		  ; 22 3E 36 08 | Jump to subroutine long
	ROR $F836,X		  ; 7E 36 F8 | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BIT $2C2E			; 2C 2E 2C | Test bits in accumulator (absolute)
	ROR $3C2C			; 6E 2C 3C | Rotate right (absolute)
	ROR $466E,X		  ; 7E 6E 46 | Rotate right (absolute,X)
	LSR $E7			  ; 46 E7 | Logical shift right (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_265
; Address: $E0F02E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_265:
	ORA $001D			; 0D 1D 00 | Logical OR with accumulator (absolute)
	SBC $717B,X		  ; FD 7B 71 | Subtract with carry (absolute,X)
	ADC ($E3,X)		  ; 61 E3 | Add with carry ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BMI $38			  ; 30 38 | Branch if negative
	SEC				  ; 38 | Set carry flag
	ROL $3634,X		  ; 3E 34 36 | Rotate left (absolute,X)
	LDA				  ; BF 77 00 00 | Load from absolute long,X into accumulator
	ASL $3E1C			; 0E 1C 3E | Arithmetic shift left (absolute)
	ADC ($31,X)		  ; 61 31 | Add with carry ((zero page,X))
	BVS $61			  ; 70 61 | Branch if overflow set
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_26D
; Address: $E0F128
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_26D:
	BVS $61			  ; 70 61 | Branch if overflow set
	ADC ($31,X)		  ; 61 31 | Add with carry ((zero page,X))
	ROL $0E33,X		  ; 3E 33 0E | Rotate left (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_26E
; Address: $E0F144
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_26E:
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	PLX				  ; FA | Pull X register from stack
	ROR $3337,X		  ; 7E 37 33 | Rotate right (absolute,X)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROR $64			  ; 66 64 | Rotate right (zero page)
	ROR $6C			  ; 66 6C | Rotate right (zero page)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $7C			  ; 30 7C | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	CMP $CECD,Y		  ; D9 CD CE | Compare accumulator (absolute,Y)
	ROR $C6			  ; 66 C6 | Rotate right (zero page)
	AND $0000,Y		  ; 39 00 00 | Logical AND with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $3700,X		  ; 7E 00 37 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	INC $7F00,X		  ; FE 00 7F | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $0E			  ; 10 0E | Branch if positive
	BPL $21			  ; 10 21 | PPU graphics register access
	ORA ($60,X)		  ; 01 60 | Logical OR with accumulator ((zero page,X))
	ASL $3F00,X		  ; 1E 00 3F | Arithmetic shift left (absolute,X)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank40_DmaFunction_26F
; Address: $E0F28D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_26F:
	JSL $006300		  ; 22 00 63 00 | Jump to subroutine long
	ROL $7700,X		  ; 3E 00 77 | Rotate left (absolute,X)
	LDY #$42			 ; A0 42 | Hardware register operation
	BPL $62			  ; 10 62 | Branch if positive
	PLY				  ; 7A | Pull Y register from stack
	ROR $3102,X		  ; 7E 02 31 | Rotate right (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank40_DmaFunction_270
; Address: $E0F2F8
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_270:
	INC $7F00,X		  ; FE 00 7F | Increment (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	ROL $7700,X		  ; 3E 00 77 | Rotate left (absolute,X)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ROR $9942,X		  ; 7E 42 99 | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STA $1800,Y		  ; 99 00 18 | Store accumulator to absolute,Y
	SEI				  ; 78 | Set interrupt disable flag
	ROR $FC00,X		  ; 7E 00 FC | Rotate right (absolute,X)
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROL $3C00,X		  ; 3E 00 3C | Rotate left (absolute,X)
	ROL $3600,X		  ; 3E 00 36 | Rotate left (absolute,X)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	BIT $2C00			; 2C 00 2C | Test bits in accumulator (absolute)
	BIT $3C42			; 2C 42 3C | Test bits in accumulator (absolute)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	ROL $6E00			; 2E 00 6E | Rotate left (absolute)
	ROR $6E00,X		  ; 7E 00 6E | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_273
; Address: $E0F3AA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_273:
	BPL $23			  ; 10 23 | Branch if positive
	BPL $0D			  ; 10 0D | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_277
; Address: $E0F3CB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_277:
	JSL $143600		  ; 22 00 36 14 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	ROL $1C00,X		  ; 3E 00 1C | Rotate left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PHY				  ; 5A | Push Y register to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $4608			; 4E 08 46 | Logical shift right (absolute)
	LSR $04			  ; 46 04 | Logical shift right (zero page)
	WDM #$82			 ; 42 82 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	PLY				  ; 7A | Pull Y register from stack
	ROR $5E00,X		  ; 7E 00 5E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_278
; Address: $E0F3F6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_278:
	LSR $4E00,X		  ; 5E 00 4E | Logical shift right (absolute,X)
	LSR $E600			; 4E 00 E6 | Logical shift right (absolute)
	INC $00			  ; E6 00 | Increment (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROL $3E00			; 2E 00 3E | Rotate left (absolute)
	ORA ($0A),Y		  ; 11 0A | Logical OR with accumulator ((zero page),Y)
	ROL $1F00,X		  ; 3E 00 1F | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_279
; Address: $E0F42B
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_279:
	JSL $003408		  ; 22 08 34 00 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $3C00,X		  ; 7E 00 3C | Rotate right (absolute,X)
	ROL $3200,X		  ; 3E 00 32 | Rotate left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $02			  ; 30 02 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ROR $0036,X		  ; 7E 36 00 | Rotate right (absolute,X)
	ROL $3600,X		  ; 3E 00 36 | Rotate left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	INC $2000,X		  ; FE 00 20 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_27A
; Address: $E0F46D
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_27A:
	JSL $38300C		  ; 22 0C 30 38 | Jump to subroutine long
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_27B
; Address: $E0F4CD
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_27B:
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_27D
; Address: $E0F567
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_27D:
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_27E
; Address: $E0F575
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_27E:
	JSR $18D8			; 20 D8 18 | Jump to subroutine
	DEC $BF1E,X		  ; DE 1E BF | Decrement (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_27F
; Address: $E0F58D
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_27F:
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $FE80,X		  ; FE 80 FE | Increment (absolute,X)
	CPY $FE			  ; C4 FE | Compare Y register (zero page)
	BRA $CE			  ; 80 CE | Branch always
	BPL $D6			  ; 10 D6 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	CLD				  ; D8 | Clear decimal mode flag
	INC $F101,X		  ; FE 01 F1 | Increment (absolute,X)
	ASL $11EE			; 0E EE 11 | Arithmetic shift left (absolute)
	AND #$9A			 ; 29 9A | Logical AND with accumulator (immediate)
	ADC $DC			  ; 65 DC | Add with carry (zero page)
	BVS $7F			  ; 70 7F | Branch if overflow set
	LSR $7E			  ; 46 7E | Logical shift right (zero page)
	ORA ($45),Y		  ; 11 45 | Logical OR with accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $90			  ; C4 90 | Compare Y register (zero page)
	CPY $45			  ; C4 45 | Compare Y register (zero page)
	ADC $00FF,X		  ; 7D FF 00 | Add with carry (absolute,X)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	INC $EF01,X		  ; FE 01 EF | Increment (absolute,X)
	BPL $EF			  ; 10 EF | Branch if positive
	BRA $FF			  ; 80 FF | Branch always
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	CPY $70FD			; CC FD 70 | Compare Y register (absolute)
	PLX				  ; FA | Pull X register from stack
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $F3			  ; F0 F3 | Branch if equal
	SBC $7A02,X		  ; FD 02 7A | Subtract with carry (absolute,X)
	STA $FF			  ; 85 FF | Store accumulator to zero page
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	BPL $33			  ; 10 33 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $00FF,Y		  ; 19 FF 00 | Logical OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	STY $FD			  ; 84 FD | Store Y register to zero page
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank40_DmaFunction_280
; Address: $E0F643
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_280:
	JSR $403F			; 20 3F 40 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BRA $21			  ; 80 21 | PPU graphics register access
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$07			 ; E0 07 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_282
; Address: $E0F659
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_282:
	ASL $0420,X		  ; 1E 20 04 | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	LDA $070F70		  ; AF 70 0F 07 | Load from absolute long address into accumulator
	BRA $17			  ; 80 17 | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	INX				  ; E8 | Increment X register
	CPY $E4			  ; C4 E4 | Compare Y register (zero page)
	STA ($CF,X)		  ; 81 CF | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_283
; Address: $E0F6EA
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_283:
	JSR $C832			; 20 32 C8 | Jump to subroutine
	SBC ($E0,X)		  ; E1 E0 | Game work RAM access
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $CF			  ; 10 CF | Branch if positive
	BMI $BF			  ; 30 BF | Branch if negative
	RTI				  ; 40 | Return from interrupt
	SBC $12			  ; E5 12 | Subtract with carry (zero page)
	ORA $2239,Y		  ; 19 39 22 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ROL $F8C0,X		  ; 3E C0 F8 | Rotate left (absolute,X)
	ADC ($E1,X)		  ; 61 E1 | Add with carry ((zero page,X))
	ROL $67			  ; 26 67 | Rotate left (zero page)
	ASL $97			  ; 06 97 | Arithmetic shift left (zero page)
	LDA				  ; BF 40 FE 01 | Load from absolute long,X into accumulator
	PLP				  ; 28 | Pull processor status from stack
	BPL $6F			  ; 10 6F | Branch if positive
	BCC $9F			  ; 90 9F | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_286
; Address: $E0F72A
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_286:
	JSR $2086			; 20 86 20 | Jump to subroutine
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	STA $FC8778		  ; 8F 78 87 FC | Store accumulator to absolute long address
	DEC $EF21,X		  ; DE 21 EF | Decrement (absolute,X)
	BPL $F7			  ; 10 F7 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	STA $151470		  ; 8F 70 14 15 | Store accumulator to absolute long address
	ORA ($13),Y		  ; 11 13 | Logical OR with accumulator ((zero page),Y)
	ADC ($7B,X)		  ; 61 7B | Add with carry ((zero page,X))
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $847B			; CC 7B 84 | Compare Y register (absolute)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	BPL $A7			  ; 10 A7 | Branch if positive
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_287
; Address: $E0F75F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_287:
	JSR $0401			; 20 01 04 | Jump to subroutine
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FD			  ; 80 FD | Branch always
	BRA $65			  ; 80 65 | Branch always
	BRA $23			  ; 80 23 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_288
; Address: $E0F78E
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_288:
	JSL $00C841		  ; 22 41 C8 00 | Jump to subroutine long
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $02			  ; 80 02 | Branch always
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	CPY #$1A			 ; C0 1A | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	INC $3F7F,X		  ; FE 7F 3F | Increment (absolute,X)
	LDA $012B0F		  ; AF 0F 2B 01 | Load from absolute long address into accumulator
	AND ($EE,X)		  ; 21 EE | Logical AND with accumulator ((zero page,X))
	SBC $FEFD,X		  ; FD FD FE | Subtract with carry (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_289
; Address: $E0F7EC
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_289:
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	LDA				  ; BF BF 00 C0 | Load from absolute long,X into accumulator
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_28A
; Address: $E0F828
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_28A:
	JSR $605F			; 20 5F 60 | Jump to subroutine
	STA				  ; 9F 70 8F 30 | Store accumulator to absolute long,X
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F AF 8F CF | Store accumulator to absolute long,X
	BRA $40			  ; 80 40 | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BCS $B0			  ; B0 B0 | Branch if carry set
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($08,X)		  ; 21 08 | Logical AND with accumulator ((zero page,X))
	ASL $0100,X		  ; 1E 00 01 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF F0 FF C0 | Load from absolute long,X into accumulator
	BRA $FE			  ; 80 FE | Branch always
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA ($7D,X)		  ; 01 7D | Logical OR with accumulator ((zero page,X))
	JMP $00D8			; 4C D8 00 | Jump to address
	BCS $00			  ; B0 00 | Branch if carry set
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BCS $7F			  ; B0 7F | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_28C
; Address: $E0F8D2
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_28C:
	LDA				  ; BF 3F 77 07 | Load from absolute long,X into accumulator
	LDA				  ; BF 1F 5F 1F | Load from absolute long,X into accumulator
	STA				  ; 9F 1F 0F 0F | Store accumulator to absolute long,X
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	CMP $00D8,Y		  ; D9 D8 00 | Compare accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	LDA				  ; BF BF BF BF | Load from absolute long,X into accumulator
	STA $0F8F0F		  ; 8F 0F 8F 0F | Store accumulator to absolute long address
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	SBC $F902,Y		  ; F9 02 F9 | Subtract with carry (absolute,Y)
	SBC $D7C7,X		  ; FD C7 D7 | Subtract with carry (absolute,X)
	SBC $E9			  ; E5 E9 | Subtract with carry (zero page)
	SBC $F9FD,Y		  ; F9 FD F9 | Subtract with carry (absolute,Y)
	SBC $FFFD,X		  ; FD FD FF | Subtract with carry (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SBC $FEF1,X		  ; FD F1 FE | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ADC ($01),Y		  ; 71 01 | Add with carry ((zero page),Y)
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SBC $FD03,X		  ; FD 03 FD | Subtract with carry (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ADC ($F0),Y		  ; 71 F0 | Add with carry ((zero page),Y)
	BVS $FB			  ; 70 FB | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	SBC $00FC,X		  ; FD FC 00 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank40_DmaFunction_28D
; Address: $E0F9AE
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_28D:
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 00 BF 00 | Store accumulator to absolute long,X
	STA				  ; 9F 9F BF BF | Store accumulator to absolute long,X
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	SBC $F9F9,Y		  ; F9 F9 F9 | Subtract with carry (absolute,Y)
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	LDA ($CE),Y		  ; B1 CE | Load from (zero page),Y into accumulator
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	EOR ($7E,X)		  ; 41 7E | Exclusive OR with accumulator ((zero page,X))
	EOR ($7E,X)		  ; 41 7E | Exclusive OR with accumulator ((zero page,X))
	JMP $243B			; 4C 3B 24 | Jump to address
	ROL $3021,X		  ; 3E 21 30 | Rotate left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ASL $FF00,X		  ; 1E 00 FF | Arithmetic shift left (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	SEC				  ; 38 | Set carry flag
	ASL $0810			; 0E 10 08 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	JMP $3000			; 4C 00 30 | Jump to address
	BPL $01			  ; 10 01 | Branch if positive
	BPL $07			  ; 10 07 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BEQ $0F			  ; F0 0F | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_28E
; Address: $E0FAAA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_28E:
	LDX $F071			; AE 71 F0 | Load from absolute address into X register
	CMP ($F1,X)		  ; C1 F1 | Compare accumulator ((zero page,X))
	BRA $0F			  ; 80 0F | Branch always
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	PEA #$0707		   ; F4 07 07 | Push effective address to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_28F
; Address: $E0FAFC
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_28F:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BCC $80			  ; 90 80 | Branch if carry clear
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $7F80,X		  ; FE 80 7F | Increment (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	LDA				  ; BF 00 BF FD | Load from absolute long,X into accumulator
	INC $7EFF,X		  ; FE FF 7E | Increment (absolute,X)
	ROR $7F7F,X		  ; 7E 7F 7F | Rotate right (absolute,X)
	LDA				  ; BF FF BF FF | Load from absolute long,X into accumulator
	ROR $FE03,X		  ; 7E 03 FE | Rotate right (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $7C7C,X		  ; FE 7C 7C | Increment (absolute,X)
	ROR $7EFC,X		  ; 7E FC 7E | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FEF8,Y		  ; F9 F8 FE | Subtract with carry (absolute,Y)
	INC $80FF,X		  ; FE FF 80 | Increment (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF C0 3F C2 | Load from absolute long,X into accumulator
	WDM #$3F			 ; 42 3F | Reserved instruction
	AND $BD3D,X		  ; 3D 3D BD | Logical AND with accumulator (absolute,X)
	AND $3C3E,X		  ; 3D 3E 3C | Logical AND with accumulator (absolute,X)
	ROL $3CBC,X		  ; 3E BC 3C | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	XBA				  ; EB | Exchange accumulator bytes
	BMI $FF			  ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank40_DmaFunction_290
; Address: $E0FBA4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_290:
	JSR $08F7			; 20 F7 08 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	CPX #$F9			 ; E0 F9 | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	EOR ($BF,X)		  ; 41 BF | Exclusive OR with accumulator ((zero page,X))
	EOR ($BF,X)		  ; 41 BF | Exclusive OR with accumulator ((zero page,X))
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 60 9F BF | Load from absolute long,X into accumulator
	LDA				  ; BF FF BF FE | Load from absolute long,X into accumulator
	LDX $BEBF,Y		  ; BE BF BE | Load from absolute,Y into X register
	LDA				  ; BF 3E 3F 3E | Load from absolute long,X into accumulator
	LDX $9EBE,Y		  ; BE BE 9E | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_291
; Address: $E0FBDF
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_291:
	STZ $F508,X		  ; 9E 08 F5 | Store zero to absolute,X
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	BRA $FD			  ; 80 FD | Branch always
	BRA $FD			  ; 80 FD | Branch always
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $F1F5,X		  ; FD F5 F1 | Subtract with carry (absolute,X)
	SBC $7DED			; ED ED 7D | Subtract with carry (absolute)
	ADC $3DBD,X		  ; 7D BD 3D | Add with carry (absolute,X)
	LDA $3D3D,X		  ; BD 3D 3D | Load from absolute,X into accumulator
	AND $3D3D,X		  ; 3D 3D 3D | Logical AND with accumulator (absolute,X)
	AND $003D,X		  ; 3D 3D 00 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_292
; Address: $E0FC21
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_292:
	JSR $1C1F			; 20 1F 1C | Jump to subroutine
	AND $3E3C,X		  ; 3D 3C 3E | Logical AND with accumulator (absolute,X)
	AND ($3F,X)		  ; 21 3F | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank40_DmaFunction_293
; Address: $E0FC2B
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_293:
	JSR $3F20			; 20 20 3F | Jump to subroutine
	ORA $001F,X		  ; 1D 1F 00 | Logical OR with accumulator (absolute,X)
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BRA $7F			  ; 80 7F | Branch always
	CPY $80C3			; CC C3 80 | Compare Y register (absolute)
	STA				  ; 9F 60 07 F8 | Store accumulator to absolute long,X
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 00 FC 00 | Load from absolute long,X into accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $40			  ; 80 40 | Branch always
	BRA $01			  ; 80 01 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $30			  ; 80 30 | Branch always
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	BRA $63			  ; 80 63 | Branch always
	BRA $3F			  ; 80 3F | Branch always
	RTI				  ; 40 | Return from interrupt
	ROL $FF00,X		  ; 3E 00 FF | Rotate left (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_294
; Address: $E0FCAA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_294:
	JSR $C01F			; 20 1F C0 | Jump to subroutine
	BRA $1F			  ; 80 1F | Branch always
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank40_DmaFunction_295
; Address: $E0FCC3
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_295:
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $16			  ; F0 16 | Branch if equal
	SBC ($05,X)		  ; E1 05 | Subtract with carry ((zero page,X))
	SEP #$0B			 ; E2 0B | Set processor status bits
	PEA #$F007		   ; F4 07 F0 | Push effective address to stack
	STY $90			  ; 84 90 | Store Y register to zero page
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	SBC ($F8,X)		  ; E1 F8 | Subtract with carry ((zero page,X))
	SEP #$E0			 ; E2 E0 | Game work RAM access
	SBC ($F0),Y		  ; F1 F0 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_296
; Address: $E0FCE8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_296:
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	LDA				  ; BF 1F DF 1F | Load from absolute long,X into accumulator
	LDA				  ; BF 3F FF FF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank40_DmaFunction_298
; Address: $E0FD04
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_298:
	JSR $10FF			; 20 FF 10 | Jump to subroutine
	BPL $8F			  ; 10 8F | Branch if positive
	BPL $CF			  ; 10 CF | Branch if positive
	LDA $DFCF8F		  ; AF 8F CF DF | Load from absolute long address into accumulator
	STA $EFCFEF		  ; 8F EF CF EF | Store accumulator to absolute long address
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	STA				  ; 9F 9F 9F 9F | Store accumulator to absolute long,X
	LDA				  ; BF 20 9F 21 | Load from absolute long,X into accumulator
	ASL $9F20,X		  ; 1E 20 9F | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_299
; Address: $E0FD49
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_299:
	STA				  ; 9F 40 9F 00 | Store accumulator to absolute long,X
	BPL $CF			  ; 10 CF | Branch if positive
	ROL $1E7E,X		  ; 3E 7E 1E | Rotate left (absolute,X)
	LSR $DE1E,X		  ; 5E 1E DE | Logical shift right (absolute,X)
	STA				  ; 9F DF 9F 9F | Store accumulator to absolute long,X
	STA				  ; 9F BF DF FF | Store accumulator to absolute long,X
	DEC $02EE			; CE EE 02 | Decrement (absolute)
	SBC $7982,Y		  ; F9 82 79 | Subtract with carry (absolute,Y)
	ADC $FD02,Y		  ; 79 02 FD | Add with carry (absolute,Y)
	SBC $FC01,X		  ; FD 01 FC | Subtract with carry (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $7D79,X		  ; FE 79 7D | Increment (absolute,X)
	ADC $797D,Y		  ; 79 7D 79 | Add with carry (absolute,Y)
	ADC $FDFD,X		  ; 7D FD FD | Add with carry (absolute,X)
	SBC $FCFF,X		  ; FD FF FC | Subtract with carry (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_29A
; Address: $E0FD7E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_29A:
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC ($FD),Y		  ; F1 FD | Subtract with carry ((zero page),Y)
	SBC ($F3),Y		  ; F1 F3 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_29B
; Address: $E0FDA0
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_29B:
	JSR $209F			; 20 9F 20 | Jump to subroutine
	STA				  ; 9F 00 9F 00 | Store accumulator to absolute long,X
	BPL $CF			  ; 10 CF | Branch if positive
	STZ $9EDE,X		  ; 9E DE 9E | Store zero to absolute,X
	DEC $FE9E,X		  ; DE 9E FE | Decrement (absolute,X)
	ADC $7D80,X		  ; 7D 80 7D | Add with carry (absolute,X)
	BRA $3D			  ; 80 3D | Branch always
	CPY #$3D			 ; C0 3D | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	AND $3D00,X		  ; 3D 00 3D | Logical AND with accumulator (absolute,X)
	AND $FD00,X		  ; 3D 00 FD | Logical AND with accumulator (absolute,X)
	AND $3DBD,X		  ; 3D BD 3D | Logical AND with accumulator (absolute,X)
	AND $7D3D,X		  ; 3D 3D 7D | Logical AND with accumulator (absolute,X)
	AND $3D3D,X		  ; 3D 3D 3D | Logical AND with accumulator (absolute,X)
	LDA $FD3D,X		  ; BD 3D FD | Load from absolute,X into accumulator
	AND $FDFD,X		  ; 3D FD FD | Logical AND with accumulator (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	SBC $FDFD,X		  ; FD FD FD | Subtract with carry (absolute,X)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	ORA $101F,Y		  ; 19 1F 10 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ORA $0A16,Y		  ; 19 16 0A | Logical OR with accumulator (absolute,Y)
	ORA #$1E			 ; 09 1E | Logical OR with accumulator (immediate)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_29C
; Address: $E0FE0D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_29C:
	JSR $302F			; 20 2F 30 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	DEY				  ; 88 | Decrement Y register
	INC $19			  ; E6 19 | Increment (zero page)
	ORA $07F8			; 0D F8 07 | Logical OR with accumulator (absolute)
	BRA $7F			  ; 80 7F | Branch always
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	AND ($11,X)		  ; 21 11 | Logical AND with accumulator ((zero page,X))
	ROL $0B			  ; 26 0B | Rotate left (zero page)
	BPL $3F			  ; 10 3F | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank40_DmaFunction_29D
; Address: $E0FE4D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_29D:
	BRA $3E			  ; 80 3E | Branch always
	EOR ($40,X)		  ; 41 40 | Exclusive OR with accumulator ((zero page,X))
	AND $1A20,X		  ; 3D 20 1A | Logical AND with accumulator (absolute,X)
	AND ($08,X)		  ; 21 08 | Logical AND with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA $7800,X		  ; 1D 00 78 | Logical OR with accumulator (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_29F
; Address: $E0FE62
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_29F:
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF E0 1F F0 | Load from absolute long,X into accumulator
	BEQ $3F			  ; F0 3F | Branch if equal
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 7F 3F 5F | Load from absolute long,X into accumulator
	STA				  ; 9F 0F 3F 0F | Store accumulator to absolute long,X
	PHP				  ; 08 | Push processor status to stack
	LDA $7F7FAF		  ; AF AF 7F 7F | Load from absolute long address into accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STA $EC8B2C		  ; 8F 2C 8B EC | Store accumulator to absolute long address
	PHB				  ; 8B | Push data bank register to stack
	SBC ($06),Y		  ; F1 06 | Subtract with carry ((zero page),Y)
	SBC $FB07,Y		  ; F9 07 FB | Subtract with carry (absolute,Y)
	SBC ($FD),Y		  ; F1 FD | Subtract with carry ((zero page),Y)
	SBC $8BF8,Y		  ; F9 F8 8B | Subtract with carry (absolute,Y)
	BRA $30			  ; 80 30 | Branch always
	BMI $CF			  ; 30 CF | Branch if negative
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $FE			  ; 80 FE | Branch always
	INX				  ; E8 | Increment X register
	CPX #$F1			 ; E0 F1 | Compare X register (immediate)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	BEQ $FE			  ; F0 FE | Branch if equal
	BMI $EF			  ; 30 EF | Branch if negative
	BMI $CF			  ; 30 CF | Branch if negative
	BVS $8F			  ; 70 8F | Branch if overflow set
	STZ $9F			  ; 64 9F | Store zero to zero page
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 7D 00 | Load from absolute long,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	INC $2F0F,X		  ; FE 0F 2F | Increment (absolute,X)
	STA $8F9F8F		  ; 8F 8F 9F 8F | Store accumulator to absolute long address
	STA $80			  ; 85 80 | Store accumulator to zero page
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank40_DmaFunction_2A0
; Address: $E0FF48
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_2A0:
	JSR $CFDF			; 20 DF CF | Jump to subroutine
	STZ $007F,X		  ; 9E 7F 00 | Store zero to absolute,X
	LDA				  ; BF 5F 1F CF | Load from absolute long,X into accumulator
	ASL $FF00,X		  ; 1E 00 FF | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank40_DmaFunction_2A1
; Address: $E0FF64
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank40_DmaFunction_2A1:
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($F7,X)		  ; 01 F7 | Logical OR with accumulator ((zero page,X))
	STA $CF0000		  ; 8F 00 00 CF | Store accumulator to absolute long address
	ADC ($08,X)		  ; 61 08 | Add with carry ((zero page,X))
	STA $000000		  ; 8F 00 00 00 | Store accumulator to absolute long address
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $F900,X		  ; FD 00 F9 | Subtract with carry (absolute,X)
	BRA $F9			  ; 80 F9 | Branch always
	BRA $F1			  ; 80 F1 | Branch always
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC $FDFD,X		  ; FD FD FD | Subtract with carry (absolute,X)
	SBC $F9FD,X		  ; FD FD F9 | Subtract with carry (absolute,X)
	SBC $89F9,Y		  ; F9 F9 89 | Subtract with carry (absolute,Y)
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	SBC ($1B),Y		  ; F1 1B | Subtract with carry ((zero page),Y)
	BIT $437C			; 2C 7C 43 | Test bits in accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; GameLogic_001
; Address: $E0FFC8
; Size: 26 bytes
;------------------------------------------------------------------------------
GameLogic_001:
	RTI				  ; 40 | Return from interrupt
	BVC $6F			  ; 50 6F | Branch if overflow clear
	ROR $0341,X		  ; 7E 41 03 | Rotate right (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	ROL $E700,X		  ; 3E 00 E7 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
