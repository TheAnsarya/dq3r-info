;==============================================================================
; Dragon Quest III - Bank $58
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $EC0000-$EC7FFF
; Instructions: 7200
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_58"

;------------------------------------------------------------------------------
; Bank58_DmaFunction_000
; Address: $EC8002
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_000:
	DEC $6D			  ; C6 6D | Decrement (zero page)
	LDY $5F			  ; A4 5F | Load from zero page into Y register
	CPX $C903			; EC 03 C9 | Compare X register (absolute)
	CMP $B317,Y		  ; D9 17 B3 | Compare accumulator (absolute,Y)
	LDX #$2E			 ; A2 2E | Load immediate value into X register
	ORA $061F,X		  ; 1D 1F 06 | Logical OR with accumulator (absolute,X)
	BPL $0F			  ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_001
; Address: $EC801B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_001:
	JSR $4A3D			; 20 3D 4A | Jump to subroutine
	ROL $A359			; 2E 59 A3 | Rotate left (absolute)
	DEC $6D			  ; C6 6D | Decrement (zero page)
	LDY $4F			  ; A4 4F | Load from zero page into Y register
	CPX $C903			; EC 03 C9 | Compare X register (absolute)
	CMP $9317,Y		  ; D9 17 93 | Compare accumulator (absolute,Y)
	LDX $1F47,Y		  ; BE 47 1F | Load from absolute,Y into X register
	ORA $1E0F,X		  ; 1D 0F 1E | Logical OR with accumulator (absolute,X)
	BPL $0F			  ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_002
; Address: $EC803B
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_002:
	JSR $6A1D			; 20 1D 6A | Jump to subroutine
	ROL $A349,X		  ; 3E 49 A3 | Rotate left (absolute,X)
	DEC $6D			  ; C6 6D | Decrement (zero page)
	LDY $4F			  ; A4 4F | Load from zero page into Y register
	CPX $D903			; EC 03 D9 | Compare X register (absolute)
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	ROR $1B47,X		  ; 7E 47 1B | Rotate right (absolute,X)
	ORA $1E0F,X		  ; 1D 0F 1E | Logical OR with accumulator (absolute,X)
	BPL $1F			  ; 10 1F | Branch if positive
	BIT $0F			  ; 24 0F | Test bits in accumulator (zero page)
	BMI $1D			  ; 30 1D | Branch if negative
	ROR				  ; 6A | Rotate right (accumulator)
	ROL $A309,X		  ; 3E 09 A3 | Rotate left (absolute,X)
	DEC $6D			  ; C6 6D | Decrement (zero page)
	LDY $6F			  ; A4 6F | Load from zero page into Y register
	CPX $C903			; EC 03 C9 | Compare X register (absolute)
	SBC #$27			 ; E9 27 | Subtract with carry (immediate)
	LSR $1F47,X		  ; 5E 47 1F | Logical shift right (absolute,X)
	ASL $100F,X		  ; 1E 0F 10 | Arithmetic shift left (absolute,X)
	BPL $1D			  ; 10 1D | Branch if positive
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $AB29,X		  ; 1E 29 AB | Arithmetic shift left (absolute,X)
	DEC $6D			  ; C6 6D | Decrement (zero page)
	LDY $4F			  ; A4 4F | Load from zero page into Y register
	CPX $F903			; EC 03 F9 | Compare X register (absolute)
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	LSR $1F47,X		  ; 5E 47 1F | Logical shift right (absolute,X)
	ORA $1E0F,X		  ; 1D 0F 1E | Logical OR with accumulator (absolute,X)
	BPL $1F			  ; 10 1F | Branch if positive
	BMI $0D			  ; 30 0D | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	ASL $F029,X		  ; 1E 29 F0 | Arithmetic shift left (absolute,X)
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_003
; Address: $EC80A8
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_003:
	DEY				  ; 88 | Decrement Y register
	STA				  ; 9F 0C 9B BB | Store accumulator to absolute long,X
	ROR $0F00,X		  ; 7E 00 0F | Rotate right (absolute,X)
	ADC $E71B,Y		  ; 79 1B E7 | Add with carry (absolute,Y)
	INX				  ; E8 | Increment X register
	ROL $5C			  ; 26 5C | Rotate left (zero page)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	DEY				  ; 88 | Decrement Y register
	STA				  ; 9F 2A BD BF | Store accumulator to absolute long,X
	ADC ($13),Y		  ; 71 13 | Add with carry ((zero page),Y)
	CPY $542B			; CC 2B 54 | Compare Y register (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA				  ; BF 6E F9 BA | Load from absolute long,X into accumulator
	DEC				  ; 3A | Decrement accumulator
	ADC #$2B			 ; 69 2B | Add with carry (immediate)
	DEY				  ; 88 | Decrement Y register
	ROL				  ; 2A | Rotate left (accumulator)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	STX $47			  ; 86 47 | Store X register to zero page
	BCC $5F			  ; 90 5F | Branch if carry clear
	BIT $BF			  ; 24 BF | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	LDA $7FFB,X		  ; BD FB 7F | Load from absolute,X into accumulator
	ORA $7A			  ; 05 7A | Logical OR with accumulator (zero page)
	ADC ($3B,X)		  ; 61 3B | Add with carry ((zero page,X))
	CPY $146F			; CC 6F 14 | Compare Y register (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	STX $904F			; 8E 4F 90 | Store X register to absolute address
	LDA				  ; BF 48 DF BC | Load from absolute long,X into accumulator
	ROL $0F00,X		  ; 3E 00 0F | Rotate left (absolute,X)
	ADC ($3B,X)		  ; 61 3B | Add with carry ((zero page,X))
	LDA $512E			; AD 2E 51 | Load from absolute address into accumulator
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	STZ $805F,X		  ; 9E 5F 80 | Store zero to absolute,X
	STA $3FBB,X		  ; 9D BB 3F | Store accumulator to absolute,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_005
; Address: $EC8160
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_005:
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	STY $74			  ; 84 74 | Store Y register to zero page
	BRA $4F			  ; 80 4F | Branch always
	STA				  ; 9F 0A 9D 9A | Store accumulator to absolute long,X
	LSR $0F00,X		  ; 5E 00 0F | Logical shift right (absolute,X)
	JMP ($710F)		  ; 6C 0F 71 | Jump to address (absolute indirect)
	CPX $770C			; EC 0C 77 | Compare X register (absolute)
	PLB				  ; AB | Pull data bank register from stack
	ROR $78B9,X		  ; 7E B9 78 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	PLB				  ; AB | Pull data bank register from stack
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$30			 ; 42 30 | Reserved instruction
	LSR $5C20			; 4E 20 5C | Logical shift right (absolute)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_006
; Address: $EC819A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_006:
	JSR $205C			; 20 5C 20 | Jump to subroutine
	JMP $AB4C30		  ; 5C 30 4C AB | Jump to address long
	SEC				  ; 38 | Set carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_007
; Address: $EC81B4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_007:
	JSR $285C			; 20 5C 28 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BPL $6C			  ; 10 6C | Branch if positive
	BMI $4C			  ; 30 4C | Branch if negative

;------------------------------------------------------------------------------
; Bank58_DmaFunction_008
; Address: $EC81BE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_008:
	JSR $B35C			; 20 5C B3 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	ADC $38BB,X		  ; 7D BB 38 | Add with carry (absolute,X)
	BIT $3450			; 2C 50 34 | Test bits in accumulator (absolute)
	EOR #$10			 ; 49 10 | Exclusive OR with accumulator (immediate)
	JMP ($5428)		  ; 6C 28 54 | Jump to address (absolute indirect)
	PLP				  ; 28 | Pull processor status from stack
	BMI $4C			  ; 30 4C | Branch if negative

;------------------------------------------------------------------------------
; Bank58_DmaFunction_009
; Address: $EC81DC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_009:
	JSR $305C			; 20 5C 30 | Jump to subroutine
	JMP $3DA9			; 4C A9 3D | Jump to address
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	PLB				  ; AB | Pull data bank register from stack
	BIT $3D			  ; 24 3D | Test bits in accumulator (zero page)
	WDM #$10			 ; 42 10 | Reserved instruction
	CPX $6418			; EC 18 64 | Compare X register (absolute)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_00A
; Address: $EC81F8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_00A:
	JSR $205C			; 20 5C 20 | Jump to subroutine
	JMP $206C10		  ; 5C 10 6C 20 | Jump to address long
	JMP $B97FAB		  ; 5C AB 7F B9 | Jump to address long
	SEC				  ; 38 | Set carry flag
	PLB				  ; AB | Pull data bank register from stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_00B
; Address: $EC8213
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_00B:
	LSR				  ; 4A | Logical shift right (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $6C			  ; 10 6C | Branch if positive
	BPL $6C			  ; 10 6C | Branch if positive
	LDA #$3D			 ; A9 3D | Load immediate value into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BMI $4C			  ; 30 4C | Branch if negative
	BPL $6C			  ; 10 6C | Branch if positive
	BPL $6C			  ; 10 6C | Branch if positive
	BPL $6C			  ; 10 6C | Branch if positive
	PHB				  ; 8B | Push data bank register to stack
	ASL $38BB,X		  ; 1E BB 38 | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_00C
; Address: $EC8252
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_00C:
	JSR $185C			; 20 5C 18 | Jump to subroutine
	STZ $00			  ; 64 00 | Store zero to zero page
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_00D
; Address: $EC825C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_00D:
	JSR $205C			; 20 5C 20 | Jump to subroutine
	JMP $32BF3E		  ; 5C 3E BF 32 | Jump to address long
	LDA				  ; BF 3E BE 3C | Load from absolute long,X into accumulator
	LDX $35			  ; A6 35 | Load from zero page into X register
	ROR				  ; 6A | Rotate right (accumulator)
	ROL $D9			  ; 26 D9 | Rotate left (zero page)
	ROL $38C1,X		  ; 3E C1 38 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_00E
; Address: $EC8276
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_00E:
	JSL $D827DD		  ; 22 DD 27 D8 | Jump to subroutine long
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	STZ $956A			; 9C 6A 95 | Store zero to absolute
	DEC				  ; 3A | Decrement accumulator
	TSX				  ; BA | Transfer stack pointer to X register
	DEC				  ; 3A | Decrement accumulator
	LDA				  ; BF 3C BE 3F | Load from absolute long,X into accumulator
	ADC ($B3),Y		  ; 71 B3 | Add with carry ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $D9			  ; 26 D9 | Rotate left (zero page)
	DEC				  ; 3A | Decrement accumulator
	CMP $35			  ; C5 35 | Compare accumulator (zero page)
	DEX				  ; CA | Decrement X register
	INY				  ; C8 | Increment Y register
	CMP $BE41			; CD 41 BE | Compare accumulator (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	LDY $BF3B,X		  ; BC 3B BF | Load from absolute,X into Y register
	AND $3CBF,X		  ; 3D BF 3C | Logical AND with accumulator (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_00F
; Address: $EC82B0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_00F:
	BIT $37D3			; 2C D3 37 | Test bits in accumulator (absolute)
	INY				  ; C8 | Increment Y register
	CPY $12			  ; C4 12 | Compare Y register (zero page)
	SBC $CA35			; ED 35 CA | Subtract with carry (absolute)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	STZ $D728			; 9C 28 D7 | Store zero to absolute
	BIT $3EBC			; 2C BC 3E | Test bits in accumulator (absolute)
	LDA				  ; BF 3C BE 2D | Load from absolute long,X into accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	CMP $C53A			; CD 3A C5 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_010
; Address: $EC82D6
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_010:
	JSL $E817DD		  ; 22 DD 17 E8 | Jump to subroutine long
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	STZ $956A			; 9C 6A 95 | Store zero to absolute
	ROL $36BF			; 2E BF 36 | Rotate left (absolute)
	LDX $BF3E,Y		  ; BE 3E BF | Load from absolute,Y into X register
	ADC ($B3),Y		  ; 71 B3 | Add with carry ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	ASL $2AE1,X		  ; 1E E1 2A | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	CMP #$13			 ; C9 13 | Compare accumulator (immediate)
	CPX $9E61			; EC 61 9E | Compare X register (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	LDA $BE3A,X		  ; BD 3A BE | Load from absolute,X into accumulator
	AND $3EBF,X		  ; 3D BF 3E | Logical AND with accumulator (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	BIT $26D3			; 2C D3 26 | Test bits in accumulator (absolute)
	CMP $C43B,Y		  ; D9 3B C4 | Compare accumulator (absolute,Y)
	BMI $CF			  ; 30 CF | Branch if negative
	DEX				  ; CA | Decrement X register
	CPY $DC23			; CC 23 DC | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BIT $3ABD			; 2C BD 3A | Test bits in accumulator (absolute)
	LDA				  ; BF 3C BE 3D | Load from absolute long,X into accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	CMP #$3A			 ; C9 3A | Compare accumulator (immediate)
	CMP $13			  ; C5 13 | Compare accumulator (zero page)
	CPX $CA35			; EC 35 CA | Compare X register (absolute)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	STZ $D52A			; 9C 2A D5 | Store zero to absolute
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	STA $05			  ; 85 05 | Store accumulator to zero page
	ROR $FFA0,X		  ; 7E A0 FF | Rotate right (absolute,X)
	ROR $FFBF			; 6E BF FF | Rotate right (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	REP #$B8			 ; C2 B8 | Reset processor status bits
	LDX $1FD1			; AE D1 1F | Load from absolute address into X register
	ROR $3E1F			; 6E 1F 3E | Rotate right (absolute)
	ASL $1C00			; 0E 00 1C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_011
; Address: $EC836B
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_011:
	SEC				  ; 38 | Set carry flag
	STA $FF84FD		  ; 8F FD 84 FF | Store accumulator to absolute long address
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 3C C3 F9 | Load from absolute long,X into accumulator
	ROL $FB			  ; 26 FB | Rotate left (zero page)
	AND $00E0,X		  ; 3D E0 00 | Logical AND with accumulator (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	STA $1E0D			; 8D 0D 1E | Store accumulator to absolute address
	ASL $7EB4,X		  ; 1E B4 7E | Arithmetic shift left (absolute,X)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	ROR $FFB7			; 6E B7 FF | Rotate right (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	DEX				  ; CA | Decrement X register
	BCS $CE			  ; B0 CE | Branch if carry set
	AND ($AA),Y		  ; 31 AA | Logical AND with accumulator ((zero page),Y)
	ROR $361F			; 6E 1F 36 | Rotate right (absolute)
	STZ $3780,X		  ; 9E 80 37 | Store zero to absolute,X
	STA $FF80BF		  ; 8F BF 80 FF | Store accumulator to absolute long address
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	LDA $7F66,Y		  ; B9 66 7F | Load from absolute,Y into accumulator
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	ASL $F40E			; 0E 0E F4 | Arithmetic shift left (absolute)
	INC $BFE0,X		  ; FE E0 BF | Increment (absolute,X)
	ROL $FFFF			; 2E FF FF | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	REP #$BC			 ; C2 BC | Reset processor status bits
	DEC $6A31			; CE 31 6A | Decrement (absolute)
	ROR $3E1F			; 6E 1F 3E | Rotate right (absolute)
	ASL $9E00			; 0E 00 9E | Arithmetic shift left (absolute)
	BRA $7F			  ; 80 7F | Branch always
	ADC #$EF			 ; 69 EF | Add with carry (immediate)
	BRA $FF			  ; 80 FF | Branch always
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	ADC #$96			 ; 69 96 | Add with carry (immediate)
	BRA $FF			  ; 80 FF | Branch always
	AND $00E0,X		  ; 3D E0 00 | Logical AND with accumulator (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	STA $05			  ; 85 05 | Store accumulator to zero page
	ASL $741E,X		  ; 1E 1E 74 | Arithmetic shift left (absolute,X)
	ROR $FFE0,X		  ; 7E E0 FF | Rotate right (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	DEC $B8			  ; C6 B8 | Decrement (zero page)
	AND $11EE			; 2D EE 11 | Logical AND with accumulator (absolute)
	ROL $3E5F			; 2E 5F 3E | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_012
; Address: $EC8426
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_012:
	ASL $9F00			; 0E 00 9F | Arithmetic shift left (absolute)
	BRA $3E			  ; 80 3E | Branch always
	EOR #$F1			 ; 49 F1 | Exclusive OR with accumulator (immediate)
	BRA $FF			  ; 80 FF | Branch always
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	LDA $00E0,Y		  ; B9 E0 00 | Load from absolute,Y into accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	STA $1C1D,X		  ; 9D 1D 1C | Store accumulator to absolute,X
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	ROL $FFFB			; 2E FB FF | Rotate left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	PHX				  ; DA | Push X register to stack
	LDY #$D4			 ; A0 D4 | Load immediate value into Y register
	PLB				  ; AB | Pull data bank register from stack
	ROR $7A1F			; 6E 1F 7A | Rotate right (absolute)
	ASL $9E02			; 0E 02 9E | Arithmetic shift left (absolute)
	BRA $2F			  ; 80 2F | Branch always
	PLP				  ; 28 | Pull processor status from stack
	XBA				  ; EB | Exchange accumulator bytes
	CMP $FF04,Y		  ; D9 04 FF | Compare accumulator (absolute,Y)
	ADC $3F40,X		  ; 7D 40 3F | Add with carry (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	SBC $FF06,Y		  ; F9 06 FF | Subtract with carry (absolute,Y)
	AND ($E0),Y		  ; 31 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal
	STA $3C1D,X		  ; 9D 1D 3C | Store accumulator to absolute,X
	ROR $BFE0,X		  ; 7E E0 BF | Rotate right (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	LDA				  ; BF FF EF F7 | Load from absolute long,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	PHX				  ; DA | Push X register to stack
	LDY #$EC			 ; A0 EC | Load immediate value into Y register
	LDX $1FD1			; AE D1 1F | Load from absolute address into X register
	ROR $3E1F			; 6E 1F 3E | Rotate right (absolute)
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	ADC ($8B,X)		  ; 61 8B | Add with carry ((zero page,X))
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 65 9A BB | Load from absolute long,X into accumulator
	STZ $FB			  ; 64 FB | Store zero to zero page
	AND $00E0			; 2D E0 00 | Logical AND with accumulator (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	STA $05			  ; 85 05 | Store accumulator to zero page
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $FFA0,X		  ; 7E A0 FF | Rotate right (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	LDA				  ; BF FF EF F7 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_013
; Address: $EC84D4
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_013:
	XBA				  ; EB | Exchange accumulator bytes
	DEC $B8			  ; C6 B8 | Decrement (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	LDX $1FD1			; AE D1 1F | Load from absolute address into X register
	ROR $3E1F			; 6E 1F 3E | Rotate right (absolute)
	ASL $1800			; 0E 00 18 | Arithmetic shift left (absolute)
	ADC ($61),Y		  ; 71 61 | Add with carry ((zero page),Y)
	STA $FF80BD		  ; 8F BD 80 FF | Store accumulator to absolute long address
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 65 9A BD | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	STA $75			  ; 85 75 | Store accumulator to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $8D8F			; 8D 8F 8D | Store accumulator to absolute address
	STA $1FC7C7		  ; 8F C7 C7 1F | Store accumulator to absolute long address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $FF34,X		  ; FE 34 FF | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	SBC $FD70,X		  ; FD 70 FD | Subtract with carry (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CPX #$C6			 ; E0 C6 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	ROR $F87E,X		  ; 7E 7E F8 | Rotate right (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	DEX				  ; CA | Decrement X register
	STA ($18,X)		  ; 81 18 | Store accumulator to (zero page,X)
	STA $FF3B7F		  ; 8F 7F 3B FF | Store accumulator to absolute long address
	LSR $B6DE,X		  ; 5E DE B6 | Logical shift right (absolute,X)
	LDX $5E56,Y		  ; BE 56 5E | Load from absolute,Y into X register
	ROL $1F3E,X		  ; 3E 3E 1F | Rotate left (absolute,X)
	AND ($F7,X)		  ; 21 F7 | Logical AND with accumulator ((zero page,X))
	EOR ($F7,X)		  ; 41 F7 | Exclusive OR with accumulator ((zero page,X))
	LDA ($FF,X)		  ; A1 FF | Load from (zero page,X) into accumulator
	CMP ($18,X)		  ; C1 18 | Compare accumulator ((zero page,X))
	CPX #$C6			 ; E0 C6 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STA ($8E,X)		  ; 81 8E | Store accumulator to (zero page,X)
	ROL				  ; 2A | Rotate left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_014
; Address: $EC857B
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_014:
	TXA				  ; 8A | Transfer X register to accumulator
	BRA $E7			  ; 80 E7 | Branch always
	CLC				  ; 18 | Clear carry flag
	STX $3C7E			; 8E 7E 3C | Store X register to absolute address
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	LDA $6EBD			; AD BD 6E | Load from absolute address into accumulator
	ROR $001F,X		  ; 7E 1F 00 | Rotate right (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	WDM #$EF			 ; 42 EF | Reserved instruction
	STA ($18,X)		  ; 81 18 | Store accumulator to (zero page,X)
	CPX #$C6			 ; E0 C6 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	PLB				  ; AB | Pull data bank register from stack
	XBA				  ; EB | Exchange accumulator bytes
	LDA				  ; BF FF F8 00 | Load from absolute long,X into accumulator
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	BRA $EB			  ; 80 EB | Branch always
	LDA				  ; BF 00 01 03 | Load from absolute long,X into accumulator
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $F1			  ; F0 F1 | Branch if equal
	CMP $72FF,X		  ; DD FF 72 | Compare accumulator (absolute,X)
	ROR $BEBE,X		  ; 7E BE BE | Rotate right (absolute,X)
	LDA #$A9			 ; A9 A9 | Load immediate value into accumulator
	EOR ($D1),Y		  ; 51 D1 | Exclusive OR with accumulator ((zero page),Y)
	INC $DD0E,X		  ; FE 0E DD | Increment (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	ROL $3CFF			; 2E FF 3C | Rotate left (absolute)
	LDA $F373AF		  ; AF AF 73 F3 | Load from absolute long address into accumulator
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	LDA $B1F9,Y		  ; B9 F9 B1 | Load from absolute,Y into accumulator
	SBC ($EA),Y		  ; F1 EA | Subtract with carry ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	BRA $FF			  ; 80 FF | Branch always
	BVC $7F			  ; 50 7F | Branch if overflow clear
	ASL $06BF			; 0E BF 06 | Arithmetic shift left (absolute)
	LDA				  ; BF 0E FF 14 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_015
; Address: $EC861F
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_015:
	PLP				  ; 28 | Pull processor status from stack
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHY				  ; 5A | Push Y register to stack
	LSR $8181,X		  ; 5E 81 81 | Logical shift right (absolute,X)
	DEC $F3FF,X		  ; DE FF F3 | Decrement (absolute,X)
	INC $54FE,X		  ; FE FE 54 | Increment (absolute,X)
	NOP				  ; EA | No operation
	ROR				  ; 6A | Rotate right (accumulator)
	LDA ($FF,X)		  ; A1 FF | Load from (zero page,X) into accumulator
	ROR $38FF,X		  ; 7E FF 38 | Rotate right (absolute,X)
	DEC $F300,X		  ; DE 00 F3 | Decrement (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA $48FF,X		  ; BD FF 48 | Load from absolute,X into accumulator
	INY				  ; C8 | Increment Y register
	JMP $BEAE7C		  ; 5C 7C AE BE | Jump to address long
	BIT $3A3C			; 2C 3C 3A | Test bits in accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	JMP ($7B7D)		  ; 6C 7D 7B | Jump to address (absolute indirect)
	PLY				  ; 7A | Pull Y register from stack
	LDA $7F00,X		  ; BD 00 7F | Load from absolute,X into accumulator
	EOR ($EF,X)		  ; 41 EF | Exclusive OR with accumulator ((zero page,X))
	CMP $EF			  ; C5 EF | Compare accumulator (zero page)
	STY $80			  ; 84 80 | Store Y register to zero page
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_016
; Address: $EC86A4
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_016:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 3D 3D 03 | Load from absolute long,X into accumulator
	STX $FD8F			; 8E 8F FD | Store X register to absolute address
	ROR $F5FE,X		  ; 7E FE F5 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	REP #$FF			 ; C2 FF | Reset processor status bits
	INC $FD70,X		  ; FE 70 FD | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	ROR $B57E			; 6E 7E B5 | Rotate right (absolute)
	LDA $9E9E,X		  ; BD 9E 9E | Load from absolute,X into accumulator
	ORA $9F9E,X		  ; 1D 9E 9F | Logical OR with accumulator (absolute,X)
	ROL $1FFF,X		  ; 3E FF 1F | Rotate left (absolute,X)
	LDA				  ; BF 07 EF 81 | Load from absolute long,X into accumulator
	WDM #$FF			 ; 42 FF | Reserved instruction
	ADC ($F7,X)		  ; 61 F7 | Add with carry ((zero page,X))
	SEP #$FF			 ; E2 FF | Set processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_017
; Address: $EC86FF
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_017:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PLX				  ; FA | Pull X register from stack
	INY				  ; C8 | Increment Y register
	BEQ $00			  ; F0 00 | Branch if equal
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	BVC $30			  ; 50 30 | Branch if overflow clear
	PHY				  ; 5A | Push Y register to stack
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_018
; Address: $EC8791
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_018:
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	INY				  ; C8 | Increment Y register
	BEQ $00			  ; F0 00 | Branch if equal
	INC $F880,X		  ; FE 80 F8 | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	BPL $11			  ; 10 11 | Branch if positive
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	STA ($87,X)		  ; 81 87 | Store accumulator to (zero page,X)
	INC $FCEF			; EE EF FC | Increment (absolute)
	INC $FEFD,X		  ; FE FD FE | Increment (absolute,X)
	ADC $E77C,Y		  ; 79 7C E7 | Add with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	STZ $7FEC,X		  ; 9E EC 7F | Store zero to absolute,X
	BRA $2C			  ; 80 2C | Branch always
	BIT $1010			; 2C 10 10 | Test bits in accumulator (absolute)
	ORA ($91),Y		  ; 11 91 | Logical OR with accumulator ((zero page),Y)
	ORA ($91),Y		  ; 11 91 | Logical OR with accumulator ((zero page),Y)
	REP #$01			 ; C2 01 | Reset processor status bits
	SBC ($20),Y		  ; F1 20 | Subtract with carry ((zero page),Y)
	LDY $FEC8,X		  ; BC C8 FE | Load from absolute,X into Y register
	ROR $6EEE			; 6E EE 6E | Rotate right (absolute)
	INC $7C3D			; EE 3D 7C | Increment (absolute)
	ASL $633E			; 0E 3E 63 | Arithmetic shift left (absolute)
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	EOR ($30,X)		  ; 41 30 | Exclusive OR with accumulator ((zero page,X))
	AND ($0C),Y		  ; 31 0C | Logical AND with accumulator ((zero page),Y)
	ORA $2322			; 0D 22 23 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_019
; Address: $EC8808
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_019:
	JSR $2120			; 20 20 21 | PPU graphics register access
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	AND ($22,X)		  ; 21 22 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank58_DmaFunction_01A
; Address: $EC880F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_01A:
	JSL $CEBFBE		  ; 22 BE BF CE | Jump to subroutine long
	STA $DC83F2		  ; 8F F2 83 DC | Store accumulator to absolute long address
	STA ($DF,X)		  ; 81 DF | Store accumulator to (zero page,X)
	BRA $DE			  ; 80 DE | Branch always
	BRA $DE			  ; 80 DE | Branch always
	BRA $DD			  ; 80 DD | Branch always
	STA ($71,X)		  ; 81 71 | Store accumulator to (zero page,X)
	CPY #$F5			 ; C0 F5 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $10			  ; 10 10 | Branch if positive
	DEX				  ; CA | Decrement X register
	ASL $0444			; 0E 44 04 | Arithmetic shift left (absolute)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BCS $FF			  ; B0 FF | Branch if carry set
	LDA				  ; BF 00 5F 02 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_01B
; Address: $EC8849
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_01B:
	ROR $FD05,X		  ; 7E 05 FD | Rotate right (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive
	EOR ($A0,X)		  ; 41 A0 | Exclusive OR with accumulator ((zero page,X))
	SBC ($42,X)		  ; E1 42 | Hardware register operation
	EOR ($40,X)		  ; 41 40 | Exclusive OR with accumulator ((zero page,X))
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	INC $EFFE,X		  ; FE FE EF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	BRA $FF			  ; 80 FF | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	INC $FE2C,X		  ; FE 2C FE | Increment (absolute,X)
	LDY #$FE			 ; A0 FE | Load immediate value into Y register
	LDY $C4FE,X		  ; BC FE C4 | Load from absolute,X into Y register
	DEC $FF00,X		  ; DE 00 FF | Decrement (absolute,X)
	INC $03FF,X		  ; FE FF 03 | Increment (absolute,X)
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	AND $A101			; 2D 01 A1 | Logical AND with accumulator (absolute)
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	ORA ($E5,X)		  ; 01 E5 | Logical OR with accumulator ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	INC $FE2C,X		  ; FE 2C FE | Increment (absolute,X)
	LDY #$FE			 ; A0 FE | Load immediate value into Y register
	STZ $E4FE			; 9C FE E4 | Store zero to absolute
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $03FF,X		  ; FE FF 03 | Increment (absolute,X)
	SBC #$01			 ; E9 01 | Subtract with carry (immediate)
	AND $A101			; 2D 01 A1 | Logical AND with accumulator (absolute)
	ORA ($9D,X)		  ; 01 9D | Logical OR with accumulator ((zero page,X))
	ORA ($E5,X)		  ; 01 E5 | Logical OR with accumulator ((zero page,X))
	ORA ($2A,X)		  ; 01 2A | Logical OR with accumulator ((zero page,X))
	ROR $7E2A,X		  ; 7E 2A 7E | Rotate right (absolute,X)
	AND #$79			 ; 29 79 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLY				  ; 7A | Pull Y register from stack
	BMI $70			  ; 30 70 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	BIT $287F			; 2C 7F 28 | Test bits in accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $A8			  ; 85 A8 | Store accumulator to zero page
	STA $AA			  ; 85 AA | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank58_DmaFunction_01C
; Address: $EC88F5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_01C:
	STX $AD			  ; 86 AD | Store X register to zero page
	LDX $AC8F			; AE 8F AC | Load from absolute address into X register
	STY $A8			  ; 84 A8 | Store Y register to zero page
	BRA $A8			  ; 80 A8 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_01D
; Address: $EC8905
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_01D:
	CPX #$86			 ; E0 86 | Compare X register (immediate)
	STX $79			  ; 86 79 | Store X register to zero page
	ADC $0706,Y		  ; 79 06 07 | Add with carry (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	STA				  ; 9F 00 EF 00 | Store accumulator to absolute long,X
	STA				  ; 9F 04 E4 00 | Store accumulator to absolute long,X
	STA				  ; 9F 00 79 00 | Store accumulator to absolute long,X
	STX $00			  ; 86 00 | Store X register to zero page
	SBC $6760,Y		  ; F9 60 67 | Subtract with carry (absolute,Y)
	BPL $FF			  ; 10 FF | Branch if positive
	STY $148E			; 8C 8E 14 | Store Y register to absolute address
	DEC $FEB4,X		  ; DE B4 FE | Decrement (absolute,X)
	INC $FE14,X		  ; FE 14 FE | Increment (absolute,X)
	INC $FE04,X		  ; FE 04 FE | Increment (absolute,X)
	INC $7175,X		  ; FE 75 71 | Increment (absolute,X)
	LDA ($15,X)		  ; A1 15 | Load from (zero page,X) into accumulator
	EOR ($15,X)		  ; 41 15 | Exclusive OR with accumulator ((zero page,X))
	EOR ($15,X)		  ; 41 15 | Exclusive OR with accumulator ((zero page,X))
	STA ($15,X)		  ; 81 15 | Store accumulator to (zero page,X)
	SBC ($05,X)		  ; E1 05 | Subtract with carry ((zero page,X))
	SBC ($15),Y		  ; F1 15 | Subtract with carry ((zero page),Y)
	SBC ($2A,X)		  ; E1 2A | Subtract with carry ((zero page,X))
	ROR $7E2A,X		  ; 7E 2A 7E | Rotate right (absolute,X)
	AND #$7D			 ; 29 7D | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROR $7F28,X		  ; 7E 28 7F | Rotate right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $A8			  ; 85 A8 | Store accumulator to zero page
	STA $AA			  ; 85 AA | Store accumulator to zero page
	STX $A9			  ; 86 A9 | Store X register to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	STA ($A8,X)		  ; 81 A8 | Store accumulator to (zero page,X)
	BRA $A8			  ; 80 A8 | Branch always
	BRA $A8			  ; 80 A8 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_01E
; Address: $EC8965
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_01E:
	CPX #$86			 ; E0 86 | Compare X register (immediate)
	STX $79			  ; 86 79 | Store X register to zero page
	ADC $0706,Y		  ; 79 06 07 | Add with carry (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	STA				  ; 9F 00 FF 00 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank58_DmaFunction_01F
; Address: $EC8971
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_01F:
	STA				  ; 9F 04 E4 00 | Store accumulator to absolute long,X
	STA				  ; 9F 00 79 00 | Store accumulator to absolute long,X
	STX $00			  ; 86 00 | Store X register to zero page
	SBC $6760,Y		  ; F9 60 67 | Subtract with carry (absolute,Y)
	INC $FE14,X		  ; FE 14 FE | Increment (absolute,X)
	INC $FE94,X		  ; FE 94 FE | Increment (absolute,X)
	INC $FE14,X		  ; FE 14 FE | Increment (absolute,X)
	INC $FE14,X		  ; FE 14 FE | Increment (absolute,X)
	ORA ($15,X)		  ; 01 15 | Logical OR with accumulator ((zero page,X))
	STA ($15,X)		  ; 81 15 | Store accumulator to (zero page,X)
	EOR ($15,X)		  ; 41 15 | Exclusive OR with accumulator ((zero page,X))
	EOR ($15,X)		  ; 41 15 | Exclusive OR with accumulator ((zero page,X))
	STA ($15,X)		  ; 81 15 | Store accumulator to (zero page,X)
	SBC ($05,X)		  ; E1 05 | Subtract with carry ((zero page,X))
	SBC ($15),Y		  ; F1 15 | Subtract with carry ((zero page),Y)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $FF			  ; 80 FF | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BIT $A02C			; 2C 2C A0 | Test bits in accumulator (absolute)
	LDY #$BC			 ; A0 BC | Load immediate value into Y register
	LDY $C4C4,X		  ; BC C4 C4 | Load from absolute,X into Y register
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA ($D3,X)		  ; 01 D3 | Logical OR with accumulator ((zero page,X))
	ORA ($5F,X)		  ; 01 5F | Logical OR with accumulator ((zero page,X))
	ORA ($43,X)		  ; 01 43 | Logical OR with accumulator ((zero page,X))
	ORA ($3B,X)		  ; 01 3B | Logical OR with accumulator ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $2A			  ; 80 2A | Branch always
	ROL $2E2A			; 2E 2A 2E | Rotate left (absolute)
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	BMI $30			  ; 30 30 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BIT $282C			; 2C 2C 28 | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $85			  ; D0 85 | Branch if not equal
	BNE $85			  ; D0 85 | Branch if not equal
	STX $D5			  ; 86 D5 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank58_DmaFunction_020
; Address: $EC8A18
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_020:
	DEC $D78F			; CE 8F D7 | Decrement (absolute)
	STY $D3			  ; 84 D3 | Store Y register to zero page
	BRA $D7			  ; 80 D7 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA				  ; 9F 1B FB 60 | Store accumulator to absolute long,X
	CPX #$86			 ; E0 86 | Compare X register (immediate)
	STX $79			  ; 86 79 | Store X register to zero page
	ADC $0706,Y		  ; 79 06 07 | Add with carry (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	STA				  ; 9F 00 EF 60 | Store accumulator to absolute long,X
	STA				  ; 9F 04 E4 00 | Store accumulator to absolute long,X
	STA				  ; 9F 00 79 00 | Store accumulator to absolute long,X
	STX $00			  ; 86 00 | Store X register to zero page
	SBC $6760,Y		  ; F9 60 67 | Subtract with carry (absolute,Y)
	BPL $FF			  ; 10 FF | Branch if positive
	STY $148C			; 8C 8C 14 | Store Y register to absolute address
	PEA #$D494		   ; F4 94 D4 | Push effective address to stack
	PEA #$F404		   ; F4 04 F4 | Push effective address to stack
	PEA #$7173		   ; F4 73 71 | Push effective address to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank58_DmaFunction_021
; Address: $EC8A53
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_021:
	LDA ($0B,X)		  ; A1 0B | Load from (zero page,X) into accumulator
	EOR ($2B,X)		  ; 41 2B | Exclusive OR with accumulator ((zero page,X))
	EOR ($6B,X)		  ; 41 6B | Exclusive OR with accumulator ((zero page,X))
	STA ($0B,X)		  ; 81 0B | Store accumulator to (zero page,X)
	SBC ($0B,X)		  ; E1 0B | Subtract with carry ((zero page,X))
	SBC ($0B),Y		  ; F1 0B | Subtract with carry ((zero page),Y)
	SBC ($2A,X)		  ; E1 2A | Subtract with carry ((zero page,X))
	ROL $2E2A			; 2E 2A 2E | Rotate left (absolute)
	AND #$2D			 ; 29 2D | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	AND #$28			 ; 29 28 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BNE $85			  ; D0 85 | Branch if not equal
	BNE $85			  ; D0 85 | Branch if not equal
	STX $D5			  ; 86 D5 | Store X register to zero page
	STA ($D7,X)		  ; 81 D7 | Store accumulator to (zero page,X)
	BRA $D7			  ; 80 D7 | Branch always
	BRA $D7			  ; 80 D7 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA				  ; 9F 1B FB 60 | Store accumulator to absolute long,X
	CPX #$86			 ; E0 86 | Compare X register (immediate)
	STX $79			  ; 86 79 | Store X register to zero page
	ADC $0706,Y		  ; 79 06 07 | Add with carry (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_022
; Address: $EC8A8D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_022:
	STA				  ; 9F 00 FF 60 | Store accumulator to absolute long,X
	STA				  ; 9F 04 E4 00 | Store accumulator to absolute long,X
	STA				  ; 9F 00 79 00 | Store accumulator to absolute long,X
	STX $00			  ; 86 00 | Store X register to zero page
	SBC $6760,Y		  ; F9 60 67 | Subtract with carry (absolute,Y)
	PEA #$F404		   ; F4 04 F4 | Push effective address to stack
	PEA #$01EB		   ; F4 EB 01 | Push effective address to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank58_DmaFunction_023
; Address: $EC8AB3
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_023:
	STA ($2B,X)		  ; 81 2B | Store accumulator to (zero page,X)
	EOR ($2B,X)		  ; 41 2B | Exclusive OR with accumulator ((zero page,X))
	EOR ($6B,X)		  ; 41 6B | Exclusive OR with accumulator ((zero page,X))
	STA ($0B,X)		  ; 81 0B | Store accumulator to (zero page,X)
	SBC ($0B,X)		  ; E1 0B | Subtract with carry ((zero page,X))
	SBC ($0B),Y		  ; F1 0B | Subtract with carry ((zero page),Y)
	SBC ($0F,X)		  ; E1 0F | Subtract with carry ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BCS $CF			  ; B0 CF | Branch if carry set
	LDY #$D1			 ; A0 D1 | Load immediate value into Y register
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ASL $9AFF			; 0E FF 9A | Arithmetic shift left (absolute)
	BPL $3F			  ; 10 3F | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STY $7C			  ; 84 7C | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	BVS $78			  ; 70 78 | Branch if overflow set
	BEQ $F8			  ; F0 F8 | Branch if equal
	BCC $F8			  ; 90 F8 | Branch if carry clear
	PEA #$84FC		   ; F4 FC 84 | Push effective address to stack
	STZ $7E			  ; 64 7E | Store zero to zero page
	BNE $EC			  ; D0 EC | Branch if not equal
	LDA ($D5,X)		  ; A1 D5 | Load from (zero page,X) into accumulator
	BIT #$ED			 ; 89 ED | Test bits in accumulator (immediate)
	EOR #$6D			 ; 49 6D | Exclusive OR with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	SED				  ; F8 | Set decimal mode flag
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_024
; Address: $EC8B27
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_024:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_025
; Address: $EC8B2D
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_025:
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	STZ $84			  ; 64 84 | Store zero to zero page
	CPY $D6			  ; C4 D6 | Compare Y register (zero page)
	ROL $547E,X		  ; 3E 7E 54 | Rotate left (absolute,X)
	INC $C63E,X		  ; FE 3E C6 | Increment (absolute,X)
	ROR $FE8A,X		  ; 7E 8A FE | Rotate right (absolute,X)
	TXS				  ; 9A | Transfer X register to stack pointer
	INC $FE3A,X		  ; FE 3A FE | Increment (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	INC $FE80,X		  ; FE 80 FE | Increment (absolute,X)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_029
; Address: $EC8B6C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_029:
	RTI				  ; 40 | Return from interrupt
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $60			  ; 80 60 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_02A
; Address: $EC8B80
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_02A:
	ROL $F82F			; 2E 2F F8 | Rotate left (absolute)
	SEC				  ; 38 | Set carry flag
	ROR $F847,X		  ; 7E 47 F8 | Rotate right (absolute,X)
	SBC $40F9,Y		  ; F9 F9 40 | Subtract with carry (absolute,Y)
	EOR ($D0,X)		  ; 41 D0 | Exclusive OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	LDX $24FF,Y		  ; BE FF 24 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_02B
; Address: $EC8BA4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_02B:
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_02D
; Address: $EC8BBA
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_02D:
	PEA #$E0FC		   ; F4 FC E0 | Game work RAM access
	CPX #$9C			 ; E0 9C | Compare X register (immediate)
	CPX #$31			 ; E0 31 | Compare X register (immediate)
	ROL $BBA5,X		  ; 3E A5 BB | Rotate left (absolute,X)
	ADC $E65F,Y		  ; 79 5F E6 | Add with carry (absolute,Y)
	INC $FCDC,X		  ; FE DC FC | Increment (absolute,X)
	SBC ($E5,X)		  ; E1 E5 | Subtract with carry ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_02F
; Address: $EC8BF0
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_02F:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $60			  ; 80 60 | Branch always
	BRA $20			  ; 80 20 | Branch always
	BRA $44			  ; 80 44 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	CPX $5E36			; EC 36 5E | Compare X register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	BVC $72			  ; 50 72 | Branch if overflow clear
	LDY $E4			  ; A4 E4 | Load from zero page into Y register
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $7E02,X		  ; 7E 02 7E | Rotate right (absolute,X)
	BRA $FE			  ; 80 FE | Branch always
	STX $FE			  ; 86 FE | Store X register to zero page

;------------------------------------------------------------------------------
; Bank58_DmaFunction_030
; Address: $EC8C18
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_030:
	STY $1AFC			; 8C FC 1A | Store Y register to absolute address
	SEC				  ; 38 | Set carry flag
	BEQ $FC			  ; F0 FC | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_034
; Address: $EC8C27
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_034:
	JSR $6020			; 20 20 60 | Jump to subroutine
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $60			  ; 80 60 | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_035
; Address: $EC8C32
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_035:
	JSR $8060			; 20 60 80 | Jump to subroutine
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$44			 ; E0 44 | Compare X register (immediate)
	EOR $72			  ; 45 72 | Exclusive OR with accumulator (zero page)
	INC $C7F9,X		  ; FE F9 C7 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	TSX				  ; BA | Transfer stack pointer to X register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	INX				  ; E8 | Increment X register
	BPL $F8			  ; 10 F8 | Branch if positive
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	JMP ($F8EC)		  ; 6C EC F8 | Jump to address (absolute indirect)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_036
; Address: $EC8C6E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_036:
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	PEA #$E404		   ; F4 04 E4 | Push effective address to stack
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BPL $D8			  ; 10 D8 | Branch if positive
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	STZ $7CF4			; 9C F4 7C | Store zero to absolute
	JMP $7D635F		  ; 5C 5F 63 7D | Jump to address long
	CMP $FEFF,Y		  ; D9 FF FE | Compare accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_037
; Address: $EC8C92
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_037:
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP $38E7,Y		  ; D9 E7 38 | Compare accumulator (absolute,Y)
	BRA $C0			  ; 80 C0 | Branch always
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_038
; Address: $EC8CB0
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_038:
	JSR $40A0			; 20 A0 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_03B
; Address: $EC8CBC
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_03B:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$34			 ; E0 34 | Compare X register (immediate)
	LSR $767E			; 4E 7E 76 | Logical shift right (absolute)
	LSR $FCA8,X		  ; 5E A8 FC | Logical shift right (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX $EC			  ; E4 EC | Compare X register (zero page)
	STZ $80			  ; 64 80 | Store zero to zero page
	STY $C2			  ; 84 C2 | Store Y register to zero page
	INC $FA80,X		  ; FE 80 FA | Increment (absolute,X)
	BRA $F8			  ; 80 F8 | Branch always
	ASL $FA			  ; 06 FA | Arithmetic shift left (zero page)
	ASL $1AFE			; 0E FE 1A | Arithmetic shift left (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	DEC $7E7A,X		  ; DE 7A 7E | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_03E
; Address: $EC8CE8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_03E:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_040
; Address: $EC8CEE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_040:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_042
; Address: $EC8D04
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_042:
	ORA $C5			  ; 05 C5 | Logical OR with accumulator (zero page)
	EOR ($47,X)		  ; 41 47 | Exclusive OR with accumulator ((zero page,X))
	ADC ($79),Y		  ; 71 79 | Add with carry ((zero page),Y)
	LSR $30CE			; 4E CE 30 | Logical shift right (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	INC $7A37,X		  ; FE 37 7A | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	CLV				  ; B8 | Clear overflow flag
	STX $FF			  ; 86 FF | Store X register to zero page
	LDA ($7F),Y		  ; B1 7F | Load from (zero page),Y into accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STY $FC			  ; 84 FC | Store Y register to zero page
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	DEC $9E3F,X		  ; DE 3F 9E | Decrement (absolute,X)
	STZ $DF07,X		  ; 9E 07 DF | Store zero to absolute,X
	ROR $66			  ; 66 66 | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_043
; Address: $EC8D4A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_043:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BRA $E0			  ; 80 E0 | Game work RAM access
	ADC ($3F,X)		  ; 61 3F | Add with carry ((zero page,X))
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	STA $E7FF,Y		  ; 99 FF E7 | Store accumulator to absolute,Y
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_044
; Address: $EC8D71
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_044:
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$68			 ; A0 68 | Load immediate value into Y register
	LDY $B4			  ; A4 B4 | Load from zero page into Y register
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $50			  ; 50 50 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank58_DmaFunction_045
; Address: $EC8D88
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_045:
	JSR $00A0			; 20 A0 00 | Jump to subroutine
	BRA $D6			  ; 80 D6 | Branch always
	ROL $7E4A,X		  ; 3E 4A 7E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_046
; Address: $EC8D95
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_046:
	ROR $FCAC,X		  ; 7E AC FC | Rotate right (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_047
; Address: $EC8DB4
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_047:
	BRA $60			  ; 80 60 | Branch always
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPX #$E0			 ; E0 E0 | Game work RAM access
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$D8			 ; A0 D8 | Load immediate value into Y register
	INC $E7			  ; E6 E7 | Increment (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	BCC $9F			  ; 90 9F | Branch if carry clear
	BEQ $F0			  ; F0 F0 | Branch if equal
	BCC $F0			  ; 90 F0 | Branch if carry clear
	BIT $E4			  ; 24 E4 | Test bits in accumulator (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	PEA #$F878		   ; F4 78 F8 | Push effective address to stack
	BEQ $0C			  ; F0 0C | Branch if equal
	BEQ $18			  ; F0 18 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $04			  ; F0 04 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $04			  ; F0 04 | Branch if equal
	BMI $07			  ; 30 07 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	LDY $A8EF			; AC EF A8 | Load from absolute address into Y register
	CMP ($DD),Y		  ; D1 DD | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_048
; Address: $EC8E0E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_048:
	EOR ($5F),Y		  ; 51 5F | Exclusive OR with accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	STY $10FF			; 8C FF 10 | Store Y register to absolute address
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_049
; Address: $EC8E1C
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_049:
	JSL $98A0FC		  ; 22 FC A0 98 | Jump to subroutine long
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $60			  ; 80 60 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	BRA $20			  ; 80 20 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $60			  ; 80 60 | Branch always
	BRA $20			  ; 80 20 | Branch always
	BRA $60			  ; 80 60 | Branch always
	BRA $1E			  ; 80 1E | Branch always
	ASL $3A38,X		  ; 1E 38 3A | Arithmetic shift left (absolute,X)
	ROR $76			  ; 66 76 | Rotate right (zero page)
	ROR $C8			  ; 66 C8 | Rotate right (zero page)
	STY $DEDE			; 8C DE DE | Store Y register to absolute address
	PEA #$5AFC		   ; F4 FC 5A | Push effective address to stack
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	CPY $7C			  ; C4 7C | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_04A
; Address: $EC8E5A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_04A:
	JSR $02FC			; 20 FC 02 | Jump to subroutine
	PEA #$84A8		   ; F4 A8 84 | Push effective address to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_04D
; Address: $EC8E68
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_04D:
	BRA $C0			  ; 80 C0 | Branch always
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank58_DmaFunction_04E
; Address: $EC8E78
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_04E:
	JSR $40E0			; 20 E0 40 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BRA $9A			  ; 80 9A | Branch always
	STZ $2FCC,X		  ; 9E CC 2F | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank58_DmaFunction_04F
; Address: $EC8E84
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_04F:
	ORA #$AD			 ; 09 AD | Logical OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ASL $2D0F			; 0E 0F 2D | Arithmetic shift left (absolute)
	LDA $8106			; AD 06 81 | Load from absolute address into accumulator
	ADC ($0C,X)		  ; 61 0C | Add with carry ((zero page,X))
	BNE $0C			  ; D0 0C | Branch if not equal
	ASL $0FD0			; 0E D0 0F | Arithmetic shift left (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	BCS $70			  ; B0 70 | Branch if carry set
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BCC $F0			  ; 90 F0 | Branch if carry clear
	CPX $E0			  ; E4 E0 | Game work RAM access
	STZ $70			  ; 64 70 | Store zero to zero page
	LDY $E0E0,X		  ; BC E0 E0 | Game work RAM access
	STY $8430			; 8C 30 84 | Store Y register to absolute address
	BEQ $0C			  ; F0 0C | Branch if equal
	BEQ $1C			  ; F0 1C | Branch if equal
	BEQ $8C			  ; F0 8C | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	AND ($BF),Y		  ; 31 BF | Logical AND with accumulator ((zero page),Y)
	AND $0B3F,X		  ; 3D 3F 0B | Logical AND with accumulator (absolute,X)
	LDA				  ; BF 3E 7E 44 | Load from absolute long,X into accumulator
	ORA $1FC4,Y		  ; 19 C4 1F | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	STA ($FD,X)		  ; 81 FD | Store accumulator to (zero page,X)
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BRA $B0			  ; 80 B0 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	CPY #$30			 ; C0 30 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_051
; Address: $EC8EEE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_051:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BRA $60			  ; 80 60 | Branch always
	BRA $70			  ; 80 70 | Branch always
	BRA $50			  ; 80 50 | Branch always
	BRA $30			  ; 80 30 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	BCS $00			  ; B0 00 | Branch if carry set
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_052
; Address: $EC8F00
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_052:
	LDY #$B4			 ; A0 B4 | Load immediate value into Y register
	CMP $3C2C			; CD 2C 3C | Compare accumulator (absolute)
	LDY $16D4,X		  ; BC D4 16 | Load from absolute,X into Y register
	AND $182D			; 2D 2D 18 | Logical AND with accumulator (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	CLC				  ; 18 | Clear carry flag
	CLV				  ; B8 | Clear overflow flag
	LSR				  ; 4A | Logical shift right (accumulator)
	SBC #$1C			 ; E9 1C | Subtract with carry (immediate)
	CLC				  ; 18 | Clear carry flag
	SBC $18			  ; E5 18 | Subtract with carry (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	STA $B0E8			; 8D E8 B0 | Store accumulator to absolute address
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_054
; Address: $EC8F28
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_054:
	JSR $2020			; 20 20 20 | Jump to subroutine
	BRA $70			  ; 80 70 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVC $50			  ; 50 50 | Branch if overflow clear
	BNE $00			  ; D0 00 | Branch if not equal
	BVC $00			  ; 50 00 | Branch if overflow clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $40			  ; B0 40 | Branch if carry set
	BCS $C0			  ; B0 C0 | Branch if carry set
	AND $677D,X		  ; 3D 7D 67 | Logical AND with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	STX $45			  ; 86 45 | Store X register to zero page
	AND $4D3D			; 2D 3D 4D | Logical AND with accumulator (absolute)
	SBC $FD80			; ED 80 FD | Subtract with carry (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC $C5BA,Y		  ; 79 BA C5 | Add with carry (absolute,Y)
	BPL $10			  ; 10 10 | Branch if positive
	STY $88			  ; 84 88 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_055
; Address: $EC8F66
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_055:
	JSR $0CD8			; 20 D8 0C | Jump to subroutine
	BIT $2C			  ; 24 2C | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	BCC $EC			  ; 90 EC | Branch if carry clear
	CPX #$74			 ; E0 74 | Compare X register (immediate)
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	CPX #$EC			 ; E0 EC | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	BRA $C4			  ; 80 C4 | Branch always
	BRA $FC			  ; 80 FC | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_056
; Address: $EC8F7F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_056:
	RTI				  ; 40 | Return from interrupt
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	BIT $706C			; 2C 6C 70 | Test bits in accumulator (absolute)
	SBC ($03),Y		  ; F1 03 | Subtract with carry ((zero page),Y)
	DEC $BE0E			; CE 0E BE | Decrement (absolute)
	ROR $3E1E,X		  ; 7E 1E 3E | Rotate right (absolute,X)
	ADC $85F9,Y		  ; 79 F9 85 | Add with carry (absolute,Y)
	STA $72BD7E		  ; 8F 7E BD 72 | Store accumulator to absolute long address
	SBC ($4E),Y		  ; F1 4E | Subtract with carry ((zero page),Y)
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	STX $1F			  ; 86 1F | Store X register to zero page

;------------------------------------------------------------------------------
; Bank58_DmaFunction_057
; Address: $EC8FA0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_057:
	JSR $4040			; 20 40 40 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_059
; Address: $EC8FA8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_059:
	JSR $6080			; 20 80 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_05B
; Address: $EC8FB0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_05B:
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_05C
; Address: $EC8FBA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_05C:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$50			 ; 69 50 | Add with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_05E
; Address: $EC8FCA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_05E:
	JSL $686260		  ; 22 60 62 68 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	LDX $9EF8			; AE F8 9E | Load from absolute address into X register
	BVS $BA			  ; 70 BA | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_05F
; Address: $EC8FD8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_05F:
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	DEC $9EB8,X		  ; DE B8 9E | Decrement (absolute,X)
	PEA #$049E		   ; F4 9E 04 | Push effective address to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_061
; Address: $EC8FE5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_061:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_065
; Address: $EC8FEF
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_065:
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	STA $D88F			; 8D 8F D8 | Store accumulator to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BMI $22			  ; 30 22 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $40			  ; E6 40 | Increment (zero page)
	BNE $72			  ; D0 72 | Branch if not equal
	ORA $0DF7			; 0D F7 0D | Logical OR with accumulator (absolute)
	ORA $09FF			; 0D FF 09 | Logical OR with accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	ORA $68B8,Y		  ; 19 B8 68 | Logical OR with accumulator (absolute,Y)
	JMP $0CC0			; 4C C0 0C | Jump to address
	BCC $10			  ; 90 10 | Branch if carry clear
	BCS $E8			  ; B0 E8 | Branch if carry set
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY $FC70,X		  ; BC 70 FC | Load from absolute,X into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_066
; Address: $EC9034
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_066:
	CPX $1C50			; EC 50 1C | Compare X register (absolute)
	BEQ $FC			  ; F0 FC | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	JMP $B09C			; 4C 9C B0 | Jump to address
	ORA ($40),Y		  ; 11 40 | Logical OR with accumulator ((zero page),Y)
	LDY $00			  ; A4 00 | Load from zero page into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $6B			  ; 80 6B | Branch always
	ASL $18FC,X		  ; 1E FC 18 | Arithmetic shift left (absolute,X)
	BEQ $20			  ; F0 20 | Branch if equal
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_067
; Address: $EC9067
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_067:
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_068
; Address: $EC9073
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_068:
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $9C			  ; 80 9C | Branch always
	INC $3C			  ; E6 3C | Increment (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	BVC $94			  ; 50 94 | Branch if overflow clear
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BCS $00			  ; B0 00 | Branch if carry set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $7E			  ; 80 7E | Branch always
	PHX				  ; DA | Push X register to stack
	CPX $F818			; EC 18 F8 | Compare X register (absolute)
	BPL $F0			  ; 10 F0 | Branch if positive
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	STA $009E1E		  ; 8F 1E 9E 00 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank58_DmaFunction_069
; Address: $EC90C9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_069:
	JSR $4000			; 20 00 40 | Jump to subroutine
	EOR $45			  ; 45 45 | Exclusive OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	STZ $0F61,X		  ; 9E 61 0F | Store zero to absolute,X
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TSX				  ; BA | Transfer stack pointer to X register
	CLC				  ; 18 | Clear carry flag
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_06A
; Address: $EC90E3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_06A:
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CPY $0C00			; CC 00 0C | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_06B
; Address: $EC90EB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_06B:
	JMP ($6800)		  ; 6C 00 68 | Jump to address (absolute indirect)
	CPY #$EC			 ; C0 EC | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	PEA #$10F8		   ; F4 F8 10 | Push effective address to stack
	STZ $98			  ; 64 98 | Store zero to zero page
	SEC				  ; 38 | Set carry flag
	JMP $9818			; 4C 18 98 | Jump to address
	BPL $B0			  ; 10 B0 | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_06C
; Address: $EC9108
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_06C:
	JSR $0420			; 20 20 04 | Jump to subroutine
	EOR $42			  ; 45 42 | Hardware register operation
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	PHB				  ; 8B | Push data bank register to stack
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_06D
; Address: $EC911D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_06D:
	LDA $E132,X		  ; BD 32 E1 | Load from absolute,X into accumulator
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_06E
; Address: $EC912F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_06E:
	JSR $E0E0			; 20 E0 E0 | Game work RAM access
	LDY #$E0			 ; A0 E0 | Game work RAM access
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT $A4			  ; 24 A4 | Test bits in accumulator (zero page)
	BIT $A4			  ; 24 A4 | Test bits in accumulator (zero page)
	LSR $40			  ; 46 40 | Logical shift right (zero page)
	WDM #$34			 ; 42 34 | Reserved instruction
	INC $EA3E,X		  ; FE 3E EA | Increment (absolute,X)
	ROL $7EC0,X		  ; 3E C0 7E | Rotate left (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	LSR $FE3A,X		  ; 5E 3A FE | Logical shift right (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDY $C42A,X		  ; BC 2A C4 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_06F
; Address: $EC9161
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_06F:
	ASL $4000,X		  ; 1E 00 40 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_071
; Address: $EC9171
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_071:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	LDY #$60			 ; A0 60 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_072
; Address: $EC9178
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_072:
	JSR $60E0			; 20 E0 60 | Jump to subroutine
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	JMP $4740			; 4C 40 47 | Jump to address
	SEC				  ; 38 | Set carry flag
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_073
; Address: $EC9189
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_073:
	JSR $5040			; 20 40 50 | Jump to subroutine
	ORA $85			  ; 05 85 | Logical OR with accumulator (zero page)
	BCS $B8			  ; B0 B8 | Branch if carry set
	BPL $C7			  ; 10 C7 | Branch if positive
	TSX				  ; BA | Transfer stack pointer to X register
	DEC				  ; 3A | Decrement accumulator
	LDY #$2C			 ; A0 2C | Load immediate value into Y register
	INY				  ; C8 | Increment Y register
	JMP ($A8A0)		  ; 6C A0 A8 | Jump to address (absolute indirect)
	PLP				  ; 28 | Pull processor status from stack
	BIT $7860			; 2C 60 78 | Test bits in accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	JMP $A42008		  ; 5C 08 20 A4 | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	STY $2030			; 8C 30 20 | Store Y register to absolute address
	JMP $60D0BC		  ; 5C BC D0 60 | Jump to address long
	STY $DC			  ; 84 DC | Store Y register to zero page
	LDY #$E4			 ; A0 E4 | Load immediate value into Y register
	LDY #$98			 ; A0 98 | Load immediate value into Y register
	CPY $02			  ; C4 02 | Compare Y register (zero page)
	EOR ($47),Y		  ; 51 47 | Exclusive OR with accumulator ((zero page),Y)
	ADC $11CD			; 6D CD 11 | Add with carry (absolute)
	ORA ($81),Y		  ; 11 81 | Logical OR with accumulator ((zero page),Y)
	BNE $20			  ; D0 20 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	STA ($05,X)		  ; 81 05 | Store accumulator to (zero page,X)
	ROL $B3A1			; 2E A1 B3 | Rotate left (absolute)
	ADC $FA02,X		  ; 7D 02 FA | Add with carry (absolute,X)
	LDA				  ; BF 3B E2 3E | Load from absolute long,X into accumulator
	PLX				  ; FA | Pull X register from stack
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_074
; Address: $EC91E6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_074:
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_075
; Address: $EC91ED
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_075:
	JSR $0080			; 20 80 00 | Jump to subroutine
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	LDY #$E0			 ; A0 E0 | Game work RAM access
	LDY #$E0			 ; A0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank58_DmaFunction_077
; Address: $EC91F9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_077:
	JSR $2060			; 20 60 20 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BVC $52			  ; 50 52 | Branch if overflow clear
	BNE $22			  ; D0 22 | Branch if not equal
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	SEP #$02			 ; E2 02 | Set processor status bits
	EOR $80			  ; 45 80 | Exclusive OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	STY $AA			  ; 84 AA | Store Y register to zero page
	PHX				  ; DA | Push X register to stack
	SBC $FB1C,X		  ; FD 1C FB | Subtract with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_078
; Address: $EC9220
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_078:
	JSR $6000			; 20 00 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BMI $A0			  ; 30 A0 | Branch if negative
	BPL $60			  ; 10 60 | Branch if positive
	BRA $A0			  ; 80 A0 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_079
; Address: $EC9237
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_079:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	BEQ $20			  ; F0 20 | Branch if equal
	BNE $40			  ; D0 40 | Branch if not equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	STA $15			  ; 85 15 | Store accumulator to zero page
	RTI				  ; 40 | Return from interrupt
	STA ($11,X)		  ; 81 11 | Store accumulator to (zero page,X)
	BCC $4F			  ; 90 4F | Branch if carry clear
	DEC $504F,X		  ; DE 4F 50 | Decrement (absolute,X)
	ROR $2AD7,X		  ; 7E D7 2A | Rotate right (absolute,X)
	ROL $6BF6			; 2E F6 6B | Rotate left (absolute)
	STA ($20),Y		  ; 91 20 | Store accumulator to (zero page),Y
	LDA				  ; BF 00 70 44 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_07A
; Address: $EC9262
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_07A:
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BMI $08			  ; 30 08 | Branch if negative
	JMP ($B480)		  ; 6C 80 B4 | Jump to address (absolute indirect)
	JMP $40F460		  ; 5C 60 F4 40 | Jump to address long
	BRA $BC			  ; 80 BC | Branch always
	CPY #$88			 ; C0 88 | Compare Y register (immediate)
	CPY $94			  ; C4 94 | Compare Y register (zero page)
	BRA $7C			  ; 80 7C | Branch always
	CPX $20			  ; E4 20 | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	PEA #$8408		   ; F4 08 84 | Push effective address to stack
	LDY $80			  ; A4 80 | Load from zero page into Y register
	ORA ($45,X)		  ; 01 45 | Logical OR with accumulator ((zero page,X))
	AND $82			  ; 25 82 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_07B
; Address: $EC9289
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_07B:
	JSR $AB0D			; 20 0D AB | Jump to subroutine
	JMP $5A2F			; 4C 2F 5A | Jump to address
	NOP				  ; EA | No operation
	ROL $1AEE,X		  ; 3E EE 1A | Rotate left (absolute,X)
	SBC #$1C			 ; E9 1C | Subtract with carry (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	EOR $50E4,X		  ; 5D E4 50 | Exclusive OR with accumulator (absolute,X)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_07C
; Address: $EC92A2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_07C:
	BRA $A0			  ; 80 A0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_07D
; Address: $EC92B3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_07D:
	RTI				  ; 40 | Return from interrupt
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_07E
; Address: $EC92B9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_07E:
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	STY $C6			  ; 84 C6 | Store Y register to zero page
	ORA $8A			  ; 05 8A | Logical OR with accumulator (zero page)
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	STZ $E870,X		  ; 9E 70 E8 | Store zero to absolute,X
	STZ $4C			  ; 64 4C | Store zero to zero page
	SEI				  ; 78 | Set interrupt disable flag
	CMP $DF38,Y		  ; D9 38 DF | Compare accumulator (absolute,Y)
	BVS $D5			  ; 70 D5 | Branch if overflow set
	PHX				  ; DA | Push X register to stack
	BVS $C6			  ; 70 C6 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_07F
; Address: $EC92DC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_07F:
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL $BE			  ; 06 BE | Arithmetic shift left (zero page)
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_080
; Address: $EC92EA
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_080:
	JSR $40A0			; 20 A0 40 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BVS $40			  ; 70 40 | Branch if overflow set
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	LDY #$1A			 ; A0 1A | Load immediate value into Y register
	EOR ($B1,X)		  ; 41 B1 | Exclusive OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCS $D4			  ; B0 D4 | Branch if carry set
	ORA $F1			  ; 05 F1 | Logical OR with accumulator (zero page)
	ASL $3FF0			; 0E F0 3F | Arithmetic shift left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $40			  ; F0 40 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	STY $D4C0			; 8C C0 D4 | Store Y register to absolute address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	BVS $D4			  ; 70 D4 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $FE			  ; 10 FE | Branch if positive
	LDY $0292			; AC 92 02 | Load from absolute address into Y register
	PLX				  ; FA | Pull X register from stack
	STY $34			  ; 84 34 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	CPX $B000			; EC 00 B0 | Compare X register (absolute)
	CPY #$EF			 ; C0 EF | Compare Y register (immediate)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA $F4			  ; 05 F4 | Logical OR with accumulator (zero page)
	CPX $B010			; EC 10 B0 | Compare X register (absolute)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_082
; Address: $EC9367
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_082:
	BRA $00			  ; 80 00 | Branch always
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BRA $40			  ; 80 40 | Branch always
	BIT $FC			  ; 24 FC | Test bits in accumulator (zero page)
	BPL $2A			  ; 10 2A | Branch if positive
	BCC $34			  ; 90 34 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	BNE $00			  ; D0 00 | Branch if not equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$DE			 ; C0 DE | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	PEA #$C808		   ; F4 08 C8 | Push effective address to stack
	BMI $D0			  ; 30 D0 | Branch if negative

;------------------------------------------------------------------------------
; Bank58_DmaFunction_083
; Address: $EC939B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_083:
	JSR $40A0			; 20 A0 40 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	AND $5700,X		  ; 3D 00 57 | Logical AND with accumulator (absolute,X)
	BPL $88			  ; 10 88 | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_084
; Address: $EC93C5
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_084:
	JSR $5040			; 20 40 50 | Jump to subroutine
	BVC $67			  ; 50 67 | Branch if overflow clear
	EOR ($66),Y		  ; 51 66 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($66),Y		  ; 51 66 | Exclusive OR with accumulator ((zero page),Y)
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 A8 5C | Load from absolute long,X into accumulator
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	BIT $24D8			; 2C D8 24 | Test bits in accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	BIT $2CD8			; 2C D8 2C | Test bits in accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	BIT $F4D8			; 2C D8 F4 | Test bits in accumulator (absolute)
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_085
; Address: $EC93FA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_085:
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	PEA #$2900		   ; F4 00 29 | Push effective address to stack
	ROR $A500			; 6E 00 A5 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_086
; Address: $EC9405
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_086:
	JSL $014669		  ; 22 69 46 01 | Jump to subroutine long
	ROR $6E41			; 6E 41 6E | Rotate right (absolute)
	EOR $6A			  ; 45 6A | Exclusive OR with accumulator (zero page)
	EOR $6A			  ; 45 6A | Exclusive OR with accumulator (zero page)
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 60 C0 | Load from absolute long,X into accumulator
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BIT $1A			  ; 24 1A | Test bits in accumulator (zero page)
	JMP ($9402)		  ; 6C 02 94 | Jump to address (absolute indirect)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STY $9A			  ; 84 9A | Store Y register to zero page
	CPY $9A			  ; C4 9A | Compare Y register (zero page)
	STY $DA			  ; 84 DA | Store Y register to zero page
	STY $DA			  ; 84 DA | Store Y register to zero page
	STY $DA			  ; 84 DA | Store Y register to zero page
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $7E00,X		  ; FE 00 7E | Increment (absolute,X)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_087
; Address: $EC9463
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_087:
	JSR $00A0			; 20 A0 00 | Jump to subroutine
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_08C
; Address: $EC9480
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_08C:
	ORA ($26),Y		  ; 11 26 | Logical OR with accumulator ((zero page),Y)
	EOR $B166,Y		  ; 59 66 B1 | Exclusive OR with accumulator (absolute,Y)
	ROR $D1			  ; 66 D1 | Rotate right (zero page)
	INC $B9			  ; E6 B9 | Increment (zero page)
	ROR $D1			  ; 66 D1 | Rotate right (zero page)
	ROL $9A			  ; 26 9A | Rotate left (zero page)
	BIT $58			  ; 24 58 | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_08D
; Address: $EC9492
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_08D:
	LDA				  ; BF 00 9F 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 2C D8 | Load from absolute long,X into accumulator
	BIT $D0			  ; 24 D0 | Test bits in accumulator (zero page)
	BIT $D0			  ; 24 D0 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BIT $ACD8			; 2C D8 AC | Test bits in accumulator (absolute)
	BVC $20			  ; 50 20 | Branch if overflow clear
	STZ $F458			; 9C 58 F4 | Store zero to absolute
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	CPX $00			  ; E4 00 | Compare X register (zero page)
	EOR $6A			  ; 45 6A | Exclusive OR with accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $6A			  ; 45 6A | Exclusive OR with accumulator (zero page)
	NOP				  ; EA | No operation
	LDX $68			  ; A6 68 | Load from zero page into X register
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_08E
; Address: $EC94CD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_08E:
	JSR $6844			; 20 44 68 | Jump to subroutine
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	STA				  ; 9F 00 3F 00 | Store accumulator to absolute long,X
	LDA				  ; BF 00 E0 40 | Load from absolute long,X into accumulator
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_08F
; Address: $EC94E5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_08F:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_091
; Address: $EC9500
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_091:
	JSL $5A0458		  ; 22 58 04 5A | Jump to subroutine long
	BRA $5A			  ; 80 5A | Branch always
	LDY $DA			  ; A4 DA | Load from zero page into Y register
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_092
; Address: $EC9509
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_092:
	BVC $B6			  ; 50 B6 | Branch if overflow clear
	WDM #$AE			 ; 42 AE | Reserved instruction
	BPL $46			  ; 10 46 | Branch if positive
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	LDX $7E00,Y		  ; BE 00 7E | Load from absolute,Y into X register
	LDX $FC00,Y		  ; BE 00 FC | Load from absolute,Y into X register
	PLX				  ; FA | Pull X register from stack
	INC $8000,X		  ; FE 00 80 | Increment (absolute,X)
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_093
; Address: $EC9523
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_093:
	JSR $40A0			; 20 A0 40 | Jump to subroutine
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_095
; Address: $EC9532
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_095:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_096
; Address: $EC9538
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_096:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_098
; Address: $EC9543
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_098:
	JSR $215E			; 20 5E 21 | PPU graphics register access
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	BIT #$36			 ; 89 36 | Test bits in accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	BVS $2C			  ; 70 2C | Branch if overflow set
	INX				  ; E8 | Increment X register
	BIT $D0			  ; 24 D0 | Test bits in accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	STZ $5CA8			; 9C A8 5C | Store zero to absolute
	LDY #$54			 ; A0 54 | Load immediate value into Y register
	LDY #$54			 ; A0 54 | Load immediate value into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $FC00DC		  ; 5C DC 00 FC | Jump to address long
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	PEA #$1300		   ; F4 00 13 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_099
; Address: $EC9581
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_099:
	JSR $20DF			; 20 DF 20 | Jump to subroutine
	EOR ($2E),Y		  ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
	STA ($2E),Y		  ; 91 2E | Store accumulator to (zero page),Y
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $00FF			; 2C FF 00 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_09A
; Address: $EC95A1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_09A:
	JSR $A000			; 20 00 A0 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_09B
; Address: $EC95A9
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_09B:
	JSR $A000			; 20 00 A0 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$E0			 ; A0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY $34C2			; AC C2 34 | Load from absolute address into Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	BIT $5A			  ; 24 5A | Test bits in accumulator (zero page)
	BIT $5A			  ; 24 5A | Test bits in accumulator (zero page)
	BIT $5A			  ; 24 5A | Test bits in accumulator (zero page)
	BIT $5A			  ; 24 5A | Test bits in accumulator (zero page)
	BIT $5A			  ; 24 5A | Test bits in accumulator (zero page)
	CPX $5A			  ; E4 5A | Compare X register (zero page)
	ROR $FE00,X		  ; 7E 00 FE | Rotate right (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $BE00,X		  ; FE 00 BE | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_09E
; Address: $EC95E9
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_09E:
	JSR $2040			; 20 40 20 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	AND #$D6			 ; 29 D6 | Logical AND with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	BIT #$30			 ; 89 30 | Test bits in accumulator (immediate)
	BIT #$36			 ; 89 36 | Test bits in accumulator (immediate)
	EOR ($B8,X)		  ; 41 B8 | Exclusive OR with accumulator ((zero page,X))
	BIT #$06			 ; 89 06 | Test bits in accumulator (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$54			 ; A0 54 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_09F
; Address: $EC9622
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_09F:
	LDY #$54			 ; A0 54 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	CPY $24			  ; C4 24 | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0A0
; Address: $EC962A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0A0:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	JMP ($C835)		  ; 6C 35 C8 | Jump to address (absolute indirect)
	CLI				  ; 58 | Clear interrupt disable flag
	STA ($2C),Y		  ; 91 2C | Store accumulator to (zero page),Y
	STX $31			  ; 86 31 | Store X register to zero page
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0A1
; Address: $EC964D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0A1:
	BCC $00			  ; 90 00 | Branch if carry clear
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0A2
; Address: $EC9665
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0A2:
	JSR $4080			; 20 80 40 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT $7252			; 2C 52 72 | Test bits in accumulator (absolute)
	STY $24			  ; 84 24 | Store Y register to zero page
	DEX				  ; CA | Decrement X register
	LDY #$54			 ; A0 54 | Load immediate value into Y register
	PLA				  ; 68 | Pull accumulator from stack
	BVC $C0			  ; 50 C0 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0A3
; Address: $EC968D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0A3:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0A4
; Address: $EC96A2
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0A4:
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0A5
; Address: $EC96A7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0A5:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0A6
; Address: $EC96BA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0A6:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $3C			  ; 30 3C | Branch if negative
	RTI				  ; 40 | Return from interrupt
	STY $68			  ; 84 68 | Store Y register to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0A7
; Address: $EC96CA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0A7:
	LSR $A4			  ; 46 A4 | Logical shift right (zero page)
	LSR $A4			  ; 46 A4 | Logical shift right (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0A8
; Address: $EC96CF
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0A8:
	STY $FF			  ; 84 FF | Store Y register to zero page
	SEP #$00			 ; E2 00 | Set processor status bits
	SEP #$00			 ; E2 00 | Set processor status bits
	SEP #$00			 ; E2 00 | Set processor status bits
	STY $0C68			; 8C 68 0C | Store Y register to absolute address
	PHA				  ; 48 | Push accumulator to stack
	JMP $4C08			; 4C 08 4C | Jump to address
	PHP				  ; 08 | Push processor status to stack
	STY $1C98			; 8C 98 1C | Store Y register to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BMI $36			  ; 30 36 | Branch if negative
	EOR ($58,X)		  ; 41 58 | Exclusive OR with accumulator ((zero page,X))
	STA $69			  ; 85 69 | Store accumulator to zero page
	BCC $49			  ; 90 49 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$28			 ; A0 28 | Load immediate value into Y register
	TXA				  ; 8A | Transfer X register to accumulator
	SBC $F900,X		  ; FD 00 F9 | Subtract with carry (absolute,X)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0AB
; Address: $EC972A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0AB:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BRA $20			  ; 80 20 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0B1
; Address: $EC9742
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0B1:
	DEC				  ; 3A | Decrement accumulator
	DEY				  ; 88 | Decrement Y register
	ROR				  ; 6A | Rotate right (accumulator)
	BRA $4A			  ; 80 4A | Branch always
	LDY #$4A			 ; A0 4A | Load immediate value into Y register
	BRA $06			  ; 80 06 | Branch always
	DEY				  ; 88 | Decrement Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $FE			  ; 80 FE | Branch always
	INC $FA00,X		  ; FE 00 FA | Increment (absolute,X)
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	DEX				  ; CA | Decrement X register
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	ASL $2030			; 0E 30 20 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0B2
; Address: $EC9765
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0B2:
	BRA $40			  ; 80 40 | Branch always
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $FE			  ; 80 FE | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA $C4F4			; 8D F4 C4 | Store accumulator to absolute address
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)
	LDY $B3			  ; A4 B3 | Load from zero page into Y register
	CPY #$F2			 ; C0 F2 | Compare Y register (immediate)
	DEC $24			  ; C6 24 | Decrement (zero page)
	WDM #$A4			 ; 42 A4 | Reserved instruction
	XBA				  ; EB | Exchange accumulator bytes
	SBC $4F00,Y		  ; F9 00 4F | Subtract with carry (absolute,Y)
	SEP #$00			 ; E2 00 | Set processor status bits
	SEP #$00			 ; E2 00 | Set processor status bits
	LDY $4C88			; AC 88 4C | Load from absolute address into Y register
	PHP				  ; 08 | Push processor status to stack
	CPY $D0			  ; C4 D0 | Compare Y register (zero page)
	STY $0468			; 8C 68 04 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	BRA $E8			  ; 80 E8 | Branch always
	STY $B0E2			; 8C E2 B0 | Store Y register to absolute address
	PEA #$3C00		   ; F4 00 3C | Push effective address to stack
	CPX $00			  ; E4 00 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0B3
; Address: $EC97B8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0B3:
	CPY $5C00			; CC 00 5C | Compare Y register (absolute)
	LSR $6B00			; 4E 00 6B | Logical shift right (absolute)
	STY $C4F2			; 8C F2 C4 | Store Y register to absolute address
	PHP				  ; 08 | Push processor status to stack
	ORA #$B1			 ; 09 B1 | Logical OR with accumulator (immediate)
	BCS $C9			  ; B0 C9 | Branch if carry set
	INX				  ; E8 | Increment X register
	CMP #$28			 ; C9 28 | Compare accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0B4
; Address: $EC97CF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0B4:
	DEY				  ; 88 | Decrement Y register
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0B5
; Address: $EC97E4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0B5:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BCC $C0			  ; 90 C0 | Branch if carry clear
	BPL $40			  ; 10 40 | Branch if positive
	BPL $40			  ; 10 40 | Branch if positive
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0B7
; Address: $EC97F8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0B7:
	BCC $00			  ; 90 00 | Branch if carry clear
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	LSR $80			  ; 46 80 | Logical shift right (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	STY $10BA			; 8C BA 10 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0B8
; Address: $EC9806
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0B8:
	JSL $B28630		  ; 22 30 86 B2 | Jump to subroutine long
	STA $D18E,Y		  ; 99 8E D1 | Store accumulator to absolute,Y
	EOR ($80),Y		  ; 51 80 | Exclusive OR with accumulator ((zero page),Y)
	DEC $7600,X		  ; DE 00 76 | Decrement (absolute,X)
	NOP				  ; EA | No operation
	ADC $5300,X		  ; 7D 00 53 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0BA
; Address: $EC9825
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0BA:
	JSR $1070			; 20 70 10 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	BVS $C0			  ; 70 C0 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0BB
; Address: $EC9834
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0BB:
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BVC $00			  ; 50 00 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0BC
; Address: $EC983E
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0BC:
	BCS $00			  ; B0 00 | Branch if carry set
	ROR $C4			  ; 66 C4 | Rotate right (zero page)
	CPY $7A			  ; C4 7A | Compare Y register (zero page)
	CPY #$B5			 ; C0 B5 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDX $4D			  ; A6 4D | Load from zero page into X register
	INC $A2			  ; E6 A2 | Increment (zero page)
	PLB				  ; AB | Pull data bank register from stack
	LDA				  ; BF 00 F8 00 | Load from absolute long,X into accumulator
	SEP #$00			 ; E2 00 | Set processor status bits
	PLB				  ; AB | Pull data bank register from stack
	REP #$98			 ; C2 98 | Reset processor status bits
	WDM #$10			 ; 42 10 | Reserved instruction
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	STZ $A4C0			; 9C C0 A4 | Store zero to absolute
	BNE $C4			  ; D0 C4 | Branch if not equal
	ROR $FE00,X		  ; 7E 00 FE | Rotate right (absolute,X)
	LSR $CE00,X		  ; 5E 00 CE | Logical shift right (absolute,X)
	JMP $007C00		  ; 5C 00 7C 00 | Jump to address long
	ADC $76C8			; 6D C8 76 | Add with carry (absolute)
	REP #$6C			 ; C2 6C | Reset processor status bits
	CLV				  ; B8 | Clear overflow flag
	BRA $B1			  ; 80 B1 | Branch always
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA #$0D			 ; A9 0D | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B300,X		  ; BD 00 B3 | Load from absolute,X into accumulator
	CMP $7900			; CD 00 79 | Compare accumulator (absolute)
	LDY $9000,X		  ; BC 00 90 | Load from absolute,X into Y register
	BRA $D0			  ; 80 D0 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0BD
; Address: $EC98A8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0BD:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0BE
; Address: $EC98AE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0BE:
	JSR $7080			; 20 80 70 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	BCS $00			  ; B0 00 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0BF
; Address: $EC98B8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0BF:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0C0
; Address: $EC98BE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0C0:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX $68			  ; E4 68 | Compare X register (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	LDX #$30			 ; A2 30 | Load immediate value into X register
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0C1
; Address: $EC98CB
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0C1:
	CLC				  ; 18 | Clear carry flag
	ASL $7A84,X		  ; 1E 84 7A | Arithmetic shift left (absolute,X)
	CPY $00BB			; CC BB 00 | Compare Y register (absolute)
	LDX $DA00			; AE 00 DA | Load from absolute address into X register
	PHX				  ; DA | Push X register to stack
	BMI $80			  ; 30 80 | Branch if negative
	BCS $40			  ; B0 40 | Branch if carry set
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BRA $60			  ; 80 60 | Branch always
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0C3
; Address: $EC9901
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0C3:
	JSR $8EBE			; 20 BE 8E | Jump to subroutine
	CPX $AB			  ; E4 AB | Compare X register (zero page)
	CPY #$B2			 ; C0 B2 | Compare Y register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PEA #$8150		   ; F4 50 81 | Push effective address to stack
	PLP				  ; 28 | Pull processor status from stack
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	CPX $F0			  ; E4 F0 | Compare X register (zero page)
	STY $0460			; 8C 60 04 | Store Y register to absolute address
	BVC $8C			  ; 50 8C | Branch if overflow clear
	BVS $7C			  ; 70 7C | Branch if overflow set
	BRA $20			  ; 80 20 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	CPX $DC00			; EC 00 DC | Compare X register (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	LDY $F80F			; AC 0F F8 | Load from absolute address into Y register
	CPY #$B3			 ; C0 B3 | Compare Y register (immediate)
	WDM #$24			 ; 42 24 | Reserved instruction
	WDM #$39			 ; 42 39 | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	CPX $30			  ; E4 30 | Compare X register (zero page)
	BRA $C0			  ; 80 C0 | Branch always
	EOR $7B00			; 4D 00 7B | Exclusive OR with accumulator (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0C4
; Address: $EC9962
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0C4:
	JSR $E080			; 20 80 E0 | Game work RAM access
	BRA $40			  ; 80 40 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0C6
; Address: $EC9974
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0C6:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	BPL $E2			  ; 10 E2 | Branch if positive
	JMP $4832			; 4C 32 48 | Jump to address
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	BNE $00			  ; D0 00 | Branch if not equal
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	NOP				  ; EA | No operation
	LSR $FE00,X		  ; 5E 00 FE | Logical shift right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0C8
; Address: $EC99AA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0C8:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0C9
; Address: $EC99B4
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0C9:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA #$34			 ; 09 34 | Logical OR with accumulator (immediate)
	ORA $1964,Y		  ; 19 64 19 | Logical OR with accumulator (absolute,Y)
	STZ $19			  ; 64 19 | Store zero to zero page
	STZ $19			  ; 64 19 | Store zero to zero page
	STZ $19			  ; 64 19 | Store zero to zero page
	STZ $75			  ; 64 75 | Store zero to zero page
	ORA $72			  ; 05 72 | Logical OR with accumulator (zero page)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	STY $8C42			; 8C 42 8C | Store Y register to absolute address
	WDM #$8C			 ; 42 8C | Reserved instruction
	WDM #$8C			 ; 42 8C | Reserved instruction
	LSR $0C			  ; 46 0C | Logical shift right (zero page)
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	WDM #$DF			 ; 42 DF | Reserved instruction
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	DEC $CE00			; CE 00 CE | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0CA
; Address: $EC99F4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0CA:
	DEC $CA00			; CE 00 CA | Decrement (absolute)
	DEX				  ; CA | Decrement X register
	DEC $2000			; CE 00 20 | Decrement (absolute)
	INC $0F00,X		  ; FE 00 0F | Increment (absolute,X)
	BMI $19			  ; 30 19 | Branch if negative
	ROR $19			  ; 66 19 | Rotate right (zero page)
	STZ $1D			  ; 64 1D | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0CB
; Address: $EC9A08
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0CB:
	ORA $1166,Y		  ; 19 66 11 | Logical OR with accumulator (absolute,Y)
	STZ $11			  ; 64 11 | Store zero to zero page
	STZ $11			  ; 64 11 | Store zero to zero page
	STZ $FF			  ; 64 FF | Store zero to zero page
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	STY $8C73			; 8C 73 8C | Store Y register to absolute address
	WDM #$8C			 ; 42 8C | Reserved instruction
	STY $8C			  ; 84 8C | Store Y register to zero page
	STY $8CC6			; 8C C6 8C | Store Y register to absolute address
	DEC $0C			  ; C6 0C | Decrement (zero page)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	DEC $7B00			; CE 00 7B | Decrement (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	DEX				  ; CA | Decrement X register
	ORA #$34			 ; 09 34 | Logical OR with accumulator (immediate)
	ORA $1964,Y		  ; 19 64 19 | Logical OR with accumulator (absolute,Y)
	STZ $35			  ; 64 35 | Store zero to zero page
	RTI				  ; 40 | Return from interrupt
	ORA $1064,Y		  ; 19 64 10 | Logical OR with accumulator (absolute,Y)
	STZ $19			  ; 64 19 | Store zero to zero page
	STZ $99			  ; 64 99 | Store zero to zero page
	STZ $FD			  ; 64 FD | Store zero to zero page
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	STY $8C42			; 8C 42 8C | Store Y register to absolute address
	WDM #$88			 ; 42 88 | Reserved instruction
	WDM #$8C			 ; 42 8C | Reserved instruction
	STY $8C			  ; 84 8C | Store Y register to zero page
	WDM #$88			 ; 42 88 | Reserved instruction
	WDM #$08			 ; 42 08 | Reserved instruction
	WDM #$8C			 ; 42 8C | Reserved instruction
	WDM #$CE			 ; 42 CE | Reserved instruction
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	ORA #$34			 ; 09 34 | Logical OR with accumulator (immediate)
	ORA $1864,Y		  ; 19 64 18 | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0CC
; Address: $EC9A86
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0CC:
	BRA $40			  ; 80 40 | Branch always
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STY $8C42			; 8C 42 8C | Store Y register to absolute address
	WDM #$00			 ; 42 00 | Reserved instruction
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	ORA ($64),Y		  ; 11 64 | Logical OR with accumulator ((zero page),Y)
	ORA $1964,Y		  ; 19 64 19 | Logical OR with accumulator (absolute,Y)
	STZ $A4			  ; 64 A4 | Store zero to zero page
	ORA $9064,Y		  ; 19 64 90 | Logical OR with accumulator (absolute,Y)
	STZ $99			  ; 64 99 | Store zero to zero page
	STZ $19			  ; 64 19 | Store zero to zero page
	STZ $FD			  ; 64 FD | Store zero to zero page
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	STY $08C6			; 8C C6 08 | Store Y register to absolute address
	WDM #$08			 ; 42 08 | Reserved instruction
	WDM #$54			 ; 42 54 | Reserved instruction
	STY $8842			; 8C 42 88 | Store Y register to absolute address
	WDM #$08			 ; 42 08 | Reserved instruction
	WDM #$8C			 ; 42 8C | Reserved instruction
	WDM #$4A			 ; 42 4A | Reserved instruction
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	PLP				  ; 28 | Pull processor status from stack
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	CLC				  ; 18 | Clear carry flag
	ADC $98			  ; 65 98 | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0CD
; Address: $EC9B04
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0CD:
	BRA $40			  ; 80 40 | Branch always
	SBC $F800,X		  ; FD 00 F8 | Subtract with carry (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STY $4A			  ; 84 4A | Store Y register to zero page
	DEC $0000			; CE 00 00 | Decrement (absolute)
	ORA ($64),Y		  ; 11 64 | Logical OR with accumulator ((zero page),Y)
	ORA ($64),Y		  ; 11 64 | Logical OR with accumulator ((zero page),Y)
	BIT $994C			; 2C 4C 99 | Test bits in accumulator (absolute)
	STZ $90			  ; 64 90 | Store zero to zero page
	STZ $11			  ; 64 11 | Store zero to zero page
	STZ $91			  ; 64 91 | Store zero to zero page
	STZ $90			  ; 64 90 | Store zero to zero page
	ADC $FD			  ; 65 FD | Add with carry (zero page)
	SBC $F300,X		  ; FD 00 F3 | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $0800,X		  ; FD 00 08 | Subtract with carry (absolute,X)
	WDM #$08			 ; 42 08 | Reserved instruction
	WDM #$D6			 ; 42 D6 | Reserved instruction

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0CE
; Address: $EC9B66
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0CE:
	STY $0842			; 8C 42 08 | Store Y register to absolute address
	WDM #$8C			 ; 42 8C | Reserved instruction
	DEC $88			  ; C6 88 | Decrement (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	LSR				  ; 4A | Logical shift right (accumulator)
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	PLP				  ; 28 | Pull processor status from stack
	DEC $CE00			; CE 00 CE | Decrement (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $CE00			; 4E 00 CE | Logical shift right (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC $98			  ; 65 98 | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0CF
; Address: $EC9B84
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0CF:
	BRA $40			  ; 80 40 | Branch always
	SBC $F800,X		  ; FD 00 F8 | Subtract with carry (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0D0
; Address: $EC9BA2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0D0:
	BRA $40			  ; 80 40 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY $B05B			; AC 5B B0 | Load from absolute address into Y register
	NOP				  ; EA | No operation
	BPL $24			  ; 10 24 | Branch if positive
	SEC				  ; 38 | Set carry flag
	LDX $BD27,Y		  ; BE 27 BD | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt
	REP #$00			 ; C2 00 | Reset processor status bits
	REP #$00			 ; C2 00 | Reset processor status bits
	LDA #$38			 ; A9 38 | Load immediate value into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA ($58,X)		  ; 01 58 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0D1
; Address: $EC9BEA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0D1:
	JSR $D47C			; 20 7C D4 | Jump to subroutine
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	LDA $005C00		  ; AF 00 5C 00 | Load from absolute long address into accumulator
	JMP $00DC00		  ; 5C 00 DC 00 | Jump to address long
	INC				  ; 1A | Increment accumulator
	SBC $59			  ; E5 59 | Subtract with carry (zero page)
	STY $D5			  ; 84 D5 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0D2
; Address: $EC9C08
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0D2:
	JSL $F341BE		  ; 22 BE 41 F3 | Jump to subroutine long
	ROR $00ED,X		  ; 7E ED 00 | Rotate right (absolute,X)
	CMP $9200,X		  ; DD 00 92 | Compare accumulator (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BEQ $B0			  ; F0 B0 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0D3
; Address: $EC9C2E
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0D3:
	JSR $F0C0			; 20 C0 F0 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LSR $EAA1			; 4E A1 EA | Logical shift right (absolute)
	PHP				  ; 08 | Push processor status to stack
	ADC $01A8,X		  ; 7D A8 01 | Add with carry (absolute,X)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0D4
; Address: $EC9C89
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0D4:
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $50			  ; F0 50 | Branch if equal
	BRA $10			  ; 80 10 | Branch always
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	STY $2E			  ; 84 2E | Store Y register to zero page
	CPY $6E			  ; C4 6E | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	INC $EE40			; EE 40 EE | Increment (absolute)
	LDX $2892			; AE 92 28 | Load from absolute address into X register
	CLI				  ; 58 | Clear interrupt disable flag
	STA				  ; 9F EA 00 AA | Store accumulator to absolute long,X
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0D5
; Address: $EC9CC1
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0D5:
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $98			  ; 70 98 | Branch if overflow set
	JMP $B91420		  ; 5C 20 14 B9 | Jump to address long
	INC $50AB			; EE AB 50 | Increment (absolute)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$73			 ; A0 73 | Load immediate value into Y register
	LDY #$73			 ; A0 73 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0D6
; Address: $EC9CE4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0D6:
	JSR $21F3			; 20 F3 21 | PPU graphics register access
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	ADC $FD7F,X		  ; 7D 7F FD | Add with carry (absolute,X)
	INC $8200,X		  ; FE 00 82 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0D7
; Address: $EC9D09
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0D7:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BVS $50			  ; 70 50 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $5C			  ; 80 5C | Branch always
	BRA $5C			  ; 80 5C | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL $D1			  ; 26 D1 | Rotate left (zero page)
	DEY				  ; 88 | Decrement Y register
	LDA $2E			  ; A5 2E | Load from zero page into accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BCC $70			  ; 90 70 | Branch if carry clear
	BRA $D0			  ; 80 D0 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0D9
; Address: $EC9D6F
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0D9:
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	BNE $00			  ; D0 00 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	NOP				  ; EA | No operation
	CPY $6E			  ; C4 6E | Compare Y register (zero page)
	LDX $EE40			; AE 40 EE | Load from absolute address into X register
	LDX $6FD4,Y		  ; BE D4 6F | Load from absolute,Y into X register
	CMP $00AE,X		  ; DD AE 00 | Compare accumulator (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	NOP				  ; EA | No operation
	TAX				  ; AA | Transfer accumulator to X register
	PLX				  ; FA | Pull X register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0DB
; Address: $EC9DA6
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0DB:
	JSR $007C			; 20 7C 00 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	JMP $007C00		  ; 5C 00 7C 00 | Jump to address long
	JMP $007000		  ; 5C 00 70 00 | Jump to address long
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($D3,X)		  ; 01 D3 | Logical OR with accumulator ((zero page,X))
	LDY #$73			 ; A0 73 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0DD
; Address: $EC9DC8
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0DD:
	JSR $80F2			; 20 F2 80 | Jump to subroutine
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $F2EF7F		  ; 8F 7F EF F2 | Store accumulator to absolute long address
	BEQ $00			  ; F0 00 | Branch if equal
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $30			  ; 80 30 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0DE
; Address: $EC9DF4
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0DE:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	DEC $588D,X		  ; DE 8D 58 | Decrement (absolute,X)
	CMP $DF08,X		  ; DD 08 DF | Compare accumulator (absolute,X)
	INC $7ED2,X		  ; FE D2 7E | Increment (absolute,X)
	LDY $00D1,X		  ; BC D1 00 | Load from absolute,X into Y register
	INC $8000,X		  ; FE 00 80 | Increment (absolute,X)
	REP #$00			 ; C2 00 | Reset processor status bits
	BVS $E8			  ; 70 E8 | Branch if overflow set
	BNE $00			  ; D0 00 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0DF
; Address: $EC9E25
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0DF:
	BCC $00			  ; 90 00 | Branch if carry clear
	BCS $00			  ; B0 00 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0E0
; Address: $EC9E2E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0E0:
	RTI				  ; 40 | Return from interrupt
	CPY #$98			 ; C0 98 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STY $07			  ; 84 07 | Store Y register to zero page
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BCS $49			  ; B0 49 | Branch if carry set
	ADC $2482,X		  ; 7D 82 24 | Add with carry (absolute,X)
	INC $FF00			; EE 00 FF | Increment (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0E1
; Address: $EC9E60
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0E1:
	JSR $20D8			; 20 D8 20 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BRA $58			  ; 80 58 | Branch always
	LSR $D400,X		  ; 5E 00 D4 | Logical shift right (absolute,X)
	BNE $BA			  ; D0 BA | Branch if not equal
	SBC ($0C),Y		  ; F1 0C | Subtract with carry ((zero page),Y)
	AND $00F8			; 2D F8 00 | Logical AND with accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	INC $2E00,X		  ; FE 00 2E | Increment (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	LDA ($3E,X)		  ; A1 3E | Load from (zero page,X) into accumulator
	EOR ($93,X)		  ; 41 93 | Exclusive OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0E3
; Address: $EC9E8A
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0E3:
	EOR $6F90			; 4D 90 6F | Exclusive OR with accumulator (absolute)
	BCC $26			  ; 90 26 | Branch if carry clear
	CMP $00DF,Y		  ; D9 DF 00 | Compare accumulator (absolute,Y)
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	SEC				  ; 38 | Set carry flag
	PHB				  ; 8B | Push data bank register to stack
	BCC $6F			  ; 90 6F | Branch if carry clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	DEC $D620,X		  ; DE 20 D6 | Decrement (absolute,X)
	ROL $3CC1			; 2E C1 3C | Rotate left (absolute)
	DEX				  ; CA | Decrement X register
	INC $D600,X		  ; FE 00 D6 | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF C0 57 17 | Load from absolute long,X into accumulator
	STY $7B			  ; 84 7B | Store Y register to zero page
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	BRA $60			  ; 80 60 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	BRA $94			  ; 80 94 | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0E4
; Address: $EC9F0B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0E4:
	STZ $B044			; 9C 44 B0 | Store zero to absolute
	PHA				  ; 48 | Push accumulator to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	STY $BF			  ; 84 BF | Store Y register to zero page
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0E7
; Address: $EC9F5E
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0E7:
	JSR $4BFD			; 20 FD 4B | Jump to subroutine
	SBC $03FF,X		  ; FD FF 03 | Subtract with carry (absolute,X)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	AND $00FB,Y		  ; 39 FB 00 | Logical AND with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $01FF,Y		  ; F9 FF 01 | Subtract with carry (absolute,Y)
	LDA				  ; BF 42 5D 5F | Load from absolute long,X into accumulator
	LSR $4042,X		  ; 5E 42 40 | Logical shift right (absolute,X)
	JMP $40405C		  ; 5C 5C 40 40 | Jump to address long
	BPL $30			  ; 10 30 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0E9
; Address: $EC9F90
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0E9:
	LDX #$FC			 ; A2 FC | Load immediate value into X register
	LDA ($FE,X)		  ; A1 FE | Load from (zero page,X) into accumulator
	LDA				  ; BF FD A3 FE | Load from absolute long,X into accumulator
	LDA				  ; BF FF 80 FF | Load from absolute long,X into accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	WDM #$BA			 ; 42 BA | Reserved instruction
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	WDM #$02			 ; 42 02 | Reserved instruction
	BRA $00			  ; 80 00 | Branch always
	INC $08FE,X		  ; FE FE 08 | Increment (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	EOR $3F			  ; 45 3F | Exclusive OR with accumulator (zero page)
	STA $7F			  ; 85 7F | Store accumulator to zero page
	SBC $FFBF,X		  ; FD BF FF | Subtract with carry (absolute,X)
	SBC $01FF,X		  ; FD FF 01 | Subtract with carry (absolute,X)
	INC $1F19,X		  ; FE 19 1F | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CMP $AEBA,X		  ; DD BA AE | Compare accumulator (absolute,X)
	STY $40			  ; 84 40 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0EA
; Address: $EC9FCE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0EA:
	JSR $0060			; 20 60 00 | Jump to subroutine
	BRA $FF			  ; 80 FF | Branch always
	STA				  ; 9F FF 73 23 | Store accumulator to absolute long,X
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	BVC $78			  ; 50 78 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	BVC $10			  ; 50 10 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0EB
; Address: $EC9FEF
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0EB:
	BVS $8C			  ; 70 8C | Branch if overflow set
	STA $5119E7		  ; 8F E7 19 51 | Store accumulator to absolute long address
	BPL $48			  ; 10 48 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	BVC $70			  ; 50 70 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $58			  ; 50 58 | Branch if overflow clear
	BPL $58			  ; 10 58 | Branch if positive
	ROR $6F			  ; 66 6F | Rotate right (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	LDX $B7E7			; AE E7 B7 | Load from absolute address into X register
	STA $FF87F7		  ; 8F F7 87 FF | Store accumulator to absolute long address
	BCC $FF			  ; 90 FF | Branch if carry clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	BCS $00			  ; B0 00 | Branch if carry set
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00BF00		  ; AF 00 BF 00 | Load from absolute long address into accumulator
	LSR $4F5E			; 4E 5E 4F | Logical shift right (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BVC $57			  ; 50 57 | Branch if overflow clear
	BVC $50			  ; 50 50 | Branch if overflow clear
	BVC $40			  ; 50 40 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0EC
; Address: $ECA080
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0EC:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	BCS $00			  ; B0 00 | Branch if carry set
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	BRA $00			  ; 80 00 | Branch always
	LSR $4F5E			; 4E 5E 4F | Logical shift right (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0ED
; Address: $ECA0C0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0ED:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	BRA $7F			  ; 80 7F | Branch always
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0EF
; Address: $ECA0EF
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0EF:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	STA				  ; 9F 7F 20 C0 | Store accumulator to absolute long,X
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $50			  ; F0 50 | Branch if equal
	BEQ $50			  ; F0 50 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal
	BEQ $52			  ; F0 52 | Branch if equal
	STA				  ; 9F 7F 8F 6F | Store accumulator to absolute long,X
	STA $6F8F6F		  ; 8F 6F 8F 6F | Store accumulator to absolute long address
	STA $6F8F6F		  ; 8F 6F 8F 6F | Store accumulator to absolute long address
	STA $CC6F			; 8D 6F CC | Store accumulator to absolute address
	INC				  ; 1A | Increment accumulator
	LDA $830A,X		  ; BD 0A 83 | Load from absolute,X into accumulator
	EOR #$B6			 ; 49 B6 | Exclusive OR with accumulator (immediate)
	ROL $3BFF			; 2E FF 3B | Rotate left (absolute)
	CPX #$4F			 ; E0 4F | Compare X register (immediate)
	STZ $FF73			; 9C 73 FF | Store zero to absolute
	BRA $7F			  ; 80 7F | Branch always
	STY $8C73			; 8C 73 8C | Store Y register to absolute address
	INC $FDFE,X		  ; FE FE FD | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	SBC $F700,X		  ; FD 00 F7 | Subtract with carry (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CPY $18			  ; C4 18 | Compare Y register (zero page)
	AND $0F01,X		  ; 3D 01 0F | Logical AND with accumulator (absolute,X)
	ORA ($F6,X)		  ; 01 F6 | Logical OR with accumulator ((zero page,X))
	BEQ $F3			  ; F0 F3 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC $FC00,Y		  ; F9 00 FC | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0F0
; Address: $ECA1A8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0F0:
	STA				  ; 9F 83 0B 00 | Store accumulator to absolute long,X
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	SBC ($02,X)		  ; E1 02 | Subtract with carry ((zero page,X))
	PEA #$3F00		   ; F4 00 3F | Push effective address to stack
	CPY #$9F			 ; C0 9F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0F1
; Address: $ECA1C9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0F1:
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	ROL $3C7F,X		  ; 3E 7F 3C | Rotate left (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	INC $EF01,X		  ; FE 01 EF | Increment (absolute,X)
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0F2
; Address: $ECA1F7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0F2:
	JSR $017E			; 20 7E 01 | Jump to subroutine
	ROL $BC00,X		  ; 3E 00 BC | Rotate left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BRA $1F			  ; 80 1F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0F3
; Address: $ECA21D
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0F3:
	BPL $03			  ; 10 03 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	INC $63FF,X		  ; FE FF 63 | Increment (absolute,X)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	BRA $1F			  ; 80 1F | Branch always
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	STA				  ; 9F FF 9F FF | Store accumulator to absolute long,X
	STA				  ; 9F 9F EF 8F | Store accumulator to absolute long,X
	STA				  ; 9F 00 9F 00 | Store accumulator to absolute long,X
	STA				  ; 9F 00 EF 60 | Store accumulator to absolute long,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0F4
; Address: $ECA2C8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0F4:
	CPY $E0CC			; CC CC E0 | Game work RAM access
	CPX #$F1			 ; E0 F1 | Compare X register (immediate)
	BEQ $F9			  ; F0 F9 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	BVS $09			  ; 70 09 | Branch if overflow set
	CPY #$01			 ; C0 01 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0F5
; Address: $ECA2EC
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0F5:
	LDY #$22			 ; A0 22 | Load immediate value into Y register
	BCS $32			  ; B0 32 | Branch if carry set
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F 60 89 06 | Store accumulator to absolute long,X
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ORA $0D72,X		  ; 1D 72 0D | Logical OR with accumulator (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $CF			  ; F0 CF | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $0E			  ; 80 0E | Branch always
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BVS $70			  ; 70 70 | Branch if overflow set
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BPL $33			  ; 10 33 | Branch if positive
	BMI $E3			  ; 30 E3 | Branch if negative
	CPX #$84			 ; E0 84 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $C100,X		  ; 1E 00 C1 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ROL $7788,X		  ; 3E 88 77 | Rotate left (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	SBC $F800,Y		  ; F9 00 F8 | Subtract with carry (absolute,Y)
	ORA ($F9,X)		  ; 01 F9 | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BMI $FF			  ; 30 FF | Branch if negative
	INC $00DF,X		  ; FE DF 00 | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROR $00FF,X		  ; 7E FF 00 | Rotate right (absolute,X)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0F6
; Address: $ECA40F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0F6:
	SED				  ; F8 | Set decimal mode flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC $C700,X		  ; FD 00 C7 | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0F7
; Address: $ECA440
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0F7:
	JSR $2026			; 20 26 20 | Jump to subroutine
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	BRA $07			  ; 80 07 | Branch always
	BRA $07			  ; 80 07 | Branch always
	BPL $0F			  ; 10 0F | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0F8
; Address: $ECA44E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0F8:
	BVS $0F			  ; 70 0F | Branch if overflow set
	INC $19			  ; E6 19 | Increment (zero page)
	CLC				  ; 18 | Clear carry flag
	BMI $1F			  ; 30 1F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0F9
; Address: $ECA459
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0F9:
	BVS $0F			  ; 70 0F | Branch if overflow set
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $0F			  ; 80 0F | Branch always
	BRA $30			  ; 80 30 | Branch always
	BMI $2E			  ; 30 2E | Branch if negative

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0FA
; Address: $ECA463
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0FA:
	JSR $3037			; 20 37 30 | Jump to subroutine
	BMI $17			  ; 30 17 | Branch if negative
	BPL $19			  ; 10 19 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA $0C0C			; 0D 0C 0C | Logical OR with accumulator (absolute)
	BRA $71			  ; 80 71 | Branch always
	BRA $78			  ; 80 78 | Branch always
	BRA $78			  ; 80 78 | Branch always
	BRA $38			  ; 80 38 | Branch always
	CPY #$BE			 ; C0 BE | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ROR $7F80,X		  ; 7E 80 7F | Rotate right (absolute,X)
	BRA $10			  ; 80 10 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BVS $80			  ; 70 80 | Branch if overflow set
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	ASL $3C00,X		  ; 1E 00 3C | Arithmetic shift left (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	STZ $BE6D,X		  ; 9E 6D BE | Store zero to absolute,X
	EOR $619E			; 4D 9E 61 | Exclusive OR with accumulator (absolute)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0FB
; Address: $ECA4C4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0FB:
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0FD
; Address: $ECA4CA
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0FD:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	SBC $7E06,Y		  ; F9 06 7E | Subtract with carry (absolute,Y)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	BRA $CF			  ; 80 CF | Branch always
	BMI $EF			  ; 30 EF | Branch if negative
	BPL $F7			  ; 10 F7 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	LDA				  ; BF 40 FF 00 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $0F1E,X		  ; 1E 1E 0F | Arithmetic shift left (absolute,X)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	STA $FF00,Y		  ; 99 00 FF | Store accumulator to absolute,Y
	CPX $FB			  ; E4 FB | Compare X register (zero page)
	CPY #$F1			 ; C0 F1 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $78			  ; F0 78 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	INC $FF00			; EE 00 FF | Increment (absolute)
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BRA $0F			  ; 80 0F | Branch always
	BEQ $C7			  ; F0 C7 | Branch if equal
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	INC $FCF0,X		  ; FE F0 FC | Increment (absolute,X)
	BEQ $FC			  ; F0 FC | Branch if equal
	SBC $F8FF,Y		  ; F9 FF F8 | Subtract with carry (absolute,Y)
	INC $FCF6,X		  ; FE F6 FC | Increment (absolute,X)
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $03			  ; 30 03 | Branch if negative
	CPX #$27			 ; E0 27 | Compare X register (immediate)
	CPX #$F6			 ; E0 F6 | Compare X register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	BVC $63			  ; 50 63 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank58_DmaFunction_0FF
; Address: $ECA5D0
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_0FF:
	SED				  ; F8 | Set decimal mode flag
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SBC ($08),Y		  ; F1 08 | Subtract with carry ((zero page),Y)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	SBC ($18,X)		  ; E1 18 | Subtract with carry ((zero page,X))
	CMP ($38,X)		  ; C1 38 | Compare accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	ASL $38			  ; 06 38 | Arithmetic shift left (zero page)
	ASL $78			  ; 06 78 | Arithmetic shift left (zero page)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ASL $3F1E,X		  ; 1E 1E 3F | Arithmetic shift left (absolute,X)
	INC $FE7E,X		  ; FE 7E FE | Increment (absolute,X)
	ROR $3FFF,X		  ; 7E FF 3F | Rotate right (absolute,X)
	ORA $00FF,Y		  ; 19 FF 00 | Logical OR with accumulator (absolute,Y)
	STA				  ; 9F 00 99 00 | Store accumulator to absolute long,X
	SBC $FFE1,Y		  ; F9 E1 FF | Subtract with carry (absolute,Y)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SBC ($F0),Y		  ; F1 F0 | Subtract with carry ((zero page),Y)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_100
; Address: $ECA6C7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_100:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $0007,X		  ; 1E 07 00 | Arithmetic shift left (absolute,X)
	ASL $3901,X		  ; 1E 01 39 | Arithmetic shift left (absolute,X)
	ASL $F1			  ; 06 F1 | Arithmetic shift left (zero page)
	ASL $0CF3			; 0E F3 0C | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	BMI $DF			  ; 30 DF | Branch if negative

;------------------------------------------------------------------------------
; Bank58_DmaFunction_101
; Address: $ECA6DF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_101:
	JSR $0200			; 20 00 02 | Jump to subroutine
	BRA $0C			  ; 80 0C | Branch always
	ASL $8F02,X		  ; 1E 02 8F | Arithmetic shift left (absolute,X)
	LDA				  ; BF C5 F5 3F | Load from absolute long,X into accumulator
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_102
; Address: $ECA6FB
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_102:
	JSR $70BF			; 20 BF 70 | Jump to subroutine
	SBC $0332,X		  ; FD 32 03 | Subtract with carry (absolute,X)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	STA ($81),Y		  ; 91 81 | Store accumulator to (zero page),Y
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	BRA $F3			  ; 80 F3 | Branch always
	LDA ($5E,X)		  ; A1 5E | Load from (zero page,X) into accumulator
	SBC $FF06,Y		  ; F9 06 FF | Subtract with carry (absolute,Y)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	SBC $C3F8,Y		  ; F9 F8 C3 | Subtract with carry (absolute,Y)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	STZ $01			  ; 64 01 | Store zero to zero page
	LSR $01			  ; 46 01 | Logical shift right (zero page)
	DEC $03			  ; C6 03 | Decrement (zero page)
	ADC $00FE,X		  ; 7D FE 00 | Add with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX $18			  ; E4 18 | Compare X register (zero page)
	DEC $38			  ; C6 38 | Decrement (zero page)
	DEC $38			  ; C6 38 | Decrement (zero page)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	INC $FF9E,X		  ; FE 9E FF | Increment (absolute,X)
	STA $CFFFCF		  ; 8F CF FF CF | Store accumulator to absolute long address
	LDA				  ; BF FF 8F FB | Load from absolute long,X into accumulator
	STA				  ; 9F 00 8F 00 | Store accumulator to absolute long,X
	BMI $BF			  ; 30 BF | Branch if negative
	BMI $8F			  ; 30 8F | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank58_DmaFunction_103
; Address: $ECA7C3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_103:
	JSR $607F			; 20 7F 60 | Jump to subroutine
	CPY #$8C			 ; C0 8C | Compare Y register (immediate)
	STY $C683			; 8C 83 C6 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank58_DmaFunction_105
; Address: $ECA7D2
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_105:
	JSR $E000			; 20 00 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC $FD00,Y		  ; F9 00 FD | Subtract with carry (absolute,Y)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$21			 ; C0 21 | PPU graphics register access
	INC $C600,X		  ; FE 00 C6 | Increment (absolute,X)
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $C700,X		  ; FE 00 C7 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	SBC $F806,Y		  ; F9 06 F8 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	STA				  ; 9F 9F 33 33 | Store accumulator to absolute long,X
	SBC $FC02,X		  ; FD 02 FC | Subtract with carry (absolute,X)
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	CPY #$E3			 ; C0 E3 | Compare Y register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	STA $FFFFFF		  ; 8F FF FF FF | Store accumulator to absolute long address
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $70			  ; 80 70 | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_106
; Address: $ECA8B9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_106:
	STA $0FF30C		  ; 8F 0C F3 0F | Store accumulator to absolute long address
	BEQ $FF			  ; F0 FF | Branch if equal
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BRA $98			  ; 80 98 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_107
; Address: $ECA8D1
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_107:
	JSR $F00F			; 20 0F F0 | Jump to subroutine
	BMI $E7			  ; 30 E7 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BMI $CF			  ; 30 CF | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	INC $4001,X		  ; FE 01 40 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDX $82BE,Y		  ; BE BE 82 | Load from absolute,Y into X register
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	ORA $021D,X		  ; 1D 1D 02 | Logical OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	BCC $91			  ; 90 91 | Branch if carry clear
	BCC $91			  ; 90 91 | Branch if carry clear
	BPL $50			  ; 10 50 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	LDY $CE43,X		  ; BC 43 CE | Load from absolute,X into Y register
	AND ($FE),Y		  ; 31 FE | Logical AND with accumulator ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	BRA $3F			  ; 80 3F | Branch always
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	ORA $0D01			; 0D 01 0D | Logical OR with accumulator (absolute)
	SBC $F8FF,Y		  ; F9 FF F8 | Subtract with carry (absolute,Y)
	INC $F8F8,X		  ; FE F8 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $F800,Y		  ; F9 00 F8 | Subtract with carry (absolute,Y)
	SBC $FE00,Y		  ; F9 00 FE | Subtract with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BMI $01			  ; 30 01 | Branch if negative
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $F5F9,Y		  ; F9 F9 F5 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_108
; Address: $ECA999
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_108:
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	BMI $C8			  ; 30 C8 | Branch if negative
	BMI $F8			  ; 30 F8 | Branch if negative
	INC $7E01,X		  ; FE 01 7E | Increment (absolute,X)
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ORA ($34,X)		  ; 01 34 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA $1800,Y		  ; 19 00 18 | Logical OR with accumulator (absolute,Y)
	ASL $0CE1,X		  ; 1E E1 0C | Arithmetic shift left (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	DEC $7F			  ; C6 7F | Decrement (zero page)
	BRA $3F			  ; 80 3F | Branch always
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SEC				  ; 38 | Set carry flag
	DEC $38			  ; C6 38 | Decrement (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	INC $FF3E,X		  ; FE 3E FF | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	AND ($64),Y		  ; 31 64 | Logical AND with accumulator ((zero page),Y)
	CPY $C3			  ; C4 C3 | Compare Y register (zero page)
	CPY #$9F			 ; C0 9F | Compare Y register (immediate)
	STA ($1F,X)		  ; 81 1F | Store accumulator to (zero page,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_109
; Address: $ECAA51
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_109:
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDA				  ; BF FF DF FF | Load from absolute long,X into accumulator
	BRA $7F			  ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_10A
; Address: $ECAA76
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_10A:
	LDA				  ; BF 00 DF 00 | Load from absolute long,X into accumulator
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SBC $FCFD,X		  ; FD FD FC | Subtract with carry (absolute,X)
	INC $FE06,X		  ; FE 06 FE | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$86			 ; A0 86 | Load immediate value into Y register
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	BVC $47			  ; 50 47 | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	STA $3CC370		  ; 8F 70 C3 3C | Store accumulator to absolute long address
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	STZ $64			  ; 64 64 | Store zero to zero page
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $078E			; 0E 8E 07 | Arithmetic shift left (absolute)
	SBC $FC02,X		  ; FD 02 FC | Subtract with carry (absolute,X)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $3F			  ; 80 3F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $0C			  ; F0 0C | Branch if equal
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STA $E3E38F		  ; 8F 8F E3 E3 | Store accumulator to absolute long address
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$38			 ; E0 38 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_10B
; Address: $ECAB87
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_10B:
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	ORA $1370,Y		  ; 19 70 13 | Logical OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $3E70,X		  ; 1E 70 3E | Arithmetic shift left (absolute,X)
	ASL $3C01,X		  ; 1E 01 3C | Arithmetic shift left (absolute,X)
	ORA $9306,Y		  ; 19 06 93 | Logical OR with accumulator (absolute,Y)
	STA				  ; 9F 00 9F 00 | Store accumulator to absolute long,X
	LDA				  ; BF 00 00 39 | Load from absolute long,X into accumulator
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CMP ($0C,X)		  ; C1 0C | Compare accumulator ((zero page,X))
	STA $8908			; 8D 08 89 | Store accumulator to absolute address
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($C6,X)		  ; 01 C6 | Logical OR with accumulator ((zero page,X))
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	DEC $38			  ; C6 38 | Decrement (zero page)
	STX $79			  ; 86 79 | Store X register to zero page
	STX $79			  ; 86 79 | Store X register to zero page
	STX $79			  ; 86 79 | Store X register to zero page
	ASL $0EF1			; 0E F1 0E | Arithmetic shift left (absolute)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SBC ($1F),Y		  ; F1 1F | Subtract with carry ((zero page),Y)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$E3			 ; E0 E3 | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $39			  ; 80 39 | Branch always
	DEC $01			  ; C6 01 | Decrement (zero page)
	INC $E01F,X		  ; FE 1F E0 | Game work RAM access
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX $0F			  ; E4 0F | Compare X register (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_10C
; Address: $ECAC32
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_10C:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag
	SBC $F9F6,Y		  ; F9 F6 F9 | Subtract with carry (absolute,Y)
	INC $FEFD,X		  ; FE FD FE | Increment (absolute,X)
	SBC $F3FE,Y		  ; F9 FE F3 | Subtract with carry (absolute,Y)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	ADC $7D41,Y		  ; 79 41 7D | Add with carry (absolute,Y)
	EOR ($3D,X)		  ; 41 3D | Exclusive OR with accumulator ((zero page,X))
	AND ($1C),Y		  ; 31 1C | Logical AND with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	BEQ $0C			  ; F0 0C | Branch if equal
	BEQ $0C			  ; F0 0C | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STA $FF9FEF		  ; 8F EF 9F FF | Store accumulator to absolute long address
	BMI $00			  ; 30 00 | Branch if negative
	BVS $60			  ; 70 60 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_10E
; Address: $ECACFF
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_10E:
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STX $8FCE			; 8E CE 8F | Store X register to absolute address
	DEC $CB0B			; CE 0B CB | Decrement (absolute)
	ORA #$C9			 ; 09 C9 | Logical OR with accumulator (immediate)
	ORA $1099,Y		  ; 19 99 10 | Logical OR with accumulator (absolute,Y)
	BPL $7F			  ; 10 7F | Branch if positive
	ROR $CB00,X		  ; 7E 00 CB | Rotate right (absolute,X)
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	STA $1C66,Y		  ; 99 66 1C | Store accumulator to absolute,Y
	BVS $3F			  ; 70 3F | Branch if overflow set
	BEQ $3E			  ; F0 3E | Branch if equal
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	BIT #$F9			 ; 89 F9 | Test bits in accumulator (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank58_DmaFunction_10F
; Address: $ECAD50
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_10F:
	LDA				  ; BF 00 3F 00 | Load from absolute long,X into accumulator
	STA $7E0000		  ; 8F 00 00 7E | Store accumulator to absolute long address
	ROR $7F00,X		  ; 7E 00 7F | Rotate right (absolute,X)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	STA $1FE61F		  ; 8F 1F E6 1F | Store accumulator to absolute long address
	INC $0F			  ; E6 0F | Increment (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_110
; Address: $ECADA4
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_110:
	STA ($F1,X)		  ; 81 F1 | Store accumulator to (zero page,X)
	CMP ($F1,X)		  ; C1 F1 | Compare accumulator ((zero page,X))
	ADC ($F9),Y		  ; 71 F9 | Add with carry ((zero page),Y)
	BVS $9C			  ; 70 9C | Branch if overflow set
	BCC $9F			  ; 90 9F | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SBC $7006,Y		  ; F9 06 70 | Subtract with carry (absolute,Y)
	BEQ $03			  ; F0 03 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL $0A02			; 0E 02 0A | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	LDA ($81),Y		  ; B1 81 | Load from (zero page),Y into accumulator
	LSR $F70F			; 4E 0F F7 | Logical shift right (absolute)
	BRA $77			  ; 80 77 | Branch always
	BRA $2F			  ; 80 2F | Branch always
	CPY #$6F			 ; C0 6F | Compare Y register (immediate)
	BRA $CF			  ; 80 CF | Branch always
	STA				  ; 9F 00 3F 80 | Store accumulator to absolute long,X
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SEP #$FE			 ; E2 FE | Set processor status bits
	STA ($F0,X)		  ; 81 F0 | Store accumulator to (zero page,X)
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $F801,X		  ; FE 01 F8 | Increment (absolute,X)
	PEA #$F608		   ; F4 08 F6 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	CPX $ED10			; EC 10 ED | Compare X register (absolute)
	BPL $DD			  ; 10 DD | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_112
; Address: $ECAE4A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_112:
	STA				  ; 9F 60 0F 61 | Store accumulator to absolute long,X
	BEQ $07			  ; F0 07 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_113
; Address: $ECAE5C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_113:
	SBC ($10,X)		  ; E1 10 | Subtract with carry ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	STA				  ; 9F 9F 87 87 | Store accumulator to absolute long,X
	STA				  ; 9F 60 C7 38 | Store accumulator to absolute long,X
	STX $C7			  ; 86 C7 | Store X register to zero page
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $60			  ; 80 60 | Branch always
	BRA $70			  ; 80 70 | Branch always
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $FE			  ; F0 FE | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_115
; Address: $ECAEB2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_115:
	BVS $0F			  ; 70 0F | Branch if overflow set
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_116
; Address: $ECAEBD
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_116:
	ORA ($3B,X)		  ; 01 3B | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_117
; Address: $ECAEDD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_117:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STY $D088			; 8C 88 D0 | Store Y register to absolute address
	BNE $F0			  ; D0 F0 | Branch if not equal
	BEQ $86			  ; F0 86 | Branch if equal
	BRA $8E			  ; 80 8E | Branch always
	BRA $06			  ; 80 06 | Branch always
	CLC				  ; 18 | Clear carry flag
	BMI $CB			  ; 30 CB | Branch if negative
	BCC $63			  ; 90 63 | Branch if carry clear
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_118
; Address: $ECAEF6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_118:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVS $FC			  ; 70 FC | Branch if overflow set
	BEQ $FC			  ; F0 FC | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_119
; Address: $ECAF17
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_119:
	BRA $C3			  ; 80 C3 | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PEA #$C0C3		   ; F4 C3 C0 | Push effective address to stack
	BRA $00			  ; 80 00 | Branch always
	STA $D999,Y		  ; 99 99 D9 | Store accumulator to absolute,Y
	ORA $02C2,Y		  ; 19 C2 02 | Logical OR with accumulator (absolute,Y)
	ROL $3CC6,X		  ; 3E C6 3C | Rotate left (absolute,X)
	CPY $187C			; CC 7C 18 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	SEC				  ; 38 | Set carry flag
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	CPY #$9B			 ; C0 9B | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	INC $F467,X		  ; FE 67 F4 | Increment (absolute,X)
	PEA #$FFFF		   ; F4 FF FF | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $FE			  ; F0 FE | Branch if equal
	BEQ $FE			  ; F0 FE | Branch if equal
	BEQ $FE			  ; F0 FE | Branch if equal
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BEQ $FC			  ; F0 FC | Branch if equal
	BEQ $FC			  ; F0 FC | Branch if equal
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank58_DmaFunction_11A
; Address: $ECAFC1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_11A:
	BRA $02			  ; 80 02 | Branch always
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP $DB00,Y		  ; D9 00 DB | Compare accumulator (absolute,Y)
	LDA $7D40,X		  ; BD 40 7D | Load from absolute,X into accumulator
	BRA $7B			  ; 80 7B | Branch always
	BRA $F7			  ; 80 F7 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $39			  ; 80 39 | Branch always
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_11B
; Address: $ECAFE2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_11B:
	JSR $0020			; 20 20 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $70			  ; F0 70 | Branch if equal
	BRA $F8			  ; 80 F8 | Branch always
	LDX $A740,Y		  ; BE 40 A7 | Load from absolute,Y into X register
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_11C
; Address: $ECAFF5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_11C:
	JSR $30CF			; 20 CF 30 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STA $308F10		  ; 8F 10 8F 30 | Store accumulator to absolute long address
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_11D
; Address: $ECB01D
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_11D:
	JSR $E01F			; 20 1F E0 | Game work RAM access
	SBC $FFFD,X		  ; FD FD FF | Subtract with carry (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SBC $F80D,Y		  ; F9 0D F8 | Subtract with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $40			  ; 80 40 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CMP ($C3,X)		  ; C1 C3 | Compare accumulator ((zero page,X))
	BVS $F1			  ; 70 F1 | Branch if overflow set
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	BEQ $0F			  ; F0 0F | Branch if equal
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	DEC $0ECE			; CE CE 0E | Decrement (absolute)
	ASL $1818			; 0E 18 18 | Arithmetic shift left (absolute)
	ROR $FFFB			; 6E FB FF | Rotate right (absolute)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BMI $0F			  ; 30 0F | Branch if negative
	BEQ $18			  ; F0 18 | Branch if equal
	STZ $6897			; 9C 97 68 | Store zero to absolute
	BEQ $FB			  ; F0 FB | Branch if equal

;------------------------------------------------------------------------------
; Bank58_DmaFunction_11E
; Address: $ECB07D
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_11E:
	STZ $F8			  ; 64 F8 | Store zero to zero page
	ASL $38			  ; 06 38 | Arithmetic shift left (zero page)
	STA $81			  ; 85 81 | Store accumulator to zero page
	CMP $C1			  ; C5 C1 | Compare accumulator (zero page)
	CMP $C1			  ; C5 C1 | Compare accumulator (zero page)
	STA $1981			; 8D 81 19 | Store accumulator to absolute address
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	CMP ($3A,X)		  ; C1 3A | Compare accumulator ((zero page,X))
	CMP ($3A,X)		  ; C1 3A | Compare accumulator ((zero page,X))
	STA ($72,X)		  ; 81 72 | Store accumulator to (zero page,X)
	ORA ($E6,X)		  ; 01 E6 | Logical OR with accumulator ((zero page,X))
	BEQ $F3			  ; F0 F3 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FCFC,Y		  ; F9 FC FC | Subtract with carry (absolute,Y)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $DF1F			; EE 1F DF | Increment (absolute)
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	LDA				  ; BF FF DF FF | Load from absolute long,X into accumulator
	LDA				  ; BF 00 DF 00 | Load from absolute long,X into accumulator
	BEQ $FC			  ; F0 FC | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FFF8,X		  ; FE F8 FF | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	STY $CE01			; 8C 01 CE | Store Y register to absolute address
	DEC $E480			; CE 80 E4 | Decrement (absolute)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $3F			  ; 80 3F | Branch always
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	CPX #$8C			 ; E0 8C | Compare X register (immediate)
	BVS $CE			  ; 70 CE | Branch if overflow set
	BMI $CE			  ; 30 CE | Branch if negative
	AND ($E4),Y		  ; 31 E4 | Logical AND with accumulator ((zero page),Y)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $78			  ; 80 78 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	BEQ $70			  ; F0 70 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVS $70			  ; 70 70 | Branch if overflow set
	STY $03			  ; 84 03 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank58_DmaFunction_11F
; Address: $ECB172
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_11F:
	BRA $07			  ; 80 07 | Branch always
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_121
; Address: $ECB191
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_121:
	BRA $FF			  ; 80 FF | Branch always
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	INC $FEFD,X		  ; FE FD FE | Increment (absolute,X)
	SBC $FBFC,X		  ; FD FC FB | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	STZ $8C7C			; 9C 7C 8C | Store zero to absolute
	PEA #$F404		   ; F4 04 F4 | Push effective address to stack
	CPY $0E			  ; C4 0E | Compare Y register (zero page)
	STX $9E12			; 8E 12 9E | Store X register to absolute address
	ASL $037C,X		  ; 1E 7C 03 | Arithmetic shift left (absolute,X)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA $0DFE			; 0D FE 0D | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_125
; Address: $ECB1E9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_125:
	JSR $2023			; 20 23 20 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_126
; Address: $ECB1F7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_126:
	CLD				  ; D8 | Clear decimal mode flag
	BNE $0F			  ; D0 0F | Branch if not equal
	BNE $1F			  ; D0 1F | Branch if not equal
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $3D			  ; F0 3D | Branch if equal
	ORA ($39,X)		  ; 01 39 | Logical OR with accumulator ((zero page,X))
	ORA ($33,X)		  ; 01 33 | Logical OR with accumulator ((zero page,X))
	EOR ($82,X)		  ; 41 82 | Exclusive OR with accumulator ((zero page,X))
	CMP ($06,X)		  ; C1 06 | Compare accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $DF			  ; 10 DF | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_127
; Address: $ECB21D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_127:
	JSR $609F			; 20 9F 60 | Jump to subroutine
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY $E0CC			; CC CC E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CPY #$F2			 ; C0 F2 | Compare Y register (immediate)
	CPY #$F6			 ; C0 F6 | Compare Y register (immediate)
	CPX #$F6			 ; E0 F6 | Compare X register (immediate)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_128
; Address: $ECB28A
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_128:
	SBC ($FC,X)		  ; E1 FC | Subtract with carry ((zero page,X))
	SBC ($FC),Y		  ; F1 FC | Subtract with carry ((zero page),Y)
	SBC ($F8),Y		  ; F1 F8 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA $3301,Y		  ; 19 01 33 | Logical OR with accumulator (absolute,Y)
	STA $1F1F0F		  ; 8F 0F 1F 1F | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	INC $FEF8,X		  ; FE F8 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ROL $FF00,X		  ; 3E 00 FF | Rotate left (absolute,X)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	BPL $FF			  ; 10 FF | Branch if positive
	BRA $FF			  ; 80 FF | Branch always
	CMP $00FF,X		  ; DD FF 00 | Compare accumulator (absolute,X)
	CMP $FF00,X		  ; DD 00 FF | Compare accumulator (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	CPX #$8C			 ; E0 8C | Compare X register (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	BEQ $0E			  ; F0 0E | Branch if equal
	BEQ $9C			  ; F0 9C | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$83			 ; C0 83 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_12A
; Address: $ECB38C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_12A:
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_12B
; Address: $ECB3A4
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_12B:
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	STA ($79,X)		  ; 81 79 | Store accumulator to (zero page,X)
	SEC				  ; 38 | Set carry flag
	BRA $90			  ; 80 90 | Branch always
	BMI $FF			  ; 30 FF | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	BCC $6F			  ; 90 6F | Branch if carry clear
	BVS $8F			  ; 70 8F | Branch if overflow set
	BRA $F0			  ; 80 F0 | Branch always
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F3			  ; F0 F3 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FFF8,X		  ; FE F8 FF | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BMI $30			  ; 30 30 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SBC $0001,Y		  ; F9 01 00 | Subtract with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	AND ($B2),Y		  ; 31 B2 | Logical AND with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F 7F 0F 7F | Store accumulator to absolute long,X
	STA $E09FF0		  ; 8F F0 9F E0 | Game work RAM access
	STA				  ; 9F 8C DF D8 | Store accumulator to absolute long,X
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CMP $05			  ; C5 05 | Compare accumulator (zero page)
	PEA #$FE08		   ; F4 08 FE | Push effective address to stack
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	ADC $FB00,Y		  ; 79 00 FB | Add with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	PHB				  ; 8B | Push data bank register to stack
	CMP ($DD,X)		  ; C1 DD | Compare accumulator ((zero page,X))
	AND $3F07,Y		  ; 39 07 3F | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_12C
; Address: $ECB4D7
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_12C:
	BRA $38			  ; 80 38 | Branch always
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	BVS $60			  ; 70 60 | Branch if overflow set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INC $FC01			; EE 01 FC | Increment (absolute)
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	STA				  ; 9F FF 9F FF | Store accumulator to absolute long,X
	ASL $18E1,X		  ; 1E E1 18 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_12E
; Address: $ECB63A
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_12E:
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BEQ $EE			  ; F0 EE | Branch if equal
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $F001			; EE 01 F0 | Increment (absolute)
	SBC ($F9),Y		  ; F1 F9 | Subtract with carry ((zero page),Y)
	SBC ($7F,X)		  ; E1 7F | Subtract with carry ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BRA $0F			  ; 80 0F | Branch always
	BEQ $E6			  ; F0 E6 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	INC $7CFE,X		  ; FE FE 7C | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_12F
; Address: $ECB6E8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_12F:
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ADC ($67,X)		  ; 61 67 | Add with carry ((zero page,X))
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	LDY $FFBF,X		  ; BC BF FF | Load from absolute,X into Y register
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $9F			  ; 30 9F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_130
; Address: $ECB749
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_130:
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STX $00			  ; 86 00 | Store X register to zero page
	STX $FF			  ; 86 FF | Store X register to zero page
	ASL $FFFF			; 0E FF FF | Arithmetic shift left (absolute)
	BRA $7F			  ; 80 7F | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$F3			 ; C0 F3 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $7C00,X		  ; FE 00 7C | Increment (absolute,X)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $8F			  ; 80 8F | Branch always
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ORA $0107			; 0D 07 01 | Logical OR with accumulator (absolute)
	SBC $F900,X		  ; FD 00 F9 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_131
; Address: $ECB7F6
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_131:
	BEQ $00			  ; F0 00 | Branch if equal
	CMP $8FD9,Y		  ; D9 D9 8F | Compare accumulator (absolute,Y)
	STA $FFFFFF		  ; 8F FF FF FF | Store accumulator to absolute long address
	SBC ($F9),Y		  ; F1 F9 | Subtract with carry ((zero page),Y)
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	CPY #$7E			 ; C0 7E | Compare Y register (immediate)
	BEQ $3C			  ; F0 3C | Branch if equal
	ASL $3F1F,X		  ; 1E 1F 3F | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $81			  ; F0 81 | Branch if equal
	BEQ $83			  ; F0 83 | Branch if equal
	BRA $0E			  ; 80 0E | Branch always
	BRA $0C			  ; 80 0C | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_132
; Address: $ECB877
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_132:
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	INC $FFE3,X		  ; FE E3 FF | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FE			  ; F0 FE | Branch if equal
	CPX #$C7			 ; E0 C7 | Compare X register (immediate)
	CPY #$C6			 ; C0 C6 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC $3E00,Y		  ; F9 00 3E | Subtract with carry (absolute,Y)
	ROL $7070,X		  ; 3E 70 70 | Rotate left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	STA $05			  ; 85 05 | Store accumulator to zero page
	INC $F001,X		  ; FE 01 F0 | Increment (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SBC ($80,X)		  ; E1 80 | Subtract with carry ((zero page,X))
	BRA $23			  ; 80 23 | Branch always
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STZ $8000,X		  ; 9E 00 80 | Store zero to absolute,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_133
; Address: $ECB8FF
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_133:
	CPY #$7E			 ; C0 7E | Compare Y register (immediate)
	STZ $0FCF,X		  ; 9E CF 0F | Store zero to absolute,X
	STA $000606		  ; 8F 06 06 00 | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	BRA $F0			  ; 80 F0 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPX #$F9			 ; E0 F9 | Compare X register (immediate)
	SBC $009F,Y		  ; F9 9F 00 | Subtract with carry (absolute,Y)
	BMI $8F			  ; 30 8F | Branch if negative
	BVS $E7			  ; 70 E7 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	STA $00FF00		  ; 8F 00 FF 00 | Store accumulator to absolute long address
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	INC $FFC1,X		  ; FE C1 FF | Increment (absolute,X)
	BRA $FE			  ; 80 FE | Branch always
	CMP ($FC,X)		  ; C1 FC | Compare accumulator ((zero page,X))
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $FB			  ; F0 FB | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SBC ($E0,X)		  ; E1 E0 | Game work RAM access
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $00FF00		  ; 8F 00 FF 00 | Store accumulator to absolute long address
	STA				  ; 9F 60 01 FE | Store accumulator to absolute long,X
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LDA ($B1),Y		  ; B1 B1 | Load from (zero page),Y into accumulator
	BMI $30			  ; 30 30 | Branch if negative
	ORA $B980,Y		  ; 19 80 B9 | Logical OR with accumulator (absolute,Y)
	BRA $BB			  ; 80 BB | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_134
; Address: $ECB9EE
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_134:
	CPY #$D7			 ; C0 D7 | Compare Y register (immediate)
	LDA ($7E),Y		  ; B1 7E | Load from (zero page),Y into accumulator
	BMI $FF			  ; 30 FF | Branch if negative
	INC $81			  ; E6 81 | Increment (zero page)
	LSR $83			  ; 46 83 | Logical shift right (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BMI $FF			  ; 30 FF | Branch if negative
	BVS $73			  ; 70 73 | Branch if overflow set
	ADC $7E7E,X		  ; 7D 7E 7E | Add with carry (absolute,X)
	ROR $FF7E,X		  ; 7E 7E FF | Rotate right (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	BVS $8C			  ; 70 8C | Branch if overflow set
	ROR $7E81,X		  ; 7E 81 7E | Rotate right (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	ASL $007E,X		  ; 1E 7E 00 | Arithmetic shift left (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	BRA $7F			  ; 80 7F | Branch always
	BRA $FE			  ; 80 FE | Branch always
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $FF07,X		  ; FE 07 FF | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BRA $3F			  ; 80 3F | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $FC			  ; F0 FC | Branch if equal
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 00 00 1F | Store accumulator to absolute long,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	STA				  ; 9F 3F 0F FF | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SBC ($31),Y		  ; F1 31 | Subtract with carry ((zero page),Y)
	LDX #$80			 ; A2 80 | Load immediate value into X register
	CPY #$EE			 ; C0 EE | Compare Y register (immediate)
	CPX #$F1			 ; E0 F1 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_135
; Address: $ECBAE7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_135:
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	LDY #$5D			 ; A0 5D | Load immediate value into Y register
	BNE $2D			  ; D0 2D | Branch if not equal
	CPX $F111			; EC 11 F1 | Compare X register (absolute)
	ASL $00FF			; 0E FF 00 | Arithmetic shift left (absolute)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $FE			  ; 80 FE | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_137
; Address: $ECBB24
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_137:
	BRA $B8			  ; 80 B8 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_138
; Address: $ECBB31
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_138:
	BRA $60			  ; 80 60 | Branch always
	BRA $BF			  ; 80 BF | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	SBC #$0F			 ; E9 0F | Subtract with carry (immediate)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ROL $6100,X		  ; 3E 00 61 | Rotate left (absolute,X)
	ASL $20C0,X		  ; 1E C0 20 | Arithmetic shift left (absolute,X)
	STZ $1F00,X		  ; 9E 00 1F | Store zero to absolute,X
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_13A
; Address: $ECBB7C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_13A:
	STA				  ; 9F 60 3F C0 | Store accumulator to absolute long,X
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC ($E0,X)		  ; E1 E0 | Game work RAM access
	CPY #$E7			 ; C0 E7 | Compare Y register (immediate)
	CPX #$C7			 ; E0 C7 | Compare X register (immediate)
	CPY #$F3			 ; C0 F3 | Compare Y register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_13B
; Address: $ECBBA6
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_13B:
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STZ $0600			; 9C 00 06 | Store zero to absolute
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	STX $06			  ; 86 06 | Store X register to zero page
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 38 F8 3F | Store accumulator to absolute long,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$601F		   ; F4 1F 60 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	INC $0700,X		  ; FE 00 07 | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	INC $F001,X		  ; FE 01 F0 | Increment (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	AND $4600,Y		  ; 39 00 46 | Logical AND with accumulator (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	ROR $F006,X		  ; 7E 06 F0 | Rotate right (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	DEC $00			  ; C6 00 | Decrement (zero page)
	LDA $3F00,Y		  ; B9 00 3F | Load from absolute,Y into accumulator
	ASL $81			  ; 06 81 | Arithmetic shift left (zero page)
	ROL $1FFE,X		  ; 3E FE 1F | Rotate left (absolute,X)
	STA $014707		  ; 8F 07 47 01 | Store accumulator to absolute long address
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BVS $07			  ; 70 07 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	ORA ($CE,X)		  ; 01 CE | Logical OR with accumulator ((zero page,X))
	CPX #$39			 ; E0 39 | Compare X register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F2			  ; F0 F2 | Branch if equal
	SEC				  ; 38 | Set carry flag
	AND $0100,Y		  ; 39 00 01 | Logical AND with accumulator (absolute,Y)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_13C
; Address: $ECBC75
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_13C:
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	SBC $0006,Y		  ; F9 06 00 | Subtract with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STZ $0E00			; 9C 00 0E | Store zero to absolute
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_13D
; Address: $ECBCBA
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_13D:
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	BEQ $C1			  ; F0 C1 | Branch if equal
	SEC				  ; 38 | Set carry flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	ROR $7F1E,X		  ; 7E 1E 7F | Rotate right (absolute,X)
	SBC $F706,Y		  ; F9 06 F7 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_13E
; Address: $ECBCF5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_13E:
	JSR $40BF			; 20 BF 40 | Jump to subroutine
	BRA $1F			  ; 80 1F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BEQ $83			  ; F0 83 | Branch if equal
	BRA $C0			  ; 80 C0 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_13F
; Address: $ECBD0C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_13F:
	BMI $37			  ; 30 37 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	DEC $00			  ; C6 00 | Decrement (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	DEC $00			  ; C6 00 | Decrement (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $81			  ; 80 81 | Branch always
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank58_DmaFunction_140
; Address: $ECBD2D
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_140:
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA #$30			 ; 09 30 | Logical OR with accumulator (immediate)
	BMI $03			  ; 30 03 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $0F			  ; F0 0F | Branch if equal
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SBC $FF06,Y		  ; F9 06 FF | Subtract with carry (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_141
; Address: $ECBDA4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_141:
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	BRA $9F			  ; 80 9F | Branch always
	ASL $FF01,X		  ; 1E 01 FF | Arithmetic shift left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	BEQ $9F			  ; F0 9F | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_142
; Address: $ECBDD7
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_142:
	BRA $FF			  ; 80 FF | Branch always
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F FF FF FF | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	CPY #$27			 ; C0 27 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $FB			  ; F0 FB | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FC02,Y		  ; F9 02 FC | Subtract with carry (absolute,Y)
	LDA				  ; BF 40 3F C0 | Load from absolute long,X into accumulator
	BRA $7F			  ; 80 7F | Branch always
	AND $7E3E,X		  ; 3D 3E 7E | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_143
; Address: $ECBE6E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_143:
	SBC $00F5,X		  ; FD F5 00 | Subtract with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ROL $FD3E,X		  ; 3E 3E FD | Rotate left (absolute,X)
	INX				  ; E8 | Increment X register
	PLX				  ; FA | Pull X register from stack
	LDY #$DC			 ; A0 DC | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ROL $FF3E,X		  ; 3E 3E FF | Rotate left (absolute,X)
	PEA #$FEFE		   ; F4 FE FE | Push effective address to stack
	INC $FCE8,X		  ; FE E8 FC | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $F8			  ; F0 F8 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_145
; Address: $ECBEAF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_145:
	JSR $0100			; 20 00 01 | Jump to subroutine
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank58_DmaFunction_146
; Address: $ECBEBC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_146:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SBC $EAAE,X		  ; FD AE EA | Subtract with carry (absolute,X)
	BEQ $7C			  ; F0 7C | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $F030,X		  ; FE 30 F0 | Increment (absolute,X)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BPL $F0			  ; 10 F0 | Branch if positive
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_147
; Address: $ECBF41
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_147:
	JSR $30FF			; 20 FF 30 | Jump to subroutine
	STY $8BFC			; 8C FC 8B | Store Y register to absolute address
	SBC $FF96,Y		  ; F9 96 FF | Subtract with carry (absolute,Y)
	STA ($DF),Y		  ; 91 DF | Store accumulator to (zero page),Y
	ORA ($72,X)		  ; 01 72 | Logical OR with accumulator ((zero page,X))
	ADC ($0F),Y		  ; 71 0F | Add with carry ((zero page),Y)
	SBC $1E			  ; E5 1E | Subtract with carry (zero page)
	ROR $1F			  ; 66 1F | Rotate right (zero page)
	SBC $DC66,Y		  ; F9 66 DC | Subtract with carry (absolute,Y)
	LDY $7843,X		  ; BC 43 78 | Load from absolute,X into Y register
	ADC ($8E),Y		  ; 71 8E | Add with carry ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	STA ($90,X)		  ; 81 90 | Store accumulator to (zero page,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank58_DmaFunction_149
; Address: $ECBF78
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_149:
	PHB				  ; 8B | Push data bank register to stack
	LSR $FFFF,X		  ; 5E FF FF | Logical shift right (absolute,X)
	LDA				  ; BF FF CF FF | Load from absolute long,X into accumulator
	SBC $7F1D,X		  ; FD 1D 7F | Subtract with carry (absolute,X)
	SBC $CF2D,X		  ; FD 2D CF | Subtract with carry (absolute,X)
	STA				  ; 9F 9F 79 7F | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	SEP #$80			 ; E2 80 | Set processor status bits

;------------------------------------------------------------------------------
; Bank58_DmaFunction_14A
; Address: $ECBFB2
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_14A:
	JSR $D0C0			; 20 C0 D0 | Jump to subroutine
	CPX #$12			 ; E0 12 | Compare X register (immediate)
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF04,X		  ; FE 04 FF | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	CMP ($AF),Y		  ; D1 AF | Compare accumulator ((zero page),Y)
	SBC $FF3F,Y		  ; F9 3F FF | Subtract with carry (absolute,Y)
	LDX #$48			 ; A2 48 | Load immediate value into X register
	BCC $C7			  ; 90 C7 | Branch if carry clear
	CMP $9300,X		  ; DD 00 93 | Compare accumulator (absolute,X)
	LDA				  ; BF 00 7F 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 40 FF 00 | Load from absolute long,X into accumulator
	BRA $EF			  ; 80 EF | Branch always
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_14B
; Address: $ECC00D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_14B:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_14C
; Address: $ECC025
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_14C:
	JSR $61FF			; 20 FF 61 | Jump to subroutine
	REP #$FF			 ; C2 FF | Reset processor status bits
	ORA ($EF,X)		  ; 01 EF | Logical OR with accumulator ((zero page,X))
	STZ $3D00,X		  ; 9E 00 3D | Store zero to absolute,X
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	DEC $7F35			; CE 35 7F | Decrement (absolute)
	STX $FF			  ; 86 FF | Store X register to zero page
	ASL $7FEE,X		  ; 1E EE 7F | Arithmetic shift left (absolute,X)
	SBC $C803,X		  ; FD 03 C8 | Subtract with carry (absolute,X)
	ADC $F007,Y		  ; 79 07 F0 | Add with carry (absolute,Y)
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	DEC $E131			; CE 31 E1 | Decrement (absolute)
	ASL $7887,X		  ; 1E 87 78 | Arithmetic shift left (absolute,X)
	STY $FE			  ; 84 FE | Store Y register to zero page
	ORA #$E8			 ; 09 E8 | Logical OR with accumulator (immediate)
	JMP $24DF			; 4C DF 24 | Jump to address
	DEC $E100			; CE 00 E1 | Decrement (absolute)
	BRA $7B			  ; 80 7B | Branch always
	CPX #$96			 ; E0 96 | Compare X register (immediate)
	BEQ $48			  ; F0 48 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY $CDED			; CC ED CD | Compare Y register (absolute)
	PEA #$F454		   ; F4 54 F4 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_14E
; Address: $ECC092
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_14E:
	JSR $A01F			; 20 1F A0 | Jump to subroutine
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	AND $3FD0,X		  ; 3D D0 3F | Logical AND with accumulator (absolute,X)
	BRA $3F			  ; 80 3F | Branch always
	BCC $3F			  ; 90 3F | Branch if carry clear
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	AND $FEFF,X		  ; 3D FF FE | Logical AND with accumulator (absolute,X)
	INC $F8FF,X		  ; FE FF F8 | Increment (absolute,X)
	SBC ($F7),Y		  ; F1 F7 | Subtract with carry ((zero page),Y)
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	DEC $B9			  ; C6 B9 | Decrement (zero page)
	CPX $DB			  ; E4 DB | Compare X register (zero page)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FF			  ; E6 FF | Increment (zero page)
	LDX $7EBF,Y		  ; BE BF 7E | Load from absolute,Y into X register
	LDA				  ; BF 5F FF FF | Load from absolute long,X into accumulator
	STA $738F77		  ; 8F 77 8F 73 | Store accumulator to absolute long address
	SBC $7D83,X		  ; FD 83 7D | Subtract with carry (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	AND $E5FD			; 2D FD E5 | Logical AND with accumulator (absolute)
	ROL $9722			; 2E 22 97 | Rotate left (absolute)
	CMP $A86D,Y		  ; D9 6D A8 | Compare accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	CMP $6C00,X		  ; DD 00 6C | Compare accumulator (absolute,X)
	ROL $C0			  ; 26 C0 | Rotate left (zero page)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	BMI $7C			  ; 30 7C | Branch if negative
	PHB				  ; 8B | Push data bank register to stack
	BMI $FE			  ; 30 FE | Branch if negative
	RTI				  ; 40 | Return from interrupt
	INC $B806,X		  ; FE 06 B8 | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_14F
; Address: $ECC212
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_14F:
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	LDA				  ; BF 00 F9 00 | Load from absolute long,X into accumulator
	SBC $F258,Y		  ; F9 58 F2 | Subtract with carry (absolute,Y)
	WDM #$82			 ; 42 82 | Reserved instruction
	BCC $30			  ; 90 30 | Branch if carry clear
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	LDA ($1F,X)		  ; A1 1F | Load from (zero page,X) into accumulator
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SBC $7EE4,X		  ; FD E4 7E | Subtract with carry (absolute,X)
	ASL $770E			; 0E 0E 77 | Arithmetic shift left (absolute)
	ASL $3481			; 0E 81 34 | Arithmetic shift left (absolute)
	BCC $FF			  ; 90 FF | Branch if carry clear
	ORA #$FE			 ; 09 FE | Logical OR with accumulator (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	INC $F400,X		  ; FE 00 F4 | Increment (absolute,X)
	LDX $A736,Y		  ; BE 36 A7 | Load from absolute,Y into X register
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	RTI				  ; 40 | Return from interrupt
	STZ $C6			  ; 64 C6 | Store zero to zero page
	DEY				  ; 88 | Decrement Y register
	STY $7F			  ; 84 7F | Store Y register to zero page
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $2F			  ; D0 2F | Branch if not equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BVS $0F			  ; 70 0F | Branch if overflow set
	TYA				  ; 98 | Transfer Y register to accumulator
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF E1 5E FF | Load from absolute long,X into accumulator
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CPX $EFF3			; EC F3 EF | Compare X register (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_150
; Address: $ECC2A7
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_150:
	INC $FE7F,X		  ; FE 7F FE | Increment (absolute,X)
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	ASL $80F1			; 0E F1 80 | Arithmetic shift left (absolute)
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	CMP $E3FF,X		  ; DD FF E3 | Compare accumulator (absolute,X)
	ROL $C738,X		  ; 3E 38 C7 | Rotate left (absolute,X)
	LDA				  ; BF 5F BF 7F | Load from absolute long,X into accumulator
	CMP ($AF),Y		  ; D1 AF | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_151
; Address: $ECC323
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_151:
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	STX $FFFF			; 8E FF FF | Store X register to absolute address
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	STX $FFFF			; 8E FF FF | Store X register to absolute address
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $FCFF,Y		  ; F9 FF FC | Subtract with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $FCFF,Y		  ; F9 FF FC | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	STA				  ; 9F 6F 9F F7 | Store accumulator to absolute long,X
	INC $FF2A			; EE 2A FF | Increment (absolute)
	CMP $6CFF,X		  ; DD FF 6C | Compare accumulator (absolute,X)
	BNE $FF			  ; D0 FF | Branch if not equal
	BMI $7F			  ; 30 7F | Branch if negative
	BRA $EC			  ; 80 EC | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_152
; Address: $ECC414
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_152:
	JSL $009300		  ; 22 00 93 00 | Jump to subroutine long
	BMI $FE			  ; 30 FE | Branch if negative
	CPY $F7			  ; C4 F7 | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	XBA				  ; EB | Exchange accumulator bytes
	STA $AD00,X		  ; 9D 00 AD | Store accumulator to absolute,X
	BRA $C3			  ; 80 C3 | Branch always
	CLV				  ; B8 | Clear overflow flag
	BPL $C7			  ; 10 C7 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BEQ $FF			  ; F0 FF | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $E7			  ; 10 E7 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	LDA				  ; BF 00 0F 00 | Load from absolute long,X into accumulator
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $FF0D,X		  ; FD 0D FF | Subtract with carry (absolute,X)
	SBC $FB00,Y		  ; F9 00 FB | Subtract with carry (absolute,Y)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	BCC $00			  ; 90 00 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	BVC $FF			  ; 50 FF | Branch if overflow clear
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_153
; Address: $ECC48B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_153:
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	EOR ($FB,X)		  ; 41 FB | Exclusive OR with accumulator ((zero page,X))
	LDA $001700		  ; AF 00 17 00 | Load from absolute long address into accumulator
	LDX $FF00,Y		  ; BE 00 FF | Load from absolute,Y into X register
	ORA $8DF2			; 0D F2 8D | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 3F DF FF | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	ORA $8DFF,Y		  ; 19 FF 8D | Logical OR with accumulator (absolute,Y)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	STZ $FF			  ; 64 FF | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_154
; Address: $ECC530
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_154:
	CMP $E600			; CD 00 E6 | Compare accumulator (absolute)
	STA				  ; 9F 00 FF 00 | Store accumulator to absolute long,X
	BRA $FF			  ; 80 FF | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	CPX $72FB			; EC FB 72 | Compare X register (absolute)
	STA $B000			; 8D 00 B0 | Store accumulator to absolute address
	CLV				  ; B8 | Clear overflow flag
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	BVS $FF			  ; 70 FF | Branch if overflow set
	AND $7CFF,Y		  ; 39 FF 7C | Logical AND with accumulator (absolute,Y)
	SBC $F919,Y		  ; F9 19 F9 | Subtract with carry (absolute,Y)
	ORA $0099,Y		  ; 19 99 00 | Logical OR with accumulator (absolute,Y)
	STA $00C600		  ; 8F 00 C6 00 | Store accumulator to absolute long address
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	CMP $E600			; CD 00 E6 | Compare accumulator (absolute)
	INC $00			  ; E6 00 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$FF			 ; 42 FF | Reserved instruction

;------------------------------------------------------------------------------
; Bank58_DmaFunction_155
; Address: $ECC58D
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_155:
	JSL $FF01FF		  ; 22 FF 01 FF | Jump to subroutine long
	LDA $DD00,X		  ; BD 00 DD | Load from absolute,X into accumulator
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	STA				  ; 9F FF FF FF | Store accumulator to absolute long,X
	BRA $BE			  ; 80 BE | Branch always
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	STA $BB4777		  ; 8F 77 47 BB | Store accumulator to absolute long address
	ORA #$9F			 ; 09 9F | Logical OR with accumulator (immediate)
	STZ $7D			  ; 64 7D | Store zero to zero page
	PHB				  ; 8B | Push data bank register to stack
	DEX				  ; CA | Decrement X register
	DEC				  ; 3A | Decrement accumulator
	BRA $1D			  ; 80 1D | Branch always
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	BEQ $0F			  ; F0 0F | Branch if equal
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_156
; Address: $ECC61A
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_156:
	INC $FB00,X		  ; FE 00 FB | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SBC $F700,X		  ; FD 00 F7 | Subtract with carry (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $7CFF,X		  ; 1E FF 7C | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPY $1717			; CC 17 17 | Compare Y register (absolute)
	INC				  ; 1A | Increment accumulator
	ROL $6936,X		  ; 3E 36 69 | Rotate left (absolute,X)
	INX				  ; E8 | Increment X register
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	STA				  ; 9F 90 1F 18 | Store accumulator to absolute long,X
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $E6FF,X		  ; FE FF E6 | Increment (absolute,X)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	LDA				  ; BF 5F FF 1F | Load from absolute long,X into accumulator
	ASL $EDFF,X		  ; 1E FF ED | Arithmetic shift left (absolute,X)
	SBC $F3EF,Y		  ; F9 EF F3 | Subtract with carry (absolute,Y)
	CMP $FFFF			; CD FF FF | Compare accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SBC ($8E),Y		  ; F1 8E | Subtract with carry ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	PLP				  ; 28 | Pull processor status from stack
	ROR $69FF,X		  ; 7E FF 69 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_157
; Address: $ECC75C
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_157:
	BRA $FF			  ; 80 FF | Branch always
	DEC $F9			  ; C6 F9 | Decrement (zero page)
	STA $3160,Y		  ; 99 60 31 | Store accumulator to absolute,Y
	CPY #$F2			 ; C0 F2 | Compare Y register (immediate)
	CPX $F900			; EC 00 F9 | Compare X register (absolute)
	BRA $EF			  ; 80 EF | Branch always
	STA				  ; 9F 00 3F 00 | Store accumulator to absolute long,X
	STA $001E00		  ; 8F 00 1E 00 | Store accumulator to absolute long address
	AND $3B80,X		  ; 3D 80 3B | Logical AND with accumulator (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $F716,Y		  ; F9 16 F7 | Subtract with carry (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	LDA #$AE			 ; A9 AE | Load immediate value into accumulator
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	INC $981F			; EE 1F 98 | Increment (absolute)
	LSR $3F			  ; 46 3F | Logical shift right (zero page)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	STA $FD0CFF		  ; 8F FF 0C FD | Store accumulator to absolute long address
	DEC $9800			; CE 00 98 | Decrement (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	BRA $0D			  ; 80 0D | Branch always
	INC $F8C0,X		  ; FE C0 F8 | Increment (absolute,X)
	BRA $F3			  ; 80 F3 | Branch always
	ORA $1BDF			; 0D DF 1B | Logical OR with accumulator (absolute)
	BVS $FE			  ; 70 FE | Branch if overflow set
	SBC #$FD			 ; E9 FD | Subtract with carry (immediate)
	PLY				  ; 7A | Pull Y register from stack
	SBC $F200,X		  ; FD 00 F2 | Subtract with carry (absolute,X)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	STA $801600		  ; 8F 00 16 80 | Store accumulator to absolute long address
	ORA $F0			  ; 05 F0 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_158
; Address: $ECC801
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_158:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	ASL $07FF			; 0E FF 07 | Arithmetic shift left (absolute)
	ORA ($DF,X)		  ; 01 DF | Logical OR with accumulator ((zero page,X))
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	INC $EF00,X		  ; FE 00 EF | Increment (absolute,X)
	JMP $ECFF			; 4C FF EC | Jump to address
	SED				  ; F8 | Set decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_159
; Address: $ECC83E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_159:
	LDA				  ; BF 00 7F 47 | Load from absolute long,X into accumulator
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	REP #$FF			 ; C2 FF | Reset processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_15B
; Address: $ECC84D
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_15B:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STY $B8			  ; 84 B8 | Store Y register to zero page
	ASL $3D00,X		  ; 1E 00 3D | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F 00 9F 00 | Store accumulator to absolute long,X
	BEQ $FF			  ; F0 FF | Branch if equal
	REP #$FF			 ; C2 FF | Reset processor status bits
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BMI $FF			  ; 30 FF | Branch if negative
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVC $FF			  ; 50 FF | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	AND $7F00,X		  ; 3D 00 7F | Logical AND with accumulator (absolute,X)
	STA $00AF00		  ; 8F 00 AF 00 | Store accumulator to absolute long address
	LDA				  ; BF 00 FE FD | Load from absolute long,X into accumulator
	BIT #$EF			 ; 89 EF | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_15C
; Address: $ECC8C9
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_15C:
	JSR $022D			; 20 2D 02 | Jump to subroutine
	LDA $4DCFD4		  ; AF D4 CF 4D | Load from absolute long address into accumulator
	STA $9FD7AB		  ; 8F AB D7 9F | Store accumulator to absolute long address
	PLY				  ; 7A | Pull Y register from stack
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	BMI $DF			  ; 30 DF | Branch if negative
	BRA $FE			  ; 80 FE | Branch always
	SBC ($FB,X)		  ; E1 FB | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $FFF9,X		  ; FE F9 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 7F 7F FF | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX $5F			  ; E4 5F | Compare X register (zero page)
	INC $DF3F			; EE 3F DF | Increment (absolute)
	STA				  ; 9F 7F 8F 7F | Store accumulator to absolute long,X
	STA $FFFF7F		  ; 8F 7F FF FF | Store accumulator to absolute long address
	CLC				  ; 18 | Clear carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	BIT $26			  ; 24 26 | Test bits in accumulator (zero page)
	ORA $0B1B			; 0D 1B 0B | Logical OR with accumulator (absolute)
	JMP $60E8E8		  ; 5C E8 E8 60 | Jump to address long
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_15D
; Address: $ECC973
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_15D:
	SBC $E730,X		  ; FD 30 E7 | Subtract with carry (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	LDA $FB22,Y		  ; B9 22 FB | Load from absolute,Y into accumulator
	TXS				  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank58_DmaFunction_15E
; Address: $ECC97F
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_15E:
	ADC $7F			  ; 65 7F | Add with carry (zero page)
	ROR $FC00,X		  ; 7E 00 FC | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $73			  ; 80 73 | Branch always
	BRA $E4			  ; 80 E4 | Branch always
	PLX				  ; FA | Pull X register from stack
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	BPL $03			  ; 10 03 | Branch if positive
	AND $3939,Y		  ; 39 39 39 | Logical AND with accumulator (absolute,Y)
	AND $E4FD,Y		  ; 39 FD E4 | Logical AND with accumulator (absolute,Y)
	ADC ($A0),Y		  ; 71 A0 | Add with carry ((zero page),Y)
	LDY #$CD			 ; A0 CD | Load immediate value into Y register
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	BRA $7F			  ; 80 7F | Branch always
	CLC				  ; 18 | Clear carry flag
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	INC $FF6D,X		  ; FE 6D FF | Increment (absolute,X)
	ROL $C1B1,X		  ; 3E B1 C1 | Rotate left (absolute,X)
	CMP $E7B5			; CD B5 E7 | Compare accumulator (absolute)
	STA $FE61,X		  ; 9D 61 FE | Store accumulator to absolute,X
	BRA $FE			  ; 80 FE | Branch always
	CPX $12			  ; E4 12 | Compare X register (zero page)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BVS $FF			  ; 70 FF | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	STZ $FF			  ; 64 FF | Store zero to zero page
	ASL $2FE9,X		  ; 1E E9 2F | Arithmetic shift left (absolute,X)
	WDM #$BF			 ; 42 BF | Reserved instruction
	DEC				  ; 3A | Decrement accumulator
	DEC $8D5A,X		  ; DE 5A 8D | Decrement (absolute,X)
	ORA $888B			; 0D 8B 88 | Logical OR with accumulator (absolute)
	AND #$28			 ; 29 28 | Logical AND with accumulator (immediate)
	INC $F8			  ; E6 F8 | Increment (zero page)
	AND $C5FE			; 2D FE C5 | Logical AND with accumulator (absolute)
	LDX $DEA5,Y		  ; BE A5 DE | Load from absolute,Y into X register
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	INC $FC0E,X		  ; FE 0E FC | Increment (absolute,X)
	PEA #$E814		   ; F4 14 E8 | Push effective address to stack
	PLP				  ; 28 | Pull processor status from stack
	SBC $FB79,Y		  ; F9 79 FB | Subtract with carry (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank58_DmaFunction_15F
; Address: $ECCA10
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_15F:
	LDY $F800,X		  ; BC 00 F8 | Load from absolute,X into Y register
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	STX $00			  ; 86 00 | Store X register to zero page
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_160
; Address: $ECCA28
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_160:
	INC $DEEE			; EE EE DE | Increment (absolute)
	DEC $DCDC,X		  ; DE DC DC | Decrement (absolute,X)
	INC $8000			; EE 00 80 | Increment (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	SBC $FA00,X		  ; FD 00 FA | Subtract with carry (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	WDM #$FF			 ; 42 FF | Reserved instruction
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $FF00,X		  ; BD 00 FF | Load from absolute,X into accumulator
	SBC $F71A,Y		  ; F9 1A F7 | Subtract with carry (absolute,Y)
	BIT $FB			  ; 24 FB | Test bits in accumulator (zero page)
	SBC ($16),Y		  ; F1 16 | Subtract with carry ((zero page),Y)
	SBC ($EF,X)		  ; E1 EF | Subtract with carry ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	EOR $3F5D,X		  ; 5D 5D 3F | Exclusive OR with accumulator (absolute,X)
	AND $BE2D,X		  ; 3D 2D BE | Logical AND with accumulator (absolute,X)
	STX $1232			; 8E 32 12 | Store X register to absolute address
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF 10 FF 30 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_161
; Address: $ECCAD6
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_161:
	JSR $60FF			; 20 FF 60 | Jump to subroutine
	CPY $CCFF			; CC FF CC | Compare Y register (absolute)
	SBC $EEFF,X		  ; FD FF EE | Subtract with carry (absolute,X)
	STA				  ; 9F FF FF FC | Store accumulator to absolute long,X
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	STA $FF4FF0		  ; 8F F0 4F FF | Store accumulator to absolute long address
	SEP #$FF			 ; E2 FF | Set processor status bits
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	STA $FFFF7F		  ; 8F 7F FF FF | Store accumulator to absolute long address
	LDX $7C00,Y		  ; BE 00 7C | Load from absolute,Y into X register
	PEA #$6004		   ; F4 04 60 | Push effective address to stack
	INX				  ; E8 | Increment X register
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_162
; Address: $ECCB79
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_162:
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	LDY $00			  ; A4 00 | Load from zero page into Y register
	ROR $00			  ; 66 00 | Rotate right (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_163
; Address: $ECCB8E
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_163:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $BF			  ; 70 BF | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	INC $BE00,X		  ; FE 00 BE | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	STA				  ; 9F 9A 0D 28 | Store accumulator to absolute long,X
	LSR $1C0F			; 4E 0F 1C | Logical shift right (absolute)
	ORA $A0			  ; 05 A0 | Logical OR with accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BPL $E6			  ; 10 E6 | Branch if positive
	BRA $01			  ; 80 01 | Branch always
	INC $FE05,X		  ; FE 05 FE | Increment (absolute,X)
	EOR ($BC,X)		  ; 41 BC | Exclusive OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $BB00			; 4C 00 BB | Jump to address
	WDM #$3F			 ; 42 3F | Reserved instruction
	BPL $3F			  ; 10 3F | Branch if positive
	BMI $3F			  ; 30 3F | Branch if negative

;------------------------------------------------------------------------------
; Bank58_DmaFunction_164
; Address: $ECCBCD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_164:
	JSR $80FF			; 20 FF 80 | Jump to subroutine
	LDA $FB00,X		  ; BD 00 FB | Load from absolute,X into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_165
; Address: $ECCBD8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_165:
	LDA $00CF70		  ; AF 70 CF 00 | Load from absolute long address into accumulator
	LSR $1CFF,X		  ; 5E FF 1C | Logical shift right (absolute,X)
	ROL $38FF			; 2E FF 38 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_166
; Address: $ECCBE9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_166:
	JSR $C1FF			; 20 FF C1 | Jump to subroutine
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	ROL $7C00,X		  ; 3E 00 7C | Rotate left (absolute,X)
	ROL $68FF			; 2E FF 68 | Rotate left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BNE $FF			  ; D0 FF | Branch if not equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	ADC $DAFF,Y		  ; 79 FF DA | Add with carry (absolute,Y)
	STZ $FF			  ; 64 FF | Store zero to zero page

;------------------------------------------------------------------------------
; Bank58_DmaFunction_167
; Address: $ECCC2D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_167:
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	CMP ($CD,X)		  ; C1 CD | Compare accumulator ((zero page,X))
	STX $00			  ; 86 00 | Store X register to zero page
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	LDX $3E00,Y		  ; BE 00 3E | Load from absolute,Y into X register
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	LDY $3F			  ; A4 3F | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_168
; Address: $ECCC4F
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_168:
	JSR $00FB			; 20 FB 00 | Jump to subroutine
	LDA				  ; BF 00 1F 00 | Load from absolute long,X into accumulator
	CPX $2C			  ; E4 2C | Compare X register (zero page)
	INC $9F			  ; E6 9F | Increment (zero page)
	CPY $EFDD			; CC DD EF | Compare Y register (absolute)
	AND $AF			  ; 25 AF | Logical AND with accumulator (zero page)
	AND $FF			  ; 25 FF | Logical AND with accumulator (zero page)
	CPY #$FD			 ; C0 FD | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$5D			 ; C0 5D | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F BF 1F 0F | Store accumulator to absolute long,X
	ORA $0EAD			; 0D AD 0E | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $CAF8,Y		  ; 99 F8 CA | Store accumulator to absolute,Y
	NOP				  ; EA | No operation
	AND ($3C),Y		  ; 31 3C | Logical AND with accumulator ((zero page),Y)
	SBC $F209,Y		  ; F9 09 F2 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	SBC $7D7D,X		  ; FD 7D 7D | Subtract with carry (absolute,X)
	LDA $7F3A,X		  ; BD 3A 7F | Load from absolute,X into accumulator
	ADC $9D3D,X		  ; 7D 3D 9D | Add with carry (absolute,X)
	ADC $38BA,X		  ; 7D BA 38 | Add with carry (absolute,X)
	BPL $83			  ; 10 83 | Branch if positive
	SBC $79FB,X		  ; FD FB 79 | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	LDA				  ; BF 3D EB 09 | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F BE 8F EF | Store accumulator to absolute long,X
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$FD			 ; A9 FD | Load immediate value into accumulator
	LDA				  ; BF 9F ED 8C | Load from absolute long,X into accumulator
	PLX				  ; FA | Pull X register from stack
	REP #$F7			 ; C2 F7 | Reset processor status bits
	ROR $FF08,X		  ; 7E 08 FF | Rotate right (absolute,X)
	ROR $BC7F,X		  ; 7E 7F BC | Rotate right (absolute,X)
	LDA				  ; BF 7F 7F FF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_169
; Address: $ECCCF6
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_169:
	LDA				  ; BF 3F BF 3F | Load from absolute long,X into accumulator
	ASL $80FF			; 0E FF 80 | Arithmetic shift left (absolute)
	INC $FF			  ; E6 FF | Increment (zero page)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $CF			  ; F0 CF | Branch if equal
	STA				  ; 9F 7F FF 7F | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	LDA				  ; BF C0 7F 80 | Load from absolute long,X into accumulator
	AND $79C7,Y		  ; 39 C7 79 | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	CMP $FF22,X		  ; DD 22 FF | Compare accumulator (absolute,X)
	ORA $FDE3,X		  ; 1D E3 FD | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FFF1			; EE F1 FF | Increment (absolute)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC $FF07,Y		  ; F9 07 FF | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ORA $93FF			; 0D FF 93 | Logical OR with accumulator (absolute)
	SBC $7E19,Y		  ; F9 19 7E | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	JMP ($FC00)		  ; 6C 00 FC | Jump to address (absolute indirect)
	PEA #$B000		   ; F4 00 B0 | Push effective address to stack
	INC $00			  ; E6 00 | Increment (zero page)
	LDA				  ; BF A0 3F 20 | Load from absolute long,X into accumulator
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	BRA $FF			  ; 80 FF | Branch always
	REP #$FF			 ; C2 FF | Reset processor status bits
	BCC $5F			  ; 90 5F | Branch if carry clear
	STA $7F00,Y		  ; 99 00 7F | Store accumulator to absolute,Y
	AND $BB00,X		  ; 3D 00 BB | Logical AND with accumulator (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ORA ($F6,X)		  ; 01 F6 | Logical OR with accumulator ((zero page,X))
	SBC $F800,Y		  ; F9 00 F8 | Subtract with carry (absolute,Y)
	PEA #$0FC0		   ; F4 C0 0F | Push effective address to stack
	DEC $38			  ; C6 38 | Decrement (zero page)
	STA $007320		  ; 8F 20 73 00 | Store accumulator to absolute long address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	ADC $3E00,X		  ; 7D 00 3E | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_16A
; Address: $ECCEAF
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_16A:
	BRA $FF			  ; 80 FF | Branch always
	LDY #$BD			 ; A0 BD | Load immediate value into Y register
	BIT $77			  ; 24 77 | Test bits in accumulator (zero page)
	ADC $27C0,X		  ; 7D C0 27 | Add with carry (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	LDA $7F00,Y		  ; B9 00 7F | Load from absolute,Y into accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA				  ; 9F BF 87 87 | Store accumulator to absolute long,X
	LDA $10			  ; A5 10 | Load from zero page into accumulator
	BCC $8E			  ; 90 8E | Branch if carry clear
	ROR $7C8C			; 6E 8C 7C | Rotate right (absolute)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	SBC ($1F),Y		  ; F1 1F | Subtract with carry ((zero page),Y)
	STY $E303			; 8C 03 E3 | Store Y register to absolute address
	EOR ($DD,X)		  ; 41 DD | Exclusive OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LDX $FF63,Y		  ; BE 63 FF | Load from absolute,Y into X register
	SBC $60FF,Y		  ; F9 FF 60 | Subtract with carry (absolute,Y)
	BPL $DF			  ; 10 DF | Branch if positive
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	STA				  ; 9F F0 EF 20 | Store accumulator to absolute long,X
	INC $E7E7,X		  ; FE E7 E7 | Increment (absolute,X)
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	INC $FF05,X		  ; FE 05 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	STA				  ; 9F 61 F9 F6 | Store accumulator to absolute long,X
	LDA				  ; BF BF DF DF | Load from absolute long,X into accumulator
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BEQ $FF			  ; F0 FF | Branch if equal
	ADC $718F,X		  ; 7D 8F 71 | Add with carry (absolute,X)
	SEP #$1C			 ; E2 1C | Set processor status bits
	BRA $FF			  ; 80 FF | Branch always
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	INC $C5FE,X		  ; FE FE C5 | Increment (absolute,X)
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SBC $FDC6,Y		  ; F9 C6 FD | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	STZ $639C			; 9C 9C 63 | Store zero to absolute
	ROL $FFC1,X		  ; 3E C1 FF | Rotate left (absolute,X)
	CPY $C53F			; CC 3F C5 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	TXS				  ; 9A | Transfer X register to stack pointer
	STZ $3FFF,X		  ; 9E FF 3F | Store zero to absolute,X
	ROL $C7			  ; 26 C7 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_16B
; Address: $ECD02B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_16B:
	LSR $CF			  ; 46 CF | Logical shift right (zero page)
	JMP $58DF			; 4C DF 58 | Jump to address
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CMP $B900,Y		  ; D9 00 B9 | Compare accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	BCC $FF			  ; 90 FF | Branch if carry clear
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BMI $FF			  ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank58_DmaFunction_16C
; Address: $ECD04B
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_16C:
	JSR $A0FF			; 20 FF A0 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	INC $4400,X		  ; FE 00 44 | Increment (absolute,X)
	ADC $2F83,X		  ; 7D 83 2F | Add with carry (absolute,X)
	ADC ($03),Y		  ; 71 03 | Add with carry ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	CMP $FF00			; CD 00 FF | Compare accumulator (absolute)
	BRA $17			  ; 80 17 | Branch always
	INX				  ; E8 | Increment X register
	ASL $07E0,X		  ; 1E E0 07 | Arithmetic shift left (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	BPL $BF			  ; 10 BF | Branch if positive
	BRA $1F			  ; 80 1F | Branch always
	PHP				  ; 08 | Push processor status to stack
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	LDA				  ; BF 40 1F E0 | Load from absolute long,X into accumulator
	ORA $E2			  ; 05 E2 | Logical OR with accumulator (zero page)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	BIT $81			  ; 24 81 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BEQ $47			  ; F0 47 | Branch if equal
	SEC				  ; 38 | Set carry flag
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	BRA $01			  ; 80 01 | Branch always
	CPX $01			  ; E4 01 | Compare X register (zero page)
	INC $3F80,X		  ; FE 80 3F | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_16D
; Address: $ECD0CC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_16D:
	CLC				  ; 18 | Clear carry flag
	BRA $07			  ; 80 07 | Branch always
	CMP #$0D			 ; C9 0D | Compare accumulator (immediate)
	SBC ($C7,X)		  ; E1 C7 | Subtract with carry ((zero page,X))
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_16E
; Address: $ECD0E8
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_16E:
	CPY #$17			 ; C0 17 | Compare Y register (immediate)
	AND ($86),Y		  ; 31 86 | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	SEP #$C0			 ; E2 C0 | Set processor status bits
	BPL $F0			  ; 10 F0 | Branch if positive
	ASL $C700,X		  ; 1E 00 C7 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 9F 67 47 | Load from absolute long,X into accumulator
	LDA $4EB1,Y		  ; B9 B1 4E | Load from absolute,Y into accumulator
	SBC #$09			 ; E9 09 | Subtract with carry (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	SBC $7300,X		  ; FD 00 73 | Subtract with carry (absolute,X)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	INC $2700,X		  ; FE 00 27 | Increment (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	BVC $2F			  ; 50 2F | Branch if overflow clear
	STA $20EF08		  ; 8F 08 EF 20 | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC $78FF,X		  ; 7D FF 78 | Add with carry (absolute,X)
	ADC $3BFF,X		  ; 7D FF 3B | Add with carry (absolute,X)
	DEC $011F			; CE 1F 01 | Decrement (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	NOP				  ; EA | No operation
	PLP				  ; 28 | Pull processor status from stack
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	ADC $03FF,Y		  ; 79 FF 03 | Add with carry (absolute,Y)
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$11			 ; C0 11 | Compare Y register (immediate)
	CPX $FC00			; EC 00 FC | Compare X register (absolute)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	ORA $00DF,X		  ; 1D DF 00 | Logical OR with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	AND $00FF,Y		  ; 39 FF 00 | Logical AND with accumulator (absolute,Y)
	BRA $7F			  ; 80 7F | Branch always
	SEP #$3D			 ; E2 3D | Set processor status bits
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_16F
; Address: $ECD1DF
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_16F:
	CLC				  ; 18 | Clear carry flag
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ADC ($F1),Y		  ; 71 F1 | Add with carry ((zero page),Y)
	ROR $19FE,X		  ; 7E FE 19 | Rotate right (absolute,X)
	CMP $FFFF,X		  ; DD FF FF | Compare accumulator (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	INC $2B			  ; E6 2B | Increment (zero page)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ORA $FF1D,X		  ; 1D 1D FF | Logical OR with accumulator (absolute,X)
	SBC $00FF,X		  ; FD FF 00 | Subtract with carry (absolute,X)
	SEP #$FF			 ; E2 FF | Set processor status bits
	BMI $FF			  ; 30 FF | Branch if negative
	BVS $FF			  ; 70 FF | Branch if overflow set
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	WDM #$FF			 ; 42 FF | Reserved instruction
	STX $FB			  ; 86 FB | Store X register to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $001E00		  ; 8F 00 1E 00 | Store accumulator to absolute long address
	ROL $BD00,X		  ; 3E 00 BD | Rotate left (absolute,X)
	ADC $7900,X		  ; 7D 00 79 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_171
; Address: $ECD24B
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_171:
	JSL $FF44FF		  ; 22 FF 44 FF | Jump to subroutine long
	CMP $F900,X		  ; DD 00 F9 | Compare accumulator (absolute,X)
	CMP $BB00,X		  ; DD 00 BB | Compare accumulator (absolute,X)
	ASL $2800			; 0E 00 28 | Arithmetic shift left (absolute)
	ROR $81			  ; 66 81 | Rotate right (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	LDY $C700,X		  ; BC 00 C7 | Load from absolute,X into Y register
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	ORA ($42,X)		  ; 01 42 | Hardware register operation
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	LDA ($5E,X)		  ; A1 5E | Load from (zero page,X) into accumulator
	ROR $0101,X		  ; 7E 01 01 | Rotate right (absolute,X)
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	ASL $00E0,X		  ; 1E E0 00 | Arithmetic shift left (absolute,X)
	LDA $00A150		  ; AF 50 A1 00 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_172
; Address: $ECD2B2
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_172:
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$87			 ; E0 87 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $AF02,X		  ; FD 02 AF | Subtract with carry (absolute,X)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BMI $E0			  ; 30 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag
	STZ $6760			; 9C 60 67 | Store zero to absolute
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $7F			  ; 80 7F | Branch always
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	STA				  ; 9F 00 67 00 | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $0F			  ; 80 0F | Branch always
	INY				  ; C8 | Increment Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA $00F070		  ; 8F 70 F0 00 | Store accumulator to absolute long address
	BRA $3F			  ; 80 3F | Branch always
	STA $156A00		  ; 8F 00 6A 15 | Store accumulator to absolute long address
	SBC $F000,X		  ; FD 00 F0 | Subtract with carry (absolute,X)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	SBC $FE06,Y		  ; F9 06 FE | Subtract with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $FF00			; ED 00 FF | Subtract with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF 00 F9 00 | Load from absolute long,X into accumulator
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BMI $7E			  ; 30 7E | Branch if negative
	STY $FC5F			; 8C 5F FC | Store Y register to absolute address
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	CLV				  ; B8 | Clear overflow flag
	BPL $00			  ; 10 00 | Branch if positive
	DEC $80			  ; C6 80 | Decrement (zero page)
	SBC $1FC0,Y		  ; F9 C0 1F | Subtract with carry (absolute,Y)
	SBC $FF06,Y		  ; F9 06 FF | Subtract with carry (absolute,Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	BMI $00			  ; 30 00 | Branch if negative
	ASL $E300			; 0E 00 E3 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_173
; Address: $ECD3A8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_173:
	BRA $74			  ; 80 74 | Branch always
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	BRA $DC			  ; 80 DC | Branch always
	LDA				  ; BF 00 0F 00 | Load from absolute long,X into accumulator
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	SEC				  ; 38 | Set carry flag
	LDA				  ; BF 00 C3 00 | Load from absolute long,X into accumulator
	LDY #$C7			 ; A0 C7 | Load immediate value into Y register
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_174
; Address: $ECD405
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_174:
	STA $000000		  ; 8F 00 00 00 | Store accumulator to absolute long address
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	STY $08FF			; 8C FF 08 | Store Y register to absolute address
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($77,X)		  ; 01 77 | Logical OR with accumulator ((zero page,X))
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_175
; Address: $ECD44D
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_175:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	STX $0701			; 8E 01 07 | Store X register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $38			  ; F0 38 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $C7			  ; 80 C7 | Branch always
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	STY $7A			  ; 84 7A | Store Y register to zero page
	CPY $0721			; CC 21 07 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	STA $00			  ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank58_DmaFunction_176
; Address: $ECD4D8
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_176:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	STA $4386,Y		  ; 99 86 43 | Store accumulator to absolute,Y
	SBC $1F03,Y		  ; F9 03 1F | Subtract with carry (absolute,Y)
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA $D8			  ; 05 D8 | Logical OR with accumulator (zero page)
	LDY $0A20,X		  ; BC 20 0A | Load from absolute,X into Y register
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	CPY #$24			 ; C0 24 | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BCS $4F			  ; B0 4F | Branch if carry set
	LSR $B9			  ; 46 B9 | Logical shift right (zero page)
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $0F01,X		  ; FE 01 0F | Increment (absolute,X)
	BCS $00			  ; B0 00 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $8F			  ; 80 8F | Branch always
	BVS $6B			  ; 70 6B | Branch if overflow set
	EOR $00A2,X		  ; 5D A2 00 | Exclusive OR with accumulator (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	STZ $0763			; 9C 63 07 | Store zero to absolute
	SED				  ; F8 | Set decimal mode flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	STZ $0700			; 9C 00 07 | Store zero to absolute
	CPX $0F			  ; E4 0F | Compare X register (zero page)
	BEQ $FF			  ; F0 FF | Branch if equal
	BPL $FF			  ; 10 FF | Branch if positive
	BRA $FF			  ; 80 FF | Branch always
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	BEQ $EF			  ; F0 EF | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	DEC $8900,X		  ; DE 00 89 | Decrement (absolute,X)
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_177
; Address: $ECD5EB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_177:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	STA				  ; 9F 60 FF 00 | Store accumulator to absolute long,X
	STA				  ; 9F 00 00 00 | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	STY $FA20			; 8C 20 FA | Store Y register to absolute address
	CMP $FF30			; CD 30 FF | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_178
; Address: $ECD60F
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_178:
	BRA $FF			  ; 80 FF | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $FF			  ; 10 FF | Branch if positive
	AND ($FE),Y		  ; 31 FE | Logical AND with accumulator ((zero page),Y)
	ROL $FD			  ; 26 FD | Rotate left (zero page)
	DEC $D900			; CE 00 D9 | Decrement (absolute)
	ORA $33FF,Y		  ; 19 FF 33 | Logical OR with accumulator (absolute,Y)
	JMP ($5C7F)		  ; 6C 7F 5C | Jump to address (absolute indirect)
	SBC $F300,X		  ; FD 00 F3 | Subtract with carry (absolute,X)
	INC $00			  ; E6 00 | Increment (zero page)
	CPY $8900			; CC 00 89 | Compare Y register (absolute)
	BPL $86			  ; 10 86 | Branch if positive
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	ADC #$90			 ; 69 90 | Add with carry (immediate)
	BCC $0F			  ; 90 0F | Branch if carry clear
	ORA $7FE6,Y		  ; 19 E6 7F | Logical OR with accumulator (absolute,Y)
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_179
; Address: $ECD684
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_179:
	JSR $B904			; 20 04 B9 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	DEC $4021,X		  ; DE 21 40 | Decrement (absolute,X)
	LDA				  ; BF 8E 71 FF | Load from absolute long,X into accumulator
	LDA				  ; BF 00 83 00 | Load from absolute long,X into accumulator
	DEC $4000,X		  ; DE 00 40 | Decrement (absolute,X)
	ASL $9F00			; 0E 00 9F | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_17A
; Address: $ECD6A2
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_17A:
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	ORA $7002			; 0D 02 70 | Logical OR with accumulator (absolute)
	BRA $CF			  ; 80 CF | Branch always
	CPY $E0			  ; C4 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 00 E9 00 | Store accumulator to absolute long,X
	SBC $7F00,X		  ; FD 00 7F | Subtract with carry (absolute,X)
	LDX $EF41,Y		  ; BE 41 EF | Load from absolute,Y into X register
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BMI $F8			  ; 30 F8 | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	STA $BE62,X		  ; 9D 62 BE | Store accumulator to absolute,X
	SED				  ; F8 | Set decimal mode flag
	STA $FF00,X		  ; 9D 00 FF | Store accumulator to absolute,X
	INC $3F01,X		  ; FE 01 3F | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_17B
; Address: $ECD6ED
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_17B:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	INC $3F00,X		  ; FE 00 3F | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $F302,X		  ; FE 02 F3 | Increment (absolute,X)
	SBC $E700,X		  ; FD 00 E7 | Subtract with carry (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_17C
; Address: $ECD724
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_17C:
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	STY $7B			  ; 84 7B | Store Y register to zero page
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STY $00			  ; 84 00 | Store Y register to zero page
	PEA #$C03F		   ; F4 3F C0 | Push effective address to stack
	SBC $F702,X		  ; FD 02 F7 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SBC $F700,X		  ; FD 00 F7 | Subtract with carry (absolute,X)
	SBC $FF06,Y		  ; F9 06 FF | Subtract with carry (absolute,Y)
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	STZ $06F9			; 9C F9 06 | Store zero to absolute
	INC $19			  ; E6 19 | Increment (zero page)
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	INC $00			  ; E6 00 | Increment (zero page)
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $FF			  ; 80 FF | Branch always
	LDA				  ; BF 40 FF 00 | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	INC $19			  ; E6 19 | Increment (zero page)
	INC $EB01,X		  ; FE 01 EB | Increment (absolute,X)
	LDA				  ; BF 40 FF 00 | Load from absolute long,X into accumulator
	INC $00			  ; E6 00 | Increment (zero page)
	INC $EB00,X		  ; FE 00 EB | Increment (absolute,X)
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	JMP $B8F8			; 4C F8 B8 | Jump to address
	SBC $FF79,Y		  ; F9 79 FF | Subtract with carry (absolute,Y)
	INC $D8FF			; EE FF D8 | Increment (absolute)
	LDY $38FF,X		  ; BC FF 38 | Load from absolute,X into Y register
	BVC $B3			  ; 50 B3 | Branch if overflow clear
	STX $00			  ; 86 00 | Store X register to zero page
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	LDA $A0E700		  ; AF 00 E7 A0 | Load from absolute long address into accumulator
	BCS $FF			  ; B0 FF | Branch if carry set

;------------------------------------------------------------------------------
; Bank58_DmaFunction_17D
; Address: $ECD845
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_17D:
	JSR $04FF			; 20 FF 04 | Jump to subroutine
	BMI $FF			  ; 30 FF | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_17E
; Address: $ECD84F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_17E:
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 00 BF 00 | Store accumulator to absolute long,X
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	ORA $E5			  ; 05 E5 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_17F
; Address: $ECD865
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_17F:
	INC				  ; 1A | Increment accumulator
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INC $FB00,X		  ; FE 00 FB | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	AND ($80,X)		  ; 21 80 | Logical AND with accumulator ((zero page,X))
	BRA $F0			  ; 80 F0 | Branch always
	BCC $C0			  ; 90 C0 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	DEC $7F00,X		  ; DE 00 7F | Decrement (absolute,X)
	LDA				  ; BF 00 FD 02 | Load from absolute long,X into accumulator
	BMI $FF			  ; 30 FF | Branch if negative
	CPY $0F			  ; C4 0F | Compare Y register (zero page)
	ROL $603E,X		  ; 3E 3E 60 | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_180
; Address: $ECD8B0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_180:
	SBC $CF00,X		  ; FD 00 CF | Subtract with carry (absolute,X)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STA				  ; 9F 00 FF 00 | Store accumulator to absolute long,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_181
; Address: $ECD8C5
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_181:
	BRA $FF			  ; 80 FF | Branch always
	DEC $004E			; CE 4E 00 | Decrement (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 00 7F 00 | Store accumulator to absolute long,X
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	STA				  ; 9F 90 39 20 | Store accumulator to absolute long,X
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	LDY $FB84,X		  ; BC 84 FB | Load from absolute,X into Y register
	INC				  ; 1A | Increment accumulator
	BRA $DF			  ; 80 DF | Branch always
	RTI				  ; 40 | Return from interrupt
	SBC #$28			 ; E9 28 | Subtract with carry (immediate)
	RTI				  ; 40 | Return from interrupt
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 7F 40 | Load from absolute long,X into accumulator
	ORA ($F3,X)		  ; 01 F3 | Logical OR with accumulator ((zero page,X))
	BPL $7F			  ; 10 7F | Branch if positive
	AND ($BF,X)		  ; 21 BF | Logical AND with accumulator ((zero page,X))
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	DEC $FF00,X		  ; DE 00 FF | Decrement (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	INC $F80A,X		  ; FE 0A F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_182
; Address: $ECD94B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_182:
	SEC				  ; 38 | Set carry flag
	INC $F908,X		  ; FE 08 F9 | Increment (absolute,X)
	SBC #$C7			 ; E9 C7 | Subtract with carry (immediate)
	EOR $3F			  ; 45 3F | Exclusive OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	SEP #$FD			 ; E2 FD | Set processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TSX				  ; BA | Transfer stack pointer to X register
	LDX $1D00			; AE 00 1D | Load from absolute address into X register
	BVS $FF			  ; 70 FF | Branch if overflow set
	SBC $8F00,X		  ; FD 00 8F | Subtract with carry (absolute,X)
	SBC $EF02,X		  ; FD 02 EF | Subtract with carry (absolute,X)
	BPL $9F			  ; 10 9F | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_183
; Address: $ECD9B2
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_183:
	SBC $EF00,X		  ; FD 00 EF | Subtract with carry (absolute,X)
	STA				  ; 9F 00 FF 00 | Store accumulator to absolute long,X
	BRA $FF			  ; 80 FF | Branch always
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $BD			  ; 80 BD | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPY $0001			; CC 01 00 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 00 7F 00 | Load from absolute long,X into accumulator
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_184
; Address: $ECDA29
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_184:
	JSR $0101			; 20 01 01 | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	DEX				  ; CA | Decrement X register
	ORA $CF			  ; 05 CF | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	PLX				  ; FA | Pull X register from stack
	BPL $03			  ; 10 03 | Branch if positive
	STA				  ; 9F 10 7F 40 | Store accumulator to absolute long,X
	SBC $FB1A,X		  ; FD 1A FB | Subtract with carry (absolute,X)
	SBC $FB00,X		  ; FD 00 FB | Subtract with carry (absolute,X)
	LDA				  ; BF 00 E5 00 | Load from absolute long,X into accumulator
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPX $BD10			; EC 10 BD | Compare X register (absolute)
	EOR $7F			  ; 45 7F | Exclusive OR with accumulator (zero page)
	STY $08EF			; 8C EF 08 | Store Y register to absolute address
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	LSR $FE			  ; 46 FE | Logical shift right (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	INC $B900			; EE 00 B9 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_186
; Address: $ECDAA7
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_186:
	PHP				  ; 08 | Push processor status to stack
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	SBC $F304,X		  ; FD 04 F3 | Subtract with carry (absolute,X)
	INC $F700,X		  ; FE 00 F7 | Increment (absolute,X)
	INC $FC00			; EE 00 FC | Increment (absolute)
	LDA				  ; BF 87 7F 0E | Load from absolute long,X into accumulator
	BPL $FF			  ; 10 FF | Branch if positive
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	DEY				  ; 88 | Decrement Y register
	BVC $FF			  ; 50 FF | Branch if overflow clear
	LDY #$78			 ; A0 78 | Load immediate value into Y register
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	LDX $7F00,Y		  ; BE 00 7F | Load from absolute,Y into X register
	LDA $005F00		  ; AF 00 5F 00 | Load from absolute long address into accumulator
	AND ($DF,X)		  ; 21 DF | Logical AND with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	DEC $ED00,X		  ; DE 00 ED | Decrement (absolute,X)
	STA $B700			; 8D 00 B7 | Store accumulator to absolute address
	BMI $DF			  ; 30 DF | Branch if negative
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank58_DmaFunction_187
; Address: $ECDB09
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_187:
	JSR $61FE			; 20 FE 61 | Jump to subroutine
	LDA $73A2,X		  ; BD A2 73 | Load from absolute,X into accumulator
	JMP $00CF			; 4C CF 00 | Jump to address
	STZ $5D00,X		  ; 9E 00 5D | Store zero to absolute,X
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_188
; Address: $ECDB29
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_188:
	JSR $80FF			; 20 FF 80 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	INC $DF00,X		  ; FE 00 DF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_189
; Address: $ECDB43
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_189:
	JSR $837F			; 20 7F 83 | Jump to subroutine
	ASL $1EFF			; 0E FF 1E | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_18A
; Address: $ECDB83
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_18A:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	ADC $FF82,X		  ; 7D 82 FF | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ADC $FF00,X		  ; 7D 00 FF | Add with carry (absolute,X)
	DEC $8D8F,X		  ; DE 8F 8D | Decrement (absolute,X)
	STX $07			  ; 86 07 | Store X register to zero page
	ADC $E0C3,Y		  ; 79 C3 E0 | Game work RAM access
	ORA #$E0			 ; 09 E0 | Game work RAM access
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	BEQ $01			  ; F0 01 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_18B
; Address: $ECDBBA
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_18B:
	BIT $F8			  ; 24 F8 | Test bits in accumulator (zero page)
	BIT $F8			  ; 24 F8 | Test bits in accumulator (zero page)
	SBC $F1DC,X		  ; FD DC F1 | Subtract with carry (absolute,X)
	BEQ $60			  ; F0 60 | Branch if equal
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ROL $7E00			; 2E 00 7E | Rotate left (absolute)
	AND ($FE,X)		  ; 21 FE | Logical AND with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	SBC $FFC8,X		  ; FD C8 FF | Subtract with carry (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	PEA #$D0EF		   ; F4 EF D0 | Push effective address to stack
	BRA $03			  ; 80 03 | Branch always
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	INC $FC92,X		  ; FE 92 FC | Increment (absolute,X)
	STY $F7			  ; 84 F7 | Store Y register to zero page
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	CMP $A700,Y		  ; D9 00 A7 | Compare accumulator (absolute,Y)
	ADC $7B00			; 6D 00 7B | Add with carry (absolute)
	INX				  ; E8 | Increment X register
	PLX				  ; FA | Pull X register from stack
	TXA				  ; 8A | Transfer X register to accumulator
	PHA				  ; 48 | Push accumulator to stack
	BMI $FF			  ; 30 FF | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ADC $F300,X		  ; 7D 00 F3 | Add with carry (absolute,X)
	BPL $9F			  ; 10 9F | Branch if positive
	STX $FF			  ; 86 FF | Store X register to zero page
	STZ $FF			  ; 64 FF | Store zero to zero page

;------------------------------------------------------------------------------
; Bank58_DmaFunction_18C
; Address: $ECDC2D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_18C:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	SBC $FC00,X		  ; FD 00 FC | Subtract with carry (absolute,X)
	ADC $9B00,Y		  ; 79 00 9B | Add with carry (absolute,Y)
	BMI $9F			  ; 30 9F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_18D
; Address: $ECDC45
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_18D:
	BRA $FF			  ; 80 FF | Branch always
	STA				  ; 9F 00 7F 00 | Store accumulator to absolute long,X
	EOR $38FF,X		  ; 5D FF 38 | Exclusive OR with accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BCC $90			  ; 90 90 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_18E
; Address: $ECDC6D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_18E:
	STZ $C1			  ; 64 C1 | Store zero to zero page
	CMP $00A2,X		  ; DD A2 00 | Compare accumulator (absolute,X)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA				  ; 9F 00 3E 00 | Store accumulator to absolute long,X
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	ASL $CF			  ; 06 CF | Arithmetic shift left (zero page)
	JMP $BDBF			; 4C BF BD | Jump to address
	DEC $DEFF			; CE FF DE | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_18F
; Address: $ECDC8F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_18F:
	LDY $00FE,X		  ; BC FE 00 | Load from absolute,X into Y register
	SBC $B300,Y		  ; F9 00 B3 | Subtract with carry (absolute,Y)
	WDM #$00			 ; 42 00 | Reserved instruction
	TYA				  ; 98 | Transfer Y register to accumulator
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	BMI $9F			  ; 30 9F | Branch if negative
	STA				  ; 9F 80 7F 00 | Store accumulator to absolute long,X
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_190
; Address: $ECDCE5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_190:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	ORA ($98,X)		  ; 01 98 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank58_DmaFunction_191
; Address: $ECDD07
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_191:
	JSR $809F			; 20 9F 80 | Jump to subroutine
	ROR $FD00,X		  ; 7E 00 FD | Rotate right (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	INC $FB00,X		  ; FE 00 FB | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BVS $DF			  ; 70 DF | Branch if overflow set
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	STA $00BE00		  ; 8F 00 BE 00 | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_192
; Address: $ECDD63
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_192:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $FF			  ; 10 FF | Branch if positive
	DEC $FF21,X		  ; DE 21 FF | Decrement (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	DEC $FF00,X		  ; DE 00 FF | Decrement (absolute,X)
	STA $F911EE		  ; 8F EE 11 F9 | Store accumulator to absolute long address
	DEC $FD			  ; C6 FD | Decrement (zero page)
	PLX				  ; FA | Pull X register from stack
	STZ $30CF			; 9C CF 30 | Store zero to absolute
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SBC $FB06,Y		  ; F9 06 FB | Subtract with carry (absolute,Y)
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_193
; Address: $ECDDE4
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_193:
	CLC				  ; 18 | Clear carry flag
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $C7FE,X		  ; FE FE C7 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $FF1D,X		  ; 1D 1D FF | Logical OR with accumulator (absolute,X)
	SBC $80FF,X		  ; FD FF 80 | Subtract with carry (absolute,X)
	SEP #$FF			 ; E2 FF | Set processor status bits
	SEC				  ; 38 | Set carry flag
	LDA				  ; BF 00 C3 00 | Load from absolute long,X into accumulator
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $C7			  ; 80 C7 | Branch always
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	JMP ($8200)		  ; 6C 00 82 | Jump to address (absolute indirect)
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_194
; Address: $ECDE92
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_194:
	ASL $1800,X		  ; 1E 00 18 | Arithmetic shift left (absolute,X)
	BCC $00			  ; 90 00 | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	AND $E000,Y		  ; 39 00 E0 | Game work RAM access
	BRA $7F			  ; 80 7F | Branch always
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	BVS $FF			  ; 70 FF | Branch if overflow set
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_195
; Address: $ECDFAF
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_195:
	STZ $0000			; 9C 00 00 | Store zero to absolute
	SED				  ; F8 | Set decimal mode flag
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ADC ($7E),Y		  ; 71 7E | Add with carry ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	SEC				  ; 38 | Set carry flag
	BRA $C3			  ; 80 C3 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	INC $E101,X		  ; FE 01 E1 | Increment (absolute,X)
	BCC $7F			  ; 90 7F | Branch if carry clear
	STA				  ; 9F FF 06 00 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank58_DmaFunction_196
; Address: $ECE096
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_196:
	JSR $8000			; 20 00 80 | Jump to subroutine
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CPX #$8F			 ; E0 8F | Compare X register (immediate)
	BEQ $83			  ; F0 83 | Branch if equal
	SBC $F30F,X		  ; FD 0F F3 | Subtract with carry (absolute,X)
	LDA				  ; BF 00 C3 00 | Load from absolute long,X into accumulator
	BPL $00			  ; 10 00 | Branch if positive
	ASL $0200			; 0E 00 02 | Arithmetic shift left (absolute)
	STA				  ; 9F 60 69 F6 | Store accumulator to absolute long,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_197
; Address: $ECE118
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_197:
	JSR $9300			; 20 00 93 | Jump to subroutine
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA $00EE00		  ; 8F 00 EE 00 | Store accumulator to absolute long address
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F E0 27 F8 | Store accumulator to absolute long,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank58_DmaFunction_198
; Address: $ECE180
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_198:
	BIT $13AC			; 2C AC 13 | Test bits in accumulator (absolute)
	ORA ($F3,X)		  ; 01 F3 | Logical OR with accumulator ((zero page,X))
	INC $00D3,X		  ; FE D3 00 | Increment (absolute,X)
	CPX $F800			; EC 00 F8 | Compare X register (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA ($9D,X)		  ; 81 9D | Store accumulator to (zero page,X)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_199
; Address: $ECE1C2
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_199:
	ORA $011E,Y		  ; 19 1E 01 | Logical OR with accumulator (absolute,Y)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $03			  ; 70 03 | Branch if overflow set
	BCC $00			  ; 90 00 | Branch if carry clear
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC $F900,X		  ; FD 00 F9 | Subtract with carry (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C6			 ; C0 C6 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF C0 3E 21 | Load from absolute long,X into accumulator
	BPL $1F			  ; 10 1F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	DEC $00			  ; C6 00 | Decrement (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	REP #$00			 ; C2 00 | Reset processor status bits
	STA				  ; 9F 60 0F F0 | Store accumulator to absolute long,X
	AND ($FE,X)		  ; 21 FE | Logical AND with accumulator ((zero page,X))
	BEQ $9F			  ; F0 9F | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_19A
; Address: $ECE245
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_19A:
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $7F			  ; 84 7F | Store Y register to zero page
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STY $C47F			; 8C 7F C4 | Store Y register to absolute address
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $7F			  ; F0 7F | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	STY $8700			; 8C 00 87 | Store Y register to absolute address
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF 40 FF 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 E7 00 | Load from absolute long,X into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F E0 7F 80 | Store accumulator to absolute long,X
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX $E704			; EC 04 E7 | Compare X register (absolute)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	STX $F3			  ; 86 F3 | Store X register to zero page
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_19D
; Address: $ECE368
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_19D:
	JSR $C0EF			; 20 EF C0 | Jump to subroutine
	BRA $FF			  ; 80 FF | Branch always
	STA $00DF00		  ; 8F 00 DF 00 | Store accumulator to absolute long address
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	SBC $F900,X		  ; FD 00 F9 | Subtract with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_19E
; Address: $ECE3FE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_19E:
	JSR $E700			; 20 00 E7 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank58_DmaFunction_19F
; Address: $ECE418
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_19F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC $D80F,Y		  ; F9 0F D8 | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	CPX $001C			; EC 1C 00 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1A0
; Address: $ECE432
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1A0:
	JSR $0000			; 20 00 00 | Jump to subroutine
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $5F			  ; 80 5F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1A1
; Address: $ECE47A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1A1:
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F 60 B7 B8 | Store accumulator to absolute long,X
	BVS $00			  ; 70 00 | Branch if overflow set
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1A2
; Address: $ECE49C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1A2:
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	SBC $FF06,Y		  ; F9 06 FF | Subtract with carry (absolute,Y)
	AND $FE00,Y		  ; 39 00 FE | Logical AND with accumulator (absolute,Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	DEC $FF00			; CE 00 FF | Decrement (absolute)
	INC $F900,X		  ; FE 00 F9 | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1A3
; Address: $ECE50F
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1A3:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	BMI $C0			  ; 30 C0 | Branch if negative
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	STA				  ; 9F 00 7F 00 | Store accumulator to absolute long,X
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($E1,X)		  ; 01 E1 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STA				  ; 9F 1F DF 02 | Store accumulator to absolute long,X
	BEQ $00			  ; F0 00 | Branch if equal
	INC $0007,X		  ; FE 07 00 | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ADC $F07F,Y		  ; 79 7F F0 | Add with carry (absolute,Y)
	JMP ($BEF3)		  ; 6C F3 BE | Jump to address (absolute indirect)
	CMP ($1E,X)		  ; C1 1E | Compare accumulator ((zero page,X))
	AND ($C0,X)		  ; 21 C0 | Logical AND with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROL $DE00,X		  ; 3E 00 DE | Rotate left (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	DEC $FF			  ; C6 FF | Decrement (zero page)
	STA $3FE2,X		  ; 9D E2 3F | Store accumulator to absolute,X
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$F3			 ; C0 F3 | Compare Y register (immediate)
	SBC $8400,X		  ; FD 00 84 | Subtract with carry (absolute,X)
	ORA $3700,X		  ; 1D 00 37 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1A4
; Address: $ECE63E
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1A4:
	JSR $FF00			; 20 00 FF | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1A5
; Address: $ECE72C
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1A5:
	DEC $FFE1,X		  ; DE E1 FF | Decrement (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	BMI $07			  ; 30 07 | Branch if negative
	STX $87			  ; 86 87 | Store X register to zero page
	CPY $70CF			; CC CF 70 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	ORA $101F,Y		  ; 19 1F 10 | Logical OR with accumulator (absolute,Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$2F			 ; E0 2F | Compare X register (immediate)
	BEQ $17			  ; F0 17 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $00			  ; E6 00 | Increment (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1A6
; Address: $ECE78F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1A6:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1A7
; Address: $ECE79C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1A7:
	JSR $1000			; 20 00 10 | Jump to subroutine
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1A8
; Address: $ECE7B0
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1A8:
	JSR $6000			; 20 00 60 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	INX				  ; E8 | Increment X register
	INC $00			  ; E6 00 | Increment (zero page)
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	STX $F9			  ; 86 F9 | Store X register to zero page
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PEA #$C8F7		   ; F4 F7 C8 | Push effective address to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	DEC $E0FF			; CE FF E0 | Game work RAM access
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1A9
; Address: $ECE8D0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1A9:
	JSR $1000			; 20 00 10 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($FE),Y		  ; 11 FE | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1AA
; Address: $ECE8E3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1AA:
	SED				  ; F8 | Set decimal mode flag
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1AB
; Address: $ECE91E
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1AB:
	SED				  ; F8 | Set decimal mode flag
	INC $FD01,X		  ; FE 01 FD | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$9F			 ; C0 9F | Compare Y register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	ROL $6000,X		  ; 3E 00 60 | Rotate left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $1F			  ; 30 1F | Branch if negative
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1AC
; Address: $ECE990
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1AC:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SBC $2FED			; ED ED 2F | Subtract with carry (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	CPY $0000			; CC 00 00 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1AD
; Address: $ECE9C1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1AD:
	JSR $8080			; 20 80 80 | Jump to subroutine
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	STA $9F61FF		  ; 8F FF 61 9F | Store accumulator to absolute long address
	ROL $9C00,X		  ; 3E 00 9C | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1AE
; Address: $ECE9E0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1AE:
	CPY $74F0			; CC F0 74 | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $E7			  ; 80 E7 | Branch always
	CLC				  ; 18 | Clear carry flag
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1AF
; Address: $ECE9FC
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1AF:
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	AND ($3E,X)		  ; 21 3E | Logical AND with accumulator ((zero page,X))
	STA $C0BFF0		  ; 8F F0 BF C0 | Store accumulator to absolute long address
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SEP #$00			 ; E2 00 | Set processor status bits
	BPL $FF			  ; 10 FF | Branch if positive
	INC $C000,X		  ; FE 00 C0 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	ASL $FF00			; 0E 00 FF | Arithmetic shift left (absolute)
	STA $E01F70		  ; 8F 70 1F E0 | Game work RAM access
	ROR $8F00,X		  ; 7E 00 8F | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F E0 67 78 | Store accumulator to absolute long,X
	AND $F0CF,X		  ; 3D CF F0 | Logical AND with accumulator (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	REP #$00			 ; C2 00 | Reset processor status bits
	LDA				  ; BF C0 1F E0 | Load from absolute long,X into accumulator
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1B0
; Address: $ECEAD6
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1B0:
	JSR $1000			; 20 00 10 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	STA				  ; 9F 60 3F C0 | Store accumulator to absolute long,X
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 00 3F 00 | Store accumulator to absolute long,X
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPX $9E1C			; EC 1C 9E | Compare X register (absolute)
	ROR $FF7F,X		  ; 7E 7F FF | Rotate right (absolute,X)
	BIT $80FF			; 2C FF 80 | Test bits in accumulator (absolute)
	ROL $F300,X		  ; 3E 00 F3 | Rotate left (absolute,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $1C			  ; 80 1C | Branch always
	BCS $BF			  ; B0 BF | Branch if carry set

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1B1
; Address: $ECEB4A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1B1:
	BRA $FF			  ; 80 FF | Branch always
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $1F			  ; 80 1F | Branch always
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $37			  ; F0 37 | Branch if equal
	INY				  ; C8 | Increment Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1B2
; Address: $ECEB78
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1B2:
	BPL $00			  ; 10 00 | Branch if positive
	ASL $3700			; 0E 00 37 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	STA				  ; 9F 60 FF 00 | Store accumulator to absolute long,X
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1B3
; Address: $ECEBC8
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1B3:
	SBC $FC06,Y		  ; F9 06 FC | Subtract with carry (absolute,Y)
	BPL $FF			  ; 10 FF | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	SBC $FC00,Y		  ; F9 00 FC | Subtract with carry (absolute,Y)
	BRA $FF			  ; 80 FF | Branch always
	ROL $FF00,X		  ; 3E 00 FF | Rotate left (absolute,X)
	ROR $9E00,X		  ; 7E 00 9E | Rotate right (absolute,X)
	DEC $7F00			; CE 00 7F | Decrement (absolute)
	STA $FF0070		  ; 8F 70 00 FF | Store accumulator to absolute long address
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA $000000		  ; 8F 00 00 00 | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SBC $8006,Y		  ; F9 06 80 | Subtract with carry (absolute,Y)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC $1F00,Y		  ; F9 00 1F | Subtract with carry (absolute,Y)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $AE01,X		  ; FE 01 AE | Increment (absolute,X)
	ADC #$B4			 ; 69 B4 | Add with carry (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1B4
; Address: $ECEC7A
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1B4:
	PLX				  ; FA | Pull X register from stack
	BRA $00			  ; 80 00 | Branch always
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	DEC $DF3E,X		  ; DE 3E DF | Decrement (absolute,X)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	BNE $00			  ; D0 00 | Branch if not equal
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $FA			  ; 80 FA | Branch always
	STX $68			  ; 86 68 | Store X register to zero page
	CLC				  ; 18 | Clear carry flag
	ASL $FF1E			; 0E 1E FF | Arithmetic shift left (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $FF			  ; 80 FF | Branch always
	ADC $E700,Y		  ; 79 00 E7 | Add with carry (absolute,Y)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	INC $FD01,X		  ; FE 01 FD | Increment (absolute,X)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ADC $6701,Y		  ; 79 01 67 | Add with carry (absolute,Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	CMP $DE27			; CD 27 DE | Compare accumulator (absolute)
	DEC $8EF9			; CE F9 8E | Decrement (absolute)
	STY $9966			; 8C 66 99 | Store Y register to absolute address
	BEQ $D3			  ; F0 D3 | Branch if equal
	BNE $99			  ; D0 99 | Branch if not equal
	TXS				  ; 9A | Transfer X register to stack pointer
	SBC ($F3),Y		  ; F1 F3 | Subtract with carry ((zero page),Y)
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	BMI $30			  ; 30 30 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BIT $7489			; 2C 89 74 | Test bits in accumulator (absolute)
	BEQ $0C			  ; F0 0C | Branch if equal
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	BMI $CF			  ; 30 CF | Branch if negative
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	DEC $7F70			; CE 70 7F | Decrement (absolute)
	ASL $1100			; 0E 00 11 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1B5
; Address: $ECED41
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1B5:
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $2CE1,X		  ; 1E E1 2C | Arithmetic shift left (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $0300,X		  ; 1E 00 03 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $2C00,X		  ; 1E 00 2C | Arithmetic shift left (absolute,X)
	SBC $860E,X		  ; FD 0E 86 | Subtract with carry (absolute,X)
	JMP $FFF3DF		  ; 5C DF F3 FF | Jump to address long
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1B6
; Address: $ECED76
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1B6:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	INC $E01F,X		  ; FE 1F E0 | Game work RAM access
	INC $E700,X		  ; FE 00 E7 | Increment (absolute,X)
	ADC $C778,Y		  ; 79 78 C7 | Add with carry (absolute,Y)
	CPX #$8F			 ; E0 8F | Compare X register (immediate)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF FF FF 00 | Load from absolute long,X into accumulator
	CPX $04			  ; E4 04 | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA $001C,X		  ; 1D 1C 00 | Logical OR with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1B7
; Address: $ECEDF5
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1B7:
	BRA $FF			  ; 80 FF | Branch always
	BPL $FF			  ; 10 FF | Branch if positive
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC $38C7,X		  ; FD C7 38 | Subtract with carry (absolute,X)
	AND $FE			  ; 25 FE | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1B8
; Address: $ECEE2A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1B8:
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	ADC ($EF),Y		  ; 71 EF | Add with carry ((zero page),Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $FCFB80		  ; 8F 80 FB FC | Store accumulator to absolute long address
	ASL $FFE3,X		  ; 1E E3 FF | Arithmetic shift left (absolute,X)
	SBC $7703,X		  ; FD 03 77 | Subtract with carry (absolute,X)
	STX $1503			; 8E 03 15 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1B9
; Address: $ECEE58
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1B9:
	JSL $A44BC1		  ; 22 C1 4B A4 | Jump to subroutine long
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CMP ($2E),Y		  ; D1 2E | Compare accumulator ((zero page),Y)
	INC $EEFE,X		  ; FE FE EE | Increment (absolute,X)
	INC $EEEE			; EE EE EE | Increment (absolute)
	INC $E6			  ; E6 E6 | Increment (zero page)
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	AND #$DE			 ; 29 DE | Logical AND with accumulator (immediate)
	STY $8D72			; 8C 72 8D | Store Y register to absolute address
	INC $99			  ; E6 99 | Increment (zero page)
	INC $6291			; EE 91 62 | Increment (absolute)
	STA $BD42,X		  ; 9D 42 BD | Store accumulator to absolute,X
	DEC $39			  ; C6 39 | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $3E3C			; 2C 3C 3E | Test bits in accumulator (absolute)
	ROL $3D3D,X		  ; 3E 3D 3D | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SBC $CA35,X		  ; FD 35 CA | Subtract with carry (absolute,X)
	ORA $0E03			; 0D 03 0E | Logical OR with accumulator (absolute)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($E3,X)		  ; 01 E3 | Logical OR with accumulator ((zero page,X))
	ORA ($F3,X)		  ; 01 F3 | Logical OR with accumulator ((zero page,X))
	ORA $01F3			; 0D F3 01 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	INC $E6C1,X		  ; FE C1 E6 | Increment (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CPY $93CC			; CC CC 93 | Compare Y register (absolute)
	STA				  ; 9F 93 8F 80 | Store accumulator to absolute long,X
	STA $FE8788		  ; 8F 88 87 FE | Store accumulator to absolute long address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1BA
; Address: $ECEED5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1BA:
	JSR $20D3			; 20 D3 20 | Jump to subroutine
	BRA $60			  ; 80 60 | Branch always
	BRA $60			  ; 80 60 | Branch always
	BRA $70			  ; 80 70 | Branch always
	DEY				  ; 88 | Decrement Y register
	BVS $FF			  ; 70 FF | Branch if overflow set

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1BB
; Address: $ECEEE5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1BB:
	RTI				  ; 40 | Return from interrupt
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF 00 80 00 | Load from absolute long,X into accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1BC
; Address: $ECEF03
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1BC:
	JSR $FF30			; 20 30 FF | Jump to subroutine
	WDM #$FF			 ; 42 FF | Reserved instruction
	ADC ($DE,X)		  ; 61 DE | Add with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	AND ($40,X)		  ; 21 40 | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ORA $00E3,X		  ; 1D E3 00 | Logical OR with accumulator (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA				  ; 9F E0 0F F0 | Store accumulator to absolute long,X
	BMI $CF			  ; 30 CF | Branch if negative
	SEC				  ; 38 | Set carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $E000,X		  ; FE 00 E0 | Game work RAM access
	STA				  ; 9F 80 9F 80 | Store accumulator to absolute long,X
	CPY #$37			 ; C0 37 | Compare Y register (immediate)
	BEQ $DD			  ; F0 DD | Branch if equal
	ROR $1F81,X		  ; 7E 81 1F | Rotate right (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	PLX				  ; FA | Pull X register from stack
	ADC $DE00,X		  ; 7D 00 DE | Add with carry (absolute,X)
	CPY #$BB			 ; C0 BB | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	CMP $6201			; CD 01 62 | Compare accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $FFE6,X		  ; 7D E6 FF | Add with carry (absolute,X)
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1BD
; Address: $ECEFF6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1BD:
	INC $FF			  ; E6 FF | Increment (zero page)
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	PEA #$CC0C		   ; F4 0C CC | Push effective address to stack
	ROL				  ; 2A | Rotate left (accumulator)
	LDA ($DF),Y		  ; B1 DF | Load from (zero page),Y into accumulator
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1BE
; Address: $ECF014
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1BE:
	JSR $91FF			; 20 FF 91 | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	ORA $671C,X		  ; 1D 1C 67 | Logical OR with accumulator (absolute,X)
	ORA $4BFD,X		  ; 1D FD 4B | Logical OR with accumulator (absolute,X)
	LDA				  ; BF A5 FF FB | Load from absolute long,X into accumulator
	DEC $FFFF,X		  ; DE FF FF | Decrement (absolute,X)
	LDA $FF			  ; A5 FF | Load from zero page into accumulator
	DEC $FFFF,X		  ; DE FF FF | Decrement (absolute,X)
	SBC $FDE5			; ED E5 FD | Subtract with carry (absolute)
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	ADC ($8E),Y		  ; 71 8E | Add with carry ((zero page),Y)
	SBC $FFFE,Y		  ; F9 FE FF | Subtract with carry (absolute,Y)
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	REP #$C2			 ; C2 C2 | Reset processor status bits
	REP #$C2			 ; C2 C2 | Reset processor status bits
	REP #$C2			 ; C2 C2 | Reset processor status bits
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	STA				  ; 9F B7 F3 C6 | Store accumulator to absolute long,X
	INC $FFFD,X		  ; FE FD FF | Increment (absolute,X)
	WDM #$BD			 ; 42 BD | Reserved instruction
	REP #$3D			 ; C2 3D | Reset processor status bits
	REP #$3D			 ; C2 3D | Reset processor status bits
	BEQ $BC			  ; F0 BC | Branch if equal
	SBC $3DFF,X		  ; FD FF 3D | Subtract with carry (absolute,X)
	AND $3535,X		  ; 3D 35 35 | Logical AND with accumulator (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SBC $FEFE,Y		  ; F9 FE FE | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	AND $15C2,X		  ; 3D C2 15 | Logical AND with accumulator (absolute,X)
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1BF
; Address: $ECF094
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1BF:
	JSR $0CDF			; 20 DF 0C | Jump to subroutine
	SBC $DE06,Y		  ; F9 06 DE | Subtract with carry (absolute,Y)
	AND ($88,X)		  ; 21 88 | Logical AND with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	BRA $BE			  ; 80 BE | Branch always
	INC $C0			  ; E6 C0 | Increment (zero page)
	ORA ($F6,X)		  ; 01 F6 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	LDX $E741,Y		  ; BE 41 E7 | Load from absolute,Y into X register
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1C0
; Address: $ECF0BF
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1C0:
	BMI $8F			  ; 30 8F | Branch if negative
	BRA $8F			  ; 80 8F | Branch always
	BRA $9F			  ; 80 9F | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $079A,X		  ; 9D 9A 07 | Store accumulator to absolute,X
	ADC ($11,X)		  ; 61 11 | Add with carry ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	STA $708470		  ; 8F 70 84 70 | Store accumulator to absolute long address
	STA				  ; 9F 60 99 60 | Store accumulator to absolute long,X
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1C1
; Address: $ECF0E7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1C1:
	JSR $A0E7			; 20 E7 A0 | Jump to subroutine
	AND $A2			  ; 25 A2 | Logical AND with accumulator (zero page)
	ADC $FD01,Y		  ; 79 01 FD | Add with carry (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1C2
; Address: $ECF0FA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1C2:
	JSR $F958			; 20 58 F9 | Jump to subroutine
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	CPY #$CC			 ; C0 CC | Compare Y register (immediate)
	CMP ($88,X)		  ; C1 88 | Compare accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	STA ($BE,X)		  ; 81 BE | Store accumulator to (zero page,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1C3
; Address: $ECF113
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1C3:
	JSR $30C0			; 20 C0 30 | Jump to subroutine
	BMI $C9			  ; 30 C9 | Branch if negative
	BMI $C0			  ; 30 C0 | Branch if negative
	BRA $77			  ; 80 77 | Branch always
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	INC $FB01,X		  ; FE 01 FB | Increment (absolute,X)
	ROR $30FF,X		  ; 7E FF 30 | Rotate right (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	ASL $F800,X		  ; 1E 00 F8 | Arithmetic shift left (absolute,X)
	BRA $A7			  ; 80 A7 | Branch always
	RTI				  ; 40 | Return from interrupt
	BEQ $E4			  ; F0 E4 | Branch if equal
	BCC $FF			  ; 90 FF | Branch if carry clear
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	STA $00F07E		  ; 8F 7E F0 00 | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	STA $F80770		  ; 8F 70 07 F8 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1C4
; Address: $ECF174
; Size: 122 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1C4:
	STA $000700		  ; 8F 00 07 00 | Store accumulator to absolute long address
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BRA $7F			  ; 80 7F | Branch always
	STZ $9F			  ; 64 9F | Store zero to zero page
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	INC $7FFF,X		  ; FE FF 7F | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $7FFF,X		  ; FE FF 7F | Increment (absolute,X)
	ASL $F36D			; 0E 6D F3 | Arithmetic shift left (absolute)
	ORA $EFFE,X		  ; 1D FE EF | Logical OR with accumulator (absolute,X)
	AND $07DF			; 2D DF 07 | Logical AND with accumulator (absolute)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	ORA $07FF			; 0D FF 07 | Logical OR with accumulator (absolute)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	CMP $BEC1,X		  ; DD C1 BE | Compare accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STZ $F7C9,X		  ; 9E C9 F7 | Store zero to absolute,X
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	LDY $E7FF,X		  ; BC FF E7 | Load from absolute,X into Y register
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	LDY $E7FF,X		  ; BC FF E7 | Load from absolute,X into Y register
	STX $738E			; 8E 8E 73 | Store X register to absolute address
	ROL $CF3E,X		  ; 3E 3E CF | Rotate left (absolute,X)
	STA $19E272		  ; 8F 72 E2 19 | Store accumulator to absolute long address
	SBC $FE06,Y		  ; F9 06 FE | Subtract with carry (absolute,Y)
	ROR $8F7E,X		  ; 7E 7E 8F | Rotate right (absolute,X)
	STA $F8E0E0		  ; 8F E0 E0 F8 | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	INC $BFFE,X		  ; FE FE BF | Increment (absolute,X)
	LDA				  ; BF 67 67 FF | Load from absolute long,X into accumulator
	BEQ $FF			  ; F0 FF | Branch if equal
	ROR $1FFF,X		  ; 7E FF 1F | Rotate right (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	ROR $9FFF,X		  ; 7E FF 9F | Rotate right (absolute,X)
	CPX #$62			 ; E0 62 | Compare X register (immediate)
	STA $FF80,X		  ; 9D 80 FF | Store accumulator to absolute,X
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	INC $03FE,X		  ; FE FE 03 | Increment (absolute,X)
	BCS $70			  ; B0 70 | Branch if carry set
	STA $C0DF80		  ; 8F 80 DF C0 | Store accumulator to absolute long address
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1C5
; Address: $ECF280
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1C5:
	LDX $FFFE,Y		  ; BE FE FF | Load from absolute,Y into X register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	SBC ($71),Y		  ; F1 71 | Subtract with carry ((zero page),Y)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	STX $FFF1			; 8E F1 FF | Store X register to absolute address
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INC $3902,X		  ; FE 02 39 | Increment (absolute,X)
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	BEQ $3F			  ; F0 3F | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	BEQ $1F			  ; F0 1F | Branch if equal
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	WDM #$00			 ; 42 00 | Reserved instruction
	BEQ $F8			  ; F0 F8 | Branch if equal
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	WDM #$BD			 ; 42 BD | Reserved instruction
	BEQ $FF			  ; F0 FF | Branch if equal
	CLC				  ; 18 | Clear carry flag
	PHX				  ; DA | Push X register to stack
	ASL $E068,X		  ; 1E 68 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BPL $FF			  ; 10 FF | Branch if positive
	BIT $C0			  ; 24 C0 | Test bits in accumulator (zero page)
	CMP ($03,X)		  ; C1 03 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BPL $FF			  ; 10 FF | Branch if positive
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	SEC				  ; 38 | Set carry flag
	ASL $7F43,X		  ; 1E 43 7F | Arithmetic shift left (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	AND $FF			  ; 25 FF | Logical AND with accumulator (zero page)
	ASL $C0FF,X		  ; 1E FF C0 | Arithmetic shift left (absolute,X)
	INX				  ; E8 | Increment X register
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	INC $FFF3,X		  ; FE F3 FF | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	AND $FF			  ; 25 FF | Logical AND with accumulator (zero page)
	ASL $FCFF,X		  ; 1E FF FC | Arithmetic shift left (absolute,X)
	INC $3E01,X		  ; FE 01 3E | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1C6
; Address: $ECF36C
; Size: 121 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1C6:
	PHB				  ; 8B | Push data bank register to stack
	JMP ($4400)		  ; 6C 00 44 | Jump to address (absolute indirect)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	BPL $FF			  ; 10 FF | Branch if positive
	PHB				  ; 8B | Push data bank register to stack
	STA				  ; 9F FF EF FF | Store accumulator to absolute long,X
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	SBC $9FFF,Y		  ; F9 FF 9F | Subtract with carry (absolute,Y)
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	SBC $F8FF,Y		  ; F9 FF F8 | Subtract with carry (absolute,Y)
	LDX $73BE,Y		  ; BE BE 73 | Load from absolute,Y into X register
	DEC $FE			  ; C6 FE | Decrement (zero page)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	AND $F83F,Y		  ; 39 3F F8 | Logical AND with accumulator (absolute,Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC $79FF,Y		  ; F9 FF 79 | Subtract with carry (absolute,Y)
	ASL $F3FF			; 0E FF F3 | Arithmetic shift left (absolute)
	CPY $33CF			; CC CF 33 | Compare Y register (absolute)
	BIT #$89			 ; 89 89 | Test bits in accumulator (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ADC $0EFF,Y		  ; 79 FF 0E | Add with carry (absolute,Y)
	CMP #$F7			 ; C9 F7 | Compare accumulator (immediate)
	SBC $FF38,X		  ; FD 38 FF | Subtract with carry (absolute,X)
	STZ $CEFF			; 9C FF CE | Store zero to absolute
	INC $CCFF			; EE FF CC | Increment (absolute)
	BCS $FF			  ; B0 FF | Branch if carry set
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BVS $FF			  ; 70 FF | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	STZ $CEFF			; 9C FF CE | Store zero to absolute
	INC $CCFF			; EE FF CC | Increment (absolute)
	BCS $FF			  ; B0 FF | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $E6			  ; E6 E6 | Increment (zero page)
	LDY $6F7C,X		  ; BC 7C 6F | Load from absolute,X into Y register
	STA				  ; 9F 37 CF 1B | Store accumulator to absolute long,X
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	LDA $EEB9,Y		  ; B9 B9 EE | Load from absolute,Y into accumulator
	INC $FBFB			; EE FB FB | Increment (absolute)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	ASL $83FE,X		  ; 1E FE 83 | Arithmetic shift left (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	STA				  ; 9F 9F EF EF | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1C7
; Address: $ECF456
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1C7:
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STZ $319E,X		  ; 9E 9E 31 | Store zero to absolute,X
	SBC ($08),Y		  ; F1 08 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	INC $FC0C,X		  ; FE 0C FC | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	LDY $4EBF,X		  ; BC BF 4E | Load from absolute,X into Y register
	LSR $2727			; 4E 27 27 | Logical shift right (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	LDX $FE80,Y		  ; BE 80 FE | Load from absolute,Y into X register
	INC $7F47,X		  ; FE 47 7F | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	INC $7FFE,X		  ; FE FE 7F | Increment (absolute,X)
	STA				  ; 9F FF FF FF | Store accumulator to absolute long,X
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	SEP #$FF			 ; E2 FF | Set processor status bits
	SBC $8FFF,Y		  ; F9 FF 8F | Subtract with carry (absolute,Y)
	STA $FCE1E1		  ; 8F E1 E1 FC | Store accumulator to absolute long address
	SEP #$FF			 ; E2 FF | Set processor status bits
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	ADC ($7F,X)		  ; 61 7F | Add with carry ((zero page,X))
	DEC $FF			  ; C6 FF | Decrement (zero page)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	INC $06			  ; E6 06 | Increment (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	BRA $B8			  ; 80 B8 | Branch always
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ADC $FF00,Y		  ; 79 00 FF | Add with carry (absolute,Y)
	BNE $00			  ; D0 00 | Branch if not equal
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1C9
; Address: $ECF600
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1C9:
	JSR $303F			; 20 3F 30 | Jump to subroutine
	CPY $FFFC			; CC FC FF | Compare Y register (absolute)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	BEQ $3C			  ; F0 3C | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	BNE $3F			  ; D0 3F | Branch if not equal
	BEQ $80			  ; F0 80 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1CA
; Address: $ECF68B
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1CA:
	JSR $807F			; 20 7F 80 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $DDFF,X		  ; FE FF DD | Increment (absolute,X)
	LDA $38FF,Y		  ; B9 FF 38 | Load from absolute,Y into accumulator
	LDY $CBBF			; AC BF CB | Load from absolute address into Y register
	INC $DDFF,X		  ; FE FF DD | Increment (absolute,X)
	LDA $B8FF,Y		  ; B9 FF B8 | Load from absolute,Y into accumulator
	CPX $FBFF			; EC FF FB | Compare X register (absolute)
	ASL $9E1F,X		  ; 1E 1F 9E | Arithmetic shift left (absolute,X)
	STA				  ; 9F 6F EF 1B | Store accumulator to absolute long,X
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	LDA				  ; BF FF 6F EF | Load from absolute long,X into accumulator
	ORA $CFDF,X		  ; 1D DF CF | Logical OR with accumulator (absolute,X)
	LDA				  ; BF FF 7F FF | Load from absolute long,X into accumulator
	AND $DFFF,X		  ; 3D FF DF | Logical AND with accumulator (absolute,X)
	LDA				  ; BF BF EF EF | Load from absolute long,X into accumulator
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $AF			  ; 06 AF | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	PLY				  ; 7A | Pull Y register from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA				  ; 9F EE FF FF | Store accumulator to absolute long,X
	NOP				  ; EA | No operation
	SEC				  ; 38 | Set carry flag
	PEA #$E7FB		   ; F4 FB E7 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1CC
; Address: $ECF76E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1CC:
	JSR $0020			; 20 20 00 | Jump to subroutine
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	INC $18			  ; E6 18 | Increment (zero page)
	DEY				  ; 88 | Decrement Y register
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1CD
; Address: $ECF77E
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1CD:
	JSR $FFDF			; 20 DF FF | Jump to subroutine
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$D7			 ; E0 D7 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CMP $87DE,Y		  ; D9 DE 87 | Compare accumulator (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	STA $000080		  ; 8F 80 00 00 | Store accumulator to absolute long address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $44			  ; 80 44 | Branch always
	LDY #$41			 ; A0 41 | Load immediate value into Y register
	LDY #$06			 ; A0 06 | Load immediate value into Y register
	BEQ $8C			  ; F0 8C | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BEQ $CC			  ; F0 CC | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY $F30F			; CC 0F F3 | Compare Y register (absolute)
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BMI $3F			  ; 30 3F | Branch if negative
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BMI $F0			  ; 30 F0 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	LDA				  ; BF BF F1 F1 | Load from absolute long,X into accumulator
	ADC $8F7F,Y		  ; 79 7F 8F | Add with carry (absolute,Y)
	STA $FFE1E1		  ; 8F E1 E1 FF | Store accumulator to absolute long address
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	ADC $9F7D,X		  ; 7D 7D 9F | Add with carry (absolute,X)
	STA				  ; 9F F7 F7 1E | Store accumulator to absolute long,X
	INC $FFC3,X		  ; FE C3 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $3EF9,Y		  ; F9 F9 3E | Subtract with carry (absolute,Y)
	INC $FFF7,X		  ; FE F7 FF | Increment (absolute,X)
	SBC $7FF9,Y		  ; F9 F9 7F | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1CE
; Address: $ECF86E
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1CE:
	STA $FFFF8F		  ; 8F 8F FF FF | Store accumulator to absolute long address
	INC $1FFE,X		  ; FE FE 1F | Increment (absolute,X)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ASL $3B00			; 0E 00 3B | Arithmetic shift left (absolute)
	INC $0300,X		  ; FE 00 03 | Increment (absolute,X)
	SBC $FD07,X		  ; FD 07 FD | Subtract with carry (absolute,X)
	SBC $0D0F,X		  ; FD 0F 0D | Subtract with carry (absolute,X)
	SBC $020F,X		  ; FD 0F 02 | Subtract with carry (absolute,X)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0E0D			; 0E 0D 0E | Arithmetic shift left (absolute)
	ORA $FB0E,Y		  ; 19 0E FB | Logical OR with accumulator (absolute,Y)
	ASL $0E03			; 0E 03 0E | Arithmetic shift left (absolute)
	ASL $FFEF			; 0E EF FF | Arithmetic shift left (absolute)
	LDA $FFFFFF		  ; AF FF FF FF | Load from absolute long address into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	BVS $0F			  ; 70 0F | Branch if overflow set
	BEQ $4E			  ; F0 4E | Branch if equal
	LDA ($DA),Y		  ; B1 DA | Load from (zero page),Y into accumulator
	AND $9A			  ; 25 9A | Logical AND with accumulator (zero page)
	ADC $91			  ; 65 91 | Add with carry (zero page)
	SBC $FCF9,Y		  ; F9 F9 FC | Subtract with carry (absolute,Y)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	DEC $E7CF			; CE CF E7 | Decrement (absolute)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	AND $E1			  ; 25 E1 | Logical AND with accumulator (zero page)
	ORA ($F0),Y		  ; 11 F0 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	BNE $F0			  ; D0 F0 | Branch if not equal
	STA ($E0,X)		  ; 81 E0 | Game work RAM access
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STA $FFCFFF		  ; 8F FF CF FF | Store accumulator to absolute long address
	STA				  ; 9F FF 3F FF | Store accumulator to absolute long,X
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1D0
; Address: $ECF964
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1D0:
	BCS $30			  ; B0 30 | Branch if carry set
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPX $EC0C			; EC 0C EC | Compare X register (absolute)
	LDY $FF3C,X		  ; BC 3C FF | Load from absolute,X into Y register
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $1D0E			; 0E 0E 1D | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1D1
; Address: $ECF9AB
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1D1:
	ORA $7B7A,X		  ; 1D 7A 7B | Logical OR with accumulator (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BVS $F0			  ; 70 F0 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	STZ $9BFC			; 9C FC 9B | Store zero to absolute
	SED				  ; F8 | Set decimal mode flag
	BIT $E0			  ; 24 E0 | Game work RAM access
	INY				  ; C8 | Increment Y register
	CPY #$81			 ; C0 81 | Compare Y register (immediate)
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	STA				  ; 9F FF 9F FF | Store accumulator to absolute long,X
	SBC ($03,X)		  ; E1 03 | Subtract with carry ((zero page,X))
	STA $07			  ; 85 07 | Store accumulator to zero page
	SBC $FDFF,X		  ; FD FF FD | Subtract with carry (absolute,X)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	ROR $F100,X		  ; 7E 00 F1 | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SBC $FEF9,Y		  ; F9 F9 FE | Subtract with carry (absolute,Y)
	INC $F9F9,X		  ; FE F9 F9 | Increment (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INC $7CFF,X		  ; FE FF 7C | Increment (absolute,X)
	ROR $F8F0,X		  ; 7E F0 F8 | Rotate right (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	LDA				  ; BF 3F FF FF | Load from absolute long,X into accumulator
	CMP $7FDF,X		  ; DD DF 7F | Compare accumulator (absolute,X)
	SBC $F9FF,X		  ; FD FF F9 | Subtract with carry (absolute,X)
	SBC $F7F7,Y		  ; F9 F7 F7 | Subtract with carry (absolute,Y)
	DEC $F9DE,X		  ; DE DE F9 | Decrement (absolute,X)
	SBC $6363,Y		  ; F9 63 63 | Subtract with carry (absolute,Y)
	LDA $F6BF,X		  ; BD BF F6 | Load from absolute,X into accumulator
	INC $FCEC,X		  ; FE EC FC | Increment (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BCC $F0			  ; 90 F0 | Branch if carry clear
	BCC $F0			  ; 90 F0 | Branch if carry clear
	BNE $F0			  ; D0 F0 | Branch if not equal
	SBC $F7FF,X		  ; FD FF F7 | Subtract with carry (absolute,X)
	STA				  ; 9F FF 9F FF | Store accumulator to absolute long,X
	ADC $E7			  ; 65 E7 | Add with carry (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	STX $1C10			; 8E 10 1C | Store X register to absolute address
	AND $3D			  ; 25 3D | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1D2
; Address: $ECFAD0
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1D2:
	ADC $FBFF,X		  ; 7D FF FB | Add with carry (absolute,X)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F FF 3F FF | Store accumulator to absolute long,X
	STA				  ; 9F FF 3F FF | Store accumulator to absolute long,X
	INC $F801,X		  ; FE 01 F8 | Increment (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX $FF13			; EC 13 FF | Compare X register (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX $3F00			; EC 00 3F | Compare X register (absolute)
	INC $3801,X		  ; FE 01 38 | Increment (absolute,X)
	ORA $01FD			; 0D FD 01 | Logical OR with accumulator (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	DEC $00			  ; C6 00 | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	CPX $B9EC			; EC EC B9 | Compare X register (absolute)
	LDA ($5B),Y		  ; B1 5B | Load from (zero page),Y into accumulator
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	SEP #$FE			 ; E2 FE | Set processor status bits
	DEX				  ; CA | Decrement X register
	STA ($EF),Y		  ; 91 EF | Store accumulator to (zero page),Y
	BPL $EF			  ; 10 EF | Branch if positive
	CLC				  ; 18 | Clear carry flag
	STA $FFF1FC		  ; 8F FC F1 FF | Store accumulator to absolute long address
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	BPL $FF			  ; 10 FF | Branch if positive
	STY $1FFF			; 8C FF 1F | Store Y register to absolute address
	STA $F363CF		  ; 8F CF 63 F3 | Store accumulator to absolute long address
	CLC				  ; 18 | Clear carry flag
	INC $FF04,X		  ; FE 04 FF | Increment (absolute,X)
	LDA				  ; BF FF 6F FF | Load from absolute long,X into accumulator
	ORA $04FF,Y		  ; 19 FF 04 | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1D3
; Address: $ECFC07
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1D3:
	SED				  ; F8 | Set decimal mode flag
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	SBC $FAFF,X		  ; FD FF FA | Subtract with carry (absolute,X)
	INC $FCF5,X		  ; FE F5 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	CLD				  ; D8 | Clear decimal mode flag
	SBC $FBFF,X		  ; FD FF FB | Subtract with carry (absolute,X)
	STA $FF0FFF		  ; 8F FF 0F FF | Store accumulator to absolute long address
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	SEP #$E3			 ; E2 E3 | Set processor status bits
	CMP ($D1),Y		  ; D1 D1 | Compare accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	CPX $DE			  ; E4 DE | Compare X register (zero page)
	SBC ($76,X)		  ; E1 76 | Subtract with carry ((zero page,X))
	SBC $FC23			; ED 23 FC | Subtract with carry (absolute)
	INC $8097,X		  ; FE 97 80 | Increment (absolute,X)
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	BRA $A8			  ; 80 A8 | Branch always
	LDA ($8E,X)		  ; A1 8E | Load from (zero page,X) into accumulator
	LDA $ED83			; AD 83 ED | Load from absolute address into accumulator
	LDY $83			  ; A4 83 | Load from zero page into Y register
	CLD				  ; D8 | Clear decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	LDA $D83E78		  ; AF 78 3E D8 | Load from absolute long address into accumulator
	JMP ($E4BC)		  ; 6C BC E4 | Jump to address (absolute indirect)
	SEI				  ; 78 | Set interrupt disable flag
	BMI $3F			  ; 30 3F | Branch if negative
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	STX $FB00			; 8E 00 FB | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $75			  ; 80 75 | Branch always
	AND $F8FE			; 2D FE F8 | Logical AND with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1D4
; Address: $ECFCE6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1D4:
	BCS $80			  ; B0 80 | Branch if carry set
	JMP ($1AE0)		  ; 6C E0 1A | Jump to address (absolute indirect)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1D5
; Address: $ECFCEE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1D5:
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	LDA ($81),Y		  ; B1 81 | Load from (zero page),Y into accumulator
	BVC $40			  ; 50 40 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1D6
; Address: $ECFD0F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1D6:
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	ROR $A3FF,X		  ; 7E FF A3 | Rotate right (absolute,X)
	LDA				  ; BF E2 E3 F8 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	ASL $C10E			; 0E 0E C1 | Arithmetic shift left (absolute)
	ROR $E3FF,X		  ; 7E FF E3 | Rotate right (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	XBA				  ; EB | Exchange accumulator bytes
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1D7
; Address: $ECFD6C
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1D7:
	JMP $80A040		  ; 5C 40 A0 80 | Jump to address long
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	STY $07			  ; 84 07 | Store Y register to zero page
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	AND $BA3F,X		  ; 3D 3F BA | Logical AND with accumulator (absolute,X)
	LDA				  ; BF 72 7F F6 | Load from absolute long,X into accumulator
	CLD				  ; D8 | Clear decimal mode flag
	INC $7FFF			; EE FF 7F | Increment (absolute)
	SBC $FAFF,X		  ; FD FF FA | Subtract with carry (absolute,X)
	CMP ($FF),Y		  ; D1 FF | Compare accumulator ((zero page),Y)
	CLD				  ; D8 | Clear decimal mode flag
	INC $FFFF			; EE FF FF | Increment (absolute)
	ADC $9C			  ; 65 9C | Add with carry (zero page)
	STX $C739			; 8E 39 C7 | Store X register to absolute address
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $D700			; 8E 00 D7 | Store X register to absolute address
	BVS $00			  ; 70 00 | Branch if overflow set
	STY $7C			  ; 84 7C | Store Y register to zero page
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1D8
; Address: $ECFE04
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1D8:
	SBC $FB03,X		  ; FD 03 FB | Subtract with carry (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ROL $901E			; 2E 1E 90 | Rotate left (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $E701,X		  ; FE 01 E7 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $2700,X		  ; FE 00 27 | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $BFFF,X		  ; FE FF BF | Increment (absolute,X)
	LDA				  ; BF 4F 4F 27 | Load from absolute long,X into accumulator
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $70			  ; F0 70 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	ROL $6EDE			; 2E DE 6E | Rotate left (absolute)
	STZ $FFFF,X		  ; 9E FF FF | Store zero to absolute,X
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BIT $0B0C			; 2C 0C 0B | Test bits in accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank58_DmaFunction_1DB
; Address: $ECFEE0
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank58_DmaFunction_1DB:
	ORA $7C1F,X		  ; 1D 1F 7C | Logical OR with accumulator (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	LDA				  ; BF BF 5F 5F | Load from absolute long,X into accumulator
	SBC $FCFF,X		  ; FD FF FC | Subtract with carry (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CMP $13DD,X		  ; DD DD 13 | Compare accumulator (absolute,X)
	INC $FF81,X		  ; FE 81 FF | Increment (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	BMI $37			  ; 30 37 | Branch if negative
	SEC				  ; 38 | Set carry flag
	ADC $FE7E,Y		  ; 79 7E FE | Add with carry (absolute,Y)
	INC $FF			  ; E6 FF | Increment (zero page)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $FC06,Y		  ; F9 06 FC | Subtract with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	SBC $FC00,Y		  ; F9 00 FC | Subtract with carry (absolute,Y)
	BRA $FF			  ; 80 FF | Branch always
	BRA $00			  ; 80 00 | Branch always
	DEC $FF00			; CE 00 FF | Decrement (absolute)
	EOR ($61,X)		  ; 41 61 | Exclusive OR with accumulator ((zero page,X))
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	LDA				  ; BF FF 7F FF | Load from absolute long,X into accumulator
	INC $F8FF,X		  ; FE FF F8 | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $3B			  ; F0 3B | Branch if equal
	ROR $F1FE,X		  ; 7E FE F1 | Rotate right (absolute,X)
	SBC ($07),Y		  ; F1 07 | Subtract with carry ((zero page),Y)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	INC $DC1E			; EE 1E DC | Increment (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SBC ($E0,X)		  ; E1 E0 | Game work RAM access
	PHB				  ; 8B | Push data bank register to stack
	INC $F1FE,X		  ; FE FE F1 | Increment (absolute,X)
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
