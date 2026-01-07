;==============================================================================
; Dragon Quest III - Bank $76
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $FB0000-$FB7FFF
; Instructions: 8613
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_76"

;------------------------------------------------------------------------------
; Bank76_DmaFunction_000
; Address: $FB8000
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_000:
	CMP #$32			 ; C9 32 | Compare accumulator (immediate)
	SBC $FC02,Y		  ; F9 02 FC | Subtract with carry (absolute,Y)
	PHX				  ; DA | Push X register to stack
	CMP $0D06,X		  ; DD 06 0D | Compare accumulator (absolute,X)
	DEC $EEEB			; CE EB EE | Decrement (absolute)
	AND ($C9,X)		  ; 21 C9 | Logical AND with accumulator ((zero page,X))
	SBC ($05),Y		  ; F1 05 | Subtract with carry ((zero page),Y)
	BMI $CA			  ; 30 CA | Branch if negative
	BPL $EA			  ; 10 EA | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BMI $C0			  ; 30 C0 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_001
; Address: $FB8026
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_001:
	STY $8C70			; 8C 70 8C | Store Y register to absolute address
	BVS $86			  ; 70 86 | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag
	STX $58			  ; 86 58 | Store X register to zero page
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ROR $66			  ; 66 66 | Rotate right (zero page)
	CPX #$67			 ; E0 67 | Compare X register (immediate)
	SBC $F77E,Y		  ; F9 7E F7 | Subtract with carry (absolute,Y)
	ADC $7FEF,Y		  ; 79 EF 7F | Add with carry (absolute,Y)
	BMI $18			  ; 30 18 | Branch if negative

;------------------------------------------------------------------------------
; Bank76_DmaFunction_002
; Address: $FB8057
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_002:
	JSR $3800			; 20 00 38 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	XBA				  ; EB | Exchange accumulator bytes
	CPX $FF8C			; EC 8C FF | Compare X register (absolute)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY $BDFC			; CC FC BD | Compare Y register (absolute)
	SBC $BF57,X		  ; FD 57 BF | Subtract with carry (absolute,X)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STA				  ; 9F 7F 3F FF | Store accumulator to absolute long,X
	BEQ $F3			  ; F0 F3 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	BNE $C4			  ; D0 C4 | Branch if not equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_004
; Address: $FB80A3
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_004:
	TSX				  ; BA | Transfer stack pointer to X register
	ORA $F500			; 0D 00 F5 | Logical OR with accumulator (absolute)
	SBC $0D00,X		  ; FD 00 0D | Subtract with carry (absolute,X)
	BPL $05			  ; 10 05 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	STX $40			  ; 86 40 | Store X register to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BCC $80			  ; 90 80 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $F4			  ; F0 F4 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	LDY $78			  ; A4 78 | Load from zero page into Y register
	TAX				  ; AA | Transfer accumulator to X register
	CPX $FFBA			; EC BA FF | Compare X register (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_005
; Address: $FB8131
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_005:
	BRA $00			  ; 80 00 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $30			  ; 10 30 | Branch if positive
	ORA #$66			 ; 09 66 | Logical OR with accumulator (immediate)
	ORA $1069,Y		  ; 19 69 10 | Logical OR with accumulator (absolute,Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_006
; Address: $FB8148
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_006:
	JSR $0000			; 20 00 00 | Jump to subroutine
	AND $3039,Y		  ; 39 39 30 | Logical AND with accumulator (absolute,Y)
	BMI $20			  ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank76_DmaFunction_007
; Address: $FB8157
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_007:
	JSR $0000			; 20 00 00 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	BVC $BB			  ; 50 BB | Branch if overflow clear
	CPY $C107			; CC 07 C1 | Compare Y register (absolute)
	BCC $31			  ; 90 31 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank76_DmaFunction_008
; Address: $FB816A
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_008:
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	ADC $F7FD,X		  ; 7D FD F7 | Add with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ASL $0710			; 0E 10 07 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	AND $0700			; 2D 00 07 | Logical AND with accumulator (absolute)
	STA				  ; 9F 7F 3F FF | Store accumulator to absolute long,X
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $F5			  ; 80 F5 | Branch always
	SBC $FDFF,X		  ; FD FF FD | Subtract with carry (absolute,X)
	SBC $1DFF,X		  ; FD FF 1D | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SBC ($08),Y		  ; F1 08 | Subtract with carry ((zero page),Y)
	SBC ($08),Y		  ; F1 08 | Subtract with carry ((zero page),Y)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BRA $C2			  ; 80 C2 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	INC $4242,X		  ; FE 42 42 | Hardware register operation
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BCC $6F			  ; 90 6F | Branch if carry clear
	DEX				  ; CA | Decrement X register
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	JMP $34B3			; 4C B3 34 | Jump to address
	ROL $C3			  ; 26 C3 | Rotate left (zero page)
	ORA ($4F,X)		  ; 01 4F | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank76_DmaFunction_009
; Address: $FB8226
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_009:
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	LDX $19			  ; A6 19 | Load from zero page into X register
	LDA ($1E,X)		  ; A1 1E | Load from (zero page,X) into accumulator
	STA $000E,Y		  ; 99 0E 00 | Store accumulator to absolute,Y
	PHP				  ; 08 | Push processor status to stack
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	CPX #$C2			 ; E0 C2 | Compare X register (immediate)
	BRA $C4			  ; 80 C4 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	BIT $80			  ; 24 80 | Test bits in accumulator (zero page)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	BVS $BA			  ; 70 BA | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_00A
; Address: $FB8263
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_00A:
	ADC $F7			  ; 65 F7 | Add with carry (zero page)
	EOR $98			  ; 45 98 | Exclusive OR with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	CPX #$7D			 ; E0 7D | Compare X register (immediate)
	STA $FDB5			; 8D B5 FD | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	LDX #$08			 ; A2 08 | Load immediate value into X register
	BRA $15			  ; 80 15 | Branch always
	BCC $18			  ; 90 18 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	REP #$05			 ; C2 05 | Reset processor status bits
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BVS $E8			  ; 70 E8 | Branch if overflow set
	BMI $32			  ; 30 32 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($C8),Y		  ; 11 C8 | Logical OR with accumulator ((zero page),Y)
	BVS $D0			  ; 70 D0 | Branch if overflow set
	SEP #$39			 ; E2 39 | Set processor status bits
	BEQ $8D			  ; F0 8D | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	BRA $0F			  ; 80 0F | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BRA $20			  ; 80 20 | Branch always
	BPL $20			  ; 10 20 | Branch if positive
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_00B
; Address: $FB82AA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_00B:
	JSR $1000			; 20 00 10 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_00C
; Address: $FB82B7
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_00C:
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	SEC				  ; 38 | Set carry flag
	ADC $32DF			; 6D DF 32 | Add with carry (absolute)
	INC				  ; 1A | Increment accumulator
	STZ $FF20,X		  ; 9E 20 FF | Store zero to absolute,X
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	STZ $3B			  ; 64 3B | Store zero to zero page
	ROR $39			  ; 66 39 | Rotate right (zero page)
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_00E
; Address: $FB831E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_00E:
	JSR $C050			; 20 50 C0 | Jump to subroutine
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_00F
; Address: $FB832A
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_00F:
	JSR $C0DF			; 20 DF C0 | Jump to subroutine
	BVS $0F			  ; 70 0F | Branch if overflow set
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PEA #$E41A		   ; F4 1A E4 | Push effective address to stack
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $BEB3,X		  ; DD B3 BE | Compare accumulator (absolute,X)
	ASL $0B07			; 0E 07 0B | Arithmetic shift left (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BCS $00			  ; B0 00 | Branch if carry set
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	EOR $DB8A,Y		  ; 59 8A DB | Exclusive OR with accumulator (absolute,Y)
	TXA				  ; 8A | Transfer X register to accumulator
	STX $CEF5			; 8E F5 CE | Store X register to absolute address
	STA				  ; 9F F1 24 4D | Store accumulator to absolute long,X
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	CPX #$18			 ; E0 18 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_011
; Address: $FB83EA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_011:
	LDY $8EE0,X		  ; BC E0 8E | Load from absolute,X into Y register
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_012
; Address: $FB83F0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_012:
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F B0 0F F0 | Store accumulator to absolute long,X
	ADC $22EA			; 6D EA 22 | Add with carry (absolute)
	SBC $708F,X		  ; FD 8F 70 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_013
; Address: $FB840B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_013:
	JSR $15EF			; 20 EF 15 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $7800,X		  ; FD 00 78 | Subtract with carry (absolute,X)
	BRA $78			  ; 80 78 | Branch always
	BRA $30			  ; 80 30 | Branch always
	CPY #$35			 ; C0 35 | Compare Y register (immediate)
	CMP $37			  ; C5 37 | Compare accumulator (zero page)
	CLV				  ; B8 | Clear overflow flag
	ROL $F8			  ; 26 F8 | Rotate left (zero page)
	STY $7D70			; 8C 70 7D | Store Y register to absolute address
	BRA $DD			  ; 80 DD | Branch always
	LDY #$D9			 ; A0 D9 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank76_DmaFunction_014
; Address: $FB842B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_014:
	JSR $40BB			; 20 BB 40 | Jump to subroutine
	LDA				  ; BF 40 7C 03 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_018
; Address: $FB8442
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_018:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	DEC $AB34,X		  ; DE 34 AB | Decrement (absolute,X)
	LSR $5AAF,X		  ; 5E AF 5A | Logical shift right (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $01			  ; 80 01 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_019
; Address: $FB8483
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_019:
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BVS $E8			  ; 70 E8 | Branch if overflow set
	BVS $64			  ; 70 64 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	PEA #$F6F8		   ; F4 F8 F6 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_01B
; Address: $FB8495
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_01B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BCC $00			  ; 90 00 | Branch if carry clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BVS $4E			  ; 70 4E | Branch if overflow set
	BEQ $3F			  ; F0 3F | Branch if equal
	CLC				  ; 18 | Clear carry flag
	JMP $5020			; 4C 20 50 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_01C
; Address: $FB84D5
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_01C:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BRA $32			  ; 80 32 | Branch always
	DEY				  ; 88 | Decrement Y register
	ASL $0101			; 0E 01 01 | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BCS $C0			  ; B0 C0 | Branch if carry set
	JMP ($4EF0)		  ; 6C F0 4E | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_01D
; Address: $FB855D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_01D:
	JSR $4422			; 20 22 44 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_01E
; Address: $FB8593
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_01E:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank76_DmaFunction_01F
; Address: $FB85A3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_01F:
	ORA $0F77,X		  ; 1D 77 0F | Logical OR with accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	REP #$3F			 ; C2 3F | Reset processor status bits
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_020
; Address: $FB85B7
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_020:
	BVS $07			  ; 70 07 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	INC $BC40,X		  ; FE 40 BC | Increment (absolute,X)
	CPY #$74			 ; C0 74 | Compare Y register (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPY #$34			 ; C0 34 | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHX				  ; DA | Push X register to stack
	PHX				  ; DA | Push X register to stack
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	PLP				  ; 28 | Pull processor status from stack
	ADC $4E9B			; 6D 9B 4E | Add with carry (absolute)
	LSR $3030,X		  ; 5E 30 30 | Logical shift right (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	PLP				  ; 28 | Pull processor status from stack
	LDA				  ; BF 00 7E 00 | Load from absolute long,X into accumulator
	BMI $00			  ; 30 00 | Branch if negative
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	INC $6C6C,X		  ; FE 6C 6C | Increment (absolute,X)
	INC $6C00,X		  ; FE 00 6C | Increment (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $391E			; 0E 1E 39 | Arithmetic shift left (absolute)
	ASL $625D,X		  ; 1E 5D 62 | Arithmetic shift left (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	STA $0C0074		  ; 8F 74 00 0C | Store accumulator to absolute long address
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_021
; Address: $FB86F6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_021:
	JSR $7C9C			; 20 9C 7C | Jump to subroutine
	SBC $FE02,X		  ; FD 02 FE | Subtract with carry (absolute,X)
	ASL $391E			; 0E 1E 39 | Arithmetic shift left (absolute)
	ASL $625D,X		  ; 1E 5D 62 | Arithmetic shift left (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	STA $0C0070		  ; 8F 70 00 0C | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank76_DmaFunction_023
; Address: $FB8716
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_023:
	JSR $7C9C			; 20 9C 7C | Jump to subroutine
	SBC $FE02,X		  ; FD 02 FE | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)
	ASL $62DD,X		  ; 1E DD 62 | Arithmetic shift left (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PHP				  ; 08 | Push processor status to stack
	ASL $7A01,X		  ; 1E 01 7A | Arithmetic shift left (absolute,X)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	STZ $827C			; 9C 7C 82 | Store zero to absolute
	SBC $FE02,X		  ; FD 02 FE | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $0A6E			; 0D 6E 0A | Logical OR with accumulator (absolute)
	ASL $6ED9,X		  ; 1E D9 6E | Arithmetic shift left (absolute,X)
	ADC $72B3			; 6D B3 72 | Add with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $7F00,X		  ; 1E 00 7F | Arithmetic shift left (absolute,X)
	SBC ($01),Y		  ; F1 01 | Subtract with carry ((zero page),Y)
	REP #$20			 ; C2 20 | Reset processor status bits
	BCC $70			  ; 90 70 | Branch if carry clear
	STY $02FC			; 8C FC 02 | Store Y register to absolute address
	BPL $01			  ; 10 01 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_025
; Address: $FB876C
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_025:
	JSL $000900		  ; 22 00 09 00 | Jump to subroutine long
	STA $2AD573		  ; 8F 73 D5 2A | Store accumulator to absolute long address
	BEQ $0F			  ; F0 0F | Branch if equal
	BVS $0F			  ; 70 0F | Branch if overflow set
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	BRA $3F			  ; 80 3F | Branch always
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHB				  ; 8B | Push data bank register to stack
	BIT $EF			  ; 24 EF | Test bits in accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BRA $3A			  ; 80 3A | Branch always
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_026
; Address: $FB87BD
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_026:
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$8F			 ; E0 8F | Compare X register (immediate)
	BVS $CB			  ; 70 CB | Branch if overflow set
	BPL $E7			  ; 10 E7 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $3C			  ; 80 3C | Branch always
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	CPX #$1A			 ; E0 1A | Compare X register (immediate)
	SEP #$1B			 ; E2 1B | Set processor status bits
	STA ($7E),Y		  ; 91 7E | Store accumulator to (zero page),Y
	SEI				  ; 78 | Set interrupt disable flag
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	INC $7C00,X		  ; FE 00 7C | Increment (absolute,X)
	BRA $3C			  ; 80 3C | Branch always
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PLY				  ; 7A | Pull Y register from stack
	LDA				  ; BF 00 67 34 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank76_DmaFunction_027
; Address: $FB880F
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_027:
	JSL $000800		  ; 22 00 08 00 | Jump to subroutine long
	ASL $7F00,X		  ; 1E 00 7F | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0600,X		  ; 1D 00 06 | Logical OR with accumulator (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	LDA				  ; BF 00 7F 00 | Load from absolute long,X into accumulator
	LDA $EE00,X		  ; BD 00 EE | Load from absolute,X into accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $0F00			; 0E 00 0F | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL $0FF3			; 0E F3 0F | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank76_DmaFunction_028
; Address: $FB88B9
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_028:
	SED				  ; F8 | Set decimal mode flag
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $F7			  ; 10 F7 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPX #$1A			 ; E0 1A | Compare X register (immediate)
	SEP #$00			 ; E2 00 | Set processor status bits
	BPL $01			  ; 10 01 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_02A
; Address: $FB88EC
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_02A:
	JSL $000800		  ; 22 00 08 00 | Jump to subroutine long
	JMP $2F39			; 4C 39 2F | Jump to address
	ORA $5A5E,X		  ; 1D 5E 5A | Logical OR with accumulator (absolute,X)
	ROR $3769			; 6E 69 37 | Rotate right (absolute)
	STA ($7E),Y		  ; 91 7E | Store accumulator to (zero page),Y
	SEC				  ; 38 | Set carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INY				  ; C8 | Increment Y register
	CPY $D221			; CC 21 D2 | Compare Y register (absolute)
	BVS $88			  ; 70 88 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	BRA $FF			  ; 80 FF | Branch always
	INC $3C00,X		  ; FE 00 3C | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	BMI $02			  ; 30 02 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	JMP $7B3230		  ; 5C 30 32 7B | Jump to address long

;------------------------------------------------------------------------------
; Bank76_DmaFunction_02B
; Address: $FB892F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_02B:
	JSL $00FF00		  ; 22 00 FF 00 | Jump to subroutine long
	CMP ($04),Y		  ; D1 04 | Compare accumulator ((zero page),Y)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LDA				  ; BF 00 3F 00 | Load from absolute long,X into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 00 3F 00 | Load from absolute long,X into accumulator
	ORA ($F7,X)		  ; 01 F7 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $1B06,X		  ; 3D 06 1B | Logical AND with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank76_DmaFunction_02C
; Address: $FB8971
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_02C:
	SEP #$1B			 ; E2 1B | Set processor status bits
	LDA ($0F),Y		  ; B1 0F | Load from (zero page),Y into accumulator
	BMI $07			  ; 30 07 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $0F00			; 0E 00 0F | Arithmetic shift left (absolute)
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $F7			  ; 10 F7 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	CPX #$1A			 ; E0 1A | Compare X register (immediate)
	SEP #$1A			 ; E2 1A | Set processor status bits
	SEP #$1B			 ; E2 1B | Set processor status bits
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	ROL				  ; 2A | Rotate left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	JMP $2F39			; 4C 39 2F | Jump to address
	ORA $3E70,X		  ; 1D 70 3E | Logical OR with accumulator (absolute,X)
	CPY $5E			  ; C4 5E | Compare Y register (zero page)
	INC $B47A,X		  ; FE 7A B4 | Increment (absolute,X)
	ADC $3CC3,X		  ; 7D C3 3C | Add with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INY				  ; C8 | Increment Y register
	CPY $8001			; CC 01 80 | Compare Y register (absolute)
	ADC ($80,X)		  ; 61 80 | Add with carry ((zero page,X))
	SBC ($12,X)		  ; E1 12 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BRA $7E			  ; 80 7E | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	CPX $7EE8			; EC E8 7E | Compare X register (absolute)
	STY $068F			; 8C 8F 06 | Store Y register to absolute address
	BPL $28			  ; 10 28 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ASL $07BB			; 0E BB 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	CPX #$0F			 ; E0 0F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_02D
; Address: $FB8A35
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_02D:
	BCS $07			  ; B0 07 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	ORA ($E7,X)		  ; 01 E7 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SBC $BF03,X		  ; FD 03 BF | Subtract with carry (absolute,X)
	ASL $071B			; 0E 1B 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $3F80,X		  ; 7E 80 3F | Rotate right (absolute,X)
	CMP ($1F,X)		  ; C1 1F | Compare accumulator ((zero page,X))
	LDA ($0F,X)		  ; A1 0F | Load from (zero page,X) into accumulator
	BMI $0F			  ; 30 0F | Branch if negative
	BPL $07			  ; 10 07 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($CB,X)		  ; 01 CB | Logical OR with accumulator ((zero page,X))
	SBC $FD02,Y		  ; F9 02 FD | Subtract with carry (absolute,Y)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	DEC $EEEB			; CE EB EE | Decrement (absolute)
	INC $0FFE,X		  ; FE FE 0F | Increment (absolute,X)
	AND ($C9,X)		  ; 21 C9 | Logical AND with accumulator ((zero page,X))
	SBC ($05),Y		  ; F1 05 | Subtract with carry ((zero page),Y)
	BMI $CA			  ; 30 CA | Branch if negative
	BPL $EA			  ; 10 EA | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA #$15			 ; 09 15 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	STX $04			  ; 86 04 | Store X register to zero page
	ASL $1C04			; 0E 04 1C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND $3F10,Y		  ; 39 10 3F | Logical AND with accumulator (absolute,Y)
	ORA ($27),Y		  ; 11 27 | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_02E
; Address: $FB8B20
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_02E:
	STA				  ; 9F 7F 3F FF | Store accumulator to absolute long,X
	DEC $00DF,X		  ; DE DF 00 | Decrement (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_02F
; Address: $FB8B3D
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_02F:
	JSR $D020			; 20 20 D0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BCC $E0			  ; 90 E0 | Game work RAM access
	BEQ $06			  ; F0 06 | Branch if equal
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	STA $FF7FFF		  ; 8F FF 7F FF | Store accumulator to absolute long address
	LDY $08FF,X		  ; BC FF 08 | Load from absolute,X into Y register
	BEQ $10			  ; F0 10 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BEQ $FC			  ; F0 FC | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA $0600,X		  ; 1D 00 06 | Logical OR with accumulator (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	LDA				  ; BF 00 7B 00 | Load from absolute long,X into accumulator
	STA $0600,X		  ; 9D 00 06 | Store accumulator to absolute,X
	ORA $0600,X		  ; 1D 00 06 | Logical OR with accumulator (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	LDA				  ; BF 00 7E 00 | Load from absolute long,X into accumulator
	STX $08			  ; 86 08 | Store X register to zero page
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	STX $00FF			; 8E FF 00 | Store X register to absolute address
	DEY				  ; 88 | Decrement Y register
	BVS $0F			  ; 70 0F | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SBC $F906,X		  ; FD 06 F9 | Subtract with carry (absolute,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	CPY #$E0			 ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank76_DmaFunction_031
; Address: $FB8C2A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_031:
	JSR $10C0			; 20 C0 10 | Jump to subroutine
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $02			  ; 30 02 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	EOR $3230,X		  ; 5D 30 32 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_032
; Address: $FB8C49
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_032:
	JSL $2F394C		  ; 22 4C 39 2F | Jump to subroutine long
	ORA $3E70,X		  ; 1D 70 3E | Logical OR with accumulator (absolute,X)
	CMP ($04),Y		  ; D1 04 | Compare accumulator ((zero page),Y)
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	CPY $8001			; CC 01 80 | Compare Y register (absolute)
	SEC				  ; 38 | Set carry flag
	EOR $3230,X		  ; 5D 30 32 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_033
; Address: $FB8C65
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_033:
	JSL $2F394C		  ; 22 4C 39 2F | Jump to subroutine long
	ORA $3E70,X		  ; 1D 70 3E | Logical OR with accumulator (absolute,X)
	DEC $5A			  ; C6 5A | Decrement (zero page)
	INC $0079,X		  ; FE 79 00 | Increment (absolute,X)
	CMP ($04),Y		  ; D1 04 | Compare accumulator ((zero page),Y)
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	CPY $8001			; CC 01 80 | Compare Y register (absolute)
	ADC ($82,X)		  ; 61 82 | Add with carry ((zero page,X))
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	ASL $0101			; 0E 01 01 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_034
; Address: $FB8C88
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_034:
	BCS $60			  ; B0 60 | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $88			  ; F0 88 | Branch if equal
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_035
; Address: $FB8C9B
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_035:
	BRA $B0			  ; 80 B0 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	PEA #$DEC0		   ; F4 C0 DE | Push effective address to stack
	DEC $DA2F,X		  ; DE 2F DA | Decrement (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_036
; Address: $FB8CE3
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_036:
	BRA $41			  ; 80 41 | Branch always
	BRA $D9			  ; 80 D9 | Branch always
	CPX #$9C			 ; E0 9C | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	STY $DE70			; 8C 70 DE | Store Y register to absolute address
	DEC $DA2F,X		  ; DE 2F DA | Decrement (absolute,X)
	PHX				  ; DA | Push X register to stack
	PHX				  ; DA | Push X register to stack
	DEC $5A			  ; C6 5A | Decrement (zero page)
	INC $B679,X		  ; FE 79 B6 | Increment (absolute,X)
	STA ($7E),Y		  ; 91 7E | Store accumulator to (zero page),Y
	SEC				  ; 38 | Set carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC ($82,X)		  ; 61 82 | Add with carry ((zero page,X))
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $7E			  ; 80 7E | Branch always
	BRA $3C			  ; 80 3C | Branch always
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$1A			 ; C0 1A | Compare Y register (immediate)
	SEP #$B6			 ; E2 B6 | Set processor status bits
	STA ($7E),Y		  ; 91 7E | Store accumulator to (zero page),Y
	SEC				  ; 38 | Set carry flag
	BPL $77			  ; 10 77 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	BRA $7E			  ; 80 7E | Branch always
	BRA $3C			  ; 80 3C | Branch always
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	CPX #$1A			 ; E0 1A | Compare X register (immediate)
	SEP #$1B			 ; E2 1B | Set processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_038
; Address: $FB8D81
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_038:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $073B			; 0E 3B 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	SEP #$1F			 ; E2 1F | Set processor status bits
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	LDY #$0F			 ; A0 0F | Load immediate value into Y register
	BMI $07			  ; 30 07 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_039
; Address: $FB8DCD
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_039:
	SEC				  ; 38 | Set carry flag
	ORA $00E6,Y		  ; 19 E6 00 | Logical OR with accumulator (absolute,Y)
	ROR $FF7E,X		  ; 7E 7E FF | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	BRA $79			  ; 80 79 | Branch always
	SBC ($10,X)		  ; E1 10 | Subtract with carry ((zero page,X))
	ORA $0602,Y		  ; 19 02 06 | Logical OR with accumulator (absolute,Y)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	STA $7B84,X		  ; 9D 84 7B | Store accumulator to absolute,X
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_03A
; Address: $FB8E63
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_03A:
	BRA $33			  ; 80 33 | Branch always
	CPY #$37			 ; C0 37 | Compare Y register (immediate)
	LDA $3E5E5F		  ; AF 5F 5E 3E | Load from absolute long address into accumulator
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F1			  ; F0 F1 | Branch if equal
	CPX #$E3			 ; E0 E3 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	BRA $79			  ; 80 79 | Branch always
	SBC ($10,X)		  ; E1 10 | Subtract with carry ((zero page,X))
	ORA $0002,Y		  ; 19 02 00 | Logical OR with accumulator (absolute,Y)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	ORA $62E6,Y		  ; 19 E6 62 | Logical OR with accumulator (absolute,Y)
	STA $7B84,X		  ; 9D 84 7B | Store accumulator to absolute,X
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	ROR $FF7E,X		  ; 7E 7E FF | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ROL $3CCE,X		  ; 3E CE 3C | Rotate left (absolute,X)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_03B
; Address: $FB8EF8
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_03B:
	CPY #$C1			 ; C0 C1 | Compare Y register (immediate)
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	SBC ($E6,X)		  ; E1 E6 | Subtract with carry ((zero page,X))
	CPX $00			  ; E4 00 | Compare X register (zero page)
	SEC				  ; 38 | Set carry flag
	LSR $A33F,X		  ; 5E 3F A3 | Logical shift right (absolute,X)
	SBC $007F,Y		  ; F9 7F 00 | Subtract with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F 7F 3F FF | Store accumulator to absolute long,X
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	EOR ($31),Y		  ; 51 31 | Exclusive OR with accumulator ((zero page),Y)
	ADC ($31),Y		  ; 71 31 | Add with carry ((zero page),Y)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPX $FE1E			; EC 1E FE | Compare X register (absolute)
	STZ $BF7E,X		  ; 9E 7E BF | Store zero to absolute,X
	LDA				  ; BF 7F 3F FF | Load from absolute long,X into accumulator
	ROL $3FFE,X		  ; 3E FE 3F | Rotate left (absolute,X)
	SBC ($EE,X)		  ; E1 EE | Subtract with carry ((zero page,X))
	EOR ($4E,X)		  ; 41 4E | Exclusive OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $0E07			; 0E 07 0E | Arithmetic shift left (absolute)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ADC $E700			; 6D 00 E7 | Add with carry (absolute)
	CMP $D9FE,X		  ; DD FE D9 | Compare accumulator (absolute,X)
	INC $ECD2,X		  ; FE D2 EC | Increment (absolute,X)
	LDY $0040			; AC 40 00 | Load from absolute address into Y register
	PHP				  ; 08 | Push processor status to stack
	STZ $00			  ; 64 00 | Store zero to zero page
	CLD				  ; D8 | Clear decimal mode flag
	JMP $00FC00		  ; 5C 00 FC 00 | Jump to address long
	CPX $7000			; EC 00 70 | Compare X register (absolute)
	BVS $3F			  ; 70 3F | Branch if overflow set
	REP #$3D			 ; C2 3D | Reset processor status bits

;------------------------------------------------------------------------------
; Bank76_DmaFunction_03C
; Address: $FB9006
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_03C:
	SEP #$DD			 ; E2 DD | Set processor status bits
	INC $F9			  ; E6 F9 | Increment (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC ($C9),Y		  ; F1 C9 | Subtract with carry ((zero page),Y)
	BMI $30			  ; 30 30 | Branch if negative
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $7F			  ; 80 7F | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SBC #$70			 ; E9 70 | Subtract with carry (immediate)
	INX				  ; E8 | Increment X register
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank76_DmaFunction_03D
; Address: $FB907B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_03D:
	JSR $4000			; 20 00 40 | Jump to subroutine
	ROL $7F07,X		  ; 3E 07 7F | Rotate left (absolute,X)
	SBC $67			  ; E5 67 | Subtract with carry (zero page)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_03E
; Address: $FB90E2
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_03E:
	CLC				  ; 18 | Clear carry flag
	ASL $0A07			; 0E 07 0A | Arithmetic shift left (absolute)
	ASL $1C0F,X		  ; 1E 0F 1C | Arithmetic shift left (absolute,X)
	ORA #$13			 ; 09 13 | Logical OR with accumulator (immediate)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	BPL $0C			  ; 10 0C | Branch if positive
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	BNE $E0			  ; D0 E0 | Game work RAM access
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $E8			  ; B0 E8 | Branch if carry set
	INX				  ; E8 | Increment X register
	CPX #$B4			 ; E0 B4 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_03F
; Address: $FB9139
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_03F:
	BRA $FC			  ; 80 FC | Branch always
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $3F			  ; 70 3F | Branch if overflow set
	AND $3C63,X		  ; 3D 63 3C | Logical AND with accumulator (absolute,X)
	WDM #$3C			 ; 42 3C | Reserved instruction
	WDM #$3C			 ; 42 3C | Reserved instruction
	REP #$3C			 ; C2 3C | Reset processor status bits
	SEP #$DC			 ; E2 DC | Set processor status bits
	INC $F8			  ; E6 F8 | Increment (zero page)
	BRA $40			  ; 80 40 | Branch always
	BRA $7F			  ; 80 7F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_040
; Address: $FB918A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_040:
	CLC				  ; 18 | Clear carry flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ASL $1F7B			; 0E 7B 1F | Arithmetic shift left (absolute)
	PHX				  ; DA | Push X register to stack
	SBC $E8D5,X		  ; FD D5 E8 | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$7D			 ; C0 7D | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $B0			  ; F0 B0 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank76_DmaFunction_041
; Address: $FB91CA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_041:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BVS $3F			  ; 70 3F | Branch if overflow set
	AND $3C63,X		  ; 3D 63 3C | Logical AND with accumulator (absolute,X)
	WDM #$3C			 ; 42 3C | Reserved instruction
	WDM #$3C			 ; 42 3C | Reserved instruction
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_042
; Address: $FB9200
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_042:
	BVS $3F			  ; 70 3F | Branch if overflow set
	AND $3C63,X		  ; 3D 63 3C | Logical AND with accumulator (absolute,X)
	WDM #$3C			 ; 42 3C | Reserved instruction
	PHY				  ; 5A | Push Y register to stack
	AND $3C1E,Y		  ; 39 1E 3C | Logical AND with accumulator (absolute,Y)
	ROL $001F,X		  ; 3E 1F 00 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_043
; Address: $FB921D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_043:
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	BRA $7F			  ; 80 7F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_044
; Address: $FB922A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_044:
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_047
; Address: $FB9260
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_047:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	BEQ $D0			  ; F0 D0 | Branch if equal
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_049
; Address: $FB9293
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_049:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $C8			  ; 10 C8 | Branch if positive
	BCS $B8			  ; B0 B8 | Branch if carry set
	ROL $1E1F,X		  ; 3E 1F 1E | Rotate left (absolute,X)
	ASL $1E0F,X		  ; 1E 0F 1E | Arithmetic shift left (absolute,X)
	ASL $0C07			; 0E 07 0C | Arithmetic shift left (absolute)
	ASL $1D07			; 0E 07 1D | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0080			; 0D 80 00 | Logical OR with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_04A
; Address: $FB92CD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_04A:
	RTI				  ; 40 | Return from interrupt
	BNE $E0			  ; D0 E0 | Game work RAM access
	BRA $40			  ; 80 40 | Branch always
	BRA $1D			  ; 80 1D | Branch always
	ORA $0D0E,X		  ; 1D 0E 0D | Logical OR with accumulator (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_04B
; Address: $FB92F0
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_04B:
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDY $D8			  ; A4 D8 | Load from zero page into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	AND $2D1F			; 2D 1F 2D | Logical AND with accumulator (absolute)
	ASL $143A,X		  ; 1E 3A 14 | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BCC $E0			  ; 90 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank76_DmaFunction_04C
; Address: $FB9342
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_04C:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	AND $673D,X		  ; 3D 3D 67 | Logical AND with accumulator (absolute,X)
	DEC $BAEE,X		  ; DE EE BA | Decrement (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative
	WDM #$42			 ; 42 42 | Hardware register operation
	STA $2698,Y		  ; 99 98 26 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank76_DmaFunction_04D
; Address: $FB939B
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_04D:
	JSR $414B			; 20 4B 41 | Jump to subroutine
	WDM #$00			 ; 42 00 | Reserved instruction
	CPX #$A8			 ; E0 A8 | Compare X register (immediate)
	ROR $FFEF,X		  ; 7E EF FF | Rotate right (absolute,X)
	LDA $BFBF,X		  ; BD BF BF | Load from absolute,X into accumulator
	CMP $2503,Y		  ; D9 03 25 | Compare accumulator (absolute,Y)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	AND $24			  ; 25 24 | Logical AND with accumulator (zero page)
	CMP $00D8,Y		  ; D9 D8 00 | Compare accumulator (absolute,Y)
	ASL $868B			; 0E 8B 86 | Arithmetic shift left (absolute)
	ROR $D5C7			; 6E C7 D5 | Rotate right (absolute)
	JMP ($B4EA)		  ; 6C EA B4 | Jump to address (absolute indirect)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	WDM #$02			 ; 42 02 | Reserved instruction
	LDA ($01,X)		  ; A1 01 | Load from (zero page,X) into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_04F
; Address: $FB93E8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_04F:
	BEQ $C0			  ; F0 C0 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	BCC $38			  ; 90 38 | Branch if carry clear
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_054
; Address: $FB93FC
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_054:
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $E51E,X		  ; 7E 1E E5 | Rotate right (absolute,X)
	ADC $F3B8,Y		  ; 79 B8 F3 | Add with carry (absolute,Y)
	INC $FE4E,X		  ; FE 4E FE | Increment (absolute,X)
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	ASL $00C0			; 0E C0 00 | Arithmetic shift left (absolute)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	LDX $80FF,Y		  ; BE FF 80 | Load from absolute,Y into X register
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	LSR $0040			; 4E 40 00 | Logical shift right (absolute)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	PLB				  ; AB | Pull data bank register from stack
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STZ $6D9E,X		  ; 9E 9E 6D | Store zero to absolute,X
	ADC $04A4			; 6D A4 04 | Add with carry (absolute)
	PHY				  ; 5A | Push Y register to stack
	LDY #$15			 ; A0 15 | Load immediate value into Y register
	INC				  ; 1A | Increment accumulator
	BRA $C0			  ; 80 C0 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_055
; Address: $FB948C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_055:
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	BEQ $D8			  ; F0 D8 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_057
; Address: $FB949A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_057:
	BCC $90			  ; 90 90 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	STY $00			  ; 84 00 | Store Y register to zero page
	ASL $EF0C			; 0E 0C EF | Arithmetic shift left (absolute)
	ROL $17F7			; 2E F7 17 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_058
; Address: $FB94BA
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_058:
	BEQ $20			  ; F0 20 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BPL $FC			  ; 10 FC | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $0F07			; 0D 07 0F | Logical OR with accumulator (absolute)
	ORA $0D07			; 0D 07 0D | Logical OR with accumulator (absolute)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	CMP $F65A,Y		  ; D9 5A F6 | Compare accumulator (absolute,Y)
	BNE $F8			  ; D0 F8 | Branch if not equal
	BEQ $F1			  ; F0 F1 | Branch if equal
	LDY #$E1			 ; A0 E1 | Load immediate value into Y register
	CPY #$E2			 ; C0 E2 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY $82			  ; C4 82 | Compare Y register (zero page)
	CPY $03			  ; C4 03 | Compare Y register (zero page)
	LDY $58A4,X		  ; BC A4 58 | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	ORA #$DB			 ; 09 DB | Logical OR with accumulator (immediate)
	LDX $693F,Y		  ; BE 3F 69 | Load from absolute,Y into X register
	LDX $FA1F,Y		  ; BE 1F FA | Load from absolute,Y into X register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP $1042			; 4C 42 10 | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$B4			 ; A0 B4 | Load immediate value into Y register
	SBC $31FF			; ED FF 31 | Subtract with carry (absolute)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	BCC $F7			  ; 90 F7 | Branch if carry clear
	INC $AFFF,X		  ; FE FF AF | Increment (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	JMP $12125C		  ; 5C 5C 12 12 | Jump to address long
	DEC $3BCE			; CE CE 3B | Decrement (absolute)
	EOR ($A1),Y		  ; 51 A1 | Exclusive OR with accumulator ((zero page),Y)
	TAX				  ; AA | Transfer accumulator to X register
	EOR $2056,X		  ; 5D 56 20 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_05B
; Address: $FB9548
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_05B:
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BEQ $9C			  ; F0 9C | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	ORA $3F07			; 0D 07 3F | Logical OR with accumulator (absolute)
	ASL $397F			; 0E 7F 39 | Arithmetic shift left (absolute)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	ROR $F4FC,X		  ; 7E FC F4 | Rotate right (absolute,X)
	CPX $B4			  ; E4 B4 | Compare X register (zero page)
	BNE $70			  ; D0 70 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_05C
; Address: $FB9589
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_05C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($42,X)		  ; 01 42 | Hardware register operation
	LDY #$54			 ; A0 54 | Load immediate value into Y register
	BCS $50			  ; B0 50 | Branch if carry set

;------------------------------------------------------------------------------
; Bank76_DmaFunction_05D
; Address: $FB9597
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_05D:
	JSR $0020			; 20 20 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $6FF7,X		  ; 1D F7 6F | Logical OR with accumulator (absolute,X)
	BVS $70			  ; 70 70 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $F0			  ; 80 F0 | Branch always
	INY				  ; C8 | Increment Y register
	SBC $0137,X		  ; FD 37 01 | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $030E			; 0E 0E 03 | Arithmetic shift left (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	BIT $B63C			; 2C 3C B6 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_05E
; Address: $FB95E7
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_05E:
	LSR				  ; 4A | Logical shift right (accumulator)
	STX $862E			; 8E 2E 86 | Store X register to absolute address
	EOR $06			  ; 45 06 | Exclusive OR with accumulator (zero page)
	CMP $B2			  ; C5 B2 | Compare accumulator (zero page)
	REP #$EA			 ; C2 EA | Reset processor status bits
	REP #$51			 ; C2 51 | Reset processor status bits
	ADC ($B9,X)		  ; 61 B9 | Add with carry ((zero page,X))
	LDA ($55),Y		  ; B1 55 | Load from (zero page),Y into accumulator
	EOR $383C,Y		  ; 59 3C 38 | Exclusive OR with accumulator (absolute,Y)
	NOP				  ; EA | No operation
	CPX $380C			; EC 0C 38 | Compare X register (absolute)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ADC $3D05,X		  ; 7D 05 3D | Add with carry (absolute,X)
	ORA $3D			  ; 05 3D | Logical OR with accumulator (zero page)
	ORA $3D			  ; 05 3D | Logical OR with accumulator (zero page)
	ORA $3D			  ; 05 3D | Logical OR with accumulator (zero page)
	ORA $0D7D			; 0D 7D 0D | Logical OR with accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ORA $887C,Y		  ; 19 7C 88 | Logical OR with accumulator (absolute,Y)
	ROR $3E84,X		  ; 7E 84 3E | Rotate right (absolute,X)
	ROL $3E44,X		  ; 3E 44 3E | Rotate left (absolute,X)
	ROL $7E4C,X		  ; 3E 4C 7E | Rotate left (absolute,X)
	STY $987E			; 8C 7E 98 | Store Y register to absolute address
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	ORA $181E,Y		  ; 19 1E 18 | Logical OR with accumulator (absolute,Y)
	AND $3E1C			; 2D 1C 3E | Logical AND with accumulator (absolute)
	ASL $0811,X		  ; 1E 11 08 | Arithmetic shift left (absolute,X)
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	BPL $1C			  ; 10 1C | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_05F
; Address: $FB9672
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_05F:
	JSR $5220			; 20 20 52 | Jump to subroutine
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $0F0E			; 0E 0E 0F | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $F6			  ; 30 F6 | Branch if negative
	ROL $0CE0,X		  ; 3E E0 0C | Rotate left (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_060
; Address: $FB9697
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_060:
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STY $84			  ; 84 84 | Store Y register to zero page
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA $0F03			; 0D 03 0F | Logical OR with accumulator (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BIT #$07			 ; 89 07 | Test bits in accumulator (immediate)
	BIT #$05			 ; 89 05 | Test bits in accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	BCC $0F			  ; 90 0F | Branch if carry clear
	BVC $87			  ; 50 87 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	TXA				  ; 8A | Transfer X register to accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDX $78E8,Y		  ; BE E8 78 | Load from absolute,Y into X register
	ADC ($A6),Y		  ; 71 A6 | Add with carry ((zero page),Y)
	SEP #$4C			 ; E2 4C | Set processor status bits
	SEP #$4C			 ; E2 4C | Set processor status bits
	DEX				  ; CA | Decrement X register
	SBC ($7C,X)		  ; E1 7C | Subtract with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	STZ $0921			; 9C 21 09 | Store zero to absolute
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BVC $10			  ; 50 10 | Branch if overflow clear
	BPL $50			  ; 10 50 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_061
; Address: $FB971A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_061:
	JSR $6220			; 20 20 62 | Jump to subroutine
	ORA #$B9			 ; 09 B9 | Logical OR with accumulator (immediate)
	ASL $7A			  ; 06 7A | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	STA $84			  ; 85 84 | Store accumulator to zero page
	WDM #$28			 ; 42 28 | Reserved instruction

;------------------------------------------------------------------------------
; Bank76_DmaFunction_062
; Address: $FB9737
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_062:
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	EOR $F818,Y		  ; 59 18 F8 | Exclusive OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	INC $6EF4,X		  ; FE F4 6E | Increment (absolute,X)
	PHX				  ; DA | Push X register to stack
	CPX $3CFA			; EC FA 3C | Compare X register (absolute)
	LDY $78E6			; AC E6 78 | Load from absolute address into Y register
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	BVC $11			  ; 50 11 | Branch if overflow clear
	STA ($02),Y		  ; 91 02 | Store accumulator to (zero page),Y
	ORA ($42,X)		  ; 01 42 | Hardware register operation
	STA ($92,X)		  ; 81 92 | Store accumulator to (zero page,X)
	ORA ($46),Y		  ; 11 46 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0008,X		  ; 1E 08 00 | Arithmetic shift left (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BMI $30			  ; 30 30 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF F4 7C D1 | Load from absolute long,X into accumulator
	BVS $A3			  ; 70 A3 | Branch if overflow set
	BVS $A7			  ; 70 A7 | Branch if overflow set
	ADC ($CE,X)		  ; 61 CE | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_063
; Address: $FB97B0
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_063:
	JSR $0E20			; 20 20 0E | Jump to subroutine
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA $20			  ; 05 20 | Logical OR with accumulator (zero page)
	WDM #$12			 ; 42 12 | Reserved instruction
	BIT $080C			; 2C 0C 08 | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $10			  ; 50 10 | Branch if overflow clear
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ROL $0F2F			; 2E 2F 0F | Rotate left (absolute)
	ORA $3E01,X		  ; 1D 01 3E | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_064
; Address: $FB97D1
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_064:
	ROL $6BEB,X		  ; 3E EB 6B | Rotate left (absolute,X)
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ADC $1E7E,X		  ; 7D 7E 1E | Add with carry (absolute,X)
	CPY $E378			; CC 78 E3 | Compare Y register (absolute)
	INC $1FF0,X		  ; FE F0 1F | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	LDA				  ; BF CD EF F9 | Load from absolute long,X into accumulator
	STY $83			  ; 84 83 | Store Y register to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BNE $D0			  ; D0 D0 | Branch if not equal
	STZ $64			  ; 64 64 | Store zero to zero page
	ROL $C6			  ; 26 C6 | Rotate left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	BRA $5D			  ; 80 5D | Branch always
	BRA $81			  ; 80 81 | Branch always
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	SBC $007F,Y		  ; F9 7F 00 | Subtract with carry (absolute,Y)
	ROR $FADF,X		  ; 7E DF FA | Rotate right (absolute,X)
	ROR $FEFD			; 6E FD FE | Rotate right (absolute)
	SBC $FCA6,X		  ; FD A6 FC | Subtract with carry (absolute,X)
	BMI $F8			  ; 30 F8 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_065
; Address: $FB9834
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_065:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA $30			  ; 05 30 | Logical OR with accumulator (zero page)
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	LSR $7970			; 4E 70 79 | Logical shift right (absolute)
	LSR $0C3B,X		  ; 5E 3B 0C | Logical shift right (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	LDX $A0			  ; A6 A0 | Load from zero page into X register
	BVS $70			  ; 70 70 | Branch if overflow set
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank76_DmaFunction_068
; Address: $FB9886
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_068:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	STA ($03,X)		  ; 81 03 | Store accumulator to (zero page,X)
	CMP ($03,X)		  ; C1 03 | Compare accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_069
; Address: $FB98A6
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_069:
	AND ($03),Y		  ; 31 03 | Logical AND with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	STZ $64			  ; 64 64 | Store zero to zero page
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BVC $83			  ; 50 83 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BRA $44			  ; 80 44 | Branch always
	BRA $42			  ; 80 42 | Hardware register operation
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STX $06			  ; 86 06 | Store X register to zero page
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX $CF			  ; E4 CF | Compare X register (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_06A
; Address: $FB98E3
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_06A:
	STX $6070			; 8E 70 60 | Store X register to absolute address
	SEC				  ; 38 | Set carry flag
	CMP $D7AB			; CD AB D7 | Compare accumulator (absolute)
	LDA $B76F,X		  ; BD 6F B7 | Load from absolute,X into accumulator
	BNE $10			  ; D0 10 | Branch if not equal
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	STA $02C414		  ; 8F 14 C4 02 | Store accumulator to absolute long address
	REP #$09			 ; C2 09 | Reset processor status bits
	DEX				  ; CA | Decrement X register
	CLI				  ; 58 | Clear interrupt disable flag
	AND $F57E			; 2D 7E F5 | Logical AND with accumulator (absolute)
	STZ $D8F7			; 9C F7 D8 | Store zero to absolute
	CMP ($6F),Y		  ; D1 6F | Compare accumulator ((zero page),Y)
	CMP ($69),Y		  ; D1 69 | Compare accumulator ((zero page),Y)
	SBC ($D6,X)		  ; E1 D6 | Subtract with carry ((zero page,X))
	CMP ($D4),Y		  ; D1 D4 | Compare accumulator ((zero page),Y)
	STZ $94			  ; 64 94 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_06C
; Address: $FB991B
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_06C:
	JSR $2646			; 20 46 26 | Jump to subroutine
	CPX $F894			; EC 94 F8 | Compare X register (absolute)
	JMP $88F0			; 4C F0 88 | Jump to address
	CPX #$19			 ; E0 19 | Compare X register (immediate)
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	BRA $CB			  ; 80 CB | Branch always
	TXA				  ; 8A | Transfer X register to accumulator
	BPL $E6			  ; 10 E6 | Branch if positive
	PEA #$0284		   ; F4 84 02 | Push effective address to stack
	ORA $3B15,Y		  ; 19 15 3B | Logical OR with accumulator (absolute,Y)
	LSR $74			  ; 46 74 | Logical shift right (zero page)
	SBC $09ED			; ED ED 09 | Subtract with carry (absolute)
	ORA #$38			 ; 09 38 | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_06D
; Address: $FB9944
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_06D:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_06F
; Address: $FB9952
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_06F:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDX $CC61,Y		  ; BE 61 CC | Load from absolute,Y into X register
	INC $32			  ; E6 32 | Increment (zero page)
	AND $1897,Y		  ; 39 97 18 | Logical AND with accumulator (absolute,Y)
	BIT #$1E			 ; 89 1E | Test bits in accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_070
; Address: $FB998F
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_070:
	JSL $520030		  ; 22 30 00 52 | Jump to subroutine long
	EOR #$29			 ; 49 29 | Exclusive OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	BVC $6E			  ; 50 6E | Branch if overflow clear
	ROR $A3			  ; 66 A3 | Rotate right (zero page)
	LDA #$D0			 ; A9 D0 | Load immediate value into accumulator
	CLV				  ; B8 | Clear overflow flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $01			  ; 80 01 | Branch always
	CMP ($07),Y		  ; D1 07 | Compare accumulator ((zero page),Y)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	LDA				  ; BF 8F FF FF | Load from absolute long,X into accumulator
	ROL $D8DE			; 2E DE D8 | Rotate left (absolute)
	STZ $4717,X		  ; 9E 17 47 | Store zero to absolute,X
	ORA $31			  ; 05 31 | Logical OR with accumulator (zero page)
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_071
; Address: $FB99C9
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_071:
	BPL $7B			  ; 10 7B | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	LDY #$C4			 ; A0 C4 | Load immediate value into Y register
	BRA $88			  ; 80 88 | Branch always
	BNE $62			  ; D0 62 | Branch if not equal
	CLV				  ; B8 | Clear overflow flag
	LDA $CFCE,X		  ; BD CE CF | Load from absolute,X into accumulator
	CPX $8C			  ; E4 8C | Compare X register (zero page)
	STY $382C			; 8C 2C 38 | Store Y register to absolute address
	CLV				  ; B8 | Clear overflow flag
	PLB				  ; AB | Pull data bank register from stack
	ORA ($9E),Y		  ; 11 9E | Logical OR with accumulator ((zero page),Y)
	INC $7B7E,X		  ; FE 7E 7B | Increment (absolute,X)
	BVC $FC			  ; 50 FC | Branch if overflow clear
	INC $88EE			; EE EE 88 | Increment (absolute)
	PHP				  ; 08 | Push processor status to stack
	STY $D4			  ; 84 D4 | Store Y register to zero page
	PLX				  ; FA | Pull X register from stack
	JMP $38E4			; 4C E4 38 | Jump to address
	DEY				  ; 88 | Decrement Y register
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCS $B0			  ; B0 B0 | Branch if carry set
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0E0A			; 0E 0A 0E | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	AND $3127,Y		  ; 39 27 31 | Logical AND with accumulator (absolute,Y)
	ADC ($B3,X)		  ; 61 B3 | Add with carry ((zero page,X))
	CMP ($C3,X)		  ; C1 C3 | Compare accumulator ((zero page,X))
	STA ($83,X)		  ; 81 83 | Store accumulator to (zero page,X)
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	ORA ($21),Y		  ; 11 21 | PPU graphics register access
	AND ($44,X)		  ; 21 44 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_072
; Address: $FB9AB6
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_072:
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BCC $90			  ; 90 90 | Branch if carry clear
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	BEQ $D8			  ; F0 D8 | Branch if equal
	SEP #$D5			 ; E2 D5 | Set processor status bits
	ADC $73			  ; 65 73 | Add with carry (zero page)
	SBC $B4E9,X		  ; FD E9 B4 | Subtract with carry (absolute,X)
	SBC $7670,Y		  ; F9 70 76 | Subtract with carry (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR $A8CC,X		  ; 5E CC A8 | Logical shift right (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	ORA $E5			  ; 05 E5 | Logical OR with accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BVC $21			  ; 50 21 | PPU graphics register access
	ASL $76			  ; 06 76 | Arithmetic shift left (zero page)
	BPL $08			  ; 10 08 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_073
; Address: $FB9AFE
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_073:
	JSR $822C			; 20 2C 82 | Jump to subroutine
	CMP ($A2,X)		  ; C1 A2 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	WDM #$BC			 ; 42 BC | Reserved instruction
	ORA $1E5D,X		  ; 1D 5D 1E | Logical OR with accumulator (absolute,X)
	BVC $98			  ; 50 98 | Branch if overflow clear
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $72			  ; 30 72 | Branch if negative
	ORA $4EE8			; 0D E8 4E | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $5C28			; CC 28 5C | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STA $E76B,X		  ; 9D 6B E7 | Store accumulator to absolute,X
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_076
; Address: $FB9B39
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_076:
	JSR $0000			; 20 00 00 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $7000			; 8E 00 70 | Store X register to absolute address
	CLD				  ; D8 | Clear decimal mode flag
	INC $70FE,X		  ; FE FE 70 | Increment (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_077
; Address: $FB9BC6
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_077:
	BRA $00			  ; 80 00 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	BCS $30			  ; B0 30 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_078
; Address: $FB9C43
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_078:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	INY				  ; C8 | Increment Y register
	INC $FFF4,X		  ; FE F4 FF | Increment (absolute,X)
	INC $FB7F,X		  ; FE 7F FB | Increment (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $001A,X		  ; FE 1A 00 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_079
; Address: $FB9C7E
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_079:
	JSR $0020			; 20 20 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND $693B,Y		  ; 39 3B 69 | Logical AND with accumulator (absolute,Y)
	ADC $1F3A,X		  ; 7D 3A 1F | Add with carry (absolute,X)
	LSR $0202,X		  ; 5E 02 02 | Logical shift right (absolute,X)
	AND $4A04,X		  ; 3D 04 4A | Logical AND with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($42),Y		  ; 11 42 | Hardware register operation
	AND $6893,Y		  ; 39 93 68 | Logical AND with accumulator (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	STX $82			  ; 86 82 | Store X register to zero page
	REP #$CE			 ; C2 CE | Reset processor status bits
	STY $CE			  ; 84 CE | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX $640B			; EC 0B 64 | Compare X register (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PHB				  ; 8B | Push data bank register to stack
	AND $3C67,X		  ; 3D 67 3C | Logical AND with accumulator (absolute,X)
	JMP $93030F		  ; 5C 0F 03 93 | Jump to address long
	BNE $27			  ; D0 27 | Branch if not equal

;------------------------------------------------------------------------------
; Bank76_DmaFunction_07A
; Address: $FB9CF7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_07A:
	CPY #$C4			 ; C0 C4 | Compare Y register (immediate)
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_07B
; Address: $FB9CFD
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_07B:
	LDA ($F3,X)		  ; A1 F3 | Load from (zero page,X) into accumulator
	ROR $5E			  ; 66 5E | Rotate right (zero page)
	JMP ($B88F)		  ; 6C 8F B8 | Jump to address (absolute indirect)
	LDX $FC50			; AE 50 FC | Load from absolute address into X register
	DEY				  ; 88 | Decrement Y register
	PLP				  ; 28 | Pull processor status from stack
	PHY				  ; 5A | Push Y register to stack
	BCC $40			  ; 90 40 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	LDA $20FC20		  ; AF 20 FC 20 | Load from absolute long address into accumulator
	BVC $00			  ; 50 00 | Branch if overflow clear
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STA $8B			  ; 85 8B | Store accumulator to zero page
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	LSR $3D7E			; 4E 7E 3D | Logical shift right (absolute)
	INC $CF77,X		  ; FE 77 CF | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	LSR $38			  ; 46 38 | Logical shift right (zero page)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	BMI $20			  ; 30 20 | Branch if negative
	INY				  ; C8 | Increment Y register
	ORA $C406,Y		  ; 19 06 C4 | Logical OR with accumulator (absolute,Y)
	STA $DFDF8F		  ; 8F 8F DF DF | Store accumulator to absolute long address
	BNE $9F			  ; D0 9F | Branch if not equal
	CPY #$5F			 ; C0 5F | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA $BF5F1F		  ; 8F 1F 5F BF | Store accumulator to absolute long address
	LDA				  ; BF 1F 30 9F | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank76_DmaFunction_07C
; Address: $FB9D7D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_07C:
	JSR $A05F			; 20 5F A0 | Jump to subroutine
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $FE			  ; F0 FE | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FF3F,X		  ; FE 3F FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $F0			  ; 30 F0 | Branch if negative
	INC $F1EE			; EE EE F1 | Increment (absolute)
	SBC ($F8),Y		  ; F1 F8 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	INC $FF3E,X		  ; FE 3E FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_07D
; Address: $FB9DA9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_07D:
	BRA $00			  ; 80 00 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_07F
; Address: $FB9DBA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_07F:
	BPL $10			  ; 10 10 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	ORA $5F38,X		  ; 1D 38 5F | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_080
; Address: $FB9DD2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_080:
	JSR $0400			; 20 00 04 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $20			  ; 90 20 | Branch if carry clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	BVS $D0			  ; 70 D0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_081
; Address: $FB9DED
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_081:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BCS $30			  ; B0 30 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_083
; Address: $FB9E20
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_083:
	SBC $FC0D,X		  ; FD 0D FC | Subtract with carry (absolute,X)
	INC $FE06,X		  ; FE 06 FE | Increment (absolute,X)
	ROR $3E02,X		  ; 7E 02 3E | Rotate right (absolute,X)
	ROL $1E02,X		  ; 3E 02 1E | Rotate left (absolute,X)
	ORA $04FF			; 0D FF 04 | Logical OR with accumulator (absolute)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	WDM #$3F			 ; 42 3F | Reserved instruction
	WDM #$1F			 ; 42 1F | Reserved instruction

;------------------------------------------------------------------------------
; Bank76_DmaFunction_084
; Address: $FB9E3F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_084:
	JSL $C0E080		  ; 22 80 E0 C0 | Jump to subroutine long
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_085
; Address: $FB9E4C
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_085:
	BMI $38			  ; 30 38 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	AND $2C7F			; 2D 7F 2C | Logical AND with accumulator (absolute)
	ROL $0E0C,X		  ; 3E 0C 0E | Rotate left (absolute,X)
	ASL $0404			; 0E 04 04 | Arithmetic shift left (absolute)
	AND $0A			  ; 25 0A | Logical AND with accumulator (zero page)
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	ORA $28			  ; 05 28 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	STZ $9C08			; 9C 08 9C | Store zero to absolute
	PHP				  ; 08 | Push processor status to stack
	STZ $1C08			; 9C 08 1C | Store zero to absolute
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0C04			; 0E 04 0C | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	ADC #$2E			 ; 69 2E | Add with carry (immediate)
	LDX $8F99,Y		  ; BE 99 8F | Load from absolute,Y into X register
	ORA $7E0C			; 0D 0C 7E | Logical OR with accumulator (absolute)
	BVS $7B			  ; 70 7B | Branch if overflow set
	ADC $BCA9,Y		  ; 79 A9 BC | Add with carry (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	ASL $0730			; 0E 30 07 | Arithmetic shift left (absolute)
	STA ($16,X)		  ; 81 16 | Store accumulator to (zero page,X)
	BVS $8F			  ; 70 8F | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_086
; Address: $FB9EE7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_086:
	PHY				  ; 5A | Push Y register to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $60			  ; 90 60 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank76_DmaFunction_088
; Address: $FB9EF2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_088:
	STZ $309E,X		  ; 9E 9E 30 | Store zero to absolute,X
	BMI $A5			  ; 30 A5 | Branch if negative
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	BRA $80			  ; 80 80 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	ORA ($A4,X)		  ; 01 A4 | Logical OR with accumulator ((zero page,X))
	EOR #$A4			 ; 49 A4 | Exclusive OR with accumulator (immediate)
	SEP #$18			 ; E2 18 | Set processor status bits
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_089
; Address: $FB9F16
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_089:
	JSR $1220			; 20 20 12 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BRA $FD			  ; 80 FD | Branch always
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0404			; 0E 04 04 | Arithmetic shift left (absolute)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BCC $8F			  ; 90 8F | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	STA $008700		  ; 8F 00 87 00 | Store accumulator to absolute long address
	CPY #$4F			 ; C0 4F | Compare Y register (immediate)
	BVS $77			  ; 70 77 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$BC			 ; A0 BC | Load immediate value into Y register
	BNE $5C			  ; D0 5C | Branch if not equal
	CPY #$4E			 ; C0 4E | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	ASL $2EEC			; 0E EC 2E | Arithmetic shift left (absolute)
	CPX #$27			 ; E0 27 | Compare X register (immediate)
	CPX $27			  ; E4 27 | Compare X register (zero page)
	SEP #$27			 ; E2 27 | Set processor status bits
	SEP #$A2			 ; E2 A2 | Set processor status bits
	SBC ($41),Y		  ; F1 41 | Subtract with carry ((zero page),Y)
	SBC $F909,Y		  ; F9 09 F9 | Subtract with carry (absolute,Y)
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_08B
; Address: $FB9F9F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_08B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA $FEFF,X		  ; 1D FF FE | Logical OR with accumulator (absolute,X)
	ASL $1C02,X		  ; 1E 02 1C | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ADC ($10),Y		  ; 71 10 | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_08D
; Address: $FB9FD1
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_08D:
	JSL $3F201F		  ; 22 1F 20 3F | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	INC $ED86,X		  ; FE 86 ED | Increment (absolute,X)
	ADC $3830			; 6D 30 38 | Add with carry (absolute)
	BMI $38			  ; 30 38 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BEQ $58			  ; F0 58 | Branch if equal
	BEQ $B8			  ; F0 B8 | Branch if equal
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BCS $C4			  ; B0 C4 | Branch if carry set
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	LDY $24			  ; A4 24 | Load from zero page into Y register
	LDY $A4			  ; A4 A4 | Load from zero page into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	BVC $00			  ; 50 00 | Branch if overflow clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	LSR $0304			; 4E 04 03 | Logical shift right (absolute)
	BRA $80			  ; 80 80 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	STY $8678			; 8C 78 86 | Store Y register to absolute address
	DEC $FF34			; CE 34 FF | Decrement (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $000200		  ; AF 00 02 00 | Load from absolute long address into accumulator
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_08E
; Address: $FBA0AC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_08E:
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_090
; Address: $FBA0BF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_090:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	LDY $DFCC,X		  ; BC CC DF | Load from absolute,X into Y register
	CMP $2F			  ; C5 2F | Compare accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BMI $80			  ; 30 80 | Branch if negative
	BRA $3A			  ; 80 3A | Branch always
	DEC				  ; 3A | Decrement accumulator
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_091
; Address: $FBA0EA
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_091:
	JSR $D820			; 20 20 D8 | Jump to subroutine
	BNE $B7			  ; D0 B7 | Branch if not equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ASL $23			  ; 06 23 | Arithmetic shift left (zero page)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BPL $1F			  ; 10 1F | Branch if positive
	ADC ($7F,X)		  ; 61 7F | Add with carry ((zero page,X))
	CPX $27			  ; E4 27 | Compare X register (zero page)
	CPX $27			  ; E4 27 | Compare X register (zero page)
	DEC $47			  ; C6 47 | Decrement (zero page)
	DEX				  ; CA | Decrement X register
	STY $8C8E			; 8C 8E 8C | Store Y register to absolute address
	STX $1618			; 8E 18 16 | Store X register to absolute address
	BIT $20F8			; 2C F8 20 | Test bits in accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_092
; Address: $FBA133
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_092:
	JSR $40F8			; 20 F8 40 | Jump to subroutine
	BEQ $40			  ; F0 40 | Branch if equal
	SBC ($81),Y		  ; F1 81 | Subtract with carry ((zero page),Y)
	SBC ($81),Y		  ; F1 81 | Subtract with carry ((zero page),Y)
	SBC #$09			 ; E9 09 | Subtract with carry (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	ADC $F71F,X		  ; 7D 1F F7 | Add with carry (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	INC $FAAF,X		  ; FE AF FA | Increment (absolute,X)
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_093
; Address: $FBA16F
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_093:
	INX				  ; E8 | Increment X register
	ASL $300E			; 0E 0E 30 | Arithmetic shift left (absolute)
	BMI $40			  ; 30 40 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	CMP $F6BB,X		  ; DD BB F6 | Compare accumulator (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	NOP				  ; EA | No operation
	BRA $83			  ; 80 83 | Branch always
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	STA				  ; 9F 95 80 2A | Store accumulator to absolute long,X
	ROR $9BFD			; 6E FD 9B | Rotate right (absolute)
	RTI				  ; 40 | Return from interrupt
	STX $F183			; 8E 83 F1 | Store X register to absolute address
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	STA ($91),Y		  ; 91 91 | Store accumulator to (zero page),Y
	ADC $64			  ; 65 64 | Add with carry (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	SBC ($01),Y		  ; F1 01 | Subtract with carry ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	PLY				  ; 7A | Pull Y register from stack
	INC $FF6D,X		  ; FE 6D FF | Increment (absolute,X)
	NOP				  ; EA | No operation
	ROR $2020,X		  ; 7E 20 20 | Rotate right (absolute,X)
	BRA $C8			  ; 80 C8 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	ROL				  ; 2A | Rotate left (accumulator)
	BVC $4C			  ; 50 4C | Branch if overflow clear
	LDX #$09			 ; A2 09 | Load immediate value into X register
	INC $2A			  ; E6 2A | Increment (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_094
; Address: $FBA21C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_094:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	AND $F4BF,X		  ; 3D BF F4 | Logical AND with accumulator (absolute,X)
	LDX $7FEE,Y		  ; BE EE 7F | Load from absolute,Y into X register
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	REP #$C2			 ; C2 C2 | Reset processor status bits
	ROL				  ; 2A | Rotate left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	ADC #$62			 ; 69 62 | Add with carry (immediate)
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_096
; Address: $FBA242
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_096:
	JSR $E8F0			; 20 F0 E8 | Jump to subroutine
	ROL $AFFD,X		  ; 3E FD AF | Rotate left (absolute,X)
	INC $FFEB,X		  ; FE EB FF | Increment (absolute,X)
	LDX $4343,Y		  ; BE 43 43 | Load from absolute,Y into X register
	BRA $34			  ; 80 34 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $C10E			; 0E 0E C1 | Arithmetic shift left (absolute)
	CMP ($50,X)		  ; C1 50 | Compare accumulator ((zero page,X))
	BVC $4A			  ; 50 4A | Branch if overflow clear
	LDY #$34			 ; A0 34 | Load immediate value into Y register
	TXA				  ; 8A | Transfer X register to accumulator
	LDY $4B4B,X		  ; BC 4B 4B | Load from absolute,X into Y register
	BRA $C0			  ; 80 C0 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	PLX				  ; FA | Pull X register from stack
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_098
; Address: $FBA278
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_098:
	BPL $10			  ; 10 10 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	STY $98			  ; 84 98 | Store Y register to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_099
; Address: $FBA286
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_099:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL $7F18,X		  ; 3E 18 7F | Rotate left (absolute,X)
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $0A			  ; 10 0A | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	ORA $3B3F,X		  ; 1D 3F 3B | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_09A
; Address: $FBA2A7
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_09A:
	ADC $7A3F,X		  ; 7D 3F 7A | Add with carry (absolute,X)
	ASL $2C74,X		  ; 1E 74 2C | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $4477			; 2E 77 44 | Rotate left (absolute)
	EOR ($40,X)		  ; 41 40 | Exclusive OR with accumulator ((zero page,X))
	STA ($84),Y		  ; 91 84 | Store accumulator to (zero page),Y
	STA ($82,X)		  ; 81 82 | Store accumulator to (zero page,X)
	BRA $81			  ; 80 81 | Branch always
	STA $8B			  ; 85 8B | Store accumulator to zero page
	STX $80			  ; 86 80 | Store X register to zero page
	DEC $C747,X		  ; DE 47 C7 | Decrement (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $5130			; 0E 30 51 | Arithmetic shift left (absolute)
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	CPY #$EB			 ; C0 EB | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_09B
; Address: $FBA2D4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_09B:
	JSL $393864		  ; 22 64 38 39 | Jump to subroutine long
	INC $C1FE,X		  ; FE FE C1 | Increment (absolute,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_09C
; Address: $FBA2DE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_09C:
	JSR $F420			; 20 20 F4 | Jump to subroutine
	SBC $FA3F			; ED 3F FA | Subtract with carry (absolute)
	STA $FFDFFD		  ; 8F FD DF FF | Store accumulator to absolute long address
	LDA				  ; BF 1F 6F 05 | Load from absolute long,X into accumulator
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BVS $A0			  ; 70 A0 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank76_DmaFunction_09D
; Address: $FBA2F7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_09D:
	JSR $7CBC			; 20 BC 7C | Jump to subroutine
	LSR				  ; 4A | Logical shift right (accumulator)
	BPL $15			  ; 10 15 | Branch if positive
	BEQ $F0			  ; F0 F0 | Branch if equal
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	LDA				  ; BF F5 FF FC | Load from absolute long,X into accumulator
	EOR #$FE			 ; 49 FE | Exclusive OR with accumulator (immediate)
	INC $FFF8,X		  ; FE F8 FF | Increment (absolute,X)
	BEQ $7F			  ; F0 7F | Branch if equal
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	ADC ($78,X)		  ; 61 78 | Add with carry ((zero page,X))
	INX				  ; E8 | Increment X register
	CLV				  ; B8 | Clear overflow flag
	BNE $78			  ; D0 78 | Branch if not equal
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	SEP #$62			 ; E2 62 | Set processor status bits
	STY $84			  ; 84 84 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_09F
; Address: $FBA33B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_09F:
	JSR $4040			; 20 40 40 | Jump to subroutine
	CLV				  ; B8 | Clear overflow flag
	INX				  ; E8 | Increment X register
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	EOR ($40,X)		  ; 41 40 | Exclusive OR with accumulator ((zero page,X))
	CMP ($40,X)		  ; C1 40 | Compare accumulator ((zero page,X))
	REP #$40			 ; C2 40 | Reset processor status bits
	WDM #$00			 ; 42 00 | Reserved instruction
	REP #$40			 ; C2 40 | Reset processor status bits
	INC $3EBE,X		  ; FE BE 3E | Increment (absolute,X)
	ROR $3C7C,X		  ; 7E 7C 3C | Rotate right (absolute,X)
	LDY $3CBC,X		  ; BC BC 3C | Load from absolute,X into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0A0
; Address: $FBA364
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0A0:
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDX $F6			  ; A6 F6 | Load from zero page into X register
	CPX $08F4			; EC F4 08 | Compare X register (absolute)
	BPL $04			  ; 10 04 | Branch if positive
	BPL $14			  ; 10 14 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	CPY $00E4			; CC E4 00 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0A3
; Address: $FBA3BB
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0A3:
	JSR $2030			; 20 30 20 | Jump to subroutine
	BMI $20			  ; 30 20 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ORA $071A			; 0D 1A 07 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ASL $0E1C			; 0E 1C 0E | Arithmetic shift left (absolute)
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	AND ($20,X)		  ; 21 20 | Logical AND with accumulator ((zero page,X))
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	ROL $24			  ; 26 24 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0A5
; Address: $FBA3FD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0A5:
	JSR $2020			; 20 20 20 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0A6
; Address: $FBA422
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0A6:
	BPL $06			  ; 10 06 | Branch if positive
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	AND $EE3B,Y		  ; 39 3B EE | Logical AND with accumulator (absolute,Y)
	SBC $BFE5,Y		  ; F9 E5 BF | Subtract with carry (absolute,Y)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL $300E			; 0E 0E 30 | Arithmetic shift left (absolute)
	BMI $C6			  ; 30 C6 | Branch if negative
	DEC $11			  ; C6 11 | Decrement (zero page)
	ORA ($06),Y		  ; 11 06 | Logical OR with accumulator ((zero page),Y)
	ASL $41			  ; 06 41 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	ROL $1D2C,X		  ; 3E 2C 1D | Rotate left (absolute,X)
	ORA $8096,X		  ; 1D 96 80 | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $FFB7,X		  ; FD B7 FF | Subtract with carry (absolute,X)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPX $F4C0			; EC C0 F4 | Compare X register (absolute)
	CPX #$74			 ; E0 74 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0A7
; Address: $FBA458
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0A7:
	BCC $90			  ; 90 90 | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	ROL $6B3E,X		  ; 3E 3E 6B | Rotate left (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0AA
; Address: $FBA47C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0AA:
	BMI $30			  ; 30 30 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC #$8E			 ; 69 8E | Add with carry (immediate)
	JMP ($358C)		  ; 6C 8C 35 | Jump to address (absolute indirect)
	INC				  ; 1A | Increment accumulator
	ORA $0D23,Y		  ; 19 23 0D | Logical OR with accumulator (absolute,Y)
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0AB
; Address: $FBA492
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0AB:
	ORA $4615,Y		  ; 19 15 46 | Logical OR with accumulator (absolute,Y)
	WDM #$48			 ; 42 48 | Reserved instruction
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0AC
; Address: $FBA498
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0AC:
	JSR $2522			; 20 22 25 | Jump to subroutine
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	ORA ($1A),Y		  ; 11 1A | Logical OR with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	BCC $C0			  ; 90 C0 | Branch if carry clear
	BCC $E0			  ; 90 E0 | Game work RAM access
	INY				  ; C8 | Increment Y register
	CPX #$54			 ; E0 54 | Compare X register (immediate)
	BEQ $23			  ; F0 23 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$5B			 ; C0 5B | Compare Y register (immediate)
	CPX #$4C			 ; E0 4C | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0AD
; Address: $FBA4B0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0AD:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	STZ $24			  ; 64 24 | Store zero to zero page
	ORA $0300,X		  ; 1D 00 03 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0AE
; Address: $FBA4CD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0AE:
	JSR $8101			; 20 01 81 | Jump to subroutine
	ROR $00B9,X		  ; 7E B9 00 | Rotate right (absolute,X)
	CMP $1A18,Y		  ; D9 18 1A | Compare accumulator (absolute,Y)
	BPL $1A			  ; 10 1A | Branch if positive
	BPL $34			  ; 10 34 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0AF
; Address: $FBA4E9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0AF:
	JSR $6074			; 20 74 60 | Jump to subroutine
	INX				  ; E8 | Increment X register
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LSR $46			  ; 46 46 | Logical shift right (zero page)
	ROL $F436			; 2E 36 F4 | Rotate left (absolute)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	PEA #$C8E8		   ; F4 E8 C8 | Push effective address to stack
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BNE $10			  ; D0 10 | Branch if not equal
	BMI $70			  ; 30 70 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	SEC				  ; 38 | Set carry flag
	LDY #$38			 ; A0 38 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0B0
; Address: $FBA52F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0B0:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BNE $D0			  ; D0 D0 | Branch if not equal
	CMP ($40,X)		  ; C1 40 | Compare accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0B2
; Address: $FBA549
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0B2:
	LDY $38			  ; A4 38 | Load from zero page into Y register
	ASL $4B98			; 0E 98 4B | Arithmetic shift left (absolute)
	STX $7E03			; 8E 03 7E | Store X register to absolute address
	ROL $BEBE,X		  ; 3E BE BE | Rotate left (absolute,X)
	CMP #$C1			 ; C9 C1 | Compare accumulator (immediate)
	BIT $2C			  ; 24 2C | Test bits in accumulator (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0B3
; Address: $FBA56A
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0B3:
	CLC				  ; 18 | Clear carry flag
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA $000D			; 0D 0D 00 | Logical OR with accumulator (absolute)
	ORA ($39,X)		  ; 01 39 | Logical OR with accumulator ((zero page,X))
	ASL $BE			  ; 06 BE | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BMI $30			  ; 30 30 | Branch if negative
	EOR ($40,X)		  ; 41 40 | Exclusive OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BIT $28			  ; 24 28 | Test bits in accumulator (zero page)
	BVC $50			  ; 50 50 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	BCC $A8			  ; 90 A8 | Branch if carry clear
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0B4
; Address: $FBA5AC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0B4:
	BPL $40			  ; 10 40 | Branch if positive
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BVC $40			  ; 50 40 | Branch if overflow clear
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0B5
; Address: $FBA5B8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0B5:
	BVC $10			  ; 50 10 | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	LDY #$20			 ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0B6
; Address: $FBA5BE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0B6:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	BPL $20			  ; 10 20 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0B8
; Address: $FBA5D6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0B8:
	BPL $10			  ; 10 10 | Branch if positive
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0B9
; Address: $FBA5F0
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0B9:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $EABF,X		  ; FE BF EA | Increment (absolute,X)
	ROR $78A8,X		  ; 7E A8 78 | Rotate right (absolute,X)
	SBC ($46,X)		  ; E1 46 | Subtract with carry ((zero page,X))
	SEP #$4C			 ; E2 4C | Set processor status bits
	REP #$1C			 ; C2 1C | Reset processor status bits
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0BA
; Address: $FBA632
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0BA:
	JSR $010A			; 20 0A 01 | Jump to subroutine
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BIT $58			  ; 24 58 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BPL $50			  ; 10 50 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0BB
; Address: $FBA63C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0BB:
	JSR $6020			; 20 20 60 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	ROL $8F2F			; 2E 2F 8F | Rotate left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0BC
; Address: $FBA654
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0BC:
	JMP $FEFD52		  ; 5C 52 FD FE | Jump to address long
	BPL $0D			  ; 10 0D | Branch if positive
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BEQ $9C			  ; F0 9C | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	INC $6EF4,X		  ; FE F4 6E | Increment (absolute,X)
	PHX				  ; DA | Push X register to stack
	CPX $0C0C			; EC 0C 0C | Compare X register (absolute)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	EOR ($11),Y		  ; 51 11 | Exclusive OR with accumulator ((zero page),Y)
	STA ($10),Y		  ; 91 10 | Store accumulator to (zero page),Y
	PHP				  ; 08 | Push processor status to stack
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $060D			; 0D 0D 06 | Logical OR with accumulator (absolute)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $00			  ; 80 00 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	LDA $E0C787		  ; AF 87 C7 E0 | Game work RAM access
	BEQ $FA			  ; F0 FA | Branch if equal
	ROR				  ; 6A | Rotate right (accumulator)
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PLX				  ; FA | Pull X register from stack
	SBC ($60),Y		  ; F1 60 | Subtract with carry ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $E0FCFC		  ; AF FC FC E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0BF
; Address: $FBA6F2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0BF:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $40			  ; 10 40 | Branch if positive
	BPL $60			  ; 10 60 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0C1
; Address: $FBA728
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0C1:
	JMP $B8A8			; 4C A8 B8 | Jump to address
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	LSR $02			  ; 46 02 | Logical shift right (zero page)
	ORA $0600,Y		  ; 19 00 06 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $1C3B,Y		  ; 39 3B 1C | Logical AND with accumulator (absolute,Y)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0C2
; Address: $FBA760
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0C2:
	JSR $85FF			; 20 FF 85 | Jump to subroutine
	LDA				  ; BF EB AF 3E | Load from absolute long,X into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BMI $90			  ; 30 90 | Branch if negative
	SBC ($30,X)		  ; E1 30 | Subtract with carry ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$ED			 ; 29 ED | Logical AND with accumulator (immediate)
	PEA #$103C		   ; F4 3C 10 | Push effective address to stack
	BEQ $80			  ; F0 80 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $18			  ; 10 18 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	BPL $C8			  ; 10 C8 | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	JMP $D4EC			; 4C EC D4 | Jump to address
	PHX				  ; DA | Push X register to stack
	INC $2020,X		  ; FE 20 20 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0C6
; Address: $FBA7FF
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0C6:
	CPY $0700			; CC 00 07 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $040D			; 0D 0D 04 | Logical OR with accumulator (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CMP ($9C,X)		  ; C1 9C | Compare accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	CPY $AE64			; CC 64 AE | Compare Y register (absolute)
	BMI $13			  ; 30 13 | Branch if negative
	EOR $07			  ; 45 07 | Exclusive OR with accumulator (zero page)
	ORA ($A2,X)		  ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0C7
; Address: $FBA831
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0C7:
	JSL $315393		  ; 22 93 53 31 | Jump to subroutine long
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	LDY #$DC			 ; A0 DC | Load immediate value into Y register
	CPY $5347			; CC 47 53 | Compare Y register (absolute)
	LDA ($A4,X)		  ; A1 A4 | Load from (zero page,X) into accumulator
	SED				  ; F8 | Set decimal mode flag
	SBC $0334,Y		  ; F9 34 03 | Subtract with carry (absolute,Y)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	STX $0B			  ; 86 0B | Store X register to zero page
	ORA #$A7			 ; 09 A7 | Logical OR with accumulator (immediate)
	SBC $1853,X		  ; FD 53 18 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	AND $F818,Y		  ; 39 18 F8 | Logical AND with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BVS $70			  ; 70 70 | Branch if overflow set
	LDX #$A1			 ; A2 A1 | Load immediate value into X register
	EOR ($50),Y		  ; 51 50 | Exclusive OR with accumulator ((zero page),Y)
	SBC ($51),Y		  ; F1 51 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	BNE $AC			  ; D0 AC | Branch if not equal
	INX				  ; E8 | Increment X register
	ROR $FF98,X		  ; 7E 98 FF | Rotate right (absolute,X)
	EOR $DEF7,X		  ; 5D F7 DE | Exclusive OR with accumulator (absolute,X)
	LDA $020273		  ; AF 73 02 02 | Load from absolute long address into accumulator
	WDM #$82			 ; 42 82 | Reserved instruction
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $F5FF,X		  ; FE FF F5 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0C8
; Address: $FBA894
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0C8:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVS $F0			  ; 70 F0 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BNE $60			  ; D0 60 | Branch if not equal

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0CA
; Address: $FBA8B6
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0CA:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0CB
; Address: $FBA8BA
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0CB:
	JSR $8020			; 20 20 80 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $10			  ; 10 10 | Branch if positive
	BMI $04			  ; 30 04 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	BRA $C0			  ; 80 C0 | Branch always
	BPL $C0			  ; 10 C0 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0CC
; Address: $FBA8EA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0CC:
	JSR $2080			; 20 80 20 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0CD
; Address: $FBA8FC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0CD:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0CF
; Address: $FBA93C
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0CF:
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	AND $752D,X		  ; 3D 2D 75 | Logical AND with accumulator (absolute,X)
	BMI $D3			  ; 30 D3 | Branch if negative
	LDA $6BEE			; AD EE 6B | Load from absolute address into accumulator
	LDY $D857,X		  ; BC 57 D8 | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	ORA $5742,X		  ; 1D 42 57 | Logical OR with accumulator (absolute,X)
	JMP $03F011		  ; 5C 11 F0 03 | Jump to address long
	LDY #$27			 ; A0 27 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	LDY $AC			  ; A4 AC | Load from zero page into Y register
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	INC $F802,X		  ; FE 02 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ASL $7E			  ; 06 7E | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	INC $FFE0,X		  ; FE E0 FF | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BVS $20			  ; 70 20 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0D0
; Address: $FBA9B8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0D0:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $88			  ; 10 88 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0D1
; Address: $FBA9BE
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0D1:
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	DEC $FEFC,X		  ; DE FC FE | Decrement (absolute,X)
	PEA #$B8D4		   ; F4 D4 B8 | Push effective address to stack
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	BNE $F0			  ; D0 F0 | Branch if not equal
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $98			  ; 80 98 | Branch always
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	PLP				  ; 28 | Pull processor status from stack
	BVC $28			  ; 50 28 | Branch if overflow clear
	BRA $50			  ; 80 50 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PEA #$0252		   ; F4 52 02 | Push effective address to stack
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	ORA #$59			 ; 09 59 | Logical OR with accumulator (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC $5E67,Y		  ; F9 67 5E | Subtract with carry (absolute,Y)
	STA				  ; 9F CF 0B 31 | Store accumulator to absolute long,X
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	LDX $46			  ; A6 46 | Load from zero page into X register
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	DEC				  ; 3A | Decrement accumulator
	AND ($0F),Y		  ; 31 0F | Logical AND with accumulator ((zero page),Y)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	PLX				  ; FA | Pull X register from stack
	CMP $EEFE,X		  ; DD FE EE | Compare accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	CLV				  ; B8 | Clear overflow flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0D2
; Address: $FBAA72
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0D2:
	JSR $1420			; 20 20 14 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0D4
; Address: $FBAA80
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0D4:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	ORA $0311			; 0D 11 03 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND ($21,X)		  ; 21 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0D5
; Address: $FBAAB3
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0D5:
	JSR $1414			; 20 14 14 | Jump to subroutine
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0E0F			; 0E 0F 0E | Arithmetic shift left (absolute)
	ORA $080F			; 0D 0F 08 | Logical OR with accumulator (absolute)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $13			  ; 10 13 | Branch if positive
	BPL $11			  ; 10 11 | Branch if positive
	BEQ $AF			  ; F0 AF | Branch if equal
	BMI $BF			  ; 30 BF | Branch if negative
	LDY #$9E			 ; A0 9E | Load immediate value into Y register
	CPX #$DC			 ; E0 DC | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0D6
; Address: $FBAB2A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0D6:
	STZ $98A0			; 9C A0 98 | Store zero to absolute
	CPX #$58			 ; E0 58 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0D7
; Address: $FBAB31
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0D7:
	CPY #$4F			 ; C0 4F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	STA ($1C,X)		  ; 81 1C | Store accumulator to (zero page,X)
	JMP $8418C2		  ; 5C C2 18 84 | Jump to address long
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $FF			  ; 84 FF | Store Y register to zero page
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0D8
; Address: $FBAB57
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0D8:
	JSR $100F			; 20 0F 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0D9
; Address: $FBAB5F
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0D9:
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BCC $9C			  ; 90 9C | Branch if carry clear
	STY $CA8E			; 8C 8E CA | Store Y register to absolute address
	DEC $CECC			; CE CC CE | Decrement (absolute)
	STX $8A8E			; 8E 8E 8A | Store X register to absolute address
	STX $8E8C			; 8E 8C 8E | Store X register to absolute address
	SEP #$02			 ; E2 02 | Set processor status bits
	SEP #$82			 ; E2 82 | Set processor status bits
	SBC ($81),Y		  ; F1 81 | Subtract with carry ((zero page),Y)
	SBC ($C1),Y		  ; F1 C1 | Subtract with carry ((zero page),Y)
	SBC ($C1),Y		  ; F1 C1 | Subtract with carry ((zero page),Y)
	SBC ($81),Y		  ; F1 81 | Subtract with carry ((zero page),Y)
	SBC ($81),Y		  ; F1 81 | Subtract with carry ((zero page),Y)
	SBC ($81),Y		  ; F1 81 | Subtract with carry ((zero page),Y)
	ORA $3F1E,X		  ; 1D 1E 3F | Logical OR with accumulator (absolute,X)
	ROL $6C3E,X		  ; 3E 3E 6C | Rotate left (absolute,X)
	BVS $2C			  ; 70 2C | Branch if overflow set
	BIT $2264			; 2C 64 22 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0DA
; Address: $FBABB1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0DA:
	JSL $4B4040		  ; 22 40 40 4B | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	WDM #$95			 ; 42 95 | Reserved instruction
	STA ($8B),Y		  ; 91 8B | Store accumulator to (zero page),Y
	PHB				  ; 8B | Push data bank register to stack
	LDA $E9A8,X		  ; BD A8 E9 | Load from absolute,X into accumulator
	BRA $82			  ; 80 82 | Branch always
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0DB
; Address: $FBABCA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0DB:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	REP #$6A			 ; C2 6A | Reset processor status bits
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0DC
; Address: $FBABE2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0DC:
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0DD
; Address: $FBAC22
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0DD:
	LSR $5EF4,X		  ; 5E F4 5E | Logical shift right (absolute,X)
	CPX $7AFF			; EC FF 7A | Compare X register (absolute)
	CMP $DAFF,X		  ; DD FF DA | Compare accumulator (absolute,X)
	INC $F87C,X		  ; FE 7C F8 | Increment (absolute,X)
	LDX $500A,Y		  ; BE 0A 50 | Load from absolute,Y into X register
	BVC $A4			  ; 50 A4 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	LDY $52			  ; A4 52 | Load from zero page into Y register
	PLP				  ; 28 | Pull processor status from stack
	CMP #$16			 ; C9 16 | Compare accumulator (immediate)
	WDM #$9C			 ; 42 9C | Reserved instruction
	BVC $88			  ; 50 88 | Branch if overflow clear
	CPY $000F			; CC 0F 00 | Compare Y register (absolute)
	AND ($0F),Y		  ; 31 0F | Logical AND with accumulator ((zero page),Y)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	BIT $0E			  ; 24 0E | Test bits in accumulator (zero page)
	CPY $3E			  ; C4 3E | Compare Y register (zero page)
	JMP $00001F		  ; 5C 1F 00 00 | Jump to address long
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0DE
; Address: $FBACA2
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0DE:
	JSR $6040			; 20 40 60 | Jump to subroutine
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BRA $90			  ; 80 90 | Branch always
	LDY #$C8			 ; A0 C8 | Load immediate value into Y register
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BMI $10			  ; 30 10 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	STY $84			  ; 84 84 | Store Y register to zero page
	CPX $18EC			; EC EC 18 | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0DF
; Address: $FBACDE
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0DF:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $13			  ; 10 13 | Branch if positive
	BPL $13			  ; 10 13 | Branch if positive
	BPL $11			  ; 10 11 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BRA $70			  ; 80 70 | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	BRA $B0			  ; 80 B0 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	BRA $88			  ; 80 88 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	AND ($10),Y		  ; 31 10 | Logical AND with accumulator ((zero page),Y)
	STZ $9F			  ; 64 9F | Store zero to zero page
	PHB				  ; 8B | Push data bank register to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	EOR ($7B),Y		  ; 51 7B | Exclusive OR with accumulator ((zero page),Y)
	XBA				  ; EB | Exchange accumulator bytes
	PEA #$0E94		   ; F4 94 0E | Push effective address to stack
	ASL $161C			; 0E 1C 16 | Arithmetic shift left (absolute)
	ASL $107C			; 0E 7C 10 | Arithmetic shift left (absolute)
	BIT $50F8			; 2C F8 50 | Test bits in accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	PEA #$F1B0		   ; F4 B0 F1 | Push effective address to stack
	ORA ($E9,X)		  ; 01 E9 | Logical OR with accumulator ((zero page,X))
	ORA #$F1			 ; 09 F1 | Logical OR with accumulator (immediate)
	AND ($EE),Y		  ; 31 EE | Logical AND with accumulator ((zero page),Y)
	ROR $D2D2			; 6E D2 D2 | Rotate right (absolute)
	LDX $54AE			; AE AE 54 | Load from absolute address into X register
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0E0
; Address: $FBAD63
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0E0:
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0E1
; Address: $FBAD66
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0E1:
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0E2
; Address: $FBAD6B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0E2:
	JSR $144C			; 20 4C 14 | Jump to subroutine
	BIT $8704			; 2C 04 87 | Test bits in accumulator (absolute)
	STA $97878F		  ; 8F 8F 87 97 | Store accumulator to absolute long address
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0E3
; Address: $FBAD86
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0E3:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $78			  ; F0 78 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CPX $C8A8			; EC A8 C8 | Compare X register (absolute)
	RTI				  ; 40 | Return from interrupt
	STY $68			  ; 84 68 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $85			  ; 06 85 | Arithmetic shift left (zero page)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $6218,Y		  ; 19 18 62 | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0E6
; Address: $FBADE8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0E6:
	JSR $A040			; 20 40 A0 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $9C			  ; 80 9C | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ASL $0007			; 0E 07 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0E8
; Address: $FBAE24
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0E8:
	JSL $335F1F		  ; 22 1F 5F 33 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INC $FBF0			; EE F0 FB | Increment (absolute)
	SBC ($87,X)		  ; E1 87 | Subtract with carry ((zero page,X))
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	STA ($71),Y		  ; 91 71 | Store accumulator to (zero page),Y
	CPX $18			  ; E4 18 | Compare X register (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $CB			  ; 66 CB | Rotate right (zero page)
	ASL $5CC7,X		  ; 1E C7 5C | Arithmetic shift left (absolute,X)
	AND ($8C),Y		  ; 31 8C | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ORA #$F2			 ; 09 F2 | Logical OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	DEC $B4			  ; C6 B4 | Decrement (zero page)
	STY $D4CC			; 8C CC D4 | Store Y register to absolute address
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	BMI $20			  ; 30 20 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BVS $38			  ; 70 38 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0E9
; Address: $FBAEB6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0E9:
	JSR $1820			; 20 20 18 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0EA
; Address: $FBAEDB
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0EA:
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $3D0F			; 0E 0F 3D | Arithmetic shift left (absolute)
	INC $F95F,X		  ; FE 5F F9 | Increment (absolute,X)
	DEC $35FD			; CE FD 35 | Decrement (absolute)
	SBC $0D0B			; ED 0B 0D | Subtract with carry (absolute)
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	REP #$C2			 ; C2 C2 | Reset processor status bits
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	SEC				  ; 38 | Set carry flag
	LSR $BF			  ; 46 BF | Logical shift right (zero page)
	INC $D75E,X		  ; FE 5E D7 | Increment (absolute,X)
	LDA				  ; BF B4 E6 A0 | Load from absolute long,X into accumulator
	CLV				  ; B8 | Clear overflow flag
	BIT $B92C			; 2C 2C B9 | Test bits in accumulator (absolute)
	LDA $0404,Y		  ; B9 04 04 | Load from absolute,Y into accumulator
	LDA ($1C,X)		  ; A1 1C | Load from (zero page,X) into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$54			 ; E0 54 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0EC
; Address: $FBAF24
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0EC:
	JSR $4080			; 20 80 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BCC $90			  ; 90 90 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0ED
; Address: $FBAF32
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0ED:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0C1C,X		  ; 1D 1C 0C | Logical OR with accumulator (absolute,X)
	ORA $0707			; 0D 07 07 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	SBC ($57),Y		  ; F1 57 | Subtract with carry ((zero page),Y)
	ORA $3B			  ; 05 3B | Logical OR with accumulator (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF BF C7 C7 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0EF
; Address: $FBAF75
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0EF:
	JSR $4818			; 20 18 48 | Jump to subroutine
	DEC $D2			  ; C6 D2 | Decrement (zero page)
	AND $043C,Y		  ; 39 3C 04 | Logical AND with accumulator (absolute,Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	INC $DB5A,X		  ; FE 5A DB | Increment (absolute,X)
	JMP $50F75C		  ; 5C 5C F7 50 | Jump to address long
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PLB				  ; AB | Pull data bank register from stack
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	ADC $F635,Y		  ; 79 35 F6 | Add with carry (absolute,Y)
	JMP $3070			; 4C 70 30 | Jump to address
	BRA $C0			  ; 80 C0 | Branch always
	STX $80			  ; 86 80 | Store X register to zero page
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0F0
; Address: $FBAFB4
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0F0:
	JSR $8000			; 20 00 80 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA $261E,Y		  ; 19 1E 26 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $0E			  ; 10 0E | Branch if positive
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA $0E07			; 0D 07 0E | Logical OR with accumulator (absolute)
	ASL $3C2E,X		  ; 1E 2E 3C | Arithmetic shift left (absolute,X)
	ROL $541C,X		  ; 3E 1C 54 | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $12			  ; 06 12 | Arithmetic shift left (zero page)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BVC $28			  ; 50 28 | Branch if overflow clear
	CPY $6C			  ; C4 6C | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	BRA $98			  ; 80 98 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0F1
; Address: $FBB008
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0F1:
	BRA $00			  ; 80 00 | Branch always
	STZ $64			  ; 64 64 | Store zero to zero page
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $7F00,X		  ; 1E 00 7F | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SBC ($80,X)		  ; E1 80 | Subtract with carry ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ASL $7F1E,X		  ; 1E 1E 7F | Arithmetic shift left (absolute,X)
	LDA ($A1,X)		  ; A1 A1 | Load from (zero page,X) into accumulator
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0F2
; Address: $FBB04A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0F2:
	BMI $00			  ; 30 00 | Branch if negative
	BMI $10			  ; 30 10 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0F4
; Address: $FBB058
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0F4:
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	EOR $883B,Y		  ; 59 3B 88 | Exclusive OR with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	ROL				  ; 2A | Rotate left (accumulator)
	BMI $30			  ; 30 30 | Branch if negative
	BVC $50			  ; 50 50 | Branch if overflow clear
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0F5
; Address: $FBB09E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0F5:
	JSL $1C0222		  ; 22 22 02 1C | Jump to subroutine long
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	JMP $4AB929		  ; 5C 29 B9 4A | Jump to address long
	STX $0F			  ; 86 0F | Store X register to zero page

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0F6
; Address: $FBB0AB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0F6:
	CMP $FF00,X		  ; DD 00 FF | Compare accumulator (absolute,X)
	ORA $1F01,X		  ; 1D 01 1F | Logical OR with accumulator (absolute,X)
	ORA ($2A,X)		  ; 01 2A | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $691D			; 4D 1D 69 | Exclusive OR with accumulator (absolute)
	ADC #$22			 ; 69 22 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0F7
; Address: $FBB0BB
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0F7:
	JSL $8D0000		  ; 22 00 00 8D | Jump to subroutine long
	STA $0000			; 8D 00 00 | Store accumulator to absolute address
	BCC $C0			  ; 90 C0 | Branch if carry clear
	ROL $07FF,X		  ; 3E FF 07 | Rotate left (absolute,X)
	INC $8704,X		  ; FE 04 87 | Increment (absolute,X)
	ASL $1F1C			; 0E 1C 1F | Arithmetic shift left (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	STX $1FFC			; 8E FC 1F | Store X register to absolute address
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	ROR $8F7D,X		  ; 7E 7D 8F | Rotate right (absolute,X)
	INC $FCF0,X		  ; FE F0 FC | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	ORA ($8E,X)		  ; 01 8E | Logical OR with accumulator ((zero page,X))
	BRA $70			  ; 80 70 | Branch always
	CLC				  ; 18 | Clear carry flag
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	BIT $30			  ; 24 30 | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0F8
; Address: $FBB10A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0F8:
	BCS $C0			  ; B0 C0 | Branch if carry set
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0F9
; Address: $FBB112
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0F9:
	JSL $444422		  ; 22 22 44 44 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BCC $90			  ; 90 90 | Branch if carry clear
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0FA
; Address: $FBB12F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0FA:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY $38D7,X		  ; BC D7 38 | Load from absolute,X into Y register
	PHA				  ; 48 | Push accumulator to stack
	INC $E870			; EE 70 E8 | Increment (absolute)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	STA ($C0,X)		  ; 81 C0 | Store accumulator to (zero page,X)
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BPL $08			  ; 10 08 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0FB
; Address: $FBB153
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0FB:
	JSR $3151			; 20 51 31 | Jump to subroutine
	LDA				  ; BF 7E 9F 5E | Load from absolute long,X into accumulator
	ASL $815F,X		  ; 1E 5F 81 | Arithmetic shift left (absolute,X)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	ASL $3800			; 0E 00 38 | Arithmetic shift left (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ROL $FCFF,X		  ; 3E FF FC | Rotate left (absolute,X)
	INC $F8F1,X		  ; FE F1 F8 | Increment (absolute,X)
	DEC $E0			  ; C6 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $70			  ; 30 70 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0FC
; Address: $FBB1D4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0FC:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0FD
; Address: $FBB1DA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0FD:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	AND $1030,Y		  ; 39 30 10 | Logical AND with accumulator (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0FE
; Address: $FBB1F4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0FE:
	JSL $3F7F12		  ; 22 12 7F 3F | Jump to subroutine long
	AND $1076,Y		  ; 39 76 10 | Logical AND with accumulator (absolute,Y)
	AND $1000,Y		  ; 39 00 10 | Logical AND with accumulator (absolute,Y)
	CMP $FF01			; CD 01 FF | Compare accumulator (absolute)
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank76_DmaFunction_0FF
; Address: $FBB214
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_0FF:
	STA				  ; 9F 89 FF F0 | Store accumulator to absolute long,X
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	CMP #$EF			 ; C9 EF | Compare accumulator (immediate)
	STX $00CE			; 8E CE 00 | Store X register to absolute address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $F924,X		  ; FE 24 F9 | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	SEP #$9C			 ; E2 9C | Set processor status bits
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal

;------------------------------------------------------------------------------
; Bank76_DmaFunction_100
; Address: $FBB23B
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_100:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $C0			  ; 80 C0 | Branch always
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	SBC ($40,X)		  ; E1 40 | Subtract with carry ((zero page,X))
	STA ($C0,X)		  ; 81 C0 | Store accumulator to (zero page,X)
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	SBC ($40,X)		  ; E1 40 | Subtract with carry ((zero page,X))
	AND ($60,X)		  ; 21 60 | Logical AND with accumulator ((zero page,X))
	LDX $9E7F,Y		  ; BE 7F 9E | Load from absolute,Y into X register
	LSR $5E1E,X		  ; 5E 1E 5E | Logical shift right (absolute,X)
	LDX $9E7E,Y		  ; BE 7E 9E | Load from absolute,Y into X register
	LSR $5E1E,X		  ; 5E 1E 5E | Logical shift right (absolute,X)
	STZ $7C9E,X		  ; 9E 9E 7C | Store zero to absolute,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_102
; Address: $FBB2D4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_102:
	ASL $381E,X		  ; 1E 1E 38 | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	BVS $70			  ; 70 70 | Branch if overflow set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL $00FE,X		  ; 3E FE 00 | Rotate left (absolute,X)
	INC $C0FE,X		  ; FE FE C0 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_104
; Address: $FBB344
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_104:
	BCS $F0			  ; B0 F0 | Branch if carry set
	LDY $D27C,X		  ; BC 7C D2 | Load from absolute,X into Y register
	ROR $305C,X		  ; 7E 5C 30 | Rotate right (absolute,X)
	BVC $20			  ; 50 20 | Branch if overflow clear
	SEI				  ; 78 | Set interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_105
; Address: $FBB354
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_105:
	BCC $60			  ; 90 60 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_106
; Address: $FBB35D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_106:
	JSR $2008			; 20 08 20 | Jump to subroutine
	BMI $30			  ; 30 30 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	BVS $56			  ; 70 56 | Branch if overflow set
	ROR $5A			  ; 66 5A | Rotate right (zero page)
	LDY $B078,X		  ; BC 78 B0 | Load from absolute,X into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_107
; Address: $FBB370
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_107:
	BMI $00			  ; 30 00 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	BMI $48			  ; 30 48 | Branch if negative
	BMI $50			  ; 30 50 | Branch if negative

;------------------------------------------------------------------------------
; Bank76_DmaFunction_108
; Address: $FBB377
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_108:
	JSR $2046			; 20 46 20 | Jump to subroutine
	BVC $2C			  ; 50 2C | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	BVS $20			  ; 70 20 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ROR $01			  ; 66 01 | Rotate right (zero page)
	JMP ($F803)		  ; 6C 03 F8 | Jump to address (absolute indirect)
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_109
; Address: $FBB393
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_109:
	WDM #$00			 ; 42 00 | Reserved instruction
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($67,X)		  ; 01 67 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $00			  ; E6 00 | Increment (zero page)
	BVS $80			  ; 70 80 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	INC $80			  ; E6 80 | Increment (zero page)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND $24			  ; 25 24 | Logical AND with accumulator (zero page)
	JMP $0049			; 4C 49 00 | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA				  ; BF E6 DF BF | Load from absolute long,X into accumulator
	LDA				  ; BF F5 FF DF | Load from absolute long,X into accumulator
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	ORA $4A19,Y		  ; 19 19 4A | Logical OR with accumulator (absolute,Y)
	EOR $21			  ; 45 21 | PPU graphics register access
	TXA				  ; 8A | Transfer X register to accumulator
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	PEA #$FF7F		   ; F4 7F FF | Push effective address to stack
	SBC $41C1,Y		  ; F9 C1 41 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	INC $F8F8,X		  ; FE F8 F8 | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	LDX $7E			  ; A6 7E | Load from zero page into X register
	ROL $0101,X		  ; 3E 01 01 | Rotate left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	BPL $1C			  ; 10 1C | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_10A
; Address: $FBB434
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_10A:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SEP #$E2			 ; E2 E2 | Set processor status bits
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	BPL $3B			  ; 10 3B | Branch if positive
	ORA $0D1E,Y		  ; 19 1E 0D | Logical OR with accumulator (absolute,Y)
	ASL $020E			; 0E 0E 02 | Arithmetic shift left (absolute)
	STX $DE			  ; 86 DE | Store X register to zero page
	STY $8CCE			; 8C CE 8C | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	BVC $7C			  ; 50 7C | Branch if overflow clear
	WDM #$A1			 ; 42 A1 | Reserved instruction
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $30BC			; 8C BC 30 | Store Y register to absolute address
	BEQ $70			  ; F0 70 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	BVS $80			  ; 70 80 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	BVS $40			  ; 70 40 | Branch if overflow set
	BRA $F0			  ; 80 F0 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	BVS $80			  ; 70 80 | Branch if overflow set
	BMI $C0			  ; 30 C0 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_10C
; Address: $FBB4E7
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_10C:
	ORA $011E			; 0D 1E 01 | Logical OR with accumulator (absolute)
	ORA $3B00,X		  ; 1D 00 3B | Logical OR with accumulator (absolute,X)
	ORA $017F			; 0D 7F 01 | Logical OR with accumulator (absolute)
	ORA $E01C,X		  ; 1D 1C E0 | Game work RAM access
	BEQ $0D			  ; F0 0D | Branch if equal
	BEQ $0B			  ; F0 0B | Branch if equal
	BEQ $1B			  ; F0 1B | Branch if equal
	CPX #$7A			 ; E0 7A | Compare X register (immediate)
	BRA $F0			  ; 80 F0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BEQ $FC			  ; F0 FC | Branch if equal
	BEQ $FD			  ; F0 FD | Branch if equal
	BEQ $FB			  ; F0 FB | Branch if equal
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	BRA $FA			  ; 80 FA | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL $3C			  ; 26 3C | Rotate left (zero page)
	JMP ($547D)		  ; 6C 7D 54 | Jump to address (absolute indirect)
	PLY				  ; 7A | Pull Y register from stack
	CLD				  ; D8 | Clear decimal mode flag
	BCC $FA			  ; 90 FA | Branch if carry clear
	LDA ($F2),Y		  ; B1 F2 | Load from (zero page),Y into accumulator
	SBC ($E4,X)		  ; E1 E4 | Subtract with carry ((zero page,X))
	EOR $979B,X		  ; 5D 9B 97 | Exclusive OR with accumulator (absolute,X)
	LDX $B2			  ; A6 B2 | Load from zero page into X register
	BIT $5834			; 2C 34 58 | Test bits in accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	BVS $40			  ; 70 40 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_10D
; Address: $FBB55E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_10D:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	AND ($8F,X)		  ; 21 8F | Logical AND with accumulator ((zero page,X))
	ASL $3B8E,X		  ; 1E 8E 3B | Arithmetic shift left (absolute,X)
	DEC $B5EE			; CE EE B5 | Decrement (absolute)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	BVC $50			  ; 50 50 | Branch if overflow clear
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	LDY $41FF			; AC FF 41 | Load from absolute address into Y register
	ADC $FFFF,X		  ; 7D FF FF | Add with carry (absolute,X)
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_10E
; Address: $FBB58C
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_10E:
	NOP				  ; EA | No operation
	STA ($20,X)		  ; 81 20 | Store accumulator to (zero page,X)
	LDX $4BBE,Y		  ; BE BE 4B | Load from absolute,Y into X register
	PLP				  ; 28 | Pull processor status from stack
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LSR $005E,X		  ; 5E 5E 00 | Logical shift right (absolute,X)
	INC $C0			  ; E6 C0 | Increment (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $1E			  ; F0 1E | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FC6F,X		  ; FE 6F FC | Increment (absolute,X)
	ORA $8719,Y		  ; 19 19 87 | Logical OR with accumulator (absolute,Y)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCC $90			  ; 90 90 | Branch if carry clear
	LDY $8A4A,X		  ; BC 4A 8A | Load from absolute,X into Y register
	CLV				  ; B8 | Clear overflow flag
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_110
; Address: $FBB5DD
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_110:
	JSR $1010			; 20 10 10 | Jump to subroutine
	BVS $3E			  ; 70 3E | Branch if overflow set
	BMI $0E			  ; 30 0E | Branch if negative
	ORA $0F02,X		  ; 1D 02 0F | Logical OR with accumulator (absolute,X)
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	ORA ($5A,X)		  ; 01 5A | Logical OR with accumulator ((zero page,X))
	AND $0F01,X		  ; 3D 01 0F | Logical AND with accumulator (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $031E,X		  ; 1E 1E 03 | Arithmetic shift left (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	LDA $4A4FF9		  ; AF F9 4F 4A | Load from absolute long address into accumulator
	ASL $8A16			; 0E 16 8A | Arithmetic shift left (absolute)
	ADC $9D			  ; 65 9D | Add with carry (zero page)
	INC $79			  ; E6 79 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	EOR ($61,X)		  ; 41 61 | Exclusive OR with accumulator ((zero page,X))
	ADC $0F			  ; 65 0F | Add with carry (zero page)
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank76_DmaFunction_111
; Address: $FBB623
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_111:
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BMI $BC			  ; 30 BC | Branch if negative
	LDX $80BE,Y		  ; BE BE 80 | Load from absolute,Y into X register
	BCS $20			  ; B0 20 | Branch if carry set
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_112
; Address: $FBB630
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_112:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	BMI $80			  ; 30 80 | Branch if negative
	STY $F270			; 8C 70 F2 | Store Y register to absolute address
	STY $C080			; 8C 80 C0 | Store Y register to absolute address
	BRA $60			  ; 80 60 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	BCC $00			  ; 90 00 | Branch if carry clear
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_114
; Address: $FBB68C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_114:
	BCC $E0			  ; 90 E0 | Game work RAM access
	TAY				  ; A8 | Transfer accumulator to Y register
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_115
; Address: $FBB69C
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_115:
	BRA $60			  ; 80 60 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BVS $18			  ; 70 18 | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	BRA $F0			  ; 80 F0 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	SBC $C3			  ; E5 C3 | Subtract with carry (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP #$87			 ; C9 87 | Compare accumulator (immediate)
	CMP #$87			 ; C9 87 | Compare accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	DEY				  ; 88 | Decrement Y register
	BIT #$07			 ; 89 07 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_116
; Address: $FBB74E
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_116:
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SBC $58BC,Y		  ; F9 BC 58 | Subtract with carry (absolute,Y)
	CLV				  ; B8 | Clear overflow flag
	CPX $AF			  ; E4 AF | Compare X register (zero page)
	STA				  ; 9F B3 E7 0A | Store accumulator to absolute long,X
	PHB				  ; 8B | Push data bank register to stack
	BIT $14			  ; 24 14 | Test bits in accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	BMI $10			  ; 30 10 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	DEC $CF00			; CE 00 CF | Decrement (absolute)
	CLC				  ; 18 | Clear carry flag
	AND $3A81			; 2D 81 3A | Logical AND with accumulator (absolute)
	STA ($13,X)		  ; 81 13 | Store accumulator to (zero page,X)
	STA ($02,X)		  ; 81 02 | Store accumulator to (zero page,X)
	CMP ($85,X)		  ; C1 85 | Compare accumulator ((zero page,X))
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	BMI $30			  ; 30 30 | Branch if negative
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	WDM #$52			 ; 42 52 | Reserved instruction
	JMP ($3C6C)		  ; 6C 6C 3C | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F 3E 8D BB | Store accumulator to absolute long,X
	CMP $E71F,X		  ; DD 1F E7 | Compare accumulator (absolute,X)
	LDX $3AFF,Y		  ; BE FF 3A | Load from absolute,Y into X register
	STA $8CAC,X		  ; 9D AC 8C | Store accumulator to absolute,X
	RTI				  ; 40 | Return from interrupt
	BVC $4A			  ; 50 4A | Branch if overflow clear
	WDM #$0A			 ; 42 0A | Reserved instruction
	PLP				  ; 28 | Pull processor status from stack
	BPL $20			  ; 10 20 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_117
; Address: $FBB7D3
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_117:
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	BMI $28			  ; 30 28 | Branch if negative
	BMI $08			  ; 30 08 | Branch if negative
	STX $7F			  ; 86 7F | Store X register to zero page
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$78			 ; C0 78 | Compare Y register (immediate)
	BRA $50			  ; 80 50 | Branch always
	BRA $D0			  ; 80 D0 | Branch always
	BMI $20			  ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank76_DmaFunction_118
; Address: $FBB80C
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_118:
	JSR $A020			; 20 20 A0 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $28			  ; 10 28 | Branch if positive
	BVC $28			  ; 50 28 | Branch if overflow clear
	BCS $68			  ; B0 68 | Branch if carry set
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $301C,X		  ; 1E 1C 30 | Arithmetic shift left (absolute,X)
	ASL $081A,X		  ; 1E 1A 08 | Arithmetic shift left (absolute,X)
	ROL $0233,X		  ; 3E 33 02 | Rotate left (absolute,X)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0101,X		  ; 1D 01 01 | Logical OR with accumulator (absolute,X)
	ORA $0D03,X		  ; 1D 03 0D | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_11A
; Address: $FBB867
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_11A:
	JSL $9CA2BE		  ; 22 BE A2 9C | Jump to subroutine long
	EOR ($2A,X)		  ; 41 2A | Exclusive OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ROL				  ; 2A | Rotate left (accumulator)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	LDX $77BE,Y		  ; BE BE 77 | Load from absolute,Y into X register
	BVS $E0			  ; 70 E0 | Game work RAM access
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	BVS $E0			  ; 70 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank76_DmaFunction_11C
; Address: $FBB889
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_11C:
	STZ $3C86			; 9C 86 3C | Store zero to absolute
	BIT $3E88			; 2C 88 3E | Test bits in accumulator (absolute)
	INC $A0			  ; E6 A0 | Increment (zero page)
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	BVS $80			  ; 70 80 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_11D
; Address: $FBB896
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_11D:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	JMP $DCC040		  ; 5C 40 C0 DC | Jump to address long
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_11F
; Address: $FBB89F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_11F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_120
; Address: $FBB8CF
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_120:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$13			 ; E0 13 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $C1			  ; 80 C1 | Branch always
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	AND $693B,Y		  ; 39 3B 69 | Logical AND with accumulator (absolute,Y)
	ADC $1F3A,X		  ; 7D 3A 1F | Add with carry (absolute,X)
	LSR $0404,X		  ; 5E 04 04 | Logical shift right (absolute,X)
	AND $4A04,X		  ; 3D 04 4A | Logical AND with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($42),Y		  ; 11 42 | Hardware register operation
	AND $6893,Y		  ; 39 93 68 | Logical AND with accumulator (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_121
; Address: $FBB945
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_121:
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))
	STA ($84,X)		  ; 81 84 | Store accumulator to (zero page,X)
	BRA $42			  ; 80 42 | Hardware register operation
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	BRA $C1			  ; 80 C1 | Branch always
	BRA $04			  ; 80 04 | Branch always
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	EOR ($81,X)		  ; 41 81 | Exclusive OR with accumulator ((zero page,X))
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	AND $1BF3,Y		  ; 39 F3 1B | Logical AND with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	ORA $1783,X		  ; 1D 83 17 | Logical OR with accumulator (absolute,X)
	STA $471F2F		  ; 8F 2F 1F 47 | Store accumulator to absolute long address
	AND $375C,X		  ; 3D 5C 37 | Logical AND with accumulator (absolute,X)
	EOR ($3B,X)		  ; 41 3B | Exclusive OR with accumulator ((zero page,X))
	BIT $14			  ; 24 14 | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_124
; Address: $FBB977
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_124:
	ADC ($C2,X)		  ; 61 C2 | Add with carry ((zero page,X))
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	STY $84			  ; 84 84 | Store Y register to zero page
	BRA $84			  ; 80 84 | Branch always
	STY $C6BB			; 8C BB C6 | Store Y register to absolute address
	CMP $973B			; CD 3B 97 | Compare accumulator (absolute)
	SBC $F5FF,X		  ; FD FF F5 | Subtract with carry (absolute,X)
	ORA $A2FF,Y		  ; 19 FF A2 | Logical OR with accumulator (absolute,Y)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $A1			  ; 05 A1 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	INC $C4FF			; EE FF C4 | Increment (absolute)
	CLV				  ; B8 | Clear overflow flag
	ROR $FC30,X		  ; 7E 30 FC | Rotate right (absolute,X)
	EOR ($F8,X)		  ; 41 F8 | Exclusive OR with accumulator ((zero page,X))
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	BRA $0F			  ; 80 0F | Branch always
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $30			  ; F0 30 | Branch if equal
	BRA $70			  ; 80 70 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_125
; Address: $FBB9C6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_125:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_126
; Address: $FBB9CC
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_126:
	BRA $00			  ; 80 00 | Branch always
	BVS $48			  ; 70 48 | Branch if overflow set
	BEQ $88			  ; F0 88 | Branch if equal
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $30			  ; 80 30 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $15			  ; 10 15 | Branch if positive
	ROL				  ; 2A | Rotate left (accumulator)
	BPL $3D			  ; 10 3D | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_127
; Address: $FBBA04
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_127:
	JSR $0020			; 20 20 00 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank76_DmaFunction_128
; Address: $FBBA17
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_128:
	JSR $0000			; 20 00 00 | Jump to subroutine
	LSR $367B,X		  ; 5E 7B 36 | Logical shift right (absolute,X)
	ASL $2F			  ; 06 2F | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	LSR $3A			  ; 46 3A | Logical shift right (zero page)
	ASL $1B27			; 0E 27 1B | Arithmetic shift left (absolute)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	EOR #$7F			 ; 49 7F | Exclusive OR with accumulator (immediate)
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	LDX $BE00,Y		  ; BE 00 BE | Load from absolute,Y into X register
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $88			  ; 80 88 | Branch always
	BRA $C9			  ; 80 C9 | Branch always
	LDX #$C1			 ; A2 C1 | Load immediate value into X register
	LDX #$41			 ; A2 41 | Load immediate value into X register
	LDX #$41			 ; A2 41 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank76_DmaFunction_129
; Address: $FBBA5E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_129:
	JSL $6F3DC1		  ; 22 C1 3D 6F | Jump to subroutine long
	BMI $6A			  ; 30 6A | Branch if negative
	ROR $606C			; 6E 6C 60 | Rotate right (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_12A
; Address: $FBBA69
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_12A:
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	LDA ($AE),Y		  ; B1 AE | Load from (zero page),Y into accumulator
	CPX #$B8			 ; E0 B8 | Compare X register (immediate)
	SEP #$FC			 ; E2 FC | Set processor status bits
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_12B
; Address: $FBBA78
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_12B:
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BRA $60			  ; 80 60 | Branch always
	BRA $06			  ; 80 06 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_12C
; Address: $FBBAA1
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_12C:
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	AND $1A02,X		  ; 3D 02 1A | Logical AND with accumulator (absolute,X)
	ORA $30			  ; 05 30 | Logical OR with accumulator (zero page)
	BMI $0F			  ; 30 0F | Branch if negative
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SEC				  ; 38 | Set carry flag
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $C0			  ; F0 C0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BEQ $FE			  ; F0 FE | Branch if equal
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA $997F,Y		  ; B9 7F 99 | Load from absolute,Y into accumulator
	BPL $7E			  ; 10 7E | Branch if positive
	CLI				  ; 58 | Clear interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($742C)		  ; 6C 2C 74 | Jump to address (absolute indirect)
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_12D
; Address: $FBBB34
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_12D:
	STA ($89),Y		  ; 91 89 | Store accumulator to (zero page),Y
	STA $8D85			; 8D 85 8D | Store accumulator to absolute address
	STA $008B			; 8D 8B 00 | Store accumulator to absolute address
	BRA $07			  ; 80 07 | Branch always
	SEC				  ; 38 | Set carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_12F
; Address: $FBBB53
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_12F:
	SED				  ; F8 | Set decimal mode flag
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY $F0			  ; C4 F0 | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	ROR $F800,X		  ; 7E 00 F8 | Rotate right (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $F881,X		  ; FE 81 F8 | Increment (absolute,X)
	ASL $C0			  ; 06 C0 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $1C			  ; 30 1C | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_131
; Address: $FBBB8A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_131:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_133
; Address: $FBBB9D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_133:
	JSR $4040			; 20 40 40 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	LDX #$9C			 ; A2 9C | Load immediate value into X register
	STZ $0000			; 9C 00 00 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank76_DmaFunction_135
; Address: $FBBBD4
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_135:
	JSL $C97755		  ; 22 55 77 C9 | Jump to subroutine long
	CMP $A2FF,X		  ; DD FF A2 | Compare accumulator (absolute,X)
	STZ $00FF			; 9C FF 00 | Store zero to absolute
	STZ $0000			; 9C 00 00 | Store zero to absolute
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_136
; Address: $FBBBFD
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_136:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $30			  ; 80 30 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	ROL $1C01,X		  ; 3E 01 1C | Rotate left (absolute,X)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$34			 ; E0 34 | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPY #$F4			 ; C0 F4 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ADC $C6FE,Y		  ; 79 FE C6 | Add with carry (absolute,Y)
	CPX #$B1			 ; E0 B1 | Compare X register (immediate)
	BRA $4F			  ; 80 4F | Branch always
	ORA $BF			  ; 05 BF | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $601E,X		  ; 1E 1E 60 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_137
; Address: $FBBC76
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_137:
	STX $86			  ; 86 86 | Store X register to zero page
	AND $4E39,Y		  ; 39 39 4E | Logical AND with accumulator (absolute,Y)
	LSR $B0B0			; 4E B0 B0 | Logical shift right (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	PLX				  ; FA | Pull X register from stack
	ROL $FC			  ; 26 FC | Rotate left (zero page)
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CMP $00D9,Y		  ; D9 D9 00 | Compare accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	BRA $E4			  ; 80 E4 | Branch always
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_13A
; Address: $FBBCB9
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_13A:
	PHP				  ; 08 | Push processor status to stack
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $070F			; 0E 0F 07 | Arithmetic shift left (absolute)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_13C
; Address: $FBBD46
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_13C:
	BCC $E0			  ; 90 E0 | Game work RAM access
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $60			  ; F0 60 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_13E
; Address: $FBBD58
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_13E:
	DEY				  ; 88 | Decrement Y register
	BVS $08			  ; 70 08 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BEQ $03			  ; F0 03 | Branch if equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $031C,X		  ; 1E 1C 03 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0001,X		  ; 1D 01 00 | Logical OR with accumulator (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_140
; Address: $FBBD8D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_140:
	JSL $00A2BE		  ; 22 BE A2 00 | Jump to subroutine long
	BRA $00			  ; 80 00 | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_142
; Address: $FBBDA2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_142:
	BCC $E0			  ; 90 E0 | Game work RAM access
	TAY				  ; A8 | Transfer accumulator to Y register
	SEI				  ; 78 | Set interrupt disable flag
	BVS $E0			  ; 70 E0 | Game work RAM access
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	BVS $E0			  ; 70 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank76_DmaFunction_143
; Address: $FBBDAC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_143:
	JSR $BC00			; 20 00 BC | Jump to subroutine
	STZ $0060			; 9C 60 00 | Store zero to absolute
	BRA $60			  ; 80 60 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BVS $A0			  ; 70 A0 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	BVS $80			  ; 70 80 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_144
; Address: $FBBDBC
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_144:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	JMP $000040		  ; 5C 40 00 00 | Jump to address long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_145
; Address: $FBBDEE
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_145:
	SEP #$00			 ; E2 00 | Set processor status bits
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEP #$00			 ; E2 00 | Set processor status bits
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ASL $1C18			; 0E 18 1C | Arithmetic shift left (absolute)
	ORA $3B15,Y		  ; 19 15 3B | Logical OR with accumulator (absolute,Y)
	BIT $33			  ; 24 33 | Test bits in accumulator (zero page)
	PLB				  ; AB | Pull data bank register from stack
	LDA #$E7			 ; A9 E7 | Load immediate value into accumulator
	SBC $1111			; ED 11 11 | Subtract with carry (absolute)
	BIT $24			  ; 24 24 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BNE $50			  ; D0 50 | Branch if not equal
	BCC $10			  ; 90 10 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank76_DmaFunction_146
; Address: $FBBE3F
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_146:
	JSL $3F7D1F		  ; 22 1F 7D 3F | Jump to subroutine long
	INX				  ; E8 | Increment X register
	DEC $FC			  ; C6 FC | Decrement (zero page)
	PLB				  ; AB | Pull data bank register from stack
	LDA				  ; BF EF 5E FE | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	EOR ($82),Y		  ; 51 82 | Exclusive OR with accumulator ((zero page),Y)
	AND $5439,Y		  ; 39 39 54 | Logical AND with accumulator (absolute,Y)
	EOR ($42,X)		  ; 41 42 | Hardware register operation
	TAX				  ; AA | Transfer accumulator to X register
	LDY $31			  ; A4 31 | Load from zero page into Y register
	AND $86			  ; 25 86 | Logical AND with accumulator (zero page)
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	BIT $F9FF			; 2C FF F9 | Test bits in accumulator (absolute)
	INC $ABFF,X		  ; FE FF AB | Increment (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	BRA $80			  ; 80 80 | Branch always
	INC $6E6E,X		  ; FE 6E 6E | Increment (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ROL $57FC,X		  ; 3E FC 57 | Rotate left (absolute,X)
	INC $FF07,X		  ; FE 07 FF | Increment (absolute,X)
	LDA				  ; BF C1 DF FA | Load from absolute long,X into accumulator
	ROL $C1C1,X		  ; 3E C1 C1 | Rotate left (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_147
; Address: $FBBE95
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_147:
	SED				  ; F8 | Set decimal mode flag
	ROL $45BE,X		  ; 3E BE 45 | Rotate left (absolute,X)
	STA $4B			  ; 85 4B | Store accumulator to zero page
	STA ($A9),Y		  ; 91 A9 | Store accumulator to (zero page),Y
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $C8			  ; F0 C8 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_148
; Address: $FBBEB6
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_148:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STY $0684			; 8C 84 06 | Store Y register to absolute address
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $301C,X		  ; 1E 1C 30 | Arithmetic shift left (absolute,X)
	ASL $081A,X		  ; 1E 1A 08 | Arithmetic shift left (absolute,X)
	ROL $5E32,X		  ; 3E 32 5E | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0101,X		  ; 1D 01 01 | Logical OR with accumulator (absolute,X)
	ORA $0D03,X		  ; 1D 03 0D | Logical OR with accumulator (absolute,X)
	LSR $3A			  ; 46 3A | Logical shift right (zero page)
	CMP ($36,X)		  ; C1 36 | Compare accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank76_DmaFunction_149
; Address: $FBBF09
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_149:
	JSL $88A2BE		  ; 22 BE A2 88 | Jump to subroutine long
	EOR #$49			 ; 49 49 | Exclusive OR with accumulator (immediate)
	LDX $C100,Y		  ; BE 00 C1 | Load from absolute,Y into X register
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	BEQ $E0			  ; F0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_14A
; Address: $FBBF23
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_14A:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $3C			  ; 80 3C | Branch always
	STZ $3C06			; 9C 06 3C | Store zero to absolute
	LDY $BE88			; AC 88 BE | Load from absolute address into Y register
	ROL $3D			  ; 26 3D | Rotate left (zero page)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_14B
; Address: $FBBF3B
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_14B:
	CLI				  ; 58 | Clear interrupt disable flag
	CPX #$31			 ; E0 31 | Compare X register (immediate)
	ROL $1E30			; 2E 30 1E | Rotate left (absolute)
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	ROL $5E33,X		  ; 3E 33 5E | Rotate left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	ORA $0236			; 0D 36 02 | Logical OR with accumulator (absolute)
	LSR $3A			  ; 46 3A | Logical shift right (zero page)
	ORA $9C			  ; 05 9C | Logical OR with accumulator (zero page)
	EOR ($2A,X)		  ; 41 2A | Exclusive OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ROL				  ; 2A | Rotate left (accumulator)
	EOR #$55			 ; 49 55 | Exclusive OR with accumulator (immediate)
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	LDX $9C9C,Y		  ; BE 9C 9C | Load from absolute,Y into X register
	LDX $77BE,Y		  ; BE BE 77 | Load from absolute,Y into X register
	BRA $80			  ; 80 80 | Branch always
	DEY				  ; 88 | Decrement Y register
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	LDX $FF9C,Y		  ; BE 9C FF | Load from absolute,Y into X register
	STX $3C			  ; 86 3C | Store X register to zero page
	BIT $3E88			; 2C 88 3E | Test bits in accumulator (absolute)
	INC $3D			  ; E6 3D | Increment (zero page)
	BVS $6A			  ; 70 6A | Branch if overflow set
	ROR $A0AC			; 6E AC A0 | Rotate right (absolute)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_14E
; Address: $FBBF99
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_14E:
	SED				  ; F8 | Set decimal mode flag
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_14F
; Address: $FBBFAE
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_14F:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)
	CPY #$1D			 ; C0 1D | Compare Y register (immediate)
	CPX #$BB			 ; E0 BB | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	NOP				  ; EA | No operation
	CLD				  ; D8 | Clear decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$F9			 ; C0 F9 | Compare Y register (immediate)
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	NOP				  ; EA | No operation
	CLD				  ; D8 | Clear decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $EAB7			; ED B7 EA | Subtract with carry (absolute)
	CMP $5AA7,X		  ; DD A7 5A | Compare accumulator (absolute,X)
	LDX $DD			  ; A6 DD | Load from zero page into X register
	LDX $CD			  ; A6 CD | Load from zero page into X register
	INC $CF			  ; E6 CF | Increment (zero page)
	LDX #$05			 ; A2 05 | Load immediate value into X register
	LDA $82			  ; A5 82 | Load from zero page into accumulator
	WDM #$05			 ; 42 05 | Reserved instruction
	EOR $82			  ; 45 82 | Exclusive OR with accumulator (zero page)
	WDM #$92			 ; 42 92 | Reserved instruction
	BCC $50			  ; 90 50 | Branch if carry clear
	BCC $50			  ; 90 50 | Branch if carry clear
	BEQ $E3			  ; F0 E3 | Branch if equal
	ADC ($AF,X)		  ; 61 AF | Add with carry ((zero page,X))
	DEC $5F			  ; C6 5F | Decrement (zero page)
	LSR $EF1B			; 4E 1B EF | Logical shift right (absolute)
	ADC $3D67,Y		  ; 79 67 3D | Add with carry (absolute,Y)
	LSR $4C			  ; 46 4C | Logical shift right (zero page)
	BIT $3010			; 2C 10 30 | Test bits in accumulator (absolute)
	BCC $50			  ; 90 50 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank76_DmaFunction_150
; Address: $FBC036
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_150:
	JSR $A460			; 20 60 A4 | Jump to subroutine
	LDY $46			  ; A4 46 | Load from zero page into Y register
	ROL $82			  ; 26 82 | Rotate left (zero page)
	LDX #$98			 ; A2 98 | Load immediate value into X register
	CLD				  ; D8 | Clear decimal mode flag
	ASL $87FF			; 0E FF 87 | Arithmetic shift left (absolute)
	STX $3B			  ; 86 3B | Store X register to zero page
	STX $37			  ; 86 37 | Store X register to zero page
	STX $4F			  ; 86 4F | Store X register to zero page

;------------------------------------------------------------------------------
; Bank76_DmaFunction_151
; Address: $FBC04D
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_151:
	ORA $7FBE,Y		  ; 19 BE 7F | Logical OR with accumulator (absolute,Y)
	BMI $30			  ; 30 30 | Branch if negative
	ADC #$69			 ; 69 69 | Add with carry (immediate)
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	EOR #$49			 ; 49 49 | Exclusive OR with accumulator (immediate)
	LDX $A6			  ; A6 A6 | Load from zero page into X register
	TXA				  ; 8A | Transfer X register to accumulator
	DEC $9B			  ; C6 9B | Decrement (zero page)
	CPX $DB			  ; E4 DB | Compare X register (zero page)
	CPX $76CB			; EC CB 76 | Compare X register (absolute)
	INC $3CE7			; EE E7 3C | Increment (absolute)
	EOR $4D			  ; 45 4D | Exclusive OR with accumulator (zero page)
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX $38			  ; E4 38 | Compare X register (zero page)
	CPX $B8			  ; E4 B8 | Compare X register (zero page)
	CPX $78			  ; E4 78 | Compare X register (zero page)
	CPX $38			  ; E4 38 | Compare X register (zero page)
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	CPY $78			  ; C4 78 | Compare Y register (zero page)
	CPY $F0			  ; C4 F0 | Compare Y register (zero page)
	CPY $C2			  ; C4 C2 | Compare Y register (zero page)
	WDM #$84			 ; 42 84 | Reserved instruction
	CPY $C2			  ; C4 C2 | Compare Y register (zero page)
	STY $82			  ; 84 82 | Store Y register to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ROL $1B3A			; 2E 3A 1B | Rotate left (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1A27			; 0E 27 1A | Arithmetic shift left (absolute)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($2A,X)		  ; 41 2A | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	TAX				  ; AA | Transfer accumulator to X register
	EOR #$7E			 ; 49 7E | Exclusive OR with accumulator (immediate)
	LDX $3E00,Y		  ; BE 00 3E | Load from absolute,Y into X register
	LDX $F7BE,Y		  ; BE BE F7 | Load from absolute,Y into X register
	STA ($22,X)		  ; 81 22 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_152
; Address: $FBC0FD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_152:
	EOR #$22			 ; 49 22 | Exclusive OR with accumulator (immediate)
	EOR #$36			 ; 49 36 | Exclusive OR with accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	ROL $406C			; 2E 6C 40 | Rotate left (absolute)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_153
; Address: $FBC110
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_153:
	JSR $E238			; 20 38 E2 | Jump to subroutine
	LDY $D0E0,X		  ; BC E0 D0 | Load from absolute,X into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_155
; Address: $FBC119
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_155:
	JSR $C080			; 20 80 C0 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	STZ $00FF			; 9C FF 00 | Store zero to absolute
	ROL $00C1,X		  ; 3E C1 00 | Rotate left (absolute,X)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_158
; Address: $FBC175
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_158:
	BRA $00			  ; 80 00 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROR $19			  ; 66 19 | Rotate right (zero page)
	JMP ($CC13)		  ; 6C 13 CC | Jump to address (absolute indirect)
	CPY $0033			; CC 33 00 | Compare Y register (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	AND $7F19,X		  ; 3D 19 7F | Logical AND with accumulator (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	LDY $0640,X		  ; BC 40 06 | Load from absolute,X into Y register
	SED				  ; F8 | Set decimal mode flag
	ASL $03F0			; 0E F0 03 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	INC $FEF0,X		  ; FE F0 FE | Increment (absolute,X)
	SBC ($47,X)		  ; E1 47 | Subtract with carry ((zero page,X))
	CPX #$47			 ; E0 47 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_159
; Address: $FBC1C6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_159:
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_15A
; Address: $FBC1D2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_15A:
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	SBC ($9F,X)		  ; E1 9F | Subtract with carry ((zero page,X))
	LSR $BBBF,X		  ; 5E BF BB | Logical shift right (absolute,X)
	LDX $7D7D			; AE 7D 7D | Load from absolute address into X register
	BVC $FB			  ; 50 FB | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_15C
; Address: $FBC1F5
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_15C:
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	XBA				  ; EB | Exchange accumulator bytes
	LDA $FAD7,X		  ; BD D7 FA | Load from absolute,X into accumulator
	INC $F1F3,X		  ; FE F3 F1 | Increment (absolute,X)
	LDA $40FF			; AD FF 40 | Load from absolute address into accumulator
	WDM #$00			 ; 42 00 | Reserved instruction
	LDX #$50			 ; A2 50 | Load immediate value into X register
	BPL $40			  ; 10 40 | Branch if positive
	STA				  ; 9F F3 7F EF | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BEQ $03			  ; F0 03 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BRA $8C			  ; 80 8C | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STY $0CF0			; 8C F0 0C | Store Y register to absolute address
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	BRA $38			  ; 80 38 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_15D
; Address: $FBC255
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_15D:
	JSL $F86478		  ; 22 78 64 F8 | Jump to subroutine long
	CPY $F0			  ; C4 F0 | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_15E
; Address: $FBC266
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_15E:
	JSR $4000			; 20 00 40 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_15F
; Address: $FBC276
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_15F:
	BVS $70			  ; 70 70 | Branch if overflow set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ROL $0800,X		  ; 3E 00 08 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	LDX #$9C			 ; A2 9C | Load immediate value into X register
	STZ $0000			; 9C 00 00 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank76_DmaFunction_161
; Address: $FBC294
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_161:
	JSL $493655		  ; 22 55 36 49 | Jump to subroutine long
	CMP $A2FF,X		  ; DD FF A2 | Compare accumulator (absolute,X)
	STZ $00FF			; 9C FF 00 | Store zero to absolute
	STZ $0000			; 9C 00 00 | Store zero to absolute
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $02			  ; 80 02 | Branch always
	JMP $0100			; 4C 00 01 | Jump to address
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	ORA ($DC,X)		  ; 01 DC | Logical OR with accumulator ((zero page,X))
	JMP $0100			; 4C 00 01 | Jump to address
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	ORA ($CB,X)		  ; 01 CB | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $30			  ; 80 30 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $C4			  ; F0 C4 | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_162
; Address: $FBC307
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_162:
	ORA $011E,X		  ; 1D 1E 01 | Logical OR with accumulator (absolute,X)
	JMP ($3F03)		  ; 6C 03 3F | Jump to address (absolute indirect)
	ORA $017F,X		  ; 1D 7F 01 | Logical OR with accumulator (absolute,X)
	CPY $1F			  ; C4 1F | Compare Y register (zero page)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_163
; Address: $FBC325
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_163:
	BEQ $0B			  ; F0 0B | Branch if equal
	BEQ $0B			  ; F0 0B | Branch if equal
	BEQ $32			  ; F0 32 | Branch if equal
	CPY #$E4			 ; C0 E4 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FB			  ; F0 FB | Branch if equal
	BEQ $FB			  ; F0 FB | Branch if equal
	CPY #$F2			 ; C0 F2 | Compare Y register (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BRA $02			  ; 80 02 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	CLI				  ; 58 | Clear interrupt disable flag
	PLX				  ; FA | Pull X register from stack
	SEI				  ; 78 | Set interrupt disable flag
	NOP				  ; EA | No operation
	CPX $742C			; EC 2C 74 | Compare X register (absolute)
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	ORA $0D05			; 0D 05 0D | Logical OR with accumulator (absolute)
	STA $008B			; 8D 8B 00 | Store accumulator to absolute address
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	BRA $0F			  ; 80 0F | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_165
; Address: $FBC393
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_165:
	ROR $F0FF,X		  ; 7E FF F0 | Rotate right (absolute,X)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BEQ $8C			  ; F0 8C | Branch if equal
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $F801,X		  ; FE 01 F8 | Increment (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_166
; Address: $FBC3C4
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_166:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	LDX #$C1			 ; A2 C1 | Load immediate value into X register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CMP ($60,X)		  ; C1 60 | Compare accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_167
; Address: $FBC402
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_167:
	BCS $E0			  ; B0 E0 | Game work RAM access
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $60			  ; F0 60 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_168
; Address: $FBC40B
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_168:
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $60			  ; 80 60 | Branch always
	DEY				  ; 88 | Decrement Y register
	BVS $08			  ; 70 08 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_169
; Address: $FBC44C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_169:
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	STZ $9803			; 9C 03 98 | Store zero to absolute
	LSR $1201			; 4E 01 12 | Logical shift right (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	STA				  ; 9F 07 9F 01 | Store accumulator to absolute long,X
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CPX #$1D			 ; E0 1D | Compare X register (immediate)
	CPX #$39			 ; E0 39 | Compare X register (immediate)
	CPY #$FB			 ; C0 FB | Compare Y register (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_16A
; Address: $FBC490
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_16A:
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	CPY #$F9			 ; C0 F9 | Compare Y register (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_16D
; Address: $FBC4AE
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_16D:
	INX				  ; E8 | Increment X register
	BCS $00			  ; B0 00 | Branch if carry set
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $3618,Y		  ; 19 18 36 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ASL $303A			; 0E 3A 30 | Arithmetic shift left (absolute)
	LSR $367A,X		  ; 5E 7A 36 | Logical shift right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA $47			  ; 05 47 | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank76_DmaFunction_16F
; Address: $FBC4ED
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_16F:
	JSL $00A2BE		  ; 22 BE A2 00 | Jump to subroutine long
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_170
; Address: $FBC4F6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_170:
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_171
; Address: $FBC501
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_171:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $4C			  ; 80 4C | Branch always
	STY $9C36			; 8C 36 9C | Store Y register to absolute address
	CLV				  ; B8 | Clear overflow flag
	ROL $3D86			; 2E 86 3D | Rotate left (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $4C			  ; D0 4C | Branch if not equal
	CPY #$58			 ; C0 58 | Compare Y register (immediate)
	INC $50			  ; E6 50 | Increment (zero page)
	SBC ($EE),Y		  ; F1 EE | Subtract with carry ((zero page),Y)
	BMI $28			  ; 30 28 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_178
; Address: $FBC552
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_178:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CMP $F65A,Y		  ; D9 5A F6 | Compare accumulator (absolute,Y)
	BNE $F8			  ; D0 F8 | Branch if not equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	LDY #$E1			 ; A0 E1 | Load immediate value into Y register
	CPY #$E2			 ; C0 E2 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY $82			  ; C4 82 | Compare Y register (zero page)
	CPY $03			  ; C4 03 | Compare Y register (zero page)
	LDY $58A4,X		  ; BC A4 58 | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank76_DmaFunction_179
; Address: $FBC578
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_179:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	ORA #$9B			 ; 09 9B | Logical OR with accumulator (immediate)
	ROL $693F,X		  ; 3E 3F 69 | Rotate left (absolute,X)
	LDX $FA1F,Y		  ; BE 1F FA | Load from absolute,Y into X register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP $1042			; 4C 42 10 | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY #$B4			 ; A0 B4 | Load immediate value into Y register
	SBC $31FF			; ED FF 31 | Subtract with carry (absolute)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	BCC $F7			  ; 90 F7 | Branch if carry clear
	INC $AFFF,X		  ; FE FF AF | Increment (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	DEC $3BCE			; CE CE 3B | Decrement (absolute)
	EOR ($A1),Y		  ; 51 A1 | Exclusive OR with accumulator ((zero page),Y)
	TAX				  ; AA | Transfer accumulator to X register
	EOR $0056,X		  ; 5D 56 00 | Exclusive OR with accumulator (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_17A
; Address: $FBC5C8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_17A:
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BEQ $9C			  ; F0 9C | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BMI $30			  ; 30 30 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	ROL $1A3F			; 2E 3F 1A | Rotate left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_17B
; Address: $FBC5F0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_17B:
	JSL $04031E		  ; 22 1E 03 04 | Jump to subroutine long
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	EOR #$49			 ; 49 49 | Exclusive OR with accumulator (immediate)
	LDX $FF77,Y		  ; BE 77 FF | Load from absolute,Y into X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank76_DmaFunction_17C
; Address: $FBC60A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_17C:
	STZ $AA41			; 9C 41 AA | Store zero to absolute
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	STZ $3E9C			; 9C 9C 3E | Store zero to absolute
	ROL $7777,X		  ; 3E 77 77 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_17D
; Address: $FBC61E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_17D:
	BRA $80			  ; 80 80 | Branch always
	TSX				  ; BA | Transfer stack pointer to X register
	ROR $802C,X		  ; 7E 2C 80 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_17E
; Address: $FBC625
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_17E:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDX #$BC			 ; A2 BC | Load immediate value into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_17F
; Address: $FBC633
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_17F:
	BPL $60			  ; 10 60 | Branch if positive
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA $0F03			; 0D 03 0F | Logical OR with accumulator (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_180
; Address: $FBC69F
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_180:
	PHP				  ; 08 | Push processor status to stack
	EOR #$7E			 ; 49 7E | Exclusive OR with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_181
; Address: $FBC6A6
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_181:
	JSL $414100		  ; 22 00 41 41 | Jump to subroutine long
	LDX #$9C			 ; A2 9C | Load immediate value into X register
	STZ $0000			; 9C 00 00 | Store zero to absolute
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	EOR #$63			 ; 49 63 | Exclusive OR with accumulator (immediate)
	CMP $A2FF,X		  ; DD FF A2 | Compare accumulator (absolute,X)
	STZ $00FF			; 9C FF 00 | Store zero to absolute
	STZ $0000			; 9C 00 00 | Store zero to absolute
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_182
; Address: $FBC6E6
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_182:
	JSR $1000			; 20 00 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BVS $70			  ; 70 70 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ASL $0F1E,X		  ; 1E 1E 0F | Arithmetic shift left (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BVC $83			  ; 50 83 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BRA $44			  ; 80 44 | Branch always
	BRA $42			  ; 80 42 | Hardware register operation
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	CPX $CF			  ; E4 CF | Compare X register (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_183
; Address: $FBC743
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_183:
	LDX $2070			; AE 70 20 | Load from absolute address into X register
	AND $3613,Y		  ; 39 13 36 | Logical AND with accumulator (absolute,Y)
	EOR $B73F,Y		  ; 59 3F B7 | Exclusive OR with accumulator (absolute,Y)
	ADC $F55F,X		  ; 7D 5F F5 | Add with carry (absolute,X)
	BCC $50			  ; 90 50 | Branch if carry clear
	AND ($11),Y		  ; 31 11 | Logical AND with accumulator ((zero page),Y)
	STA $C4D4AF		  ; 8F AF D4 C4 | Store accumulator to absolute long address
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $81			  ; 80 81 | Branch always
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	AND $F55E			; 2D 5E F5 | Logical AND with accumulator (absolute)
	SBC ($5F),Y		  ; F1 5F | Subtract with carry ((zero page),Y)
	CPY $7F			  ; C4 7F | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank76_DmaFunction_184
; Address: $FBC76E
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_184:
	JSR $D6F8			; 20 F8 D6 | Jump to subroutine
	CMP ($D4),Y		  ; D1 D4 | Compare accumulator ((zero page),Y)
	BVC $10			  ; 50 10 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	JMP $CCF0			; 4C F0 CC | Jump to address
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	BRA $30			  ; 80 30 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STY $02			  ; 84 02 | Store Y register to zero page
	SEC				  ; 38 | Set carry flag
	BIT $78			  ; 24 78 | Test bits in accumulator (zero page)
	BEQ $C8			  ; F0 C8 | Branch if equal
	BEQ $88			  ; F0 88 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BEQ $04			  ; F0 04 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LSR $CC03,X		  ; 5E 03 CC | Logical shift right (absolute,X)
	CMP ($75,X)		  ; C1 75 | Compare accumulator ((zero page,X))
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_185
; Address: $FBC7D4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_185:
	JSR $08C0			; 20 C0 08 | Jump to subroutine
	BEQ $04			  ; F0 04 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LDY #$5C			 ; A0 5C | Load immediate value into Y register
	STY $650A			; 8C 0A 65 | Store Y register to absolute address
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_186
; Address: $FBC7E8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_186:
	CLC				  ; 18 | Clear carry flag
	STZ $8D09			; 9C 09 8D | Store zero to absolute
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	STZ $8D63			; 9C 63 8D | Store zero to absolute
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_188
; Address: $FBC806
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_188:
	JSR $3070			; 20 70 30 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BCS $78			  ; B0 78 | Branch if carry set
	BNE $B8			  ; D0 B8 | Branch if not equal
	BVC $B8			  ; 50 B8 | Branch if overflow clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_189
; Address: $FBC812
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_189:
	JSR $70C0			; 20 C0 70 | Jump to subroutine
	BRA $70			  ; 80 70 | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $110C			; 0E 0C 11 | Arithmetic shift left (absolute)
	ASL $1F20,X		  ; 1E 20 1F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_18A
; Address: $FBC829
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_18A:
	JSR $200F			; 20 0F 20 | Jump to subroutine
	BPL $0B			  ; 10 0B | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_18B
; Address: $FBC858
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_18B:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	AND $8C01,Y		  ; 39 01 8C | Logical AND with accumulator (absolute,Y)
	BRA $C2			  ; 80 C2 | Branch always
	CPY #$23			 ; C0 23 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	DEC $38			  ; C6 38 | Decrement (zero page)
	AND $1C02,X		  ; 3D 02 1C | Logical AND with accumulator (absolute,X)
	BRA $40			  ; 80 40 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_18E
; Address: $FBC89F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_18E:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $4200			; 2E 00 42 | Hardware register operation
	AND ($61,X)		  ; 21 61 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ROL $4211			; 2E 11 42 | Hardware register operation
	AND $1E61,X		  ; 3D 61 1E | Logical AND with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_18F
; Address: $FBC8C6
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_18F:
	JSR $44E4			; 20 E4 44 | Jump to subroutine
	LSR $84			  ; 46 84 | Logical shift right (zero page)
	STX $8C			  ; 86 8C | Store X register to zero page
	STX $3E3C			; 8E 3C 3E | Store X register to absolute address
	SEC				  ; 38 | Set carry flag
	CPX $18			  ; E4 18 | Compare X register (zero page)
	LSR $B8			  ; 46 B8 | Logical shift right (zero page)
	STX $78			  ; 86 78 | Store X register to zero page
	STX $3E70			; 8E 70 3E | Store X register to absolute address
	CPY #$15			 ; C0 15 | Compare Y register (immediate)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ORA ($1B),Y		  ; 11 1B | Logical OR with accumulator ((zero page),Y)
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	LDY $78			  ; A4 78 | Load from zero page into Y register
	STZ $F8			  ; 64 F8 | Store zero to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0411			; 0E 11 04 | Arithmetic shift left (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_190
; Address: $FBC8F9
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_190:
	JSL $004000		  ; 22 00 40 00 | Jump to subroutine long
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $6206,X		  ; 1D 06 62 | Logical OR with accumulator (absolute,X)
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	BNE $94			  ; D0 94 | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	TAY				  ; A8 | Transfer accumulator to Y register
	ROL $111F,X		  ; 3E 1F 11 | Rotate left (absolute,X)
	ASL $0C04			; 0E 04 0C | Arithmetic shift left (absolute)
	BEQ $58			  ; F0 58 | Branch if equal
	BEQ $D8			  ; F0 D8 | Branch if equal

;------------------------------------------------------------------------------
; Bank76_DmaFunction_191
; Address: $FBC964
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_191:
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1F17			; 0E 17 1F | Arithmetic shift left (absolute)
	STZ $04FA,X		  ; 9E FA 04 | Store zero to absolute,X
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_192
; Address: $FBC9BE
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_192:
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_198
; Address: $FBC9C8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_198:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	STY $87			  ; 84 87 | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $20			  ; 80 20 | Branch always
	BRA $20			  ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_199
; Address: $FBC9D9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_199:
	JSR $4000			; 20 00 40 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank76_DmaFunction_19A
; Address: $FBC9E4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_19A:
	SBC $F7FF			; ED FF F7 | Subtract with carry (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	RTI				  ; 40 | Return from interrupt
	NOP				  ; EA | No operation
	SBC $F700			; ED 00 F7 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_19B
; Address: $FBCA00
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_19B:
	JSR $60E0			; 20 E0 60 | Jump to subroutine
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_19D
; Address: $FBCA17
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_19D:
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $10			  ; 80 10 | Branch always
	AND ($36),Y		  ; 31 36 | Logical AND with accumulator ((zero page),Y)
	EOR $65			  ; 45 65 | Exclusive OR with accumulator (zero page)
	ROL $39			  ; 26 39 | Rotate left (zero page)
	AND ($0E),Y		  ; 31 0E | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $03			  ; 10 03 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	ROR $E4			  ; 66 E4 | Rotate right (zero page)
	ASL $BECC,X		  ; 1E CC BE | Arithmetic shift left (absolute,X)
	LDY #$7C			 ; A0 7C | Load immediate value into Y register
	CLV				  ; B8 | Clear overflow flag
	BVS $F8			  ; 70 F8 | Branch if overflow set
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$7E			 ; E0 7E | Compare X register (immediate)
	BRA $FE			  ; 80 FE | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $1407			; 0E 07 14 | Arithmetic shift left (absolute)
	ORA $290E,Y		  ; 19 0E 29 | Logical OR with accumulator (absolute,Y)
	ASL $1C22,X		  ; 1E 22 1C | Arithmetic shift left (absolute,X)
	INY				  ; C8 | Increment Y register
	BEQ $90			  ; F0 90 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_19E
; Address: $FBCA85
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_19E:
	CPY #$41			 ; C0 41 | Compare Y register (immediate)
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	ASL $1E13			; 0E 13 1E | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $1100			; 0D 00 11 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_19F
; Address: $FBCA9F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_19F:
	JSR $1F00			; 20 00 1F | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1A0
; Address: $FBCAA6
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1A0:
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BNE $2F			  ; D0 2F | Branch if not equal
	AND $16E9			; 2D E9 16 | Logical AND with accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	CLV				  ; B8 | Clear overflow flag
	ROL				  ; 2A | Rotate left (accumulator)
	PLY				  ; 7A | Pull Y register from stack
	BIT #$3A			 ; 89 3A | Test bits in accumulator (immediate)
	STY $1D			  ; 84 1D | Store Y register to zero page
	BRA $1D			  ; 80 1D | Branch always
	INY				  ; C8 | Increment Y register
	ORA $1FCA,X		  ; 1D CA 1F | Logical OR with accumulator (absolute,X)
	EOR $02			  ; 45 02 | Exclusive OR with accumulator (zero page)
	BMI $0B			  ; 30 0B | Branch if negative
	STA $5A04,Y		  ; 99 04 5A | Store accumulator to absolute,Y
	STA $7D			  ; 85 7D | Store accumulator to zero page
	ADC $2D82			; 6D 82 2D | Add with carry (absolute)
	REP #$2F			 ; C2 2F | Reset processor status bits
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	AND $11AE,Y		  ; 39 AE 11 | Logical AND with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	BIT #$09			 ; 89 09 | Test bits in accumulator (immediate)
	EOR $45			  ; 45 45 | Exclusive OR with accumulator (zero page)
	AND $25			  ; 25 25 | Logical AND with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	LDX $5EA1,Y		  ; BE A1 5E | Load from absolute,Y into X register
	TAX				  ; AA | Transfer accumulator to X register
	BRA $BA			  ; 80 BA | Branch always
	PHX				  ; DA | Push X register to stack
	BRA $80			  ; 80 80 | Branch always
	BEQ $90			  ; F0 90 | Branch if equal
	STZ $8614			; 9C 14 86 | Store zero to absolute
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $60			  ; 80 60 | Branch always
	BRA $68			  ; 80 68 | Branch always
	BPL $74			  ; 10 74 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1A1
; Address: $FBCB28
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1A1:
	PLP				  ; 28 | Pull processor status from stack
	AND ($1E),Y		  ; 31 1E | Logical AND with accumulator ((zero page),Y)
	WDM #$3C			 ; 42 3C | Reserved instruction
	ADC $93F4			; 6D F4 93 | Add with carry (absolute)
	CPX #$26			 ; E0 26 | Compare X register (immediate)
	CMP ($6D,X)		  ; C1 6D | Compare accumulator ((zero page,X))
	LDX #$EC			 ; A2 EC | Load immediate value into X register
	PHY				  ; 5A | Push Y register to stack
	EOR $5E			  ; 45 5E | Exclusive OR with accumulator (zero page)
	EOR ($9D,X)		  ; 41 9D | Exclusive OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BPL $2F			  ; 10 2F | Branch if positive
	BPL $4F			  ; 10 4F | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1A3
; Address: $FBCB5F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1A3:
	STA				  ; 9F AE 50 47 | Store accumulator to absolute long,X
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$E817		   ; F4 17 E8 | Push effective address to stack
	LDY #$3A			 ; A0 3A | Load immediate value into Y register
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1A6
; Address: $FBCB92
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1A6:
	JSR $8000			; 20 00 80 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	BMI $02			  ; 30 02 | Branch if negative
	TXA				  ; 8A | Transfer X register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1A7
; Address: $FBCBD6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1A7:
	SED				  ; F8 | Set decimal mode flag
	CPY $7430			; CC 30 74 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1A8
; Address: $FBCBE0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1A8:
	JSL $1C221C		  ; 22 1C 22 1C | Jump to subroutine long
	ROL $3F1C,X		  ; 3E 1C 3F | Rotate left (absolute,X)
	ASL $0F1F,X		  ; 1E 1F 0F | Arithmetic shift left (absolute,X)
	ASL $050F			; 0E 0F 05 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1A9
; Address: $FBCC01
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1A9:
	JMP ($DCD8)		  ; 6C D8 DC | Jump to address (absolute indirect)
	BVC $74			  ; 50 74 | Branch if overflow clear
	PHX				  ; DA | Push X register to stack
	DEC $FEFE,X		  ; DE FE FE | Decrement (absolute,X)
	LDA $A57F,X		  ; BD 7F A5 | Load from absolute,X into accumulator
	ADC $FB			  ; 65 FB | Add with carry (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $0B			  ; 80 0B | Branch always
	RTI				  ; 40 | Return from interrupt
	AND ($80,X)		  ; 21 80 | Logical AND with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	SBC $BB12			; ED 12 BB | Subtract with carry (absolute)
	DEC				  ; 3A | Decrement accumulator
	ASL $9A00,X		  ; 1E 00 9A | Arithmetic shift left (absolute,X)
	BRA $A8			  ; 80 A8 | Branch always
	LDY #$62			 ; A0 62 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1AA
; Address: $FBCC2E
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1AA:
	WDM #$40			 ; 42 40 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF C1 3E E1 | Load from absolute long,X into accumulator
	ASL $1A65,X		  ; 1E 65 1A | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	STA $BD02,X		  ; 9D 02 BD | Store accumulator to absolute,X
	EOR #$1F			 ; 49 1F | Exclusive OR with accumulator (immediate)
	ASL $1E8F,X		  ; 1E 8F 1E | Arithmetic shift left (absolute,X)
	STX $0E1C			; 8E 1C 0E | Store X register to absolute address
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($1A),Y		  ; 11 1A | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	AND $40AE,X		  ; 3D AE 40 | Logical AND with accumulator (absolute,X)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1AB
; Address: $FBCC55
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1AB:
	STA ($61,X)		  ; 81 61 | Store accumulator to (zero page,X)
	SBC ($0E,X)		  ; E1 0E | Subtract with carry ((zero page,X))
	INC $E500			; EE 00 E5 | Increment (absolute)
	BPL $31			  ; 10 31 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STX $F745			; 8E 45 F7 | Store X register to absolute address
	TAY				  ; A8 | Transfer accumulator to Y register
	PEA #$EEDB		   ; F4 DB EE | Push effective address to stack
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	STX $F771			; 8E 71 F7 | Store X register to absolute address
	PHP				  ; 08 | Push processor status to stack
	ORA $007F,Y		  ; 19 7F 00 | Logical OR with accumulator (absolute,Y)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	LDA				  ; BF 95 DF 74 | Load from absolute long,X into accumulator
	LDA $7800FC		  ; AF FC 00 78 | Load from absolute long address into accumulator
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1AC
; Address: $FBCC96
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1AC:
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPY #$24			 ; C0 24 | Compare Y register (immediate)
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	WDM #$3C			 ; 42 3C | Reserved instruction
	AND $3D73,X		  ; 3D 73 3D | Logical AND with accumulator (absolute,X)
	ASL $0C0E,X		  ; 1E 0E 0C | Arithmetic shift left (absolute,X)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ASL $0E00,X		  ; 1E 00 0E | Arithmetic shift left (absolute,X)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 80 AE 80 | Load from absolute long,X into accumulator
	TSX				  ; BA | Transfer stack pointer to X register
	BRA $A8			  ; 80 A8 | Branch always
	BRA $09			  ; 80 09 | Branch always
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $5F			  ; 06 5F | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 51 2E 45 | Load from absolute long,X into accumulator
	DEC				  ; 3A | Decrement accumulator
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	SBC $A000,Y		  ; F9 00 A0 | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	ROL $FDE7,X		  ; 3E E7 FD | Rotate left (absolute,X)
	CPX #$78			 ; E0 78 | Compare X register (immediate)
	STY $F8			  ; 84 F8 | Store Y register to zero page
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1AD
; Address: $FBCD26
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1AD:
	LDA				  ; BF FF FF 5F | Load from absolute long,X into accumulator
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF 00 5F 00 | Load from absolute long,X into accumulator
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1AE
; Address: $FBCD5F
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1AE:
	INC $FF2F,X		  ; FE 2F FF | Increment (absolute,X)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $1E07			; 0E 07 1E | Arithmetic shift left (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	SBC $CEFB			; ED FB CE | Subtract with carry (absolute)
	SBC $FD8E,X		  ; FD 8E FD | Subtract with carry (absolute,X)
	LSR $FD			  ; 46 FD | Logical shift right (zero page)
	INC $FE1F,X		  ; FE 1F FE | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $3F00,X		  ; 1E 00 3F | Arithmetic shift left (absolute,X)
	BNE $D0			  ; D0 D0 | Branch if not equal
	PHX				  ; DA | Push X register to stack
	PHX				  ; DA | Push X register to stack
	ROR $7EFE,X		  ; 7E FE 7E | Rotate right (absolute,X)
	INC $7CBD,X		  ; FE BD 7C | Increment (absolute,X)
	STA				  ; 9F 7C 2F 00 | Store accumulator to absolute long,X
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1AF
; Address: $FBCDFD
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1AF:
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BIT $B43E			; 2C 3E B4 | Test bits in accumulator (absolute)
	LDX $BFAD,Y		  ; BE AD BF | Load from absolute,Y into X register
	LDA $AE9F,X		  ; BD 9F AE | Load from absolute,X into accumulator
	STA				  ; 9F 22 1F 1A | Store accumulator to absolute long,X
	STA				  ; 9F 0A C2 21 | Store accumulator to absolute long,X
	WDM #$31			 ; 42 31 | Reserved instruction
	BIT $1C43			; 2C 43 1C | Test bits in accumulator (absolute)
	EOR ($0E,X)		  ; 41 0E | Exclusive OR with accumulator ((zero page,X))
	CMP ($02,X)		  ; C1 02 | Compare accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1B0
; Address: $FBCE1F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1B0:
	TXA				  ; 8A | Transfer X register to accumulator
	BEQ $11			  ; F0 11 | Branch if equal
	CMP #$39			 ; C9 39 | Compare accumulator (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	STY $C3			  ; 84 C3 | Store Y register to zero page
	LDY $81			  ; A4 81 | Load from zero page into Y register
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CMP ($F1),Y		  ; D1 F1 | Compare accumulator ((zero page),Y)
	ASL $66F9			; 0E F9 66 | Arithmetic shift left (absolute)
	BNE $FF			  ; D0 FF | Branch if not equal
	JMP $FF3CFF		  ; 5C FF 3C FF | Jump to address long
	ROL $1FFF,X		  ; 3E FF 1F | Rotate left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1B1
; Address: $FBCE46
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1B1:
	STZ $FB			  ; 64 FB | Store zero to zero page
	ORA $0CFB,X		  ; 1D FB 0C | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BCC $80			  ; 90 80 | Branch if carry clear
	BMI $80			  ; 30 80 | Branch if negative
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	STA $0800,Y		  ; 99 00 08 | Store accumulator to absolute,Y
	BPL $40			  ; 10 40 | Branch if positive
	BRA $C0			  ; 80 C0 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1B3
; Address: $FBCE90
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1B3:
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA $0FCC2F		  ; AF 2F CC 0F | Load from absolute long address into accumulator
	CMP $9A1F,Y		  ; D9 1F 9A | Compare accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $3E3F,X		  ; BC 3F 3E | Load from absolute,X into Y register
	BRA $00			  ; 80 00 | Branch always
	BVC $80			  ; 50 80 | Branch if overflow clear
	BMI $C0			  ; 30 C0 | Branch if negative

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1B4
; Address: $FBCEB6
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1B4:
	JSR $60C1			; 20 C1 60 | Jump to subroutine
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	STA				  ; 9F FF 7F FF | Store accumulator to absolute long,X
	SBC $FDF3,X		  ; FD F3 FD | Subtract with carry (absolute,X)
	SBC $FDBB,X		  ; FD BB FD | Subtract with carry (absolute,X)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC $B900,Y		  ; F9 00 B9 | Subtract with carry (absolute,Y)
	SBC $C7FC,Y		  ; F9 FC C7 | Subtract with carry (absolute,Y)
	CMP $C7BF,Y		  ; D9 BF C7 | Compare accumulator (absolute,Y)
	LDA				  ; BF CE BF FA | Load from absolute long,X into accumulator
	SEP #$FF			 ; E2 FF | Set processor status bits
	SBC $C400,Y		  ; F9 00 C4 | Subtract with carry (absolute,Y)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STX $F800			; 8E 00 F8 | Store X register to absolute address
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$79			 ; E0 79 | Compare X register (immediate)
	ADC ($DE),Y		  ; 71 DE | Add with carry ((zero page),Y)
	SBC ($DE,X)		  ; E1 DE | Subtract with carry ((zero page,X))
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	EOR ($B9,X)		  ; 41 B9 | Exclusive OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	CLV				  ; B8 | Clear overflow flag
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	EOR $5000,Y		  ; 59 00 50 | Exclusive OR with accumulator (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	EOR ($06,X)		  ; 41 06 | Exclusive OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BVS $70			  ; 70 70 | Branch if overflow set
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1B7
; Address: $FBCF5F
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1B7:
	DEY				  ; 88 | Decrement Y register
	BVC $3F			  ; 50 3F | Branch if overflow clear
	WDM #$3E			 ; 42 3E | Reserved instruction
	EOR $4F3D,X		  ; 5D 3D 4F | Exclusive OR with accumulator (absolute,X)
	AND $1F			  ; 25 1F | Logical AND with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $02018C		  ; 8F 8C 01 02 | Store accumulator to absolute long address
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	EOR ($40,X)		  ; 41 40 | Exclusive OR with accumulator ((zero page,X))
	INC $0070,X		  ; FE 70 00 | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ROR $BE00,X		  ; 7E 00 BE | Rotate right (absolute,X)
	BIT $0C00			; 2C 00 0C | Test bits in accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	CMP ($D0,X)		  ; C1 D0 | Compare accumulator ((zero page,X))
	CPX #$61			 ; E0 61 | Compare X register (immediate)
	CPX #$71			 ; E0 71 | Compare X register (immediate)
	BEQ $3B			  ; F0 3B | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)
	ROL $1C01			; 2E 01 1C | Rotate left (absolute)
	ASL $0E01,X		  ; 1E 01 0E | Arithmetic shift left (absolute,X)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 0C 8F 06 | Store accumulator to absolute long,X
	SBC $F70B			; ED 0B F7 | Subtract with carry (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1B8
; Address: $FBCFD1
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1B8:
	STY $8670			; 8C 70 86 | Store Y register to absolute address
	BCS $47			  ; B0 47 | Branch if carry set
	BMI $C7			  ; 30 C7 | Branch if negative
	BPL $E7			  ; 10 E7 | Branch if positive
	BMI $C3			  ; 30 C3 | Branch if negative
	BPL $E1			  ; 10 E1 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CMP ($7E,X)		  ; C1 7E | Compare accumulator ((zero page,X))
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	INC $FC3D,X		  ; FE 3D FC | Increment (absolute,X)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	INC $F13F,X		  ; FE 3F F1 | Increment (absolute,X)
	SBC ($80),Y		  ; F1 80 | Subtract with carry ((zero page),Y)
	ASL $00FE,X		  ; 1E FE 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1B9
; Address: $FBCFF4
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1B9:
	ROR $3C00,X		  ; 7E 00 3C | Rotate right (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BRA $78			  ; 80 78 | Branch always
	SEC				  ; 38 | Set carry flag
	INC $DC70			; EE 70 DC | Increment (absolute)
	BEQ $BC			  ; F0 BC | Branch if equal
	INC $7E			  ; E6 7E | Increment (zero page)
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	DEC $FE			  ; C6 FE | Decrement (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($28,X)		  ; 01 28 | Logical OR with accumulator ((zero page,X))
	BVC $03			  ; 50 03 | Branch if overflow clear
	BCS $01			  ; B0 01 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1BA
; Address: $FBD01B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1BA:
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1BB
; Address: $FBD026
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1BB:
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $04			  ; F0 04 | Branch if equal
	ROR $6700			; 6E 00 67 | Rotate right (absolute)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1BC
; Address: $FBD04B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1BC:
	JSR $0839			; 20 39 08 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	ORA $1E			  ; 05 1E | Logical OR with accumulator (zero page)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1BD
; Address: $FBD05C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1BD:
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	LDX $0B2F			; AE 2F 0B | Load from absolute address into X register
	ORA $151F,X		  ; 1D 1F 15 | Logical OR with accumulator (absolute,X)
	AND $6B3E,Y		  ; 39 3E 6B | Logical AND with accumulator (absolute,Y)
	ROR $7E63,X		  ; 7E 63 7E | Rotate right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	BRA $50			  ; 80 50 | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	BRA $02			  ; 80 02 | Branch always
	BRA $02			  ; 80 02 | Branch always
	INC $F77F,X		  ; FE 7F F7 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1BE
; Address: $FBD08B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1BE:
	LDA				  ; BF 4F BE E7 | Load from absolute long,X into accumulator
	EOR $7F00,X		  ; 5D 00 7F | Exclusive OR with accumulator (absolute,X)
	ROR $5700,X		  ; 7E 00 57 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1BF
; Address: $FBD09B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1BF:
	LDA				  ; BF 00 0E 80 | Load from absolute long,X into accumulator
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	AND $FCDF,X		  ; 3D DF FC | Logical AND with accumulator (absolute,X)
	PEA #$FF7F		   ; F4 7F FF | Push effective address to stack
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ORA $3C00,X		  ; 1D 00 3C | Logical OR with accumulator (absolute,X)
	INC $FF48,X		  ; FE 48 FF | Increment (absolute,X)
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	INC $F92F,X		  ; FE 2F F9 | Increment (absolute,X)
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1C0
; Address: $FBD0CE
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1C0:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	STY $877C			; 8C 7C 87 | Store Y register to absolute address
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	STZ $077F,X		  ; 9E 7F 07 | Store zero to absolute,X
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $0C2C,X		  ; 1E 2C 0C | Arithmetic shift left (absolute,X)
	ROL $0B06			; 2E 06 0B | Rotate left (absolute)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1C1
; Address: $FBD10C
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1C1:
	BCS $F0			  ; B0 F0 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BNE $24			  ; D0 24 | Branch if not equal
	BNE $2A			  ; D0 2A | Branch if not equal
	PEA #$7E09		   ; F4 09 7E | Push effective address to stack
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	ASL $0303			; 0E 03 03 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $F83E,X		  ; FE 3E F8 | Increment (absolute,X)
	SBC $0083,X		  ; FD 83 00 | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $3800,X		  ; DE 00 38 | Decrement (absolute,X)
	BRA $8C			  ; 80 8C | Branch always
	CMP $9478,Y		  ; D9 78 94 | Compare accumulator (absolute,Y)
	STY $C47C			; 8C 7C C4 | Store Y register to absolute address
	ROR $3E			  ; 66 3E | Rotate right (zero page)
	ROR $3E			  ; 66 3E | Rotate right (zero page)
	DEC $3E			  ; C6 3E | Decrement (zero page)
	ASL $41			  ; 06 41 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($EF,X)		  ; 01 EF | Logical OR with accumulator ((zero page,X))
	ROR $CF0B			; 6E 0B CF | Rotate right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $060B			; 4D 0B 06 | Exclusive OR with accumulator (absolute)
	BPL $E0			  ; 10 E0 | Game work RAM access
	DEY				  ; 88 | Decrement Y register
	ADC ($10),Y		  ; 71 10 | Add with carry ((zero page),Y)
	BCC $62			  ; 90 62 | Branch if carry clear
	BMI $C2			  ; 30 C2 | Branch if negative
	BCS $40			  ; B0 40 | Branch if carry set
	BEQ $02			  ; F0 02 | Branch if equal
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1C2
; Address: $FBD1C0
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1C2:
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FE			  ; E6 FE | Increment (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	TSX				  ; BA | Transfer stack pointer to X register
	JMP $1B2D3F		  ; 5C 3F 2D 1B | Jump to address long
	ORA $0907,Y		  ; 19 07 09 | Logical OR with accumulator (absolute,Y)
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	STX $86			  ; 86 86 | Store X register to zero page
	LSR $46			  ; 46 46 | Logical shift right (zero page)
	INC $F8EE			; EE EE F8 | Increment (absolute)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	BIT $A802			; 2C 02 A8 | Test bits in accumulator (absolute)
	BPL $02			  ; 10 02 | Branch if positive
	ASL $0B0E,X		  ; 1E 0E 0B | Arithmetic shift left (absolute,X)
	ORA $0A03			; 0D 03 0A | Logical OR with accumulator (absolute)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	AND $6B3E,X		  ; 3D 3E 6B | Logical AND with accumulator (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	SBC $5BB4			; ED B4 5B | Subtract with carry (absolute)
	EOR #$FE			 ; 49 FE | Exclusive OR with accumulator (immediate)
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	INC $B700,X		  ; FE 00 B7 | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	BRA $FF			  ; 80 FF | Branch always
	LDA				  ; BF 87 F7 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1C3
; Address: $FBD267
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1C3:
	STA ($83,X)		  ; 81 83 | Store accumulator to (zero page,X)
	CPY #$13			 ; C0 13 | Compare Y register (immediate)
	LDY #$47			 ; A0 47 | Load immediate value into Y register
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $03			  ; 80 03 | Branch always
	BRA $00			  ; 80 00 | Branch always
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SBC $E67F,Y		  ; F9 7F E6 | Subtract with carry (absolute,Y)
	ORA $F3F6			; 0D F6 F3 | Logical OR with accumulator (absolute)
	INC $FF00			; EE 00 FF | Increment (absolute)
	INC $FA00,X		  ; FE 00 FA | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SEP #$06			 ; E2 06 | Set processor status bits
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	AND $0706,Y		  ; 39 06 07 | Logical AND with accumulator (absolute,Y)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	PLX				  ; FA | Pull X register from stack
	INC				  ; 1A | Increment accumulator
	PLX				  ; FA | Pull X register from stack
	ASL $86FE,X		  ; 1E FE 86 | Arithmetic shift left (absolute,X)
	ADC $6FFE			; 6D FE 6F | Add with carry (absolute)
	PHX				  ; DA | Push X register to stack
	LDX $0598,Y		  ; BE 98 05 | Load from absolute,Y into X register
	BRA $05			  ; 80 05 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $83			  ; 80 83 | Branch always
	JMP ($00FF)		  ; 6C FF 00 | Jump to address (absolute indirect)
	LDX $4040,Y		  ; BE 40 40 | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1C4
; Address: $FBD302
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1C4:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1C6
; Address: $FBD351
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1C6:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	INC $D800,X		  ; FE 00 D8 | Increment (absolute,X)
	CPY $6A3C			; CC 3C 6A | Compare Y register (absolute)
	DEC				  ; 3A | Decrement accumulator
	SBC $F54F,X		  ; FD 4F F5 | Subtract with carry (absolute,X)
	ROR $1577			; 6E 77 15 | Rotate right (absolute)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	ORA $20			  ; 05 20 | Logical OR with accumulator (zero page)
	BEQ $08			  ; F0 08 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	ADC $9870			; 6D 70 98 | Add with carry (absolute)
	BEQ $A8			  ; F0 A8 | Branch if equal
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	STA $3800			; 8D 00 38 | Store accumulator to absolute address
	INX				  ; E8 | Increment X register
	BPL $F0			  ; 10 F0 | Branch if positive
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $0F			  ; 10 0F | Branch if positive
	BIT $3B0F			; 2C 0F 3B | Test bits in accumulator (absolute)
	ORA $090C,X		  ; 1D 0C 09 | Logical OR with accumulator (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $0F02,X		  ; 1D 02 0F | Logical OR with accumulator (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR $7CF4			; 6E F4 7C | Rotate right (absolute)
	BNE $F0			  ; D0 F0 | Branch if not equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1C7
; Address: $FBD3F0
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1C7:
	PHP				  ; 08 | Push processor status to stack
	ASL $FC60,X		  ; 1E 60 FC | Arithmetic shift left (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROR $D8D8			; 6E D8 D8 | Rotate right (absolute)
	INC $D800,X		  ; FE 00 D8 | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $60			  ; F0 60 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BVS $04			  ; 70 04 | Branch if overflow set
	BEQ $04			  ; F0 04 | Branch if equal
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	BCC $60			  ; 90 60 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	BVS $08			  ; 70 08 | Branch if overflow set
	BEQ $18			  ; F0 18 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BCS $70			  ; B0 70 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1C8
; Address: $FBD534
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1C8:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BRA $4E			  ; 80 4E | Branch always
	BCS $85			  ; B0 85 | Branch if carry set
	PLY				  ; 7A | Pull Y register from stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CLD				  ; D8 | Clear decimal mode flag
	BVC $70			  ; 50 70 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	ROL $693E			; 2E 3E 69 | Rotate left (absolute)
	BPL $E0			  ; 10 E0 | Game work RAM access
	BMI $C0			  ; 30 C0 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1CA
; Address: $FBD5D6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1CA:
	JSR $8008			; 20 08 80 | Jump to subroutine
	BPL $C0			  ; 10 C0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	BRA $09			  ; 80 09 | Branch always
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1CB
; Address: $FBD60C
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1CB:
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $70			  ; F0 70 | Branch if equal
	ADC $9EF9,Y		  ; 79 F9 9E | Add with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $C600			; EE 00 C6 | Increment (absolute)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	REP #$00			 ; C2 00 | Reset processor status bits
	STZ $EE			  ; 64 EE | Store zero to zero page
	INC $C6C6			; EE C6 C6 | Increment (absolute)
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	REP #$C2			 ; C2 C2 | Reset processor status bits
	STZ $64			  ; 64 64 | Store zero to zero page
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BPL $10			  ; 10 10 | Branch if positive
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1CE
; Address: $FBD706
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1CE:
	JMP $FB30			; 4C 30 FB | Jump to address
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	STA $40B870		  ; 8F 70 B8 40 | Store accumulator to absolute long address
	BIT $CBE3			; 2C E3 CB | Test bits in accumulator (absolute)
	CPY $9E			  ; C4 9E | Compare Y register (zero page)
	BRA $95			  ; 80 95 | Branch always
	BRA $22			  ; 80 22 | Branch always
	STZ $001F,X		  ; 9E 1F 00 | Store zero to absolute,X
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BPL $0F			  ; 10 0F | Branch if positive
	BMI $0F			  ; 30 0F | Branch if negative
	ADC ($1E,X)		  ; 61 1E | Add with carry ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	CMP $6020,X		  ; DD 20 60 | Compare accumulator (absolute,X)
	BRA $F0			  ; 80 F0 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CPX $8800			; EC 00 88 | Compare X register (absolute)
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1CF
; Address: $FBD750
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1CF:
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPX $8877			; EC 77 88 | Compare X register (absolute)
	INC $A410			; EE 10 A4 | Increment (absolute)
	BNE $FF			  ; D0 FF | Branch if not equal
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	LDY $7EFF,X		  ; BC FF 7E | Load from absolute,X into Y register
	BRA $10			  ; 80 10 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $C8			  ; F0 C8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	LSR $FE			  ; 46 FE | Logical shift right (zero page)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	PLX				  ; FA | Pull X register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	PLX				  ; FA | Pull X register from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1D0
; Address: $FBD7C2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1D0:
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	CPX $FCEC			; EC EC FC | Compare X register (absolute)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1D1
; Address: $FBD7D1
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1D1:
	DEY				  ; 88 | Decrement Y register
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	BEQ $04			  ; F0 04 | Branch if equal
	BPL $04			  ; 10 04 | Branch if positive
	INC $72FF,X		  ; FE FF 72 | Increment (absolute,X)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	CPY $3C3F			; CC 3F 3C | Compare Y register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	INC $FD07,X		  ; FE 07 FD | Increment (absolute,X)
	ASL $3EF5			; 0E F5 3E | Arithmetic shift left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	CPX $0087			; EC 87 00 | Compare X register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BRA $5F			  ; 80 5F | Branch always
	STA $FF3FFF		  ; 8F FF 3F FF | Store accumulator to absolute long address
	STA $003F00		  ; 8F 00 3F 00 | Store accumulator to absolute long address
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	LDA				  ; BF 7F DC 3D | Load from absolute long,X into accumulator
	LDY $BCDB,X		  ; BC DB BC | Load from absolute,X into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	SBC $FDFF,X		  ; FD FF FD | Subtract with carry (absolute,X)
	SBC $F9FB,X		  ; FD FB F9 | Subtract with carry (absolute,X)
	ROR $FE9B,X		  ; 7E 9B FE | Rotate right (absolute,X)
	INC $FEC3,X		  ; FE C3 FE | Increment (absolute,X)
	SBC $F900,X		  ; FD 00 F9 | Subtract with carry (absolute,X)
	SBC $F000,Y		  ; F9 00 F0 | Subtract with carry (absolute,Y)
	WDM #$00			 ; 42 00 | Reserved instruction
	INC				  ; 1A | Increment accumulator
	REP #$02			 ; C2 02 | Reset processor status bits
	INC $FF41,X		  ; FE 41 FF | Increment (absolute,X)
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	INC $F8C0,X		  ; FE C0 F8 | Increment (absolute,X)
	BRA $F1			  ; 80 F1 | Branch always
	BPL $F2			  ; 10 F2 | Branch if positive
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1D2
; Address: $FBD8B7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1D2:
	RTI				  ; 40 | Return from interrupt
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BRA $0E			  ; 80 0E | Branch always
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	STZ $3632,X		  ; 9E 32 36 | Store zero to absolute,X
	STA $FF			  ; 85 FF | Store accumulator to zero page
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BCC $62			  ; 90 62 | Branch if carry clear
	DEX				  ; CA | Decrement X register
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA $8902			; 0D 02 89 | Logical OR with accumulator (absolute)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $0E07			; 0E 07 0E | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	ROR $60			  ; 66 60 | Rotate right (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1D3
; Address: $FBD91D
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1D3:
	JSR $4619			; 20 19 46 | Jump to subroutine
	BRA $2F			  ; 80 2F | Branch always
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	ADC $FCFF,X		  ; 7D FF FC | Add with carry (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	ADC $7C00,X		  ; 7D 00 7C | Add with carry (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FD83,X		  ; FE 83 FD | Increment (absolute,X)
	SBC $F8CD,X		  ; FD CD F8 | Subtract with carry (absolute,X)
	ORA $30F0,Y		  ; 19 F0 30 | Logical OR with accumulator (absolute,Y)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1D6
; Address: $FBD9A7
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1D6:
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	STA				  ; 9F 7F 4F 3E | Store accumulator to absolute long,X
	ASL $C003			; 0E 03 C0 | Arithmetic shift left (absolute)
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	ORA ($6A,X)		  ; 01 6A | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	EOR ($C0,X)		  ; 41 C0 | Exclusive OR with accumulator ((zero page,X))
	SEP #$9D			 ; E2 9D | Set processor status bits
	ROR $FE61,X		  ; 7E 61 FE | Rotate right (absolute,X)
	CPX #$9E			 ; E0 9E | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	INX				  ; E8 | Increment X register
	BEQ $C1			  ; F0 C1 | Branch if equal
	ROL $1CE3,X		  ; 3E E3 1C | Rotate left (absolute,X)
	SEP #$1C			 ; E2 1C | Set processor status bits
	INC $DC00,X		  ; FE 00 DC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1D7
; Address: $FBD9DD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1D7:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	BPL $0D			  ; 10 0D | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1D8
; Address: $FBD9E7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1D8:
	JSL $032A05		  ; 22 05 2A 03 | Jump to subroutine long
	JMP $485806		  ; 5C 06 58 48 | Jump to address long
	BVC $00			  ; 50 00 | Branch if overflow clear
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1D9
; Address: $FBD9FA
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1D9:
	JSR $211F			; 20 1F 21 | PPU graphics register access
	ASL $5827,X		  ; 1E 27 58 | Arithmetic shift left (absolute,X)
	EOR $6300,X		  ; 5D 00 63 | Exclusive OR with accumulator (absolute,X)
	STZ $6798			; 9C 98 67 | Store zero to absolute
	BRA $99			  ; 80 99 | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDX #$5D			 ; A2 5D | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	ROR $99			  ; 66 99 | Rotate right (zero page)
	ROL $F9C1,X		  ; 3E C1 F9 | Rotate left (absolute,X)
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	LDX $06			  ; A6 06 | Load from zero page into X register
	REP #$02			 ; C2 02 | Reset processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	PHY				  ; 5A | Push Y register to stack
	LDA ($0D,X)		  ; A1 0D | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1DA
; Address: $FBDA39
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1DA:
	BEQ $3C			  ; F0 3C | Branch if equal
	CMP ($F6,X)		  ; C1 F6 | Compare accumulator ((zero page,X))
	ORA #$FA			 ; 09 FA | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1DB
; Address: $FBDA56
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1DB:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1DC
; Address: $FBDA5F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1DC:
	BRA $00			  ; 80 00 | Branch always
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ASL $21			  ; 06 21 | PPU graphics register access
	INC				  ; 1A | Increment accumulator
	EOR $23			  ; 45 23 | Exclusive OR with accumulator (zero page)
	JMP $000000		  ; 5C 00 00 00 | Jump to address long
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1DD
; Address: $FBDA7C
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1DD:
	JSR $001F			; 20 1F 00 | Jump to subroutine
	CPX #$19			 ; E0 19 | Compare X register (immediate)
	LDY $03			  ; A4 03 | Load from zero page into Y register
	AND $A05F			; 2D 5F A0 | Logical AND with accumulator (absolute)
	DEC $E300			; CE 00 E3 | Decrement (absolute)
	INC $19			  ; E6 19 | Increment (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	LSR $06			  ; 46 06 | Logical shift right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	PLX				  ; FA | Pull X register from stack
	ASL $A6			  ; 06 A6 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	EOR ($6D,X)		  ; 41 6D | Exclusive OR with accumulator ((zero page,X))
	BCC $04			  ; 90 04 | Branch if carry clear
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP ($5A),Y		  ; D1 5A | Compare accumulator ((zero page),Y)
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1DF
; Address: $FBDAD4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1DF:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1E0
; Address: $FBDADD
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1E0:
	BRA $60			  ; 80 60 | Branch always
	BRA $8F			  ; 80 8F | Branch always
	CPY #$CE			 ; C0 CE | Compare Y register (immediate)
	CPY #$E2			 ; C0 E2 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$B5			 ; E0 B5 | Compare X register (immediate)
	STA				  ; 9F 7F 82 7F | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt
	BMI $8F			  ; 30 8F | Branch if negative
	AND ($8E),Y		  ; 31 8E | Logical AND with accumulator ((zero page),Y)
	ORA $1F82,X		  ; 1D 82 1F | Logical OR with accumulator (absolute,X)
	BRA $0A			  ; 80 0A | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	ORA $2D2B			; 0D 2B 2D | Logical OR with accumulator (absolute)
	ADC $FFDB,X		  ; 7D DB FF | Add with carry (absolute,X)
	SBC $00F0,X		  ; FD F0 00 | Subtract with carry (absolute,X)
	BVS $81			  ; 70 81 | Branch if overflow set
	BNE $01			  ; D0 01 | Branch if not equal
	BRA $01			  ; 80 01 | Branch always
	AND $F3FF,X		  ; 3D FF F3 | Logical AND with accumulator (absolute,X)
	DEC $7FFF			; CE FF 7F | Decrement (absolute)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SBC $F300,X		  ; FD 00 F3 | Subtract with carry (absolute,X)
	DEC $7F00			; CE 00 7F | Decrement (absolute)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	CPY $CD00			; CC 00 CD | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1E1
; Address: $FBDB6A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1E1:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1E3
; Address: $FBDBC6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1E3:
	JSL $1F193F		  ; 22 3F 19 1F | Jump to subroutine long
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1E4
; Address: $FBDBD7
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1E4:
	JSL $001900		  ; 22 00 19 00 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	INX				  ; E8 | Increment X register
	BEQ $00			  ; F0 00 | Branch if equal
	LSR $46			  ; 46 46 | Logical shift right (zero page)
	CPX $FDEC			; EC EC FD | Compare X register (absolute)
	SBC $FBDD,X		  ; FD DD FB | Subtract with carry (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	BEQ $0F			  ; F0 0F | Branch if equal
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1E5
; Address: $FBDC23
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1E5:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1E6
; Address: $FBDC28
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1E6:
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1E7
; Address: $FBDC31
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1E7:
	BRA $20			  ; 80 20 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	PHA				  ; 48 | Push accumulator to stack
	BCS $7D			  ; B0 7D | Branch if carry set
	STA ($33,X)		  ; 81 33 | Store accumulator to (zero page,X)
	AND #$6F			 ; 29 6F | Logical AND with accumulator (immediate)
	AND $407F,Y		  ; 39 7F 40 | Logical AND with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	JMP $3830			; 4C 30 38 | Jump to address

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1E8
; Address: $FBDC5C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1E8:
	BPL $00			  ; 10 00 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1E9
; Address: $FBDC64
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1E9:
	SEP #$E2			 ; E2 E2 | Set processor status bits
	STZ $FC9F,X		  ; 9E 9F FC | Store zero to absolute,X
	SBC $9706,Y		  ; F9 06 97 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ORA $3C00,X		  ; 1D 00 3C | Logical OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1EA
; Address: $FBDC82
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1EA:
	AND $753D,Y		  ; 39 3D 75 | Logical AND with accumulator (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	XBA				  ; EB | Exchange accumulator bytes
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CMP ($02,X)		  ; C1 02 | Compare accumulator ((zero page,X))
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1EB
; Address: $FBDCA1
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1EB:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1EC
; Address: $FBDCA6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1EC:
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1ED
; Address: $FBDCB0
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1ED:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $1B03			; 0E 03 1B | Arithmetic shift left (absolute)
	ORA $0006			; 0D 06 00 | Logical OR with accumulator (absolute)
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	SBC $F8FD,X		  ; FD FD F8 | Subtract with carry (absolute,X)
	INC $FE70,X		  ; FE 70 FE | Increment (absolute,X)
	EOR ($FE,X)		  ; 41 FE | Exclusive OR with accumulator ((zero page,X))
	LDX $00DC			; AE DC 00 | Load from absolute address into X register
	SBC $F800,X		  ; FD 00 F8 | Subtract with carry (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $40			  ; 80 40 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SBC $E37F,X		  ; FD 7F E3 | Subtract with carry (absolute,X)
	SBC $FA87,X		  ; FD 87 FA | Subtract with carry (absolute,X)
	SBC $FFE7,Y		  ; F9 E7 FF | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1EE
; Address: $FBDD33
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1EE:
	INC $FA00,X		  ; FE 00 FA | Increment (absolute,X)
	SBC ($02,X)		  ; E1 02 | Subtract with carry ((zero page,X))
	BRA $07			  ; 80 07 | Branch always
	CPX #$07			 ; E0 07 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1EF
; Address: $FBDD40
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1EF:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BMI $E0			  ; 30 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	BCS $F0			  ; B0 F0 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1F0
; Address: $FBDD58
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1F0:
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	AND $F90F,Y		  ; 39 0F F9 | Logical AND with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1F1
; Address: $FBDDB1
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1F1:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	INY				  ; C8 | Increment Y register
	ROR				  ; 6A | Rotate right (accumulator)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	ASL $0606,X		  ; 1E 06 06 | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	ASL $6C			  ; 06 6C | Arithmetic shift left (zero page)
	BCS $B0			  ; B0 B0 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	PHX				  ; DA | Push X register to stack
	AND $C1FE,Y		  ; 39 FE C1 | Logical AND with accumulator (absolute,Y)
	INC $FEE1,X		  ; FE E1 FE | Increment (absolute,X)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC $F9FE,Y		  ; F9 FE F9 | Subtract with carry (absolute,Y)
	INC $FCE2,X		  ; FE E2 FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1F2
; Address: $FBDE30
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1F2:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1F3
; Address: $FBDEBD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1F3:
	BRA $18			  ; 80 18 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1F5
; Address: $FBDECE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1F5:
	ROL $0038			; 2E 38 00 | Rotate left (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $3F			  ; 10 3F | Branch if positive
	BMI $3F			  ; 30 3F | Branch if negative
	BMI $3F			  ; 30 3F | Branch if negative

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1F8
; Address: $FBDEFF
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1F8:
	JSR $F614			; 20 14 F6 | Jump to subroutine
	ASL $1CF3,X		  ; 1E F3 1C | Arithmetic shift left (absolute,X)
	SBC ($1E),Y		  ; F1 1E | Subtract with carry ((zero page),Y)
	BEQ $3F			  ; F0 3F | Branch if equal
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPX #$0D			 ; E0 0D | Compare X register (immediate)
	CPY #$4B			 ; C0 4B | Compare Y register (immediate)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA $0B34			; 0D 34 0B | Logical OR with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1F9
; Address: $FBDF2F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1F9:
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1FA
; Address: $FBDF5E
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1FA:
	JSR $4FC0			; 20 C0 4F | Jump to subroutine
	ROR $FF9F,X		  ; 7E 9F FF | Rotate right (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $0E			  ; 80 0E | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BPL $20			  ; 10 20 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BMI $40			  ; 30 40 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BIT $0CFC			; 2C FC 0C | Test bits in accumulator (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	PHB				  ; 8B | Push data bank register to stack
	LDA $07			  ; A5 07 | Load from zero page into accumulator
	LSR $06			  ; 46 06 | Logical shift right (zero page)
	LDX $8E2E			; AE 2E 8E | Load from absolute address into X register
	ASL $D02C			; 0E 2C D0 | Arithmetic shift left (absolute)
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	CPX #$58			 ; E0 58 | Compare X register (immediate)
	LDA ($58,X)		  ; A1 58 | Load from (zero page,X) into accumulator
	LDA ($B8,X)		  ; A1 B8 | Load from (zero page,X) into accumulator
	WDM #$50			 ; 42 50 | Reserved instruction
	BVS $82			  ; 70 82 | Branch if overflow set
	BPL $1F			  ; 10 1F | Branch if positive
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BRA $22			  ; 80 22 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1FC
; Address: $FBE028
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1FC:
	PEA #$DEF4		   ; F4 F4 DE | Push effective address to stack
	DEC $FFFF,X		  ; DE FF FF | Decrement (absolute,X)
	LDA				  ; BF FF 7D 02 | Load from absolute long,X into accumulator
	CMP $D702,X		  ; DD 02 D7 | Compare accumulator (absolute,X)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1FE
; Address: $FBE048
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1FE:
	ASL $837E			; 0E 7E 83 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STA $108F			; 8D 8F 10 | Store accumulator to absolute address
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	ROR				  ; 6A | Rotate right (accumulator)
	ASL $0FE7			; 0E E7 0F | Arithmetic shift left (absolute)
	PHB				  ; 8B | Push data bank register to stack
	STA $FFFFFB		  ; 8F FB FF FF | Store accumulator to absolute long address
	BCC $62			  ; 90 62 | Branch if carry clear
	BPL $E7			  ; 10 E7 | Branch if positive
	BPL $E7			  ; 10 E7 | Branch if positive
	BNE $23			  ; D0 23 | Branch if not equal
	BVS $03			  ; 70 03 | Branch if overflow set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FE			  ; E6 FE | Increment (zero page)
	STA $FF81FF		  ; 8F FF 81 FF | Store accumulator to absolute long address
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $00			  ; E6 00 | Increment (zero page)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ROL $FF3E,X		  ; 3E 3E FF | Rotate left (absolute,X)
	PEA #$10FF		   ; F4 FF 10 | Push effective address to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	INC				  ; 1A | Increment accumulator
	SBC ($06,X)		  ; E1 06 | Subtract with carry ((zero page,X))
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_1FF
; Address: $FBE0C9
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_1FF:
	ASL $88			  ; 06 88 | Arithmetic shift left (zero page)
	STX $FE70			; 8E 70 FE | Store X register to absolute address
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SBC ($C8,X)		  ; E1 C8 | Subtract with carry ((zero page,X))
	AND ($F1),Y		  ; 31 F1 | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	BNE $07			  ; D0 07 | Branch if not equal
	ROR $7F			  ; 66 7F | Rotate right (zero page)
	RTI				  ; 40 | Return from interrupt
	BCS $28			  ; B0 28 | Branch if carry set
	BNE $B8			  ; D0 B8 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive
	BMI $E0			  ; 30 E0 | Game work RAM access
	BMI $E0			  ; 30 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank76_DmaFunction_200
; Address: $FBE10C
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_200:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	STY $9EA1			; 8C A1 9E | Store Y register to absolute address
	LDA ($9E,X)		  ; A1 9E | Load from (zero page,X) into accumulator
	CPY $C09E			; CC 9E C0 | Compare Y register (absolute)
	LDA ($E1,X)		  ; A1 E1 | Load from (zero page,X) into accumulator
	CMP #$F9			 ; C9 F9 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 40 BF 40 | Load from absolute long,X into accumulator
	LDA				  ; BF 01 BE 21 | Load from absolute long,X into accumulator
	STZ $801E,X		  ; 9E 1E 80 | Store zero to absolute,X
	ASL $C0			  ; 06 C0 | Arithmetic shift left (zero page)
	BEQ $DA			  ; F0 DA | Branch if equal
	ASL $1C5C,X		  ; 1E 5C 1C | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_201
; Address: $FBE148
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_201:
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	STY $F8			  ; 84 F8 | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_202
; Address: $FBE150
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_202:
	JSR $A0C2			; 20 C2 A0 | Jump to subroutine
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	BRA $08			  ; 80 08 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $87FF			; 8E FF 87 | Store X register to absolute address
	SBC $FEC7,X		  ; FD C7 FE | Subtract with carry (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	STX $8500			; 8E 00 85 | Store X register to absolute address
	DEC $00			  ; C6 00 | Decrement (zero page)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	LDA				  ; BF BF CF 8F | Load from absolute long,X into accumulator
	SBC $F000,X		  ; FD 00 F0 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $BF00,X		  ; FE 00 BF | Increment (absolute,X)
	STA $008300		  ; 8F 00 83 00 | Store accumulator to absolute long address
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_203
; Address: $FBE220
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_203:
	JSR $A9FF			; 20 FF A9 | Jump to subroutine
	CMP $DFFF,X		  ; DD FF DF | Compare accumulator (absolute,X)
	LDA $9FAFDF		  ; AF DF AF 9F | Load from absolute long address into accumulator
	LDA #$00			 ; A9 00 | Load immediate value into accumulator
	CMP $CF00,X		  ; DD 00 CF | Compare accumulator (absolute,X)
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	INX				  ; E8 | Increment X register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_204
; Address: $FBE263
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_204:
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CLV				  ; B8 | Clear overflow flag
	LDY $7CFF,X		  ; BC FF 7C | Load from absolute,X into Y register
	JMP $3F5D7F		  ; 5C 7F 5D 3F | Jump to address long
	CLV				  ; B8 | Clear overflow flag
	LDY $7C00,X		  ; BC 00 7C | Load from absolute,X into Y register
	JMP $001D00		  ; 5C 00 1D 00 | Jump to address long
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	LSR $FE			  ; 46 FE | Logical shift right (zero page)
	LSR $DEFE			; 4E FE DE | Logical shift right (absolute)
	INC $8000,X		  ; FE 00 80 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	JMP $DC00			; 4C 00 DC | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_205
; Address: $FBE2C2
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_205:
	ADC $4060,Y		  ; 79 60 40 | Add with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	STX $83FE			; 8E FE 83 | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $107F			; 8C 7F 10 | Store Y register to absolute address
	ASL $59			  ; 06 59 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	ASL $07F5			; 0E F5 07 | Arithmetic shift left (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	BRA $72			  ; 80 72 | Branch always
	PHP				  ; 08 | Push processor status to stack
	SBC ($88),Y		  ; F1 88 | Subtract with carry ((zero page),Y)
	ADC ($E8),Y		  ; 71 E8 | Add with carry ((zero page),Y)
	ORA ($78),Y		  ; 11 78 | Logical OR with accumulator ((zero page),Y)
	BPL $03			  ; 10 03 | Branch if positive
	AND $181F,X		  ; 3D 1F 18 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $0607			; 0D 07 06 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF FF 1F FF | Load from absolute long,X into accumulator
	STA $FF87FF		  ; 8F FF 87 FF | Store accumulator to absolute long address
	LDA				  ; BF 00 1F 00 | Load from absolute long,X into accumulator
	STA $008700		  ; 8F 00 87 00 | Store accumulator to absolute long address
	SBC $FDFF,Y		  ; F9 FF FD | Subtract with carry (absolute,Y)
	SBC $FF			  ; E5 FF | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_206
; Address: $FBE34A
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_206:
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC $FD00,Y		  ; F9 00 FD | Subtract with carry (absolute,Y)
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $FC			  ; F0 FC | Branch if equal
	CMP $87BF,Y		  ; D9 BF 87 | Compare accumulator (absolute,Y)
	STZ $B87F			; 9C 7F B8 | Store zero to absolute
	DEC $CCFF			; CE FF CC | Decrement (absolute)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CLV				  ; B8 | Clear overflow flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$33			 ; C0 33 | Compare Y register (immediate)
	CPX $E0BC			; EC BC E0 | Game work RAM access
	BVS $E0			  ; 70 E0 | Game work RAM access
	BMI $E0			  ; 30 E0 | Game work RAM access
	BMI $E0			  ; 30 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank76_DmaFunction_207
; Address: $FBE38A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_207:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_209
; Address: $FBE397
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_209:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BPL $0E			  ; 10 0E | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_20A
; Address: $FBE3AD
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_20A:
	JSR $603E			; 20 3E 60 | Jump to subroutine
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FE7C,X		  ; FE 7C FE | Increment (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BRA $70			  ; 80 70 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	DEC $C77F			; CE 7F C7 | Decrement (absolute)
	ADC $7EE7,X		  ; 7D E7 7E | Add with carry (absolute,X)
	ROR $3E7F,X		  ; 7E 7F 3E | Rotate right (absolute,X)
	LSR $4500			; 4E 00 45 | Logical shift right (absolute)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROL $3F00,X		  ; 3E 00 3F | Rotate left (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_20B
; Address: $FBE42B
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_20B:
	BMI $4F			  ; 30 4F | Branch if negative
	RTI				  ; 40 | Return from interrupt
	STX $02C0			; 8E C0 02 | Store X register to absolute address
	CLC				  ; 18 | Clear carry flag
	BMI $4F			  ; 30 4F | Branch if negative
	AND ($8E),Y		  ; 31 8E | Logical AND with accumulator ((zero page),Y)
	ADC $BCFF,Y		  ; 79 FF BC | Add with carry (absolute,Y)
	PHB				  ; 8B | Push data bank register to stack
	ADC $1C00,Y		  ; 79 00 1C | Add with carry (absolute,Y)
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	BVS $80			  ; 70 80 | Branch if overflow set
	SBC $F9FE,Y		  ; F9 FE F9 | Subtract with carry (absolute,Y)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SBC $E7FF,Y		  ; F9 FF E7 | Subtract with carry (absolute,Y)
	LDA				  ; BF FF FF 00 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $E700,Y		  ; F9 00 E7 | Subtract with carry (absolute,Y)
	LDA				  ; BF 00 FF E0 | Load from absolute long,X into accumulator
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC $F9FF,X		  ; FD FF F9 | Subtract with carry (absolute,X)
	INC $FCF2,X		  ; FE F2 FC | Increment (absolute,X)
	INX				  ; E8 | Increment X register
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $F800,X		  ; FD 00 F8 | Subtract with carry (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	JMP $14C0			; 4C C0 14 | Jump to address
	BRA $08			  ; 80 08 | Branch always
	BRA $08			  ; 80 08 | Branch always
	BRA $44			  ; 80 44 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_20D
; Address: $FBE4D7
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_20D:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_20E
; Address: $FBE4E1
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_20E:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_20F
; Address: $FBE4E5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_20F:
	JSR $6040			; 20 40 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_210
; Address: $FBE4EA
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_210:
	JSR $2030			; 20 30 20 | Jump to subroutine
	BMI $A8			  ; 30 A8 | Branch if negative
	BCS $80			  ; B0 80 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $0F09,Y		  ; 19 09 0F | Logical OR with accumulator (absolute,Y)
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0006,Y		  ; 19 06 00 | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_211
; Address: $FBE525
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_211:
	JSR $5040			; 20 40 50 | Jump to subroutine
	BRA $C8			  ; 80 C8 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	BNE $E8			  ; D0 E8 | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_212
; Address: $FBE534
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_212:
	JSR $50C0			; 20 C0 50 | Jump to subroutine
	LDY #$C8			 ; A0 C8 | Load immediate value into Y register
	BMI $D8			  ; 30 D8 | Branch if negative

;------------------------------------------------------------------------------
; Bank76_DmaFunction_213
; Address: $FBE53B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_213:
	JSR $007C			; 20 7C 00 | Jump to subroutine
	LDY $A200,X		  ; BC 00 A2 | Load from absolute,X into Y register
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$B5			 ; E0 B5 | Compare X register (immediate)
	STA				  ; 9F FF 5F 7F | Store accumulator to absolute long,X
	EOR ($3F,X)		  ; 41 3F | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_214
; Address: $FBE54C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_214:
	JSR $1E1F			; 20 1F 1E | Jump to subroutine
	ORA $1F82,X		  ; 1D 82 1F | Logical OR with accumulator (absolute,X)
	BRA $0A			  ; 80 0A | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	ASL $1E11			; 0E 11 1E | Arithmetic shift left (absolute)
	ADC ($7E),Y		  ; 71 7E | Add with carry ((zero page),Y)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_215
; Address: $FBE56B
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_215:
	INC $FE1F,X		  ; FE 1F FE | Increment (absolute,X)
	SBC $00E0,X		  ; FD E0 00 | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)
	ADC $FFFF,X		  ; 7D FF FF | Add with carry (absolute,X)
	SBC $EBFF,X		  ; FD FF EB | Subtract with carry (absolute,X)
	INC $F98F,X		  ; FE 8F F9 | Increment (absolute,X)
	SBC $E300,X		  ; FD 00 E3 | Subtract with carry (absolute,X)
	STX $00			  ; 86 00 | Store X register to zero page
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	LDA				  ; BF FD BF FC | Load from absolute long,X into accumulator
	LDA				  ; BF FF 7F FF | Load from absolute long,X into accumulator
	LDX $BC00,Y		  ; BE 00 BC | Load from absolute,Y into X register
	LDY $7F00,X		  ; BC 00 7F | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank76_DmaFunction_216
; Address: $FBE5C0
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_216:
	JSR $90C0			; 20 C0 90 | Jump to subroutine
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $18			  ; F0 18 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_217
; Address: $FBE5E2
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_217:
	LDA ($71),Y		  ; B1 71 | Load from (zero page),Y into accumulator
	STA $9B79,Y		  ; 99 79 9B | Store accumulator to absolute,Y
	LSR $3E			  ; 46 3E | Logical shift right (zero page)
	EOR $3C			  ; 45 3C | Exclusive OR with accumulator (zero page)
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($E8,X)		  ; 01 E8 | Logical OR with accumulator ((zero page,X))
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $D4			  ; F0 D4 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	JMP $EAF8			; 4C F8 EA | Jump to address
	PLX				  ; FA | Pull X register from stack
	ROR $2D7C,X		  ; 7E 7C 2D | Rotate right (absolute,X)
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	NOP				  ; EA | No operation
	SBC $F7FF			; ED FF F7 | Subtract with carry (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank76_DmaFunction_218
; Address: $FBE62F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_218:
	PHX				  ; DA | Push X register to stack
	RTI				  ; 40 | Return from interrupt
	NOP				  ; EA | No operation
	SBC $F700			; ED 00 F7 | Subtract with carry (absolute)
	SEP #$00			 ; E2 00 | Set processor status bits
	REP #$20			 ; C2 20 | Reset processor status bits
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_21A
; Address: $FBE663
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_21A:
	JSR $420D			; 20 0D 42 | Hardware register operation
	ASL $1541,X		  ; 1E 41 15 | Arithmetic shift left (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA $8A			  ; 05 8A | Logical OR with accumulator (zero page)
	EOR $B3C6,Y		  ; 59 C6 B3 | Exclusive OR with accumulator (absolute,Y)
	STY $030C			; 8C 0C 03 | Store Y register to absolute address
	BMI $0F			  ; 30 0F | Branch if negative

;------------------------------------------------------------------------------
; Bank76_DmaFunction_21C
; Address: $FBE67C
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_21C:
	JSR $401F			; 20 1F 40 | Jump to subroutine
	LDA				  ; BF 0F 03 03 | Load from absolute long,X into accumulator
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ROL $FE0F,X		  ; 3E 0F FE | Rotate left (absolute,X)
	ROR $FF20,X		  ; 7E 20 FF | Rotate right (absolute,X)
	ROR $D8B6			; 6E B6 D8 | Rotate right (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ROL $0E00,X		  ; 3E 00 0E | Rotate left (absolute,X)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	SBC $FE06,Y		  ; F9 06 FE | Subtract with carry (absolute,Y)
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $3FFE,X		  ; FD FE 3F | Subtract with carry (absolute,X)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC $F3FC,X		  ; FD FC F3 | Subtract with carry (absolute,X)
	SBC $3E00,X		  ; FD 00 3E | Subtract with carry (absolute,X)
	BEQ $01			  ; F0 01 | Branch if equal
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_21D
; Address: $FBE702
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_21D:
	BEQ $C0			  ; F0 C0 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $EC			  ; F0 EC | Branch if equal
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BRA $7C			  ; 80 7C | Branch always
	SED				  ; F8 | Set decimal mode flag
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	INC				  ; 1A | Increment accumulator
	AND $3A1C,X		  ; 3D 1C 3A | Logical AND with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	ROL $1C1E,X		  ; 3E 1E 1C | Rotate left (absolute,X)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $AB0E			; 0D 0E AB | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$7C			 ; A0 7C | Load immediate value into Y register
	BRA $AC			  ; 80 AC | Branch always
	BVC $8E			  ; 50 8E | Branch if overflow clear
	BVS $44			  ; 70 44 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_21E
; Address: $FBE78D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_21E:
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_221
; Address: $FBE79F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_221:
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	WDM #$03			 ; 42 03 | Reserved instruction
	LDY $01			  ; A4 01 | Load from zero page into Y register
	LDY $44			  ; A4 44 | Load from zero page into Y register
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	LDY #$43			 ; A0 43 | Load immediate value into Y register
	LDX #$41			 ; A2 41 | Load immediate value into X register
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_223
; Address: $FBE7C4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_223:
	JSR $2054			; 20 54 20 | Jump to subroutine
	ORA $06B2,Y		  ; 19 B2 06 | Logical OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	BIT $B54B			; 2C 4B B5 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_224
; Address: $FBE7D5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_224:
	JSR $2008			; 20 08 20 | Jump to subroutine
	AND #$D1			 ; 29 D1 | Logical AND with accumulator (immediate)
	ROL $BE41			; 2E 41 BE | Rotate left (absolute)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	STY $00			  ; 84 00 | Store Y register to zero page
	DEX				  ; CA | Decrement X register
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STY $0C00			; 8C 00 0C | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_225
; Address: $FBE84B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_225:
	DEC $FC00,X		  ; DE 00 FC | Decrement (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STY $0C8C			; 8C 8C 0C | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_227
; Address: $FBE85A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_227:
	DEC $FCDE,X		  ; DE DE FC | Decrement (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	ROR $7800,X		  ; 7E 00 78 | Rotate right (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ADC $1010,X		  ; 7D 10 10 | Add with carry (absolute,X)
	ROR $787E,X		  ; 7E 7E 78 | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	ADC $CA7D,X		  ; 7D 7D CA | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_228
; Address: $FBE881
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_228:
	BVC $C9			  ; 50 C9 | Branch if overflow clear
	BVC $65			  ; 50 65 | Branch if overflow clear
	BIT $2A42			; 2C 42 2A | Test bits in accumulator (absolute)
	ROL $2F			  ; 26 2F | Rotate left (zero page)
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_229
; Address: $FBE891
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_229:
	JSL $6A21D6		  ; 22 D6 21 6A | Jump to subroutine long
	ORA ($6D),Y		  ; 11 6D | Logical OR with accumulator ((zero page),Y)
	BPL $7D			  ; 10 7D | Branch if positive
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	ORA ($ED,X)		  ; 01 ED | Logical OR with accumulator ((zero page,X))
	ORA ($66),Y		  ; 11 66 | Logical OR with accumulator ((zero page),Y)
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	STA $9B89,Y		  ; 99 89 9B | Store accumulator to absolute,Y
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	DEX				  ; CA | Decrement X register
	BIT #$74			 ; 89 74 | Test bits in accumulator (immediate)
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	DEC $6630			; CE 30 66 | Decrement (absolute)
	BPL $64			  ; 10 64 | Branch if positive
	BPL $24			  ; 10 24 | Branch if positive
	BPL $B6			  ; 10 B6 | Branch if positive
	ORA ($26,X)		  ; 01 26 | Logical OR with accumulator ((zero page,X))
	ROL $14			  ; 26 14 | Rotate left (zero page)
	CPY $84E8			; CC E8 84 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP ($6C78)		  ; 6C 78 6C | Jump to address (absolute indirect)
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $78			  ; F0 78 | Branch if equal
	BEQ $D6			  ; F0 D6 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $6C10			; 2C 10 6C | Test bits in accumulator (absolute)
	BPL $9C			  ; 10 9C | Branch if positive
	STZ $0800			; 9C 00 08 | Store zero to absolute
	DEY				  ; 88 | Decrement Y register
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CMP ($FF),Y		  ; D1 FF | Compare accumulator ((zero page),Y)
	BCS $FE			  ; B0 FE | Branch if carry set
	NOP				  ; EA | No operation
	INC $FCFC,X		  ; FE FC FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_22A
; Address: $FBE915
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_22A:
	BCS $00			  ; B0 00 | Branch if carry set
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BIT $19			  ; 24 19 | Test bits in accumulator (zero page)
	EOR $0A			  ; 45 0A | Exclusive OR with accumulator (zero page)
	ROR $3D15			; 6E 15 3D | Rotate right (absolute)
	ROL $1E			  ; 26 1E | Rotate left (zero page)
	ORA $0407,X		  ; 1D 07 04 | Logical OR with accumulator (absolute,X)
	AND $1A			  ; 25 1A | Logical AND with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $0E02			; 0D 02 0E | Logical OR with accumulator (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	ORA ($55),Y		  ; 11 55 | Logical OR with accumulator ((zero page),Y)
	ADC $93D6,X		  ; 7D D6 93 | Add with carry (absolute,X)
	ADC $7C6C			; 6D 6C 7C | Add with carry (absolute)
	ORA ($7D),Y		  ; 11 7D | Logical OR with accumulator ((zero page),Y)
	BPL $C7			  ; 10 C7 | Branch if positive
	JMP ($AAD7)		  ; 6C D7 AA | Jump to address (absolute indirect)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	ADC $2082,X		  ; 7D 82 20 | Add with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	JMP ($CCA8)		  ; 6C A8 CC | Jump to address (absolute indirect)
	CLD				  ; D8 | Clear decimal mode flag
	LDY $F8			  ; A4 F8 | Load from zero page into Y register
	PHA				  ; 48 | Push accumulator to stack
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BEQ $70			  ; F0 70 | Branch if equal
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	BRA $50			  ; 80 50 | Branch always
	BRA $D0			  ; 80 D0 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_22B
; Address: $FBE9D5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_22B:
	JSR $00A0			; 20 A0 00 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_22C
; Address: $FBE9DB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_22C:
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $0703			; 0D 03 07 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FE7C,X		  ; FE 7C FE | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_22D
; Address: $FBEA09
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_22D:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BVS $A0			  ; 70 A0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_22E
; Address: $FBEA48
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_22E:
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	BVS $F1			  ; 70 F1 | Branch if overflow set
	STA				  ; 9F FF 01 FF | Store accumulator to absolute long,X
	ASL $0E80,X		  ; 1E 80 0E | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	BPL $1F			  ; 10 1F | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	BRA $07			  ; 80 07 | Branch always
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA #$F9			 ; 09 F9 | Logical OR with accumulator (immediate)
	SBC $FDFF,Y		  ; F9 FF FD | Subtract with carry (absolute,Y)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $DE0E			; 0E 0E DE | Arithmetic shift left (absolute)
	DEC $FE7D,X		  ; DE 7D FE | Decrement (absolute,X)
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	BEQ $02			  ; F0 02 | Branch if equal

;------------------------------------------------------------------------------
; Bank76_DmaFunction_22F
; Address: $FBEAD8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_22F:
	JSR $0002			; 20 02 00 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$0D			 ; E0 0D | Compare X register (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_230
; Address: $FBEB02
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_230:
	TAX				  ; AA | Transfer accumulator to X register
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	BPL $11			  ; 10 11 | Branch if positive
	EOR $C7			  ; 45 C7 | Exclusive OR with accumulator (zero page)
	INC $6C93,X		  ; FE 93 6C | Increment (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	SEC				  ; 38 | Set carry flag
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_231
; Address: $FBEB21
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_231:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	BIT $B54B			; 2C 4B B5 | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	WDM #$01			 ; 42 01 | Reserved instruction
	LDX #$00			 ; A2 00 | Load immediate value into X register
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	LDY #$41			 ; A0 41 | Load immediate value into Y register
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_232
; Address: $FBEBC8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_232:
	JSR $3854			; 20 54 38 | Jump to subroutine
	ASL $28			  ; 06 28 | Arithmetic shift left (zero page)
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_233
; Address: $FBEBD9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_233:
	JSR $2844			; 20 44 28 | Jump to subroutine
	CMP ($2E),Y		  ; D1 2E | Compare accumulator ((zero page),Y)
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	STY $00			  ; 84 00 | Store Y register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_234
; Address: $FBEC09
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_234:
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $3838,X		  ; FE 38 38 | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	LDY $07			  ; A4 07 | Load from zero page into Y register
	LDY $50C9			; AC C9 50 | Load from absolute address into Y register
	CPY $5C			  ; C4 5C | Compare Y register (zero page)
	JMP ($623E)		  ; 6C 3E 62 | Jump to address (absolute indirect)
	ROL $A3			  ; 26 A3 | Rotate left (zero page)
	RTI				  ; 40 | Return from interrupt
	LDY #$43			 ; A0 43 | Load immediate value into Y register
	AND ($DB,X)		  ; 21 DB | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_235
; Address: $FBEC57
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_235:
	JSR $1069			; 20 69 10 | Jump to subroutine
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	SBC $6611			; ED 11 66 | Subtract with carry (absolute)
	LDA $EF89,Y		  ; B9 89 EF | Load from absolute,Y into accumulator
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA ($55),Y		  ; 11 55 | Logical OR with accumulator ((zero page),Y)
	BIT #$74			 ; 89 74 | Test bits in accumulator (immediate)
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	SEC				  ; 38 | Set carry flag
	JMP ($AAD7)		  ; 6C D7 AA | Jump to address (absolute indirect)
	RTI				  ; 40 | Return from interrupt
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_236
; Address: $FBEC83
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_236:
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL $14			  ; 26 14 | Rotate left (zero page)
	DEC $F4			  ; C6 F4 | Decrement (zero page)
	CPY $E8			  ; C4 E8 | Compare Y register (zero page)
	JMP ($ACF8)		  ; 6C F8 AC | Jump to address (absolute indirect)
	SED				  ; F8 | Set decimal mode flag
	LDY $8AE8,X		  ; BC E8 8A | Load from absolute,X into Y register
	TXA				  ; 8A | Transfer X register to accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $9C10			; 2C 10 9C | Test bits in accumulator (absolute)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	LDY $C2			  ; A4 C2 | Load from zero page into Y register
	CMP #$50			 ; C9 50 | Compare accumulator (immediate)
	ADC $2C			  ; 65 2C | Add with carry (zero page)
	LSR $2E			  ; 46 2E | Logical shift right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	DEC				  ; 3A | Decrement accumulator
	ASL $A3			  ; 06 A3 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_237
; Address: $FBECB1
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_237:
	RTI				  ; 40 | Return from interrupt
	CMP ($22),Y		  ; D1 22 | Compare accumulator ((zero page),Y)
	AND ($6A,X)		  ; 21 6A | Logical AND with accumulator ((zero page,X))
	ORA ($69),Y		  ; 11 69 | Logical OR with accumulator ((zero page),Y)
	BPL $75			  ; 10 75 | Branch if positive
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($4B,X)		  ; 01 4B | Logical OR with accumulator ((zero page,X))
	SBC $6611			; ED 11 66 | Subtract with carry (absolute)
	LDA $DB89,Y		  ; B9 89 DB | Load from absolute,Y into accumulator
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	INC $FC02,X		  ; FE 02 FC | Increment (absolute,X)
	BIT #$74			 ; 89 74 | Test bits in accumulator (immediate)
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	LSR $30			  ; 46 30 | Logical shift right (zero page)
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $14			  ; 46 14 | Logical shift right (zero page)
	ROL $14			  ; 26 14 | Rotate left (zero page)
	CPY $84E8			; CC E8 84 | Compare Y register (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP ($FC78)		  ; 6C 78 FC | Jump to address (absolute indirect)
	INX				  ; E8 | Increment X register
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$8A			 ; E0 8A | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $6C10			; 2C 10 6C | Test bits in accumulator (absolute)
	BPL $9C			  ; 10 9C | Branch if positive
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	WDM #$81			 ; 42 81 | Reserved instruction
	AND $5FCF			; 2D CF 5F | Logical AND with accumulator (absolute)
	ADC ($23),Y		  ; 71 23 | Add with carry ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	WDM #$01			 ; 42 01 | Reserved instruction
	LDA #$42			 ; A9 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank76_DmaFunction_238
; Address: $FBED1B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_238:
	JSR $10EB			; 20 EB 10 | Jump to subroutine
	ADC $0000			; 6D 00 00 | Add with carry (absolute)
	JMP ($9282)		  ; 6C 82 92 | Jump to address (absolute indirect)
	PLB				  ; AB | Pull data bank register from stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ADC $7D83,X		  ; 7D 83 7D | Add with carry (absolute,X)
	JMP ($9200)		  ; 6C 00 92 | Jump to address (absolute indirect)
	JMP ($54AB)		  ; 6C AB 54 | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	JMP ($AAD7)		  ; 6C D7 AA | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_239
; Address: $FBED47
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_239:
	STY $02			  ; 84 02 | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	LDX $F4			  ; A6 F4 | Load from zero page into X register
	LDX $EC			  ; A6 EC | Load from zero page into X register
	JMP $0000C8		  ; 5C C8 00 00 | Jump to address long
	STY $00			  ; 84 00 | Store Y register to zero page
	ROL				  ; 2A | Rotate left (accumulator)
	STY $96			  ; 84 96 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	STX $2C10			; 8E 10 2C | Store X register to absolute address
	LSR $07			  ; 46 07 | Logical shift right (zero page)
	LDA $52C8			; AD C8 52 | Load from absolute address into accumulator
	CPY $5D			  ; C4 5D | Compare Y register (zero page)
	ROR $3E6D			; 6E 6D 3E | Rotate right (absolute)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	LDA ($42,X)		  ; A1 42 | Hardware register operation
	AND ($D9,X)		  ; 21 D9 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank76_DmaFunction_23A
; Address: $FBED77
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_23A:
	JSL $7710EF		  ; 22 EF 10 77 | Jump to subroutine long
	ROR $6B01,X		  ; 7E 01 6B | Rotate right (absolute,X)
	SBC $5111			; ED 11 51 | Subtract with carry (absolute)
	EOR ($28,X)		  ; 41 28 | Exclusive OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	ORA ($55),Y		  ; 11 55 | Logical OR with accumulator ((zero page),Y)
	ADC $10D6			; 6D D6 10 | Add with carry (absolute)
	INC $9311,X		  ; FE 11 93 | Increment (absolute,X)
	AND $3892			; 2D 92 38 | Logical AND with accumulator (absolute)
	JMP ($AAD7)		  ; 6C D7 AA | Jump to address (absolute indirect)
	DEC $FE			  ; C6 FE | Decrement (zero page)
	ORA ($93,X)		  ; 01 93 | Logical OR with accumulator ((zero page,X))
	JMP ($C480)		  ; 6C 80 C4 | Jump to address (absolute indirect)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_23B
; Address: $FBEDA3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_23B:
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL $94			  ; 26 94 | Rotate left (zero page)
	ASL $34			  ; 06 34 | Arithmetic shift left (zero page)
	LDX $EC			  ; A6 EC | Load from zero page into X register
	JMP ($ACF8)		  ; 6C F8 AC | Jump to address (absolute indirect)
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	DEC $DC10			; CE 10 DC | Decrement (absolute)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	STA				  ; 9F 3F 8F 1F | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank76_DmaFunction_23C
; Address: $FBEDD2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_23C:
	JSR $8000			; 20 00 80 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	BRA $60			  ; 80 60 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_23D
; Address: $FBEDDF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_23D:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	BEQ $90			  ; F0 90 | Branch if equal
	STZ $8694			; 9C 94 86 | Store zero to absolute
	TXA				  ; 8A | Transfer X register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_23E
; Address: $FBEE1C
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_23E:
	PLA				  ; 68 | Pull accumulator from stack
	BPL $74			  ; 10 74 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $0B23,X		  ; 1D 23 0B | Logical OR with accumulator (absolute,X)
	ASL $46			  ; 06 46 | Arithmetic shift left (zero page)
	ROL $246E			; 2E 6E 24 | Rotate left (absolute)
	ROR $1A34			; 6E 34 1A | Rotate right (absolute)
	ROL $1B			  ; 26 1B | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL $1601,X		  ; 3E 01 16 | Rotate left (absolute,X)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ADC $55D6			; 6D D6 55 | Add with carry (absolute)
	AND #$83			 ; 29 83 | Logical AND with accumulator (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	TSX				  ; BA | Transfer stack pointer to X register
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	DEC $D7			  ; C6 D7 | Decrement (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLB				  ; AB | Pull data bank register from stack
	TSX				  ; BA | Transfer stack pointer to X register
	EOR $10			  ; 45 10 | Exclusive OR with accumulator (zero page)
	BPL $EF			  ; 10 EF | Branch if positive
	INC $F0E8,X		  ; FE E8 F0 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_23F
; Address: $FBEE63
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_23F:
	INX				  ; E8 | Increment X register
	LDY #$C8			 ; A0 C8 | Load immediate value into Y register
	CLD				  ; D8 | Clear decimal mode flag
	BNE $FC			  ; D0 FC | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	BCC $C8			  ; 90 C8 | Branch if carry clear
	BCS $88			  ; B0 88 | Branch if carry set
	BCC $00			  ; 90 00 | Branch if carry clear
	BNE $20			  ; D0 20 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_240
; Address: $FBEE7C
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_240:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $1B17			; 0E 17 1B | Arithmetic shift left (absolute)
	ROL $0B			  ; 26 0B | Rotate left (zero page)
	WDM #$25			 ; 42 25 | Reserved instruction
	BIT $1816			; 2C 16 18 | Test bits in accumulator (absolute)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $0601			; 0E 01 06 | Arithmetic shift left (absolute)
	ORA ($82,X)		  ; 01 82 | Logical OR with accumulator ((zero page,X))
	ORA ($55),Y		  ; 11 55 | Logical OR with accumulator ((zero page),Y)
	EOR $FE			  ; 45 FE | Exclusive OR with accumulator (zero page)
	PLB				  ; AB | Pull data bank register from stack
	ADC $FF93,X		  ; 7D 93 FF | Add with carry (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	JMP ($AAD7)		  ; 6C D7 AA | Jump to address (absolute indirect)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	JMP ($55AA)		  ; 6C AA 55 | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	LDY #$E8			 ; A0 E8 | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	CPY $D854			; CC 54 D8 | Compare Y register (absolute)
	LDY $F8			  ; A4 F8 | Load from zero page into Y register
	PHA				  ; 48 | Push accumulator to stack
	BEQ $68			  ; F0 68 | Branch if equal
	BNE $30			  ; D0 30 | Branch if not equal
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	BCC $20			  ; 90 20 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	EOR #$23			 ; 49 23 | Exclusive OR with accumulator (immediate)
	BIT $596D			; 2C 6D 59 | Test bits in accumulator (absolute)
	ADC #$3C			 ; 69 3C | Add with carry (immediate)
	ASL $0855,X		  ; 1E 55 08 | Arithmetic shift left (absolute,X)
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_241
; Address: $FBEF03
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_241:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_242
; Address: $FBEF23
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_242:
	INY				  ; C8 | Increment Y register
	CLI				  ; 58 | Clear interrupt disable flag
	BNE $B4			  ; D0 B4 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BIT $58			  ; 24 58 | Test bits in accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	BNE $34			  ; D0 34 | Branch if not equal
	BPL $20			  ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_243
; Address: $FBEF34
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_243:
	JSR $8000			; 20 00 80 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	ADC $1337			; 6D 37 13 | Add with carry (absolute)
	INC				  ; 1A | Increment accumulator
	ROL $4F0F			; 2E 0F 4F | Rotate left (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $7A37			; 6E 37 7A | Rotate right (absolute)
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	BPL $06			  ; 10 06 | Branch if positive
	ORA ($37),Y		  ; 11 37 | Logical OR with accumulator ((zero page),Y)
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ORA ($39),Y		  ; 11 39 | Logical OR with accumulator ((zero page),Y)
	BPL $10			  ; 10 10 | Branch if positive
	ADC $8383,X		  ; 7D 83 83 | Add with carry (absolute,X)
	AND #$D6			 ; 29 D6 | Logical AND with accumulator (immediate)
	AND $10C6,Y		  ; 39 C6 10 | Logical AND with accumulator (absolute,Y)
	JMP ($A0F8)		  ; 6C F8 A0 | Jump to address (absolute indirect)
	INX				  ; E8 | Increment X register
	LDY #$E8			 ; A0 E8 | Load immediate value into Y register
	CLD				  ; D8 | Clear decimal mode flag
	BCC $BC			  ; 90 BC | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	CPY $B8			  ; C4 B8 | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	BCS $8C			  ; B0 8C | Branch if carry set
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_244
; Address: $FBEF9E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_244:
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F 1F 9F 1F | Store accumulator to absolute long,X
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_245
; Address: $FBEFB5
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_245:
	STA				  ; 9F 60 9F E0 | Store accumulator to absolute long,X
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	REP #$C3			 ; C2 C3 | Reset processor status bits
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	CMP $FF			  ; C5 FF | Compare accumulator (zero page)
	INC $FF			  ; E6 FF | Increment (zero page)
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	INC $1B			  ; E6 1B | Increment (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $FF83,X		  ; 7D 83 FF | Add with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	EOR $83			  ; 45 83 | Exclusive OR with accumulator (zero page)
	EOR $C7			  ; 45 C7 | Exclusive OR with accumulator (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	INC $82FF,X		  ; FE FF 82 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_246
; Address: $FBF056
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_246:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	INC $7D83,X		  ; FE 83 7D | Increment (absolute,X)
	EOR $C7			  ; 45 C7 | Exclusive OR with accumulator (zero page)
	INC $EE6D,X		  ; FE 6D EE | Increment (absolute,X)
	BPL $EF			  ; 10 EF | Branch if positive
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	BPL $60			  ; 10 60 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	INC				  ; 1A | Increment accumulator
	ASL $0503,X		  ; 1E 03 05 | Arithmetic shift left (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	INC $EF01,X		  ; FE 01 EF | Increment (absolute,X)
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	ORA ($AB,X)		  ; 01 AB | Logical OR with accumulator ((zero page,X))
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)
	BPL $FF			  ; 10 FF | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_247
; Address: $FBF100
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_247:
	SED				  ; F8 | Set decimal mode flag
	BRA $F0			  ; 80 F0 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	INC				  ; 1A | Increment accumulator
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ORA ($EF,X)		  ; 01 EF | Logical OR with accumulator ((zero page,X))
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	EOR $83			  ; 45 83 | Exclusive OR with accumulator (zero page)
	EOR $C7			  ; 45 C7 | Exclusive OR with accumulator (zero page)
	BPL $FF			  ; 10 FF | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CLD				  ; D8 | Clear decimal mode flag
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
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

;------------------------------------------------------------------------------
; Bank76_DmaFunction_248
; Address: $FBF182
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_248:
	LDA				  ; BF BF BF BF | Load from absolute long,X into accumulator
	LDA				  ; BF 9F BF 9F | Load from absolute long,X into accumulator
	STA				  ; 9F 0F C0 3F | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_249
; Address: $FBF19F
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_249:
	STA $FFFFFF		  ; 8F FF FF FF | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	INC $DF			  ; E6 DF | Increment (zero page)
	INC $CEBB			; EE BB CE | Increment (absolute)
	STZ $B8EF			; 9C EF B8 | Store zero to absolute
	SEC				  ; 38 | Set carry flag
	BMI $DF			  ; 30 DF | Branch if negative
	DEC $00			  ; C6 00 | Decrement (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	STY $A800			; 8C 00 A8 | Store Y register to absolute address
	PLP				  ; 28 | Pull processor status from stack
	BPL $45			  ; 10 45 | Branch if positive
	DEC $FE			  ; C6 FE | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	INC $7C00,X		  ; FE 00 7C | Increment (absolute,X)
	INC $7C7C,X		  ; FE 7C 7C | Increment (absolute,X)
	INC $7C00,X		  ; FE 00 7C | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	TSX				  ; BA | Transfer stack pointer to X register
	EOR $C6			  ; 45 C6 | Exclusive OR with accumulator (zero page)
	INC $7C7C,X		  ; FE 7C 7C | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	INC $7C00,X		  ; FE 00 7C | Increment (absolute,X)
	DEC $7D			  ; C6 7D | Decrement (zero page)
	INC $7CFE,X		  ; FE FE 7C | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	INC $7C00,X		  ; FE 00 7C | Increment (absolute,X)
	STA				  ; 9F 0F 8F 07 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank76_DmaFunction_24B
; Address: $FBF291
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_24B:
	STA $B08770		  ; 8F 70 87 B0 | Store accumulator to absolute long address
	BMI $C7			  ; 30 C7 | Branch if negative
	BPL $E7			  ; 10 E7 | Branch if positive
	BMI $C3			  ; 30 C3 | Branch if negative
	BPL $E1			  ; 10 E1 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	STA $F13FFD		  ; 8F FD 3F F1 | Store accumulator to absolute long address
	SBC ($80),Y		  ; F1 80 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA $3100			; 8D 00 31 | Store accumulator to absolute address
	BRA $70			  ; 80 70 | Branch always
	BVS $BE			  ; 70 BE | Branch if overflow set
	CPX #$BC			 ; E0 BC | Compare X register (immediate)
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	DEC $FE			  ; C6 FE | Decrement (zero page)
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	DEC $FE			  ; C6 FE | Decrement (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	BVC $01			  ; 50 01 | Branch if overflow clear
	BMI $03			  ; 30 03 | Branch if negative
	LDY #$03			 ; A0 03 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_24C
; Address: $FBF2D8
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_24C:
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	ROR $19			  ; 66 19 | Rotate right (zero page)
	ADC $0400			; 6D 00 04 | Add with carry (absolute)
	ASL $1F0E			; 0E 0E 1F | Arithmetic shift left (absolute)
	ORA ($77,X)		  ; 01 77 | Logical OR with accumulator ((zero page,X))
	BVC $FF			  ; 50 FF | Branch if overflow clear
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	EOR $FF00,X		  ; 5D 00 FF | Exclusive OR with accumulator (absolute,X)
	LDA				  ; BF 40 AD 52 | Load from absolute long,X into accumulator
	TAX				  ; AA | Transfer accumulator to X register
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	EOR $FF59,X		  ; 5D 59 FF | Exclusive OR with accumulator (absolute,X)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank76_DmaFunction_24D
; Address: $FBF31C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_24D:
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_24E
; Address: $FBF32B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_24E:
	BRA $60			  ; 80 60 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_24F
; Address: $FBF360
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_24F:
	JSR $7200			; 20 00 72 | Jump to subroutine
	EOR $AD22,X		  ; 5D 22 AD | Exclusive OR with accumulator (absolute,X)
	SBC $1A			  ; E5 1A | Subtract with carry (zero page)
	BCC $6F			  ; 90 6F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank76_DmaFunction_250
; Address: $FBF371
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_250:
	JSR $7220			; 20 20 72 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ORA #$BF			 ; 09 BF | Logical OR with accumulator (immediate)
	STA $FF			  ; 85 FF | Store accumulator to zero page
	BCC $FF			  ; 90 FF | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	ROR $5390			; 6E 90 53 | Rotate right (absolute)
	LDY $BC43			; AC 43 BC | Load from absolute address into Y register
	ASL $00E0,X		  ; 1E E0 00 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_251
; Address: $FBF398
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_251:
	JSR $42FE			; 20 FE 42 | Hardware register operation
	WDM #$FF			 ; 42 FF | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	INC $0304,X		  ; FE 04 03 | Increment (absolute,X)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $3F1F,X		  ; 1E 1F 3F | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($1E),Y		  ; 11 1E | Logical OR with accumulator ((zero page),Y)
	AND ($3F,X)		  ; 21 3F | Logical AND with accumulator ((zero page,X))
	AND ($3F,X)		  ; 21 3F | Logical AND with accumulator ((zero page,X))
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	LSR $FFFF,X		  ; 5E FF FF | Logical shift right (absolute,X)
	AND $1B1F			; 2D 1F 1B | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_252
; Address: $FBF3CD
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_252:
	ORA $889D			; 0D 9D 88 | Logical OR with accumulator (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STA $F180,X		  ; 9D 80 F1 | Store accumulator to absolute,X
	SBC $817D,X		  ; FD 7D 81 | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	PEA #$CAFC		   ; F4 FC CA | Push effective address to stack
	INC $FEF6,X		  ; FE F6 FE | Increment (absolute,X)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	SBC ($1F),Y		  ; F1 1F | Subtract with carry ((zero page),Y)
	SBC ($7F,X)		  ; E1 7F | Subtract with carry ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BVS $7F			  ; 70 7F | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $0C			  ; 10 0C | Branch if positive
	BIT $321E			; 2C 1E 32 | Test bits in accumulator (absolute)
	ASL $1E38,X		  ; 1E 38 1E | Arithmetic shift left (absolute,X)
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1C0F,Y		  ; 19 0F 1C | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	SBC $F001,Y		  ; F9 01 F0 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SBC ($B9,X)		  ; E1 B9 | Subtract with carry ((zero page,X))
	BRA $C8			  ; 80 C8 | Branch always
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	DEC $2FF8,X		  ; DE F8 2F | Decrement (absolute,X)
	BEQ $47			  ; F0 47 | Branch if equal
	BEQ $86			  ; F0 86 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	LDA #$5C			 ; A9 5C | Load immediate value into accumulator
	SEP #$0F			 ; E2 0F | Set processor status bits
	ASL $B3B0			; 0E B0 B3 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_253
; Address: $FBF4AC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_253:
	LDY $40EE			; AC EE 40 | Load from absolute address into Y register
	JMP $E3E9FF		  ; 5C FF E9 E3 | Jump to address long
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	BPL $38			  ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_255
; Address: $FBF4C3
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_255:
	JSR $18E6			; 20 E6 18 | Jump to subroutine
	CMP $CE3E			; CD 3E CE | Compare accumulator (absolute)
	LDA				  ; BF 07 7F 9E | Load from absolute long,X into accumulator
	CPX #$B8			 ; E0 B8 | Compare X register (immediate)
	CPY #$5E			 ; C0 5E | Compare Y register (immediate)
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 3F 00 | Load from absolute long,X into accumulator
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	WDM #$BD			 ; 42 BD | Reserved instruction
	DEC				  ; 3A | Decrement accumulator
	CMP $CF			  ; C5 CF | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	ORA $05CD			; 0D CD 05 | Logical OR with accumulator (absolute)
	INC $42			  ; E6 42 | Hardware register operation
	DEC				  ; 3A | Decrement accumulator
	SEI				  ; 78 | Set interrupt disable flag
	BRA $3F			  ; 80 3F | Branch always
	BRA $32			  ; 80 32 | Branch always
	CLV				  ; B8 | Clear overflow flag
	CLC				  ; 18 | Clear carry flag
	ORA $4EB1,Y		  ; 19 B1 4E | Logical OR with accumulator (absolute,Y)
	INC $18			  ; E6 18 | Increment (zero page)
	LDA				  ; BF A0 1E 10 | Load from absolute long,X into accumulator
	ROR $8670,X		  ; 7E 70 86 | Rotate right (absolute,X)
	STZ $7260			; 9C 60 72 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank76_DmaFunction_256
; Address: $FBF54F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_256:
	ROL $FFB0,X		  ; 3E B0 FF | Rotate left (absolute,X)
	CPX $FE			  ; E4 FE | Compare X register (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPX $0E			  ; E4 0E | Compare X register (zero page)
	BRA $0E			  ; 80 0E | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_257
; Address: $FBF55D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_257:
	BRA $80			  ; 80 80 | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BVS $80			  ; 70 80 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal
	BRA $88			  ; 80 88 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BMI $3C			  ; 30 3C | Branch if negative
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_258
; Address: $FBF5A8
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_258:
	JSL $1C621C		  ; 22 1C 62 1C | Jump to subroutine long
	CPX $78			  ; E4 78 | Compare X register (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LSR				  ; 4A | Logical shift right (accumulator)
	INC $7C			  ; E6 7C | Increment (zero page)
	ADC $BD3E,Y		  ; 79 3E BD | Add with carry (absolute,Y)
	ROR $7EFD,X		  ; 7E FD 7E | Rotate right (absolute,X)
	ROL $3E77,X		  ; 3E 77 3E | Rotate left (absolute,X)
	ROR $007E,X		  ; 7E 7E 00 | Rotate right (absolute,X)
	INC $7F00,X		  ; FE 00 7F | Increment (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	INC $7C			  ; E6 7C | Increment (zero page)
	ADC $BD3E,Y		  ; 79 3E BD | Add with carry (absolute,Y)
	ROR $FCFA,X		  ; 7E FA FC | Rotate right (absolute,X)
	INC $EE7C			; EE 7C EE | Increment (absolute)
	INC $FC			  ; E6 FC | Increment (zero page)
	ROR $FE00,X		  ; 7E 00 FE | Rotate right (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $EE00,X		  ; FE 00 EE | Increment (absolute,X)
	AND $1E			  ; 25 1E | Logical AND with accumulator (zero page)
	ROL $1F3E,X		  ; 3E 3E 1F | Rotate left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_25A
; Address: $FBF62D
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_25A:
	JSR $2A6A			; 20 6A 2A | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	BVS $BB			  ; 70 BB | Branch if overflow set
	BMI $D9			  ; 30 D9 | Branch if negative
	BIT #$77			 ; 89 77 | Test bits in accumulator (immediate)
	ORA $07F6			; 0D F6 07 | Logical OR with accumulator (absolute)
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	DEC $00			  ; C6 00 | Decrement (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	BVS $10			  ; 70 10 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	ORA $ABAB			; 0D AB AB | Logical OR with accumulator (absolute)
	JMP $7ADD06		  ; 5C 06 DD 7A | Jump to address long
	ORA #$FA			 ; 09 FA | Logical OR with accumulator (immediate)
	ORA ($E7,X)		  ; 01 E7 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BPL $40			  ; 10 40 | Branch if positive
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	ORA $81			  ; 05 81 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	TAX				  ; AA | Transfer accumulator to X register
	SBC $BF9F			; ED 9F BF | Subtract with carry (absolute)
	LSR $42BF,X		  ; 5E BF 42 | Hardware register operation
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEY				  ; 88 | Decrement Y register
	DEX				  ; CA | Decrement X register
	CMP ($1B),Y		  ; D1 1B | Compare accumulator ((zero page),Y)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_25C
; Address: $FBF6C0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_25C:
	BRA $DD			  ; 80 DD | Branch always
	STA $CD			  ; 85 CD | Store accumulator to zero page
	DEC				  ; 3A | Decrement accumulator
	PHA				  ; 48 | Push accumulator to stack
	ROL $306B,X		  ; 3E 6B 30 | Rotate left (absolute,X)
	BPL $3F			  ; 10 3F | Branch if positive
	BPL $28			  ; 10 28 | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_25D
; Address: $FBF6D0
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_25D:
	JSL $003200		  ; 22 00 32 00 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $05			  ; 10 05 | Branch if positive
	ROR $5C5C			; 6E 5C 5C | Rotate right (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $00			  ; D0 00 | Branch if not equal
	BMI $20			  ; 30 20 | Branch if negative
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank76_DmaFunction_25E
; Address: $FBF6F8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_25E:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_25F
; Address: $FBF701
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_25F:
	JSL $000C02		  ; 22 02 0C 00 | Jump to subroutine long
	ORA $0D09,Y		  ; 19 09 0D | Logical OR with accumulator (absolute,Y)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROR $3E51,X		  ; 7E 51 3E | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	AND $3D1E,X		  ; 3D 1E 3D | Logical AND with accumulator (absolute,X)
	ASL $1E2D,X		  ; 1E 2D 1E | Arithmetic shift left (absolute,X)
	JMP $44F8			; 4C F8 44 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	PEA #$F478		   ; F4 78 F4 | Push effective address to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	BMI $30			  ; 30 30 | Branch if negative
	CPY $0C00			; CC 00 0C | Compare Y register (absolute)
	WDM #$2A			 ; 42 2A | Reserved instruction
	EOR ($3B),Y		  ; 51 3B | Exclusive OR with accumulator ((zero page),Y)
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	STZ $3B			  ; 64 3B | Store zero to zero page

;------------------------------------------------------------------------------
; Bank76_DmaFunction_261
; Address: $FBF7B6
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_261:
	JSR $3000			; 20 00 30 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	JMP $C6BF			; 4C BF C6 | Jump to address
	EOR #$BF			 ; 49 BF | Exclusive OR with accumulator (immediate)
	LDA				  ; BF FF 7F 1F | Load from absolute long,X into accumulator
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	STZ $3F04			; 9C 04 3F | Store zero to absolute
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	BMI $7F			  ; 30 7F | Branch if negative
	STA ($C7),Y		  ; 91 C7 | Store accumulator to (zero page),Y
	ASL $18DF			; 0E DF 18 | Arithmetic shift left (absolute)
	LDA				  ; BF 9F 6F 07 | Load from absolute long,X into accumulator
	BIT $3C1F			; 2C 1F 3C | Test bits in accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	STA				  ; 9F FF 9F F5 | Store accumulator to absolute long,X
	LDA $19D2,X		  ; BD D2 19 | Load from absolute,X into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	BNE $D0			  ; D0 D0 | Branch if not equal
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	BNE $C0			  ; D0 C0 | Branch if not equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_262
; Address: $FBF830
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_262:
	JSR $0005			; 20 05 00 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank76_DmaFunction_265
; Address: $FBF866
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_265:
	CLV				  ; B8 | Clear overflow flag
	LDA				  ; BF F6 DB FF | Load from absolute long,X into accumulator
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$E3			 ; C0 E3 | Compare Y register (immediate)
	ROL $FEFF,X		  ; 3E FF FE | Rotate left (absolute,X)
	SBC $FBE7,X		  ; FD E7 FB | Subtract with carry (absolute,X)
	SBC $FF01,Y		  ; F9 01 FF | Subtract with carry (absolute,Y)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $E801,Y		  ; F9 01 E8 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	CPX $3C			  ; E4 3C | Compare X register (zero page)
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	INC $FEC2,X		  ; FE C2 FE | Increment (absolute,X)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	ORA $3E1F,Y		  ; 19 1F 3E | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	AND ($3E,X)		  ; 21 3E | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	STZ $BFFF			; 9C FF BF | Store zero to absolute
	SBC $1BDF			; ED DF 1B | Subtract with carry (absolute)
	ORA $889D			; 0D 9D 88 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	STA $0880,X		  ; 9D 80 08 | Store accumulator to absolute,X
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC $817D,X		  ; FD 7D 81 | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	PEA #$CAFC		   ; F4 FC CA | Push effective address to stack

;------------------------------------------------------------------------------
; Bank76_DmaFunction_266
; Address: $FBF923
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_266:
	INC $FEF6,X		  ; FE F6 FE | Increment (absolute,X)
	ROR $3C38,X		  ; 7E 38 3C | Rotate right (absolute,X)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	SBC ($1F),Y		  ; F1 1F | Subtract with carry ((zero page),Y)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	ADC ($7C),Y		  ; 71 7C | Add with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BVS $E4			  ; 70 E4 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	DEC $E17C,X		  ; DE 7C E1 | Decrement (absolute,X)
	ROR $7FB0,X		  ; 7E B0 7F | Rotate right (absolute,X)
	JMP $3F483F		  ; 5C 3F 48 3F | Jump to address long
	BVS $00			  ; 70 00 | Branch if overflow set
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_267
; Address: $FBF98A
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_267:
	JSR $10C0			; 20 C0 10 | Jump to subroutine
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BCC $90			  ; 90 90 | Branch if carry clear
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $BB			  ; 80 BB | Branch always
	BRA $90			  ; 80 90 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $F2			  ; F0 F2 | Branch if equal
	CPX #$E2			 ; E0 E2 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank76_DmaFunction_268
; Address: $FBF9E7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_268:
	JSL $443C48		  ; 22 48 3C 44 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	BMI $E1			  ; 30 E1 | Branch if negative
	CPX $DCF0			; EC F0 DC | Compare X register (absolute)
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	INC				  ; 1A | Increment accumulator
	ORA $0106,Y		  ; 19 06 01 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_269
; Address: $FBFA0B
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_269:
	JSL $000C02		  ; 22 02 0C 00 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BVS $80			  ; 70 80 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	CPX $78			  ; E4 78 | Compare X register (zero page)
	ORA $0D09,Y		  ; 19 09 0D | Logical OR with accumulator (absolute,Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROL $1617,X		  ; 3E 17 16 | Rotate left (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	BEQ $E4			  ; F0 E4 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STA $7F9FFC		  ; 8F FC 9F 7F | Store accumulator to absolute long address
	AND $0707,Y		  ; 39 07 07 | Logical AND with accumulator (absolute,Y)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $60			  ; F0 60 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_26B
; Address: $FBFAE9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_26B:
	JSL $000C02		  ; 22 02 0C 00 | Jump to subroutine long
	BMI $C0			  ; 30 C0 | Branch if negative
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank76_DmaFunction_26C
; Address: $FBFB03
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_26C:
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $70			  ; F0 70 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	STZ $18			  ; 64 18 | Store zero to zero page
	CPX $78			  ; E4 78 | Compare X register (zero page)
	ORA $0D09,Y		  ; 19 09 0D | Logical OR with accumulator (absolute,Y)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $7606,X		  ; 1E 06 76 | Arithmetic shift left (absolute,X)
	ASL $7EF2,X		  ; 1E F2 7E | Arithmetic shift left (absolute,X)
	PHX				  ; DA | Push X register to stack
	INC $FED4,X		  ; FE D4 FE | Increment (absolute,X)
	ASL $7E00,X		  ; 1E 00 7E | Arithmetic shift left (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	DEC $1000,X		  ; DE 00 10 | Decrement (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $101F,Y		  ; 19 1F 10 | Logical OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BVS $FF			  ; 70 FF | Branch if overflow set
	STZ $7FFF			; 9C FF 7F | Store zero to absolute
	SBC $DBDF			; ED DF DB | Subtract with carry (absolute)
	CMP $C85D			; CD 5D C8 | Compare accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	CPY #$5D			 ; C0 5D | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC $7EFF,X		  ; FD FF 7E | Subtract with carry (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank76_DmaFunction_26D
; Address: $FBFBF9
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_26D:
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	PEA #$C5FC		   ; F4 FC C5 | Push effective address to stack
	STA				  ; 9F FF FF FF | Store accumulator to absolute long,X
	INC $1DFE,X		  ; FE FE 1D | Increment (absolute,X)
	AND $FC3E,Y		  ; 39 3E FC | Logical AND with accumulator (absolute,Y)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC $1CFC,Y		  ; F9 FC 1C | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank76_DmaFunction_26E
; Address: $FBFC29
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_26E:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_26F
; Address: $FBFC36
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_26F:
	JSR $C0E0			; 20 E0 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $10			  ; 80 10 | Branch always
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $06FC			; 0E FC 06 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_270
; Address: $FBFCBA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_270:
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	INC $FE38,X		  ; FE 38 FE | Increment (absolute,X)
	BIT $FA			  ; 24 FA | Test bits in accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	STZ $3E00,X		  ; 9E 00 3E | Store zero to absolute,X
	ROL $3800,X		  ; 3E 00 38 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_271
; Address: $FBFCF8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_271:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BMI $0C			  ; 30 0C | Branch if negative
	BVS $32			  ; 70 32 | Branch if overflow set
	TSX				  ; BA | Transfer stack pointer to X register
	PHP				  ; 08 | Push processor status to stack
	STY $CA5B			; 8C 5B CA | Store Y register to absolute address
	DEC $C4			  ; C6 C4 | Decrement (zero page)
	STZ $F090			; 9C 90 F0 | Store zero to absolute
	WDM #$00			 ; 42 00 | Reserved instruction
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_273
; Address: $FBFD27
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_273:
	JSL $000C02		  ; 22 02 0C 00 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	BEQ $B8			  ; F0 B8 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY $78			  ; C4 78 | Compare Y register (zero page)
	CPX $7F7F			; EC 7F 7F | Compare X register (absolute)
	ORA $0D09,Y		  ; 19 09 0D | Logical OR with accumulator (absolute,Y)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	EOR $C9BE,Y		  ; 59 BE C9 | Exclusive OR with accumulator (absolute,Y)
	ROL $1F20,X		  ; 3E 20 1F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_274
; Address: $FBFDA6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_274:
	JSR $401F			; 20 1F 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	ROR $0081,X		  ; 7E 81 00 | Rotate right (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_275
; Address: $FBFDE2
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_275:
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PEA #$F804		   ; F4 04 F8 | Push effective address to stack
	BIT $F8			  ; 24 F8 | Test bits in accumulator (zero page)
	BIT $F8			  ; 24 F8 | Test bits in accumulator (zero page)
	STZ $F8			  ; 64 F8 | Store zero to zero page
	STZ $F8			  ; 64 F8 | Store zero to zero page
	RTI				  ; 40 | Return from interrupt
	INC $FE40,X		  ; FE 40 FE | Increment (absolute,X)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BRA $08			  ; 80 08 | Branch always
	CLC				  ; 18 | Clear carry flag
	BIT $641E			; 2C 1E 64 | Test bits in accumulator (absolute)
	ROL $7EF6,X		  ; 3E F6 7E | Rotate left (absolute,X)
	ROL $7EF8,X		  ; 3E F8 7E | Rotate left (absolute,X)
	INC $FC			  ; E6 FC | Increment (zero page)
	ROL $7E00,X		  ; 3E 00 7E | Rotate left (absolute,X)
	INC $7E00,X		  ; FE 00 7E | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BVS $7F			  ; 70 7F | Branch if overflow set
	PLX				  ; FA | Pull X register from stack
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	BVS $87			  ; 70 87 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BVS $FF			  ; 70 FF | Branch if overflow set
	STZ $7FFF			; 9C FF 7F | Store zero to absolute
	SBC $FBDF			; ED DF FB | Subtract with carry (absolute)
	CMP $E85D			; CD 5D E8 | Compare accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	CPY #$5D			 ; C0 5D | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	XBA				  ; EB | Exchange accumulator bytes
	STZ $FDFE,X		  ; 9E FE FD | Store zero to absolute,X
	SED				  ; F8 | Set decimal mode flag
	STY $78			  ; 84 78 | Store Y register to zero page
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	SBC $FC1E,Y		  ; F9 1E FC | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank76_DmaFunction_277
; Address: $FBFE86
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_277:
	JSR $6030			; 20 30 60 | Jump to subroutine
	BVS $40			  ; 70 40 | Branch if overflow set
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank76_DmaFunction_278
; Address: $FBFE93
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_278:
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	BCC $C0			  ; 90 C0 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	WDM #$3F			 ; 42 3F | Reserved instruction
	EOR #$3F			 ; 49 3F | Exclusive OR with accumulator (immediate)
	ROL $1F			  ; 26 1F | Rotate left (zero page)
	ORA $3F1F,X		  ; 1D 1F 3F | Logical OR with accumulator (absolute,X)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	INC $7CFF,X		  ; FE FF 7C | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	BPL $C3			  ; 10 C3 | Branch if positive
	STZ $F8			  ; 64 F8 | Store zero to zero page
	SEP #$FC			 ; E2 FC | Set processor status bits
	REP #$FC			 ; C2 FC | Reset processor status bits
	CPX $F41A			; EC 1A F4 | Compare X register (absolute)
	PEA #$F8F0		   ; F4 F0 F8 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	INC $00FC,X		  ; FE FC 00 | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BPL $F4			  ; 10 F4 | Branch if positive
	BEQ $F8			  ; F0 F8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $01C2,X		  ; FE C2 01 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FC			  ; E6 FC | Increment (zero page)
	JMP $C8F8			; 4C F8 C8 | Jump to address
	BEQ $C8			  ; F0 C8 | Branch if equal
	BEQ $D0			  ; F0 D0 | Branch if equal
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $CC00			; EE 00 CC | Increment (absolute)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_279
; Address: $FBFF43
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_279:
	JSL $000C02		  ; 22 02 0C 00 | Jump to subroutine long
	BEQ $00			  ; F0 00 | Branch if equal
	CPY $7F7F			; CC 7F 7F | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank76_DmaFunction_27A
; Address: $FBFF84
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank76_DmaFunction_27A:
	ORA $0D09,Y		  ; 19 09 0D | Logical OR with accumulator (absolute,Y)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $3E1F,Y		  ; 19 1F 3E | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	AND ($3E,X)		  ; 21 3E | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
