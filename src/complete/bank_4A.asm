;==============================================================================
; Dragon Quest III - Bank $4A
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $E50000-$E57FFF
; Instructions: 8633
; Bytes: 32769
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_4A"

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_000
; Address: $E58000
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_000:
	INC $3DC7,X		  ; FE C7 3D | Increment (absolute,X)
	CMP #$7E			 ; C9 7E | Compare accumulator (immediate)
	LDA $FEEB,X		  ; BD EB FE | Load from absolute,X into accumulator
	STA $7E			  ; 85 7E | Store accumulator to zero page
	STA $E7FE,X		  ; 9D FE E7 | Store accumulator to absolute,X
	PHY				  ; 5A | Push Y register to stack
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	EOR ($E9,X)		  ; 41 E9 | Exclusive OR with accumulator ((zero page,X))
	ADC #$0E			 ; 69 0E | Add with carry (immediate)
	STX $8061			; 8E 61 80 | Store X register to absolute address
	TSX				  ; BA | Transfer stack pointer to X register
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	LDA				  ; BF 00 BE 00 | Load from absolute long,X into accumulator
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BMI $FF			  ; 30 FF | Branch if negative
	SEC				  ; 38 | Set carry flag
	REP #$FF			 ; C2 FF | Reset processor status bits
	BPL $FF			  ; 10 FF | Branch if positive
	ROL				  ; 2A | Rotate left (accumulator)
	BRA $FF			  ; 80 FF | Branch always
	PLP				  ; 28 | Pull processor status from stack
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	JMP ($ECEE)		  ; 6C EE EC | Jump to address (absolute indirect)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_001
; Address: $E58086
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_001:
	ORA $3F3F			; 0D 3F 3F | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F BF 1D 00 | Store accumulator to absolute long,X
	JMP ($EC93)		  ; 6C 93 EC | Jump to address (absolute indirect)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_002
; Address: $E58095
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_002:
	STA				  ; 9F 3F C0 3F | Store accumulator to absolute long,X
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	LDA				  ; BF 40 00 FF | Load from absolute long,X into accumulator
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	LDY $BD9D,X		  ; BC 9D BD | Load from absolute,X into Y register
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDY $BD43,X		  ; BC 43 BD | Load from absolute,X into Y register
	WDM #$3F			 ; 42 3F | Reserved instruction
	CPY #$98			 ; C0 98 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_003
; Address: $E580C8
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_003:
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	PLY				  ; 7A | Pull Y register from stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BVS $60			  ; 70 60 | Branch if overflow set
	BEQ $CF			  ; F0 CF | Branch if equal
	CPY $60CC			; CC CC 60 | Compare Y register (absolute)
	STA				  ; 9F 63 9C 43 | Store accumulator to absolute long,X
	LDY $0FF0,X		  ; BC F0 0F | Load from absolute,X into Y register
	BEQ $EF			  ; F0 EF | Branch if equal
	BPL $0C			  ; 10 0C | Branch if positive
	CPY $1B33			; CC 33 1B | Compare Y register (absolute)
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	AND $39F9,Y		  ; 39 F9 39 | Logical AND with accumulator (absolute,Y)
	SBC $F0F4,Y		  ; F9 F4 F0 | Subtract with carry (absolute,Y)
	INC $3BFE,X		  ; FE FE 3B | Increment (absolute,X)
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	INC $CE01,X		  ; FE 01 CE | Increment (absolute,X)
	JMP $CCEC			; 4C EC CC | Jump to address
	LSR $257F			; 4E 7F 25 | Logical shift right (absolute)
	AND $3A			  ; 25 3A | Logical AND with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	JMP $CCB3			; 4C B3 CC | Jump to address
	LDY $807F,X		  ; BC 7F 80 | Load from absolute,X into Y register
	AND $DA			  ; 25 DA | Logical AND with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	CMP $3F			  ; C5 3F | Compare accumulator (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP $F9FF,X		  ; DD FF F9 | Compare accumulator (absolute,X)
	SBC $0276,Y		  ; F9 76 02 | Subtract with carry (absolute,Y)
	LDY $BCBC,X		  ; BC BC BC | Load from absolute,X into Y register
	SBC $0206,Y		  ; F9 06 02 | Subtract with carry (absolute,Y)
	SBC $7C83,X		  ; FD 83 7C | Subtract with carry (absolute,X)
	LDY $BC43,X		  ; BC 43 BC | Load from absolute,X into Y register
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_004
; Address: $E58183
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_004:
	BRA $5F			  ; 80 5F | Branch always
	LDY #$0A			 ; A0 0A | Load immediate value into Y register
	XBA				  ; EB | Exchange accumulator bytes
	EOR #$99			 ; 49 99 | Exclusive OR with accumulator (immediate)
	JMP $B949B8		  ; 5C B8 49 B9 | Jump to address long
	ORA $B5			  ; 05 B5 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	PEA #$E619		   ; F4 19 E6 | Push effective address to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_005
; Address: $E5819C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_005:
	ORA $15E6,Y		  ; 19 E6 15 | Logical OR with accumulator (absolute,Y)
	NOP				  ; EA | No operation
	ORA $1DE3,X		  ; 1D E3 1D | Logical OR with accumulator (absolute,X)
	STX $4B15			; 8E 15 4B | Store X register to absolute address
	ORA ($4B),Y		  ; 11 4B | Logical OR with accumulator ((zero page),Y)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	EOR ($0F),Y		  ; 51 0F | Exclusive OR with accumulator ((zero page),Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_006
; Address: $E581C2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_006:
	SBC $06E1,Y		  ; F9 E1 06 | Subtract with carry (absolute,Y)
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $E0			  ; F0 E0 | Game work RAM access
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_007
; Address: $E581D1
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_007:
	STA				  ; 9F E1 1E 00 | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	LSR $F940,X		  ; 5E 40 F9 | Logical shift right (absolute,X)
	SBC ($BB,X)		  ; E1 BB | Subtract with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $733E,X		  ; 3E 3E 73 | Rotate left (absolute,X)
	STY $0CF3			; 8C F3 0C | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF E1 1E E3 | Load from absolute long,X into accumulator
	ROL $27C1,X		  ; 3E C1 27 | Rotate left (absolute,X)
	ADC ($91,X)		  ; 61 91 | Add with carry ((zero page,X))
	ROR $D19E			; 6E 9E D1 | Rotate right (absolute)
	STA				  ; 9F 6F A0 7F | Store accumulator to absolute long,X
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	BIT $9B			  ; 24 9B | Test bits in accumulator (zero page)
	INX				  ; E8 | Increment X register
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	ASL $1FE1,X		  ; 1E E1 1F | Arithmetic shift left (absolute,X)
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_008
; Address: $E5821A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_008:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	TXA				  ; 8A | Transfer X register to accumulator
	STA $F6F752		  ; 8F 52 F7 F6 | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	JMP $6303			; 4C 03 63 | Jump to address
	STA $0FF0,X		  ; 9D F0 0F | Store accumulator to absolute,X
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEP #$E0			 ; E2 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_009
; Address: $E58246
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_009:
	REP #$38			 ; C2 38 | Reset processor status bits
	STZ $22			  ; 64 22 | Store zero to zero page
	ORA #$3C			 ; 09 3C | Logical OR with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	SBC $7576			; ED 76 75 | Subtract with carry (absolute)
	SED				  ; F8 | Set decimal mode flag
	ASL $60			  ; 06 60 | Arithmetic shift left (zero page)
	STZ $1EE0,X		  ; 9E E0 1E | Store zero to absolute,X
	SEC				  ; 38 | Set carry flag
	DEC $20			  ; C6 20 | Decrement (zero page)
	DEC $C33C,X		  ; DE 3C C3 | Decrement (absolute,X)
	CPX $7413			; EC 13 74 | Compare X register (absolute)
	PHB				  ; 8B | Push data bank register to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_00A
; Address: $E58281
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_00A:
	CPX #$7E			 ; E0 7E | Compare X register (immediate)
	INC $805F,X		  ; FE 5F 80 | Increment (absolute,X)
	BVC $90			  ; 50 90 | Branch if overflow clear
	STZ $806D			; 9C 6D 80 | Store zero to absolute
	BRA $38			  ; 80 38 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_00B
; Address: $E58291
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_00B:
	STA				  ; 9F 7E 81 00 | Store accumulator to absolute long,X
	BPL $EF			  ; 10 EF | Branch if positive
	STA $ED81			; 8D 81 ED | Store accumulator to absolute address
	SBC ($7D),Y		  ; F1 7D | Subtract with carry ((zero page),Y)
	ORA ($3D,X)		  ; 01 3D | Logical OR with accumulator ((zero page,X))
	AND $C1BF,X		  ; 3D BF C1 | Logical AND with accumulator (absolute,X)
	STA $E573			; 8D 73 E5 | Store accumulator to absolute address
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	BRA $7F			  ; 80 7F | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $FF			  ; 80 FF | Branch always
	STA ($5A,X)		  ; 81 5A | Store accumulator to (zero page,X)
	LDX $A577,Y		  ; BE 77 A5 | Load from absolute,Y into X register
	ROL				  ; 2A | Rotate left (accumulator)
	LDX $BD57			; AE 57 BD | Load from absolute address into X register
	ROR $55AB,X		  ; 7E AB 55 | Rotate right (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	INC $F701,X		  ; FE 01 F7 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	LDX $FF51			; AE 51 FF | Load from absolute address into X register
	PLP				  ; 28 | Pull processor status from stack
	BCS $52			  ; B0 52 | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_00C
; Address: $E5830A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_00C:
	ROR				  ; 6A | Rotate right (accumulator)
	INC				  ; 1A | Increment accumulator
	LDA				  ; BF 32 52 12 | Load from absolute long,X into accumulator
	SBC $ED12			; ED 12 ED | Subtract with carry (absolute)
	SBC #$1F			 ; E9 1F | Subtract with carry (immediate)
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	INC				  ; 1A | Increment accumulator
	SBC $9F			  ; E5 9F | Subtract with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_00D
; Address: $E5831F
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_00D:
	SBC $F8B6			; ED B6 F8 | Subtract with carry (absolute)
	JMP $734A			; 4C 4A 73 | Jump to address
	SEI				  ; 78 | Set interrupt disable flag
	STX $FC			  ; 86 FC | Store X register to zero page
	PLX				  ; FA | Pull X register from stack
	SBC $999A,Y		  ; F9 9A 99 | Subtract with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC $F8D6,Y		  ; F9 D6 F8 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STZ $18BD,X		  ; 9E BD 18 | Store zero to absolute,X
	STZ $9483			; 9C 83 94 | Store zero to absolute
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	SEC				  ; 38 | Set carry flag
	TSX				  ; BA | Transfer stack pointer to X register
	AND $4742,Y		  ; 39 42 47 | Logical AND with accumulator (absolute,Y)
	LDY $0043,X		  ; BC 43 00 | Load from absolute,X into Y register
	BRA $7F			  ; 80 7F | Branch always
	BRA $7E			  ; 80 7E | Branch always
	SEC				  ; 38 | Set carry flag
	DEC $38			  ; C6 38 | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 64 9F 09 | Load from absolute long,X into accumulator
	LDY $5F			  ; A4 5F | Load from zero page into Y register
	CLC				  ; 18 | Clear carry flag
	BRA $08			  ; 80 08 | Branch always
	LDA $6D9050		  ; AF 50 90 6D | Load from absolute long address into accumulator
	STA				  ; 9F FF 6F FF | Store accumulator to absolute long,X
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BRA $7F			  ; 80 7F | Branch always
	STA				  ; 9F D9 66 C6 | Store accumulator to absolute long,X
	BIT #$2E			 ; 89 2E | Test bits in accumulator (immediate)
	CMP $9600,X		  ; DD 00 96 | Compare accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_00E
; Address: $E58390
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_00E:
	STA				  ; 9F FF 6F FF | Store accumulator to absolute long,X
	ROL $FFD7			; 2E D7 FF | Rotate left (absolute)
	LDY $9F6F,X		  ; BC 6F 9F | Load from absolute,X into Y register
	CMP #$66			 ; C9 66 | Compare accumulator (immediate)
	ADC ($66,X)		  ; 61 66 | Add with carry ((zero page,X))
	ADC $6BFF,Y		  ; 79 FF 6B | Add with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F FF 6F FF | Store accumulator to absolute long,X
	ROR $9F			  ; 66 9F | Rotate right (zero page)
	PHP				  ; 08 | Push processor status to stack
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND $732A,X		  ; 3D 2A 73 | Logical AND with accumulator (absolute,X)
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_00F
; Address: $E583DF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_00F:
	ROL $FF00,X		  ; 3E 00 FF | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	TAY				  ; A8 | Transfer accumulator to Y register
	PHP				  ; 08 | Push processor status to stack
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	PLY				  ; 7A | Pull Y register from stack
	REP #$FF			 ; C2 FF | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	JMP $C2BC			; 4C BC C2 | Jump to address
	LDX #$72			 ; A2 72 | Load immediate value into X register
	ROL				  ; 2A | Rotate left (accumulator)
	WDM #$B3			 ; 42 B3 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_010
; Address: $E58438
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_010:
	JSL $CD32DD		  ; 22 DD 32 CD | Jump to subroutine long
	SBC $6C93,X		  ; FD 93 6C | Subtract with carry (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $6F4A			; 4C 4A 6F | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	DEC $14F8			; CE F8 14 | Decrement (absolute)
	INC				  ; 1A | Increment accumulator
	PHY				  ; 5A | Push Y register to stack
	EOR $484A			; 4D 4A 48 | Exclusive OR with accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_011
; Address: $E58464
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_011:
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP ($BA0A)		  ; 6C 0A BA | Jump to address (absolute indirect)
	LDA $01B2,Y		  ; B9 B2 01 | Load from absolute,Y into accumulator
	BCC $2F			  ; 90 2F | Branch if carry clear
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BEQ $0F			  ; F0 0F | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	INC $00F6,X		  ; FE F6 00 | Increment (absolute,X)
	STA $F78D			; 8D 8D F7 | Store accumulator to absolute address
	BPL $7C			  ; 10 7C | Branch if positive
	INC $18			  ; E6 18 | Increment (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	STA $FF72			; 8D 72 FF | Store accumulator to absolute address
	LDA				  ; BF 40 35 35 | Load from absolute long,X into accumulator
	DEC $6DFF			; CE FF 6D | Decrement (absolute)
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_012
; Address: $E584B3
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_012:
	DEX				  ; CA | Decrement X register
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR $7A22,X		  ; 7E 22 7A | Rotate right (absolute,X)
	SBC $7D33,Y		  ; F9 33 7D | Subtract with carry (absolute,Y)
	ASL $CD			  ; 06 CD | Arithmetic shift left (zero page)
	BPL $48			  ; 10 48 | Branch if positive
	STA ($58,X)		  ; 81 58 | Store accumulator to (zero page,X)
	STY $59			  ; 84 59 | Store Y register to zero page
	AND $3F80,X		  ; 3D 80 3F | Logical AND with accumulator (absolute,X)
	STA				  ; 9F 00 06 00 | Store accumulator to absolute long,X
	BPL $77			  ; 10 77 | Branch if positive
	ORA $ED			  ; 05 ED | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	SEP #$F5			 ; E2 F5 | Set processor status bits
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	ASL $0034,X		  ; 1E 34 00 | Arithmetic shift left (absolute,X)
	DEY				  ; 88 | Decrement Y register
	ROL $10			  ; 26 10 | Rotate left (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $0200			; 0D 00 02 | Logical OR with accumulator (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	STA $F0ED80		  ; 8F 80 ED F0 | Store accumulator to absolute long address
	ORA ($3D,X)		  ; 01 3D | Logical OR with accumulator ((zero page,X))
	AND $C2BE,X		  ; 3D BE C2 | Logical AND with accumulator (absolute,X)
	STA $79			  ; 85 79 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_013
; Address: $E5852C
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_013:
	SEP #$7B			 ; E2 7B | Set processor status bits
	LDA ($42,X)		  ; A1 42 | Hardware register operation
	BRA $7F			  ; 80 7F | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	AND $82C2,X		  ; 3D C2 82 | Logical AND with accumulator (absolute,X)
	ADC $FF00,X		  ; 7D 00 FF | Add with carry (absolute,X)
	LDA $3D30			; AD 30 3D | Load from absolute address into accumulator
	BRA $BD			  ; 80 BD | Branch always
	STZ $615E			; 9C 5E 61 | Store zero to absolute
	STA $64B3			; 8D B3 64 | Store accumulator to absolute address
	RTI				  ; 40 | Return from interrupt
	BMI $CF			  ; 30 CF | Branch if negative
	STZ $4063			; 9C 63 40 | Store zero to absolute
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	ORA $2EFD			; 0D FD 2E | Logical OR with accumulator (absolute)
	STZ $9FD1,X		  ; 9E D1 9F | Store zero to absolute,X
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	LDY $1B			  ; A4 1B | Load from zero page into Y register
	BMI $1D			  ; 30 1D | Branch if negative
	SEP #$1E			 ; E2 1E | Set processor status bits
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_014
; Address: $E5857A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_014:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	BEQ $48			  ; F0 48 | Branch if equal
	PHB				  ; 8B | Push data bank register to stack
	STX $F752			; 8E 52 F7 | Store X register to absolute address
	SBC $4D02,Y		  ; F9 02 4D | Subtract with carry (absolute,Y)
	STZ $0CF0			; 9C F0 0C | Store zero to absolute
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	BEQ $0F			  ; F0 0F | Branch if equal
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	TXS				  ; 9A | Transfer X register to stack pointer
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_015
; Address: $E585B5
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_015:
	XBA				  ; EB | Exchange accumulator bytes
	CPX #$12			 ; E0 12 | Compare X register (immediate)
	SBC $E51A			; ED 1A E5 | Subtract with carry (absolute)
	SBC $EC13,X		  ; FD 13 EC | Subtract with carry (absolute,X)
	BPL $2C			  ; 10 2C | Branch if positive
	ROL				  ; 2A | Rotate left (accumulator)
	AND $722A			; 2D 2A 72 | Logical AND with accumulator (absolute)
	SBC $393A,Y		  ; F9 3A 39 | Subtract with carry (absolute,Y)
	AND $0214,Y		  ; 39 14 02 | Logical AND with accumulator (absolute,Y)
	CMP $10CA			; CD CA 10 | Compare accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_016
; Address: $E585D4
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_016:
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	CPY $82			  ; C4 82 | Compare Y register (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BCS $06			  ; B0 06 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	DEC $22			  ; C6 22 | Decrement (zero page)
	CMP ($9A,X)		  ; C1 9A | Compare accumulator ((zero page,X))
	LDA ($5A,X)		  ; A1 5A | Load from (zero page,X) into accumulator
	ADC ($A2,X)		  ; 61 A2 | Add with carry ((zero page,X))
	BRA $7E			  ; 80 7E | Branch always
	PHP				  ; 08 | Push processor status to stack
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF B3 | Load from absolute long,X into accumulator
	LDX $CF00,Y		  ; BE 00 CF | Load from absolute,Y into X register
	STX $33EE			; 8E EE 33 | Store X register to absolute address
	CMP $9600,X		  ; DD 00 96 | Compare accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $FF11			; EE 11 FF | Increment (absolute)
	LDY $FFCF,X		  ; BC CF FF | Load from absolute,X into Y register
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	ADC $6BFF,Y		  ; 79 FF 6B | Add with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	SBC $6060,X		  ; FD 60 60 | Subtract with carry (absolute,X)
	ROR $DF7E,X		  ; 7E 7E DF | Rotate right (absolute,X)
	BNE $10			  ; D0 10 | Branch if not equal
	LDY $ED9C,X		  ; BC 9C ED | Load from absolute,X into Y register
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_017
; Address: $E58651
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_017:
	STA				  ; 9F 7E 81 00 | Store accumulator to absolute long,X
	BPL $EF			  ; 10 EF | Branch if positive
	STZ $0063			; 9C 63 00 | Store zero to absolute
	BRA $7F			  ; 80 7F | Branch always
	STX $ED80			; 8E 80 ED | Store X register to absolute address
	SBC ($7C),Y		  ; F1 7C | Subtract with carry ((zero page),Y)
	AND $BF3D,X		  ; 3D 3D BF | Logical AND with accumulator (absolute,X)
	CMP ($8D,X)		  ; C1 8D | Compare accumulator ((zero page,X))
	CPX $7A			  ; E4 7A | Compare X register (zero page)
	LDX #$40			 ; A2 40 | Load immediate value into X register
	BRA $7F			  ; 80 7F | Branch always
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_018
; Address: $E58676
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_018:
	AND $81C2,X		  ; 3D C2 81 | Logical AND with accumulator (absolute,X)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	BIT $B05D			; 2C 5D B0 | Test bits in accumulator (absolute)
	BNE $53			  ; D0 53 | Branch if not equal
	BMI $35			  ; 30 35 | Branch if negative
	BVC $1D			  ; 50 1D | Branch if overflow clear
	ASL $0562,X		  ; 1E 62 05 | Arithmetic shift left (absolute,X)
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	REP #$1D			 ; C2 1D | Reset processor status bits
	SEP #$90			 ; E2 90 | Set processor status bits
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	SBC $BA35,X		  ; FD 35 BA | Subtract with carry (absolute,X)
	ORA $CB0A			; 0D 0A CB | Logical OR with accumulator (absolute)
	LDA $B90A			; AD 0A B9 | Load from absolute address into accumulator
	INC $4671,X		  ; FE 71 46 | Increment (absolute,X)
	LDA ($06),Y		  ; B1 06 | Load from (zero page),Y into accumulator
	ADC $B846,Y		  ; 79 46 B8 | Add with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 40 | Load from absolute long,X into accumulator
	LDA				  ; BF 18 27 09 | Load from absolute long,X into accumulator
	ADC ($7C,X)		  ; 61 7C | Add with carry ((zero page,X))
	INC $2312,X		  ; FE 12 23 | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF C2 3D 02 | Load from absolute long,X into accumulator
	SBC $01FE,X		  ; FD FE 01 | Subtract with carry (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_019
; Address: $E586DF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_019:
	STA				  ; 9F 00 7F 3A | Store accumulator to absolute long,X
	EOR $3B			  ; 45 3B | Exclusive OR with accumulator (zero page)
	CPX #$65			 ; E0 65 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	EOR $5550			; 4D 50 55 | Exclusive OR with accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $591C			; 6D 1C 59 | Add with carry (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_01A
; Address: $E586F7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_01A:
	STA				  ; 9F 48 B7 50 | Store accumulator to absolute long,X
	LDA $589768		  ; AF 68 97 58 | Load from absolute long address into accumulator
	ADC $A76C			; 6D 6C A7 | Add with carry (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	STA ($67),Y		  ; 91 67 | Store accumulator to (zero page),Y
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_01B
; Address: $E5870E
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_01B:
	DEX				  ; CA | Decrement X register
	JMP ($0093)		  ; 6C 93 00 | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $1303			; 0E 03 13 | Arithmetic shift left (absolute)
	AND $160B,X		  ; 3D 0B 16 | Logical AND with accumulator (absolute,X)
	LSR $8E0E,X		  ; 5E 0E 8E | Logical shift right (absolute,X)
	LSR $7EEE,X		  ; 5E EE 7E | Logical shift right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BMI $4F			  ; 30 4F | Branch if negative
	BMI $4F			  ; 30 4F | Branch if negative
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 60 9F 59 | Load from absolute long,X into accumulator
	LDX #$1B			 ; A2 1B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_01C
; Address: $E58763
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_01C:
	JSR $00BF			; 20 BF 00 | Jump to subroutine
	BCS $30			  ; B0 30 | Branch if carry set
	PHX				  ; DA | Push X register to stack
	CMP $A000			; CD 00 A0 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_020
; Address: $E58789
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_020:
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_021
; Address: $E58790
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_021:
	JSL $FF00DD		  ; 22 DD 00 FF | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND $5EB2,Y		  ; 39 B2 5E | Logical AND with accumulator (absolute,Y)
	LDA				  ; BF AF 7E 1D | Load from absolute long,X into accumulator
	DEC $5ECF,X		  ; DE CF 5E | Decrement (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $B2CD,X		  ; 1E CD B2 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_023
; Address: $E587D5
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_023:
	STA				  ; 9F 00 FF 40 | Store accumulator to absolute long,X
	LDA				  ; BF 40 BF 00 | Load from absolute long,X into accumulator
	BRA $7F			  ; 80 7F | Branch always
	CLC				  ; 18 | Clear carry flag
	STY $FF10			; 8C 10 FF | Store Y register to absolute address
	EOR $7040			; 4D 40 70 | Exclusive OR with accumulator (absolute)
	STY $807F			; 8C 7F 80 | Store Y register to absolute address
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_024
; Address: $E58800
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_024:
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	LDA ($1E,X)		  ; A1 1E | Load from (zero page,X) into accumulator
	ASL $DC10			; 0E 10 DC | Arithmetic shift left (absolute)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	JMP ($0C69)		  ; 6C 69 0C | Jump to address (absolute indirect)
	EOR #$44			 ; 49 44 | Exclusive OR with accumulator (immediate)
	EOR ($84,X)		  ; 41 84 | Exclusive OR with accumulator ((zero page,X))
	EOR ($B8,X)		  ; 41 B8 | Exclusive OR with accumulator ((zero page,X))
	ADC $7C63,X		  ; 7D 63 7C | Add with carry (absolute,X)
	ADC $7F00,X		  ; 7D 00 7F | Add with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 40 BF 78 | Load from absolute long,X into accumulator
	CPY $DD			  ; C4 DD | Compare Y register (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	REP #$00			 ; C2 00 | Reset processor status bits
	CMP $0022,X		  ; DD 22 00 | Compare accumulator (absolute,X)
	JMP $004C			; 4C 4C 00 | Jump to address
	BMI $CF			  ; 30 CF | Branch if negative
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	REP #$3D			 ; C2 3D | Reset processor status bits
	JMP $00B3			; 4C B3 00 | Jump to address
	BMI $30			  ; 30 30 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	STX $86			  ; 86 86 | Store X register to zero page
	BMI $CF			  ; 30 CF | Branch if negative
	BMI $CF			  ; 30 CF | Branch if negative
	STX $79			  ; 86 79 | Store X register to zero page
	STA ($C9),Y		  ; 91 C9 | Store accumulator to (zero page),Y
	EOR $9B4B,Y		  ; 59 4B 9B | Exclusive OR with accumulator (absolute,Y)
	EOR $729F			; 4D 9F 72 | Exclusive OR with accumulator (absolute)
	STA				  ; 9F 0F 90 1D | Store accumulator to absolute long,X
	LDX #$D2			 ; A2 D2 | Load immediate value into X register
	ADC $EE11			; 6D 11 EE | Add with carry (absolute)
	EOR $1BA6,Y		  ; 59 A6 1B | Exclusive OR with accumulator (absolute,Y)
	CPX $1F			  ; E4 1F | Compare X register (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 1E 65 2F | Load from absolute long,X into accumulator
	ASL $2E61,X		  ; 1E 61 2E | Arithmetic shift left (absolute,X)
	EOR ($4D),Y		  ; 51 4D | Exclusive OR with accumulator ((zero page),Y)
	WDM #$71			 ; 42 71 | Reserved instruction
	ADC $73CC,X		  ; 7D CC 73 | Add with carry (absolute,X)
	WDM #$00			 ; 42 00 | Reserved instruction
	ORA $1B19,Y		  ; 19 19 1B | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_025
; Address: $E588E7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_025:
	CPX $98			  ; E4 98 | Compare X register (zero page)
	LDA				  ; BF 24 FF E7 | Load from absolute long,X into accumulator
	ORA $00E6,Y		  ; 19 E6 00 | Logical OR with accumulator (absolute,Y)
	BPL $EF			  ; 10 EF | Branch if positive
	DEX				  ; CA | Decrement X register
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_026
; Address: $E58908
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_026:
	JSR $9ADF			; 20 DF 9A | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	PHY				  ; 5A | Push Y register to stack
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	BRA $FF			  ; 80 FF | Branch always
	LSR				  ; 4A | Logical shift right (accumulator)
	BRA $71			  ; 80 71 | Branch always
	LDA ($0A),Y		  ; B1 0A | Load from (zero page),Y into accumulator
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	INC $FF			  ; E6 FF | Increment (zero page)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_027
; Address: $E58943
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_027:
	BRA $5F			  ; 80 5F | Branch always
	LDY #$0A			 ; A0 0A | Load immediate value into Y register
	XBA				  ; EB | Exchange accumulator bytes
	ORA $7499,Y		  ; 19 99 74 | Logical OR with accumulator (absolute,Y)
	BCC $4B			  ; 90 4B | Branch if carry clear
	STA $9555,Y		  ; 99 55 95 | Store accumulator to absolute,Y
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	PEA #$E619		   ; F4 19 E6 | Push effective address to stack
	BPL $EF			  ; 10 EF | Branch if positive
	ORA $15E6,Y		  ; 19 E6 15 | Logical OR with accumulator (absolute,Y)
	NOP				  ; EA | No operation
	ORA $1DE3,X		  ; 1D E3 1D | Logical OR with accumulator (absolute,X)
	STX $4B15			; 8E 15 4B | Store X register to absolute address
	ORA ($4B),Y		  ; 11 4B | Logical OR with accumulator ((zero page),Y)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	EOR ($0F),Y		  ; 51 0F | Exclusive OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	PHY				  ; 5A | Push Y register to stack
	LDA				  ; BF 7F B6 7E | Load from absolute long,X into accumulator
	CMP $A67F,Y		  ; D9 7F A6 | Compare accumulator (absolute,Y)
	ROL $5FD0,X		  ; 3E D0 5F | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_028
; Address: $E58992
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_028:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_029
; Address: $E5899E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_029:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BMI $E0			  ; 30 E0 | Game work RAM access
	CPY $FAF8			; CC F8 FA | Compare Y register (absolute)
	PLY				  ; 7A | Pull Y register from stack
	SBC $E9A2,X		  ; FD A2 E9 | Subtract with carry (absolute,X)
	LSR $10F1,X		  ; 5E F1 10 | Logical shift right (absolute,X)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_02A
; Address: $E589C8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_02A:
	JSR $2A1F			; 20 1F 2A | Jump to subroutine
	BPL $3F			  ; 10 3F | Branch if positive
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_02B
; Address: $E589D9
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_02B:
	JSR $2F10			; 20 10 2F | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	AND $00F8			; 2D F8 00 | Logical AND with accumulator (absolute)
	BIT $2C28			; 2C 28 2C | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CPY $4CC8			; CC C8 4C | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	CPY $4C58			; CC 58 4C | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PEA #$34C8		   ; F4 C8 34 | Push effective address to stack
	PHA				  ; 48 | Push accumulator to stack
	BMI $DF			  ; 30 DF | Branch if negative
	PHY				  ; 5A | Push Y register to stack
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	STZ $4F73			; 9C 73 4F | Store zero to absolute
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	JMP $DC67FF		  ; 5C FF 67 DC | Jump to address long
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	CMP $DD7F,X		  ; DD 7F DD | Compare accumulator (absolute,X)
	LDA				  ; BF 58 FF 00 | Load from absolute long,X into accumulator
	STZ $FF			  ; 64 FF | Store zero to zero page
	BPL $FF			  ; 10 FF | Branch if positive
	DEC $56FF			; CE FF 56 | Decrement (absolute)
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	ORA $B7FF,X		  ; 1D FF B7 | Logical OR with accumulator (absolute,X)
	LDY $CE3C,X		  ; BC 3C CE | Load from absolute,X into Y register
	LSR $30B2			; 4E B2 30 | Logical shift right (absolute)
	PLX				  ; FA | Pull X register from stack
	DEC				  ; 3A | Decrement accumulator
	JMP ($250C)		  ; 6C 0C 25 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_02C
; Address: $E58A4D
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_02C:
	BPL $0B			  ; 10 0B | Branch if positive
	INY				  ; C8 | Increment Y register
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	INC $EFC1,X		  ; FE C1 EF | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $56			  ; 05 56 | Logical OR with accumulator (zero page)
	AND ($0E,X)		  ; 21 0E | Logical AND with accumulator ((zero page,X))
	ORA ($BC,X)		  ; 01 BC | Logical OR with accumulator ((zero page,X))
	BVS $0C			  ; 70 0C | Branch if overflow set
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	PHX				  ; DA | Push X register to stack
	BMI $F8			  ; 30 F8 | Branch if negative
	BVC $B7			  ; 50 B7 | Branch if overflow clear
	EOR ($EA),Y		  ; 51 EA | Exclusive OR with accumulator ((zero page),Y)
	SBC $16			  ; E5 16 | Subtract with carry (zero page)
	AND #$16			 ; 29 16 | Logical AND with accumulator (immediate)
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BVC $AF			  ; 50 AF | Branch if overflow clear
	SBC $AE51			; ED 51 AE | Subtract with carry (absolute)
	SBC $1AE5,X		  ; FD E5 1A | Subtract with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6C6C)		  ; 6C 6C 6C | Jump to address (absolute indirect)
	LSR $1D0F,X		  ; 5E 0F 1D | Logical shift right (absolute,X)
	ASL $4EFD			; 0E FD 4E | Arithmetic shift left (absolute)
	LDA ($86,X)		  ; A1 86 | Load from (zero page,X) into accumulator
	RTI				  ; 40 | Return from interrupt
	INC $68AB,X		  ; FE AB 68 | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF AB 54 42 | Load from absolute long,X into accumulator
	LDA				  ; BF 36 FF 7F | Load from absolute long,X into accumulator
	INC $FF16,X		  ; FE 16 FF | Increment (absolute,X)
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	ROL $6AFF,X		  ; 3E FF 6A | Rotate left (absolute,X)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	LDA $BDFF,Y		  ; B9 FF BD | Load from absolute,Y into accumulator
	LDA $B3FF,Y		  ; B9 FF B3 | Load from absolute,Y into accumulator
	SBC $FFBD,X		  ; FD BD FF | Subtract with carry (absolute,X)
	EOR #$BF			 ; 49 BF | Exclusive OR with accumulator (immediate)
	CMP $7FDF			; CD DF 7F | Compare accumulator (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	LDA $B9FF			; AD FF B9 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_02D
; Address: $E58AF6
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_02D:
	LDA ($FF),Y		  ; B1 FF | Load from (zero page),Y into accumulator
	LDY $08FF,X		  ; BC FF 08 | Load from absolute,X into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	LDX $0CF2,Y		  ; BE F2 0C | Load from absolute,Y into X register
	ROL $DC			  ; 26 DC | Rotate left (zero page)
	SED				  ; F8 | Set decimal mode flag
	LDY $DE7C,X		  ; BC 7C DE | Load from absolute,X into Y register
	ORA $2EF8,X		  ; 1D F8 2E | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ORA $F8			  ; 05 F8 | Logical OR with accumulator (zero page)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $88			  ; 64 88 | Store zero to zero page
	ROR $8231,X		  ; 7E 31 82 | Rotate right (absolute,X)
	BCS $C9			  ; B0 C9 | Branch if carry set
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 08 F7 7E | Load from absolute long,X into accumulator
	STA ($82,X)		  ; 81 82 | Store accumulator to (zero page,X)
	ADC $7E81,X		  ; 7D 81 7E | Add with carry (absolute,X)
	STA $85DD,X		  ; 9D DD 85 | Store accumulator to absolute,X
	AND $263D,X		  ; 3D 3D 26 | Logical AND with accumulator (absolute,X)
	SBC #$E9			 ; E9 E9 | Subtract with carry (immediate)
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	STY $728C			; 8C 8C 72 | Store Y register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_02E
; Address: $E58B56
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_02E:
	AND $D6FF,X		  ; 3D FF D6 | Logical AND with accumulator (absolute,X)
	STA				  ; 9F FF 73 FF | Store accumulator to absolute long,X
	BEQ $FB			  ; F0 FB | Branch if equal
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	ASL $64FF			; 0E FF 64 | Arithmetic shift left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_032
; Address: $E58B98
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_032:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPX $6C6E			; EC 6E 6C | Compare X register (absolute)
	SEP #$20			 ; E2 20 | Set processor status bits
	EOR $1F3F			; 4D 3F 1F | Exclusive OR with accumulator (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_034
; Address: $E58BB4
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_034:
	JSR $3FDF			; 20 DF 3F | Jump to subroutine
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	ROL $97FC			; 2E FC 97 | Rotate left (absolute)
	INC $F68B,X		  ; FE 8B F6 | Increment (absolute,X)
	DEC $FC			  ; C6 FC | Decrement (zero page)
	LDX $3F7C			; AE 7C 3F | Load from absolute address into X register
	DEC $ECD6			; CE D6 EC | Decrement (absolute)
	INC $FC03,X		  ; FE 03 FC | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	BIT #$19			 ; 89 19 | Test bits in accumulator (immediate)
	CMP $32			  ; C5 32 | Compare accumulator (zero page)
	LDX $5D59			; AE 59 5D | Load from absolute address into X register
	ADC ($3F,X)		  ; 61 3F | Add with carry ((zero page,X))
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	TXA				  ; 8A | Transfer X register to accumulator
	TAX				  ; AA | Transfer accumulator to X register
	RTI				  ; 40 | Return from interrupt
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	ROL $D9			  ; 26 D9 | Rotate left (zero page)
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_035
; Address: $E58C03
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_035:
	XBA				  ; EB | Exchange accumulator bytes
	STZ $1DBF,X		  ; 9E BF 1D | Store zero to absolute,X
	CMP $DD8C,X		  ; DD 8C DD | Compare accumulator (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP $DDCD,X		  ; DD CD DD | Compare accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $E2FF,X		  ; 5E FF E2 | Logical shift right (absolute,X)
	ROR $7AFF			; 6E FF 7A | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_036
; Address: $E58C1E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_036:
	JSL $7777FF		  ; 22 FF 77 77 | Jump to subroutine long
	LDX $B6FE,Y		  ; BE FE B6 | Load from absolute,Y into X register
	INC $7373,X		  ; FE 73 73 | Increment (absolute,X)
	DEX				  ; CA | Decrement X register
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	STA $EAFF			; 8D FF EA | Store accumulator to absolute address
	ROL $04FF			; 2E FF 04 | Rotate left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_039
; Address: $E58C47
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_039:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $60			  ; 80 60 | Branch always
	STA				  ; 9F 60 98 40 | Store accumulator to absolute long,X
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $F3			  ; 80 F3 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	STA $13EF13		  ; 8F 13 EF 13 | Store accumulator to absolute long address
	ROL $F100,X		  ; 3E 00 F1 | Rotate left (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	LDA $80B9,Y		  ; B9 B9 80 | Load from absolute,Y into accumulator
	CPY $ECBB			; CC BB EC | Compare Y register (absolute)
	SBC $DD9B,X		  ; FD 9B DD | Subtract with carry (absolute,X)
	CMP $00BB,X		  ; DD BB 00 | Compare accumulator (absolute,X)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	DEC $91CE			; CE CE 91 | Decrement (absolute)
	DEC $DCB9			; CE B9 DC | Decrement (absolute)
	CMP $EFBB,X		  ; DD BB EF | Compare accumulator (absolute,X)
	INC $0099			; EE 99 00 | Increment (absolute)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL $19A9,X		  ; 3E A9 19 | Rotate left (absolute,X)
	STA				  ; 9F 72 9F 0F | Store accumulator to absolute long,X
	BCC $1D			  ; 90 1D | Branch if carry clear
	LDX #$D2			 ; A2 D2 | Load immediate value into X register
	ADC $E11E			; 6D 1E E1 | Add with carry (absolute)
	ORA $1BE6,Y		  ; 19 E6 1B | Logical OR with accumulator (absolute,Y)
	CPX $1F			  ; E4 1F | Compare X register (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF B7 97 49 | Load from absolute long,X into accumulator
	CMP $4AD3			; CD D3 4A | Compare accumulator (absolute)
	CMP ($9D),Y		  ; D1 9D | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_03A
; Address: $E58D0B
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_03A:
	ORA ($52),Y		  ; 11 52 | Logical OR with accumulator ((zero page),Y)
	STA $53BC,X		  ; 9D BC 53 | Store accumulator to absolute,X
	STY $7B			  ; 84 7B | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF C0 3F C0 | Load from absolute long,X into accumulator
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STA $DDFB,X		  ; 9D FB DD | Store accumulator to absolute,X
	LDA $00B9,Y		  ; B9 B9 00 | Load from absolute,Y into accumulator
	CPY $A2			  ; C4 A2 | Compare Y register (zero page)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BPL $FF			  ; 10 FF | Branch if positive
	ORA $66FF,Y		  ; 19 FF 66 | Logical OR with accumulator (absolute,Y)
	ROR $CD			  ; 66 CD | Rotate right (zero page)
	SBC $FE9B			; ED 9B FE | Subtract with carry (absolute)
	ORA ($CE,X)		  ; 01 CE | Logical OR with accumulator ((zero page,X))
	DEC $B591			; CE 91 B5 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_03B
; Address: $E58D4D
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_03B:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	STY $FF			  ; 84 FF | Store Y register to zero page
	STA $67FF,Y		  ; 99 FF 67 | Store accumulator to absolute,Y
	INC $C700,X		  ; FE 00 C7 | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	JMP $9A4494		  ; 5C 94 44 9A | Jump to address long
	LSR $99			  ; 46 99 | Logical shift right (zero page)
	EOR $94			  ; 45 94 | Exclusive OR with accumulator (zero page)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	STA				  ; 9F 40 BF 44 | Store accumulator to absolute long,X
	LSR $B9			  ; 46 B9 | Logical shift right (zero page)
	EOR $BA			  ; 45 BA | Exclusive OR with accumulator (zero page)
	CLV				  ; B8 | Clear overflow flag
	BMI $0C			  ; 30 0C | Branch if negative
	INC $E2			  ; E6 E2 | Increment (zero page)
	JMP $3BC322		  ; 5C 22 C3 3B | Jump to address long
	BVS $4B			  ; 70 4B | Branch if overflow set
	ADC ($48),Y		  ; 71 48 | Add with carry ((zero page),Y)
	JMP $CCF7			; 4C F7 CC | Jump to address
	SEP #$1D			 ; E2 1D | Set processor status bits
	SBC $FC03,X		  ; FD 03 FC | Subtract with carry (absolute,X)
	LDY $BF40,X		  ; BC 40 BF | Load from absolute,X into Y register
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	STA $97C0BE		  ; 8F BE C0 97 | Store accumulator to absolute long address
	INX				  ; E8 | Increment X register
	CPX $94			  ; E4 94 | Compare X register (zero page)
	RTI				  ; 40 | Return from interrupt
	BMI $56			  ; 30 56 | Branch if negative
	ROL $52			  ; 26 52 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_03C
; Address: $E58DB2
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_03C:
	STA $7F8070		  ; 8F 70 80 7F | Store accumulator to absolute long address
	BRA $7F			  ; 80 7F | Branch always
	STY $7B			  ; 84 7B | Store Y register to zero page
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	STY $7045			; 8C 45 70 | Store Y register to absolute address
	ORA #$56			 ; 09 56 | Logical OR with accumulator (immediate)
	ADC #$45			 ; 69 45 | Add with carry (immediate)
	ADC #$51			 ; 69 51 | Add with carry (immediate)
	ADC #$F5			 ; 69 F5 | Add with carry (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 40 BF 40 | Load from absolute long,X into accumulator
	LDA				  ; BF C0 3F 6F | Load from absolute long,X into accumulator
	STA				  ; 9F 09 E6 B6 | Store accumulator to absolute long,X
	ORA ($06),Y		  ; 11 06 | Logical OR with accumulator ((zero page),Y)
	BIT #$8F			 ; 89 8F | Test bits in accumulator (immediate)
	BEQ $A8			  ; F0 A8 | Branch if equal
	BVC $93			  ; 50 93 | Branch if overflow clear
	ROR $FF9F			; 6E 9F FF | Rotate right (absolute)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	STA $FF0070		  ; 8F 70 00 FF | Store accumulator to absolute long address
	SBC $3906,X		  ; FD 06 39 | Subtract with carry (absolute,X)
	ASL $3E39,X		  ; 1E 39 3E | Arithmetic shift left (absolute,X)
	AND $094C,Y		  ; 39 4C 09 | Logical AND with accumulator (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA #$86			 ; 09 86 | Logical OR with accumulator (immediate)
	LDA $B99E,Y		  ; B9 9E B9 | Load from absolute,Y into accumulator
	ROR $3839,X		  ; 7E 39 38 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_040
; Address: $E58E3A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_040:
	JSR $5400			; 20 00 54 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BNE $08			  ; D0 08 | Branch if not equal
	BCC $44			  ; 90 44 | Branch if carry clear
	BCS $64			  ; B0 64 | Branch if carry set
	LDA ($65,X)		  ; A1 65 | Load from (zero page,X) into accumulator
	BPL $87			  ; 10 87 | Branch if positive
	WDM #$D0			 ; 42 D0 | Reserved instruction

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_041
; Address: $E58E50
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_041:
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 44 | Load from absolute long,X into accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $9B			  ; 64 9B | Store zero to zero page
	ADC $9A			  ; 65 9A | Add with carry (zero page)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 3B 08 7D | Load from absolute long,X into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_042
; Address: $E58E64
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_042:
	JSL $D8CC1C		  ; 22 1C CC D8 | Jump to subroutine long
	STA ($99,X)		  ; 81 99 | Store accumulator to (zero page,X)
	DEX				  ; CA | Decrement X register
	BCC $C9			  ; 90 C9 | Branch if carry clear
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF C0 | Load from absolute long,X into accumulator
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	REP #$3D			 ; C2 3D | Reset processor status bits
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $34			  ; 80 34 | Branch always
	STY $8434			; 8C 34 84 | Store Y register to absolute address
	LDY $D7E7,X		  ; BC E7 D7 | Load from absolute,X into Y register
	BVS $E4			  ; 70 E4 | Branch if overflow set
	SBC ($65,X)		  ; E1 65 | Subtract with carry ((zero page,X))
	BCC $47			  ; 90 47 | Branch if carry clear
	BVC $04			  ; 50 04 | Branch if overflow clear
	STY $7B			  ; 84 7B | Store Y register to zero page
	SEC				  ; 38 | Set carry flag
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	ADC $9A			  ; 65 9A | Add with carry (zero page)
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 3F 09 7E | Load from absolute long,X into accumulator
	EOR #$2E			 ; 49 2E | Exclusive OR with accumulator (immediate)
	ORA $D9CE,Y		  ; 19 CE D9 | Logical OR with accumulator (absolute,Y)
	BRA $99			  ; 80 99 | Branch always
	BNE $C9			  ; D0 C9 | Branch if not equal
	CMP #$15			 ; C9 15 | Compare accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF C0 | Load from absolute long,X into accumulator
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	AND $39F9,Y		  ; 39 F9 39 | Logical AND with accumulator (absolute,Y)
	SBC $F0F4,Y		  ; F9 F4 F0 | Subtract with carry (absolute,Y)
	ROR $3B7E,X		  ; 7E 7E 3B | Rotate right (absolute,X)
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_043
; Address: $E58ED8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_043:
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	ROR $1181,X		  ; 7E 81 11 | Rotate right (absolute,X)
	INC $01CB			; EE CB 01 | Increment (absolute)
	BMI $31			  ; 30 31 | Branch if negative
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_044
; Address: $E58EE8
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_044:
	JSR $9ADF			; 20 DF 9A | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	PHY				  ; 5A | Push Y register to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	BRA $1B			  ; 80 1B | Branch always
	BMI $90			  ; 30 90 | Branch if negative
	STA				  ; 9F 2F 9F 2C | Store accumulator to absolute long,X
	STZ $9C3C			; 9C 3C 9C | Store zero to absolute
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	CPX $10			  ; E4 10 | Compare X register (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	ORA $FA3F,Y		  ; 19 3F FA | Logical OR with accumulator (absolute,Y)
	SBC $C9C6,X		  ; FD C6 C9 | Subtract with carry (absolute,X)
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	SBC $FD3A,Y		  ; F9 3A FD | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	SBC $F9FE,X		  ; FD FE F9 | Subtract with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	JMP $40DC			; 4C DC 40 | Jump to address
	ASL $0E44,X		  ; 1E 44 0E | Arithmetic shift left (absolute,X)
	STX $6054			; 8E 54 60 | Store X register to absolute address
	STA				  ; 9F 68 97 40 | Store accumulator to absolute long,X
	LDA				  ; BF 40 BF 40 | Load from absolute long,X into accumulator
	LDA				  ; BF 44 BB 44 | Load from absolute long,X into accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ORA #$8E			 ; 09 8E | Logical OR with accumulator (immediate)
	ORA #$86			 ; 09 86 | Logical OR with accumulator (immediate)
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	ORA #$69			 ; 09 69 | Logical OR with accumulator (immediate)
	EOR #$69			 ; 49 69 | Exclusive OR with accumulator (immediate)
	EOR $DF20,Y		  ; 59 20 DF | Exclusive OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 40 BF 0F | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_045
; Address: $E58F82
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_045:
	AND ($C1,X)		  ; 21 C1 | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STA $339F,Y		  ; 99 9F 33 | Store accumulator to absolute,Y
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	INC $C03F,X		  ; FE 3F C0 | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	STA				  ; 9F 60 00 FF | Store accumulator to absolute long,X
	SBC $9C6E,X		  ; FD 6E 9C | Subtract with carry (absolute,X)
	STZ $D373			; 9C 73 D3 | Store zero to absolute
	ASL $159F,X		  ; 1E 9F 15 | Arithmetic shift left (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	TXS				  ; 9A | Transfer X register to stack pointer
	STA				  ; 9F 6F 80 1C | Store accumulator to absolute long,X
	LDY $E01F			; AC 1F E0 | Game work RAM access
	NOP				  ; EA | No operation
	INC				  ; 1A | Increment accumulator
	SBC $1F			  ; E5 1F | Subtract with carry (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CMP $F9FB,X		  ; DD FB F9 | Compare accumulator (absolute,X)
	BVS $0F			  ; 70 0F | Branch if overflow set
	STA $014A			; 8D 4A 01 | Store accumulator to absolute address
	STZ $BEB9,X		  ; 9E B9 BE | Store zero to absolute,X
	LDA $090E,Y		  ; B9 0E 09 | Load from absolute,Y into accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $7F			  ; 80 7F | Branch always
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF 37 FF 7F | Load from absolute long,X into accumulator
	LDX #$5F			 ; A2 5F | Load immediate value into X register
	CMP $EF26,Y		  ; D9 26 EF | Compare accumulator (absolute,Y)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	BPL $FF			  ; 10 FF | Branch if positive
	EOR $5DFF,Y		  ; 59 FF 5D | Exclusive OR with accumulator (absolute,Y)
	CMP $537F,Y		  ; D9 7F 53 | Compare accumulator (absolute,Y)
	SBC $DF6D,X		  ; FD 6D DF | Subtract with carry (absolute,X)
	LDA #$1F			 ; A9 1F | Load immediate value into accumulator
	BIT #$5E			 ; 89 5E | Test bits in accumulator (immediate)
	ROR $FF09,X		  ; 7E 09 FF | Rotate right (absolute,X)
	EOR $59FF			; 4D FF 59 | Exclusive OR with accumulator (absolute)
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	LSR $13D4			; 4E D4 13 | Logical shift right (absolute)
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_046
; Address: $E59025
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_046:
	BCC $A7			  ; 90 A7 | Branch if carry clear
	BMI $64			  ; 30 64 | Branch if negative
	AND ($65,X)		  ; 21 65 | Logical AND with accumulator ((zero page,X))
	BNE $47			  ; D0 47 | Branch if not equal
	REP #$50			 ; C2 50 | Reset processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $9B			  ; 64 9B | Store zero to zero page
	ADC $9A			  ; 65 9A | Add with carry (zero page)
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 6D 59 3D | Load from absolute long,X into accumulator
	ORA #$EE			 ; 09 EE | Logical OR with accumulator (immediate)
	ORA $D9CE,Y		  ; 19 CE D9 | Logical OR with accumulator (absolute,Y)
	STX $99			  ; 86 99 | Store X register to zero page
	CMP ($C9),Y		  ; D1 C9 | Compare accumulator ((zero page),Y)
	CMP #$1F			 ; C9 1F | Compare accumulator (immediate)
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $0E2A,X		  ; 3E 2A 0E | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BNE $CB			  ; D0 CB | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	JMP $4C77			; 4C 77 4C | Jump to address

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_047
; Address: $E59070
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_047:
	JSR $22DF			; 20 DF 22 | Jump to subroutine
	CMP $FD02,X		  ; DD 02 FD | Compare accumulator (absolute,X)
	SBC $3CC3,X		  ; FD C3 3C | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 44 BB 44 | Load from absolute long,X into accumulator
	STZ $B7C8,X		  ; 9E C8 B7 | Store zero to absolute,X
	CPY #$9B			 ; C0 9B | Compare Y register (immediate)
	CPX $C0			  ; E4 C0 | Compare X register (zero page)
	PHY				  ; 5A | Push Y register to stack
	ROL $59			  ; 26 59 | Rotate left (zero page)
	AND $D5			  ; 25 D5 | Logical AND with accumulator (zero page)
	AND $04			  ; 25 04 | Logical AND with accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	STY $7B			  ; 84 7B | Store Y register to zero page
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	CPX $01C9			; EC C9 01 | Compare X register (absolute)
	BMI $31			  ; 30 31 | Branch if negative

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_049
; Address: $E590A8
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_049:
	JSR $9ADF			; 20 DF 9A | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	PHY				  ; 5A | Push Y register to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	BCC $19			  ; 90 19 | Branch if carry clear
	STA ($36),Y		  ; 91 36 | Store accumulator to (zero page),Y
	BCC $78			  ; 90 78 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	BCC $30			  ; 90 30 | Branch if carry clear
	BCC $05			  ; 90 05 | Branch if carry clear
	BRA $17			  ; 80 17 | Branch always
	BPL $EF			  ; 10 EF | Branch if positive
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	BPL $EF			  ; 10 EF | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	INX				  ; E8 | Increment X register
	BEQ $F7			  ; F0 F7 | Branch if equal
	JMP $E7F843		  ; 5C 43 F8 E7 | Jump to address long
	TSX				  ; BA | Transfer stack pointer to X register
	SBC $F8			  ; E5 F8 | Subtract with carry (zero page)
	ORA $3A			  ; 05 3A | Logical OR with accumulator (zero page)
	AND $8F70,X		  ; 3D 70 8F | Logical AND with accumulator (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF E0 1F E0 | Load from absolute long,X into accumulator
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	BEQ $FF			  ; F0 FF | Branch if equal
	CMP $A3E7,Y		  ; D9 E7 A3 | Compare accumulator (absolute,Y)
	ADC $7E8D,Y		  ; 79 8D 7E | Add with carry (absolute,Y)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	REP #$FD			 ; C2 FD | Reset processor status bits
	LDX $FDD7			; AE D7 FD | Load from absolute address into X register
	STY $3FFF			; 8C FF 3F | Store Y register to absolute address
	ROR $F0			  ; 66 F0 | Rotate right (zero page)
	SED				  ; F8 | Set decimal mode flag
	CPY $99			  ; C4 99 | Compare Y register (zero page)
	ASL $CE			  ; 06 CE | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	BIT #$57			 ; 89 57 | Test bits in accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_04A
; Address: $E59151
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_04A:
	STA				  ; 9F 68 97 40 | Store accumulator to absolute long,X
	LDA				  ; BF 00 FF 06 | Load from absolute long,X into accumulator
	SBC $B946,Y		  ; F9 46 B9 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_04B
; Address: $E5915D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_04B:
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	DEC				  ; 3A | Decrement accumulator
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	STY $0A			  ; 84 0A | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag
	CPY $DF20			; CC 20 DF | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_04C
; Address: $E59172
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_04C:
	JSL $FD02DD		  ; 22 DD 02 FD | Jump to subroutine long
	LDY $BF40,X		  ; BC 40 BF | Load from absolute,X into Y register
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	ROL $A140,X		  ; 3E 40 A1 | Rotate left (absolute,X)
	CMP ($9A,X)		  ; C1 9A | Compare accumulator ((zero page,X))
	CPX #$9E			 ; E0 9E | Compare X register (immediate)
	INC $6999			; EE 99 69 | Increment (absolute)
	CMP #$2F			 ; C9 2F | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_04D
; Address: $E5918F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_04D:
	JSR $FF00			; 20 00 FF | Jump to subroutine
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	BRA $7F			  ; 80 7F | Branch always
	STX $0971			; 8E 71 09 | Store X register to absolute address
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BNE $02			  ; D0 02 | Branch if not equal
	ROR				  ; 6A | Rotate right (accumulator)
	LDA $BC			  ; A5 BC | Load from zero page into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	INY				  ; C8 | Increment Y register
	ADC $FD02			; 6D 02 FD | Add with carry (absolute)
	STZ $5BA4			; 9C A4 5B | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_04E
; Address: $E591BB
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_04E:
	STA				  ; 9F C0 3F 00 | Store accumulator to absolute long,X
	BIT $D6			  ; 24 D6 | Test bits in accumulator (zero page)
	BRA $8F			  ; 80 8F | Branch always
	BEQ $BF			  ; F0 BF | Branch if equal
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BRA $7A			  ; 80 7A | Branch always
	PHP				  ; 08 | Push processor status to stack
	EOR $A929,Y		  ; 59 29 A9 | Exclusive OR with accumulator (absolute,Y)
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	BEQ $3A			  ; F0 3A | Branch if equal
	AND $2F39			; 2D 39 2F | Logical AND with accumulator (absolute)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	CMP $0B			  ; C5 0B | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_04F
; Address: $E591E9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_04F:
	ORA #$C4			 ; 09 C4 | Logical OR with accumulator (immediate)
	CMP $1900,Y		  ; D9 00 19 | Compare accumulator (absolute,Y)
	BIT $F9			  ; 24 F9 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_050
; Address: $E591F0
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_050:
	JSR $20DF			; 20 DF 20 | Jump to subroutine
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	STA				  ; 9F 3E 80 1F | Store accumulator to absolute long,X
	BRA $5E			  ; 80 5E | Branch always
	STZ $9F73,X		  ; 9E 73 9F | Store zero to absolute,X
	ADC $3690,X		  ; 7D 90 36 | Add with carry (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $1FE1,X		  ; 1E E1 1F | Arithmetic shift left (absolute,X)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BPL $EF			  ; 10 EF | Branch if positive
	CPX $F9CA			; EC CA F9 | Compare X register (absolute)
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	PHY				  ; 5A | Push Y register to stack
	ORA $EC			  ; 05 EC | Logical OR with accumulator (zero page)
	SBC #$7A			 ; E9 7A | Subtract with carry (immediate)
	SBC $096E,Y		  ; F9 6E 09 | Subtract with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA $0542			; 0D 42 05 | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STA $D666,Y		  ; 99 66 D6 | Store accumulator to absolute,Y
	LDA #$2E			 ; A9 2E | Load immediate value into accumulator
	STA				  ; 9F 7D 90 36 | Store accumulator to absolute long,X
	TYA				  ; 98 | Transfer Y register to accumulator
	STA				  ; 9F FF 6F FF | Store accumulator to absolute long,X
	ROL $1FD7			; 2E D7 1F | Rotate left (absolute)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BPL $EF			  ; 10 EF | Branch if positive
	CPX $996E			; EC 6E 99 | Compare X register (absolute)
	DEC $D661			; CE 61 D6 | Decrement (absolute)
	ORA #$66			 ; 09 66 | Logical OR with accumulator (immediate)
	ADC ($7A,X)		  ; 61 7A | Add with carry ((zero page,X))
	SBC $096E,Y		  ; F9 6E 09 | Subtract with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA $0542			; 0D 42 05 | Logical OR with accumulator (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	JMP ($08FF)		  ; 6C FF 08 | Jump to address (absolute indirect)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_051
; Address: $E59277
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_051:
	STA				  ; 9F F8 07 08 | Store accumulator to absolute long,X
	PHP				  ; 08 | Push processor status to stack
	BCS $FF			  ; B0 FF | Branch if carry set
	SBC $B1FF,X		  ; FD FF B1 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_052
; Address: $E59287
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_052:
	ROR $FDC2,X		  ; 7E C2 FD | Rotate right (absolute,X)
	LDA				  ; BF EF FF FF | Load from absolute long,X into accumulator
	LDA				  ; BF FD 9F F9 | Load from absolute long,X into accumulator
	INC $57			  ; E6 57 | Increment (zero page)
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	STA $FF0DFF		  ; 8F FF 0D FF | Store accumulator to absolute long address
	LDA $FFFF,Y		  ; B9 FF FF | Load from absolute,Y into accumulator
	BNE $6F			  ; D0 6F | Branch if not equal
	CPX #$31			 ; E0 31 | Compare X register (immediate)
	BEQ $5C			  ; F0 5C | Branch if equal
	LDA				  ; BF 6E AC 02 | Load from absolute long,X into accumulator
	BRA $4C			  ; 80 4C | Branch always
	CPY $BF40			; CC 40 BF | Compare Y register (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_053
; Address: $E592D3
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_053:
	STA				  ; 9F 70 8F 7C | Store accumulator to absolute long,X
	CPY #$2C			 ; C0 2C | Compare Y register (immediate)
	JMP $FBB3			; 4C B3 FB | Jump to address
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	INC $15FA,X		  ; FE FA 15 | Increment (absolute,X)
	BNE $00			  ; D0 00 | Branch if not equal
	INC $20FE,X		  ; FE FE 20 | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	BNE $2F			  ; D0 2F | Branch if not equal
	INC $B001,X		  ; FE 01 B0 | Increment (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	LDA $042C			; AD 2C 04 | Load from absolute address into accumulator
	LSR $004C			; 4E 4C 00 | Logical shift right (absolute)
	BIT $04D3			; 2C D3 04 | Test bits in accumulator (absolute)
	JMP $A8B3			; 4C B3 A8 | Jump to address
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_054
; Address: $E59324
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_054:
	JSR $9C00			; 20 00 9C | Jump to subroutine
	STZ $FF37			; 9C 37 FF | Store zero to absolute
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	DEC $00DE,X		  ; DE DE 00 | Decrement (absolute,X)
	STZ $FF63			; 9C 63 FF | Store zero to absolute
	DEY				  ; 88 | Decrement Y register
	DEC $8F21,X		  ; DE 21 8F | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_055
; Address: $E59341
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_055:
	JSR $30CF			; 20 CF 30 | Jump to subroutine
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	STA $FF838F		  ; 8F 8F 83 FF | Store accumulator to absolute long address
	BCS $B0			  ; B0 B0 | Branch if carry set
	JMP $CC00			; 4C 00 CC | Jump to address
	CPY $FF00			; CC 00 FF | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_056
; Address: $E59354
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_056:
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	STA $00FF70		  ; 8F 70 FF 00 | Store accumulator to absolute long address
	BCS $4F			  ; B0 4F | Branch if carry set
	CPY $0E33			; CC 33 0E | Compare Y register (absolute)
	PEA #$8C0D		   ; F4 0D 8C | Push effective address to stack
	STA $E9EA			; 8D EA E9 | Store accumulator to absolute address
	SBC $0114,Y		  ; F9 14 01 | Subtract with carry (absolute,Y)
	CPX $E1			  ; E4 E1 | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag
	SBC $FD02,Y		  ; F9 02 FD | Subtract with carry (absolute,Y)
	STY $E873			; 8C 73 E8 | Store Y register to absolute address
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	DEC $40			  ; C6 40 | Decrement (zero page)
	AND $57BD,X		  ; 3D BD 57 | Logical AND with accumulator (absolute,X)
	STA				  ; 9F 2F C0 0C | Store accumulator to absolute long,X
	ASL $1FE0			; 0E E0 1F | Arithmetic shift left (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 3D C2 1F | Load from absolute long,X into accumulator
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDA $3244,Y		  ; B9 44 32 | Load from absolute,Y into accumulator
	AND ($CC),Y		  ; 31 CC | Logical AND with accumulator ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	STZ $0067			; 9C 67 00 | Store zero to absolute
	BMI $CF			  ; 30 CF | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $15			  ; 80 15 | Branch always
	TXS				  ; 9A | Transfer X register to stack pointer
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_057
; Address: $E593CC
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_057:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BCC $6F			  ; 90 6F | Branch if carry clear
	BEQ $0F			  ; F0 0F | Branch if equal
	PHY				  ; 5A | Push Y register to stack
	LDA				  ; BF 15 FA 00 | Load from absolute long,X into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP ($F49A)		  ; 6C 9A F4 | Jump to address (absolute indirect)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_058
; Address: $E593FE
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_058:
	TSX				  ; BA | Transfer stack pointer to X register
	EOR $0001			; 4D 01 00 | Exclusive OR with accumulator (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SBC $8817,Y		  ; F9 17 88 | Subtract with carry (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	BVS $9F			  ; 70 9F | Branch if overflow set
	SBC $1A			  ; E5 1A | Subtract with carry (zero page)
	PEA #$07FF		   ; F4 FF 07 | Push effective address to stack
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	CMP $5FE1,X		  ; DD E1 5F | Compare accumulator (absolute,X)
	CMP $8080			; CD 80 80 | Compare accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	SBC $F7F8,Y		  ; F9 F8 F7 | Subtract with carry (absolute,Y)
	INX				  ; E8 | Increment X register
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	DEC				  ; 3A | Decrement accumulator
	STZ $A9FF,X		  ; 9E FF A9 | Store zero to absolute,X
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	ADC ($F9),Y		  ; 71 F9 | Add with carry ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	CMP $4FF1,X		  ; DD F1 4F | Compare accumulator (absolute,X)
	CMP $FF5C,X		  ; DD 5C FF | Compare accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_059
; Address: $E594A0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_059:
	PHP				  ; 08 | Push processor status to stack
	EOR $4F40			; 4D 40 4F | Exclusive OR with accumulator (absolute)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_05A
; Address: $E594A9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_05A:
	JSR $5048			; 20 48 50 | Jump to subroutine
	BRA $05			  ; 80 05 | Branch always
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	BCS $10			  ; B0 10 | Branch if carry set
	LDA				  ; BF 00 FA 3F | Load from absolute long,X into accumulator
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_05C
; Address: $E594D2
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_05C:
	JSR $915F			; 20 5F 91 | Jump to subroutine
	ORA $2B9D,X		  ; 1D 9D 2B | Logical OR with accumulator (absolute,X)
	ADC $C93F			; 6D 3F C9 | Add with carry (absolute)
	SBC ($50,X)		  ; E1 50 | Subtract with carry ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	STA $85			  ; 85 85 | Store accumulator to zero page
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	CMP ($51,X)		  ; C1 51 | Compare accumulator ((zero page,X))
	BPL $04			  ; 10 04 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BNE $4F			  ; D0 4F | Branch if not equal
	PLY				  ; 7A | Pull Y register from stack
	ROL $6FF2			; 2E F2 6F | Rotate left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_05E
; Address: $E59520
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_05E:
	JSR $8521			; 20 21 85 | Jump to subroutine
	STZ $A0B6,X		  ; 9E B6 A0 | Store zero to absolute,X
	PHP				  ; 08 | Push processor status to stack
	ORA ($8C,X)		  ; 01 8C | Logical OR with accumulator ((zero page,X))
	AND $5444,Y		  ; 39 44 54 | Logical AND with accumulator (absolute,Y)
	BRA $29			  ; 80 29 | Branch always
	BNE $C1			  ; D0 C1 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_05F
; Address: $E59535
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_05F:
	RTI				  ; 40 | Return from interrupt
	CPX #$CF			 ; E0 CF | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_060
; Address: $E5953B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_060:
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	ASL $13			  ; 06 13 | Arithmetic shift left (zero page)
	EOR $8DC0,Y		  ; 59 C0 8D | Exclusive OR with accumulator (absolute,Y)
	CPY $C9			  ; C4 C9 | Compare Y register (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ORA $2D12,X		  ; 1D 12 2D | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_061
; Address: $E59556
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_061:
	JSL $BF405D		  ; 22 5D 40 BF | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	ASL $223D			; 0E 3D 22 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_062
; Address: $E59563
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_062:
	CMP ($94,X)		  ; C1 94 | Compare accumulator ((zero page,X))
	EOR ($26,X)		  ; 41 26 | Exclusive OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $C930,X		  ; 9D 30 C9 | Store accumulator to absolute,X
	SBC $FD00,Y		  ; F9 00 FD | Subtract with carry (absolute,Y)
	ROL $D9			  ; 26 D9 | Rotate left (zero page)
	STZ $0063			; 9C 63 00 | Store zero to absolute
	CPX #$AA			 ; E0 AA | Compare X register (immediate)
	LDA				  ; BF 30 EF A7 | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	TSX				  ; BA | Transfer stack pointer to X register
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	BCC $00			  ; 90 00 | Branch if carry clear
	STA				  ; 9F DF 00 55 | Store accumulator to absolute long,X
	ORA $F1			  ; 05 F1 | Logical OR with accumulator (zero page)
	ROL $6F90,X		  ; 3E 90 6F | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_063
; Address: $E595A0
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_063:
	BCS $7D			  ; B0 7D | Branch if carry set
	LDY #$D9			 ; A0 D9 | Load immediate value into Y register
	LDA #$80			 ; A9 80 | Load immediate value into accumulator
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$E6			 ; 49 E6 | Exclusive OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	SBC $0283,Y		  ; F9 83 02 | Subtract with carry (absolute,Y)
	ASL $E9			  ; 06 E9 | Arithmetic shift left (zero page)
	CMP $F936,Y		  ; D9 36 F9 | Compare accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	SBC $CD06,Y		  ; F9 06 CD | Subtract with carry (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	CPX #$7D			 ; E0 7D | Compare X register (immediate)
	SBC $FE01,X		  ; FD 01 FE | Subtract with carry (absolute,X)
	LDY $72			  ; A4 72 | Load from zero page into Y register
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	BVC $AF			  ; 50 AF | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_064
; Address: $E595D5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_064:
	STA				  ; 9F 7D 82 00 | Store accumulator to absolute long,X
	STA $FF00			; 8D 00 FF | Store accumulator to absolute address
	ORA ($EC),Y		  ; 11 EC | Logical OR with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_065
; Address: $E595E8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_065:
	JSL $7D9ADD		  ; 22 DD 9A 7D | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	SBC $CD32,X		  ; FD 32 CD | Subtract with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	JMP $7C44			; 4C 44 7C | Jump to address
	JMP ($357C)		  ; 6C 7C 35 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_066
; Address: $E59609
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_066:
	LDX $DBEB,Y		  ; BE EB DB | Load from absolute,Y into X register
	BIT $34			  ; 24 34 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	ROL $5F3F			; 2E 3F 5F | Rotate left (absolute)
	EOR ($7F),Y		  ; 51 7F | Exclusive OR with accumulator ((zero page),Y)
	ROR $A77F,X		  ; 7E 7F A7 | Rotate right (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCC $F0			  ; 90 F0 | Branch if carry clear
	INC $FE1C,X		  ; FE 1C FE | Increment (absolute,X)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	DEC				  ; 3A | Decrement accumulator
	ASL $00F1			; 0E F1 00 | Arithmetic shift left (absolute)
	CMP ($1F),Y		  ; D1 1F | Compare accumulator ((zero page),Y)
	STY $07			  ; 84 07 | Store Y register to zero page
	SBC $01			  ; E5 01 | Subtract with carry (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BPL $03			  ; 10 03 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	AND $77E0			; 2D E0 77 | Logical AND with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	TSX				  ; BA | Transfer stack pointer to X register
	STA $E4			  ; 85 E4 | Store accumulator to zero page
	INC				  ; 1A | Increment accumulator
	CPX $18			  ; E4 18 | Compare X register (zero page)
	BPL $E0			  ; 10 E0 | Game work RAM access
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $1E			  ; 70 1E | Branch if overflow set
	BVS $7F			  ; 70 7F | Branch if overflow set
	ADC $7F33,Y		  ; 79 33 7F | Add with carry (absolute,Y)
	ROL $1C08,X		  ; 3E 08 1C | Rotate left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	ROL $780C,X		  ; 3E 0C 78 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_067
; Address: $E596D2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_067:
	RTI				  ; 40 | Return from interrupt
	ROL $7F00,X		  ; 3E 00 7F | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_068
; Address: $E596DC
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_068:
	JSL $3E003E		  ; 22 3E 00 3E | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROL $1C1C,X		  ; 3E 1C 1C | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROL $1E02,X		  ; 3E 02 1E | Rotate left (absolute,X)
	BPL $1E			  ; 10 1E | Branch if positive
	INC				  ; 1A | Increment accumulator
	ASL $1E12,X		  ; 1E 12 1E | Arithmetic shift left (absolute,X)
	ASL $141A,X		  ; 1E 1A 14 | Arithmetic shift left (absolute,X)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ADC $65			  ; 65 65 | Add with carry (zero page)
	SBC $CD9F,Y		  ; F9 9F CD | Subtract with carry (absolute,Y)
	INC $DFB9			; EE B9 DF | Increment (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	INC $EDE5			; EE E5 ED | Increment (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $10FF9A		  ; AF 9A FF 10 | Load from absolute long address into accumulator
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	BVC $E0			  ; 50 E0 | Game work RAM access
	PLX				  ; FA | Pull X register from stack
	STZ $FC88,X		  ; 9E 88 FC | Store zero to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	EOR $0468			; 4D 68 04 | Exclusive OR with accumulator (absolute)
	BPL $0A			  ; 10 0A | Branch if positive
	ROR $FE00,X		  ; 7E 00 FE | Rotate right (absolute,X)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	INC $FC0B,X		  ; FE 0B FC | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	JMP ($3878)		  ; 6C 78 38 | Jump to address (absolute indirect)
	JMP $7C44			; 4C 44 7C | Jump to address
	JMP ($347C)		  ; 6C 7C 34 | Jump to address (absolute indirect)
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	BIT $34			  ; 24 34 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ROL $2232,X		  ; 3E 32 22 | Rotate left (absolute,X)
	ROL $BF56,X		  ; 3E 56 BF | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_069
; Address: $E59777
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_069:
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	PLX				  ; FA | Pull X register from stack
	STZ $FC88,X		  ; 9E 88 FC | Store zero to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	LSR $256A			; 4E 6A 25 | Logical shift right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $FE00,X		  ; 7E 00 FE | Rotate right (absolute,X)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	INC $FC0A,X		  ; FE 0A FC | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ROR $0474,X		  ; 7E 74 04 | Rotate right (absolute,X)
	PLX				  ; FA | Pull X register from stack
	STZ $FC88,X		  ; 9E 88 FC | Store zero to absolute,X
	PLA				  ; 68 | Pull accumulator from stack
	EOR $6768			; 4D 68 67 | Exclusive OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $FE00,X		  ; 7E 00 FE | Rotate right (absolute,X)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	INC $FC0A,X		  ; FE 0A FC | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BPL $1C			  ; 10 1C | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $8018			; 0D 18 80 | Logical OR with accumulator (absolute)
	BIT $1C			  ; 24 1C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_06A
; Address: $E597D2
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_06A:
	JSL $161A3E		  ; 22 3E 1A 16 | Jump to subroutine long
	ASL $141B,X		  ; 1E 1B 14 | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $00			  ; 80 00 | Branch always
	DEC				  ; 3A | Decrement accumulator
	ROL $1C1C,X		  ; 3E 1C 1C | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY $880C			; CC 0C 88 | Compare Y register (absolute)
	ORA $0D06			; 0D 06 0D | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ROL $1E02,X		  ; 3E 02 1E | Rotate left (absolute,X)
	BPL $1E			  ; 10 1E | Branch if positive
	INC				  ; 1A | Increment accumulator
	ASL $1ED2,X		  ; 1E D2 1E | Arithmetic shift left (absolute,X)
	ASL $141B,X		  ; 1E 1B 14 | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $7C04,X		  ; 3D 04 7C | Logical AND with accumulator (absolute,X)
	JMP $7C44			; 4C 44 7C | Jump to address
	JMP ($357C)		  ; 6C 7C 35 | Jump to address (absolute indirect)
	LDX $DBEB,Y		  ; BE EB DB | Load from absolute,Y into X register
	BIT $34			  ; 24 34 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROR $7C00,X		  ; 7E 00 7C | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_06B
; Address: $E59818
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_06B:
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_06D
; Address: $E59828
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_06D:
	JSL $BF563E		  ; 22 3E 56 BF | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ROR $757F,X		  ; 7E 7F 75 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_06E
; Address: $E59847
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_06E:
	EOR ($56,X)		  ; 41 56 | Exclusive OR with accumulator ((zero page,X))
	WDM #$6C			 ; 42 6C | Reserved instruction
	EOR $3348,Y		  ; 59 48 33 | Exclusive OR with accumulator (absolute,Y)
	BVC $FF			  ; 50 FF | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	PHB				  ; 8B | Push data bank register to stack
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	LDA $FF8000		  ; AF 00 80 FF | Load from absolute long address into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CMP $AEBA,X		  ; DD BA AE | Compare accumulator (absolute,X)
	STY $40			  ; 84 40 | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	AND #$25			 ; 29 25 | Logical AND with accumulator (immediate)
	EOR $557B,X		  ; 5D 7B 55 | Exclusive OR with accumulator (absolute,X)
	JMP $246A34		  ; 5C 34 6A 24 | Jump to address long
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SBC $F985,X		  ; FD 85 F9 | Subtract with carry (absolute,X)
	STY $F8			  ; 84 F8 | Store Y register to zero page
	SBC $0A0D,X		  ; FD 0D 0A | Subtract with carry (absolute,X)
	AND $5171			; 2D 71 51 | Logical AND with accumulator (absolute)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $50			  ; 30 50 | Branch if negative
	BIT $0F00			; 2C 00 0F | Test bits in accumulator (absolute)
	AND $7F0E,X		  ; 3D 0E 7F | Logical AND with accumulator (absolute,X)
	LDA				  ; BF 8F FF C3 | Load from absolute long,X into accumulator
	LDA				  ; BF D0 70 AC | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_06F
; Address: $E598C4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_06F:
	INC $5F2A			; EE 2A 5F | Increment (absolute)
	ADC $B7B5,X		  ; 7D B5 B7 | Add with carry (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_070
; Address: $E598CD
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_070:
	BMI $0F			  ; 30 0F | Branch if negative
	BCS $40			  ; B0 40 | Branch if carry set
	BNE $3E			  ; D0 3E | Branch if not equal
	BRA $FF			  ; 80 FF | Branch always
	PHA				  ; 48 | Push accumulator to stack
	CMP $BDCB,X		  ; DD CB BD | Compare accumulator (absolute,X)
	SEP #$FD			 ; E2 FD | Set processor status bits
	ORA ($5F,X)		  ; 01 5F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	LSR $5F6B,X		  ; 5E 6B 5F | Logical shift right (absolute,X)
	ADC $565F,Y		  ; 79 5F 56 | Add with carry (absolute,Y)
	LSR $4000,X		  ; 5E 00 40 | Logical shift right (absolute,X)
	ROR $207F,X		  ; 7E 7F 20 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_071
; Address: $E598F0
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_071:
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	LDA ($FF,X)		  ; A1 FF | Load from (zero page,X) into accumulator
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	LDA ($FF,X)		  ; A1 FF | Load from (zero page,X) into accumulator
	LDA				  ; BF FF 80 FF | Load from absolute long,X into accumulator
	STA				  ; 9F FF AB B5 | Store accumulator to absolute long,X
	BIT $39			  ; 24 39 | Test bits in accumulator (zero page)
	ROR $FEAB			; 6E AB FE | Rotate right (absolute)
	AND $2F			  ; 25 2F | Logical AND with accumulator (zero page)
	ASL $400A			; 0E 0A 40 | Arithmetic shift left (absolute)
	LDX $9DC2,Y		  ; BE C2 9D | Load from absolute,Y into X register
	STA ($DE,X)		  ; 81 DE | Store accumulator to (zero page,X)
	BIT $50C3			; 2C C3 50 | Test bits in accumulator (absolute)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	STZ $3851			; 9C 51 38 | Store zero to absolute
	STA				  ; 9F FC 64 E0 | Store accumulator to absolute long,X
	CLV				  ; B8 | Clear overflow flag
	LDY #$64			 ; A0 64 | Load immediate value into Y register
	CPX $50			  ; E4 50 | Compare X register (zero page)
	BVC $03			  ; 50 03 | Branch if overflow clear
	SBC $7887,X		  ; FD 87 78 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	XBA				  ; EB | Exchange accumulator bytes
	PLA				  ; 68 | Pull accumulator from stack
	STA				  ; 9F 5E E6 18 | Store accumulator to absolute long,X
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $B9FF,X		  ; FD FF B9 | Subtract with carry (absolute,X)
	SBC $EC			  ; E5 EC | Subtract with carry (zero page)
	ORA $FBFB,X		  ; 1D FB FB | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_072
; Address: $E5996A
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_072:
	LSR $28FB,X		  ; 5E FB 28 | Logical shift right (absolute,X)
	SBC $BFFF,X		  ; FD FF BF | Subtract with carry (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	CMP $6FEE,Y		  ; D9 EE 6F | Compare accumulator (absolute,Y)
	SBC $CD87,Y		  ; F9 87 CD | Subtract with carry (absolute,Y)
	BRA $E0			  ; 80 E0 | Game work RAM access
	BEQ $B4			  ; F0 B4 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FC68			; EE 68 FC | Increment (absolute)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $1F			  ; 30 1F | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	BPL $03			  ; 10 03 | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_074
; Address: $E599DA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_074:
	JSR $3008			; 20 08 30 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $E0			  ; 30 E0 | Game work RAM access
	PLP				  ; 28 | Pull processor status from stack
	CPX #$54			 ; E0 54 | Compare X register (immediate)
	BEQ $64			  ; F0 64 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	BRA $94			  ; 80 94 | Branch always
	BPL $14			  ; 10 14 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_075
; Address: $E599F7
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_075:
	JSR $100C			; 20 0C 10 | Jump to subroutine
	BIT $6C10			; 2C 10 6C | Test bits in accumulator (absolute)
	BPL $EC			  ; 10 EC | Branch if positive
	BPL $14			  ; 10 14 | Branch if positive
	CPX $CE			  ; E4 CE | Compare X register (zero page)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	INC $3D01,X		  ; FE 01 3D | Increment (absolute,X)
	AND $3B			  ; 25 3B | Logical AND with accumulator (zero page)
	ADC $1C73			; 6D 73 1C | Add with carry (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_076
; Address: $E59A36
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_076:
	BRA $00			  ; 80 00 | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA $20DF70		  ; 8F 70 DF 20 | Store accumulator to absolute long address
	STX $1800			; 8E 00 18 | Store X register to absolute address
	ROL $06			  ; 26 06 | Rotate left (zero page)
	CPY $1D0C			; CC 0C 1D | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SBC $F300,Y		  ; F9 00 F3 | Subtract with carry (absolute,Y)
	DEC $7C30			; CE 30 7C | Decrement (absolute)
	SEC				  ; 38 | Set carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BMI $62			  ; 30 62 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_077
; Address: $E59A7E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_077:
	STA				  ; 9F 00 5D DF | Store accumulator to absolute long,X
	LDY $F0CF,X		  ; BC CF F0 | Load from absolute,X into Y register
	CPX #$9D			 ; E0 9D | Compare X register (immediate)
	SEP #$9F			 ; E2 9F | Set processor status bits
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_078
; Address: $E59A90
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_078:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	DEC $23FE,X		  ; DE FE 23 | Decrement (absolute,X)
	CPX $FD13			; EC 13 FD | Compare X register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F E0 BE C1 | Store accumulator to absolute long,X
	STZ $FDE1,X		  ; 9E E1 FD | Store zero to absolute,X
	REP #$C7			 ; C2 C7 | Reset processor status bits
	SED				  ; F8 | Set decimal mode flag
	STA $B0CFF0		  ; 8F F0 CF B0 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_079
; Address: $E59AE0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_079:
	JSR $3EDF			; 20 DF 3E | Jump to subroutine
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	SBC #$FE			 ; E9 FE | Subtract with carry (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $3FC1			; 0E C1 3F | Arithmetic shift left (absolute)
	SBC $FD03,X		  ; FD 03 FD | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ASL $F4			  ; 06 F4 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STX $0001			; 8E 01 00 | Store X register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_07A
; Address: $E59B46
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_07A:
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $14			  ; 30 14 | Branch if negative
	BVS $14			  ; 70 14 | Branch if overflow set
	LDY #$28			 ; A0 28 | Load immediate value into Y register
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX $EC10			; EC 10 EC | Compare X register (absolute)
	BPL $D8			  ; 10 D8 | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_07C
; Address: $E59B7A
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_07C:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $F2FE,X		  ; FE FE F2 | Increment (absolute,X)
	INC $FCFC,X		  ; FE FC FC | Increment (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0001			; 0E 01 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	ROL $1F11			; 2E 11 1F | Rotate left (absolute)
	CLC				  ; 18 | Clear carry flag
	STA ($60),Y		  ; 91 60 | Store accumulator to (zero page),Y
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	CPY $C5			  ; C4 C5 | Compare Y register (zero page)
	ADC $0F79,Y		  ; 79 79 0F | Add with carry (absolute,Y)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	DEC				  ; 3A | Decrement accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STX $00			  ; 86 00 | Store X register to zero page
	BVS $80			  ; 70 80 | Branch if overflow set
	STZ $F060			; 9C 60 F0 | Store zero to absolute
	BEQ $83			  ; F0 83 | Branch if equal
	ROR $F97E,X		  ; 7E 7E F9 | Rotate right (absolute,X)
	SBC $8E8E,Y		  ; F9 8E 8E | Subtract with carry (absolute,Y)
	AND $0F38,Y		  ; 39 38 0F | Logical AND with accumulator (absolute,Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	PEA #$E1F0		   ; F4 F0 E1 | Push effective address to stack
	SBC ($8F,X)		  ; E1 8F | Subtract with carry ((zero page,X))
	STA $43FCFC		  ; 8F FC FC 43 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_07D
; Address: $E59BEC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_07D:
	STA				  ; 9F 1F 3C 3C | Store accumulator to absolute long,X
	ASL $7000,X		  ; 1E 00 70 | Arithmetic shift left (absolute,X)
	LDY $F000,X		  ; BC 00 F0 | Load from absolute,X into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC $E407,Y		  ; F9 07 E4 | Subtract with carry (absolute,Y)
	JMP ($F993)		  ; 6C 93 F9 | Jump to address (absolute indirect)
	ASL $EF			  ; 06 EF | Arithmetic shift left (zero page)
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $7F			  ; 10 7F | Branch if positive
	BRA $6E			  ; 80 6E | Branch always
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	BRA $BF			  ; 80 BF | Branch always
	CPY #$7B			 ; C0 7B | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_07E
; Address: $E59C2D
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_07E:
	RTI				  ; 40 | Return from interrupt
	BVS $4F			  ; 70 4F | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROR $0091			; 6E 91 00 | Rotate right (absolute)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT #$77			 ; 89 77 | Test bits in accumulator (immediate)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	SBC $FC13			; ED 13 FC | Subtract with carry (absolute)
	SED				  ; F8 | Set decimal mode flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $0008			; 0E 08 00 | Arithmetic shift left (absolute)
	ASL $1800			; 0E 00 18 | Arithmetic shift left (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $0201,Y		  ; 19 01 02 | Logical OR with accumulator (absolute,Y)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCC $90			  ; 90 90 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_07F
; Address: $E59CC7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_07F:
	INC $71			  ; E6 71 | Increment (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	SBC $42			  ; E5 42 | Hardware register operation
	RTI				  ; 40 | Return from interrupt
	BRA $10			  ; 80 10 | Branch always

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_080
; Address: $E59CD4
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_080:
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	BMI $5D			  ; 30 5D | Branch if negative
	LDA $F900,X		  ; BD 00 F9 | Load from absolute,X into accumulator
	BRA $F9			  ; 80 F9 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BVS $70			  ; 70 70 | Branch if overflow set
	LSR $3221,X		  ; 5E 21 32 | Logical shift right (absolute,X)
	ORA $3F40			; 0D 40 3F | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	LSR $81			  ; 46 81 | Logical shift right (zero page)
	DEY				  ; 88 | Decrement Y register
	BEQ $0F			  ; F0 0F | Branch if equal
	CMP $3A			  ; C5 3A | Compare accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY $FC00			; CC 00 FC | Compare Y register (absolute)
	STZ $A700			; 9C 00 A7 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	LDA $3840,Y		  ; B9 40 38 | Load from absolute,Y into accumulator
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	ADC $087F,Y		  ; 79 7F 08 | Add with carry (absolute,Y)
	BIT $382F			; 2C 2F 38 | Test bits in accumulator (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BNE $20			  ; D0 20 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX $F996			; EC 96 F9 | Compare X register (absolute)
	ROL $7F7F,X		  ; 3E 7F 7F | Rotate left (absolute,X)
	STA				  ; 9F FF 3F 7F | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ROL $8A3F,X		  ; 3E 3F 8A | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_081
; Address: $E59D69
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_081:
	PHB				  ; 8B | Push data bank register to stack
	STA ($E7,X)		  ; 81 E7 | Store accumulator to (zero page,X)
	SBC $F7FF,Y		  ; F9 FF F7 | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	INC $1FFF			; EE FF 1F | Increment (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_082
; Address: $E59D94
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_082:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $7E			  ; 80 7E | Branch always
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $F8E8,X		  ; FE E8 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0C0A			; 0E 0A 0C | Arithmetic shift left (absolute)
	BPL $65			  ; 10 65 | Branch if positive
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_083
; Address: $E59DD2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_083:
	JSL $005D06		  ; 22 06 5D 00 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_084
; Address: $E59DE0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_084:
	CLI				  ; 58 | Clear interrupt disable flag
	ORA $3E70			; 0D 70 3E | Logical OR with accumulator (absolute)
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	WDM #$00			 ; 42 00 | Reserved instruction
	STY $00			  ; 84 00 | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BRA $B0			  ; 80 B0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BIT $98			  ; 24 98 | Test bits in accumulator (zero page)
	BEQ $19			  ; F0 19 | Branch if equal
	CPX #$B8			 ; E0 B8 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_085
; Address: $E59E1E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_085:
	STA $FFFF70		  ; 8F 70 FF FF | Store accumulator to absolute long address
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX $03			  ; E4 03 | Compare X register (zero page)
	BEQ $0F			  ; F0 0F | Branch if equal
	STA				  ; 9F 9F FF FF | Store accumulator to absolute long,X
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	ORA $071F,Y		  ; 19 1F 07 | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_086
; Address: $E59E56
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_086:
	ASL $0C00			; 0E 00 0C | Arithmetic shift left (absolute)
	BRA $60			  ; 80 60 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BRA $FF			  ; 80 FF | Branch always
	ROL $FCFE,X		  ; 3E FE FC | Rotate left (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	JMP $004C			; 4C 4C 00 | Jump to address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	ASL $3B11			; 0E 11 3B | Arithmetic shift left (absolute)
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	BEQ $70			  ; F0 70 | Branch if equal
	BRA $10			  ; 80 10 | Branch always
	RTI				  ; 40 | Return from interrupt
	BEQ $04			  ; F0 04 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $3870,X		  ; FE 70 38 | Increment (absolute,X)
	ORA ($21),Y		  ; 11 21 | PPU graphics register access
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CMP $0C44			; CD 44 0C | Compare accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	STA $00FF00		  ; 8F 00 FF 00 | Store accumulator to absolute long address
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	INC $FF33			; EE 33 FF | Increment (absolute)
	STY $0073			; 8C 73 00 | Store Y register to absolute address
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CPX $47			  ; E4 47 | Compare X register (zero page)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_087
; Address: $E59EEA
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_087:
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	STA				  ; 9F 63 FF 07 | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 3C 3C FF | Store accumulator to absolute long,X
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	TXA				  ; 8A | Transfer X register to accumulator
	PLX				  ; FA | Pull X register from stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($F9,X)		  ; 01 F9 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($0E,X)		  ; 81 0E | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	LSR $3820,X		  ; 5E 20 38 | Logical shift right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDA ($40,X)		  ; A1 40 | Load from (zero page,X) into accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	INC $6401,X		  ; FE 01 64 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_089
; Address: $E59FA3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_089:
	JSR $2101			; 20 01 21 | PPU graphics register access
	BIT $3F			  ; 24 3F | Test bits in accumulator (zero page)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_08A
; Address: $E59FB3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_08A:
	JSR $3012			; 20 12 30 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BMI $1C			  ; 30 1C | Branch if negative
	BPL $1E			  ; 10 1E | Branch if positive
	ASL $14FE,X		  ; 1E FE 14 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_08B
; Address: $E59FDB
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_08B:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	DEC $01			  ; C6 01 | Decrement (zero page)
	ASL $7000,X		  ; 1E 00 70 | Arithmetic shift left (absolute,X)
	LDY $F000,X		  ; BC 00 F0 | Load from absolute,X into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_08D
; Address: $E5A02A
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_08D:
	JSR $7920			; 20 20 79 | Jump to subroutine
	ADC $FB8B,Y		  ; 79 8B FB | Add with carry (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	LDX $1C41,Y		  ; BE 41 1C | Load from absolute,Y into X register
	PHP				  ; 08 | Push processor status to stack
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	BPL $08			  ; 10 08 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $1A00,X		  ; 1E 00 1A | Arithmetic shift left (absolute,X)
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	AND ($80,X)		  ; 21 80 | Logical AND with accumulator ((zero page,X))
	BIT $D2FF			; 2C FF D2 | Test bits in accumulator (absolute)
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	LDA $4EFF,Y		  ; B9 FF 4E | Load from absolute,Y into accumulator
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	BNE $FF			  ; D0 FF | Branch if not equal
	ROR $00FF			; 6E FF 00 | Rotate right (absolute)
	ORA #$D2			 ; 09 D2 | Logical OR with accumulator (immediate)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	CPY #$67			 ; C0 67 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDX #$DF			 ; A2 DF | Load immediate value into X register
	BCS $CF			  ; B0 CF | Branch if carry set
	EOR $FF62,X		  ; 5D 62 FF | Exclusive OR with accumulator (absolute,X)
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $77			  ; 80 77 | Branch always
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_08E
; Address: $E5A10E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_08E:
	ROR $0091			; 6E 91 00 | Rotate right (absolute)
	STA				  ; 9F 60 FC 03 | Store accumulator to absolute long,X
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC $FE07,Y		  ; F9 07 FE | Subtract with carry (absolute,Y)
	INC $D502,X		  ; FE 02 D5 | Increment (absolute,X)
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $9400			; 6D 00 94 | Add with carry (absolute)
	LDA #$A8			 ; A9 A8 | Load immediate value into accumulator
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_08F
; Address: $E5A178
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_08F:
	LDA $36FF			; AD FF 36 | Load from absolute address into accumulator
	ROL $34FF			; 2E FF 34 | Rotate left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $1002			; 0E 02 10 | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BMI $40			  ; 30 40 | Branch if negative
	BVC $4F			  ; 50 4F | Branch if overflow clear
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_091
; Address: $E5A1A0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_091:
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $FE7E,X		  ; 7E 7E FE | Rotate right (absolute,X)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	DEC $86			  ; C6 86 | Decrement (zero page)
	JMP $38381C		  ; 5C 1C 38 38 | Jump to address long
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	ADC $E300,Y		  ; 79 00 E3 | Add with carry (absolute,Y)
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_092
; Address: $E5A1E0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_092:
	STA				  ; 9F E0 9F 60 | Store accumulator to absolute long,X
	CPY #$9F			 ; C0 9F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_093
; Address: $E5A1EB
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_093:
	JSR $03FC			; 20 FC 03 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	ASL $E4			  ; 06 E4 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	CPX $9C12			; EC 12 9C | Compare X register (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR $DA			  ; 66 DA | Rotate right (zero page)
	ROL $F6			  ; 26 F6 | Rotate left (zero page)
	ASL $1CEC			; 0E EC 1C | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F FF 3F 7F | Store accumulator to absolute long,X
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	ORA $000D			; 0D 0D 00 | Logical OR with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $0C			  ; 10 0C | Branch if positive
	LDX $F210			; AE 10 F2 | Load from absolute address into X register
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	SBC $FEFF			; ED FF FE | Subtract with carry (absolute)
	DEC $FEFF,X		  ; DE FF FE | Decrement (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	AND ($3E),Y		  ; 31 3E | Logical AND with accumulator ((zero page),Y)
	ASL $1C1F,X		  ; 1E 1F 1C | Arithmetic shift left (absolute,X)
	DEC $F9			  ; C6 F9 | Decrement (zero page)
	CMP $E7E7,Y		  ; D9 E7 E7 | Compare accumulator (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $0E			  ; F0 0E | Branch if equal
	STX $8E76			; 8E 76 8E | Store X register to absolute address
	DEC $7C3E,X		  ; DE 3E 7C | Decrement (absolute,X)
	LDY $F0F0,X		  ; BC F0 F0 | Load from absolute,X into Y register
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0701			; 0E 01 07 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_094
; Address: $E5A2A4
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_094:
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	BMI $D7			  ; 30 D7 | Branch if negative
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	JMP ($BC3B)		  ; 6C 3B BC | Jump to address (absolute indirect)
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BNE $50			  ; D0 50 | Branch if not equal
	BNE $50			  ; D0 50 | Branch if not equal
	BRA $D0			  ; 80 D0 | Branch always
	BVC $D0			  ; 50 D0 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BRA $D0			  ; 80 D0 | Branch always
	BVC $D0			  ; 50 D0 | Branch if overflow clear
	BVC $2C			  ; 50 2C | Branch if overflow clear
	BIT $7EFF			; 2C FF 7E | Test bits in accumulator (absolute)
	BIT $2CFF			; 2C FF 2C | Test bits in accumulator (absolute)
	ROR $2CFF,X		  ; 7E FF 2C | Rotate right (absolute,X)
	BIT $25FF			; 2C FF 25 | Test bits in accumulator (absolute)
	PHX				  ; DA | Push X register to stack
	BRA $F9			  ; 80 F9 | Branch always
	BRA $57			  ; 80 57 | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_095
; Address: $E5A32C
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_095:
	STA $04			  ; 85 04 | Store accumulator to zero page
	BRA $FF			  ; 80 FF | Branch always
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	CPX $CE			  ; E4 CE | Compare X register (zero page)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $B0			  ; 80 B0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	BRA $0E			  ; 80 0E | Branch always
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CLV				  ; B8 | Clear overflow flag
	ASL $E371			; 0E 71 E3 | Arithmetic shift left (absolute)
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_096
; Address: $E5A387
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_096:
	SEC				  ; 38 | Set carry flag
	ROL $F400,X		  ; 3E 00 F4 | Rotate left (absolute,X)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	LDY $FE01,X		  ; BC 01 FE | Load from absolute,X into Y register
	STZ $0F9F			; 9C 9F 0F | Store zero to absolute
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROR $007E,X		  ; 7E 7E 00 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_097
; Address: $E5A3B2
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_097:
	BCC $60			  ; 90 60 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	SEP #$1C			 ; E2 1C | Set processor status bits
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BMI $0F			  ; 30 0F | Branch if negative
	ROL $FC01,X		  ; 3E 01 FC | Rotate left (absolute,X)
	BVS $0F			  ; 70 0F | Branch if overflow set
	ASL $FFF1			; 0E F1 FF | Arithmetic shift left (absolute)
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	BVS $70			  ; 70 70 | Branch if overflow set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	PLP				  ; 28 | Pull processor status from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	CPX $E914			; EC 14 E9 | Compare X register (absolute)
	BNE $2B			  ; D0 2B | Branch if not equal
	AND $3E			  ; 25 3E | Logical AND with accumulator (zero page)
	ASL $12			  ; 06 12 | Arithmetic shift left (zero page)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CPX #$09			 ; E0 09 | Compare X register (immediate)
	CPX #$42			 ; E0 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_099
; Address: $E5A424
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_099:
	CMP ($97),Y		  ; D1 97 | Compare accumulator ((zero page),Y)
	LDA ($B1),Y		  ; B1 B1 | Load from (zero page),Y into accumulator
	LSR $084E,X		  ; 5E 4E 08 | Logical shift right (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LDA ($CE),Y		  ; B1 CE | Load from (zero page),Y into accumulator
	LSR $FFB2			; 4E B2 FF | Logical shift right (absolute)
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	PLP				  ; 28 | Pull processor status from stack
	LSR $A1FF			; 4E FF A1 | Logical shift right (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	BCS $B0			  ; B0 B0 | Branch if carry set
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BNE $D0			  ; D0 D0 | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	INC $4CFF,X		  ; FE FF 4C | Increment (absolute,X)
	CPX $3EFF			; EC FF 3E | Compare X register (absolute)
	BIT $07FF			; 2C FF 07 | Test bits in accumulator (absolute)
	JMP ($5867)		  ; 6C 67 58 | Jump to address (absolute indirect)
	BMI $0F			  ; 30 0F | Branch if negative
	BVS $4F			  ; 70 4F | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_09A
; Address: $E5A47A
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_09A:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	CLD				  ; D8 | Clear decimal mode flag
	CPX $F60A			; EC 0A F6 | Compare X register (absolute)
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	PEA #$AE5E		   ; F4 5E AE | Push effective address to stack
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $849C			; 9C 9C 84 | Store zero to absolute
	STZ $F8F8			; 9C F8 F8 | Store zero to absolute
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_09C
; Address: $E5A4B4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_09C:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	ROL $225C,X		  ; 3E 5C 22 | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	LDX #$40			 ; A2 40 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_09D
; Address: $E5A4C1
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_09D:
	RTI				  ; 40 | Return from interrupt
	ASL $3D61,X		  ; 1E 61 3D | Arithmetic shift left (absolute,X)
	WDM #$7F			 ; 42 7F | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND ($5E,X)		  ; 21 5E | Logical AND with accumulator ((zero page,X))
	JMP $00807F		  ; 5C 7F 80 00 | Jump to address long
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SBC $FD06,Y		  ; F9 06 FD | Subtract with carry (absolute,Y)
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	DEC $39			  ; C6 39 | Decrement (zero page)
	BPL $9F			  ; 10 9F | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_09E
; Address: $E5A508
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_09E:
	STA				  ; 9F 60 DF 20 | Store accumulator to absolute long,X
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ORA #$3B			 ; 09 3B | Logical OR with accumulator (immediate)
	SBC $C03F			; ED 3F C0 | Subtract with carry (absolute)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($35,X)		  ; 01 35 | Logical OR with accumulator ((zero page,X))
	STA $00E7,Y		  ; 99 E7 00 | Store accumulator to absolute,Y
	SBC $7B9E			; ED 9E 7B | Subtract with carry (absolute)
	STY $9867			; 8C 67 98 | Store Y register to absolute address
	LDY #$7E			 ; A0 7E | Load immediate value into Y register
	STA ($38,X)		  ; 81 38 | Store accumulator to (zero page,X)
	STZ $00E1,X		  ; 9E E1 00 | Store zero to absolute,X
	STY $808C			; 8C 8C 80 | Store Y register to absolute address
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	BRA $81			  ; 80 81 | Branch always
	STA ($8B,X)		  ; 81 8B | Store accumulator to (zero page,X)
	BIT #$8D			 ; 89 8D | Test bits in accumulator (immediate)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	STX $87			  ; 86 87 | Store X register to zero page
	BVC $23			  ; 50 23 | Branch if overflow clear
	AND #$52			 ; 29 52 | Logical AND with accumulator (immediate)
	BIT $2658			; 2C 58 26 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_09F
; Address: $E5A579
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_09F:
	JSR $2250			; 20 50 22 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	BVC $28			  ; 50 28 | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0A0
; Address: $E5A582
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0A0:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	PHX				  ; DA | Push X register to stack
	TXS				  ; 9A | Transfer X register to stack pointer
	TSX				  ; BA | Transfer stack pointer to X register
	DEY				  ; 88 | Decrement Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	ROR				  ; 6A | Rotate right (accumulator)
	NOP				  ; EA | No operation
	CPY $21			  ; C4 21 | PPU graphics register access
	EOR ($34,X)		  ; 41 34 | Exclusive OR with accumulator ((zero page,X))
	ORA ($64),Y		  ; 11 64 | Logical OR with accumulator ((zero page),Y)
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	STA $08FF			; 8D FF 08 | Store accumulator to absolute address
	PHB				  ; 8B | Push data bank register to stack
	EOR $245F,X		  ; 5D 5F 24 | Exclusive OR with accumulator (absolute,X)
	ROL $32			  ; 26 32 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0A1
; Address: $E5A5CC
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0A1:
	JSR $2110			; 20 10 21 | PPU graphics register access
	ADC ($80,X)		  ; 61 80 | Add with carry ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CMP $8D00,Y		  ; D9 00 8D | Compare accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	BCC $20			  ; 90 20 | Branch if carry clear
	BMI $43			  ; 30 43 | Branch if negative
	BCC $0E			  ; 90 0E | Branch if carry clear
	ROR $DA7E			; 6E 7E DA | Rotate right (absolute)
	INC $FC9C			; EE 9C FC | Increment (absolute)
	STZ $64			  ; 64 64 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($8282)		  ; 6C 82 82 | Jump to address (absolute indirect)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA ($6C,X)		  ; 01 6C | Logical OR with accumulator ((zero page,X))
	ORA ($F8),Y		  ; 11 F8 | Logical OR with accumulator ((zero page),Y)
	ADC $8080,Y		  ; 79 80 80 | Add with carry (absolute,Y)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BVS $70			  ; 70 70 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0A3
; Address: $E5A611
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0A3:
	WDM #$64			 ; 42 64 | Reserved instruction
	INC				  ; 1A | Increment accumulator
	ROR $CE30,X		  ; 7E 30 CE | Rotate right (absolute,X)
	ORA $9282			; 0D 82 92 | Logical OR with accumulator (absolute)
	ORA $1DE2			; 0D E2 1D | Logical OR with accumulator (absolute)
	PHB				  ; 8B | Push data bank register to stack
	AND $153F,X		  ; 3D 3F 15 | Logical AND with accumulator (absolute,X)
	AND $3B			  ; 25 3B | Logical AND with accumulator (zero page)
	ADC $1C73			; 6D 73 1C | Add with carry (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BVS $03			  ; 70 03 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SBC $C2F9,Y		  ; F9 F9 C2 | Subtract with carry (absolute,Y)
	WDM #$42			 ; 42 42 | Hardware register operation
	BPL $10			  ; 10 10 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	STA ($3C,X)		  ; 81 3C | Store accumulator to (zero page,X)
	ORA $EFE6,Y		  ; 19 E6 EF | Logical OR with accumulator (absolute,Y)
	STA $2666,X		  ; 9D 66 26 | Store accumulator to absolute,X
	ROR $CA			  ; 66 CA | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	STA ($91),Y		  ; 91 91 | Store accumulator to (zero page),Y
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $C1			  ; 26 C1 | Rotate left (zero page)
	BRA $43			  ; 80 43 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	ASL $63			  ; 06 63 | Arithmetic shift left (zero page)
	STA				  ; 9F BF BF A3 | Store accumulator to absolute long,X
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	ASL $001E,X		  ; 1E 1E 00 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0A4
; Address: $E5A694
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0A4:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $3E			  ; 80 3E | Branch always
	ORA $E1E2,X		  ; 1D E2 E1 | Logical OR with accumulator (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	PLY				  ; 7A | Pull Y register from stack
	REP #$E7			 ; C2 E7 | Reset processor status bits
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0A5
; Address: $E5A6AB
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0A5:
	CLC				  ; 18 | Clear carry flag
	BIT $103C			; 2C 3C 10 | Test bits in accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $040D			; 0D 0D 04 | Logical OR with accumulator (absolute)
	STA $85			  ; 85 85 | Store accumulator to zero page
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BCC $62			  ; 90 62 | Branch if carry clear
	STA $5062,Y		  ; 99 62 50 | Store accumulator to absolute,Y
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA ($EA),Y		  ; 11 EA | Logical OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0A6
; Address: $E5A6EC
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0A6:
	JSR $0020			; 20 20 00 | Jump to subroutine
	EOR ($14,X)		  ; 41 14 | Exclusive OR with accumulator ((zero page,X))
	ORA #$44			 ; 09 44 | Logical OR with accumulator (immediate)
	WDM #$15			 ; 42 15 | Reserved instruction
	LDA #$46			 ; A9 46 | Load immediate value into accumulator
	DEY				  ; 88 | Decrement Y register
	NOP				  ; EA | No operation
	PHB				  ; 8B | Push data bank register to stack
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	PHB				  ; 8B | Push data bank register to stack
	AND ($60,X)		  ; 21 60 | Logical AND with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	ORA $2A39,Y		  ; 19 39 2A | Logical OR with accumulator (absolute,Y)
	ASL $1010			; 0E 10 10 | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	STY $1A			  ; 84 1A | Store Y register to zero page
	DEC $10			  ; C6 10 | Decrement (zero page)
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0A7
; Address: $E5A736
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0A7:
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA ($71,X)		  ; 01 71 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $47			  ; 05 47 | Logical OR with accumulator (zero page)
	STY $84			  ; 84 84 | Store Y register to zero page
	BRA $80			  ; 80 80 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	ADC $6518,Y		  ; 79 18 65 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0A8
; Address: $E5A754
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0A8:
	JSL $631C59		  ; 22 59 1C 63 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	INC $00			  ; E6 00 | Increment (zero page)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	ORA $3F3F,X		  ; 1D 3F 3F | Logical OR with accumulator (absolute,X)
	ROR $2200,X		  ; 7E 00 22 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $20			  ; 10 20 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive
	SBC $FFFD,X		  ; FD FD FF | Subtract with carry (absolute,X)
	STA $C1C18F		  ; 8F 8F C1 C1 | Store accumulator to absolute long address
	BVS $00			  ; 70 00 | Branch if overflow set
	ROL $E100,X		  ; 3E 00 E1 | Rotate left (absolute,X)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	SBC ($F1,X)		  ; E1 F1 | Subtract with carry ((zero page,X))
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	ASL $E100,X		  ; 1E 00 E1 | Arithmetic shift left (absolute,X)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	SBC ($F1,X)		  ; E1 F1 | Subtract with carry ((zero page,X))
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	DEC $FFCE			; CE CE FF | Decrement (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($2E),Y		  ; 31 2E | Logical AND with accumulator ((zero page),Y)
	ROL $2E15			; 2E 15 2E | Rotate left (absolute)
	AND $232E,X		  ; 3D 2E 23 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0A9
; Address: $E5A80F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0A9:
	ROL $0044,X		  ; 3E 44 00 | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	STZ $4C			  ; 64 4C | Store zero to zero page
	JMP $1414			; 4C 14 14 | Jump to address
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0AA
; Address: $E5A82D
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0AA:
	STZ $14			  ; 64 14 | Store zero to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	BCC $CA			  ; 90 CA | Branch if carry clear
	BPL $9A			  ; 10 9A | Branch if positive
	NOP				  ; EA | No operation
	STZ $9A00,X		  ; 9E 00 9A | Store zero to absolute,X
	DEX				  ; CA | Decrement X register
	ASL $001E,X		  ; 1E 1E 00 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ADC ($80,X)		  ; 61 80 | Add with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	BVS $46			  ; 70 46 | Branch if overflow set
	LSR $47			  ; 46 47 | Logical shift right (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	JMP $3C00			; 4C 00 3C | Jump to address
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	LDA $B800,Y		  ; B9 00 B8 | Load from absolute,Y into accumulator
	STA				  ; 9F 9F E3 E3 | Store accumulator to absolute long,X
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0AB
; Address: $E5A899
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0AB:
	CLC				  ; 18 | Clear carry flag
	LDA $3840,Y		  ; B9 40 38 | Load from absolute,Y into accumulator
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA				  ; 9F B7 BF F8 | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	BVS $70			  ; 70 70 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0AD
; Address: $E5A8BC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0AD:
	BEQ $0F			  ; F0 0F | Branch if equal
	DEC $39			  ; C6 39 | Decrement (zero page)
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	BEQ $F8			  ; F0 F8 | Branch if equal

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0AE
; Address: $E5A8C6
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0AE:
	JSR $C020			; 20 20 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $03			  ; 10 03 | Branch if positive
	CMP ($0E),Y		  ; D1 0E | Compare accumulator ((zero page),Y)
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ORA $C019,Y		  ; 19 19 C0 | Logical OR with accumulator (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ROR $C380			; 6E 80 C3 | Rotate right (absolute)
	SBC $E602,X		  ; FD 02 E6 | Subtract with carry (absolute,X)
	BMI $37			  ; 30 37 | Branch if negative
	BIT $2E35			; 2C 35 2E | Test bits in accumulator (absolute)
	ROL $2E35			; 2E 35 2E | Rotate left (absolute)
	ROL $3B28			; 2E 28 3B | Rotate left (absolute)
	ORA $403F			; 0D 3F 40 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY $E4			  ; C4 E4 | Compare Y register (zero page)
	STZ $44			  ; 64 44 | Store zero to zero page
	STZ $44			  ; 64 44 | Store zero to zero page
	STZ $44			  ; 64 44 | Store zero to zero page
	STZ $54			  ; 64 54 | Store zero to zero page
	CPY $E4			  ; C4 E4 | Compare Y register (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0B0
; Address: $E5A930
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0B0:
	INC				  ; 1A | Increment accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	TXA				  ; 8A | Transfer X register to accumulator
	BPL $8A			  ; 10 8A | Branch if positive
	BPL $8A			  ; 10 8A | Branch if positive
	BPL $8A			  ; 10 8A | Branch if positive
	INC				  ; 1A | Increment accumulator
	STX $0310			; 8E 10 03 | Store X register to absolute address
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$7A			 ; E0 7A | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0B1
; Address: $E5A955
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0B1:
	BRA $E8			  ; 80 E8 | Branch always
	BPL $7C			  ; 10 7C | Branch if positive
	BRA $3E			  ; 80 3E | Branch always
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	BEQ $6F			  ; F0 6F | Branch if equal
	BCC $4F			  ; 90 4F | Branch if carry clear
	BVS $4F			  ; 70 4F | Branch if overflow set
	BVS $DF			  ; 70 DF | Branch if overflow set
	CPX #$CF			 ; E0 CF | Compare X register (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	ADC ($BD,X)		  ; 61 BD | Add with carry ((zero page,X))
	DEC $DEA9			; CE A9 DE | Decrement (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SEP #$1E			 ; E2 1E | Set processor status bits
	PLX				  ; FA | Pull X register from stack
	ASL $62			  ; 06 62 | Arithmetic shift left (zero page)
	STZ $0EF2,X		  ; 9E F2 0E | Store zero to absolute,X
	SBC $3B07,Y		  ; F9 07 3B | Subtract with carry (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	LSR $5F71			; 4E 71 5F | Logical shift right (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0B2
; Address: $E5A9A7
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0B2:
	BEQ $1E			  ; F0 1E | Branch if equal
	ADC ($BD,X)		  ; 61 BD | Add with carry ((zero page,X))
	DEC $DEA9			; CE A9 DE | Decrement (absolute)
	BRA $00			  ; 80 00 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY $0EF6			; CC F6 0E | Compare Y register (absolute)
	PLX				  ; FA | Pull X register from stack
	ASL $62			  ; 06 62 | Arithmetic shift left (zero page)
	STZ $0EF2,X		  ; 9E F2 0E | Store zero to absolute,X
	SBC $3B07,Y		  ; F9 07 3B | Subtract with carry (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	PHY				  ; 5A | Push Y register to stack
	ADC ($69),Y		  ; 71 69 | Add with carry ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	AND $1F1F,X		  ; 3D 1F 1F | Logical AND with accumulator (absolute,X)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0B3
; Address: $E5A9F6
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0B3:
	STX $00			  ; 86 00 | Store X register to zero page
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0B5
; Address: $E5AA02
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0B5:
	JSL $040422		  ; 22 22 04 04 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BMI $30			  ; 30 30 | Branch if negative
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STA $C510			; 8D 10 C5 | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0B6
; Address: $E5AA15
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0B6:
	BCC $66			  ; 90 66 | Branch if carry clear
	STA ($1E,X)		  ; 81 1E | Store accumulator to (zero page,X)
	REP #$0C			 ; C2 0C | Reset processor status bits
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $10			  ; 10 10 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0B8
; Address: $E5AA31
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0B8:
	BRA $9F			  ; 80 9F | Branch always
	STZ $FF00			; 9C 00 FF | Store zero to absolute
	SEC				  ; 38 | Set carry flag
	ASL $08F1			; 0E F1 08 | Arithmetic shift left (absolute)
	LDX $AFF1			; AE F1 AF | Load from absolute address into X register
	BEQ $8F			  ; F0 8F | Branch if equal
	BEQ $C7			  ; F0 C7 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	DEC $EDB1			; CE B1 ED | Decrement (absolute)
	LDA $0080D0		  ; AF D0 80 00 | Load from absolute long address into accumulator
	ORA $32C2			; 0D C2 32 | Logical OR with accumulator (absolute)
	DEC $923E,X		  ; DE 3E 92 | Decrement (absolute,X)
	ROR $9F73,X		  ; 7E 73 9F | Rotate right (absolute,X)
	AND ($CF),Y		  ; 31 CF | Logical AND with accumulator ((zero page),Y)
	ROL $0002			; 2E 02 00 | Rotate left (absolute)
	ORA $0100			; 0D 00 01 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	AND $F38D,Y		  ; 39 8D F3 | Logical AND with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $66			  ; 66 66 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0BA
; Address: $E5AAC8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0BA:
	JSL $FFE422		  ; 22 22 E4 FF | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	INC $99EE			; EE EE 99 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0BC
; Address: $E5AAD8
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0BC:
	JSL $DF20DD		  ; 22 DD 20 DF | Jump to subroutine long
	CMP $E9FF,Y		  ; D9 FF E9 | Compare accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $BB11			; 4D 11 BB | Exclusive OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $FC00,X		  ; 7E 00 FC | Rotate right (absolute,X)
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	STY $C0			  ; 84 C0 | Store Y register to zero page
	JMP $6A26			; 4C 26 6A | Jump to address
	ORA #$35			 ; 09 35 | Logical OR with accumulator (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0BD
; Address: $E5AB2B
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0BD:
	JSR $2060			; 20 60 20 | Jump to subroutine
	ROR				  ; 6A | Rotate right (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLX				  ; FA | Pull X register from stack
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	JMP ($2448)		  ; 6C 48 24 | Jump to address (absolute indirect)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BIT $48			  ; 24 48 | Test bits in accumulator (zero page)
	JMP ($6C48)		  ; 6C 48 6C | Jump to address (absolute indirect)
	PHA				  ; 48 | Push accumulator to stack
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	JMP ($1224)		  ; 6C 24 12 | Jump to address (absolute indirect)
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	ROR $4E5E,X		  ; 7E 5E 4E | Rotate right (absolute,X)
	ROR $FEEE,X		  ; 7E EE FE | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0BE
; Address: $E5AB9E
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0BE:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$F8FC		   ; F4 FC F8 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BCC $90			  ; 90 90 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $0743			; 2C 43 07 | Test bits in accumulator (absolute)
	BEQ $C3			  ; F0 C3 | Branch if equal
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $ADFB			; 0D FB AD | Logical OR with accumulator (absolute)
	LDY $8CDB			; AC DB 8C | Load from absolute address into Y register
	STA $F98FF9		  ; 8F F9 8F F9 | Store accumulator to absolute long address
	SBC $FB8C,Y		  ; F9 8C FB | Subtract with carry (absolute,Y)
	BPL $02			  ; 10 02 | Branch if positive
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	ASL $0F0F			; 0E 0F 0F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0C0
; Address: $E5AC28
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0C0:
	LDA				  ; BF 41 BF 40 | Load from absolute long,X into accumulator
	LDA				  ; BF 48 9F 30 | Load from absolute long,X into accumulator
	BPL $00			  ; 10 00 | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDA				  ; BF 98 F8 98 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	LDY $A7FC,X		  ; BC FC A7 | Load from absolute,X into Y register
	AND $AEEF			; 2D EF AE | Logical AND with accumulator (absolute)
	AND ($71),Y		  ; 31 71 | Logical AND with accumulator ((zero page),Y)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)
	STA				  ; 9F FF 4E 7F | Store accumulator to absolute long,X
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	BRA $83			  ; 80 83 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	BPL $0F			  ; 10 0F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDA ($E5),Y		  ; B1 E5 | Load from (zero page),Y into accumulator
	BRA $D5			  ; 80 D5 | Branch always
	ROR $66			  ; 66 66 | Rotate right (zero page)
	DEY				  ; 88 | Decrement Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $FD8A,X		  ; FD 8A FD | Subtract with carry (absolute,X)
	STY $88FB			; 8C FB 88 | Store Y register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	STA $00FF,Y		  ; 99 FF 00 | Store accumulator to absolute,Y
	BIT $64			  ; 24 64 | Test bits in accumulator (zero page)
	PHY				  ; 5A | Push Y register to stack
	AND $40			  ; 25 40 | Logical AND with accumulator (zero page)
	STZ $09			  ; 64 09 | Store zero to zero page
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0C1
; Address: $E5ACD6
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0C1:
	AND $2D7F			; 2D 7F 2D | Logical AND with accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	EOR #$48			 ; 49 48 | Exclusive OR with accumulator (immediate)
	EOR #$92			 ; 49 92 | Exclusive OR with accumulator (immediate)
	ORA $01F2			; 0D F2 01 | Logical OR with accumulator (absolute)
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	JMP ($00FF)		  ; 6C FF 00 | Jump to address (absolute indirect)
	INC $3E6D,X		  ; FE 6D 3E | Increment (absolute,X)
	INC $7C7C,X		  ; FE 7C 7C | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	LDX $5B11			; AE 11 5B | Load from absolute address into X register
	LDY #$C2			 ; A0 C2 | Load immediate value into Y register
	AND ($20),Y		  ; 31 20 | Logical AND with accumulator ((zero page),Y)
	ASL $037A,X		  ; 1E 7A 03 | Arithmetic shift left (absolute,X)
	BPL $30			  ; 10 30 | Branch if positive
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$18			 ; 29 18 | Logical AND with accumulator (immediate)
	ASL $E0			  ; 06 E0 | Game work RAM access
	ASL $3000,X		  ; 1E 00 30 | Arithmetic shift left (absolute,X)
	BVS $28			  ; 70 28 | Branch if overflow set
	JMP ($7775)		  ; 6C 75 77 | Jump to address (absolute indirect)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0C3
; Address: $E5AD4E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0C3:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	STY $9303			; 8C 03 93 | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	LDY $0D00			; AC 00 0D | Load from absolute address into Y register
	STA				  ; 9F 00 BF 00 | Store accumulator to absolute long,X
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	LDY #$A1			 ; A0 A1 | Load immediate value into Y register
	LDX #$A3			 ; A2 A3 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0C4
; Address: $E5AD6C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0C4:
	LDX #$A3			 ; A2 A3 | Load immediate value into X register
	DEY				  ; 88 | Decrement Y register
	LDA ($4E,X)		  ; A1 4E | Load from (zero page,X) into accumulator
	JMP $4814			; 4C 14 48 | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $EC			  ; 80 EC | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	STA $DF00,Y		  ; 99 00 DF | Store accumulator to absolute,Y
	EOR $2CED			; 4D ED 2C | Exclusive OR with accumulator (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDY $FF09,X		  ; BC 09 FF | Load from absolute,X into Y register
	SBC $F700,X		  ; FD 00 F7 | Subtract with carry (absolute,X)
	STY $18			  ; 84 18 | Store Y register to zero page
	ROR $99			  ; 66 99 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0C5
; Address: $E5ADC8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0C5:
	JSR $1292			; 20 92 12 | Jump to subroutine
	CMP ($55,X)		  ; C1 55 | Compare accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	WDM #$B5			 ; 42 B5 | Reserved instruction
	INC				  ; 1A | Increment accumulator
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC $663E			; CE 3E 66 | Decrement (absolute)
	DEC $FBDB,X		  ; DE DB FB | Decrement (absolute,X)
	ROR $016E			; 6E 6E 01 | Rotate right (absolute)
	ASL $1E01			; 0E 01 1E | Arithmetic shift left (absolute)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ORA ($B8,X)		  ; 01 B8 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0C6
; Address: $E5ADFD
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0C6:
	JSR $0091			; 20 91 00 | Jump to subroutine
	WDM #$5B			 ; 42 5B | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR #$52			 ; 49 52 | Exclusive OR with accumulator (immediate)
	ORA #$52			 ; 09 52 | Logical OR with accumulator (immediate)
	ORA #$5B			 ; 09 5B | Logical OR with accumulator (immediate)
	AND $2D72			; 2D 72 2D | Logical AND with accumulator (absolute)
	JMP ($6C00)		  ; 6C 00 6C | Jump to address (absolute indirect)
	ORA ($6D,X)		  ; 01 6D | Logical OR with accumulator ((zero page,X))
	EOR ($49,X)		  ; 41 49 | Exclusive OR with accumulator ((zero page,X))
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	EOR #$6D			 ; 49 6D | Exclusive OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $2501			; 6D 01 25 | Add with carry (absolute)
	EOR #$24			 ; 49 24 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0C7
; Address: $E5AE35
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0C7:
	EOR #$24			 ; 49 24 | Exclusive OR with accumulator (immediate)
	ADC $49B6			; 6D B6 49 | Add with carry (absolute)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ROL $3713			; 2E 13 37 | Rotate left (absolute)
	CMP ($37),Y		  ; D1 37 | Compare accumulator ((zero page),Y)
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	LSR $5FCE			; 4E CE 5F | Logical shift right (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ADC ($59),Y		  ; 71 59 | Add with carry ((zero page),Y)
	BRA $28			  ; 80 28 | Branch always
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BRA $87			  ; 80 87 | Branch always
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	DEY				  ; 88 | Decrement Y register
	STZ $AF00,X		  ; 9E 00 AF | Store zero to absolute,X
	LSR $CD12,X		  ; 5E 12 CD | Logical shift right (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	CMP $B696			; CD 96 B6 | Compare accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	AND ($C6),Y		  ; 31 C6 | Logical AND with accumulator ((zero page),Y)
	CPY $86			  ; C4 86 | Compare Y register (zero page)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	INC $6A01,X		  ; FE 01 6A | Increment (absolute,X)
	ORA ($39,X)		  ; 01 39 | Logical OR with accumulator ((zero page,X))
	ORA $FE00,X		  ; 1D 00 FE | Logical OR with accumulator (absolute,X)
	ORA ($7A,X)		  ; 01 7A | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BMI $FF			  ; 30 FF | Branch if negative
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0CB
; Address: $E5AEAF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0CB:
	JSR $00B5			; 20 B5 00 | Jump to subroutine
	STA ($0A),Y		  ; 91 0A | Store accumulator to (zero page),Y
	CMP ($04),Y		  ; D1 04 | Compare accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	STX $1140			; 8E 40 11 | Store X register to absolute address
	DEC $449B			; CE 9B 44 | Decrement (absolute)
	LDA ($A1,X)		  ; A1 A1 | Load from (zero page,X) into accumulator
	LDX #$A2			 ; A2 A2 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0CC
; Address: $E5AEC8
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0CC:
	LDA ($A1,X)		  ; A1 A1 | Load from (zero page,X) into accumulator
	LDA ($A1,X)		  ; A1 A1 | Load from (zero page,X) into accumulator
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	LDA ($A1,X)		  ; A1 A1 | Load from (zero page,X) into accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	BCC $F8			  ; 90 F8 | Branch if carry clear
	DEC $E72E			; CE 2E E7 | Decrement (absolute)
	CLV				  ; B8 | Clear overflow flag
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $273F			; 0D 3F 27 | Logical OR with accumulator (absolute)
	CMP $C63D			; CD 3D C6 | Compare accumulator (absolute)
	ROL $5FB1,X		  ; 3E B1 5F | Rotate left (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	BVS $82			  ; 70 82 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0CD
; Address: $E5AF18
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0CD:
	STA ($60,X)		  ; 81 60 | Store accumulator to (zero page,X)
	BRA $60			  ; 80 60 | Branch always
	BRA $38			  ; 80 38 | Branch always
	BRA $1F			  ; 80 1F | Branch always
	BCC $70			  ; 90 70 | Branch if carry clear
	CPX $FEF4			; EC F4 FE | Compare X register (absolute)
	PLX				  ; FA | Pull X register from stack
	STA $D49E,X		  ; 9D 9E D4 | Store accumulator to absolute,X
	ROR $AAFB,X		  ; 7E FB AA | Rotate right (absolute,X)
	SBC $CE			  ; E5 CE | Subtract with carry (zero page)
	AND $F000,Y		  ; 39 00 F0 | Logical AND with accumulator (absolute,Y)
	ASL $61			  ; 06 61 | Arithmetic shift left (zero page)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($BE,X)		  ; 01 BE | Logical OR with accumulator ((zero page,X))
	SBC $00FF			; ED FF 00 | Subtract with carry (absolute)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0CE
; Address: $E5AF66
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0CE:
	WDM #$00			 ; 42 00 | Reserved instruction
	ADC #$02			 ; 69 02 | Add with carry (immediate)
	STA $C66F,X		  ; 9D 6F C6 | Store accumulator to absolute,X
	LDX $00BE,Y		  ; BE BE 00 | Load from absolute,Y into X register
	WDM #$04			 ; 42 04 | Reserved instruction
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	BCS $28			  ; B0 28 | Branch if carry set
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	JMP ($33F8)		  ; 6C F8 33 | Jump to address (absolute indirect)
	DEC $3FF8			; CE F8 3F | Decrement (absolute)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ROL $832E			; 2E 2E 83 | Rotate left (absolute)
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0CF
; Address: $E5AFC2
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0CF:
	JSR $0020			; 20 20 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 40 FF 00 | Store accumulator to absolute long,X
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BCC $2F			  ; 90 2F | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BCC $90			  ; 90 90 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0D1
; Address: $E5B019
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0D1:
	BMI $FB			  ; 30 FB | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BCS $37			  ; B0 37 | Branch if carry set
	LDY $CE3C,X		  ; BC 3C CE | Load from absolute,X into Y register
	LSR $68FB			; 4E FB 68 | Logical shift right (absolute)
	SBC $7D2C,X		  ; FD 2C 7D | Subtract with carry (absolute,X)
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	ASL $C801			; 0E 01 C8 | Arithmetic shift left (absolute)
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	ROL $FDE1,X		  ; 3E E1 FD | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $6A			  ; 05 6A | Logical OR with accumulator (zero page)
	ORA ($52),Y		  ; 11 52 | Logical OR with accumulator ((zero page),Y)
	EOR #$34			 ; 49 34 | Exclusive OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BMI $0C			  ; 30 0C | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0D2
; Address: $E5B04F
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0D2:
	BCC $1F			  ; 90 1F | Branch if carry clear
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	LDA				  ; BF 00 FE 00 | Load from absolute long,X into accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	ROR $DB6E			; 6E 6E DB | Rotate right (absolute)
	ROR $DE			  ; 66 DE | Rotate right (zero page)
	ASL $EBFE			; 0E FE EB | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ASL $91			  ; 06 91 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0D3
; Address: $E5B073
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0D3:
	JSR $B801			; 20 01 B8 | Jump to subroutine
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	PEA #$9E01		   ; F4 01 9E | Push effective address to stack
	ASL $1C01			; 0E 01 1C | Arithmetic shift left (absolute)
	DEC $E7BE,X		  ; DE BE E7 | Decrement (absolute,X)
	CPX $D9B5			; EC B5 D9 | Compare X register (absolute)
	CMP $8DF6,Y		  ; D9 F6 8D | Compare accumulator (absolute,Y)
	LDA ($40,X)		  ; A1 40 | Load from (zero page,X) into accumulator
	CLC				  ; 18 | Clear carry flag
	CPX #$13			 ; E0 13 | Compare X register (immediate)
	CPX #$66			 ; E0 66 | Compare X register (immediate)
	BRA $18			  ; 80 18 | Branch always
	CPX #$2D			 ; E0 2D | Compare X register (immediate)
	BNE $4F			  ; D0 4F | Branch if not equal
	BRA $3F			  ; 80 3F | Branch always
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	INC $0044			; EE 44 00 | Increment (absolute)
	WDM #$00			 ; 42 00 | Reserved instruction
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0D4
; Address: $E5B0C4
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0D4:
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $3211,Y		  ; 19 11 32 | Logical OR with accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($6F,X)		  ; 41 6F | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	BMI $08			  ; 30 08 | Branch if negative
	BVS $10			  ; 70 10 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0D5
; Address: $E5B0FE
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0D5:
	BPL $60			  ; 10 60 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	BMI $50			  ; 30 50 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	INY				  ; C8 | Increment Y register
	BIT $62E4			; 2C E4 62 | Test bits in accumulator (absolute)
	INC $FAEE			; EE EE FA | Increment (absolute)
	DEX				  ; CA | Decrement X register
	INC $8000,X		  ; FE 00 80 | Increment (absolute,X)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVS $20			  ; 70 20 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	BPL $0C			  ; 10 0C | Branch if positive
	BPL $0E			  ; 10 0E | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)
	STA				  ; 9F FF 4E 7F | Store accumulator to absolute long,X
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX $03			  ; E4 03 | Compare X register (zero page)
	BPL $0F			  ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0D6
; Address: $E5B13D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0D6:
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $67			  ; 10 67 | Branch if positive
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	ORA $233F,Y		  ; 19 3F 23 | Logical OR with accumulator (absolute,Y)
	ASL $111E			; 0E 1E 11 | Arithmetic shift left (absolute)
	ORA $6040,Y		  ; 19 40 60 | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0DA
; Address: $E5B17B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0DA:
	BMI $21			  ; 30 21 | PPU graphics register access
	BMI $26			  ; 30 26 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BCC $F4			  ; 90 F4 | Branch if carry clear
	BMI $F4			  ; 30 F4 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0DB
; Address: $E5B185
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0DB:
	CPX $D0			  ; E4 D0 | Compare X register (zero page)
	BCS $B4			  ; B0 B4 | Branch if carry set
	CPX $EC			  ; E4 EC | Compare X register (zero page)
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $1A			  ; 06 1A | Arithmetic shift left (zero page)
	ASL $2A			  ; 06 2A | Arithmetic shift left (zero page)
	ASL $4A			  ; 06 4A | Arithmetic shift left (zero page)
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	STZ $1C			  ; 64 1C | Store zero to zero page
	LDA $6BBF			; AD BF 6B | Load from absolute address into accumulator
	ORA ($EF),Y		  ; 11 EF | Logical OR with accumulator ((zero page),Y)
	STA $2B62,X		  ; 9D 62 2B | Store accumulator to absolute,X
	RTI				  ; 40 | Return from interrupt
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	LDY $FE00,X		  ; BC 00 FE | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0DD
; Address: $E5B1BB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0DD:
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDX $D3D3,Y		  ; BE D3 D3 | Load from absolute,Y into X register
	ROR $08FF			; 6E FF 08 | Rotate right (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0DE
; Address: $E5B1D0
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0DE:
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	ROR $BBFF,X		  ; 7E FF BB | Rotate right (absolute,X)
	JMP $FFFDEF		  ; 5C EF FD FF | Jump to address long
	STA $FFFF,Y		  ; 99 FF FF | Store accumulator to absolute,Y
	LDX $FFFF			; AE FF FF | Load from absolute address into X register
	STA $FDD2FC		  ; 8F FC D2 FD | Store accumulator to absolute long address
	SBC $5FFF,X		  ; FD FF 5F | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $0302			; 0E 02 03 | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	STA ($F6),Y		  ; 91 F6 | Store accumulator to (zero page),Y
	STZ $C0FC			; 9C FC C0 | Store zero to absolute
	LDA				  ; BF C0 BF 11 | Load from absolute long,X into accumulator
	ASL $1F1C,X		  ; 1E 1C 1F | Arithmetic shift left (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0DF
; Address: $E5B242
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0DF:
	JSR $3030			; 20 30 30 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	BMI $08			  ; 30 08 | Branch if negative
	BMI $18			  ; 30 18 | Branch if negative
	BMI $08			  ; 30 08 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	AND $5E02,X		  ; 3D 02 5E | Logical AND with accumulator (absolute,X)
	AND ($BC,X)		  ; 21 BC | Logical AND with accumulator ((zero page,X))
	ROL $DB			  ; 26 DB | Rotate left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY $A658,X		  ; BC 58 A6 | Load from absolute,X into Y register
	EOR $00F2			; 4D F2 00 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0E0
; Address: $E5B292
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0E0:
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $01			  ; 80 01 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	JMP ($1AEC)		  ; 6C EC 1A | Jump to address (absolute indirect)
	LDX $0E0E,Y		  ; BE 0E 0E | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt
	BVC $52			  ; 50 52 | Branch if overflow clear
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	PLB				  ; AB | Pull data bank register from stack
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	LDA $FFA9FF		  ; AF FF A9 FF | Load from absolute long address into accumulator
	ASL $6E			  ; 06 6E | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ADC $65			  ; 65 65 | Add with carry (zero page)
	AND #$6D			 ; 29 6D | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	EOR ($05,X)		  ; 41 05 | Exclusive OR with accumulator ((zero page,X))
	ADC $FF			  ; 65 FF | Add with carry (zero page)
	BRA $FF			  ; 80 FF | Branch always
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	LDA				  ; BF FF 9A FF | Load from absolute long,X into accumulator
	LDX $9AFF,Y		  ; BE FF 9A | Load from absolute,Y into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 9F 7F B2 | Load from absolute long,X into accumulator
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	LDA $FF14DF		  ; AF DF 14 FF | Load from absolute long address into accumulator
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	BIT #$7F			 ; 89 7F | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0E1
; Address: $E5B384
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0E1:
	JSR $4020			; 20 20 40 | Jump to subroutine
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0E2
; Address: $E5B38D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0E2:
	JSR $6020			; 20 20 60 | Jump to subroutine
	BRA $FF			  ; 80 FF | Branch always
	STA $54FF,X		  ; 9D FF 54 | Store accumulator to absolute,X
	STA				  ; 9F FF 90 F0 | Store accumulator to absolute long,X
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0E3
; Address: $E5B3B2
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0E3:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	CPX $4C			  ; E4 4C | Compare X register (zero page)
	PEA #$F860		   ; F4 60 F8 | Push effective address to stack
	LDY $E4			  ; A4 E4 | Load from zero page into Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	STZ $7E24,X		  ; 9E 24 7E | Store zero to absolute,X
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $21			  ; F0 21 | PPU graphics register access
	ROL $2E31,X		  ; 3E 31 2E | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0E4
; Address: $E5B3F0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0E4:
	JSR $20FD			; 20 FD 20 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BIT $7F			  ; 24 7F | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0E5
; Address: $E5B40A
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0E5:
	JSL $540476		  ; 22 76 04 54 | Jump to subroutine long
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	PLB				  ; AB | Pull data bank register from stack
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	ADC #$6D			 ; 69 6D | Add with carry (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ADC $4545			; 6D 45 45 | Add with carry (absolute)
	STZ $64			  ; 64 64 | Store zero to zero page
	ORA $6722			; 0D 22 67 | Logical OR with accumulator (absolute)
	EOR $45			  ; 45 45 | Exclusive OR with accumulator (zero page)
	AND #$69			 ; 29 69 | Logical AND with accumulator (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	TSX				  ; BA | Transfer stack pointer to X register
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	ORA $77			  ; 05 77 | Logical OR with accumulator (zero page)
	ORA ($73,X)		  ; 01 73 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0E6
; Address: $E5B454
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0E6:
	DEY				  ; 88 | Decrement Y register
	STY $83FF			; 8C FF 83 | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	STY $8CFF			; 8C FF 8C | Store Y register to absolute address
	ADC ($F7),Y		  ; 71 F7 | Add with carry ((zero page),Y)
	STX $BF			  ; 86 BF | Store X register to zero page
	LDA $E4			  ; A5 E4 | Load from zero page into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0E7
; Address: $E5B46E
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0E7:
	STZ $66			  ; 64 66 | Store zero to zero page
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	INC				  ; 1A | Increment accumulator
	DEY				  ; 88 | Decrement Y register
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	STA $31FF,Y		  ; 99 FF 31 | Store accumulator to absolute,Y
	PHP				  ; 08 | Push processor status to stack
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BPL $50			  ; 10 50 | Branch if positive
	STX $D6			  ; 86 D6 | Store X register to zero page
	WDM #$46			 ; 42 46 | Reserved instruction
	LDX $ACAC,Y		  ; BE AC AC | Load from absolute,Y into X register
	LDA $FF29FF		  ; AF FF 29 FF | Load from absolute long address into accumulator
	PLB				  ; AB | Pull data bank register from stack
	LDA $F3FF,Y		  ; B9 FF F3 | Load from absolute,Y into accumulator
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	EOR ($45,X)		  ; 41 45 | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ADC $4541			; 6D 41 45 | Add with carry (absolute)
	BIT $64			  ; 24 64 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ROR $6A6A			; 6E 6A 6A | Rotate right (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	TSX				  ; BA | Transfer stack pointer to X register
	LDA				  ; BF FF 91 FF | Load from absolute long,X into accumulator
	DEX				  ; CA | Decrement X register
	PEA #$F3B7		   ; F4 B7 F3 | Push effective address to stack
	SEI				  ; 78 | Set interrupt disable flag
	BMI $43			  ; 30 43 | Branch if negative
	BMI $9A			  ; 30 9A | Branch if negative

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0E8
; Address: $E5B4EF
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0E8:
	SBC $34			  ; E5 34 | Subtract with carry (zero page)
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BRA $4C			  ; 80 4C | Branch always
	BRA $CF			  ; 80 CF | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	STA $00BFC0		  ; 8F C0 BF 00 | Store accumulator to absolute long address
	BCC $6F			  ; 90 6F | Branch if carry clear
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	AND ($0C),Y		  ; 31 0C | Logical AND with accumulator ((zero page),Y)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA $0630			; 0D 30 06 | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $CDD6			; AD D6 CD | Load from absolute address into accumulator
	STY $00			  ; 84 00 | Store Y register to zero page
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	SBC $FEFE,Y		  ; F9 FE FE | Subtract with carry (absolute,Y)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0E9
; Address: $E5B569
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0E9:
	CMP $21DF,X		  ; DD DF 21 | PPU graphics register access
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $88FF,X		  ; FE FF 88 | Increment (absolute,X)
	LDY $F50A,X		  ; BC 0A F5 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0EA
; Address: $E5B58C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0EA:
	JSL $FF00DD		  ; 22 DD 00 FF | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	STZ $64			  ; 64 64 | Store zero to zero page
	STZ $64			  ; 64 64 | Store zero to zero page
	STZ $64			  ; 64 64 | Store zero to zero page
	STZ $64			  ; 64 64 | Store zero to zero page
	INC $E6			  ; E6 E6 | Increment (zero page)
	JMP ($C9EB)		  ; 6C EB C9 | Jump to address (absolute indirect)
	LDA				  ; BF C8 BF E4 | Load from absolute long,X into accumulator
	STZ $9B			  ; 64 9B | Store zero to zero page
	STZ $9B			  ; 64 9B | Store zero to zero page
	STZ $9B			  ; 64 9B | Store zero to zero page
	STZ $9B			  ; 64 9B | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0EC
; Address: $E5B5C4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0EC:
	CLV				  ; B8 | Clear overflow flag
	LDA				  ; BF EC 6F 98 | Load from absolute long,X into accumulator
	BCC $1F			  ; 90 1F | Branch if carry clear
	LDY $BF3F,X		  ; BC 3F BF | Load from absolute,X into Y register
	BPL $E0			  ; 10 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BRA $90			  ; 80 90 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0ED
; Address: $E5B601
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0ED:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $C6			  ; 84 C6 | Store Y register to zero page
	STY $C6			  ; 84 C6 | Store Y register to zero page
	STY $DFCE			; 8C CE DF | Store Y register to absolute address
	STA				  ; 9F ED B2 C4 | Store accumulator to absolute long,X
	BNE $96			  ; D0 96 | Branch if not equal
	REP #$95			 ; C2 95 | Reset processor status bits
	CMP ($3B,X)		  ; C1 3B | Compare accumulator ((zero page,X))
	SBC $F93B,Y		  ; F9 3B F9 | Subtract with carry (absolute,Y)
	SBC $FF20,Y		  ; F9 20 FF | Subtract with carry (absolute,Y)
	SBC $FA2B,Y		  ; F9 2B FA | Subtract with carry (absolute,Y)
	STA ($53),Y		  ; 91 53 | Store accumulator to (zero page),Y
	STA ($53),Y		  ; 91 53 | Store accumulator to (zero page),Y
	STA ($53),Y		  ; 91 53 | Store accumulator to (zero page),Y
	SBC $67FB,Y		  ; F9 FB 67 | Subtract with carry (absolute,Y)
	STA $2B03,X		  ; 9D 03 2B | Store accumulator to absolute,X
	EOR ($6B,X)		  ; 41 6B | Exclusive OR with accumulator ((zero page,X))
	EOR ($6B,X)		  ; 41 6B | Exclusive OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag
	DEC $FD			  ; C6 FD | Decrement (zero page)
	SBC $BBEF,X		  ; FD EF BB | Subtract with carry (absolute,X)
	AND $EFDC,X		  ; 3D DC EF | Logical AND with accumulator (absolute,X)
	ROL $FEC9,X		  ; 3E C9 FE | Rotate left (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	LDX $7E41,Y		  ; BE 41 7E | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0EE
; Address: $E5B685
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0EE:
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	STA $B37F,X		  ; 9D 7F B3 | Store accumulator to absolute,X
	ADC $FED7,X		  ; 7D D7 FE | Add with carry (absolute,X)
	STA $003E,Y		  ; 99 3E 00 | Store accumulator to absolute,Y
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $00FF			; 2C FF 00 | Test bits in accumulator (absolute)
	ADC $7C83,X		  ; 7D 83 7C | Add with carry (absolute,X)
	STA $6B1F,X		  ; 9D 1F 6B | Store accumulator to absolute,X
	ADC $CF3C,X		  ; 7D 3C CF | Add with carry (absolute,X)
	ROR $FF89,X		  ; 7E 89 FF | Rotate right (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	SBC $FD3B,Y		  ; F9 3B FD | Subtract with carry (absolute,Y)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $FD66,X		  ; FD 66 FD | Subtract with carry (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $3D31,Y		  ; 19 31 3D | Logical OR with accumulator (absolute,Y)
	ASL $1E18,X		  ; 1E 18 1E | Arithmetic shift left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	AND ($40,X)		  ; 21 40 | Logical AND with accumulator ((zero page,X))
	ORA ($60,X)		  ; 01 60 | Logical OR with accumulator ((zero page,X))
	BPL $20			  ; 10 20 | Branch if positive
	ASL $CA			  ; 06 CA | Arithmetic shift left (zero page)
	PEA #$F810		   ; F4 10 F8 | Push effective address to stack
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BRA $78			  ; 80 78 | Branch always
	BRA $40			  ; 80 40 | Branch always
	ASL $0C10			; 0E 10 0C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $04			  ; 80 04 | Branch always
	BCS $3C			  ; B0 3C | Branch if carry set
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BCC $6B			  ; 90 6B | Branch if carry clear
	STY $6F			  ; 84 6F | Store Y register to zero page
	BNE $7F			  ; D0 7F | Branch if not equal
	ADC #$36			 ; 69 36 | Add with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0EF
; Address: $E5B72E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0EF:
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	EOR $4000			; 4D 00 40 | Exclusive OR with accumulator (absolute)
	ROR $F100			; 6E 00 F1 | Rotate right (absolute)
	LDX $FE63,Y		  ; BE 63 FE | Load from absolute,Y into X register
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0F0
; Address: $E5B748
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0F0:
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	ROL $06D4			; 2E D4 06 | Rotate left (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	BVC $FF			  ; 50 FF | Branch if overflow clear
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	LDX $FF00,Y		  ; BE 00 FF | Load from absolute,Y into X register
	LDX $982F			; AE 2F 98 | Load from absolute address into X register
	STA $737106		  ; 8F 06 71 73 | Store accumulator to absolute long address
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $78			  ; 80 78 | Branch always
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	STY $00FF			; 8C FF 00 | Store Y register to absolute address
	LDY $79C3,X		  ; BC C3 79 | Load from absolute,X into Y register
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$9F			 ; C0 9F | Compare Y register (immediate)
	NOP				  ; EA | No operation
	CPY #$D9			 ; C0 D9 | Compare Y register (immediate)
	STA $D4			  ; 85 D4 | Store accumulator to zero page
	BIT #$DC			 ; 89 DC | Test bits in accumulator (immediate)
	STA ($C4,X)		  ; 81 C4 | Store accumulator to (zero page,X)
	STA				  ; 9F DF 2B FB | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0F1
; Address: $E5B7B2
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0F1:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	ROL $3AE3,X		  ; 3E E3 3A | Rotate left (absolute,X)
	ROL $20E3,X		  ; 3E E3 20 | Rotate left (absolute,X)
	EOR ($43,X)		  ; 41 43 | Exclusive OR with accumulator ((zero page,X))
	SBC $57FB,Y		  ; F9 FB 57 | Subtract with carry (absolute,Y)
	LDA $2B03			; AD 03 2B | Load from absolute address into accumulator
	EOR ($7B),Y		  ; 51 7B | Exclusive OR with accumulator ((zero page),Y)
	EOR ($7B),Y		  ; 51 7B | Exclusive OR with accumulator ((zero page),Y)
	EOR ($7B),Y		  ; 51 7B | Exclusive OR with accumulator ((zero page),Y)
	SBC $28FB,Y		  ; F9 FB 28 | Subtract with carry (absolute,Y)
	LDA				  ; BF 04 FF 00 | Load from absolute long,X into accumulator
	LDY $E8C7,X		  ; BC C7 E8 | Load from absolute,X into Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDX $D967,Y		  ; BE 67 D9 | Load from absolute,Y into X register
	BPL $28			  ; 10 28 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ROR $2C08,X		  ; 7E 08 2C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROR $2C81,X		  ; 7E 81 2C | Rotate right (absolute,X)
	INC $3DC3,X		  ; FE C3 3D | Increment (absolute,X)
	CPX $DF92			; EC 92 DF | Compare X register (absolute)
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0F2
; Address: $E5B817
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0F2:
	JSR $28D7			; 20 D7 28 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	ADC $7F80			; 6D 80 7F | Add with carry (absolute)
	ROR $79A7,X		  ; 7E A7 79 | Rotate right (absolute,X)
	LDA				  ; BF 78 D7 7B | Load from absolute long,X into accumulator
	STA $FB77			; 8D 77 FB | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	PLY				  ; 7A | Pull Y register from stack
	ASL $0DFD,X		  ; 1E FD 0D | Arithmetic shift left (absolute,X)
	INC $FCC3,X		  ; FE C3 FC | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVC $1F			  ; 50 1F | Branch if overflow clear
	ADC $7032			; 6D 32 70 | Add with carry (absolute)
	CMP #$79			 ; C9 79 | Compare accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0F3
; Address: $E5B8B2
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0F3:
	EOR $4000			; 4D 00 40 | Exclusive OR with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	STX $00			  ; 86 00 | Store X register to zero page
	WDM #$F8			 ; 42 F8 | Reserved instruction
	STY $BE07			; 8C 07 BE | Store Y register to absolute address
	LDX $FE1D,Y		  ; BE 1D FE | Load from absolute,Y into X register
	ASL $B8			  ; 06 B8 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	LDX $0000,Y		  ; BE 00 00 | Load from absolute,Y into X register
	BIT $8A			  ; 24 8A | Test bits in accumulator (zero page)
	LDA $4A20			; AD 20 4A | Load from absolute address into accumulator
	LDX #$90			 ; A2 90 | Load immediate value into X register
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	LDA $F9F1A9		  ; AF A9 F1 F9 | Load from absolute long address into accumulator
	BCS $F8			  ; B0 F8 | Branch if carry set
	CPY $E4			  ; C4 E4 | Compare Y register (zero page)
	BPL $80			  ; 10 80 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BVC $00			  ; 50 00 | Branch if overflow clear
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0F4
; Address: $E5B916
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0F4:
	ORA $6100,Y		  ; 19 00 61 | Logical OR with accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	ORA ($73,X)		  ; 01 73 | Logical OR with accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $83			  ; 70 83 | Branch if overflow set
	STY $8CFF			; 8C FF 8C | Store Y register to absolute address
	STA $8CFF			; 8D FF 8C | Store accumulator to absolute address
	DEY				  ; 88 | Decrement Y register
	STA $FF8FFF		  ; 8F FF 8F FF | Store accumulator to absolute long address
	ORA $521C,X		  ; 1D 1C 52 | Logical OR with accumulator (absolute,X)
	BIT $72			  ; 24 72 | Test bits in accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $4D			  ; 45 4D | Exclusive OR with accumulator (zero page)
	LDX $00FF,Y		  ; BE FF 00 | Load from absolute,Y into X register
	SEP #$FF			 ; E2 FF | Set processor status bits
	DEY				  ; 88 | Decrement Y register
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	LDX #$FD			 ; A2 FD | Load immediate value into X register
	BNE $D8			  ; D0 D8 | Branch if not equal
	CMP $CC94			; CD 94 CC | Compare accumulator (absolute)
	CPY $FFBF			; CC BF FF | Compare Y register (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SEP #$2B			 ; E2 2B | Set processor status bits
	ROL				  ; 2A | Rotate left (accumulator)
	BRA $FF			  ; 80 FF | Branch always
	AND $DF			  ; 25 DF | Logical AND with accumulator (zero page)
	AND ($1B,X)		  ; 21 1B | Logical AND with accumulator ((zero page,X))
	AND ($3B,X)		  ; 21 3B | Logical AND with accumulator ((zero page,X))
	AND ($3B,X)		  ; 21 3B | Logical AND with accumulator ((zero page,X))
	SBC $03FB,Y		  ; F9 FB 03 | Subtract with carry (absolute,Y)
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	AND $047B,Y		  ; 39 7B 04 | Logical AND with accumulator (absolute,Y)
	STX $08			  ; 86 08 | Store X register to zero page
	REP #$FF			 ; C2 FF | Reset processor status bits
	CMP $007B			; CD 7B 00 | Compare accumulator (absolute)
	STX $79			  ; 86 79 | Store X register to zero page
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $CD			  ; 10 CD | Branch if positive
	STZ $16BF			; 9C BF 16 | Store zero to absolute
	BIT $10AD			; 2C AD 10 | Test bits in accumulator (absolute)
	BRA $FF			  ; 80 FF | Branch always
	PLP				  ; 28 | Pull processor status from stack
	LDA				  ; BF 00 D7 28 | Load from absolute long,X into accumulator
	LDA $D352			; AD 52 D3 | Load from absolute address into accumulator
	BIT $00FF			; 2C FF 00 | Test bits in accumulator (absolute)
	CMP $7FDD,X		  ; DD DD 7F | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0F5
; Address: $E5B9E4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0F5:
	TAX				  ; AA | Transfer accumulator to X register
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	PHA				  ; 48 | Push accumulator to stack
	CPY #$E2			 ; C0 E2 | Compare Y register (immediate)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0F6
; Address: $E5B9F0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0F6:
	JSL $1C001C		  ; 22 1C 00 1C | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0F7
; Address: $E5B9F8
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0F7:
	JSL $631441		  ; 22 41 14 63 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BVS $76			  ; 70 76 | Branch if overflow set
	BVS $FA			  ; 70 FA | Branch if overflow set
	LDY #$2A			 ; A0 2A | Load immediate value into Y register
	BEQ $A2			  ; F0 A2 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	INC				  ; 1A | Increment accumulator
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHY				  ; 5A | Push Y register to stack
	BIT #$70			 ; 89 70 | Test bits in accumulator (immediate)
	ORA $70			  ; 05 70 | Logical OR with accumulator (zero page)
	BVC $25			  ; 50 25 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	AND $A1			  ; 25 A1 | Logical AND with accumulator (zero page)
	STY $19			  ; 84 19 | Store Y register to zero page
	BIT #$20			 ; 89 20 | Test bits in accumulator (immediate)
	STA $8000			; 8D 00 80 | Store accumulator to absolute address
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $E0			  ; 80 E0 | Game work RAM access
	LDY #$70			 ; A0 70 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0FA
; Address: $E5BA32
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0FA:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0FB
; Address: $E5BA3C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0FB:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $0043			; AD 43 00 | Load from absolute address into accumulator
	BPL $00			  ; 10 00 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	ORA $FB			  ; 05 FB | Logical OR with accumulator (zero page)
	SBC ($E7,X)		  ; E1 E7 | Subtract with carry ((zero page,X))
	SBC $FDF9,Y		  ; F9 F9 FD | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0FC
; Address: $E5BA88
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0FC:
	SBC ($E0,X)		  ; E1 E0 | Game work RAM access
	AND $0DF8,Y		  ; 39 F8 0D | Logical AND with accumulator (absolute,Y)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_0FD
; Address: $E5BAA0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_0FD:
	JSR $03FF			; 20 FF 03 | Jump to subroutine
	BPL $FF			  ; 10 FF | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CMP $FF			  ; C5 FF | Compare accumulator (zero page)
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	CMP $3A			  ; C5 3A | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_100
; Address: $E5BADE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_100:
	PHB				  ; 8B | Push data bank register to stack
	CMP $ABDD			; CD DD AB | Compare accumulator (absolute)
	PLB				  ; AB | Pull data bank register from stack
	ROL $C0BE,X		  ; 3E BE C0 | Rotate left (absolute,X)
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	CMP ($92,X)		  ; C1 92 | Compare accumulator ((zero page,X))
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_102
; Address: $E5BAF6
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_102:
	JSL $300E1C		  ; 22 1C 0E 30 | Jump to subroutine long
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	JMP $58A7A3		  ; 5C A3 A7 58 | Jump to address long
	BPL $52			  ; 10 52 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	TXA				  ; 8A | Transfer X register to accumulator
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	ASL $0606			; 0E 06 06 | Arithmetic shift left (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	AND $50			  ; 25 50 | Logical AND with accumulator (zero page)
	AND $04			  ; 25 04 | Logical AND with accumulator (zero page)
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	ADC ($B8),Y		  ; 71 B8 | Add with carry ((zero page),Y)
	EOR ($C4,X)		  ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
	ORA ($B6,X)		  ; 01 B6 | Logical OR with accumulator ((zero page,X))
	ORA #$48			 ; 09 48 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	BRA $20			  ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_103
; Address: $E5BB28
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_103:
	SBC ($80),Y		  ; F1 80 | Subtract with carry ((zero page),Y)
	SBC ($22),Y		  ; F1 22 | Subtract with carry ((zero page),Y)
	LDA $A5F090		  ; AF 90 F0 A5 | Load from absolute long address into accumulator
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_104
; Address: $E5BB34
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_104:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	PHY				  ; 5A | Push Y register to stack
	BRA $81			  ; 80 81 | Branch always
	ORA ($BE,X)		  ; 01 BE | Logical OR with accumulator ((zero page,X))
	ORA ($BE,X)		  ; 01 BE | Logical OR with accumulator ((zero page,X))
	LDA $BB00,X		  ; BD 00 BB | Load from absolute,X into accumulator
	ORA ($CC,X)		  ; 01 CC | Logical OR with accumulator ((zero page,X))
	INC $CB00,X		  ; FE 00 CB | Increment (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	LDA				  ; BF 00 00 FF | Load from absolute long,X into accumulator
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	AND $9EC3,X		  ; 3D C3 9E | Logical AND with accumulator (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $FECF,X		  ; FE CF FE | Increment (absolute,X)
	INC $FCFD,X		  ; FE FD FC | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($60),Y		  ; F1 60 | Subtract with carry ((zero page),Y)
	STX $CECE			; 8E CE CE | Store X register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	SBC ($92,X)		  ; E1 92 | Subtract with carry ((zero page,X))
	BRA $8A			  ; 80 8A | Branch always
	SBC $3DFF,Y		  ; F9 FF 3D | Subtract with carry (absolute,Y)
	LSR $FE8D,X		  ; 5E 8D FE | Logical shift right (absolute,X)
	DEC $46BD			; CE BD 46 | Decrement (absolute)
	LDA $7300,X		  ; BD 00 73 | Load from absolute,X into accumulator
	BRA $FF			  ; 80 FF | Branch always
	BRA $80			  ; 80 80 | Branch always
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	LDA $D9FF			; AD FF D9 | Load from absolute address into accumulator
	ROR $FA			  ; 66 FA | Rotate right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	BRA $40			  ; 80 40 | Branch always
	DEC $FF20,X		  ; DE 20 FF | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_106
; Address: $E5BBE2
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_106:
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)
	ROR $27FE,X		  ; 7E FE 27 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BVC $C7			  ; 50 C7 | Branch if overflow clear
	WDM #$CF			 ; 42 CF | Reserved instruction
	BEQ $EF			  ; F0 EF | Branch if equal
	STA $38D743		  ; 8F 43 D7 38 | Store accumulator to absolute long address
	BPL $FF			  ; 10 FF | Branch if positive
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	BNE $FF			  ; D0 FF | Branch if not equal
	BVS $FF			  ; 70 FF | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	STZ $E7			  ; 64 E7 | Store zero to zero page
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_107
; Address: $E5BC24
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_107:
	JSR $C1FC			; 20 FC C1 | Jump to subroutine
	SBC $F393,Y		  ; F9 93 F3 | Subtract with carry (absolute,Y)
	SBC $FF			  ; E5 FF | Subtract with carry (zero page)
	INC $FF18,X		  ; FE 18 FF | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FE98,X		  ; FE 98 FE | Increment (absolute,X)
	INC $FEF0,X		  ; FE F0 FE | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	INC $7D80,X		  ; FE 80 7D | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDX $1A3F,Y		  ; BE 3F 1A | Load from absolute,Y into X register
	ROL $3F			  ; 26 3F | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_108
; Address: $E5BC6C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_108:
	JSL $BE1E7F		  ; 22 7F 1E BE | Jump to subroutine long
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BIT $B8			  ; 24 B8 | Test bits in accumulator (zero page)
	ROR $FEF2,X		  ; 7E F2 FE | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_109
; Address: $E5BC89
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_109:
	ROR $9E94,X		  ; 7E 94 9E | Rotate right (absolute,X)
	ORA $40FF,X		  ; 1D FF 40 | Logical OR with accumulator (absolute,X)
	ADC $FF47,X		  ; 7D 47 FF | Add with carry (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	ROL $B8FF,X		  ; 3E FF B8 | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $FFFD,X		  ; FE FD FF | Increment (absolute,X)
	BEQ $FE			  ; F0 FE | Branch if equal
	ROR				  ; 6A | Rotate right (accumulator)
	INC $CEC8			; EE C8 CE | Increment (absolute)
	STZ $FDCC,X		  ; 9E CC FD | Store zero to absolute,X
	ROL $FF01,X		  ; 3E 01 FF | Rotate left (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	LDA				  ; BF E6 E6 56 | Load from absolute long,X into accumulator
	LDX $A4AE			; AE AE A4 | Load from absolute address into X register
	LDY $84			  ; A4 84 | Load from zero page into Y register
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	LDY $A4			  ; A4 A4 | Load from zero page into Y register
	BIT $40			  ; 24 40 | Test bits in accumulator (zero page)
	ORA $A966,Y		  ; 19 66 A9 | Logical OR with accumulator (absolute,Y)
	EOR ($0E),Y		  ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	BCC $B8			  ; 90 B8 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_10A
; Address: $E5BD10
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_10A:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	SEI				  ; 78 | Set interrupt disable flag
	CPY $1EE8			; CC E8 1E | Compare Y register (absolute)
	INC				  ; 1A | Increment accumulator
	SEP #$1D			 ; E2 1D | Set processor status bits
	ORA #$5A			 ; 09 5A | Logical OR with accumulator (immediate)
	LDX $04			  ; A6 04 | Load from zero page into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($DA,X)		  ; A1 DA | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_10B
; Address: $E5BD42
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_10B:
	SBC #$DA			 ; E9 DA | Subtract with carry (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	LSR $233D			; 4E 3D 23 | Logical shift right (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	LDX $DD			  ; A6 DD | Load from zero page into X register
	STZ $DF			  ; 64 DF | Store zero to zero page
	ADC $5E			  ; 65 5E | Add with carry (zero page)
	STY $FF			  ; 84 FF | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	STY $FF			  ; 84 FF | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	LDY $F4F2,X		  ; BC F2 F4 | Load from absolute,X into Y register
	EOR ($DF,X)		  ; 41 DF | Exclusive OR with accumulator ((zero page,X))
	STZ $FA			  ; 64 FA | Store zero to zero page
	PLX				  ; FA | Pull X register from stack
	EOR $01D3			; 4D D3 01 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_10C
; Address: $E5BD74
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_10C:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_10D
; Address: $E5BD7E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_10D:
	JSR $46FF			; 20 FF 46 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $C6			  ; 26 C6 | Rotate left (zero page)
	CPX $93			  ; E4 93 | Compare X register (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_10E
; Address: $E5BD8A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_10E:
	TAX				  ; AA | Transfer accumulator to X register
	STZ $9B			  ; 64 9B | Store zero to zero page
	LDA $FFF0,Y		  ; B9 F0 FF | Load from absolute,Y into accumulator
	SBC $FBFF,Y		  ; F9 FF FB | Subtract with carry (absolute,Y)
	LDA ($D8,X)		  ; A1 D8 | Load from (zero page,X) into accumulator
	SBC ($19),Y		  ; F1 19 | Subtract with carry ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	JMP ($01CE)		  ; 6C CE 01 | Jump to address (absolute indirect)
	EOR #$A8			 ; 49 A8 | Exclusive OR with accumulator (immediate)
	CPY #$D5			 ; C0 D5 | Compare Y register (immediate)
	SEP #$7F			 ; E2 7F | Set processor status bits
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	JMP $1DC0			; 4C C0 1D | Jump to address
	STY $78			  ; 84 78 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_10F
; Address: $E5BDC6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_10F:
	JSL $876CFF		  ; 22 FF 6C 87 | Jump to subroutine long
	LDY #$4E			 ; A0 4E | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	LDA $FF3FF6		  ; AF F6 3F FF | Load from absolute long address into accumulator
	ADC ($E4),Y		  ; 71 E4 | Add with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_110
; Address: $E5BDE8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_110:
	EOR ($80),Y		  ; 51 80 | Exclusive OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	STA $FF1FFF		  ; 8F FF 1F FF | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_111
; Address: $E5BE00
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_111:
	ROR				  ; 6A | Rotate right (accumulator)
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	CLC				  ; 18 | Clear carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	PLY				  ; 7A | Pull Y register from stack
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA $FF			  ; 85 FF | Store accumulator to zero page
	CLV				  ; B8 | Clear overflow flag
	CPX #$4D			 ; E0 4D | Compare X register (immediate)
	INC $F83B,X		  ; FE 3B F8 | Increment (absolute,X)
	BPL $F8			  ; 10 F8 | Branch if positive
	ADC $FD78,Y		  ; 79 78 FD | Add with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	DEC $2F			  ; C6 2F | Decrement (zero page)
	ADC $8488,Y		  ; 79 88 84 | Add with carry (absolute,Y)
	STY $48			  ; 84 48 | Store Y register to zero page
	BRA $79			  ; 80 79 | Branch always
	ASL $50			  ; 06 50 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	BEQ $FF			  ; F0 FF | Branch if equal
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	INC $7FBB,X		  ; FE BB 7F | Increment (absolute,X)
	STA $779A83		  ; 8F 83 9A 77 | Store accumulator to absolute long address
	DEY				  ; 88 | Decrement Y register
	SEC				  ; 38 | Set carry flag
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)
	STA $7DFF,Y		  ; 99 FF 7D | Store accumulator to absolute,Y
	STY $24			  ; 84 24 | Store Y register to zero page
	BIT $A4			  ; 24 A4 | Test bits in accumulator (zero page)
	BIT $A4			  ; 24 A4 | Test bits in accumulator (zero page)
	LDX $862E			; AE 2E 86 | Load from absolute address into X register
	ASL $27			  ; 06 27 | Arithmetic shift left (zero page)
	ORA $85			  ; 05 85 | Logical OR with accumulator (zero page)
	STX $86			  ; 86 86 | Store X register to zero page
	EOR ($06),Y		  ; 51 06 | Exclusive OR with accumulator ((zero page),Y)
	ADC $5806,Y		  ; 79 06 58 | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	ORA $79			  ; 05 79 | Logical OR with accumulator (zero page)
	EOR $7867			; 4D 67 78 | Exclusive OR with accumulator (absolute)
	LDA ($B7),Y		  ; B1 B7 | Load from (zero page),Y into accumulator
	SBC $42EF			; ED EF 42 | Hardware register operation
	SEC				  ; 38 | Set carry flag
	AND $0080,Y		  ; 39 80 00 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_112
; Address: $E5BEB2
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_112:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	BRA $C0			  ; 80 C0 | Branch always
	BPL $E8			  ; 10 E8 | Branch if positive
	LDY $C640,X		  ; BC 40 C6 | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack
	LDY $CD50			; AC 50 CD | Load from absolute address into Y register
	AND $7DB9,X		  ; 3D B9 7D | Logical AND with accumulator (absolute,X)
	CMP $BBDD,X		  ; DD DD BB | Compare accumulator (absolute,X)
	LDA				  ; BF BF 36 36 | Load from absolute long,X into accumulator
	JMP $00035C		  ; 5C 5C 03 00 | Jump to address long
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	BVC $E1			  ; 50 E1 | Branch if overflow clear
	PHX				  ; DA | Push X register to stack
	CLD				  ; D8 | Clear decimal mode flag
	ADC #$5A			 ; 69 5A | Add with carry (immediate)
	LSR $8BFD			; 4E FD 8B | Logical shift right (absolute)
	PLX				  ; FA | Pull X register from stack
	BIT #$FA			 ; 89 FA | Test bits in accumulator (immediate)
	SBC #$DA			 ; E9 DA | Subtract with carry (immediate)
	STY $FF			  ; 84 FF | Store Y register to zero page
	SBC $F8F3			; ED F3 F8 | Subtract with carry (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	INC $73			  ; E6 73 | Increment (zero page)
	DEC $5B			  ; C6 5B | Decrement (zero page)
	EOR $F8C3			; 4D C3 F8 | Exclusive OR with accumulator (absolute)
	LDX #$BE			 ; A2 BE | Load immediate value into X register
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_113
; Address: $E5BF18
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_113:
	JSR $30FF			; 20 FF 30 | Jump to subroutine
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)
	ORA $5460,X		  ; 1D 60 54 | Logical OR with accumulator (absolute,X)
	STY $00			  ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_114
; Address: $E5BF4A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_114:
	JSR $0408			; 20 08 04 | Jump to subroutine
	CPY #$82			 ; C0 82 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	CPX $FF00			; EC 00 FF | Compare X register (absolute)
	ROR $2E7F,X		  ; 7E 7F 2E | Rotate right (absolute,X)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	INC $06			  ; E6 06 | Increment (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_115
; Address: $E5BF74
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_115:
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SBC $DCFF,Y		  ; F9 FF DC | Subtract with carry (absolute,Y)
	BRA $FF			  ; 80 FF | Branch always
	SBC #$FC			 ; E9 FC | Subtract with carry (immediate)
	INC				  ; 1A | Increment accumulator
	ROL $FE2A,X		  ; 3E 2A FE | Rotate left (absolute,X)
	INC $9495,X		  ; FE 95 94 | Increment (absolute,X)
	ADC $047A,Y		  ; 79 7A 04 | Add with carry (absolute,Y)
	SBC $FC1D,X		  ; FD 1D FC | Subtract with carry (absolute,X)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_116
; Address: $E5BFA0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_116:
	BIT $30			  ; 24 30 | Test bits in accumulator (zero page)
	BRA $38			  ; 80 38 | Branch always
	BVC $7E			  ; 50 7E | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag
	ORA $247F,X		  ; 1D 7F 24 | Logical OR with accumulator (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_117
; Address: $E5BFC0
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_117:
	JSR $F020			; 20 20 F0 | Jump to subroutine
	INC $FEF2,X		  ; FE F2 FE | Increment (absolute,X)
	JMP ($C4FE)		  ; 6C FE C4 | Jump to address (absolute indirect)
	INC $FE1A,X		  ; FE 1A FE | Increment (absolute,X)
	INC $7C5C,X		  ; FE 5C 7C | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LSR $8F			  ; 46 8F | Logical shift right (zero page)
	AND $84C8,Y		  ; 39 C8 84 | Logical AND with accumulator (absolute,Y)
	CPX $08			  ; E4 08 | Compare X register (zero page)
	BEQ $DD			  ; F0 DD | Branch if equal
	INC $CFB8,X		  ; FE B8 CF | Increment (absolute,X)
	SBC $FFFD,X		  ; FD FD FF | Subtract with carry (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	AND $2439,Y		  ; 39 39 24 | Logical AND with accumulator (absolute,Y)
	AND $32			  ; 25 32 | Logical AND with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ASL $2E			  ; 06 2E | Arithmetic shift left (zero page)
	BIT $2D			  ; 24 2D | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_118
; Address: $E5C010
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_118:
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	PHY				  ; 5A | Push Y register to stack
	BIT $0C			  ; 24 0C | Test bits in accumulator (zero page)
	BMI $36			  ; 30 36 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	ROL $663E,X		  ; 3E 3E 66 | Rotate left (absolute,X)
	ROR $94			  ; 66 94 | Rotate right (zero page)
	CPY $A4CC			; CC CC A4 | Compare Y register (absolute)
	LDY $04			  ; A4 04 | Load from zero page into Y register
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	LDY $A4			  ; A4 A4 | Load from zero page into Y register
	BIT $C1			  ; 24 C1 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_119
; Address: $E5C031
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_119:
	JSL $686698		  ; 22 98 66 68 | Jump to subroutine long
	BMI $CC			  ; 30 CC | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	STY $D8			  ; 84 D8 | Store Y register to zero page
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $4C7F,Y		  ; 79 7F 4C | Add with carry (absolute,Y)
	BIT #$FB			 ; 89 FB | Test bits in accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	EOR #$49			 ; 49 49 | Exclusive OR with accumulator (immediate)
	BVC $50			  ; 50 50 | Branch if overflow clear
	STY $FF			  ; 84 FF | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	LDA #$F9			 ; A9 F9 | Load immediate value into accumulator
	BVS $70			  ; 70 70 | Branch if overflow set
	AND ($73,X)		  ; 21 73 | Logical AND with accumulator ((zero page,X))
	INC $52FF			; EE FF 52 | Increment (absolute)
	DEC $7779,X		  ; DE 79 77 | Decrement (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	LDY $FF			  ; A4 FF | Load from zero page into Y register
	INX				  ; E8 | Increment X register
	PHB				  ; 8B | Push data bank register to stack
	STA				  ; 9F 06 0E D0 | Store accumulator to absolute long,X
	BRA $3F			  ; 80 3F | Branch always
	STA				  ; 9F 6F AF 58 | Store accumulator to absolute long,X
	STA				  ; 9F AF 6F 34 | Store accumulator to absolute long,X
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $FF			  ; D0 FF | Branch if not equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_11A
; Address: $E5C09A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_11A:
	BCC $FF			  ; 90 FF | Branch if carry clear
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	TXS				  ; 9A | Transfer X register to stack pointer
	INC $FCA0,X		  ; FE A0 FC | Increment (absolute,X)
	CMP ($F8,X)		  ; C1 F8 | Compare accumulator ((zero page,X))
	BCC $F0			  ; 90 F0 | Branch if carry clear
	ROL $D9EE			; 2E EE D9 | Rotate left (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP #$9A			 ; C9 9A | Compare accumulator (immediate)
	STA $FF01,Y		  ; 99 01 FF | Store accumulator to absolute,Y
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	AND $242E			; 2D 2E 24 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_11B
; Address: $E5C0C4
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_11B:
	JSL $080228		  ; 22 28 02 08 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	ROR				  ; 6A | Rotate right (accumulator)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	EOR $8400			; 4D 00 84 | Exclusive OR with accumulator (absolute)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	LDY $24			  ; A4 24 | Load from zero page into Y register
	LDY $AC			  ; A4 AC | Load from zero page into Y register
	BIT $0484			; 2C 84 04 | Test bits in accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $04			  ; 50 04 | Branch if overflow clear
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	AND #$54			 ; 29 54 | Logical AND with accumulator (immediate)
	BMI $70			  ; 30 70 | Branch if negative
	BRA $70			  ; 80 70 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	LDY $F60A,X		  ; BC 0A F6 | Load from absolute,X into Y register
	STA ($FE),Y		  ; 91 FE | Store accumulator to (zero page),Y
	BEQ $00			  ; F0 00 | Branch if equal
	INC $0E01,X		  ; FE 01 0E | Increment (absolute,X)
	ORA ($31),Y		  ; 11 31 | Logical OR with accumulator ((zero page),Y)
	AND $333D			; 2D 3D 33 | Logical AND with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LSR $4201			; 4E 01 42 | Hardware register operation
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $0001			; 0E 01 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_11C
; Address: $E5C162
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_11C:
	ADC ($79),Y		  ; 71 79 | Add with carry ((zero page),Y)
	SBC $28F9,Y		  ; F9 F9 28 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	EOR #$86			 ; 49 86 | Exclusive OR with accumulator (immediate)
	ADC ($06,X)		  ; 61 06 | Add with carry ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BPL $E8			  ; 10 E8 | Branch if positive
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	BCC $B8			  ; 90 B8 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDY $365C			; AC 5C 36 | Load from absolute address into Y register
	DEC $1EE8			; CE E8 1E | Decrement (absolute)
	INC				  ; 1A | Increment accumulator
	SEP #$1D			 ; E2 1D | Set processor status bits
	ORA #$5A			 ; 09 5A | Logical OR with accumulator (immediate)
	LDX $00			  ; A6 00 | Load from zero page into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	ROL $347F,X		  ; 3E 7F 34 | Rotate left (absolute,X)
	EOR $7C			  ; 45 7C | Exclusive OR with accumulator (zero page)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $FE9A,X		  ; FE 9A FE | Increment (absolute,X)
	SBC $F0FF,X		  ; FD FF F0 | Subtract with carry (absolute,X)
	INC $FF41,X		  ; FE 41 FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	INC $017E,X		  ; FE 7E 01 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_11D
; Address: $E5C201
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_11D:
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	LDY $28DF			; AC DF 28 | Load from absolute address into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDY $CC50			; AC 50 CC | Load from absolute address into Y register
	AND $79B9,X		  ; 3D B9 79 | Logical AND with accumulator (absolute,X)
	SBC ($EF,X)		  ; E1 EF | Subtract with carry ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	JMP ($0392)		  ; 6C 92 03 | Jump to address (absolute indirect)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$2D			 ; E0 2D | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_11E
; Address: $E5C243
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_11E:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	LSR $86			  ; 46 86 | Logical shift right (zero page)
	LDY $2640,X		  ; BC 40 26 | Load from absolute,X into Y register
	INY				  ; C8 | Increment Y register
	CPX $FF1F			; EC 1F FF | Compare X register (absolute)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	ORA ($D3,X)		  ; 01 D3 | Logical OR with accumulator ((zero page,X))
	CMP ($B8,X)		  ; C1 B8 | Compare accumulator ((zero page,X))
	REP #$03			 ; C2 03 | Reset processor status bits
	LDX $EE81			; AE 81 EE | Load from absolute address into X register
	ORA $7FA1,Y		  ; 19 A1 7F | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_11F
; Address: $E5C280
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_11F:
	JSR $80FF			; 20 FF 80 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	STA				  ; 9F 14 1C 00 | Store accumulator to absolute long,X
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	AND $8DBF,X		  ; 3D BF 8D | Logical AND with accumulator (absolute,X)
	LDA				  ; BF 76 6E A9 | Load from absolute long,X into accumulator
	BEQ $8C			  ; F0 8C | Branch if equal
	CMP $2026,Y		  ; D9 26 20 | Compare accumulator (absolute,Y)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_120
; Address: $E5C2D8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_120:
	JSR $10DF			; 20 DF 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	AND $25			  ; 25 25 | Logical AND with accumulator (zero page)
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_121
; Address: $E5C2E6
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_121:
	TSX				  ; BA | Transfer stack pointer to X register
	STA $FCCB			; 8D CB FC | Store accumulator to absolute address
	INC $8337,X		  ; FE 37 83 | Increment (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	PLA				  ; 68 | Pull accumulator from stack
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	ORA $2BB1,X		  ; 1D B1 2B | Logical OR with accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	DEX				  ; CA | Decrement X register
	AND ($BB),Y		  ; 31 BB | Logical AND with accumulator ((zero page),Y)
	ADC $01			  ; 65 01 | Add with carry (zero page)
	ROR $4E41,X		  ; 7E 41 4E | Rotate right (absolute,X)
	STZ $0966			; 9C 66 09 | Store zero to absolute
	BMI $25			  ; 30 25 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDA				  ; BF D9 A6 C7 | Load from absolute long,X into accumulator
	CLV				  ; B8 | Clear overflow flag
	LDY $A3DC			; AC DC A3 | Load from absolute address into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SBC $35CB,X		  ; FD CB 35 | Subtract with carry (absolute,X)
	SBC $E3			  ; E5 E3 | Subtract with carry (zero page)
	ORA $E51B,X		  ; 1D 1B E5 | Logical OR with accumulator (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	SBC ($E5,X)		  ; E1 E5 | Subtract with carry ((zero page,X))
	CMP #$FB			 ; C9 FB | Compare accumulator (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	STZ $7D1E			; 9C 1E 7D | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_122
; Address: $E5C36E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_122:
	LDY $BE			  ; A4 BE | Load from zero page into Y register
	TXS				  ; 9A | Transfer X register to stack pointer
	RTI				  ; 40 | Return from interrupt
	STY $7F			  ; 84 7F | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CMP $AA			  ; C5 AA | Compare accumulator (zero page)
	INC $5465			; EE 65 54 | Increment (absolute)
	DEY				  ; 88 | Decrement Y register
	LDY $E815			; AC 15 E8 | Load from absolute address into Y register
	PHA				  ; 48 | Push accumulator to stack
	BVS $8D			  ; 70 8D | Branch if overflow set
	BIT #$3A			 ; 89 3A | Test bits in accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_123
; Address: $E5C394
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_123:
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	PLB				  ; AB | Pull data bank register from stack
	BRA $2C			  ; 80 2C | Branch always
	BVC $4F			  ; 50 4F | Branch if overflow clear
	BPL $2F			  ; 10 2F | Branch if positive
	BRA $9F			  ; 80 9F | Branch always
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	LDA				  ; BF C0 40 7F | Load from absolute long,X into accumulator
	LDX $71DF,Y		  ; BE DF 71 | Load from absolute,Y into X register
	ADC $3810,Y		  ; 79 10 38 | Add with carry (absolute,Y)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	STX $FF			  ; 86 FF | Store X register to zero page
	BEQ $F2			  ; F0 F2 | Branch if equal
	CPX $04			  ; E4 04 | Compare X register (zero page)
	BIT #$09			 ; 89 09 | Test bits in accumulator (immediate)
	STA $7E7E8F		  ; 8F 8F 7E 7E | Store accumulator to absolute long address
	INC $02FE,X		  ; FE FE 02 | Increment (absolute,X)
	SBC $FB04,X		  ; FD 04 FB | Subtract with carry (absolute,X)
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	CPY $FC03			; CC 03 FC | Compare Y register (absolute)
	STA $817E70		  ; 8F 70 7E 81 | Store accumulator to absolute long address
	INC $AA01,X		  ; FE 01 AA | Increment (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	INC $FEBE,X		  ; FE BE FE | Increment (absolute,X)
	LDX $BEFE,Y		  ; BE FE BE | Load from absolute,Y into X register
	INC $3E7E,X		  ; FE 7E 3E | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_124
; Address: $E5C3EF
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_124:
	JSR $7FC0			; 20 C0 7F | Jump to subroutine
	BRA $7F			  ; 80 7F | Branch always
	ORA $1CE3,X		  ; 1D E3 1C | Logical OR with accumulator (absolute,X)
	STZ $80E3			; 9C E3 80 | Store zero to absolute
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	SBC $F3F9,Y		  ; F9 F9 F3 | Subtract with carry (absolute,Y)
	ROR $FE7E,X		  ; 7E 7E FE | Rotate right (absolute,X)
	INC $F906,X		  ; FE 06 F9 | Increment (absolute,X)
	SBC $F306,Y		  ; F9 06 F3 | Subtract with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$7E			 ; E0 7E | Compare X register (immediate)
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	BVS $D8			  ; 70 D8 | Branch if overflow set
	CPY #$A1			 ; C0 A1 | Compare Y register (immediate)
	STA ($C7,X)		  ; 81 C7 | Store accumulator to (zero page,X)
	LSR $381E,X		  ; 5E 1E 38 | Logical shift right (absolute,X)
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BVS $8F			  ; 70 8F | Branch if overflow set
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_125
; Address: $E5C437
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_125:
	SEI				  ; 78 | Set interrupt disable flag
	ASL $38E1,X		  ; 1E E1 38 | Arithmetic shift left (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	INX				  ; E8 | Increment X register
	DEX				  ; CA | Decrement X register
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	LDY $02BD,X		  ; BC BD 02 | Load from absolute,X into Y register
	ROL $BCE6,X		  ; 3E E6 BC | Rotate left (absolute,X)
	LDA $3C			  ; A5 3C | Load from zero page into accumulator
	ROR $BC98,X		  ; 7E 98 BC | Rotate right (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	PHY				  ; 5A | Push Y register to stack
	REP #$7F			 ; C2 7F | Reset processor status bits
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	LDA $7F7FAF		  ; AF AF 7F 7F | Load from absolute long address into accumulator
	RTI				  ; 40 | Return from interrupt
	CPY #$9D			 ; C0 9D | Compare Y register (immediate)
	INC $3F36			; EE 36 3F | Increment (absolute)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	LDA $807F50		  ; AF 50 7F 80 | Load from absolute long address into accumulator
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	ROR $F97E,X		  ; 7E 7E F9 | Rotate right (absolute,X)
	SBC $8E8E,Y		  ; F9 8E 8E | Subtract with carry (absolute,Y)
	AND $FB38,Y		  ; 39 38 FB | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$7E			 ; C0 7E | Compare Y register (immediate)
	STA ($F9,X)		  ; 81 F9 | Store accumulator to (zero page,X)
	ASL $8E			  ; 06 8E | Arithmetic shift left (zero page)
	ADC ($38),Y		  ; 71 38 | Add with carry ((zero page),Y)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	STA $FCFC8F		  ; 8F 8F FC FC | Store accumulator to absolute long address
	STA				  ; 9F 1F 3C 3C | Store accumulator to absolute long,X
	BEQ $0F			  ; F0 0F | Branch if equal
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	STA $03FC70		  ; 8F 70 FC 03 | Store accumulator to absolute long address
	LDY $F00F,X		  ; BC 0F F0 | Load from absolute,X into Y register
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $11			  ; 10 11 | Branch if positive
	ORA $F3			  ; 05 F3 | Logical OR with accumulator (zero page)
	LDA $527C,X		  ; BD 7C 52 | Load from absolute,X into accumulator
	AND ($33),Y		  ; 31 33 | Logical AND with accumulator ((zero page),Y)
	ORA $7608			; 0D 08 76 | Logical OR with accumulator (absolute)
	INC $0CA2			; EE A2 0C | Increment (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_126
; Address: $E5C4D8
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_126:
	DEC $F280			; CE 80 F2 | Decrement (absolute)
	CPY #$89			 ; C0 89 | Compare Y register (immediate)
	BRA $6D			  ; 80 6D | Branch always
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BVC $E0			  ; 50 E0 | Game work RAM access
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	AND ($F9,X)		  ; 21 F9 | Logical AND with accumulator ((zero page,X))
	ADC $A4BE,Y		  ; 79 BE A4 | Add with carry (absolute,Y)
	INY				  ; C8 | Increment Y register
	ASL $645A,X		  ; 1E 5A 64 | Arithmetic shift left (absolute,X)
	ORA $16F7			; 0D F7 16 | Logical OR with accumulator (absolute)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BNE $00			  ; D0 00 | Branch if not equal
	STA				  ; 9F 01 E9 12 | Store accumulator to absolute long,X
	BIT $61			  ; 24 61 | Test bits in accumulator (zero page)
	PHY				  ; 5A | Push Y register to stack
	INC $FB15,X		  ; FE 15 FB | Increment (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA ($81),Y		  ; B1 81 | Load from (zero page),Y into accumulator
	AND #$28			 ; 29 28 | Logical AND with accumulator (immediate)
	STA				  ; 9F 00 27 00 | Store accumulator to absolute long,X
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	BIT $D2D7			; 2C D7 D2 | Test bits in accumulator (absolute)
	LDX $BC			  ; A6 BC | Load from zero page into X register
	ROR $08F1			; 6E F1 08 | Rotate right (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	NOP				  ; EA | No operation
	STA $DE			  ; 85 DE | Store accumulator to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_127
; Address: $E5C52B
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_127:
	LDX $2553,Y		  ; BE 53 25 | Load from absolute,Y into X register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	STA $015501		  ; 8F 01 55 01 | Store accumulator to absolute long address
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	INC $F700,X		  ; FE 00 F7 | Increment (absolute,X)
	ROR $C6			  ; 66 C6 | Rotate right (zero page)
	JMP $610C			; 4C 0C 61 | Jump to address
	CMP ($2D,X)		  ; C1 2D | Compare accumulator ((zero page,X))
	ADC ($1B,X)		  ; 61 1B | Add with carry ((zero page,X))
	INC $54			  ; E6 54 | Increment (zero page)
	STZ $06			  ; 64 06 | Store zero to zero page
	AND $738C,Y		  ; 39 8C 73 | Logical AND with accumulator (absolute,Y)
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	STA ($9E,X)		  ; 81 9E | Store accumulator to (zero page,X)
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_128
; Address: $E5C55E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_128:
	STY $1B			  ; 84 1B | Store Y register to zero page
	ROL				  ; 2A | Rotate left (accumulator)
	CLD				  ; D8 | Clear decimal mode flag
	DEC $B6			  ; C6 B6 | Decrement (zero page)
	PHB				  ; 8B | Push data bank register to stack
	STY $68			  ; 84 68 | Store Y register to zero page
	ASL $8B			  ; 06 8B | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	SEP #$EE			 ; E2 EE | Set processor status bits

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_129
; Address: $E5C570
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_129:
	JSR $C1DC			; 20 DC C1 | Jump to subroutine
	ROL $7C80,X		  ; 3E 80 7C | Rotate left (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($ED),Y		  ; 11 ED | Logical OR with accumulator ((zero page),Y)
	SBC ($18,X)		  ; E1 18 | Subtract with carry ((zero page,X))
	CMP $AA			  ; C5 AA | Compare accumulator (zero page)
	INC $F445			; EE 45 F4 | Increment (absolute)
	ADC #$92			 ; 69 92 | Add with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	ADC $E100,Y		  ; 79 00 E1 | Add with carry (absolute,Y)
	STY $3A0C			; 8C 0C 3A | Store Y register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	LDY #$0C			 ; A0 0C | Load immediate value into Y register
	BPL $EF			  ; 10 EF | Branch if positive
	LDA $10AD			; AD AD 10 | Load from absolute address into accumulator
	DEC				  ; 3A | Decrement accumulator
	SBC $18C7			; ED C7 18 | Subtract with carry (absolute)
	CMP $6330			; CD 30 63 | Compare accumulator (absolute)
	BPL $C4			  ; 10 C4 | Branch if positive
	CPY #$52			 ; C0 52 | Compare Y register (immediate)
	BIT $E2			  ; 24 E2 | Test bits in accumulator (zero page)
	BPL $C7			  ; 10 C7 | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_12A
; Address: $E5C5B6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_12A:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	BPL $EF			  ; 10 EF | Branch if positive
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STA ($A1,X)		  ; 81 A1 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_12B
; Address: $E5C5C8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_12B:
	JSR $9100			; 20 00 91 | Jump to subroutine
	CMP ($86,X)		  ; C1 86 | Compare accumulator ((zero page,X))
	LDX $09			  ; A6 09 | Load from zero page into X register
	PHA				  ; 48 | Push accumulator to stack
	EOR ($2E),Y		  ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	LSR $39			  ; 46 39 | Logical shift right (zero page)
	DEY				  ; 88 | Decrement Y register
	CMP $B5C5,Y		  ; D9 C5 B5 | Compare accumulator (absolute,Y)
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	AND $23			  ; 25 23 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_12C
; Address: $E5C5E8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_12C:
	CLI				  ; 58 | Clear interrupt disable flag
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	STA ($15),Y		  ; 91 15 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_12D
; Address: $E5C5EE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_12D:
	JSR $C222			; 20 22 C2 | Jump to subroutine
	BRA $7E			  ; 80 7E | Branch always
	STA $79			  ; 85 79 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_12E
; Address: $E5C5F6
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_12E:
	JSR $43DE			; 20 DE 43 | Jump to subroutine
	LDA $F804,X		  ; BD 04 F8 | Load from absolute,X into accumulator
	CPX $DE21			; EC 21 DE | Compare X register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA ($3B),Y		  ; B1 3B | Load from (zero page),Y into accumulator
	BPL $B5			  ; 10 B5 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BEQ $36			  ; F0 36 | Branch if equal
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BMI $E5			  ; 30 E5 | Branch if negative
	CPY #$4A			 ; C0 4A | Compare Y register (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	STA $1C5C8F		  ; 8F 8F 5C 1C | Store accumulator to absolute long address
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	STA $139205		  ; 8F 05 92 13 | Store accumulator to absolute long address
	LDY #$AD			 ; A0 AD | Load immediate value into Y register
	BEQ $0F			  ; F0 0F | Branch if equal
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	STA $E31C70		  ; 8F 70 1C E3 | Store accumulator to absolute long address
	PLX				  ; FA | Pull X register from stack
	CPX $52			  ; E4 52 | Compare X register (zero page)
	PHY				  ; 5A | Push Y register to stack
	BVC $61			  ; 50 61 | Branch if overflow clear
	LDY $A7EC			; AC EC A7 | Load from absolute address into Y register
	ADC $5F4C			; 6D 4C 5F | Add with carry (absolute)
	INX				  ; E8 | Increment X register
	EOR $7A			  ; 45 7A | Exclusive OR with accumulator (zero page)
	LDA ($AF,X)		  ; A1 AF | Load from (zero page,X) into accumulator
	BRA $BF			  ; 80 BF | Branch always
	BIT $2353			; 2C 53 23 | Test bits in accumulator (absolute)
	JMP $87F38C		  ; 5C 8C F3 87 | Jump to address long
	SED				  ; F8 | Set decimal mode flag
	BRA $7F			  ; 80 7F | Branch always
	PEA #$0E62		   ; F4 62 0E | Push effective address to stack
	SBC #$4B			 ; E9 4B | Subtract with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_12F
; Address: $E5C66A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_12F:
	PLY				  ; 7A | Pull Y register from stack
	ROR $DE			  ; 66 DE | Rotate right (zero page)
	SBC $FD01,Y		  ; F9 01 FD | Subtract with carry (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_130
; Address: $E5C678
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_130:
	PLP				  ; 28 | Pull processor status from stack
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $5640,X		  ; FE 40 56 | Increment (absolute,X)
	DEX				  ; CA | Decrement X register
	CMP ($5A),Y		  ; D1 5A | Compare accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_131
; Address: $E5C688
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_131:
	LDA $6DF5,X		  ; BD F5 6D | Load from absolute,X into accumulator
	EOR $C6			  ; 45 C6 | Exclusive OR with accumulator (zero page)
	INC $697E			; EE 7E 69 | Increment (absolute)
	LDA #$AF			 ; A9 AF | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_132
; Address: $E5C692
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_132:
	JSR $8A3F			; 20 3F 8A | Jump to subroutine
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $FA			  ; 85 FA | Store accumulator to zero page
	ASL $79			  ; 06 79 | Arithmetic shift left (zero page)
	BRA $7F			  ; 80 7F | Branch always
	STY $AC			  ; 84 AC | Store Y register to zero page
	TAX				  ; AA | Transfer accumulator to X register
	INC $EBF9,X		  ; FE F9 EB | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_133
; Address: $E5C6A8
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_133:
	JSR $CFA2			; 20 A2 CF | Jump to subroutine
	PHX				  ; DA | Push X register to stack
	STA				  ; 9F FF AA AA | Store accumulator to absolute long,X
	ADC $5529,Y		  ; 79 29 55 | Add with carry (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	AND ($DF,X)		  ; 21 DF | Logical AND with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	EOR ($AE),Y		  ; 51 AE | Exclusive OR with accumulator ((zero page),Y)
	INC $30B0,X		  ; FE B0 30 | Increment (absolute,X)
	ROR $88			  ; 66 88 | Rotate right (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	SEC				  ; 38 | Set carry flag
	INC				  ; 1A | Increment accumulator
	SBC $F3DE,X		  ; FD DE F3 | Subtract with carry (absolute,X)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $30			  ; 80 30 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $33			  ; 80 33 | Branch always
	BNE $C0			  ; D0 C0 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	STA $0666,Y		  ; 99 66 06 | Store accumulator to absolute,Y
	LDA $CE0F			; AD 0F CE | Load from absolute address into accumulator
	ORA ($33,X)		  ; 01 33 | Logical OR with accumulator ((zero page,X))
	CPY $3FC0			; CC C0 3F | Compare Y register (absolute)
	ORA ($69,X)		  ; 01 69 | Logical OR with accumulator ((zero page,X))
	INC $FD			  ; E6 FD | Increment (zero page)
	ADC $5F78			; 6D 78 5F | Add with carry (absolute)
	EOR $F667,Y		  ; 59 67 F6 | Exclusive OR with accumulator (absolute,Y)
	LDX $5CAA			; AE AA 5C | Load from absolute address into X register
	BMI $80			  ; 30 80 | Branch if negative
	BRA $7F			  ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_134
; Address: $E5C716
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_134:
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ROR $99			  ; 66 99 | Rotate right (zero page)
	DEC $5A11			; CE 11 5A | Decrement (absolute)
	INC $FF7B,X		  ; FE 7B FF | Increment (absolute,X)
	LDA $257F,Y		  ; B9 7F 25 | Load from absolute,Y into accumulator
	STZ $01D6,X		  ; 9E D6 01 | Store zero to absolute,X
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ADC #$B2			 ; 69 B2 | Add with carry (immediate)
	STX $00			  ; 86 00 | Store X register to zero page
	AND $F339,Y		  ; 39 39 F3 | Logical AND with accumulator (absolute,Y)
	ROR $FE7E,X		  ; 7E 7E FE | Rotate right (absolute,X)
	INC $7D00,X		  ; FE 00 7D | Increment (absolute,X)
	AND $F3C6,Y		  ; 39 C6 F3 | Logical AND with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$7E			 ; E0 7E | Compare X register (immediate)
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY $B0			  ; C4 B0 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	ADC $58			  ; 65 58 | Add with carry (zero page)
	JMP ($ECE6)		  ; 6C E6 EC | Jump to address (absolute indirect)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_135
; Address: $E5C77D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_135:
	STZ $1CE0			; 9C E0 1C | Store zero to absolute
	ROL $BC78,X		  ; 3E 78 BC | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	EOR ($B8),Y		  ; 51 B8 | Exclusive OR with accumulator ((zero page),Y)
	STA $98F0,X		  ; 9D F0 98 | Store accumulator to absolute,X
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	BRA $4C			  ; 80 4C | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	STA $9A			  ; 85 9A | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_136
; Address: $E5C7A8
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_136:
	ADC ($66),Y		  ; 71 66 | Add with carry ((zero page),Y)
	SBC $A2C6,Y		  ; F9 C6 A2 | Subtract with carry (absolute,Y)
	STZ $DEE5			; 9C E5 DE | Store zero to absolute
	RTI				  ; 40 | Return from interrupt
	LDY $7E80,X		  ; BC 80 7E | Load from absolute,X into Y register
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 60 9E C0 | Load from absolute long,X into accumulator
	ROL $7C80,X		  ; 3E 80 7C | Rotate left (absolute,X)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	EOR #$48			 ; 49 48 | Exclusive OR with accumulator (immediate)
	BCC $59			  ; 90 59 | Branch if carry clear
	BVS $6F			  ; 70 6F | Branch if overflow set
	DEC $A3			  ; C6 A3 | Decrement (zero page)
	STZ $DEE5			; 9C E5 DE | Store zero to absolute
	PHA				  ; 48 | Push accumulator to stack
	BCC $6F			  ; 90 6F | Branch if carry clear
	BVC $AF			  ; 50 AF | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_137
; Address: $E5C7D9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_137:
	STA				  ; 9F C0 3E 80 | Store accumulator to absolute long,X
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_138
; Address: $E5C7E7
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_138:
	LDA $ADAD18		  ; AF 18 AD AD | Load from absolute long address into accumulator
	DEC				  ; 3A | Decrement accumulator
	ORA ($89),Y		  ; 11 89 | Logical OR with accumulator ((zero page),Y)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BIT $AD			  ; 24 AD | Test bits in accumulator (zero page)
	LSR $6D			  ; 46 6D | Logical shift right (zero page)
	CMP ($41),Y		  ; D1 41 | Compare accumulator ((zero page),Y)
	ADC $ED			  ; 65 ED | Add with carry (zero page)
	LDA $CADE,X		  ; BD DE CA | Load from absolute,X into accumulator
	ADC #$92			 ; 69 92 | Add with carry (immediate)
	BRA $90			  ; 80 90 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	STA $9A			  ; 85 9A | Store accumulator to zero page
	ADC $E966,Y		  ; 79 66 E9 | Add with carry (absolute,Y)
	INC $B4			  ; E6 B4 | Increment (zero page)
	DEX				  ; CA | Decrement X register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY $7E80,X		  ; BC 80 7E | Load from absolute,X into Y register
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 60 9E E0 | Load from absolute long,X into accumulator
	ASL $4FB0,X		  ; 1E B0 4F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_139
; Address: $E5C83E
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_139:
	INY				  ; C8 | Increment Y register
	DEC $B9C0,X		  ; DE C0 B9 | Decrement (absolute,X)
	BRA $C3			  ; 80 C3 | Branch always
	BRA $44			  ; 80 44 | Branch always
	ORA $7518,Y		  ; 19 18 75 | Logical OR with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	CLC				  ; 18 | Clear carry flag
	PHB				  ; 8B | Push data bank register to stack
	INX				  ; E8 | Increment X register
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($21),Y		  ; 11 21 | PPU graphics register access
	LSR $381E,X		  ; 5E 1E 38 | Logical shift right (absolute,X)
	SEC				  ; 38 | Set carry flag
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ASL $38E1,X		  ; 1E E1 38 | Arithmetic shift left (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	INX				  ; E8 | Increment X register
	RTI				  ; 40 | Return from interrupt
	STY $A2			  ; 84 A2 | Store Y register to zero page
	LDY $E6F5			; AC F5 E6 | Load from absolute address into Y register
	LDX $8EA3,Y		  ; BE A3 8E | Load from absolute,Y into X register
	AND ($0E),Y		  ; 31 0E | Logical AND with accumulator ((zero page),Y)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDX $7C80,Y		  ; BE 80 7C | Load from absolute,Y into X register
	LDY #$5C			 ; A0 5C | Load immediate value into Y register
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	BRA $7F			  ; 80 7F | Branch always
	INC $B16A,X		  ; FE 6A B1 | Increment (absolute,X)
	ADC #$75			 ; 69 75 | Add with carry (immediate)
	CPY $98F8			; CC F8 98 | Compare Y register (absolute)
	ROL $AE			  ; 26 AE | Rotate left (zero page)
	BIT $381E			; 2C 1E 38 | Test bits in accumulator (absolute)
	ORA ($97),Y		  ; 11 97 | Logical OR with accumulator ((zero page),Y)
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))
	ORA ($67,X)		  ; 01 67 | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	CMP $D300,Y		  ; D9 00 D3 | Compare accumulator (absolute,Y)
	EOR ($96,X)		  ; 41 96 | Exclusive OR with accumulator ((zero page,X))
	LSR $3B45			; 4E 45 3B | Logical shift right (absolute)
	STA $A9EB			; 8D EB A9 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_13A
; Address: $E5C8CC
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_13A:
	PLX				  ; FA | Pull X register from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $69			  ; 85 69 | Store accumulator to zero page
	JMP $00B880		  ; 5C 80 B8 00 | Jump to address long
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $070C			; 0D 0C 07 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$C1			 ; E0 C1 | Compare X register (immediate)
	ROL $E3			  ; 26 E3 | Rotate left (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $F0			  ; 10 F0 | Branch if positive
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $F0			  ; 10 F0 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_13B
; Address: $E5C94D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_13B:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_13C
; Address: $E5C95C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_13C:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	BMI $0F			  ; 30 0F | Branch if negative
	BPL $31			  ; 10 31 | Branch if positive
	BIT $6270			; 2C 70 62 | Test bits in accumulator (absolute)
	BNE $C1			  ; D0 C1 | Branch if not equal
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_13D
; Address: $E5C974
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_13D:
	JSR $60DF			; 20 DF 60 | Jump to subroutine
	CPY #$31			 ; C0 31 | Compare Y register (immediate)
	BRA $60			  ; 80 60 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $A9			  ; 80 A9 | Branch always
	PHY				  ; 5A | Push Y register to stack
	CMP $FAAB			; CD AB FA | Compare accumulator (absolute)
	EOR $775C			; 4D 5C 77 | Exclusive OR with accumulator (absolute)
	LDA $2BD8,X		  ; BD D8 2B | Load from absolute,X into accumulator
	LDY $00			  ; A4 00 | Load from zero page into Y register
	BCS $00			  ; B0 00 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	BCC $FF			  ; 90 FF | Branch if carry clear
	LDA ($F7),Y		  ; B1 F7 | Load from (zero page),Y into accumulator
	ADC $F9			  ; 65 F9 | Add with carry (zero page)
	LDA $E35B0D		  ; AF 0D 5B E3 | Load from absolute long address into accumulator
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_13E
; Address: $E5C9B6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_13E:
	RTI				  ; 40 | Return from interrupt
	BRA $3F			  ; 80 3F | Branch always
	CPY $4D35			; CC 35 4D | Compare Y register (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	BIT #$77			 ; 89 77 | Test bits in accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	TSX				  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_140
; Address: $E5C9D8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_140:
	JSR $76DF			; 20 DF 76 | Jump to subroutine
	BIT #$CD			 ; 89 CD | Test bits in accumulator (immediate)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LDA $E11D,Y		  ; B9 1D E1 | Load from absolute,Y into accumulator
	SBC $33			  ; E5 33 | Subtract with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_141
; Address: $E5C9E8
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_141:
	SBC $F37B			; ED 7B F3 | Subtract with carry (absolute)
	LSR $1E52,X		  ; 5E 52 1E | Logical shift right (absolute,X)
	LDA $E1			  ; A5 E1 | Load from zero page into accumulator
	SBC $7B84,Y		  ; F9 84 7B | Subtract with carry (absolute,Y)
	BRA $7F			  ; 80 7F | Branch always
	LDA ($5E,X)		  ; A1 5E | Load from (zero page,X) into accumulator
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	ASL $2B00,X		  ; 1E 00 2B | Arithmetic shift left (absolute,X)
	SBC $3D1D,X		  ; FD 1D 3D | Subtract with carry (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	DEC $C785			; CE 85 C7 | Decrement (absolute)
	DEC $3E			  ; C6 3E | Decrement (zero page)
	CMP $B3			  ; C5 B3 | Compare accumulator (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	ROR $7C02,X		  ; 7E 02 7C | Rotate right (absolute,X)
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	ROL $3A05,X		  ; 3E 05 3A | Rotate left (absolute,X)
	ADC $F449,X		  ; 7D 49 F4 | Add with carry (absolute,X)
	LDA ($FF,X)		  ; A1 FF | Load from (zero page,X) into accumulator
	REP #$F6			 ; C2 F6 | Reset processor status bits
	AND $484F,X		  ; 3D 4F 48 | Logical AND with accumulator (absolute,X)
	STA ($84,X)		  ; 81 84 | Store accumulator to (zero page,X)
	SBC $3F00,Y		  ; F9 00 3F | Subtract with carry (absolute,Y)
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STY $0072			; 8C 72 00 | Store Y register to absolute address
	EOR ($BF,X)		  ; 41 BF | Exclusive OR with accumulator ((zero page,X))
	CMP $3E4A			; CD 4A 3E | Compare accumulator (absolute)
	STA $CB			  ; 85 CB | Store accumulator to zero page
	STA $BD077D		  ; 8F 7D 07 BD | Store accumulator to absolute long address
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	BRA $7E			  ; 80 7E | Branch always
	PHP				  ; 08 | Push processor status to stack
	STY $7B			  ; 84 7B | Store Y register to zero page
	STZ $7DCA,X		  ; 9E CA 7D | Store zero to absolute,X
	BIT $3551			; 2C 51 35 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_142
; Address: $E5CA69
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_142:
	INY				  ; C8 | Increment Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC $8D			  ; E5 8D | Subtract with carry (zero page)
	INC $9E			  ; E6 9E | Increment (zero page)
	BRA $1F			  ; 80 1F | Branch always
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	BRA $7F			  ; 80 7F | Branch always
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	DEC $AC			  ; C6 AC | Decrement (zero page)
	LDX #$76			 ; A2 76 | Load immediate value into X register
	STA ($86),Y		  ; 91 86 | Store accumulator to (zero page),Y
	SBC ($D1),Y		  ; F1 D1 | Subtract with carry ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	PEA #$FB5B		   ; F4 5B FB | Push effective address to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	BPL $EF			  ; 10 EF | Branch if positive
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	TAX				  ; AA | Transfer accumulator to X register
	STY $2D			  ; 84 2D | Store Y register to zero page
	ADC $3A			  ; 65 3A | Add with carry (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	SBC ($18),Y		  ; F1 18 | Subtract with carry ((zero page),Y)
	JMP $3BDFAE		  ; 5C AE DF 3B | Jump to address long
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_143
; Address: $E5CAB0
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_143:
	SEI				  ; 78 | Set interrupt disable flag
	STZ $8403			; 9C 03 84 | Store zero to absolute
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	WDM #$01			 ; 42 01 | Reserved instruction
	STY $00			  ; 84 00 | Store Y register to zero page
	AND ($B3,X)		  ; 21 B3 | Logical AND with accumulator ((zero page,X))
	JMP $9858			; 4C 58 98 | Jump to address
	ROL $AE			  ; 26 AE | Rotate left (zero page)
	BIT $381E			; 2C 1E 38 | Test bits in accumulator (absolute)
	ASL $3CE0,X		  ; 1E E0 3C | Arithmetic shift left (absolute,X)
	CPY #$33			 ; C0 33 | Compare Y register (immediate)
	CPY #$67			 ; C0 67 | Compare Y register (immediate)
	BRA $58			  ; 80 58 | Branch always
	BRA $D9			  ; 80 D9 | Branch always
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	ORA $2E00,X		  ; 1D 00 2E | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $0300,Y		  ; 19 00 03 | Logical OR with accumulator (absolute,Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BRA $04			  ; 80 04 | Branch always
	ASL $84			  ; 06 84 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_144
; Address: $E5CB08
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_144:
	BMI $9F			  ; 30 9F | Branch if negative
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	SBC ($68),Y		  ; F1 68 | Subtract with carry ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	TXA				  ; 8A | Transfer X register to accumulator
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	ROL $01			  ; 26 01 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND ($52),Y		  ; 31 52 | Logical AND with accumulator ((zero page),Y)
	ROL $68			  ; 26 68 | Rotate left (zero page)
	INC $62			  ; E6 62 | Increment (zero page)
	CPX #$5D			 ; E0 5D | Compare X register (immediate)
	DEC $3E15			; CE 15 3E | Decrement (absolute)
	EOR $7800,Y		  ; 59 00 78 | Exclusive OR with accumulator (absolute,Y)
	STA $A600,X		  ; 9D 00 A6 | Store accumulator to absolute,X
	INX				  ; E8 | Increment X register
	PLP				  ; 28 | Pull processor status from stack
	LDY $3D			  ; A4 3D | Load from zero page into Y register
	SBC ($20),Y		  ; F1 20 | Subtract with carry ((zero page),Y)
	INC $BE01			; EE 01 BE | Increment (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	REP #$00			 ; C2 00 | Reset processor status bits
	STX $9F00			; 8E 00 9F | Store X register to absolute address
	LDY #$9C			 ; A0 9C | Load immediate value into Y register
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	BVC $40			  ; 50 40 | Branch if overflow clear
	BVS $68			  ; 70 68 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_146
; Address: $E5CB72
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_146:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	BCS $00			  ; B0 00 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	CLD				  ; D8 | Clear decimal mode flag
	CPY $1300			; CC 00 13 | Compare Y register (absolute)
	ADC #$19			 ; 69 19 | Add with carry (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPX #$47			 ; E0 47 | Compare X register (immediate)
	SBC $5A			  ; E5 5A | Subtract with carry (zero page)
	BNE $3A			  ; D0 3A | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	ASL $166A			; 0E 6A 16 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_147
; Address: $E5CB8F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_147:
	JSL $B60094		  ; 22 94 00 B6 | Jump to subroutine long
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 F7 00 | Load from absolute long,X into accumulator
	AND $0000,X		  ; 3D 00 00 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROL $03			  ; 26 03 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_148
; Address: $E5CBAC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_148:
	ORA ($38),Y		  ; 11 38 | Logical OR with accumulator ((zero page),Y)
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	BIT $C2			  ; 24 C2 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_149
; Address: $E5CBE6
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_149:
	JSL $6214C1		  ; 22 C1 14 62 | Jump to subroutine long
	BPL $2C			  ; 10 2C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CPX $EE00			; EC 00 EE | Compare X register (absolute)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROR $3C00,X		  ; 7E 00 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ADC ($03),Y		  ; 71 03 | Add with carry ((zero page),Y)
	PHX				  ; DA | Push X register to stack
	LSR $1B			  ; 46 1B | Logical shift right (zero page)
	EOR $61			  ; 45 61 | Exclusive OR with accumulator (zero page)
	SBC ($11,X)		  ; E1 11 | Subtract with carry ((zero page,X))
	CMP $9376,Y		  ; D9 76 93 | Compare accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_14A
; Address: $E5CC0D
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_14A:
	LDA $7629,Y		  ; B9 29 76 | Load from absolute,Y into accumulator
	LDA $BA00,Y		  ; B9 00 BA | Load from absolute,Y into accumulator
	STZ $E600,X		  ; 9E 00 E6 | Store zero to absolute,X
	CPX $DF00			; EC 00 DF | Compare X register (absolute)
	DEC $D8			  ; C6 D8 | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	LDA $D27C,X		  ; BD 7C D2 | Load from absolute,X into accumulator
	LDA ($33),Y		  ; B1 33 | Load from (zero page),Y into accumulator
	ORA $F688			; 0D 88 F6 | Logical OR with accumulator (absolute)
	INC $0C00,X		  ; FE 00 0C | Increment (absolute,X)
	LSR $F200			; 4E 00 F2 | Logical shift right (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $5300			; 6D 00 53 | Add with carry (absolute)
	PHY				  ; 5A | Push Y register to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_14B
; Address: $E5CC46
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_14B:
	AND ($FA,X)		  ; 21 FA | Logical AND with accumulator ((zero page,X))
	ADC $A4BE,Y		  ; 79 BE A4 | Add with carry (absolute,Y)
	INY				  ; C8 | Increment Y register
	ASL $655A,X		  ; 1E 5A 65 | Arithmetic shift left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	SBC $0700,Y		  ; F9 00 07 | Subtract with carry (absolute,Y)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BNE $00			  ; D0 00 | Branch if not equal
	STZ $6900,X		  ; 9E 00 69 | Store zero to absolute,X
	LDY $61			  ; A4 61 | Load from zero page into Y register
	PHY				  ; 5A | Push Y register to stack
	INC $FB15,X		  ; FE 15 FB | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_14C
; Address: $E5CC6A
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_14C:
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $1CD9,Y		  ; B9 D9 1C | Load from absolute,Y into accumulator
	ROR $38			  ; 66 38 | Rotate right (zero page)
	STA				  ; 9F 00 27 00 | Store accumulator to absolute long,X
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	LDA $F36A,X		  ; BD 6A F3 | Load from absolute,X into accumulator
	STA $85EE,X		  ; 9D EE 85 | Store accumulator to absolute,X
	DEC $BE60,X		  ; DE 60 BE | Decrement (absolute,X)
	AND $C2			  ; 25 C2 | Logical AND with accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA $8D00			; 0D 00 8D | Logical OR with accumulator (absolute)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	INC $2400,X		  ; FE 00 24 | Increment (absolute,X)
	ORA $271E,Y		  ; 19 1E 27 | Logical OR with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	BVS $2B			  ; 70 2B | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	XBA				  ; EB | Exchange accumulator bytes
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	ASL $B656			; 0E 56 B6 | Arithmetic shift left (absolute)
	NOP				  ; EA | No operation
	ASL $3FCB,X		  ; 1E CB 3F | Arithmetic shift left (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	ADC $E8E8,X		  ; 7D E8 E8 | Add with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BVS $14			  ; 70 14 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	CPX $E0FC			; EC FC E0 | Game work RAM access
	INC $F888,X		  ; FE 88 F8 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_14D
; Address: $E5CCE2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_14D:
	RTI				  ; 40 | Return from interrupt
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	LDY $B1			  ; A4 B1 | Load from zero page into Y register
	SBC #$D3			 ; E9 D3 | Subtract with carry (immediate)
	PHX				  ; DA | Push X register to stack
	DEC $003D			; CE 3D 00 | Decrement (absolute)
	RTI				  ; 40 | Return from interrupt
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC ($A0),Y		  ; F1 A0 | Subtract with carry ((zero page),Y)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	WDM #$BD			 ; 42 BD | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_14E
; Address: $E5CD02
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_14E:
	BCC $00			  ; 90 00 | Branch if carry clear
	BCS $20			  ; B0 20 | Branch if carry set
	BEQ $F8			  ; F0 F8 | Branch if equal
	CMP ($EA),Y		  ; D1 EA | Compare accumulator ((zero page),Y)
	LSR $4D3D			; 4E 3D 4D | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_150
; Address: $E5CD13
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_150:
	BEQ $20			  ; F0 20 | Branch if equal
	BNE $E0			  ; D0 E0 | Game work RAM access
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	DEY				  ; 88 | Decrement Y register
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	CMP ($C7),Y		  ; D1 C7 | Compare accumulator ((zero page),Y)
	STA ($C5,X)		  ; 81 C5 | Store accumulator to (zero page,X)
	CMP $BD93,X		  ; DD 93 BD | Compare accumulator (absolute,X)
	STA $D3			  ; 85 D3 | Store accumulator to zero page
	STA $EF10,Y		  ; 99 10 EF | Store accumulator to absolute,Y
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	EOR #$47			 ; 49 47 | Exclusive OR with accumulator (immediate)
	ORA ($AD),Y		  ; 11 AD | Logical OR with accumulator ((zero page),Y)
	LDA				  ; BF B7 BB 00 | Load from absolute long,X into accumulator
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_151
; Address: $E5CD9C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_151:
	JSL $DD22DD		  ; 22 DD 22 DD | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	ORA $D8FF,X		  ; 1D FF D8 | Logical OR with accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LDA $D0E1,Y		  ; B9 E1 D0 | Load from absolute,Y into accumulator
	BCS $8A			  ; B0 8A | Branch if carry set
	STX $FF00			; 8E 00 FF | Store X register to absolute address
	LDY $FF			  ; A4 FF | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_152
; Address: $E5CDB8
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_152:
	JSR $06FF			; 20 FF 06 | Jump to subroutine
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	DEC $B100,X		  ; DE 00 B1 | Decrement (absolute,X)
	ORA $95F3,Y		  ; 19 F3 95 | Logical OR with accumulator (absolute,Y)
	DEC $B100,X		  ; DE 00 B1 | Decrement (absolute,X)
	ORA $00F3,Y		  ; 19 F3 00 | Logical OR with accumulator (absolute,Y)
	LDA $F992,Y		  ; B9 92 F9 | Load from absolute,Y into accumulator
	SBC $F996,Y		  ; F9 96 F9 | Subtract with carry (absolute,Y)
	LDX $D9			  ; A6 D9 | Load from zero page into X register
	SBC $FBC5,Y		  ; F9 C5 FB | Subtract with carry (absolute,Y)
	LDA $91C3,Y		  ; B9 C3 91 | Load from absolute,Y into accumulator
	CMP $83			  ; C5 83 | Compare accumulator (zero page)
	CMP $9FA3			; CD A3 9F | Compare accumulator (absolute)
	STA $CBE7,Y		  ; 99 E7 CB | Store accumulator to absolute,Y
	SBC $20C7,Y		  ; F9 C7 20 | Subtract with carry (absolute,Y)
	STA $99DB,X		  ; 9D DB 99 | Store accumulator to absolute,X
	STA $89E7,Y		  ; 99 E7 89 | Store accumulator to absolute,Y
	CMP #$AD			 ; C9 AD | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_153
; Address: $E5CE2C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_153:
	LDA $BDC3			; AD C3 BD | Load from absolute address into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	ROL $5A			  ; 26 5A | Rotate left (zero page)
	STA $B9			  ; 85 B9 | Store accumulator to zero page
	STA $B9			  ; 85 B9 | Store accumulator to zero page
	STA $85E7,Y		  ; 99 E7 85 | Store accumulator to absolute,Y
	LDA $C7F9C5		  ; AF C5 F9 C7 | Load from absolute long address into accumulator
	ROL $7E00,X		  ; 3E 00 7E | Rotate left (absolute,X)
	BPL $EF			  ; 10 EF | Branch if positive
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA ($9E),Y		  ; B1 9E | Load from (zero page),Y into accumulator
	AND ($B6),Y		  ; 31 B6 | Logical AND with accumulator ((zero page),Y)
	ADC $19B6,Y		  ; 79 B6 19 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_154
; Address: $E5CE68
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_154:
	JSL $11BB99		  ; 22 99 BB 11 | Jump to subroutine long
	LDA $2D13			; AD 13 2D | Load from absolute address into accumulator
	BNE $FF			  ; D0 FF | Branch if not equal
	SBC $FFFD,X		  ; FD FD FF | Subtract with carry (absolute,X)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	SBC $DBFF,Y		  ; F9 FF DB | Subtract with carry (absolute,Y)
	LDA $D5AFD5		  ; AF D5 AF D5 | Load from absolute long address into accumulator
	LDA #$D3			 ; A9 D3 | Load immediate value into accumulator
	LDA $DB			  ; A5 DB | Load from zero page into accumulator
	STA $FB			  ; 85 FB | Store accumulator to zero page
	STA $D9EF,Y		  ; 99 EF D9 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_155
; Address: $E5CEC0
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_155:
	JSR $1555			; 20 55 15 | Jump to subroutine
	EOR #$05			 ; 49 05 | Exclusive OR with accumulator (immediate)
	ADC ($B9),Y		  ; 71 B9 | Add with carry ((zero page),Y)
	LDA $B9FB,Y		  ; B9 FB B9 | Load from absolute,Y into accumulator
	SBC ($E7,X)		  ; E1 E7 | Subtract with carry ((zero page,X))
	SBC $00C7,Y		  ; F9 C7 00 | Subtract with carry (absolute,Y)
	SBC $83			  ; E5 83 | Subtract with carry (zero page)
	SBC $83			  ; E5 83 | Subtract with carry (zero page)
	STA ($D7,X)		  ; 81 D7 | Store accumulator to (zero page,X)
	LDA ($95),Y		  ; B1 95 | Load from (zero page),Y into accumulator
	STA $E3			  ; 85 E3 | Store accumulator to zero page
	STA $E3			  ; 85 E3 | Store accumulator to zero page
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	JMP $5A33			; 4C 33 5A | Jump to address
	AND ($55),Y		  ; 31 55 | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA $35B3,X		  ; 1D B3 35 | Logical OR with accumulator (absolute,X)
	BCC $FF			  ; 90 FF | Branch if carry clear
	STA				  ; 9F A1 3F F3 | Store accumulator to absolute long,X
	XBA				  ; EB | Exchange accumulator bytes
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_157
; Address: $E5CF34
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_157:
	JSR $E0DF			; 20 DF E0 | Game work RAM access
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_158
; Address: $E5CF41
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_158:
	JSL $5D490A		  ; 22 0A 49 5D | Jump to subroutine long
	ROR $E5			  ; 66 E5 | Rotate right (zero page)
	EOR #$CB			 ; 49 CB | Exclusive OR with accumulator (immediate)
	LDA $D5B3,X		  ; BD B3 D5 | Load from absolute,X into accumulator
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ROL $7708,X		  ; 3E 08 77 | Rotate left (absolute,X)
	STZ $9B			  ; 64 9B | Store zero to zero page
	PHA				  ; 48 | Push accumulator to stack
	BMI $CF			  ; 30 CF | Branch if negative
	SBC $FDFF,X		  ; FD FF FD | Subtract with carry (absolute,X)
	INC $00FF			; EE FF 00 | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	LDA $C3			  ; A5 C3 | Load from zero page into accumulator
	LDA $A5C3			; AD C3 A5 | Load from absolute address into accumulator
	LDA $BFC3			; AD C3 BF | Load from absolute address into accumulator
	LDA $CBC7,Y		  ; B9 C7 CB | Load from absolute,Y into accumulator
	SBC $00C7,Y		  ; F9 C7 00 | Subtract with carry (absolute,Y)
	STA $9F79,X		  ; 9D 79 9F | Store accumulator to absolute,X
	INC $00FF			; EE FF 00 | Increment (absolute)
	STA $55F3,X		  ; 9D F3 55 | Store accumulator to absolute,X
	STA $730F,Y		  ; 99 0F 73 | Store accumulator to absolute,Y
	ADC #$A9			 ; 69 A9 | Add with carry (immediate)
	AND $9F6E,Y		  ; 39 6E 9F | Logical AND with accumulator (absolute,Y)
	ROR $5D95			; 6E 95 5D | Rotate right (absolute)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 60 | Load from absolute long,X into accumulator
	STA				  ; 9F 28 D7 0E | Store accumulator to absolute long,X
	SBC ($04),Y		  ; F1 04 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	BMI $14			  ; 30 14 | Branch if negative
	BVC $26			  ; 50 26 | Branch if overflow clear
	LDY $6A			  ; A4 6A | Load from zero page into Y register
	SBC #$BC			 ; E9 BC | Subtract with carry (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	SEC				  ; 38 | Set carry flag
	BPL $6C			  ; 10 6C | Branch if positive
	BIT $DA			  ; 24 DA | Test bits in accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BMI $CF			  ; 30 CF | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_159
; Address: $E5D044
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_159:
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BNE $EB			  ; D0 EB | Branch if not equal
	ROL $A8E9			; 2E E9 A8 | Rotate left (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STY $2C00			; 8C 00 2C | Store Y register to absolute address
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BCC $9B			  ; 90 9B | Branch if carry clear
	JMP $8DDD			; 4C DD 8D | Jump to address
	ADC ($F9,X)		  ; 61 F9 | Add with carry ((zero page,X))
	LDX #$FB			 ; A2 FB | Load immediate value into X register
	LDX #$00			 ; A2 00 | Load immediate value into X register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BVS $7F			  ; 70 7F | Branch if overflow set
	CMP $DEB2			; CD B2 DE | Compare accumulator (absolute)
	LDA ($4D,X)		  ; A1 4D | Load from (zero page,X) into accumulator
	RTI				  ; 40 | Return from interrupt
	AND $0647,Y		  ; 39 47 06 | Logical AND with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	BMI $1C			  ; 30 1C | Branch if negative
	BMI $1C			  ; 30 1C | Branch if negative
	BMI $1C			  ; 30 1C | Branch if negative

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_15B
; Address: $E5D0AC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_15B:
	JSR $201C			; 20 1C 20 | Jump to subroutine
	ASL $7E			  ; 06 7E | Arithmetic shift left (zero page)
	JMP $247C			; 4C 7C 24 | Jump to address

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_15D
; Address: $E5D0CC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_15D:
	JSR $201C			; 20 1C 20 | Jump to subroutine
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	TXA				  ; 8A | Transfer X register to accumulator
	EOR #$5D			 ; 49 5D | Exclusive OR with accumulator (immediate)
	ROR $E5			  ; 66 E5 | Rotate right (zero page)
	EOR #$CB			 ; 49 CB | Exclusive OR with accumulator (immediate)
	LDA $D5B3,X		  ; BD B3 D5 | Load from absolute,X into accumulator
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	PHP				  ; 08 | Push processor status to stack
	STZ $9B			  ; 64 9B | Store zero to zero page
	PHA				  ; 48 | Push accumulator to stack
	BMI $CF			  ; 30 CF | Branch if negative

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_15E
; Address: $E5D103
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_15E:
	CMP ($DD,X)		  ; C1 DD | Compare accumulator ((zero page,X))
	CMP $C9			  ; C5 C9 | Compare accumulator (zero page)
	LDA $D5B3,X		  ; BD B3 D5 | Load from absolute,X into accumulator
	STA ($10,X)		  ; 81 10 | Store accumulator to (zero page,X)
	PHA				  ; 48 | Push accumulator to stack
	BMI $CF			  ; 30 CF | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	LDX #$7E			 ; A2 7E | Load immediate value into X register
	LSR $7DE2,X		  ; 5E E2 7D | Logical shift right (absolute,X)
	LDX $0041,Y		  ; BE 41 00 | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	BIT #$11			 ; 89 11 | Test bits in accumulator (immediate)
	SBC $C96D			; ED 6D C9 | Subtract with carry (absolute)
	ADC $00D2			; 6D D2 00 | Add with carry (absolute)
	CMP $FE41			; CD 41 FE | Compare accumulator (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY $FF00,X		  ; BC 00 FF | Load from absolute,X into Y register
	LDX $FF00,Y		  ; BE 00 FF | Load from absolute,Y into X register
	LDY $FFBC,X		  ; BC BC FF | Load from absolute,X into Y register
	CMP $FFFF,X		  ; DD FF FF | Compare accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $1F			  ; 66 1F | Rotate right (zero page)
	ROR $753F,X		  ; 7E 3F 75 | Rotate right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	ROR $21			  ; 66 21 | PPU graphics register access
	ROL				  ; 2A | Rotate left (accumulator)
	JMP ($7F67)		  ; 6C 67 7F | Jump to address (absolute indirect)
	BRA $FC			  ; 80 FC | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	TXA				  ; 8A | Transfer X register to accumulator
	CPX #$99			 ; E0 99 | Compare X register (immediate)
	CPX #$96			 ; E0 96 | Compare X register (immediate)
	BEQ $97			  ; F0 97 | Branch if equal
	BEQ $18			  ; F0 18 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ROR $F8			  ; 66 F8 | Rotate right (zero page)
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	LDY $14AE			; AC AE 14 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_15F
; Address: $E5D1CB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_15F:
	ROR $84			  ; 66 84 | Rotate right (zero page)
	INC $FE			  ; E6 FE | Increment (zero page)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	EOR ($07),Y		  ; 51 07 | Exclusive OR with accumulator ((zero page),Y)
	STA $6907,Y		  ; 99 07 69 | Store accumulator to absolute,Y
	SBC #$0F			 ; E9 0F | Subtract with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_160
; Address: $E5D1E2
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_160:
	JSL $367466		  ; 22 66 74 36 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	PLY				  ; 7A | Pull Y register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $9DF0,X		  ; 9D F0 9D | Store accumulator to absolute,X
	SED				  ; F8 | Set decimal mode flag
	PHB				  ; 8B | Push data bank register to stack
	SED				  ; F8 | Set decimal mode flag
	STY $87F8			; 8C F8 87 | Store Y register to absolute address
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CPY $56			  ; C4 56 | Compare Y register (zero page)
	LSR $64			  ; 46 64 | Logical shift right (zero page)
	ROR $CCAC			; 6E AC CC | Rotate right (absolute)
	DEC $5E14			; CE 14 5E | Decrement (absolute)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDA $B90F,Y		  ; B9 0F B9 | Load from absolute,Y into accumulator
	CMP ($1F),Y		  ; D1 1F | Compare accumulator ((zero page),Y)
	AND ($1F),Y		  ; 31 1F | Logical AND with accumulator ((zero page),Y)
	SBC ($3F,X)		  ; E1 3F | Subtract with carry ((zero page,X))
	LDA				  ; BF 7F 00 00 | Load from absolute long,X into accumulator
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_162
; Address: $E5D224
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_162:
	INC $E8A1			; EE A1 E8 | Increment (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDY #$E0			 ; A0 E0 | Game work RAM access
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	BCC $2F			  ; 90 2F | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $CF			  ; 10 CF | Branch if positive
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	CPY #$9F			 ; C0 9F | Compare Y register (immediate)
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BCC $40			  ; 90 40 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	BRA $40			  ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_163
; Address: $E5D248
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_163:
	STA				  ; 9F 40 D0 C0 | Store accumulator to absolute long,X
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	LSR $0111			; 4E 11 01 | Logical shift right (absolute)
	BPL $14			  ; 10 14 | Branch if positive
	ORA ($54,X)		  ; 01 54 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	BRA $92			  ; 80 92 | Branch always
	CPY $30			  ; C4 30 | Compare Y register (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	INC $7E80,X		  ; FE 80 7E | Increment (absolute,X)
	SBC $10			  ; E5 10 | Subtract with carry (zero page)
	CMP $14			  ; C5 14 | Compare accumulator (zero page)
	STX $0161			; 8E 61 01 | Store X register to absolute address
	ASL $81			  ; 06 81 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	INC $FE7B,X		  ; FE 7B FE | Increment (absolute,X)
	ADC $70A7,Y		  ; 79 A7 70 | Add with carry (absolute,Y)
	STY $C4F7			; 8C F7 C4 | Store Y register to absolute address
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	LSR $BB			  ; 46 BB | Logical shift right (zero page)
	SBC ($63),Y		  ; F1 63 | Subtract with carry ((zero page),Y)
	LDA $50FF,X		  ; BD FF 50 | Load from absolute,X into accumulator
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BPL $FF			  ; 10 FF | Branch if positive
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_164
; Address: $E5D2EE
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_164:
	JSR $FFFF			; 20 FF FF | Jump to subroutine
	ASL $4F61,X		  ; 1E 61 4F | Arithmetic shift left (absolute,X)
	LDA				  ; BF 7F 80 7F | Load from absolute long,X into accumulator
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA $FFFF			; 0D FF FF | Logical OR with accumulator (absolute)
	INX				  ; E8 | Increment X register
	BPL $E0			  ; 10 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_166
; Address: $E5D349
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_166:
	BRA $60			  ; 80 60 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $FF			  ; 80 FF | Branch always
	BVS $BF			  ; 70 BF | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	STA $FFC5FA		  ; 8F FA C5 FF | Store accumulator to absolute long address
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ROR $1CE7,X		  ; 7E E7 1C | Rotate right (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC $EC13,X		  ; FD 13 EC | Subtract with carry (absolute,X)
	ORA $CFF6			; 0D F6 CF | Logical OR with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BPL $FF			  ; 10 FF | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BMI $DF			  ; 30 DF | Branch if negative
	BPL $EF			  ; 10 EF | Branch if positive
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_167
; Address: $E5D40D
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_167:
	JSL $008022		  ; 22 22 80 00 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	SEP #$C4			 ; E2 C4 | Set processor status bits
	CPY #$12			 ; C0 12 | Compare Y register (immediate)
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	NOP				  ; EA | No operation
	BPL $E6			  ; 10 E6 | Branch if positive
	ORA ($64),Y		  ; 11 64 | Logical OR with accumulator ((zero page),Y)
	ORA ($05),Y		  ; 11 05 | Logical OR with accumulator ((zero page),Y)
	BPL $68			  ; 10 68 | Branch if positive
	STA $E400,Y		  ; 99 00 E4 | Store accumulator to absolute,Y
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	WDM #$00			 ; 42 00 | Reserved instruction
	ROL $11			  ; 26 11 | Rotate left (zero page)
	EOR ($10,X)		  ; 41 10 | Exclusive OR with accumulator ((zero page,X))
	LSR $1511			; 4E 11 15 | Logical shift right (absolute)
	CMP ($30,X)		  ; C1 30 | Compare accumulator ((zero page,X))
	SEP #$00			 ; E2 00 | Set processor status bits
	INC $FF00			; EE 00 FF | Increment (absolute)
	ROR $3967,X		  ; 7E 67 39 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	STA $FB77			; 8D 77 FB | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	PLB				  ; AB | Pull data bank register from stack
	CMP $36FF,Y		  ; D9 FF 36 | Compare accumulator (absolute,Y)
	BCS $00			  ; B0 00 | Branch if carry set
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	BRA $DD			  ; 80 DD | Branch always
	CMP $FBA2,X		  ; DD A2 FB | Compare accumulator (absolute,X)
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	BIT $94C0			; 2C C0 94 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_168
; Address: $E5D4BC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_168:
	JSL $004400		  ; 22 00 44 00 | Jump to subroutine long
	ADC ($79),Y		  ; 71 79 | Add with carry ((zero page),Y)
	LDX $FF			  ; A6 FF | Load from zero page into X register
	STX $96FF			; 8E FF 96 | Store X register to absolute address
	STY $FF			  ; 84 FF | Store Y register to zero page
	LDY $DF			  ; A4 DF | Load from zero page into Y register
	STX $FF			  ; 86 FF | Store X register to zero page

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_169
; Address: $E5D4E0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_169:
	JSL $F7A572		  ; 22 72 A5 F7 | Jump to subroutine long
	STA $F7			  ; 85 F7 | Store accumulator to zero page
	STA $83FF			; 8D FF 83 | Store accumulator to absolute address
	STA ($F7,X)		  ; 81 F7 | Store accumulator to (zero page,X)
	CMP #$BF			 ; C9 BF | Compare accumulator (immediate)
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_16A
; Address: $E5D4F0
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_16A:
	STA $08FF			; 8D FF 08 | Store accumulator to absolute address
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STX $C5F7			; 8E F7 C5 | Store X register to absolute address
	LDX $84F8,Y		  ; BE F8 84 | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt
	JMP $1C1C41		  ; 5C 41 1C 1C | Jump to address long
	EOR $4D0C,X		  ; 5D 0C 4D | Exclusive OR with accumulator (absolute,X)
	EOR $FF00,X		  ; 5D 00 FF | Exclusive OR with accumulator (absolute,X)
	LDA				  ; BF E3 BE E3 | Load from absolute long,X into accumulator
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	LDX $09E3,Y		  ; BE E3 09 | Load from absolute,Y into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	TSX				  ; BA | Transfer stack pointer to X register
	CLC				  ; 18 | Clear carry flag
	TXS				  ; 9A | Transfer X register to stack pointer
	TSX				  ; BA | Transfer stack pointer to X register
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA $FDF7			; 8D F7 FD | Store accumulator to absolute address
	ADC $45C7,X		  ; 7D C7 45 | Add with carry (absolute,X)
	ADC $FF			  ; 65 FF | Add with carry (zero page)
	ADC $00C7,X		  ; 7D C7 00 | Add with carry (absolute,X)
	BPL $C0			  ; 10 C0 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	LDX $96			  ; A6 96 | Load from zero page into X register
	STX $94			  ; 86 94 | Store X register to zero page
	STX $96			  ; 86 96 | Store X register to zero page
	STX $94			  ; 86 94 | Store X register to zero page
	STX $F6			  ; 86 F6 | Store X register to zero page
	INC $74			  ; E6 74 | Increment (zero page)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	ASL $5D			  ; 06 5D | Arithmetic shift left (zero page)
	ADC $7D03,X		  ; 7D 03 7D | Add with carry (absolute,X)
	ADC $7D03,X		  ; 7D 03 7D | Add with carry (absolute,X)
	SBC $FD03,X		  ; FD 03 FD | Subtract with carry (absolute,X)
	SBC $0003,X		  ; FD 03 00 | Subtract with carry (absolute,X)
	EOR $4340,X		  ; 5D 40 43 | Exclusive OR with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	EOR ($98,X)		  ; 41 98 | Exclusive OR with accumulator ((zero page,X))
	STA				  ; 9F CA B5 F7 | Store accumulator to absolute long,X
	BRA $80			  ; 80 80 | Branch always
	LDX $BEE3,Y		  ; BE E3 BE | Load from absolute,Y into X register
	SBC $FFBE,X		  ; FD BE FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_16C
; Address: $E5D59E
; Size: 120 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_16C:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	REP #$3A			 ; C2 3A | Reset processor status bits
	TSX				  ; BA | Transfer stack pointer to X register
	STA $FD			  ; 85 FD | Store accumulator to zero page
	LDA $FFEF			; AD EF FF | Load from absolute address into accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ADC $7DC7,X		  ; 7D C7 7D | Add with carry (absolute,X)
	LDA				  ; BF 45 FF 02 | Load from absolute long,X into accumulator
	INC $03FF,X		  ; FE FF 03 | Increment (absolute,X)
	LDA $FFFF			; AD FF FF | Load from absolute address into accumulator
	LDX $FF			  ; A6 FF | Load from zero page into X register
	PLP				  ; 28 | Pull processor status from stack
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $01FE,X		  ; FE FE 01 | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $7C00,X		  ; FE 00 7C | Increment (absolute,X)
	JMP $82FE			; 4C FE 82 | Jump to address
	SBC $93C7,X		  ; FD C7 93 | Subtract with carry (absolute,X)
	SBC $BBEF,X		  ; FD EF BB | Subtract with carry (absolute,X)
	AND $EFDC,X		  ; 3D DC EF | Logical AND with accumulator (absolute,X)
	ROL $7CC9,X		  ; 3E C9 7C | Rotate left (absolute,X)
	BMI $FE			  ; 30 FE | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	ROL $FF2A,X		  ; 3E 2A FF | Rotate left (absolute,X)
	INC $7F09,X		  ; FE 09 7F | Increment (absolute,X)
	STA $B37F,X		  ; 9D 7F B3 | Store accumulator to absolute,X
	ADC $FED7,X		  ; 7D D7 FE | Add with carry (absolute,X)
	STA $143E,Y		  ; 99 3E 14 | Store accumulator to absolute,Y
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $00FF			; 2C FF 00 | Test bits in accumulator (absolute)
	STZ $FF			  ; 64 FF | Store zero to zero page
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	AND #$3E			 ; 29 3E | Logical AND with accumulator (immediate)
	AND $6C65			; 2D 65 6C | Logical AND with accumulator (absolute)
	CPY $E3FE			; CC FE E3 | Compare Y register (absolute)
	CPY $DCC4			; CC C4 DC | Compare Y register (absolute)
	ORA $3F00,X		  ; 1D 00 3F | Logical OR with accumulator (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF B1 5F FE | Load from absolute long,X into accumulator
	ORA ($EB),Y		  ; 11 EB | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_16D
; Address: $E5D6E6
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_16D:
	PLB				  ; AB | Pull data bank register from stack
	INC $7E10			; EE 10 7E | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	PEA #$7C94		   ; F4 94 7C | Push effective address to stack
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	LDX $D967,Y		  ; BE 67 D9 | Load from absolute,Y into X register
	STA $BF7BFC		  ; 8F FC 7B BF | Store accumulator to absolute long address
	SBC $7A8F,X		  ; FD 8F 7A | Subtract with carry (absolute,X)
	INC $7050,X		  ; FE 50 70 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	INC $7000,X		  ; FE 00 70 | Increment (absolute,X)
	INC $3DC7,X		  ; FE C7 3D | Increment (absolute,X)
	CMP #$7E			 ; C9 7E | Compare accumulator (immediate)
	LDA $FEEB,X		  ; BD EB FE | Load from absolute,X into accumulator
	STA $7E			  ; 85 7E | Store accumulator to zero page
	LDA $14FF,X		  ; BD FF 14 | Load from absolute,X into accumulator
	PHY				  ; 5A | Push Y register to stack
	AND $FAF6,Y		  ; 39 F6 FA | Logical AND with accumulator (absolute,Y)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	LDA $FF00FF		  ; AF FF 00 FF | Load from absolute long address into accumulator
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_16E
; Address: $E5D762
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_16E:
	JSR $CFDF			; 20 DF CF | Jump to subroutine
	BMI $0F			  ; 30 0F | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	BEQ $FF			  ; F0 FF | Branch if equal
	BMI $CF			  ; 30 CF | Branch if negative
	CMP $02F9,Y		  ; D9 F9 02 | Compare accumulator (absolute,Y)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ROL $D9			  ; 26 D9 | Rotate left (zero page)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BCC $F0			  ; 90 F0 | Branch if carry clear
	STA $FF3957		  ; 8F 57 39 FF | Store accumulator to absolute long address
	SBC ($4F),Y		  ; F1 4F | Subtract with carry ((zero page),Y)
	BVC $09			  ; 50 09 | Branch if overflow clear
	BPL $09			  ; 10 09 | Branch if positive
	JMP $50B0			; 4C B0 50 | Jump to address
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	LDY #$AE			 ; A0 AE | Load immediate value into Y register
	INC $E040			; EE 40 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BPL $F8			  ; 10 F8 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_16F
; Address: $E5D7EB
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_16F:
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	ROL $7D22,X		  ; 3E 22 7D | Rotate left (absolute,X)
	ADC $BBEF,X		  ; 7D EF BB | Add with carry (absolute,X)
	LDA $EF5C,X		  ; BD 5C EF | Load from absolute,X into accumulator
	ROL $1C49,X		  ; 3E 49 1C | Rotate left (absolute,X)
	ROL $7F1C,X		  ; 3E 1C 7F | Rotate left (absolute,X)
	BMI $7F			  ; 30 7F | Branch if negative
	BPL $7F			  ; 10 7F | Branch if positive
	BRA $7F			  ; 80 7F | Branch always
	EOR $8000,Y		  ; 59 00 80 | Exclusive OR with accumulator (absolute,Y)
	BRA $33			  ; 80 33 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	STX $79			  ; 86 79 | Store X register to zero page
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	JMP $0101FF		  ; 5C FF 01 01 | Jump to address long
	BMI $CE			  ; 30 CE | Branch if negative
	AND ($63),Y		  ; 31 63 | Logical AND with accumulator ((zero page),Y)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	STY $03FF			; 8C FF 03 | Store Y register to absolute address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX $30FF			; EC FF 30 | Compare X register (absolute)
	CPY $FFFF			; CC FF FF | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $08			  ; 10 08 | Branch if positive
	ORA ($16),Y		  ; 11 16 | Logical OR with accumulator ((zero page),Y)
	SBC $B230,X		  ; FD 30 B2 | Subtract with carry (absolute,X)
	EOR $300F			; 4D 0F 30 | Exclusive OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	BMI $EE			  ; 30 EE | Branch if negative
	RTI				  ; 40 | Return from interrupt
	INC $6840			; EE 40 68 | Increment (absolute)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_170
; Address: $E5D8F7
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_170:
	TXA				  ; 8A | Transfer X register to accumulator
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY $64			  ; A4 64 | Load from zero page into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	INC $7ECA,X		  ; FE CA 7E | Increment (absolute,X)
	LDA				  ; BF E9 FF 83 | Load from absolute long,X into accumulator
	INC $3C00			; EE 00 3C | Increment (absolute)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	JMP $3C00FE		  ; 5C FE 00 3C | Jump to address long
	CPY $CC86			; CC 86 CC | Compare Y register (absolute)
	PHA				  ; 48 | Push accumulator to stack
	CLD				  ; D8 | Clear decimal mode flag
	STA				  ; 9F 84 FB 82 | Store accumulator to absolute long,X
	INY				  ; C8 | Increment Y register
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	CPY $004A			; CC 4A 00 | Compare Y register (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_171
; Address: $E5D95A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_171:
	LSR $CA00			; 4E 00 CA | Logical shift right (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	BPL $63			  ; 10 63 | Branch if positive
	ORA ($63),Y		  ; 11 63 | Logical OR with accumulator ((zero page),Y)
	ORA ($43),Y		  ; 11 43 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_172
; Address: $E5D968
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_172:
	JSR $10DE			; 20 DE 10 | Jump to subroutine
	WDM #$11			 ; 42 11 | Reserved instruction
	BPL $63			  ; 10 63 | Branch if positive
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $30			  ; 10 30 | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_173
; Address: $E5D9C0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_173:
	JSR $36C4			; 20 C4 36 | Jump to subroutine
	ROL $14D8,X		  ; 3E D8 14 | Rotate left (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ORA $9BF7,Y		  ; 19 F7 9B | Logical OR with accumulator (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_174
; Address: $E5D9D1
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_174:
	CPX $00			  ; E4 00 | Compare X register (zero page)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FBEE			; EE EE FB | Increment (absolute)
	AND $DBFF,X		  ; 3D FF DB | Logical AND with accumulator (absolute,X)
	BNE $3F			  ; D0 3F | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	STY $08			  ; 84 08 | Store Y register to zero page
	BCC $4E			  ; 90 4E | Branch if carry clear
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	ASL $4C			  ; 06 4C | Arithmetic shift left (zero page)
	AND ($4A),Y		  ; 31 4A | Logical AND with accumulator ((zero page),Y)
	STA $06730C		  ; 8F 0C 73 06 | Store accumulator to absolute long address
	JMP $CC86			; 4C 86 CC | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	DEX				  ; CA | Decrement X register
	BVS $00			  ; 70 00 | Branch if overflow set
	DEX				  ; CA | Decrement X register
	LSR				  ; 4A | Logical shift right (accumulator)
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	AND ($63),Y		  ; 31 63 | Logical AND with accumulator ((zero page),Y)
	STY $8752			; 8C 52 87 | Store Y register to absolute address
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	BMI $62			  ; 30 62 | Branch if negative
	AND ($63),Y		  ; 31 63 | Logical AND with accumulator ((zero page),Y)
	ORA ($43),Y		  ; 11 43 | Logical OR with accumulator ((zero page),Y)
	ASL $21FF			; 0E FF 21 | PPU graphics register access
	CLC				  ; 18 | Clear carry flag
	BMI $30			  ; 30 30 | Branch if negative
	BMI $B0			  ; 30 B0 | Branch if negative
	LSR				  ; 4A | Logical shift right (accumulator)
	STY $7B			  ; 84 7B | Store Y register to zero page
	LSR				  ; 4A | Logical shift right (accumulator)
	BRA $4A			  ; 80 4A | Branch always
	LSR				  ; 4A | Logical shift right (accumulator)
	BRA $4A			  ; 80 4A | Branch always
	STY $6B			  ; 84 6B | Store Y register to zero page
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	LDA $FE52			; AD 52 FE | Load from absolute address into accumulator
	INC $DE21,X		  ; FE 21 DE | Increment (absolute,X)
	AND ($52,X)		  ; 21 52 | Logical AND with accumulator ((zero page,X))
	AND ($5A,X)		  ; 21 5A | Logical AND with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $96FD			; 2D FD 96 | Logical AND with accumulator (absolute)
	INC $F68A,X		  ; FE 8A F6 | Increment (absolute,X)
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	LDY $3E7C			; AC 7C 3E | Load from absolute address into Y register
	DEC $ECD4			; CE D4 EC | Decrement (absolute)
	LSR $02FE			; 4E FE 02 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_175
; Address: $E5DAB2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_175:
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $30			  ; 30 30 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_176
; Address: $E5DACA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_176:
	JSL $323222		  ; 22 22 32 32 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BIT $38			  ; 24 38 | Test bits in accumulator (zero page)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	BMI $32			  ; 30 32 | Branch if negative
	ORA ($33),Y		  ; 11 33 | Logical OR with accumulator ((zero page),Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_177
; Address: $E5DAEA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_177:
	JSR $2420			; 20 20 24 | Jump to subroutine
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F 58 D7 13 | Store accumulator to absolute long,X
	STY $E2			  ; 84 E2 | Store Y register to zero page
	SEP #$C6			 ; E2 C6 | Set processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_178
; Address: $E5DB0B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_178:
	JSR $1070			; 20 70 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ADC #$16			 ; 69 16 | Add with carry (immediate)
	STZ $1F			  ; 64 1F | Store zero to zero page
	ASL $1703			; 0E 03 17 | Arithmetic shift left (absolute)
	AND $511A			; 2D 1A 51 | Logical AND with accumulator (absolute)
	ROL $2E71,X		  ; 3E 71 2E | Rotate left (absolute,X)
	SBC $DD5E,Y		  ; F9 5E DD | Subtract with carry (absolute,Y)
	ROR $03			  ; 66 03 | Rotate right (zero page)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_179
; Address: $E5DB36
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_179:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVS $C0			  ; 70 C0 | Branch if overflow set
	INX				  ; E8 | Increment X register
	BMI $B4			  ; 30 B4 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	TXA				  ; 8A | Transfer X register to accumulator
	STX $9F74			; 8E 74 9F | Store X register to absolute address
	PLY				  ; 7A | Pull Y register from stack
	ROR $C0			  ; 66 C0 | Rotate right (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_17A
; Address: $E5DB5C
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_17A:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	LDA $532B,X		  ; BD 2B 53 | Load from absolute,X into accumulator
	ASL $1F5D,X		  ; 1E 5D 1F | Arithmetic shift left (absolute,X)
	LSR $5F1F,X		  ; 5E 1F 5F | Logical shift right (absolute,X)
	ASL $0F4F,X		  ; 1E 4F 0F | Arithmetic shift left (absolute,X)
	INC $EC83,X		  ; FE 83 EC | Increment (absolute,X)
	STZ $9EE2			; 9C E2 9E | Store zero to absolute
	SBC ($9F,X)		  ; E1 9F | Subtract with carry ((zero page,X))
	CPX #$8E			 ; E0 8E | Compare X register (immediate)
	BEQ $85			  ; F0 85 | Branch if equal
	PLX				  ; FA | Pull X register from stack
	SEP #$E2			 ; E2 E2 | Set processor status bits
	AND $C2DC,X		  ; 3D DC C2 | Logical AND with accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	TSX				  ; BA | Transfer stack pointer to X register
	SED				  ; F8 | Set decimal mode flag
	PLY				  ; 7A | Pull Y register from stack
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $AA			  ; F0 AA | Branch if equal
	SEP #$00			 ; E2 00 | Set processor status bits
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	AND $7947,Y		  ; 39 47 79 | Logical AND with accumulator (absolute,Y)
	SBC $7107,Y		  ; F9 07 71 | Subtract with carry (absolute,Y)
	STA $005FA1		  ; 8F A1 5F 00 | Store accumulator to absolute long address
	CMP ($51,X)		  ; C1 51 | Compare accumulator ((zero page,X))
	BRA $0C			  ; 80 0C | Branch always
	STY $8061			; 8C 61 80 | Store Y register to absolute address
	TSX				  ; BA | Transfer stack pointer to X register
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	PHY				  ; 5A | Push Y register to stack
	STA ($34,X)		  ; 81 34 | Store accumulator to (zero page,X)
	STA ($D2,X)		  ; 81 D2 | Store accumulator to (zero page,X)
	WDM #$F9			 ; 42 F9 | Reserved instruction
	ORA #$58			 ; 09 58 | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	LDA $F600,X		  ; BD 00 F6 | Load from absolute,X into accumulator
	CLC				  ; 18 | Clear carry flag
	PHY				  ; 5A | Push Y register to stack
	BVC $17			  ; 50 17 | Branch if overflow clear
	BPL $53			  ; 10 53 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	ROL				  ; 2A | Rotate left (accumulator)
	PHY				  ; 5A | Push Y register to stack
	BMI $4F			  ; 30 4F | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_17B
; Address: $E5DBF4
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_17B:
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($7F1F)		  ; 6C 1F 7F | Jump to address (absolute indirect)
	BVS $1F			  ; 70 1F | Branch if overflow set
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	BEQ $03			  ; F0 03 | Branch if equal
	LDY $4110			; AC 10 41 | Load from absolute address into Y register
	CLC				  ; 18 | Clear carry flag
	EOR ($0A,X)		  ; 41 0A | Exclusive OR with accumulator ((zero page,X))
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BCS $00			  ; B0 00 | Branch if carry set
	BEQ $0D			  ; F0 0D | Branch if equal
	CPY #$35			 ; C0 35 | Compare Y register (immediate)
	STX $18			  ; 86 18 | Store X register to zero page
	BVC $A4			  ; 50 A4 | Branch if overflow clear
	INY				  ; C8 | Increment Y register
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHY				  ; 5A | Push Y register to stack
	PHP				  ; 08 | Push processor status to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_17C
; Address: $E5DC45
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_17C:
	JSR $6321			; 20 21 63 | Jump to subroutine
	BPL $39			  ; 10 39 | Branch if positive
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	BVC $7F			  ; 50 7F | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	ROL $1F			  ; 26 1F | Rotate left (zero page)
	ORA $0607,Y		  ; 19 07 06 | Logical OR with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	INC				  ; 1A | Increment accumulator
	BPL $92			  ; 10 92 | Branch if positive
	STY $C6			  ; 84 C6 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	STZ $7860			; 9C 60 78 | Store zero to absolute
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $01			  ; 80 01 | Branch always
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $FC1A,X		  ; FE 1A FC | Increment (absolute,X)
	STZ $F8			  ; 64 F8 | Store zero to zero page
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$60			 ; E0 60 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_17D
; Address: $E5DC7D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_17D:
	BRA $80			  ; 80 80 | Branch always
	STA				  ; 9F 65 97 B7 | Store accumulator to absolute long,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_17E
; Address: $E5DC94
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_17E:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$7F			 ; 09 7F | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $FC			  ; F0 FC | Branch if equal

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_17F
; Address: $E5DCA6
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_17F:
	JSL $A3425E		  ; 22 5E 42 A3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	PHX				  ; DA | Push X register to stack
	DEY				  ; 88 | Decrement Y register
	INC $DB1B			; EE 1B DB | Increment (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	AND $FF			  ; 25 FF | Logical AND with accumulator (zero page)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	SBC $F6F0,X		  ; FD F0 F6 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $FFFE,Y		  ; F9 FE FF | Subtract with carry (absolute,Y)
	BRA $FF			  ; 80 FF | Branch always
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BPL $FE			  ; 10 FE | Branch if positive
	INC $6DFD,X		  ; FE FD 6D | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $FF			  ; F0 FF | Branch if equal
	LDA				  ; BF 10 DE 00 | Load from absolute long,X into accumulator
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	EOR ($FE,X)		  ; 41 FE | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_180
; Address: $E5DCFE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_180:
	JSL $3706FC		  ; 22 FC 06 37 | Jump to subroutine long
	BPL $2D			  ; 10 2D | Branch if positive
	BPL $2F			  ; 10 2F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	LDX $3D7F,Y		  ; BE 7F 3D | Load from absolute,Y into X register
	LDX $BB38,Y		  ; BE 38 BB | Load from absolute,Y into X register
	ADC $FFFF,X		  ; 7D FF FF | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_181
; Address: $E5DD3A
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_181:
	JSR $FFFF			; 20 FF FF | Jump to subroutine
	INC $8CFE,X		  ; FE FE 8C | Increment (absolute,X)
	SBC $EC0C			; ED 0C EC | Subtract with carry (absolute)
	ORA $FF9D,X		  ; 1D 9D FF | Logical OR with accumulator (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	BMI $BE			  ; 30 BE | Branch if negative
	BVS $7E			  ; 70 7E | Branch if overflow set
	BEQ $FE			  ; F0 FE | Branch if equal
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	WDM #$FC			 ; 42 FC | Reserved instruction
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $23			  ; 10 23 | Branch if positive
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	LSR $5B35,X		  ; 5E 35 5B | Logical shift right (absolute,X)
	JMP $334C33		  ; 5C 33 4C 33 | Jump to address long
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STA $1F00FF		  ; 8F FF 00 1F | Store accumulator to absolute long address
	CPX #$C7			 ; E0 C7 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	LDA				  ; BF 01 00 00 | Load from absolute long,X into accumulator
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	AND ($17,X)		  ; 21 17 | Logical AND with accumulator ((zero page,X))
	AND $7B			  ; 25 7B | Logical AND with accumulator (zero page)
	LSR $0302,X		  ; 5E 02 03 | Logical shift right (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROL $5E00			; 2E 00 5E | Rotate left (absolute)
	ADC $8000,X		  ; 7D 00 80 | Add with carry (absolute,X)
	BRA $60			  ; 80 60 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$98			 ; A0 98 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	STY $8468			; 8C 68 84 | Store Y register to absolute address
	LSR $5AA0,X		  ; 5E A0 5A | Logical shift right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_183
; Address: $E5DE1A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_183:
	PEA #$FA00		   ; F4 00 FA | Push effective address to stack
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CMP $56FF,X		  ; DD FF 56 | Compare accumulator (absolute,X)
	EOR $19F7,Y		  ; 59 F7 19 | Exclusive OR with accumulator (absolute,Y)
	SBC $00BB,X		  ; FD BB 00 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_184
; Address: $E5DE34
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_184:
	JSL $FE01FD		  ; 22 FD 01 FE | Jump to subroutine long
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_186
; Address: $E5DE47
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_186:
	JSR $3C0B			; 20 0B 3C | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_188
; Address: $E5DE5A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_188:
	JSR $183F			; 20 3F 18 | Jump to subroutine
	BPL $FC			  ; 10 FC | Branch if positive
	ROL $F8CA,X		  ; 3E CA F8 | Rotate left (absolute,X)
	PEA #$D40C		   ; F4 0C D4 | Push effective address to stack
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_189
; Address: $E5DE6C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_189:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	CPX $F400			; EC 00 F4 | Compare X register (absolute)
	NOP				  ; EA | No operation
	ASL $82			  ; 06 82 | Arithmetic shift left (zero page)
	ASL $FE02,X		  ; 1E 02 FE | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	BRA $23			  ; 80 23 | Branch always
	ASL $03FF			; 0E FF 03 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_18A
; Address: $E5DE9F
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_18A:
	JSR $336C			; 20 6C 33 | Jump to subroutine
	JMP ($6C33)		  ; 6C 33 6C | Jump to address (absolute indirect)
	ADC $AD32			; 6D 32 AD | Add with carry (absolute)
	LDX $EB71			; AE 71 EB | Load from absolute address into X register
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	BNE $31			  ; D0 31 | Branch if not equal
	DEC $E71C			; CE 1C E7 | Decrement (absolute)
	STA $EB1775		  ; 8F 75 17 EB | Store accumulator to absolute long address
	PHA				  ; 48 | Push accumulator to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	STZ $0E00,X		  ; 9E 00 0E | Store zero to absolute,X
	CMP $7EEB,X		  ; DD EB 7E | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_18B
; Address: $E5DEE4
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_18B:
	INC $7C09,X		  ; FE 09 7C | Increment (absolute,X)
	REP #$80			 ; C2 80 | Reset processor status bits
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROL				  ; 2A | Rotate left (accumulator)
	INC $FC2C,X		  ; FE 2C FC | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SBC $7C83,X		  ; FD 83 7C | Subtract with carry (absolute,X)
	ADC $1B0F,X		  ; 7D 0F 1B | Add with carry (absolute,X)
	ORA $0300			; 0D 00 03 | Logical OR with accumulator (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $7F			  ; 30 7F | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_18C
; Address: $E5DF21
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_18C:
	PEA #$F669		   ; F4 69 F6 | Push effective address to stack
	ADC #$F6			 ; 69 F6 | Add with carry (immediate)
	EOR $54E6,Y		  ; 59 E6 54 | Exclusive OR with accumulator (absolute,Y)
	LDA $140F34		  ; AF 34 0F 14 | Load from absolute long address into accumulator
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	LSR $F9			  ; 46 F9 | Logical shift right (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BCS $7F			  ; B0 7F | Branch if carry set
	DEC $1E31,X		  ; DE 31 1E | Decrement (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF C7 BF DF | Load from absolute long,X into accumulator
	LDA ($5E,X)		  ; A1 5E | Load from (zero page,X) into accumulator
	ORA $5EE6,Y		  ; 19 E6 5E | Logical OR with accumulator (absolute,Y)
	LDA ($C1,X)		  ; A1 C1 | Load from (zero page,X) into accumulator
	ROL $8778,X		  ; 3E 78 87 | Rotate left (absolute,X)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_18D
; Address: $E5DF77
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_18D:
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	LDX $00			  ; A6 00 | Load from zero page into X register
	ROL $0700,X		  ; 3E 00 07 | Rotate left (absolute,X)
	BPL $34			  ; 10 34 | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_18F
; Address: $E5DF86
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_18F:
	JSR $20E8			; 20 E8 20 | Jump to subroutine
	CPX $10			  ; E4 10 | Compare X register (zero page)
	PEA #$7290		   ; F4 90 72 | Push effective address to stack
	DEY				  ; 88 | Decrement Y register
	ADC $000C,Y		  ; 79 0C 00 | Add with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_190
; Address: $E5DF9C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_190:
	STX $8700			; 8E 00 87 | Store X register to absolute address
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $FB			  ; 10 FB | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$99			 ; 09 99 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	BNE $09			  ; D0 09 | Branch if not equal
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STZ $6161,X		  ; 9E 61 61 | Store zero to absolute,X
	SED				  ; F8 | Set decimal mode flag
	CMP $2722,Y		  ; D9 22 27 | Compare accumulator (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	RTI				  ; 40 | Return from interrupt
	LSR $40			  ; 46 40 | Logical shift right (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_191
; Address: $E5E02F
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_191:
	RTI				  ; 40 | Return from interrupt
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ORA $F8			  ; 05 F8 | Logical OR with accumulator (zero page)
	ORA $B8			  ; 05 B8 | Logical OR with accumulator (zero page)
	LDX $20B8,Y		  ; BE B8 20 | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt
	LDY $D866,X		  ; BC 66 D8 | Load from absolute,X into Y register
	BRA $F8			  ; 80 F8 | Branch always
	BVS $B8			  ; 70 B8 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	STY $FC70			; 8C 70 FC | Store Y register to absolute address
	BCC $78			  ; 90 78 | Branch if carry clear
	INC $FC18,X		  ; FE 18 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $3DC7,X		  ; FE C7 3D | Increment (absolute,X)
	ORA #$3E			 ; 09 3E | Logical OR with accumulator (immediate)
	AND $7E6B,X		  ; 3D 6B 7E | Logical AND with accumulator (absolute,X)
	STA $7E			  ; 85 7E | Store accumulator to zero page
	ORA $277E,X		  ; 1D 7E 27 | Logical OR with accumulator (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	ASL $0F14			; 0E 14 0F | Arithmetic shift left (absolute)
	ASL $1E0F,X		  ; 1E 0F 1E | Arithmetic shift left (absolute,X)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_192
; Address: $E5E0C6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_192:
	LDY $F843,X		  ; BC 43 F8 | Load from absolute,X into Y register
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_193
; Address: $E5E0D5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_193:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA ($DE,X)		  ; A1 DE | Load from (zero page,X) into accumulator
	CMP $FA			  ; C5 FA | Compare accumulator (zero page)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_194
; Address: $E5E0E8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_194:
	JSR $105F			; 20 5F 10 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	LSR $3E			  ; 46 3E | Logical shift right (zero page)
	AND ($0F),Y		  ; 31 0F | Logical AND with accumulator ((zero page),Y)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_195
; Address: $E5E127
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_195:
	BRA $C0			  ; 80 C0 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	STY $3C			  ; 84 3C | Store Y register to zero page
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	BPL $70			  ; 10 70 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	ROL $FE			  ; 26 FE | Rotate left (zero page)
	EOR ($DF),Y		  ; 51 DF | Exclusive OR with accumulator ((zero page),Y)
	BIT #$8F			 ; 89 8F | Test bits in accumulator (immediate)
	ASL $7C06			; 0E 06 7C | Arithmetic shift left (absolute)
	CPY $82FE			; CC FE 82 | Compare Y register (absolute)
	DEC $90			  ; C6 90 | Decrement (zero page)
	INX				  ; E8 | Increment X register
	CLV				  ; B8 | Clear overflow flag
	CPX $3C			  ; E4 3C | Compare X register (zero page)
	DEC $3FEE,X		  ; DE EE 3F | Decrement (absolute,X)
	CMP #$FC			 ; C9 FC | Compare accumulator (immediate)
	BMI $FE			  ; 30 FE | Branch if negative
	INC $FC30,X		  ; FE 30 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FF10,X		  ; FE 10 FF | Increment (absolute,X)
	EOR $FE6B,X		  ; 5D 6B FE | Exclusive OR with accumulator (absolute,X)
	ROR $7F89,X		  ; 7E 89 7F | Rotate right (absolute,X)
	ORA $337F,X		  ; 1D 7F 33 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_196
; Address: $E5E16C
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_196:
	ADC $FE17,X		  ; 7D 17 FE | Add with carry (absolute,X)
	STA $147F,Y		  ; 99 7F 14 | Store accumulator to absolute,Y
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $007F			; 2C 7F 00 | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	INC $FE38,X		  ; FE 38 FE | Increment (absolute,X)
	INC $F840,X		  ; FE 40 F8 | Increment (absolute,X)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $7C3E,X		  ; 3D 3E 7C | Logical AND with accumulator (absolute,X)
	INC $0099,X		  ; FE 99 00 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($82),Y		  ; 71 82 | Add with carry ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BMI $CF			  ; 30 CF | Branch if negative
	DEC $09			  ; C6 09 | Decrement (zero page)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	LDY $D967,X		  ; BC 67 D9 | Load from absolute,X into Y register
	STA $BF77FC		  ; 8F FC 77 BF | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	STA $FB77			; 8D 77 FB | Store accumulator to absolute address
	STA				  ; 9F 7C FF 18 | Store accumulator to absolute long,X
	BRA $C0			  ; 80 C0 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	LDY $FEEA,X		  ; BC EA FE | Load from absolute,X into Y register
	STA $7E			  ; 85 7E | Store accumulator to zero page
	STA $E7FE,X		  ; 9D FE E7 | Store accumulator to absolute,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FF14,X		  ; FE 14 FF | Increment (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $B8			  ; 70 B8 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	STA $FB77			; 8D 77 FB | Store accumulator to absolute address
	STA				  ; 9F 7C 00 00 | Store accumulator to absolute long,X
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_197
; Address: $E5E260
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_197:
	ROR $3DC7,X		  ; 7E C7 3D | Rotate right (absolute,X)
	ORA #$3E			 ; 09 3E | Logical OR with accumulator (immediate)
	AND $FE6B,X		  ; 3D 6B FE | Logical AND with accumulator (absolute,X)
	STA $7E			  ; 85 7E | Store accumulator to zero page
	STA $E7FE,X		  ; 9D FE E7 | Store accumulator to absolute,X
	PHY				  ; 5A | Push Y register to stack
	ROR				  ; 6A | Rotate right (accumulator)
	INC $7E85,X		  ; FE 85 7E | Increment (absolute,X)
	STA $E7FE,X		  ; 9D FE E7 | Store accumulator to absolute,X
	ROR $FF14,X		  ; 7E 14 FF | Rotate right (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	LDA				  ; BF 7F 80 1D | Load from absolute long,X into accumulator
	LDY $3B			  ; A4 3B | Load from zero page into Y register
	CPY $0433			; CC 33 04 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_198
; Address: $E5E2AD
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_198:
	JSL $80B944		  ; 22 44 B9 80 | Jump to subroutine long
	BRA $00			  ; 80 00 | Branch always
	CMP $DD00,X		  ; DD 00 DD | Compare accumulator (absolute,X)
	CMP $DD00,X		  ; DD 00 DD | Compare accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	CMP $6530			; CD 30 65 | Compare accumulator (absolute)
	PLY				  ; 7A | Pull Y register from stack
	AND $47			  ; 25 47 | Logical AND with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $DD00,X		  ; FD 00 DD | Subtract with carry (absolute,X)
	SBC $B000,X		  ; FD 00 B0 | Subtract with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	EOR $DA80,X		  ; 5D 80 DA | Exclusive OR with accumulator (absolute,X)
	LDA ($01,X)		  ; A1 01 | Load from (zero page,X) into accumulator
	INC				  ; 1A | Increment accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	JMP $6430			; 4C 30 64 | Jump to address
	ROL $73			  ; 26 73 | Rotate left (zero page)
	ROL $21			  ; 26 21 | PPU graphics register access
	STZ $B4FA,X		  ; 9E FA B4 | Store zero to absolute,X
	EOR #$0F			 ; 49 0F | Exclusive OR with accumulator (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BIT $81			  ; 24 81 | Test bits in accumulator (zero page)
	ADC $9461,X		  ; 7D 61 94 | Add with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	STA $EB6B,X		  ; 9D 6B EB | Store accumulator to absolute,X
	BRA $6B			  ; 80 6B | Branch always
	EOR $33			  ; 45 33 | Exclusive OR with accumulator (zero page)
	STZ $30			  ; 64 30 | Store zero to zero page
	ORA ($DC,X)		  ; 01 DC | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_199
; Address: $E5E34C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_199:
	ADC $EB00			; 6D 00 EB | Add with carry (absolute)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	STA $DF1A8F		  ; 8F 8F 1A DF | Store accumulator to absolute long address
	CMP $FEFE,X		  ; DD FE FE | Compare accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_19B
; Address: $E5E378
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_19B:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	CMP ($E7,X)		  ; C1 E7 | Compare accumulator ((zero page,X))
	ADC $A97D,X		  ; 7D 7D A9 | Add with carry (absolute,X)
	LDA				  ; BF E2 F7 94 | Load from absolute long,X into accumulator
	AND #$21			 ; 29 21 | PPU graphics register access
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEC $3900,X		  ; DE 00 39 | Decrement (absolute,X)
	LDX $63BE,Y		  ; BE BE 63 | Load from absolute,Y into X register
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	JMP $00005C		  ; 5C 5C 00 00 | Jump to address long
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR #$CF			 ; 49 CF | Exclusive OR with accumulator (immediate)
	ADC $94FD,X		  ; 7D FD 94 | Add with carry (absolute,X)
	DEC $CF83,X		  ; DE 83 CF | Decrement (absolute,X)
	RTI				  ; 40 | Return from interrupt
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_19C
; Address: $E5E3D2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_19C:
	JSR $2000			; 20 00 20 | Jump to subroutine
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	AND $C600,X		  ; 3D 00 C6 | Logical AND with accumulator (absolute,X)
	DEC $08			  ; C6 08 | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_19D
; Address: $E5E3E4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_19D:
	JSL $00C800		  ; 22 00 C8 00 | Jump to subroutine long
	BVC $10			  ; 50 10 | Branch if overflow clear
	STY $84			  ; 84 84 | Store Y register to zero page
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND $F700,Y		  ; 39 00 F7 | Logical AND with accumulator (absolute,Y)
	LDX $86			  ; A6 86 | Load from zero page into X register
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_19E
; Address: $E5E408
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_19E:
	ROL				  ; 2A | Rotate left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $BBCC			; EC CC BB | Compare X register (absolute)
	STA $790074		  ; 8F 74 00 79 | Store accumulator to absolute long address
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	AND ($17),Y		  ; 31 17 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_19F
; Address: $E5E42C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_19F:
	JSL $56356F		  ; 22 6F 35 56 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $2F00,Y		  ; 19 00 2F | Logical OR with accumulator (absolute,Y)
	ORA ($5F,X)		  ; 01 5F | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1A0
; Address: $E5E44B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1A0:
	INX				  ; E8 | Increment X register
	LDY $F6			  ; A4 F6 | Load from zero page into Y register
	JMP $00EA			; 4C EA 00 | Jump to address
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	PEA #$FA00		   ; F4 00 FA | Push effective address to stack
	CPX #$F6			 ; E0 F6 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1A2
; Address: $E5E46A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1A2:
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	WDM #$7A			 ; 42 7A | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	REP #$02			 ; C2 02 | Reset processor status bits
	INC				  ; 1A | Increment accumulator
	PLX				  ; FA | Pull X register from stack
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $16E9,X		  ; FE E9 16 | Increment (absolute,X)
	LDA				  ; BF 00 00 00 | Load from absolute long,X into accumulator
	LDX #$5D			 ; A2 5D | Load immediate value into X register
	WDM #$00			 ; 42 00 | Reserved instruction
	LDX #$5D			 ; A2 5D | Load immediate value into X register
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1A4
; Address: $E5E4D5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1A4:
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BPL $1C			  ; 10 1C | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $0D06			; 0D 06 0D | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	BIT $1C			  ; 24 1C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1A5
; Address: $E5E4F2
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1A5:
	JSL $161A3E		  ; 22 3E 1A 16 | Jump to subroutine long
	ASL $141B,X		  ; 1E 1B 14 | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $699F,Y		  ; 79 9F 69 | Add with carry (absolute,Y)
	STA $708666		  ; 8F 66 86 70 | Store accumulator to absolute long address
	BRA $7F			  ; 80 7F | Branch always
	BRA $3F			  ; 80 3F | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	ORA $1D62			; 0D 62 1D | Logical OR with accumulator (absolute)
	SEP #$1D			 ; E2 1D | Set processor status bits
	CPY $39			  ; C4 39 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	WDM #$6A			 ; 42 6A | Reserved instruction
	EOR ($65,X)		  ; 41 65 | Exclusive OR with accumulator ((zero page,X))
	EOR $4A			  ; 45 4A | Exclusive OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	EOR $5747,Y		  ; 59 47 57 | Exclusive OR with accumulator (absolute,Y)
	BRA $C0			  ; 80 C0 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1A8
; Address: $E5E55D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1A8:
	LDA				  ; BF 00 60 C2 | Load from absolute long,X into accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	SEP #$E2			 ; E2 E2 | Set processor status bits
	INC $0301,X		  ; FE 01 03 | Increment (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $F806,X		  ; FE 06 F8 | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SBC $0600,X		  ; FD 00 06 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1A9
; Address: $E5E584
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1A9:
	PHP				  ; 08 | Push processor status to stack
	ASL $1C2A			; 0E 2A 1C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	BPL $38			  ; 10 38 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BVS $60			  ; 70 60 | Branch if overflow set
	PLB				  ; AB | Pull data bank register from stack
	INC				  ; 1A | Increment accumulator
	STY $84			  ; 84 84 | Store Y register to zero page
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	STY $7B			  ; 84 7B | Store Y register to zero page
	ADC $00FD			; 6D FD 00 | Add with carry (absolute)
	CMP $0100,X		  ; DD 00 01 | Compare accumulator (absolute,X)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1AB
; Address: $E5E5FE
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1AB:
	JSR $F9DF			; 20 DF F9 | Jump to subroutine
	STA				  ; 9F 1F 63 67 | Store accumulator to absolute long,X
	LDX $63BE,Y		  ; BE BE 63 | Load from absolute,Y into X register
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	JMP $00FC5C		  ; 5C 5C FC 00 | Jump to address long
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CMP $0600,X		  ; DD 00 06 | Compare accumulator (absolute,X)
	BPL $67			  ; 10 67 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1AC
; Address: $E5E646
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1AC:
	JSL $06F9DD		  ; 22 DD F9 06 | Jump to subroutine long
	STZ $00			  ; 64 00 | Store zero to zero page
	BCC $FF			  ; 90 FF | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $38			  ; 10 38 | Branch if positive
	BPL $24			  ; 10 24 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	CLD				  ; D8 | Clear decimal mode flag
	BMI $B8			  ; 30 B8 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1AD
; Address: $E5E68B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1AD:
	JSR $0000			; 20 00 00 | Jump to subroutine
	LDX $04FF			; AE FF 04 | Load from absolute address into X register
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPY $00FF			; CC FF 00 | Compare Y register (absolute)
	INC $FC58,X		  ; FE 58 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1AE
; Address: $E5E6C6
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1AE:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	CPY $DB0C			; CC 0C DB | Compare Y register (absolute)
	PEA #$FF00		   ; F4 00 FF | Push effective address to stack
	BRA $00			  ; 80 00 | Branch always
	AND $0AD7,Y		  ; 39 D7 0A | Logical AND with accumulator (absolute,Y)
	LDX $51			  ; A6 51 | Load from zero page into X register
	REP #$95			 ; C2 95 | Reset processor status bits
	STX $71			  ; 86 71 | Store X register to zero page
	BPL $00			  ; 10 00 | Branch if positive
	BRA $7F			  ; 80 7F | Branch always
	ORA $4BF7,Y		  ; 19 F7 4B | Logical OR with accumulator (absolute,Y)
	LDX $A251			; AE 51 A2 | Load from absolute address into X register
	LDX $51			  ; A6 51 | Load from zero page into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1E1E,X		  ; 1E 1E 1E | Arithmetic shift left (absolute,X)
	ROL $3C3C,X		  ; 3E 3C 3C | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1AF
; Address: $E5E72C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1AF:
	JSR $0020			; 20 20 00 | Jump to subroutine
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $0A08			; 0E 08 0A | Arithmetic shift left (absolute)
	ASL $0E0E			; 0E 0E 0E | Arithmetic shift left (absolute)
	ASL $4242			; 0E 42 42 | Hardware register operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1B3
; Address: $E5E752
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1B3:
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1BA
; Address: $E5E78C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1BA:
	JSR $3C32			; 20 32 3C | Jump to subroutine
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	EOR $45			  ; 45 45 | Exclusive OR with accumulator (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	TAX				  ; AA | Transfer accumulator to X register
	INY				  ; C8 | Increment Y register
	LDA				  ; BF AD FA 00 | Load from absolute long,X into accumulator
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR ($A8),Y		  ; 51 A8 | Exclusive OR with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1BB
; Address: $E5E7C3
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1BB:
	STA $56A851		  ; 8F 51 A8 56 | Store accumulator to absolute long address
	LDA #$75			 ; A9 75 | Load immediate value into accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT $8B			  ; 24 8B | Test bits in accumulator (zero page)
	JMP $1DBB			; 4C BB 1D | Jump to address
	TXA				  ; 8A | Transfer X register to accumulator
	PLB				  ; AB | Pull data bank register from stack
	DEY				  ; 88 | Decrement Y register
	CMP $BA			  ; C5 BA | Compare accumulator (zero page)
	LDA #$75			 ; A9 75 | Load immediate value into accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BIT $8B			  ; 24 8B | Test bits in accumulator (zero page)
	JMP $1DBB			; 4C BB 1D | Jump to address
	TXA				  ; 8A | Transfer X register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	STZ $9B			  ; 64 9B | Store zero to zero page
	EOR $BA			  ; 45 BA | Exclusive OR with accumulator (zero page)
	EOR $08BA			; 4D BA 08 | Exclusive OR with accumulator (absolute)
	STA $00FF,Y		  ; 99 FF 00 | Store accumulator to absolute,Y
	ORA $1D1E,Y		  ; 19 1E 1D | Logical OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	PLY				  ; 7A | Pull Y register from stack
	JMP ($B3FF)		  ; 6C FF B3 | Jump to address (absolute indirect)
	STY $521F			; 8C 1F 52 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1BC
; Address: $E5E832
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1BC:
	JSR $053F			; 20 3F 05 | Jump to subroutine
	BCC $FC			  ; 90 FC | Branch if carry clear
	BEQ $20			  ; F0 20 | Branch if equal
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1BD
; Address: $E5E840
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1BD:
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$BA			 ; E0 BA | Compare X register (immediate)
	INC $3EEC,X		  ; FE EC 3E | Increment (absolute,X)
	ORA $05FF			; 0D FF 05 | Logical OR with accumulator (absolute)
	LDA				  ; BF E2 00 F8 | Load from absolute long,X into accumulator
	INC $3F01,X		  ; FE 01 3F | Increment (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ADC ($88),Y		  ; 71 88 | Add with carry ((zero page),Y)
	BPL $8F			  ; 10 8F | Branch if positive
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	ASL $00FF			; 0E FF 00 | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	LSR $EF59			; 4E 59 EF | Logical shift right (absolute)
	LDX $1B0A			; AE 0A 1B | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1BE
; Address: $E5E888
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1BE:
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $000D			; 0D 0D 00 | Logical OR with accumulator (absolute)
	CPY #$B8			 ; C0 B8 | Compare Y register (immediate)
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	BVC $A7			  ; 50 A7 | Branch if overflow clear
	STZ $58			  ; 64 58 | Store zero to zero page
	BMI $4F			  ; 30 4F | Branch if negative
	SEC				  ; 38 | Set carry flag
	CPX $7A14			; EC 14 7A | Compare X register (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	SBC $D8			  ; E5 D8 | Subtract with carry (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	ORA $FB05,X		  ; 1D 05 FB | Logical OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	SBC $26			  ; E5 26 | Subtract with carry (zero page)
	INC				  ; 1A | Increment accumulator
	CPY $48			  ; C4 48 | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX $07			  ; E4 07 | Compare X register (zero page)
	SBC $04FD,X		  ; FD FD 04 | Subtract with carry (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1BF
; Address: $E5E906
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1BF:
	JSR $10A0			; 20 A0 10 | Jump to subroutine
	STZ $8F9C			; 9C 9C 8F | Store zero to absolute
	STA $004000		  ; 8F 00 40 00 | Store accumulator to absolute long address
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	LDA				  ; BF 20 FF 60 | Load from absolute long,X into accumulator
	BMI $FF			  ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1C0
; Address: $E5E91E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1C0:
	JSR $47E0			; 20 E0 47 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	ASL $E3FF,X		  ; 1E FF E3 | Arithmetic shift left (absolute,X)
	ASL $0705,X		  ; 1E 05 07 | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F FC 85 FB | Store accumulator to absolute long,X
	LSR $F9			  ; 46 F9 | Logical shift right (zero page)
	SEP #$E3			 ; E2 E3 | Set processor status bits
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	AND ($F1),Y		  ; 31 F1 | Logical AND with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1C1
; Address: $E5E94D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1C1:
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$E0			 ; A0 E0 | Game work RAM access
	PLP				  ; 28 | Pull processor status from stack
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SBC $A13F,Y		  ; F9 3F A1 | Subtract with carry (absolute,Y)
	STA				  ; 9F AE F9 8F | Store accumulator to absolute long,X
	LDX $A9F9			; AE F9 A9 | Load from absolute address into X register
	TXA				  ; 8A | Transfer X register to accumulator
	LDA $EAFFBB		  ; AF BB FF EA | Load from absolute long address into accumulator
	STA				  ; 9F 00 FF 00 | Store accumulator to absolute long,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1C3
; Address: $E5E983
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1C3:
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	LDX $4961			; AE 61 49 | Load from absolute address into X register
	DEC				  ; 3A | Decrement accumulator
	ADC #$39			 ; 69 39 | Add with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1C4
; Address: $E5E992
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1C4:
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	BVS $4F			  ; 70 4F | Branch if overflow set
	BVS $4F			  ; 70 4F | Branch if overflow set
	BVS $4F			  ; 70 4F | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF F0 F0 DF | Load from absolute long,X into accumulator
	BIT $0B			  ; 24 0B | Test bits in accumulator (zero page)
	AND $0AFA,Y		  ; 39 FA 0A | Logical AND with accumulator (absolute,Y)
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1C6
; Address: $E5EA24
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1C6:
	JSR $81D8			; 20 D8 81 | Jump to subroutine
	EOR ($42,X)		  ; 41 42 | Hardware register operation
	REP #$83			 ; C2 83 | Reset processor status bits
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	DEC $9CFF,X		  ; DE FF 9C | Decrement (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	STA				  ; 9F 9F 7C 7F | Store accumulator to absolute long,X
	CMP ($CD,X)		  ; C1 CD | Compare accumulator ((zero page,X))
	CMP ($CD,X)		  ; C1 CD | Compare accumulator ((zero page,X))
	CMP ($CF,X)		  ; C1 CF | Compare accumulator ((zero page,X))
	CPY #$CE			 ; C0 CE | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1C7
; Address: $E5EA51
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1C7:
	SED				  ; F8 | Set decimal mode flag
	EOR $43FE,X		  ; 5D FE 43 | Exclusive OR with accumulator (absolute,X)
	INC $FE41,X		  ; FE 41 FE | Increment (absolute,X)
	EOR ($FE,X)		  ; 41 FE | Exclusive OR with accumulator ((zero page,X))
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	BCC $80			  ; 90 80 | Branch if carry clear
	BRA $94			  ; 80 94 | Branch always
	REP #$C2			 ; C2 C2 | Reset processor status bits
	INC $FF1F,X		  ; FE 1F FF | Increment (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	SBC $FD7F,X		  ; FD 7F FD | Subtract with carry (absolute,X)
	EOR $32FF,X		  ; 5D FF 32 | Exclusive OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($54,X)		  ; 01 54 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1C8
; Address: $E5EAA5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1C8:
	JSR $FFFF			; 20 FF FF | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	BVS $F8			  ; 70 F8 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1C9
; Address: $E5EAB6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1C9:
	JSR $07DF			; 20 DF 07 | Jump to subroutine
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1CB
; Address: $E5EB09
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1CB:
	JSR $8080			; 20 80 80 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1CC
; Address: $E5EB1F
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1CC:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	NOP				  ; EA | No operation
	TAX				  ; AA | Transfer accumulator to X register
	BPL $90			  ; 10 90 | Branch if positive
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ORA ($91),Y		  ; 11 91 | Logical OR with accumulator ((zero page),Y)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	STA ($91),Y		  ; 91 91 | Store accumulator to (zero page),Y
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ORA ($E9,X)		  ; 01 E9 | Logical OR with accumulator ((zero page,X))
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ORA ($95),Y		  ; 11 95 | Logical OR with accumulator ((zero page),Y)
	ORA ($19),Y		  ; 11 19 | Logical OR with accumulator ((zero page),Y)
	ORA ($99),Y		  ; 11 99 | Logical OR with accumulator ((zero page),Y)
	ORA ($19),Y		  ; 11 19 | Logical OR with accumulator ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ORA $191B			; 0D 1B 19 | Logical OR with accumulator (absolute)
	AND $1D2D,X		  ; 3D 2D 1D | Logical AND with accumulator (absolute,X)
	BPL $0F			  ; 10 0F | Branch if positive
	BMI $0F			  ; 30 0F | Branch if negative
	BMI $2F			  ; 30 2F | Branch if negative
	BMI $2F			  ; 30 2F | Branch if negative
	JMP ($4201)		  ; 6C 01 42 | Hardware register operation
	BMI $B0			  ; 30 B0 | Branch if negative
	BMI $B0			  ; 30 B0 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $F8			  ; 80 F8 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1CD
; Address: $E5EBE0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1CD:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BMI $30			  ; 30 30 | Branch if negative
	BNE $80			  ; D0 80 | Branch if not equal

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1CE
; Address: $E5EBE7
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1CE:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $D0			  ; F0 D0 | Branch if equal
	BEQ $90			  ; F0 90 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal
	SBC #$99			 ; E9 99 | Subtract with carry (immediate)
	NOP				  ; EA | No operation
	PLX				  ; FA | Pull X register from stack
	INC $B4			  ; E6 B4 | Increment (zero page)
	STA $F5			  ; 85 F5 | Store accumulator to zero page
	BVS $F9			  ; 70 F9 | Branch if overflow set
	BVS $FB			  ; 70 FB | Branch if overflow set
	BVS $FE			  ; 70 FE | Branch if overflow set
	BVS $FD			  ; 70 FD | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $7F			  ; 70 7F | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	ADC ($54),Y		  ; 71 54 | Add with carry ((zero page),Y)
	SEP #$E2			 ; E2 E2 | Set processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $3BFE,X		  ; FE FE 3B | Increment (absolute,X)
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INC $1BFE,X		  ; FE FE 1B | Increment (absolute,X)
	STA $00B9,Y		  ; 99 B9 00 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEY				  ; 88 | Decrement Y register
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1CF
; Address: $E5EC78
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1CF:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $B0			  ; 30 B0 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1D5
; Address: $E5EC90
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1D5:
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $F0			  ; 10 F0 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1D6
; Address: $E5ECDD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1D6:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$13			 ; C0 13 | Compare Y register (immediate)
	INC				  ; 1A | Increment accumulator
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ORA $0909			; 0D 09 09 | Logical OR with accumulator (absolute)
	ORA $0604			; 0D 04 06 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	ROR $3F20,X		  ; 7E 20 3F | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1D7
; Address: $E5ECF4
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1D7:
	JSR $203F			; 20 3F 20 | Jump to subroutine
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CMP $DD44,X		  ; DD 44 DD | Compare accumulator (absolute,X)
	CPY $CCDD			; CC DD CC | Compare Y register (absolute)
	CMP $DDDD,X		  ; DD DD DD | Compare accumulator (absolute,X)
	CPY $99DD			; CC DD 99 | Compare Y register (absolute)
	STA $FFBB,Y		  ; 99 BB FF | Store accumulator to absolute,Y
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $22			  ; 66 22 | Rotate right (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA $3C01,Y		  ; 19 01 3C | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $F0			  ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1D8
; Address: $E5ED56
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1D8:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1D9
; Address: $E5ED62
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1D9:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0908			; 0D 08 09 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1DA
; Address: $E5ED80
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1DA:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $50			  ; 10 50 | Branch if positive
	BEQ $40			  ; F0 40 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	BNE $30			  ; D0 30 | Branch if not equal
	BEQ $D3			  ; F0 D3 | Branch if equal
	AND $003D,X		  ; 3D 3D 00 | Logical AND with accumulator (absolute,X)
	BIT $002C			; 2C 2C 00 | Test bits in accumulator (absolute)
	BIT $00FF			; 2C FF 00 | Test bits in accumulator (absolute)
	INC $E6			  ; E6 E6 | Increment (zero page)
	SBC $00FD,X		  ; FD FD 00 | Subtract with carry (absolute,X)
	DEC $D0			  ; C6 D0 | Decrement (zero page)
	AND $003D,X		  ; 3D 3D 00 | Logical AND with accumulator (absolute,X)
	BVS $10			  ; 70 10 | Branch if overflow set
	STA				  ; 9F 64 14 62 | Store accumulator to absolute long,X
	STA ($F9,X)		  ; 81 F9 | Store accumulator to (zero page,X)
	BIT $00FF			; 2C FF 00 | Test bits in accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1DB
; Address: $E5EDF8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1DB:
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	SBC ($F9),Y		  ; F1 F9 | Subtract with carry ((zero page),Y)
	SBC ($F9),Y		  ; F1 F9 | Subtract with carry ((zero page),Y)
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	SBC ($F9),Y		  ; F1 F9 | Subtract with carry ((zero page),Y)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1DC
; Address: $E5EE0A
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1DC:
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $75			  ; 80 75 | Branch always
	EOR ($D1),Y		  ; 51 D1 | Exclusive OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $FF			  ; 10 FF | Branch if positive
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	INC $00EE			; EE EE 00 | Increment (absolute)
	WDM #$42			 ; 42 42 | Hardware register operation
	ADC ($71,X)		  ; 61 71 | Add with carry ((zero page,X))
	SBC $18F9,Y		  ; F9 F9 18 | Subtract with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	AND $3B06,Y		  ; 39 06 3B | Logical AND with accumulator (absolute,Y)
	CPY #$5F			 ; C0 5F | Compare Y register (immediate)
	CPX #$6F			 ; E0 6F | Compare X register (immediate)
	BEQ $58			  ; F0 58 | Branch if equal
	AND $3B7F,Y		  ; 39 7F 3B | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	BCS $58			  ; B0 58 | Branch if carry set
	BNE $38			  ; D0 38 | Branch if not equal
	BCS $78			  ; B0 78 | Branch if carry set
	BVC $B8			  ; 50 B8 | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	BMI $C8			  ; 30 C8 | Branch if negative
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BEQ $A0			  ; F0 A0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BRA $F8			  ; 80 F8 | Branch always
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BMI $01			  ; 30 01 | Branch if negative
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1DD
; Address: $E5EEAF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1DD:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1DF
; Address: $E5EECA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1DF:
	JSR $20A0			; 20 A0 20 | Jump to subroutine
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1E0
; Address: $E5EED8
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1E0:
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	BIT $002C			; 2C 2C 00 | Test bits in accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $FEDD,X		  ; DD DD FE | Compare accumulator (absolute,X)
	INC $2F2F,X		  ; FE 2F 2F | Increment (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1E2
; Address: $E5EF26
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1E2:
	JSR $2360			; 20 60 23 | Jump to subroutine
	XBA				  ; EB | Exchange accumulator bytes
	PLB				  ; AB | Pull data bank register from stack
	AND $C0FD,X		  ; 3D FD C0 | Logical AND with accumulator (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	JMP $FF54FF		  ; 5C FF 54 FF | Jump to address long
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1E3
; Address: $E5EF40
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1E3:
	JSR $E03B			; 20 3B E0 | Game work RAM access
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	PEA #$E2E2		   ; F4 E2 E2 | Push effective address to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $AB2E			; 2E 2E AB | Rotate left (absolute)
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1E4
; Address: $E5EF50
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1E4:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	CMP ($FF),Y		  ; D1 FF | Compare accumulator ((zero page),Y)
	PHY				  ; 5A | Push Y register to stack
	STY $FF			  ; 84 FF | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1E5
; Address: $E5EF60
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1E5:
	JSR $2025			; 20 25 20 | Jump to subroutine
	AND ($20,X)		  ; 21 20 | Logical AND with accumulator ((zero page,X))
	AND $20			  ; 25 20 | Logical AND with accumulator (zero page)
	AND $E0			  ; 25 E0 | Game work RAM access
	CPX $E1			  ; E4 E1 | Compare X register (zero page)
	SBC $E1			  ; E5 E1 | Subtract with carry (zero page)
	SBC $F1			  ; E5 F1 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1E7
; Address: $E5EF74
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1E7:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR $F7FF			; 6E FF F7 | Rotate right (absolute)
	SBC $8DFF			; ED FF 8D | Subtract with carry (absolute)
	STA $D2FF			; 8D FF D2 | Store accumulator to absolute address
	AND $003D,X		  ; 3D 3D 00 | Logical AND with accumulator (absolute,X)
	BIT $002C			; 2C 2C 00 | Test bits in accumulator (absolute)
	AND $00FE			; 2D FE 00 | Logical AND with accumulator (absolute)
	LDA $00E6E6		  ; AF E6 E6 00 | Load from absolute long address into accumulator
	SBC $00FD,X		  ; FD FD 00 | Subtract with carry (absolute,X)
	DEC $D0			  ; C6 D0 | Decrement (zero page)
	SBC $08FA,Y		  ; F9 FA 08 | Subtract with carry (absolute,Y)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	SBC $09FA,Y		  ; F9 FA 09 | Subtract with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA ($E2,X)		  ; 01 E2 | Logical OR with accumulator ((zero page,X))
	STA $308E0E		  ; 8F 0E 8E 30 | Store accumulator to absolute long address
	LDA				  ; BF 00 80 0F | Load from absolute long,X into accumulator
	STA $06A323		  ; 8F 23 A3 06 | Store accumulator to absolute long address
	STX $0C			  ; 86 0C | Store X register to zero page
	CPY $FF10			; CC 10 FF | Compare Y register (absolute)
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	STZ $009E,X		  ; 9E 9E 00 | Store zero to absolute,X
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	SBC ($F5),Y		  ; F1 F5 | Subtract with carry ((zero page),Y)
	SBC ($F5),Y		  ; F1 F5 | Subtract with carry ((zero page),Y)
	SBC ($F5),Y		  ; F1 F5 | Subtract with carry ((zero page),Y)
	ADC $397D,Y		  ; 79 7D 39 | Add with carry (absolute,Y)
	AND $0F0F,Y		  ; 39 0F 0F | Logical AND with accumulator (absolute,Y)
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1E8
; Address: $E5F096
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1E8:
	AND $197F,Y		  ; 39 7F 19 | Logical AND with accumulator (absolute,Y)
	SEP #$E2			 ; E2 E2 | Set processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	SEP #$E2			 ; E2 E2 | Set processor status bits
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STA $95FF,X		  ; 9D FF 95 | Store accumulator to absolute,X
	STA $9CFF			; 8D FF 9C | Store accumulator to absolute address
	INC $FC9C,X		  ; FE 9C FC | Increment (absolute,X)
	BPL $F0			  ; 10 F0 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CMP ($D3),Y		  ; D1 D3 | Compare accumulator ((zero page),Y)
	AND $002C			; 2D 2C 00 | Logical AND with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01FE			; 0D FE 01 | Logical OR with accumulator (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	PHB				  ; 8B | Push data bank register to stack
	STA $601D,X		  ; 9D 1D 60 | Store accumulator to absolute,X
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PEA #$E0FF		   ; F4 FF E0 | Game work RAM access
	BRA $FF			  ; 80 FF | Branch always
	SBC $01FA,Y		  ; F9 FA 01 | Subtract with carry (absolute,Y)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	SBC $F9FE,Y		  ; F9 FE F9 | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $01			  ; 80 01 | Branch always
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	EOR ($83,X)		  ; 41 83 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1E9
; Address: $E5F12F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1E9:
	JSL $1FFF1E		  ; 22 1E FF 1F | Jump to subroutine long
	ASL $9EFF,X		  ; 1E FF 9E | Arithmetic shift left (absolute,X)
	LDA				  ; BF 7C BF 07 | Load from absolute long,X into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1EA
; Address: $E5F143
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1EA:
	STZ $603F,X		  ; 9E 3F 60 | Store zero to absolute,X
	ROL $0302,X		  ; 3E 02 03 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	INC $7FFF,X		  ; FE FF 7F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1EB
; Address: $E5F156
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1EB:
	ROL $017F,X		  ; 3E 7F 01 | Rotate left (absolute,X)
	ORA $0E1F			; 0D 1F 0E | Logical OR with accumulator (absolute)
	ROR $007E,X		  ; 7E 7E 00 | Rotate right (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	LDY $85			  ; A4 85 | Load from zero page into Y register
	LDX $87			  ; A6 87 | Load from zero page into X register
	LDY $87			  ; A4 87 | Load from zero page into Y register
	LDY $AD			  ; A4 AD | Load from zero page into Y register
	STY $BC8D			; 8C 8D BC | Store Y register to absolute address
	STA $85AE			; 8D AE 85 | Store accumulator to absolute address
	LDX $03			  ; A6 03 | Load from zero page into X register
	INC $FE33			; EE 33 FE | Increment (absolute)
	WDM #$42			 ; 42 42 | Hardware register operation
	AND ($E3,X)		  ; 21 E3 | Logical AND with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	BRA $EB			  ; 80 EB | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	CPX $9F			  ; E4 9F | Compare X register (zero page)
	STA $FFFF,X		  ; 9D FF FF | Store accumulator to absolute,X
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	DEC $00DE,X		  ; DE DE 00 | Decrement (absolute,X)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	ORA ($E6,X)		  ; 01 E6 | Logical OR with accumulator ((zero page,X))
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	SBC ($F4),Y		  ; F1 F4 | Subtract with carry ((zero page),Y)
	CLV				  ; B8 | Clear overflow flag
	TSX				  ; BA | Transfer stack pointer to X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	SBC $FF0B,X		  ; FD 0B FF | Subtract with carry (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	STZ $87			  ; 64 87 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1EC
; Address: $E5F228
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1EC:
	JSR $0160			; 20 60 01 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CLV				  ; B8 | Clear overflow flag
	CLD				  ; D8 | Clear decimal mode flag
	LDA				  ; BF DC FF DC | Load from absolute long,X into accumulator
	INC $FF3F,X		  ; FE 3F FF | Increment (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $172C			; 6D 2C 17 | Add with carry (absolute)
	INC				  ; 1A | Increment accumulator
	ORA $8002,X		  ; 1D 02 80 | Logical OR with accumulator (absolute,X)
	ADC $7AFF,X		  ; 7D FF 7A | Add with carry (absolute,X)
	AND $1F7F,X		  ; 3D 7F 1F | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1ED
; Address: $E5F280
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1ED:
	STA $A6			  ; 85 A6 | Store accumulator to zero page
	LDY $87			  ; A4 87 | Load from zero page into Y register
	LDY $B1			  ; A4 B1 | Load from zero page into Y register
	BMI $85			  ; 30 85 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	CMP $DD44,X		  ; DD 44 DD | Compare accumulator (absolute,X)
	CMP $DD44,X		  ; DD 44 DD | Compare accumulator (absolute,X)
	CMP $DDDD,X		  ; DD DD DD | Compare accumulator (absolute,X)
	ROR $BB			  ; 66 BB | Rotate right (zero page)
	ROR $BB			  ; 66 BB | Rotate right (zero page)
	ROR $BB			  ; 66 BB | Rotate right (zero page)
	ROR $AA			  ; 66 AA | Rotate right (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	JMP $00005C		  ; 5C 5C 00 00 | Jump to address long
	TAX				  ; AA | Transfer accumulator to X register
	SBC $1EFF,X		  ; FD FF 1E | Subtract with carry (absolute,X)
	AND $3F25,Y		  ; 39 25 3F | Logical AND with accumulator (absolute,Y)
	ROL $1A3F,X		  ; 3E 3F 1A | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	STA $4A			  ; 85 4A | Store accumulator to zero page
	EOR #$86			 ; 49 86 | Exclusive OR with accumulator (immediate)
	STA $42			  ; 85 42 | Hardware register operation
	STA $0A			  ; 85 0A | Store accumulator to zero page
	CMP ($06,X)		  ; C1 06 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STA $7A			  ; 85 7A | Store accumulator to zero page
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $1135,X		  ; 1E 35 11 | Arithmetic shift left (absolute,X)
	AND $8103,Y		  ; 39 03 81 | Logical AND with accumulator (absolute,Y)
	CMP $3A83			; CD 83 3A | Compare accumulator (absolute)
	STA ($C3,X)		  ; 81 C3 | Store accumulator to (zero page,X)
	STA ($04),Y		  ; 91 04 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1EE
; Address: $E5F351
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1EE:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $B57E,X		  ; 7E 7E B5 | Rotate right (absolute,X)
	ROR $7CBB,X		  ; 7E BB 7C | Rotate right (absolute,X)
	LDA $427E,Y		  ; B9 7E 42 | Hardware register operation
	LDA $DB56,X		  ; BD 56 DB | Load from absolute,X into accumulator
	LDA				  ; BF C7 C7 9B | Load from absolute long,X into accumulator
	LDA				  ; BF 8B AB DB | Load from absolute long,X into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP $5E5E5C		  ; 5C 5C 5E 5E | Jump to address long
	ADC ($75),Y		  ; 71 75 | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1EF
; Address: $E5F389
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1EF:
	ROR $E0			  ; 66 E0 | Game work RAM access
	CPX $F0			  ; E4 F0 | Compare X register (zero page)
	PEA #$E4E0		   ; F4 E0 E4 | Push effective address to stack
	LDA $FF			  ; A5 FF | Load from zero page into accumulator
	STY $FF			  ; 84 FF | Store Y register to zero page
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	LDY #$FF			 ; A0 FF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1F1
; Address: $E5F3A0
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1F1:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	REP #$C2			 ; C2 C2 | Reset processor status bits
	SEP #$E2			 ; E2 E2 | Set processor status bits
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	ADC $3DFF,X		  ; 7D FF 3D | Add with carry (absolute,X)
	CMP $DFFF,X		  ; DD FF DF | Compare accumulator (absolute,X)
	CMP $C8FF			; CD FF C8 | Compare accumulator (absolute)
	BCC $EF			  ; 90 EF | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	AND $78C0,X		  ; 3D C0 78 | Logical AND with accumulator (absolute,X)
	BRA $B8			  ; 80 B8 | Branch always
	ASL $1700			; 0E 00 17 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	AND $1800,X		  ; 3D 00 18 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	STZ $65			  ; 64 65 | Store zero to zero page
	LDA ($BF),Y		  ; B1 BF | Load from (zero page),Y into accumulator
	SBC $BE			  ; E5 BE | Subtract with carry (zero page)
	EOR $1132			; 4D 32 11 | Exclusive OR with accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1F2
; Address: $E5F40C
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1F2:
	DEC $06F0			; CE F0 06 | Decrement (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	STY $78			  ; 84 78 | Store Y register to zero page
	STY $78			  ; 84 78 | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	CPX #$E2			 ; E0 E2 | Compare X register (immediate)
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1FA
; Address: $E5F466
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1FA:
	SEP #$E2			 ; E2 E2 | Set processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	CMP $CDFF			; CD FF CD | Compare accumulator (absolute)
	CMP $DDFF			; CD FF DD | Compare accumulator (absolute)
	CMP $FF			  ; C5 FF | Compare accumulator (zero page)
	CMP $CDFF			; CD FF CD | Compare accumulator (absolute)
	BEQ $04			  ; F0 04 | Branch if equal
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	INC $F884,X		  ; FE 84 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CMP #$F6			 ; C9 F6 | Compare accumulator (immediate)
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	STA $303F,X		  ; 9D 3F 30 | Store accumulator to absolute,X
	ROL $2626,X		  ; 3E 26 26 | Rotate left (absolute,X)
	ORA $8E3F,Y		  ; 19 3F 8E | Logical OR with accumulator (absolute,Y)
	LDX $3C21			; AE 21 3C | Load from absolute address into X register
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1FB
; Address: $E5F4B4
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1FB:
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP $C000,Y		  ; D9 00 C0 | Compare accumulator (absolute,Y)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	ADC $3542			; 6D 42 35 | Add with carry (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA				  ; 9F E0 D5 E0 | Store accumulator to absolute long,X
	WDM #$72			 ; 42 72 | Reserved instruction
	CMP $CCE1,Y		  ; D9 E1 CC | Compare accumulator (absolute,Y)
	BEQ $4F			  ; F0 4F | Branch if equal
	BVS $80			  ; 70 80 | Branch if overflow set
	BRA $7F			  ; 80 7F | Branch always
	AND $7E01,X		  ; 3D 01 7E | Logical AND with accumulator (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $1E15			; 0D 15 1E | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1FC
; Address: $E5F4EE
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1FC:
	JSL $00003D		  ; 22 3D 00 00 | Jump to subroutine long
	INC $983C,X		  ; FE 3C 98 | Increment (absolute,X)
	BIT $3A			  ; 24 3A | Test bits in accumulator (zero page)
	ROL $BC88,X		  ; 3E 88 BC | Rotate left (absolute,X)
	ROL $3C			  ; 26 3C | Rotate left (zero page)
	LSR $C300			; 4E 00 C3 | Logical shift right (absolute)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ASL $3F21,X		  ; 1E 21 3F | Arithmetic shift left (absolute,X)
	BIT $4137			; 2C 37 41 | Test bits in accumulator (absolute)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	AND $6636,Y		  ; 39 36 66 | Logical AND with accumulator (absolute,Y)
	ADC $EAD5,Y		  ; 79 D5 EA | Add with carry (absolute,Y)
	NOP				  ; EA | No operation
	CLV				  ; B8 | Clear overflow flag
	LDA $F7CA			; AD CA F7 | Load from absolute address into accumulator
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $89			  ; 80 89 | Branch always
	STA				  ; 9F BF 8F AF | Store accumulator to absolute long,X
	CLV				  ; B8 | Clear overflow flag
	LDX $BB9B,Y		  ; BE 9B BB | Load from absolute,Y into X register
	BRA $FF			  ; 80 FF | Branch always
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	CMP $01F9,Y		  ; D9 F9 01 | Compare accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	WDM #$FF			 ; 42 FF | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	JMP $3D026B		  ; 5C 6B 02 3D | Jump to address long
	BIT $49			  ; 24 49 | Test bits in accumulator (zero page)
	AND $1F			  ; 25 1F | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1FD
; Address: $E5F5AF
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1FD:
	ROL $7F00			; 2E 00 7F | Rotate left (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	LDA				  ; BF B2 AA 4C | Load from absolute long,X into accumulator
	DEC $ED60,X		  ; DE 60 ED | Decrement (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	CLV				  ; B8 | Clear overflow flag
	LSR $40FF			; 4E FF 40 | Logical shift right (absolute)
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	ORA ($1D),Y		  ; 11 1D | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	EOR $7F			  ; 45 7F | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1FE
; Address: $E5F5F2
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1FE:
	JSL $3F353F		  ; 22 3F 35 3F | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BIT $383D			; 2C 3D 38 | Test bits in accumulator (absolute)
	PLX				  ; FA | Pull X register from stack
	BVS $74			  ; 70 74 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	INC $FD07,X		  ; FE 07 FD | Increment (absolute,X)
	STA $CFFFFB		  ; 8F FB FF CF | Store accumulator to absolute long address
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	TAY				  ; A8 | Transfer accumulator to Y register
	INX				  ; E8 | Increment X register
	LDX #$DB			 ; A2 DB | Load immediate value into X register
	EOR $1676,Y		  ; 59 76 16 | Exclusive OR with accumulator (absolute,Y)
	AND $682D			; 2D 2D 68 | Logical AND with accumulator (absolute)
	LSR $221E,X		  ; 5E 1E 22 | Logical shift right (absolute,X)
	BRA $C0			  ; 80 C0 | Branch always
	BPL $F8			  ; 10 F8 | Branch if positive
	BRA $FF			  ; 80 FF | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_1FF
; Address: $E5F63C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_1FF:
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	ROR				  ; 6A | Rotate right (accumulator)
	CPY $9B6C			; CC 6C 9B | Compare Y register (absolute)
	ORA ($77),Y		  ; 11 77 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_200
; Address: $E5F64E
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_200:
	JSR $0027			; 20 27 00 | Jump to subroutine
	BRA $04			  ; 80 04 | Branch always
	DEY				  ; 88 | Decrement Y register
	SBC $7858,X		  ; FD 58 78 | Subtract with carry (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	STZ $FFBC,X		  ; 9E BC FF | Store zero to absolute,X
	BRA $FF			  ; 80 FF | Branch always
	DEC $FF00,X		  ; DE 00 FF | Decrement (absolute,X)
	EOR $16FF,X		  ; 5D FF 16 | Exclusive OR with accumulator (absolute,X)
	SBC #$C4			 ; E9 C4 | Subtract with carry (immediate)
	DEC				  ; 3A | Decrement accumulator
	LDX $0000,Y		  ; BE 00 00 | Load from absolute,Y into X register
	EOR ($EF,X)		  ; 41 EF | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	STA $739D,Y		  ; 99 9D 73 | Store accumulator to absolute,Y
	INC $E808,X		  ; FE 08 E8 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($BF,X)		  ; 01 BF | Logical OR with accumulator ((zero page,X))
	ASL $0101,X		  ; 1E 01 01 | Arithmetic shift left (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	TSX				  ; BA | Transfer stack pointer to X register
	LSR $F848			; 4E 48 F8 | Logical shift right (absolute)
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BRA $FE			  ; 80 FE | Branch always
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	LDY $A4			  ; A4 A4 | Load from zero page into Y register
	XBA				  ; EB | Exchange accumulator bytes
	PHY				  ; 5A | Push Y register to stack
	LDY $5B			  ; A4 5B | Load from zero page into Y register
	SBC $FF00			; ED 00 FF | Subtract with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	SBC $00D6			; ED D6 00 | Subtract with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	REP #$3D			 ; C2 3D | Reset processor status bits
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	PLY				  ; 7A | Pull Y register from stack
	ADC $1D43,X		  ; 7D 43 1D | Add with carry (absolute,X)
	AND $4953			; 2D 53 49 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_201
; Address: $E5F730
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_201:
	WDM #$7E			 ; 42 7E | Reserved instruction
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	ROL $6600,X		  ; 3E 00 66 | Rotate left (absolute,X)
	ASL $0402			; 0E 02 04 | Arithmetic shift left (absolute)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $0402			; 0E 02 04 | Arithmetic shift left (absolute)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $0C5D,X		  ; 5D 5D 0C | Exclusive OR with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $18			  ; 10 18 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	LDX #$E3			 ; A2 E3 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BMI $1C			  ; 30 1C | Branch if negative
	BPL $08			  ; 10 08 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_202
; Address: $E5F789
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_202:
	JSR $1C38			; 20 38 1C | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $C3			  ; 10 C3 | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_203
; Address: $E5F792
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_203:
	JSR $1000			; 20 00 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_204
; Address: $E5F79A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_204:
	JSR $1000			; 20 00 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BVS $40			  ; 70 40 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_205
; Address: $E5F7A3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_205:
	JSR $0020			; 20 20 00 | Jump to subroutine
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_207
; Address: $E5F7AF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_207:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $40			  ; 80 40 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_20A
; Address: $E5F7BC
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_20A:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	JMP ($5E22)		  ; 6C 22 5E | Jump to address (absolute indirect)
	LDX $B8C2,Y		  ; BE C2 B8 | Load from absolute,Y into X register
	DEC $B4			  ; C6 B4 | Decrement (zero page)
	DEX				  ; CA | Decrement X register
	INC $7E42			; EE 42 7E | Increment (absolute)
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	LDA $5A			  ; A5 5A | Load from zero page into accumulator
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	LDX $ACDF			; AE DF AC | Load from absolute address into X register
	STA $97EA,X		  ; 9D EA 97 | Store accumulator to absolute,X
	NOP				  ; EA | No operation
	LDA $A9D6			; AD D6 A9 | Load from absolute address into accumulator
	ADC ($9E),Y		  ; 71 9E | Add with carry ((zero page),Y)
	LDA				  ; BF DA 76 DB | Load from absolute long,X into accumulator
	ROR $DB			  ; 66 DB | Rotate right (zero page)
	EOR #$77			 ; 49 77 | Exclusive OR with accumulator (immediate)
	EOR ($7F),Y		  ; 51 7F | Exclusive OR with accumulator ((zero page),Y)
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	EOR ($7F),Y		  ; 51 7F | Exclusive OR with accumulator ((zero page),Y)
	ROL $0A0A,X		  ; 3E 0A 0A | Rotate left (absolute,X)
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0402			; 0E 02 04 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_20B
; Address: $E5F87E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_20B:
	BPL $00			  ; 10 00 | Branch if positive
	BMI $38			  ; 30 38 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_20C
; Address: $E5F88A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_20C:
	JSR $101C			; 20 1C 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_20E
; Address: $E5F89A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_20E:
	JSR $1000			; 20 00 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_20F
; Address: $E5F8A3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_20F:
	JSR $4060			; 20 60 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	BEQ $70			  ; F0 70 | Branch if equal
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_210
; Address: $E5F8AB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_210:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_211
; Address: $E5F8B4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_211:
	JSR $6000			; 20 00 60 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_212
; Address: $E5F8BC
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_212:
	JSR $0000			; 20 00 00 | Jump to subroutine
	INC $FE8A			; EE 8A FE | Increment (absolute)
	LDY $24FC			; AC FC 24 | Load from absolute address into Y register
	BVC $50			  ; 50 50 | Branch if overflow clear
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE8A,X		  ; FE 8A FE | Increment (absolute,X)
	BIT $507C			; 2C 7C 50 | Test bits in accumulator (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	INC $FE3F,X		  ; FE 3F FE | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $3F00,X		  ; FE 00 3F | Increment (absolute,X)
	NOP				  ; EA | No operation
	LDX $6E			  ; A6 6E | Load from zero page into X register
	ROR				  ; 6A | Rotate right (accumulator)
	INC $EE33			; EE 33 EE | Increment (absolute)
	CPY $DD33			; CC 33 DD | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_213
; Address: $E5F90F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_213:
	JSL $00FF00		  ; 22 00 FF 00 | Jump to subroutine long
	ROR $DB			  ; 66 DB | Rotate right (zero page)
	ADC $DA			  ; 65 DA | Add with carry (zero page)
	LDA $B55A			; AD 5A B5 | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_215
; Address: $E5F92D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_215:
	JSR $24DB			; 20 DB 24 | Jump to subroutine
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $1A3F,X		  ; 1D 3F 1A | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_216
; Address: $E5F954
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_216:
	JSR $403F			; 20 3F 40 | Jump to subroutine
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ROR $DCFE			; 6E FE DC | Rotate right (absolute)
	INC $FEBC,X		  ; FE BC FE | Increment (absolute,X)
	BVS $FC			  ; 70 FC | Branch if overflow set
	BPL $F0			  ; 10 F0 | Branch if positive
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($1E),Y		  ; 11 1E | Logical OR with accumulator ((zero page),Y)
	ORA $0916,Y		  ; 19 16 09 | Logical OR with accumulator (absolute,Y)
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	CLV				  ; B8 | Clear overflow flag
	TAY				  ; A8 | Transfer accumulator to Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_217
; Address: $E5F9A9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_217:
	SED				  ; F8 | Set decimal mode flag
	CPX $6CB4			; EC B4 6C | Compare X register (absolute)
	LDX $7E			  ; A6 7E | Load from zero page into X register
	BPL $10			  ; 10 10 | Branch if positive
	BCS $B0			  ; B0 B0 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $02FE,X		  ; FE FE 02 | Increment (absolute,X)
	INC $E2FF,X		  ; FE FF E2 | Increment (absolute,X)
	INC $FE3F,X		  ; FE 3F FE | Increment (absolute,X)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	LSR $6AA1,X		  ; 5E A1 6A | Logical shift right (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $4DB6			; ED B6 4D | Subtract with carry (absolute)
	INC				  ; 1A | Increment accumulator
	SBC $96			  ; E5 96 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_218
; Address: $E5F9ED
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_218:
	ADC $6D96			; 6D 96 6D | Add with carry (absolute)
	PHX				  ; DA | Push X register to stack
	AND $DA			  ; 25 DA | Logical AND with accumulator (zero page)
	AND $DA			  ; 25 DA | Logical AND with accumulator (zero page)
	AND $79			  ; 25 79 | Logical AND with accumulator (zero page)
	STX $33			  ; 86 33 | Store X register to zero page
	CPY $49BE			; CC BE 49 | Compare Y register (absolute)
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_21B
; Address: $E5FA32
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_21B:
	CLV				  ; B8 | Clear overflow flag
	JMP $9F7F			; 4C 7F 9F | Jump to address
	BCC $F0			  ; 90 F0 | Branch if carry clear
	BPL $E8			  ; 10 E8 | Branch if positive
	WDM #$A2			 ; 42 A2 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	CPY $04C8			; CC C8 04 | Compare Y register (absolute)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ORA $E3FF,X		  ; 1D FF E3 | Logical OR with accumulator (absolute,X)
	INC $FFF9,X		  ; FE F9 FF | Increment (absolute,X)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_21C
; Address: $E5FA61
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_21C:
	JSR $300F			; 20 0F 30 | Jump to subroutine
	BMI $17			  ; 30 17 | Branch if negative
	SEC				  ; 38 | Set carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	AND $171B,X		  ; 3D 1B 17 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $3F			  ; 10 3F | Branch if positive

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_21D
; Address: $E5FA7A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_21D:
	JSR $183F			; 20 3F 18 | Jump to subroutine
	DEX				  ; CA | Decrement X register
	TXA				  ; 8A | Transfer X register to accumulator
	CPX $FC4C			; EC 4C FC | Compare X register (absolute)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	BPL $08			  ; 10 08 | Branch if positive
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FCFC,X		  ; FE FC FC | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	INC $FEE2,X		  ; FE E2 FE | Increment (absolute,X)
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	INC $E5FF,X		  ; FE FF E5 | Increment (absolute,X)
	SBC $FD3F,X		  ; FD 3F FD | Subtract with carry (absolute,X)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_21E
; Address: $E5FAAA
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_21E:
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	EOR $57A9			; 4D A9 57 | Exclusive OR with accumulator (absolute)
	AND $64D3			; 2D D3 64 | Logical AND with accumulator (absolute)
	STZ $DB			  ; 64 DB | Store zero to zero page
	XBA				  ; EB | Exchange accumulator bytes
	TXS				  ; 9A | Transfer X register to stack pointer
	SBC $DDAA			; ED AA DD | Subtract with carry (absolute)
	PHY				  ; 5A | Push Y register to stack
	LDA $CB56,Y		  ; B9 56 CB | Load from absolute,Y into accumulator
	CMP ($7F),Y		  ; D1 7F | Compare accumulator ((zero page),Y)
	INC $F8F8,X		  ; FE F8 F8 | Increment (absolute,X)
	AND $0E3D,X		  ; 3D 3D 0E | Logical AND with accumulator (absolute,X)
	ASL $1C1C			; 0E 1C 1C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	ORA $073F,Y		  ; 19 3F 07 | Logical OR with accumulator (absolute,Y)
	ORA $7242,X		  ; 1D 42 72 | Logical OR with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_220
; Address: $E5FB2A
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_220:
	BVS $70			  ; 70 70 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	STA $95FF			; 8D FF 95 | Store accumulator to absolute address
	AND $DCFF			; 2D FF DC | Logical AND with accumulator (absolute)
	INC $FC9C,X		  ; FE 9C FC | Increment (absolute,X)
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BNE $F8			  ; D0 F8 | Branch if not equal
	TAY				  ; A8 | Transfer accumulator to Y register
	CLV				  ; B8 | Clear overflow flag
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	CMP $DD2F,X		  ; DD 2F DD | Compare accumulator (absolute,X)
	ADC $55DF,X		  ; 7D DF 55 | Add with carry (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_221
; Address: $E5FB86
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_221:
	PLB				  ; AB | Pull data bank register from stack
	LDA				  ; BF F7 BF F7 | Load from absolute long,X into accumulator
	LDA				  ; BF B5 FF 00 | Load from absolute long,X into accumulator
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY $BF9F,X		  ; BC 9F BF | Load from absolute,X into Y register
	STA				  ; 9F 9F 80 B0 | Store accumulator to absolute long,X
	CMP ($D1),Y		  ; D1 D1 | Compare accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	ORA $FB1D,Y		  ; 19 1D FB | Logical OR with accumulator (absolute,Y)
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	EOR ($D1),Y		  ; 51 D1 | Exclusive OR with accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BVC $FF			  ; 50 FF | Branch if overflow clear
	ASL $0808,X		  ; 1E 08 08 | Arithmetic shift left (absolute,X)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $1C0E			; 0E 0E 1C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_223
; Address: $E5FC0A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_223:
	BVS $70			  ; 70 70 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	BCC $F0			  ; 90 F0 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_225
; Address: $E5FC19
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_225:
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BEQ $D0			  ; F0 D0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	ORA $0D0F			; 0D 0F 0D | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TSX				  ; BA | Transfer stack pointer to X register
	LDA $ADEF,X		  ; BD EF AD | Load from absolute,X into accumulator
	LDA $10FF			; AD FF 10 | Load from absolute address into accumulator
	BPL $EF			  ; 10 EF | Branch if positive
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	LDY #$5F			 ; A0 5F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_226
; Address: $E5FC58
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_226:
	JSR $20DF			; 20 DF 20 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	ADC $EDBF			; 6D BF ED | Add with carry (absolute)
	LDA				  ; BF BD FF BF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_227
; Address: $E5FC70
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_227:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	STA $B737,X		  ; 9D 37 B7 | Store accumulator to absolute,X
	STA				  ; 9F 9F 15 FF | Store accumulator to absolute long,X
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_228
; Address: $E5FC9E
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_228:
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	EOR ($51),Y		  ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	DEX				  ; CA | Decrement X register
	PLB				  ; AB | Pull data bank register from stack
	BRA $7F			  ; 80 7F | Branch always
	DEC				  ; 3A | Decrement accumulator
	STY $FF			  ; 84 FF | Store Y register to zero page
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	ORA $1B0F			; 0D 0F 1B | Logical OR with accumulator (absolute)
	ORA $001F,X		  ; 1D 1F 00 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_229
; Address: $E5FCFA
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_229:
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	LDA $EBFF			; AD FF EB | Load from absolute address into accumulator
	DEY				  ; 88 | Decrement Y register
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 40 BF 40 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 FF BF | Load from absolute long,X into accumulator
	INC $ACFF,X		  ; FE FF AC | Increment (absolute,X)
	ADC $75FF,X		  ; 7D FF 75 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_22B
; Address: $E5FD38
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_22B:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	INC $F6FE,X		  ; FE FE F6 | Increment (absolute,X)
	PEA #$ACF4		   ; F4 F4 AC | Push effective address to stack
	LDY $9D9D			; AC 9D 9D | Load from absolute address into Y register
	BPL $10			  ; 10 10 | Branch if positive
	BIT $5A			  ; 24 5A | Test bits in accumulator (zero page)
	LDA $52			  ; A5 52 | Load from zero page into accumulator
	LDA $8B74			; AD 74 8B | Load from absolute address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $1472			; 8D 72 14 | Store accumulator to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	AND $B5			  ; 25 B5 | Logical AND with accumulator (zero page)
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	LDY $A4			  ; A4 A4 | Load from zero page into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	ROR				  ; 6A | Rotate right (accumulator)
	STA ($6E),Y		  ; 91 6E | Store accumulator to (zero page),Y
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_22C
; Address: $E5FD7C
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_22C:
	JSR $A0DF			; 20 DF A0 | Jump to subroutine
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $5757			; 4D 57 57 | Exclusive OR with accumulator (absolute)
	ASL $EC0E			; 0E 0E EC | Arithmetic shift left (absolute)
	CPX $3F3F			; EC 3F 3F | Compare X register (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	ROL $73BE,X		  ; 3E BE 73 | Rotate left (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	SBC #$E9			 ; E9 E9 | Subtract with carry (immediate)
	SBC $00FD,X		  ; FD FD 00 | Subtract with carry (absolute,X)
	ROL $53FF			; 2E FF 53 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_22D
; Address: $E5FDB6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_22D:
	TYA				  ; 98 | Transfer Y register to accumulator
	DEC $8AFF,X		  ; DE FF 8A | Decrement (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	LDA $DBBB9B		  ; AF 9B BB DB | Load from absolute long address into accumulator
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	WDM #$FF			 ; 42 FF | Reserved instruction
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$2A			 ; C0 2A | Compare Y register (immediate)
	SBC $0700,X		  ; FD 00 07 | Subtract with carry (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $1CF0			; 0E F0 1C | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_22E
; Address: $E5FE02
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_22E:
	ORA ($E6,X)		  ; 01 E6 | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	BEQ $08			  ; F0 08 | Branch if equal
	INX				  ; E8 | Increment X register
	BPL $2C			  ; 10 2C | Branch if positive
	BPL $60			  ; 10 60 | Branch if positive
	BRA $E7			  ; 80 E7 | Branch always
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	INC $DB01,X		  ; FE 01 DB | Increment (absolute,X)
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	BVS $8F			  ; 70 8F | Branch if overflow set
	JMP $E916A3		  ; 5C A3 16 E9 | Jump to address long
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_22F
; Address: $E5FE46
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_22F:
	JSR $48DD			; 20 DD 48 | Jump to subroutine
	PHY				  ; 5A | Push Y register to stack
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 81 7E 83 | Load from absolute long,X into accumulator
	STA $78			  ; 85 78 | Store accumulator to zero page
	SEI				  ; 78 | Set interrupt disable flag
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	ORA $1B1F,Y		  ; 19 1F 1B | Logical OR with accumulator (absolute,Y)
	ORA $1D1F,X		  ; 1D 1F 1D | Logical OR with accumulator (absolute,X)
	ORA $1F1F,X		  ; 1D 1F 1F | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	INC $FFB7,X		  ; FE B7 FF | Increment (absolute,X)
	CMP $4AB5			; CD B5 4A | Compare accumulator (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_230
; Address: $E5FEAA
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_230:
	DEY				  ; 88 | Decrement Y register
	ADC $F7F5,X		  ; 7D F5 F7 | Add with carry (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	LDA ($B1),Y		  ; B1 B1 | Load from (zero page),Y into accumulator
	INC $C6FE,X		  ; FE FE C6 | Increment (absolute,X)
	DEC $EE			  ; C6 EE | Decrement (zero page)
	INC $FFFF			; EE FF FF | Increment (absolute)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDX $FF			  ; A6 FF | Load from zero page into X register
	CPX $81FF			; EC FF 81 | Compare X register (absolute)
	LDA $6DFF,Y		  ; B9 FF 6D | Load from absolute,Y into accumulator
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	STA ($91),Y		  ; 91 91 | Store accumulator to (zero page),Y
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_231
; Address: $E5FEF0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_231:
	JSR $9AFF			; 20 FF 9A | Jump to subroutine
	ORA $37FF,X		  ; 1D FF 37 | Logical OR with accumulator (absolute,X)
	ROR $D9FF			; 6E FF D9 | Rotate right (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_232
; Address: $E5FF03
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_232:
	LDA				  ; BF DF DF 83 | Load from absolute long,X into accumulator
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	LDA $ADBD,X		  ; BD BD AD | Load from absolute,X into accumulator
	LDA $ADAD			; AD AD AD | Load from absolute address into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	BIT $2CFF			; 2C FF 2C | Test bits in accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	BVS $8F			  ; 70 8F | Branch if overflow set
	INC				  ; 1A | Increment accumulator
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	CPX $4080			; EC 80 40 | Compare X register (absolute)
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	LDY $EC00,X		  ; BC 00 EC | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_233
; Address: $E5FF4C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_233:
	JSR $3918			; 20 18 39 | Jump to subroutine
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SEP #$1D			 ; E2 1D | Set processor status bits
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_234
; Address: $E5FF68
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_234:
	LDX $EC41,Y		  ; BE 41 EC | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CMP $F30A			; CD 0A F3 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4A_DmaFunction_235
; Address: $E5FF86
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank4A_DmaFunction_235:
	EOR #$B6			 ; 49 B6 | Exclusive OR with accumulator (immediate)
	ROL $3BFF			; 2E FF 3B | Rotate left (absolute)
	BRA $7F			  ; 80 7F | Branch always
	STY $8C73			; 8C 73 8C | Store Y register to absolute address
	BRA $7F			  ; 80 7F | Branch always
	STY $8C73			; 8C 73 8C | Store Y register to absolute address
	ASL $1C1F,X		  ; 1E 1F 1C | Arithmetic shift left (absolute,X)
	ORA $1D1F,X		  ; 1D 1F 1D | Logical OR with accumulator (absolute,X)
	ASL $1C1F,X		  ; 1E 1F 1C | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC $F6EE			; EE EE F6 | Increment (absolute)
	PEA #$ACF4		   ; F4 F4 AC | Push effective address to stack
	LDY $9D9D			; AC 9D 9D | Load from absolute address into Y register
	BPL $10			  ; 10 10 | Branch if positive
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $8B74			; AD 74 8B | Load from absolute address into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $1472			; 8D 72 14 | Store accumulator to absolute address
	LDA #$10			 ; A9 10 | Load immediate value into accumulator
	AND $B5			  ; 25 B5 | Logical AND with accumulator (zero page)
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	LDY $A4			  ; A4 A4 | Load from zero page into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	ROR				  ; 6A | Rotate right (accumulator)
	STA $AA66,Y		  ; 99 66 AA | Store accumulator to absolute,Y
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	RTL				  ; 6B | Return from subroutine long
