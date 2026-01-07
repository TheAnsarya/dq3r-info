;==============================================================================
; Dragon Quest III - Bank $6C
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $F60000-$F67FFF
; Instructions: 8947
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_6C"

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_000
; Address: $F68001
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_000:
	DEY				  ; 88 | Decrement Y register
	CLV				  ; B8 | Clear overflow flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	NOP				  ; EA | No operation
	STX $0400			; 8E 00 04 | Store X register to absolute address
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $8E00			; EE 00 8E | Increment (absolute)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY $1804			; CC 04 18 | Compare Y register (absolute)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY $1C00			; CC 00 1C | Compare Y register (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_001
; Address: $F680A0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_001:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_002
; Address: $F680E0
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_002:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC $F6F5,X		  ; FD F5 F6 | Subtract with carry (absolute,X)
	SBC $FE03,X		  ; FD 03 FE | Subtract with carry (absolute,X)
	ORA ($6F,X)		  ; 01 6F | Logical OR with accumulator ((zero page,X))
	BCC $13			  ; 90 13 | Branch if carry clear
	CPX $0000			; EC 00 00 | Compare X register (absolute)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $F0			  ; 10 F0 | Branch if positive
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_003
; Address: $F6812A
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_003:
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	INC $731E			; EE 1E 73 | Increment (absolute)
	STA $000000		  ; 8F 00 00 00 | Store accumulator to absolute long address
	SBC $FDFC,X		  ; FD FC FD | Subtract with carry (absolute,X)
	INC $FEFD,X		  ; FE FD FE | Increment (absolute,X)
	SBC $FAFA,Y		  ; F9 FA FA | Subtract with carry (absolute,Y)
	BEQ $F1			  ; F0 F1 | Branch if equal
	ASL $6C01			; 0E 01 6C | Arithmetic shift left (absolute)
	STZ $0CFC			; 9C FC 0C | Store zero to absolute
	PEA #$E40C		   ; F4 0C E4 | Push effective address to stack
	CPX $CC14			; EC 14 CC | Compare X register (absolute)
	INY				  ; C8 | Increment Y register
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	SBC $FDFE,X		  ; FD FE FD | Subtract with carry (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SBC $F8F9,X		  ; FD F9 F8 | Subtract with carry (absolute,X)
	SBC $F1F8,Y		  ; F9 F8 F1 | Subtract with carry (absolute,Y)
	BEQ $02			  ; F0 02 | Branch if equal
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($F4,X)		  ; 01 F4 | Logical OR with accumulator ((zero page,X))
	PEA #$EC0C		   ; F4 0C EC | Push effective address to stack
	CPY $CC2C			; CC 2C CC | Compare Y register (absolute)
	BIT $2CCC			; 2C CC 2C | Test bits in accumulator (absolute)
	INY				  ; C8 | Increment Y register
	PLP				  ; 28 | Pull processor status from stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_004
; Address: $F681C4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_004:
	JSR $10FF			; 20 FF 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_005
; Address: $F681E2
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_005:
	JMP $06B3			; 4C B3 06 | Jump to address
	SBC $FE01,Y		  ; F9 01 FE | Subtract with carry (absolute,Y)
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STZ $9C			  ; 64 9C | Store zero to zero page
	CPY $E61A			; CC 1A E6 | Compare Y register (absolute)
	ASL $00F2			; 0E F2 00 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	SBC $5859,Y		  ; F9 59 58 | Subtract with carry (absolute,Y)
	CMP ($D0),Y		  ; D1 D0 | Compare accumulator ((zero page),Y)
	EOR $684C			; 4D 4C 68 | Exclusive OR with accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($2F,X)		  ; 01 2F | Logical OR with accumulator ((zero page,X))
	ORA ($B3,X)		  ; 01 B3 | Logical OR with accumulator ((zero page,X))
	ORA ($97,X)		  ; 01 97 | Logical OR with accumulator ((zero page,X))
	PLB				  ; AB | Pull data bank register from stack
	LDA				  ; BF 00 C8 28 | Load from absolute long,X into accumulator
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$DC			 ; E0 DC | Compare X register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	BNE $D0			  ; D0 D0 | Branch if not equal
	JMP $684C			; 4C 4C 68 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_006
; Address: $F6826E
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_006:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PLB				  ; AB | Pull data bank register from stack
	LDA				  ; BF 00 E0 00 | Load from absolute long,X into accumulator
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	ROL $1FFF			; 2E FF 1F | Rotate left (absolute)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA $FB			  ; 05 FB | Logical OR with accumulator (zero page)
	SBC $FF80,X		  ; FD 80 FF | Subtract with carry (absolute,X)
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	AND ($FE,X)		  ; 21 FE | Logical AND with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_007
; Address: $F6830E
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_007:
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	INC $FFD7,X		  ; FE D7 FF | Increment (absolute,X)
	ADC $6FFD,X		  ; 7D FD 6F | Add with carry (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEEC,X		  ; FE EC FE | Increment (absolute,X)
	INC $B8FC			; EE FC B8 | Increment (absolute)
	CPX $FDCA			; EC CA FD | Compare X register (absolute)
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_008
; Address: $F6834B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_008:
	SBC $FDCD,X		  ; FD CD FD | Subtract with carry (absolute,X)
	CPX $00FC			; EC FC 00 | Compare X register (absolute)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_009
; Address: $F68376
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_009:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	AND #$D6			 ; 29 D6 | Logical AND with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	LDA $A5			  ; A5 A5 | Load from zero page into accumulator
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_00A
; Address: $F683AE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_00A:
	ROR $8400,X		  ; 7E 00 84 | Rotate right (absolute,X)
	INX				  ; E8 | Increment X register
	JMP $5AA0			; 4C A0 5A | Jump to address
	BRA $EA			  ; 80 EA | Branch always
	BPL $0D			  ; 10 0D | Branch if positive
	BEQ $9F			  ; F0 9F | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	ROR $AC7E,X		  ; 7E 7E AC | Rotate right (absolute,X)
	LDY $B4B4,X		  ; BC B4 B4 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_00B
; Address: $F683C4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_00B:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	LSR				  ; 4A | Logical shift right (accumulator)
	CLV				  ; B8 | Clear overflow flag
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $0006,Y		  ; 19 06 00 | Logical OR with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $0010,Y		  ; 19 10 00 | Logical OR with accumulator (absolute,Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $00F8,X		  ; FE F8 00 | Increment (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_00C
; Address: $F68424
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_00C:
	CLC				  ; 18 | Clear carry flag
	ASL $0B00,X		  ; 1E 00 0B | Arithmetic shift left (absolute,X)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $0B16,X		  ; 1E 16 0B | Arithmetic shift left (absolute,X)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	ASL $0A00			; 0E 00 0A | Arithmetic shift left (absolute)
	STA				  ; 9F 0A FF 1A | Store accumulator to absolute long,X
	DEC $764A			; CE 4A 76 | Decrement (absolute)
	ASL $0A0A			; 0E 0A 0A | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($95),Y		  ; 11 95 | Logical OR with accumulator ((zero page),Y)
	STA ($E5),Y		  ; 91 E5 | Store accumulator to (zero page),Y
	ADC ($B5,X)		  ; 61 B5 | Add with carry ((zero page,X))
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BVS $30			  ; 70 30 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	STY $36			  ; 84 36 | Store Y register to zero page
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND $02D6,Y		  ; 39 D6 02 | Logical AND with accumulator (absolute,Y)
	ORA $0A1E			; 0D 1E 0A | Logical OR with accumulator (absolute)
	BIT $3010			; 2C 10 30 | Test bits in accumulator (absolute)
	CPX #$15			 ; E0 15 | Compare X register (immediate)
	BPL $1F			  ; 10 1F | Branch if positive
	BIT $302C			; 2C 2C 30 | Test bits in accumulator (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	SBC $0706,X		  ; FD 06 07 | Subtract with carry (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	STA $0707,Y		  ; 99 07 07 | Store accumulator to absolute,Y
	LDY $E4			  ; A4 E4 | Load from zero page into Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $0C0C			; 4E 0C 0C | Logical shift right (absolute)
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	LSR $0C4E			; 4E 4E 0C | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_00D
; Address: $F684DC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_00D:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $3F06,Y		  ; 19 06 3F | Logical OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ORA #$F5			 ; 09 F5 | Logical OR with accumulator (immediate)
	INX				  ; E8 | Increment X register
	AND ($E2,X)		  ; 21 E2 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_00F
; Address: $F684F3
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_00F:
	JSR $2028			; 20 28 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	INC $DF84			; EE 84 DF | Increment (absolute)
	DEY				  ; 88 | Decrement Y register
	CMP $6E80,X		  ; DD 80 6E | Compare accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	STX $8788			; 8E 88 87 | Store X register to absolute address
	STY $0B			  ; 84 0B | Store Y register to zero page
	ORA $20			  ; 05 20 | Logical OR with accumulator (zero page)
	ROL $D0			  ; 26 D0 | Rotate left (zero page)
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	ORA ($EF,X)		  ; 01 EF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $EE			  ; 06 EE | Arithmetic shift left (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ASL $0F02,X		  ; 1E 02 0F | Arithmetic shift left (absolute,X)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	BMI $7E			  ; 30 7E | Branch if negative
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	ORA $0A10,X		  ; 1D 10 0A | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	JMP ($CF60)		  ; 6C 60 CF | Jump to address (absolute indirect)
	BRA $79			  ; 80 79 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_010
; Address: $F6855F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_010:
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_011
; Address: $F68564
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_011:
	JSR $2020			; 20 20 20 | Jump to subroutine
	AND $9280			; 2D 80 92 | Logical AND with accumulator (absolute)
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	ORA ($67,X)		  ; 01 67 | Logical OR with accumulator ((zero page,X))
	SBC $7F40			; ED 40 7F | Subtract with carry (absolute)
	ASL $E000,X		  ; 1E 00 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	INY				  ; C8 | Increment Y register
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_012
; Address: $F6858D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_012:
	JSL $BCC0BE		  ; 22 BE C0 BC | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	INC $F30E,X		  ; FE 0E F3 | Increment (absolute,X)
	ADC ($37,X)		  ; 61 37 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_013
; Address: $F6859B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_013:
	JSR $01DD			; 20 DD 01 | Jump to subroutine
	ROL $001E,X		  ; 3E 1E 00 | Rotate left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $040E			; 0E 0E 04 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_014
; Address: $F685C8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_014:
	JSL $1C143E		  ; 22 3E 14 1C | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $040E			; 0E 0E 04 | Arithmetic shift left (absolute)
	ROL $1C3E,X		  ; 3E 3E 1C | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BVS $10			  ; 70 10 | Branch if overflow set
	ASL $1600,X		  ; 1E 00 16 | Arithmetic shift left (absolute,X)
	AND #$2D			 ; 29 2D | Logical AND with accumulator (immediate)
	AND #$5F			 ; 29 5F | Logical AND with accumulator (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	ROR				  ; 6A | Rotate right (accumulator)
	ORA #$54			 ; 09 54 | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_015
; Address: $F685F3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_015:
	ASL $3F00,X		  ; 1E 00 3F | Arithmetic shift left (absolute,X)
	ORA $7A			  ; 05 7A | Logical OR with accumulator (zero page)
	ORA #$76			 ; 09 76 | Logical OR with accumulator (immediate)
	BPL $EF			  ; 10 EF | Branch if positive
	ROL $F808			; 2E 08 F8 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_016
; Address: $F68604
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_016:
	TAY				  ; A8 | Transfer accumulator to Y register
	NOP				  ; EA | No operation
	TSX				  ; BA | Transfer stack pointer to X register
	LDX $AF02,Y		  ; BE 02 AF | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_018
; Address: $F68611
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_018:
	JSL $00C0C0		  ; 22 C0 C0 00 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	LDX $EE10,Y		  ; BE 10 EE | Load from absolute,Y into X register
	NOP				  ; EA | No operation
	WDM #$FD			 ; 42 FD | Reserved instruction
	INC $0838,X		  ; FE 38 08 | Increment (absolute,X)
	ASL $0911			; 0E 11 09 | Arithmetic shift left (absolute)
	DEC				  ; 3A | Decrement accumulator
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BMI $0F			  ; 30 0F | Branch if negative
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)
	BPL $2F			  ; 10 2F | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	NOP				  ; EA | No operation
	TSX				  ; BA | Transfer stack pointer to X register
	LDX $2E84,Y		  ; BE 84 2E | Load from absolute,Y into X register
	LDA $E001F9		  ; AF F9 01 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_019
; Address: $F68656
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_019:
	RTI				  ; 40 | Return from interrupt
	LDX $EE10,Y		  ; BE 10 EE | Load from absolute,Y into X register
	NOP				  ; EA | No operation
	PLX				  ; FA | Pull X register from stack
	WDM #$FD			 ; 42 FD | Reserved instruction
	BVS $10			  ; 70 10 | Branch if overflow set
	ASL $0A00,X		  ; 1E 00 0A | Arithmetic shift left (absolute,X)
	ORA $213F			; 0D 3F 21 | PPU graphics register access
	SBC $606F			; ED 6F 60 | Subtract with carry (absolute)
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	ORA $3A			  ; 05 3A | Logical OR with accumulator (zero page)
	ORA $2132			; 0D 32 21 | PPU graphics register access
	LSR $7D02,X		  ; 5E 02 7D | Logical shift right (absolute,X)
	ROL $F808			; 2E 08 F8 | Rotate left (absolute)
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	BVC $AC			  ; 50 AC | Branch if overflow clear
	NOP				  ; EA | No operation
	PLX				  ; FA | Pull X register from stack
	LDA $BE08,X		  ; BD 08 BE | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_01A
; Address: $F68691
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_01A:
	JSL $00C0C0		  ; 22 C0 C0 00 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDX $AE50,Y		  ; BE 50 AE | Load from absolute,Y into X register
	BPL $EF			  ; 10 EF | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_01B
; Address: $F686AD
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_01B:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $031F			; 0D 1F 03 | Logical OR with accumulator (absolute)
	SBC $3037,Y		  ; F9 37 30 | Subtract with carry (absolute,Y)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $0212			; 0D 12 02 | Logical OR with accumulator (absolute)
	SBC $FD82,X		  ; FD 82 FD | Subtract with carry (absolute,X)
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $54			  ; A4 54 | Load from zero page into Y register
	NOP				  ; EA | No operation
	PLX				  ; FA | Pull X register from stack
	ASL $A9			  ; 06 A9 | Arithmetic shift left (zero page)
	SBC $E011,Y		  ; F9 11 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_01C
; Address: $F686F5
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_01C:
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDX $AE50,Y		  ; BE 50 AE | Load from absolute,Y into X register
	SBC $4040,X		  ; FD 40 40 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA $D904,X		  ; BD 04 D9 | Load from absolute,X into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $7620,X		  ; 5E 20 76 | Logical shift right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_01D
; Address: $F68754
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_01D:
	JSR $4056			; 20 56 40 | Jump to subroutine
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA ($BA,X)		  ; 81 BA | Store accumulator to (zero page,X)
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($3B),Y		  ; 11 3B | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BRA $7F			  ; 80 7F | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA ($2A),Y		  ; 11 2A | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $DB20,X		  ; 5D 20 DB | Exclusive OR with accumulator (absolute,X)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	INC $FE80,X		  ; FE 80 FE | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $6B80,Y		  ; 19 80 6B | Logical OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $38			  ; 10 38 | Branch if positive
	BPL $60			  ; 10 60 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F 00 1C 00 | Store accumulator to absolute long,X
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $28			  ; 10 28 | Branch if positive
	BPL $80			  ; 10 80 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BCC $48			  ; 90 48 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	LDY $5020,X		  ; BC 20 50 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_01E
; Address: $F687EB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_01E:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_020
; Address: $F687FB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_020:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $0900,X		  ; 1E 00 09 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_021
; Address: $F68807
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_021:
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	STA $007300		  ; 8F 00 73 00 | Store accumulator to absolute long address
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_022
; Address: $F68834
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_022:
	BRA $F3			  ; 80 F3 | Branch always
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	AND #$5F			 ; 29 5F | Logical AND with accumulator (immediate)
	BIT $5F			  ; 24 5F | Test bits in accumulator (zero page)
	BCC $EC			  ; 90 EC | Branch if carry clear
	BPL $A8			  ; 10 A8 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SBC $F609			; ED 09 F6 | Subtract with carry (absolute)
	BRA $7C			  ; 80 7C | Branch always
	CLV				  ; B8 | Clear overflow flag
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0002,X		  ; 1D 02 00 | Logical OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0018,X		  ; 1D 18 00 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_023
; Address: $F688C7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_023:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_024
; Address: $F688FD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_024:
	JSR $18B8			; 20 B8 18 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_025
; Address: $F6891D
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_025:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ADC $FF08,X		  ; 7D 08 FF | Add with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	AND #$3A			 ; 29 3A | Logical AND with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	EOR $97			  ; 45 97 | Exclusive OR with accumulator (zero page)
	STX $D6			  ; 86 D6 | Store X register to zero page
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $20			  ; D0 20 | Branch if not equal
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BNE $90			  ; D0 90 | Branch if not equal
	LDY $4300,X		  ; BC 00 43 | Load from absolute,X into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $3C00,Y		  ; 19 00 3C | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $8D			  ; 06 8D | Arithmetic shift left (zero page)
	ORA $137B			; 0D 7B 13 | Logical OR with accumulator (absolute)
	STZ $FD0E,X		  ; 9E 0E FD | Store zero to absolute,X
	PHP				  ; 08 | Push processor status to stack
	SBC $3037,X		  ; FD 37 30 | Subtract with carry (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	SBC $F30C			; ED 0C F3 | Subtract with carry (absolute)
	BRA $FF			  ; 80 FF | Branch always
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $54			  ; A4 54 | Load from zero page into Y register
	NOP				  ; EA | No operation
	PLX				  ; FA | Pull X register from stack
	ASL $59			  ; 06 59 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_027
; Address: $F689B5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_027:
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDX $AE50,Y		  ; BE 50 AE | Load from absolute,Y into X register
	SBC $123D,X		  ; FD 3D 12 | Subtract with carry (absolute,X)
	BIT $1273			; 2C 73 12 | Test bits in accumulator (absolute)
	ADC ($11),Y		  ; 71 11 | Add with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	AND $5320			; 2D 20 53 | Logical AND with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	ADC $6E40			; 6D 40 6E | Add with carry (absolute)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_028
; Address: $F689D9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_028:
	JSR $181B			; 20 1B 18 | Jump to subroutine
	CPY #$8A			 ; C0 8A | Compare Y register (immediate)
	LDY $A4			  ; A4 A4 | Load from zero page into Y register
	PHX				  ; DA | Push X register to stack
	CPY #$E4			 ; C0 E4 | Compare Y register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $C301,X		  ; BD 01 C3 | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_029
; Address: $F68A01
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_029:
	JSR $D8DE			; 20 DE D8 | Jump to subroutine
	ROL $7608			; 2E 08 76 | Rotate left (absolute)
	CPX $D808			; EC 08 D8 | Compare X register (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ROL $02			  ; 26 02 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_02A
; Address: $F68A15
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_02A:
	JSL $F472FA		  ; 22 FA 72 F4 | Jump to subroutine long
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_02B
; Address: $F68A1C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_02B:
	JSR $0020			; 20 20 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP ($F613)		  ; 6C 13 F6 | Jump to address (absolute indirect)
	AND $36E7			; 2D E7 36 | Logical AND with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $2C			  ; 10 2C | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_02C
; Address: $F68A39
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_02C:
	JSR $407C			; 20 7C 40 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	BRA $99			  ; 80 99 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_02D
; Address: $F68A43
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_02D:
	JSR $00FC			; 20 FC 00 | Jump to subroutine
	INC $FE38,X		  ; FE 38 FE | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BCS $E5			  ; B0 E5 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_02E
; Address: $F68A50
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_02E:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_02F
; Address: $F68A56
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_02F:
	DEC $02			  ; C6 02 | Decrement (zero page)
	INC $02			  ; E6 02 | Increment (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_030
; Address: $F68A5B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_030:
	ORA ($4F,X)		  ; 01 4F | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 04 1F 02 | Store accumulator to absolute long,X
	AND $3C09,Y		  ; 39 09 3C | Logical AND with accumulator (absolute,Y)
	ASL $390A,X		  ; 1E 0A 39 | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROR $CF2E,X		  ; 7E 2E CF | Rotate right (absolute,X)
	ROR $1D1E,X		  ; 7E 1E 1D | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_031
; Address: $F68A73
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_031:
	JSR $202B			; 20 2B 20 | Jump to subroutine
	BPL $27			  ; 10 27 | Branch if positive
	AND ($51,X)		  ; 21 51 | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY $6180			; CC 80 61 | Compare Y register (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_032
; Address: $F68A80
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_032:
	PEA #$D374		   ; F4 74 D3 | Push effective address to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$B4			 ; 49 B4 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHB				  ; 8B | Push data bank register to stack
	LDA $2A00			; AD 00 2A | Load from absolute address into accumulator
	SBC $B700,X		  ; FD 00 B7 | Subtract with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY $BE10,X		  ; BC 10 BE | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_033
; Address: $F68AAB
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_033:
	JSR $909C			; 20 9C 90 | Jump to subroutine
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $30			  ; F0 30 | Branch if equal
	CPX $DE8C			; EC 8C DE | Compare X register (absolute)
	JMP ($B00C)		  ; 6C 0C B0 | Jump to address (absolute indirect)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $00			  ; 26 00 | Rotate left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_035
; Address: $F68AD5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_035:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_036
; Address: $F68AF6
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_036:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$77			 ; A9 77 | Load immediate value into accumulator
	LDA $9E08,X		  ; BD 08 9E | Load from absolute,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	BPL $AF			  ; 10 AF | Branch if positive
	BPL $AF			  ; 10 AF | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA $000C			; 0D 0C 00 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_037
; Address: $F68B6B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_037:
	JSR $609F			; 20 9F 60 | Jump to subroutine
	STA				  ; 9F 00 10 00 | Store accumulator to absolute long,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCS $30			  ; B0 30 | Branch if carry set
	BNE $00			  ; D0 00 | Branch if not equal
	DEC $6740			; CE 40 67 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_038
; Address: $F68BA7
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_038:
	JSR $1031			; 20 31 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BRA $FF			  ; 80 FF | Branch always
	BCC $BF			  ; 90 BF | Branch if carry clear
	STX $475F			; 8E 5F 47 | Store X register to absolute address
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	DEC $3EC0			; CE C0 3E | Decrement (absolute)
	SBC $FB01,X		  ; FD 01 FB | Subtract with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $F878,X		  ; 7E 78 F8 | Rotate right (absolute,X)
	ASL $3EFF			; 0E FF 3E | Arithmetic shift left (absolute)
	INC $FDFC,X		  ; FE FC FD | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC ($84,X)		  ; E1 84 | Subtract with carry ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_039
; Address: $F68BF4
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_039:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	ORA $0301,X		  ; 1D 01 03 | Logical OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $031C,X		  ; 1E 1C 03 | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	DEC $FF			  ; C6 FF | Decrement (zero page)
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
	AND $B800,Y		  ; 39 00 B8 | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ASL $0F05			; 0E 05 0F | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $28			  ; 10 28 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_03A
; Address: $F68C7D
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_03A:
	JSR $407C			; 20 7C 40 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $FE			  ; 80 FE | Branch always
	ROL $67			  ; 26 67 | Rotate left (zero page)
	LDX $FF			  ; A6 FF | Load from zero page into X register
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $C302,X		  ; FE 02 C3 | Increment (absolute,X)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($D9,X)		  ; 01 D9 | Logical OR with accumulator ((zero page,X))
	EOR $E300,Y		  ; 59 00 E3 | Exclusive OR with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	ADC $FE22,X		  ; 7D 22 FE | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_03B
; Address: $F68CC5
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_03B:
	EOR $63E3,X		  ; 5D E3 63 | Exclusive OR with accumulator (absolute,X)
	BVS $30			  ; 70 30 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BMI $5D			  ; 30 5D | Branch if negative
	RTI				  ; 40 | Return from interrupt
	LDX #$80			 ; A2 80 | Load immediate value into X register
	STZ $4F80			; 9C 80 4F | Store zero to absolute
	RTI				  ; 40 | Return from interrupt
	BMI $0F			  ; 30 0F | Branch if negative
	SBC $D13D,X		  ; FD 3D D1 | Subtract with carry (absolute,X)
	LDA $DB			  ; A5 DB | Load from zero page into accumulator
	CMP ($E5,X)		  ; C1 E5 | Compare accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	AND $FF00,X		  ; 3D 00 FF | Logical AND with accumulator (absolute,X)
	REP #$00			 ; C2 00 | Reset processor status bits
	INC $5A00			; EE 00 5A | Increment (absolute)
	ROL $BD00,X		  ; 3E 00 BD | Rotate left (absolute,X)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	LDY #$EE			 ; A0 EE | Load immediate value into Y register
	PLP				  ; 28 | Pull processor status from stack
	REP #$3B			 ; C2 3B | Reset processor status bits
	CPY $F000			; CC 00 F0 | Compare Y register (absolute)
	JMP $02D60C		  ; 5C 0C D6 02 | Jump to address long
	AND $FD11,X		  ; 3D 11 FD | Logical AND with accumulator (absolute,X)
	AND $F2FA,Y		  ; 39 FA F2 | Logical AND with accumulator (absolute,Y)
	CPY $3030			; CC 30 30 | Compare Y register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1802,X		  ; 1D 02 18 | Logical OR with accumulator (absolute,X)
	BIT $5713			; 2C 13 57 | Test bits in accumulator (absolute)
	BIT $37E3			; 2C E3 37 | Test bits in accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $1810,X		  ; 1D 10 18 | Logical OR with accumulator (absolute,X)
	BPL $3C			  ; 10 3C | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_03C
; Address: $F68D3B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_03C:
	JSR $406B			; 20 6B 40 | Jump to subroutine
	BRA $E0			  ; 80 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_03D
; Address: $F68D43
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_03D:
	JSR $00FC			; 20 FC 00 | Jump to subroutine
	INC $EE78,X		  ; FE 78 EE | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	BIT $E3			  ; 24 E3 | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_03E
; Address: $F68D4E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_03E:
	CMP $C0			  ; C5 C0 | Compare accumulator (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag
	STX $02			  ; 86 02 | Store X register to zero page
	ORA ($9F,X)		  ; 01 9F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_03F
; Address: $F68D7E
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_03F:
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	INC $67			  ; E6 67 | Increment (zero page)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	EOR $3600			; 4D 00 36 | Exclusive OR with accumulator (absolute)
	BRA $AA			  ; 80 AA | Branch always
	BRA $99			  ; 80 99 | Branch always
	BRA $BF			  ; 80 BF | Branch always
	BRA $7E			  ; 80 7E | Branch always
	JMP $363F			; 4C 3F 36 | Jump to address
	ORA $FF6F,Y		  ; 19 6F FF | Logical OR with accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $0F			  ; 90 0F | Branch if carry clear
	INC $00			  ; E6 00 | Increment (zero page)
	BCC $00			  ; 90 00 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $40			  ; 70 40 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_040
; Address: $F68DC9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_040:
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $10			  ; D0 10 | Branch if not equal
	BCS $10			  ; B0 10 | Branch if carry set
	BEQ $10			  ; F0 10 | Branch if equal
	BNE $10			  ; D0 10 | Branch if not equal
	LDY #$20			 ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_041
; Address: $F68E0D
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_041:
	JSR $20DF			; 20 DF 20 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX $0A			  ; E4 0A | Compare X register (zero page)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BMI $39			  ; 30 39 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $DF			  ; 80 DF | Branch always
	BRA $A7			  ; 80 A7 | Branch always
	STY $4F			  ; 84 4F | Store Y register to zero page
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ASL $1E00			; 0E 00 1E | Arithmetic shift left (absolute)
	ADC $FB01,X		  ; 7D 01 FB | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROL $F830,X		  ; 3E 30 F8 | Rotate left (absolute,X)
	ASL $1EFF			; 0E FF 1E | Arithmetic shift left (absolute)
	INC $FD7C,X		  ; FE 7C FD | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_042
; Address: $F68E7A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_042:
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	BCS $00			  ; B0 00 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_043
; Address: $F68E9A
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_043:
	JSR $007F			; 20 7F 00 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	STX $3D			  ; 86 3D | Store X register to zero page
	EOR $039B,X		  ; 5D 9B 03 | Exclusive OR with accumulator (absolute,X)
	ROR $9D1E,X		  ; 7E 1E 9D | Rotate right (absolute,X)
	BCS $0F			  ; B0 0F | Branch if carry set
	ORA $02E6,Y		  ; 19 E6 02 | Logical OR with accumulator (absolute,Y)
	SBC $E31C,X		  ; FD 1C E3 | Subtract with carry (absolute,X)
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $54			  ; A4 54 | Load from zero page into Y register
	NOP				  ; EA | No operation
	PLY				  ; 7A | Pull Y register from stack
	STX $D9			  ; 86 D9 | Store X register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	SBC $E011,Y		  ; F9 11 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_044
; Address: $F68ED5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_044:
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDX $EE10,Y		  ; BE 10 EE | Load from absolute,Y into X register
	BRA $7F			  ; 80 7F | Branch always
	SBC $043F,X		  ; FD 3F 04 | Subtract with carry (absolute,X)
	BIT $FD			  ; 24 FD | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	BVS $10			  ; 70 10 | Branch if overflow set
	ASL $0302,X		  ; 1E 02 03 | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	SBC $C780			; ED 80 C7 | Subtract with carry (absolute)
	BRA $90			  ; 80 90 | Branch always
	BRA $6F			  ; 80 6F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_045
; Address: $F68EFC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_045:
	ORA $031C,X		  ; 1D 1C 03 | Logical OR with accumulator (absolute,X)
	STZ $F966,X		  ; 9E 66 F9 | Store zero to absolute,X
	ORA $F5D1,Y		  ; 19 D1 F5 | Logical OR with accumulator (absolute,Y)
	LDY $DA			  ; A4 DA | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_046
; Address: $F68F0A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_046:
	CMP ($E4,X)		  ; C1 E4 | Compare accumulator ((zero page,X))
	STA $E600,Y		  ; 99 00 E6 | Store accumulator to absolute,Y
	ROL $5B00			; 2E 00 5B | Rotate left (absolute)
	ORA ($BF,X)		  ; 01 BF | Logical OR with accumulator ((zero page,X))
	REP #$C2			 ; C2 C2 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_047
; Address: $F68F21
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_047:
	JSR $C8FE			; 20 FE C8 | Jump to subroutine
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$35			 ; E2 35 | Set processor status bits
	DEC $00			  ; C6 00 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_048
; Address: $F68F35
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_048:
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	ORA #$FB			 ; 09 FB | Logical OR with accumulator (immediate)
	AND ($FE),Y		  ; 31 FE | Logical AND with accumulator ((zero page),Y)
	DEC $F8			  ; C6 F8 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1806,Y		  ; 19 06 18 | Logical OR with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $1810,Y		  ; 19 10 18 | Logical OR with accumulator (absolute,Y)
	BPL $3C			  ; 10 3C | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_049
; Address: $F68F5B
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_049:
	JSR $406B			; 20 6B 40 | Jump to subroutine
	BRA $E0			  ; 80 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	INC $CE78,X		  ; FE 78 CE | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	CPY #$85			 ; C0 85 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	STX $02			  ; 86 02 | Store X register to zero page
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	AND #$F7			 ; 29 F7 | Logical AND with accumulator (immediate)
	BIT $7B			  ; 24 7B | Test bits in accumulator (zero page)
	AND $3A10,X		  ; 3D 10 3A | Logical AND with accumulator (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_04A
; Address: $F68FB2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_04A:
	JSR $105F			; 20 5F 10 | Jump to subroutine
	BPL $2A			  ; 10 2A | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA $0002			; 0D 02 00 | Logical OR with accumulator (absolute)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_04B
; Address: $F68FDE
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_04B:
	ORA $0008			; 0D 08 00 | Logical OR with accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $0002			; 0D 02 00 | Logical OR with accumulator (absolute)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0008			; 0D 08 00 | Logical OR with accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BNE $10			  ; D0 10 | Branch if not equal
	BEQ $10			  ; F0 10 | Branch if equal
	INX				  ; E8 | Increment X register
	CMP ($0A,X)		  ; C1 0A | Compare accumulator ((zero page,X))
	BNE $41			  ; D0 41 | Branch if not equal
	ROR $3B20			; 6E 20 3B | Rotate right (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $FE			  ; 80 FE | Branch always
	BRA $AF			  ; 80 AF | Branch always
	BRA $51			  ; 80 51 | Branch always
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	BRA $3F			  ; 80 3F | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BMI $F0			  ; 30 F0 | Branch if negative
	ASL $0EFF			; 0E FF 0E | Arithmetic shift left (absolute)
	INC $FD3E,X		  ; FE 3E FD | Increment (absolute,X)
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_04C
; Address: $F69090
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_04C:
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	SEC				  ; 38 | Set carry flag
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	AND $0600,Y		  ; 39 00 06 | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $3F02,X		  ; 7E 02 3F | Rotate right (absolute,X)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLY				  ; 7A | Pull Y register from stack
	ORA $0809			; 0D 09 08 | Logical OR with accumulator (absolute)
	BPL $1E			  ; 10 1E | Branch if positive
	BPL $1D			  ; 10 1D | Branch if positive
	BPL $3B			  ; 10 3B | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_04D
; Address: $F690D9
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_04D:
	JSR $2028			; 20 28 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$B8			 ; E0 B8 | Compare X register (immediate)
	LDY #$98			 ; A0 98 | Load immediate value into Y register
	BCC $9C			  ; 90 9C | Branch if carry clear
	BCC $8C			  ; 90 8C | Branch if carry clear
	BRA $16			  ; 80 16 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BPL $18			  ; 10 18 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	JMP ($7C04)		  ; 6C 04 7C | Jump to address (absolute indirect)
	INC $BE12,X		  ; FE 12 BE | Increment (absolute,X)
	ORA $1A06,X		  ; 1D 06 1A | Logical OR with accumulator (absolute,X)
	ORA $1D			  ; 05 1D | Logical OR with accumulator (zero page)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $1D			  ; 10 1D | Branch if positive
	BPL $1A			  ; 10 1A | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_050
; Address: $F6911D
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_050:
	JSR $4076			; 20 76 40 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BNE $B8			  ; D0 B8 | Branch if not equal
	CPX #$58			 ; E0 58 | Compare X register (immediate)
	LDY #$98			 ; A0 98 | Load immediate value into Y register
	BNE $AC			  ; D0 AC | Branch if not equal
	BRA $CC			  ; 80 CC | Branch always
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	JMP $043C04		  ; 5C 04 3C 04 | Jump to address long
	CPX $04			  ; E4 04 | Compare X register (zero page)
	INC $0102,X		  ; FE 02 01 | Increment (absolute,X)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $1906,Y		  ; 19 06 19 | Logical OR with accumulator (absolute,Y)
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $1910,Y		  ; 19 10 19 | Logical OR with accumulator (absolute,Y)
	BPL $3F			  ; 10 3F | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_051
; Address: $F6915B
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_051:
	JSR $2028			; 20 28 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $8EF8,X		  ; FE F8 8E | Increment (absolute,X)
	DEY				  ; 88 | Decrement Y register
	STY $0B			  ; 84 0B | Store Y register to zero page
	ORA $20			  ; 05 20 | Logical OR with accumulator (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $1B06,Y		  ; 19 06 1B | Logical OR with accumulator (absolute,Y)
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_052
; Address: $F6918C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_052:
	ROR $FF16			; 6E 16 FF | Rotate right (absolute)
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $1A10,Y		  ; 19 10 1A | Logical OR with accumulator (absolute,Y)
	BPL $3C			  ; 10 3C | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_053
; Address: $F6919B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_053:
	JSR $4069			; 20 69 40 | Jump to subroutine
	DEC $E080,X		  ; DE 80 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	INC $0BF8,X		  ; FE F8 0B | Increment (absolute,X)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	STA $E082			; 8D 82 E0 | Game work RAM access
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	SBC $7F08,X		  ; FD 08 7F | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_056
; Address: $F691E0
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_056:
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	BCS $16			  ; B0 16 | Branch if carry set
	CMP $3F09,X		  ; DD 09 3F | Compare accumulator (absolute,X)
	STZ $7B1C,X		  ; 9E 1C 7B | Store zero to absolute,X
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	XBA				  ; EB | Exchange accumulator bytes
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $54			  ; A4 54 | Load from zero page into Y register
	NOP				  ; EA | No operation
	TSX				  ; BA | Transfer stack pointer to X register
	STX $59			  ; 86 59 | Store X register to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC $E011,Y		  ; F9 11 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_057
; Address: $F69215
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_057:
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDX $6E90,Y		  ; BE 90 6E | Load from absolute,Y into X register
	SBC $12F0,X		  ; FD F0 12 | Subtract with carry (absolute,X)
	CPX $20			  ; E4 20 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_059
; Address: $F69229
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_059:
	JSR $187F			; 20 7F 18 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BRA $DB			  ; 80 DB | Branch always
	BRA $DC			  ; 80 DC | Branch always
	BRA $DF			  ; 80 DF | Branch always
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INC $DC08			; EE 08 DC | Increment (absolute)
	BPL $F0			  ; 10 F0 | Branch if positive
	ORA $19DD,Y		  ; 19 DD 19 | Logical OR with accumulator (absolute,Y)
	ORA $19FB,Y		  ; 19 FB 19 | Logical OR with accumulator (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	SEP #$E4			 ; E2 E4 | Set processor status bits
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BPL $78			  ; 10 78 | Branch if positive
	BPL $34			  ; 10 34 | Branch if positive
	BPL $3F			  ; 10 3F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	ADC $6F40			; 6D 40 6F | Add with carry (absolute)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BIT $27			  ; 24 27 | Test bits in accumulator (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPX $D808			; EC 08 D8 | Compare X register (absolute)
	BPL $F0			  ; 10 F0 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	PEA #$F4F4		   ; F4 F4 F4 | Push effective address to stack
	CPX $E8			  ; E4 E8 | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	AND ($E2,X)		  ; 21 E2 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_05A
; Address: $F692A5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_05A:
	JSR $1071			; 20 71 10 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	INC $DF84			; EE 84 DF | Increment (absolute)
	DEY				  ; 88 | Decrement Y register
	CMP $6E80,X		  ; DD 80 6E | Compare accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BMI $0C			  ; 30 0C | Branch if negative

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_05B
; Address: $F692C0
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_05B:
	ROL $D0			  ; 26 D0 | Rotate left (zero page)
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	ORA ($EF,X)		  ; 01 EF | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $EE			  ; 06 EE | Arithmetic shift left (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	SBC $F071,Y		  ; F9 71 F0 | Subtract with carry (absolute,Y)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	SBC $CF36,Y		  ; F9 36 CF | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	JMP ($3B20)		  ; 6C 20 3B | Jump to address (absolute indirect)
	CLC				  ; 18 | Clear carry flag
	CMP #$80			 ; C9 80 | Compare accumulator (immediate)
	BRA $BC			  ; 80 BC | Branch always
	BCC $5F			  ; 90 5F | Branch if carry clear
	JMP $2327			; 4C 27 23 | Jump to address
	CLC				  ; 18 | Clear carry flag
	CPY #$DD			 ; C0 DD | Compare Y register (immediate)
	CMP ($3D,X)		  ; C1 3D | Compare accumulator ((zero page,X))
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	ROL $F830,X		  ; 3E 30 F8 | Rotate left (absolute,X)
	ROL $3E1E,X		  ; 3E 1E 3E | Rotate left (absolute,X)
	INC $FD3C,X		  ; FE 3C FD | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_05C
; Address: $F69355
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_05C:
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ROL $0702,X		  ; 3E 02 07 | Rotate left (absolute,X)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$57			 ; 09 57 | Logical OR with accumulator (immediate)
	BIT $7B			  ; 24 7B | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_05D
; Address: $F693A4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_05D:
	JSL $3E107D		  ; 22 7D 10 3E | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_05E
; Address: $F693B2
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_05E:
	JSR $205F			; 20 5F 20 | Jump to subroutine
	BPL $2E			  ; 10 2E | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $1A02			; 0D 02 1A | Logical OR with accumulator (absolute)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $20			  ; F0 20 | Branch if equal
	BCS $E0			  ; B0 E0 | Game work RAM access
	CLI				  ; 58 | Clear interrupt disable flag
	BCS $00			  ; B0 00 | Branch if carry set
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BNE $10			  ; D0 10 | Branch if not equal
	BVC $10			  ; 50 10 | Branch if overflow clear
	TAY				  ; A8 | Transfer accumulator to Y register
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $1906,Y		  ; 19 06 19 | Logical OR with accumulator (absolute,Y)
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_05F
; Address: $F69410
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_05F:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $1910,Y		  ; 19 10 19 | Logical OR with accumulator (absolute,Y)
	BPL $3F			  ; 10 3F | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_060
; Address: $F6941B
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_060:
	JSR $4068			; 20 68 40 | Jump to subroutine
	BRA $E0			  ; 80 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	INC $8EF8,X		  ; FE F8 8E | Increment (absolute,X)
	DEY				  ; 88 | Decrement Y register
	STY $8B			  ; 84 8B | Store Y register to zero page
	BRA $09			  ; 80 09 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $1B06,Y		  ; 19 06 1B | Logical OR with accumulator (absolute,Y)
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	ORA ($6F,X)		  ; 01 6F | Logical OR with accumulator ((zero page,X))
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $1A10,Y		  ; 19 10 1A | Logical OR with accumulator (absolute,Y)
	BPL $3E			  ; 10 3E | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_061
; Address: $F6945B
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_061:
	JSR $4068			; 20 68 40 | Jump to subroutine
	DEC $E080,X		  ; DE 80 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	INC $8EF8,X		  ; FE F8 8E | Increment (absolute,X)
	DEY				  ; 88 | Decrement Y register
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $85			  ; 05 85 | Logical OR with accumulator (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND $4300,X		  ; 3D 00 43 | Logical AND with accumulator (absolute,X)
	LDY $4300,X		  ; BC 00 43 | Load from absolute,X into Y register
	AND $7F0C,X		  ; 3D 0C 7F | Logical AND with accumulator (absolute,X)
	ORA $1F07,X		  ; 1D 07 1F | Logical OR with accumulator (absolute,X)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_062
; Address: $F694B0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_062:
	INC				  ; 1A | Increment accumulator
	BPL $18			  ; 10 18 | Branch if positive
	BPL $18			  ; 10 18 | Branch if positive
	BPL $14			  ; 10 14 | Branch if positive
	BPL $14			  ; 10 14 | Branch if positive
	BPL $3E			  ; 10 3E | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_064
; Address: $F694BF
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_064:
	JSR $C098			; 20 98 C0 | Jump to subroutine
	CLV				  ; B8 | Clear overflow flag
	BRA $D8			  ; 80 D8 | Branch always
	CLC				  ; 18 | Clear carry flag
	BPL $0C			  ; 10 0C | Branch if positive
	STY $8C80			; 8C 80 8C | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	STY $7888			; 8C 88 78 | Store Y register to absolute address
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	DEC $D00E			; CE 0E D0 | Decrement (absolute)
	RTI				  ; 40 | Return from interrupt
	JMP ($3B20)		  ; 6C 20 3B | Jump to address (absolute indirect)
	CLC				  ; 18 | Clear carry flag
	ASL $0706,X		  ; 1E 06 07 | Arithmetic shift left (absolute,X)
	CPY $F180			; CC 80 F1 | Compare Y register (absolute)
	BRA $BF			  ; 80 BF | Branch always
	BCC $5F			  ; 90 5F | Branch if carry clear
	JMP $2327			; 4C 27 23 | Jump to address
	ORA $0718,Y		  ; 19 18 07 | Logical OR with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	BMI $F0			  ; 30 F0 | Branch if negative
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC ($E0,X)		  ; E1 E0 | Game work RAM access
	SBC ($E1),Y		  ; F1 E1 | Subtract with carry ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BMI $CF			  ; 30 CF | Branch if negative
	ORA $43D3			; 0D D3 43 | Logical OR with accumulator (absolute)
	JMP ($3B20)		  ; 6C 20 3B | Jump to address (absolute indirect)
	CLC				  ; 18 | Clear carry flag
	BRA $F2			  ; 80 F2 | Branch always
	BRA $BC			  ; 80 BC | Branch always
	BCC $5F			  ; 90 5F | Branch if carry clear
	JMP $2327			; 4C 27 23 | Jump to address

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_065
; Address: $F6953B
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_065:
	CLC				  ; 18 | Clear carry flag
	DEY				  ; 88 | Decrement Y register
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	SBC $360C			; ED 0C 36 | Subtract with carry (absolute)
	BMI $F8			  ; 30 F8 | Branch if negative
	ROR $F816,X		  ; 7E 16 F8 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	SBC $F3F8,X		  ; FD F8 F3 | Subtract with carry (absolute,X)
	SBC ($C8,X)		  ; E1 C8 | Subtract with carry ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CLC				  ; 18 | Clear carry flag
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL $0E00,X		  ; 1E 00 0E | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	AND $2A10			; 2D 10 2A | Logical AND with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROL $3F12,X		  ; 3E 12 3F | Rotate left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $38			  ; 10 38 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0704			; 0D 04 07 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_067
; Address: $F695D5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_067:
	JSR $2437			; 20 37 24 | Jump to subroutine
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_068
; Address: $F695EC
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_068:
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PEA #$F404		   ; F4 04 F4 | Push effective address to stack
	PEA #$F434		   ; F4 34 F4 | Push effective address to stack
	PEA #$E8F8		   ; F4 F8 E8 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BEQ $D0			  ; F0 D0 | Branch if equal
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	EOR $2200,X		  ; 5D 00 22 | Exclusive OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP $084B10		  ; 5C 10 4B 08 | Jump to address long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	BPL $3C			  ; 10 3C | Branch if positive
	ASL $0E00,X		  ; 1E 00 0E | Arithmetic shift left (absolute,X)
	AND $7719,Y		  ; 39 19 77 | Logical AND with accumulator (absolute,Y)
	TAX				  ; AA | Transfer accumulator to X register
	PHP				  ; 08 | Push processor status to stack
	ASL $3708,X		  ; 1E 08 37 | Arithmetic shift left (absolute,X)
	ORA ($6E),Y		  ; 11 6E | Logical OR with accumulator ((zero page),Y)
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	ADC $0000,X		  ; 7D 00 00 | Add with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BCS $4C			  ; B0 4C | Branch if carry set
	JMP $BD0AEA		  ; 5C EA 0A BD | Jump to address long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $5782,X		  ; BD 82 57 | Load from absolute,X into accumulator
	BRA $5A			  ; 80 5A | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	SBC $FE20,X		  ; FD 20 FE | Subtract with carry (absolute,X)
	ASL $1B0C			; 0E 0C 1B | Arithmetic shift left (absolute)
	ADC $FB54,X		  ; 7D 54 FB | Add with carry (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $0000,Y		  ; 59 00 00 | Exclusive OR with accumulator (absolute,Y)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $6F			  ; 10 6F | Branch if positive
	BVC $AF			  ; 50 AF | Branch if overflow clear
	LDX $AC00,Y		  ; BE 00 AC | Load from absolute,Y into X register
	STA ($EF,X)		  ; 81 EF | Store accumulator to (zero page,X)
	LDY $D3			  ; A4 D3 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_069
; Address: $F696CC
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_069:
	BPL $A9			  ; 10 A9 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BEQ $B0			  ; F0 B0 | Branch if equal
	LDA $7E81			; AD 81 7E | Load from absolute address into accumulator
	BRA $7F			  ; 80 7F | Branch always
	LDA				  ; BF 09 17 80 | Load from absolute long,X into accumulator
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $80			  ; 70 80 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_06A
; Address: $F696FC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_06A:
	JSR $80D0			; 20 D0 80 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $3B1C,X		  ; 1E 1C 3B | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_06B
; Address: $F69708
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_06B:
	JSL $7B257D		  ; 22 7D 25 7B | Jump to subroutine long
	ORA ($2E,X)		  ; 01 2E | Logical OR with accumulator ((zero page,X))
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_06C
; Address: $F69718
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_06C:
	JSR $215F			; 20 5F 21 | PPU graphics register access
	LSR $7D02,X		  ; 5E 02 7D | Logical shift right (absolute,X)
	BPL $3F			  ; 10 3F | Branch if positive
	LDX $AD01,Y		  ; BE 01 AD | Load from absolute,Y into X register
	SBC $F681,X		  ; FD 81 F6 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_06D
; Address: $F6972A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_06D:
	JSR $18D8			; 20 D8 18 | Jump to subroutine
	ASL $9B			  ; 06 9B | Arithmetic shift left (zero page)
	BEQ $B1			  ; F0 B1 | Branch if equal
	BNE $2F			  ; D0 2F | Branch if not equal
	BRA $7F			  ; 80 7F | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 02 9D 00 | Load from absolute long,X into accumulator
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $10			  ; 10 10 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $E8			  ; 90 E8 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_06E
; Address: $F6974C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_06E:
	JSR $00B0			; 20 B0 00 | Jump to subroutine
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	BRA $78			  ; 80 78 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_070
; Address: $F6975F
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_070:
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $1100			; 0E 00 11 | Arithmetic shift left (absolute)
	ORA ($2F,X)		  ; 01 2F | Logical OR with accumulator ((zero page,X))
	ORA ($3E),Y		  ; 11 3E | Logical OR with accumulator ((zero page),Y)
	BRA $FA			  ; 80 FA | Branch always
	SBC $0D			  ; E5 0D | Subtract with carry (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $3A01			; ED 01 3A | Subtract with carry (absolute)
	LDY #$51			 ; A0 51 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ORA $28F2			; 0D F2 28 | Logical OR with accumulator (absolute)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	DEC $C123,X		  ; DE 23 C1 | Decrement (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_071
; Address: $F697AA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_071:
	BRA $7C			  ; 80 7C | Branch always
	STA				  ; 9F 12 6F 00 | Store accumulator to absolute long,X
	ASL $FD02,X		  ; 1E 02 FD | Arithmetic shift left (absolute,X)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_072
; Address: $F697B9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_072:
	STA				  ; 9F 01 FF 1C | Store accumulator to absolute long,X
	ADC $0000,X		  ; 7D 00 00 | Add with carry (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_073
; Address: $F697CD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_073:
	JSR $D040			; 20 40 D0 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_074
; Address: $F697E9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_074:
	JSR $5D02			; 20 02 5D | Jump to subroutine
	LDX $AE04			; AE 04 AE | Load from absolute address into X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $3F0C,X		  ; 1D 0C 3F | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_075
; Address: $F697FA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_075:
	JSR $047F			; 20 7F 04 | Jump to subroutine
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	BRA $FA			  ; 80 FA | Branch always
	CMP $0D			  ; C5 0D | Compare accumulator (zero page)
	BVS $7D			  ; 70 7D | Branch if overflow set

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_076
; Address: $F6980A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_076:
	JSR $40D0			; 20 D0 40 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_077
; Address: $F69816
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_077:
	ORA $70F2			; 0D F2 70 | Logical OR with accumulator (absolute)
	STA $F000			; 8D 00 F0 | Store accumulator to absolute address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_079
; Address: $F69838
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_079:
	JSL $FF00DF		  ; 22 DF 00 FF | Jump to subroutine long
	BVS $01			  ; 70 01 | Branch if overflow set
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	BRA $C4			  ; 80 C4 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STZ $4480,X		  ; 9E 80 44 | Store zero to absolute,X
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	SEC				  ; 38 | Set carry flag
	LDA $E650			; AD 50 E6 | Load from absolute address into accumulator
	PLP				  ; 28 | Pull processor status from stack
	BPL $14			  ; 10 14 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	LDX $5C08,Y		  ; BE 08 5C | Load from absolute,Y into X register
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR $3810,X		  ; 7E 10 38 | Rotate right (absolute,X)
	BPL $38			  ; 10 38 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_07A
; Address: $F698C3
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_07A:
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDY $A800,X		  ; BC 00 A8 | Load from absolute,X into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_07B
; Address: $F69910
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_07B:
	JSR $487D			; 20 7D 48 | Jump to subroutine
	PEA #$E840		   ; F4 40 E8 | Push effective address to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_07C
; Address: $F69949
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_07C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $B8			  ; 10 B8 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_07D
; Address: $F69959
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_07D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($53,X)		  ; 01 53 | Logical OR with accumulator ((zero page,X))
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	AND ($72,X)		  ; 21 72 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_07E
; Address: $F69973
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_07E:
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_07F
; Address: $F699A5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_07F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_080
; Address: $F699B5
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_080:
	JSR $0000			; 20 00 00 | Jump to subroutine
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $0800,X		  ; 1D 00 08 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDY $C502,X		  ; BC 02 C5 | Load from absolute,X into Y register
	ASL $3C00			; 0E 00 3C | Arithmetic shift left (absolute)
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $82			  ; 80 82 | Branch always
	SBC $1F1D,X		  ; FD 1D 1F | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDA $4180,X		  ; BD 80 41 | Load from absolute,X into accumulator
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $7F			  ; 80 7F | Branch always
	ORA $00E2,X		  ; 1D E2 00 | Logical OR with accumulator (absolute,X)
	SBC $C100,X		  ; FD 00 C1 | Subtract with carry (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	BEQ $0F			  ; F0 0F | Branch if equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $FD			  ; 80 FD | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_081
; Address: $F69A8F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_081:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	INC $7F80,X		  ; FE 80 7F | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_082
; Address: $F69AA4
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_082:
	JSR $4442			; 20 42 44 | Jump to subroutine
	STA $A500,Y		  ; 99 00 A5 | Store accumulator to absolute,Y
	LDX #$00			 ; A2 00 | Load immediate value into X register
	WDM #$00			 ; 42 00 | Reserved instruction
	ROR $FF22,X		  ; 7E 22 FF | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $3B			  ; 80 3B | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $3F			  ; 80 3F | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $12E0			; 0D E0 12 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STY $08			  ; 84 08 | Store Y register to zero page
	BRA $4A			  ; 80 4A | Branch always
	STY $00			  ; 84 00 | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	STY $FE			  ; 84 FE | Store Y register to zero page
	DEC $8400			; CE 00 84 | Decrement (absolute)
	WDM #$00			 ; 42 00 | Reserved instruction
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	STY $00			  ; 84 00 | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	BMI $FC			  ; 30 FC | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BPL $38			  ; 10 38 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_083
; Address: $F69B8D
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_083:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_084
; Address: $F69BB8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_084:
	JSR $2070			; 20 70 20 | Jump to subroutine
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_085
; Address: $F69BDE
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_085:
	JSR $0270			; 20 70 02 | Jump to subroutine
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $1D08			; 0E 08 1D | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $1D08,X		  ; 1D 08 1D | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_086
; Address: $F69C56
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_086:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	STA $8B4D,X		  ; 9D 4D 8B | Store accumulator to absolute,X
	BRA $7D			  ; 80 7D | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	SBC $4080,X		  ; FD 80 40 | Subtract with carry (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $3C			  ; F0 3C | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $79			  ; 06 79 | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	BMI $CC			  ; 30 CC | Branch if negative
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	AND $0500,X		  ; 3D 00 05 | Logical AND with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_087
; Address: $F69CFB
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_087:
	BRA $00			  ; 80 00 | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA #$E0			 ; 09 E0 | Game work RAM access
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $7000,X		  ; 1E 00 70 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
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
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$9B			 ; A0 9B | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_088
; Address: $F69D6F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_088:
	JSR $C080			; 20 80 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_089
; Address: $F69D8C
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_089:
	BPL $04			  ; 10 04 | Branch if positive
	INX				  ; E8 | Increment X register
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BMI $20			  ; 30 20 | Branch if negative
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_08A
; Address: $F69E05
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_08A:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_08B
; Address: $F69E14
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_08B:
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_08C
; Address: $F69E1D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_08C:
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $1C08			; 0E 08 1C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_08D
; Address: $F69E45
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_08D:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_08E
; Address: $F69E54
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_08E:
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BVS $10			  ; 70 10 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	BPL $38			  ; 10 38 | Branch if positive
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $1D08,X		  ; 1D 08 1D | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_08F
; Address: $F69E80
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_08F:
	JSL $8B4D9D		  ; 22 9D 4D 8B | Jump to subroutine long
	BRA $7D			  ; 80 7D | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	SBC $4080,X		  ; FD 80 40 | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BEQ $3C			  ; F0 3C | Branch if equal
	ADC $0702,X		  ; 7D 02 07 | Add with carry (absolute,X)
	BMI $CC			  ; 30 CC | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_090
; Address: $F69EC5
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_090:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BPL $29			  ; 10 29 | Branch if positive
	ORA ($3A),Y		  ; 11 3A | Logical OR with accumulator ((zero page),Y)
	ORA ($3B),Y		  ; 11 3B | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	AND $2B10,Y		  ; 39 10 2B | Logical AND with accumulator (absolute,Y)
	ORA ($2A),Y		  ; 11 2A | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CMP $2FCD,X		  ; DD CD 2F | Compare accumulator (absolute,X)
	CMP $8000,X		  ; DD 00 80 | Compare accumulator (absolute,X)
	ORA $00F2			; 0D F2 00 | Logical OR with accumulator (absolute)
	CMP $8000,X		  ; DD 00 80 | Compare accumulator (absolute,X)
	INY				  ; C8 | Increment Y register
	ROL $01C1,X		  ; 3E C1 01 | Rotate left (absolute,X)
	ROL $0201,X		  ; 3E 01 02 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $03			  ; 50 03 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_091
; Address: $F69F71
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_091:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $07			  ; 70 07 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BRA $50			  ; 80 50 | Branch always
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $40			  ; 50 40 | Branch if overflow clear
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1C00			; 0E 00 1C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_092
; Address: $F69FED
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_092:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $40			  ; 70 40 | Branch if overflow set
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	BPL $38			  ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_093
; Address: $F6A034
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_093:
	JSR $2070			; 20 70 20 | Jump to subroutine
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $40			  ; 70 40 | Branch if overflow set
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_094
; Address: $F6A07D
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_094:
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	EOR $EF			  ; 45 EF | Exclusive OR with accumulator (zero page)
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	LDY $DA			  ; A4 DA | Load from zero page into Y register
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	EOR $BA			  ; 45 BA | Exclusive OR with accumulator (zero page)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7E			  ; 80 7E | Branch always
	INX				  ; E8 | Increment X register
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	CPY $16B6			; CC B6 16 | Compare Y register (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	LDA $295729		  ; AF 29 57 29 | Load from absolute long address into accumulator
	AND $5F			  ; 25 5F | Logical AND with accumulator (zero page)
	BPL $EC			  ; 10 EC | Branch if positive
	STY $7A			  ; 84 7A | Store Y register to zero page
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	ORA #$76			 ; 09 76 | Logical OR with accumulator (immediate)
	ORA $7A			  ; 05 7A | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BPL $2F			  ; 10 2F | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	AND #$76			 ; 29 76 | Logical AND with accumulator (immediate)
	AND #$76			 ; 29 76 | Logical AND with accumulator (immediate)
	AND ($6F),Y		  ; 31 6F | Logical AND with accumulator ((zero page),Y)
	NOP				  ; EA | No operation
	ORA $3A			  ; 05 3A | Logical OR with accumulator (zero page)
	BPL $2F			  ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_095
; Address: $F6A0F8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_095:
	JSR $205F			; 20 5F 20 | Jump to subroutine
	AND ($5E,X)		  ; 21 5E | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF A0 10 C0 | Load from absolute long,X into accumulator
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BEQ $50			  ; F0 50 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	BVC $B8			  ; 50 B8 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_096
; Address: $F6A10A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_096:
	BVC $B8			  ; 50 B8 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BEQ $80			  ; F0 80 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_097
; Address: $F6A114
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_097:
	JSR $10D0			; 20 D0 10 | Jump to subroutine
	INX				  ; E8 | Increment X register
	BPL $E8			  ; 10 E8 | Branch if positive
	BPL $E8			  ; 10 E8 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PEA #$F408		   ; F4 08 F4 | Push effective address to stack
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BNE $C3			  ; D0 C3 | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $07			  ; F0 07 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BRA $57			  ; 80 57 | Branch always
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_098
; Address: $F6A1A5
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_098:
	BCS $00			  ; B0 00 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	BCS $00			  ; B0 00 | Branch if carry set
	PHP				  ; 08 | Push processor status to stack
	ORA $1B01,X		  ; 1D 01 1B | Logical OR with accumulator (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	PLX				  ; FA | Pull X register from stack
	LDA				  ; BF 68 FF 08 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_099
; Address: $F6A20A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_099:
	JSR $1078			; 20 78 10 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	BPL $38			  ; 10 38 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 50 AE 12 | Load from absolute long,X into accumulator
	SBC $9768			; ED 68 97 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_09A
; Address: $F6A21A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_09A:
	JSR $1058			; 20 58 10 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BPL $28			  ; 10 28 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_09B
; Address: $F6A224
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_09B:
	JSR $4074			; 20 74 40 | Jump to subroutine
	PEA #$FC48		   ; F4 48 FC | Push effective address to stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $38			  ; 10 38 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_09C
; Address: $F6A234
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_09C:
	JSR $405C			; 20 5C 40 | Jump to subroutine
	LDY $B448,X		  ; BC 48 B4 | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BPL $28			  ; 10 28 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_09D
; Address: $F6A240
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_09D:
	JSL $3FC5D5		  ; 22 D5 C5 3F | Jump to subroutine long
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_09E
; Address: $F6A262
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_09E:
	INY				  ; C8 | Increment Y register
	ROL $01C1,X		  ; 3E C1 01 | Rotate left (absolute,X)
	ROL $0201,X		  ; 3E 01 02 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0A2
; Address: $F6A295
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0A2:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	AND $3B00,Y		  ; 39 00 3B | Logical AND with accumulator (absolute,Y)
	AND $1200			; 2D 00 12 | Logical AND with accumulator (absolute)
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ROR $818D,X		  ; 7E 8D 81 | Rotate right (absolute,X)
	ROR $8100,X		  ; 7E 00 81 | Rotate right (absolute,X)
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STZ $E07C			; 9C 7C E0 | Game work RAM access
	BEQ $0E			  ; F0 0E | Branch if equal
	ASL $01F1			; 0E F1 01 | Arithmetic shift left (absolute)
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0A3
; Address: $F6A2F7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0A3:
	STA				  ; 9F 00 FE 00 | Store accumulator to absolute long,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0A4
; Address: $F6A307
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0A4:
	JSR $E040			; 20 40 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $04			  ; 50 04 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0A5
; Address: $F6A331
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0A5:
	ASL $1C08			; 0E 08 1C | Arithmetic shift left (absolute)
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0A6
; Address: $F6A33A
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0A6:
	JSR $2070			; 20 70 20 | Jump to subroutine
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
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
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0A7
; Address: $F6A370
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0A7:
	JSR $4070			; 20 70 40 | Jump to subroutine
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $1C08			; 0E 08 1C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0A8
; Address: $F6A3BD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0A8:
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0A9
; Address: $F6A410
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0A9:
	JSR $0070			; 20 70 00 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	LSR $3706			; 4E 06 37 | Logical shift right (absolute)
	ASL $C080			; 0E 80 C0 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ROR $3906,X		  ; 7E 06 39 | Rotate right (absolute,X)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0AA
; Address: $F6A443
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0AA:
	JSR $5000			; 20 00 50 | Jump to subroutine
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0AC
; Address: $F6A456
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0AC:
	JSR $4070			; 20 70 40 | Jump to subroutine
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	JMP $000000		  ; 5C 00 00 00 | Jump to address long
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0AD
; Address: $F6A47D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0AD:
	JSL $007F21		  ; 22 21 7F 00 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0AE
; Address: $F6A487
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0AE:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $1C00			; 0E 00 1C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $38			  ; 10 38 | Branch if positive
	BPL $78			  ; 10 78 | Branch if positive
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ORA ($3B,X)		  ; 01 3B | Logical OR with accumulator ((zero page,X))
	ADC ($2E),Y		  ; 71 2E | Add with carry ((zero page),Y)
	SBC $DF66,Y		  ; F9 66 DF | Subtract with carry (absolute,Y)
	BVC $05			  ; 50 05 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $2A10,X		  ; 1E 10 2A | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0AF
; Address: $F6A4D9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0AF:
	JSR $4051			; 20 51 40 | Jump to subroutine
	STA $AF80,Y		  ; 99 80 AF | Store accumulator to absolute,Y
	BRA $FE			  ; 80 FE | Branch always
	BMI $FF			  ; 30 FF | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SEP #$8F			 ; E2 8F | Set processor status bits
	STX $7CFF			; 8E FF 7C | Store X register to absolute address
	CLV				  ; B8 | Clear overflow flag
	DEC $0302			; CE 02 03 | Decrement (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA $7100,X		  ; 1D 00 71 | Logical OR with accumulator (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0B0
; Address: $F6A50E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0B0:
	BMI $20			  ; 30 20 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BPL $10			  ; 10 10 | Branch if positive
	BNE $10			  ; D0 10 | Branch if not equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0502			; 0E 02 05 | Arithmetic shift left (absolute)
	JMP $2300			; 4C 00 23 | Jump to address
	CLC				  ; 18 | Clear carry flag
	BMI $7C			  ; 30 7C | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SBC $02FC,X		  ; FD FC 02 | Subtract with carry (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $1C08			; 0E 08 1C | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BNE $00			  ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0B1
; Address: $F6A5AD
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0B1:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ASL $003F,X		  ; 1E 3F 00 | Arithmetic shift left (absolute,X)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	BNE $80			  ; D0 80 | Branch if not equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0B3
; Address: $F6A614
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0B3:
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA				  ; 9F 1C 83 03 | Store accumulator to absolute long,X
	BRA $01			  ; 80 01 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	ADC $3720			; 6D 20 37 | Add with carry (absolute)
	BRA $FC			  ; 80 FC | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0B4
; Address: $F6A633
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0B4:
	BRA $FF			  ; 80 FF | Branch always
	BRA $BF			  ; 80 BF | Branch always
	BRA $5E			  ; 80 5E | Branch always
	JMP $373F			; 4C 3F 37 | Jump to address
	JMP ($93FC)		  ; 6C FC 93 | Jump to address (absolute indirect)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $0F			  ; 90 0F | Branch if carry clear
	INC $3B00,X		  ; FE 00 3B | Increment (absolute,X)
	INX				  ; E8 | Increment X register
	ASL $38FC			; 0E FC 38 | Arithmetic shift left (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCS $20			  ; B0 20 | Branch if carry set
	BCS $20			  ; B0 20 | Branch if carry set
	BCS $20			  ; B0 20 | Branch if carry set
	BCS $20			  ; B0 20 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0B5
; Address: $F6A669
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0B5:
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $90			  ; D0 90 | Branch if not equal
	BNE $90			  ; D0 90 | Branch if not equal
	BNE $90			  ; D0 90 | Branch if not equal
	BNE $90			  ; D0 90 | Branch if not equal
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $01			  ; 70 01 | Branch if overflow set
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0B6
; Address: $F6A6C9
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0B6:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
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
; Bank6C_DmaFunction_0B7
; Address: $F6A779
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0B7:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $10			  ; 70 10 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive
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
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0B8
; Address: $F6A7E5
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0B8:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	BPL $2F			  ; 10 2F | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ORA ($3E),Y		  ; 11 3E | Logical OR with accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	ORA $3A			  ; 05 3A | Logical OR with accumulator (zero page)
	BPL $2F			  ; 10 2F | Branch if positive
	BPL $2F			  ; 10 2F | Branch if positive
	BPL $2F			  ; 10 2F | Branch if positive
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)
	BPL $2F			  ; 10 2F | Branch if positive
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BCS $60			  ; B0 60 | Branch if carry set
	BCS $60			  ; B0 60 | Branch if carry set
	BCS $20			  ; B0 20 | Branch if carry set
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $80			  ; F0 80 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0B9
; Address: $F6A835
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0B9:
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $10			  ; D0 10 | Branch if not equal
	INX				  ; E8 | Increment X register
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0BA
; Address: $F6A850
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0BA:
	JSR $2070			; 20 70 20 | Jump to subroutine
	BVS $40			  ; 70 40 | Branch if overflow set
	CPX #$40			 ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0BB
; Address: $F6A857
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0BB:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0BC
; Address: $F6A864
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0BC:
	JSR $4442			; 20 42 44 | Jump to subroutine
	STA $A500,Y		  ; 99 00 A5 | Store accumulator to absolute,Y
	LDX #$00			 ; A2 00 | Load immediate value into X register
	WDM #$00			 ; 42 00 | Reserved instruction
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $FF22,X		  ; 7E 22 FF | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1200			; 0D 00 12 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $4000,X		  ; 1E 00 40 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	BIT $7A			  ; 24 7A | Test bits in accumulator (zero page)
	BIT $7B			  ; 24 7B | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $38			  ; 10 38 | Branch if positive
	BPL $38			  ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0BF
; Address: $F6A8FA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0BF:
	JSR $105C			; 20 5C 10 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BPL $28			  ; 10 28 | Branch if positive
	BPL $78			  ; 10 78 | Branch if positive
	BPL $78			  ; 10 78 | Branch if positive
	BPL $78			  ; 10 78 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0C0
; Address: $F6A906
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0C0:
	BPL $F8			  ; 10 F8 | Branch if positive
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	BPL $38			  ; 10 38 | Branch if positive
	BPL $68			  ; 10 68 | Branch if positive
	BPL $68			  ; 10 68 | Branch if positive
	BPL $68			  ; 10 68 | Branch if positive
	BPL $E8			  ; 10 E8 | Branch if positive
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag
	BPL $28			  ; 10 28 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0C1
; Address: $F6A920
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0C1:
	JSR $4D9D			; 20 9D 4D | Jump to subroutine
	PHB				  ; 8B | Push data bank register to stack
	ADC $0000,X		  ; 7D 00 00 | Add with carry (absolute,X)
	SBC $F609,X		  ; FD 09 F6 | Subtract with carry (absolute,X)
	ADC $0000,X		  ; 7D 00 00 | Add with carry (absolute,X)
	BEQ $3C			  ; F0 3C | Branch if equal
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $CC			  ; 30 CC | Branch if negative
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BMI $3F			  ; 30 3F | Branch if negative
	BVS $35			  ; 70 35 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0C3
; Address: $F6A9EC
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0C3:
	BMI $D8			  ; 30 D8 | Branch if negative
	CPY $FE			  ; C4 FE | Compare Y register (zero page)
	BRA $40			  ; 80 40 | Branch always
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	PLP				  ; 28 | Pull processor status from stack
	BPL $13			  ; 10 13 | Branch if positive
	BPL $11			  ; 10 11 | Branch if positive
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	LSR $EFE1,X		  ; 5E E1 EF | Logical shift right (absolute,X)
	STA				  ; 9F 73 F6 BE | Store accumulator to absolute long,X
	LDX $EDE7			; AE E7 ED | Load from absolute address into X register
	LDA $D8D8,X		  ; BD D8 D8 | Load from absolute,X into accumulator
	BRA $0F			  ; 80 0F | Branch always
	BMI $61			  ; 30 61 | Branch if negative
	STZ $609B,X		  ; 9E 9B 60 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0C5
; Address: $F6AAA9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0C5:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $2718,Y		  ; 19 18 27 | Logical OR with accumulator (absolute,Y)
	BRA $FF			  ; 80 FF | Branch always
	STA ($E1,X)		  ; 81 E1 | Store accumulator to (zero page,X)
	CPX #$E2			 ; E0 E2 | Compare X register (immediate)
	CPY $CAE5			; CC E5 CA | Compare Y register (absolute)
	CPY #$B1			 ; C0 B1 | Compare Y register (immediate)
	ORA ($BE,X)		  ; 01 BE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0C6
; Address: $F6AAEE
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0C6:
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $0300,X		  ; 1E 00 03 | Arithmetic shift left (absolute,X)
	STA $0E1C			; 8D 1C 0E | Store accumulator to absolute address
	ASL $3F00,X		  ; 1E 00 3F | Arithmetic shift left (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $7F			  ; 05 7F | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $99			  ; 66 99 | Rotate right (zero page)
	SBC $FF80,X		  ; FD 80 FF | Subtract with carry (absolute,X)
	LDA ($C1),Y		  ; B1 C1 | Load from (zero page),Y into accumulator
	CPX $C2D0			; EC D0 C2 | Compare X register (absolute)
	LDY $ABC4			; AC C4 AB | Load from absolute address into Y register
	ORA $00FE,Y		  ; 19 FE 00 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	BPL $0D			  ; 10 0D | Branch if positive
	ASL $013F			; 0E 3F 01 | Arithmetic shift left (absolute)
	INC $05FA,X		  ; FE FA 05 | Increment (absolute,X)
	BIT $F7			  ; 24 F7 | Test bits in accumulator (zero page)
	ROL $13EA			; 2E EA 13 | Rotate left (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BRA $51			  ; 80 51 | Branch always
	BRA $04			  ; 80 04 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0C7
; Address: $F6AB77
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0C7:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BEQ $FF			  ; F0 FF | Branch if equal
	REP #$07			 ; C2 07 | Reset processor status bits
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROR $0701,X		  ; 7E 01 07 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0C8
; Address: $F6ABA0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0C8:
	JSL $AE242C		  ; 22 2C 24 AE | Jump to subroutine long
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	ROL $0EFF			; 2E FF 0E | Rotate left (absolute)
	STZ $0CFF,X		  ; 9E FF 0C | Store zero to absolute,X
	ORA ($80),Y		  ; 11 80 | Logical OR with accumulator ((zero page),Y)
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0CA
; Address: $F6ABBF
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0CA:
	BVC $78			  ; 50 78 | Branch if overflow clear
	BRA $86			  ; 80 86 | Branch always
	BVS $60			  ; 70 60 | Branch if overflow set
	ASL $C318			; 0E 18 C3 | Arithmetic shift left (absolute)
	SEP #$92			 ; E2 92 | Set processor status bits
	SBC #$8D			 ; E9 8D | Subtract with carry (immediate)
	BNE $46			  ; D0 46 | Branch if not equal
	SBC #$7F			 ; E9 7F | Subtract with carry (immediate)
	STA $00F100		  ; 8F 00 F1 00 | Store accumulator to absolute long address
	BCC $23			  ; 90 23 | Branch if carry clear
	STY $4611			; 8C 11 46 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0CC
; Address: $F6ABE4
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0CC:
	JSR $A060			; 20 60 A0 | Jump to subroutine
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	JMP ($3682)		  ; 6C 82 36 | Jump to address (absolute indirect)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $0D02			; 0D 02 0D | Logical OR with accumulator (absolute)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $1C			  ; 80 1C | Branch always
	ROL $DF			  ; 26 DF | Rotate left (zero page)
	BIT $2CDF			; 2C DF 2C | Test bits in accumulator (absolute)
	CMP $DB28,X		  ; DD 28 DB | Compare accumulator (absolute,X)
	ORA ($6B),Y		  ; 11 6B | Logical OR with accumulator ((zero page),Y)
	JMP $5E700F		  ; 5C 0F 70 5E | Jump to address long
	LDA ($5C,X)		  ; A1 5C | Load from (zero page,X) into accumulator
	JMP $A758A3		  ; 5C A3 58 A7 | Jump to address long
	SEI				  ; 78 | Set interrupt disable flag
	AND #$56			 ; 29 56 | Logical AND with accumulator (immediate)
	BMI $CF			  ; 30 CF | Branch if negative
	CMP $9EE6			; CD E6 9E | Compare accumulator (absolute)
	CPX $CC9C			; EC 9C CC | Compare X register (absolute)
	LDY $B1C1,X		  ; BC C1 B1 | Load from absolute,X into Y register
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0CD
; Address: $F6AC72
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0CD:
	EOR $9EB2			; 4D B2 9E | Exclusive OR with accumulator (absolute)
	ADC ($9C,X)		  ; 61 9C | Add with carry ((zero page,X))
	LDY $B043,X		  ; BC 43 B0 | Load from absolute,X into Y register
	LSR $14EA			; 4E EA 14 | Logical shift right (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STY $01			  ; 84 01 | Store Y register to zero page
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $0D02			; 0D 02 0D | Logical OR with accumulator (absolute)
	ORA $0D02			; 0D 02 0D | Logical OR with accumulator (absolute)
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	CPY $3F			  ; C4 3F | Compare Y register (zero page)
	STA $617E,Y		  ; 99 7E 61 | Store accumulator to absolute,Y
	CMP ($CE,X)		  ; C1 CE | Compare accumulator ((zero page,X))
	STA ($8E,X)		  ; 81 8E | Store accumulator to (zero page,X)
	STA ($8E,X)		  ; 81 8E | Store accumulator to (zero page,X)
	DEY				  ; 88 | Decrement Y register
	STA $3DCD48		  ; 8F 48 CD 3D | Store accumulator to absolute long address
	REP #$7A			 ; C2 7A | Reset processor status bits
	STA $E2			  ; 85 E2 | Store accumulator to zero page
	ORA $3DC2,X		  ; 1D C2 3D | Logical OR with accumulator (absolute,X)
	EOR $5D82,X		  ; 5D 82 5D | Exclusive OR with accumulator (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	NOP				  ; EA | No operation
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STZ $B87D			; 9C 7D B8 | Store zero to absolute
	SEI				  ; 78 | Set interrupt disable flag
	BCS $78			  ; B0 78 | Branch if carry set
	LDA ($79,X)		  ; A1 79 | Load from (zero page,X) into accumulator
	PLB				  ; AB | Pull data bank register from stack
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	CMP $7D			  ; C5 7D | Compare accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $8F			  ; 70 8F | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	ROR				  ; 6A | Rotate right (accumulator)
	BVS $8C			  ; 70 8C | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0CE
; Address: $F6ACFD
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0CE:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	SBC $F99D,Y		  ; F9 9D F9 | Subtract with carry (absolute,Y)
	STA $9DF3,X		  ; 9D F3 9D | Store accumulator to absolute,X
	SBC ($32),Y		  ; F1 32 | Subtract with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND ($40),Y		  ; 31 40 | Logical AND with accumulator ((zero page),Y)
	AND ($40),Y		  ; 31 40 | Logical AND with accumulator ((zero page),Y)
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0CF
; Address: $F6AD1B
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0CF:
	BCC $E0			  ; 90 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $43			  ; 10 43 | Branch if positive
	CPX $F661			; EC 61 F6 | Compare X register (absolute)
	BCS $FB			  ; B0 FB | Branch if carry set
	BCS $F9			  ; B0 F9 | Branch if carry set
	CLD				  ; D8 | Clear decimal mode flag
	LSR				  ; 4A | Logical shift right (accumulator)
	AND ($05,X)		  ; 21 05 | Logical AND with accumulator ((zero page,X))
	BMI $26			  ; 30 26 | Branch if negative
	BPL $93			  ; 10 93 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $4702			; CC 02 47 | Compare Y register (absolute)
	BRA $41			  ; 80 41 | Branch always
	BRA $4F			  ; 80 4F | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA $45E700		  ; AF 00 E7 45 | Load from absolute long address into accumulator
	AND $98FF,Y		  ; 39 FF 98 | Logical AND with accumulator (absolute,Y)
	BRA $BE			  ; 80 BE | Branch always
	RTI				  ; 40 | Return from interrupt
	INC $3200,X		  ; FE 00 32 | Increment (absolute,X)
	EOR $90			  ; 45 90 | Exclusive OR with accumulator (zero page)
	AND $1800,Y		  ; 39 00 18 | Logical AND with accumulator (absolute,Y)
	BRA $83			  ; 80 83 | Branch always
	EOR ($C3,X)		  ; 41 C3 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CMP ($60,X)		  ; C1 60 | Compare accumulator ((zero page,X))
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0D0
; Address: $F6AD8B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0D0:
	BEQ $50			  ; F0 50 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BPL $78			  ; 10 78 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0D1
; Address: $F6AD9B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0D1:
	BCC $70			  ; 90 70 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	BMI $48			  ; 30 48 | Branch if negative

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0D4
; Address: $F6ADB9
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0D4:
	JSR $5020			; 20 20 50 | Jump to subroutine
	BMI $49			  ; 30 49 | Branch if negative
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)
	ADC $7D24,X		  ; 7D 24 7D | Add with carry (absolute,X)
	ORA $1D04,X		  ; 1D 04 1D | Logical OR with accumulator (absolute,X)
	ADC $5B28,X		  ; 7D 28 5B | Add with carry (absolute,X)
	EOR #$BA			 ; 49 BA | Exclusive OR with accumulator (immediate)
	STA $3C7E,Y		  ; 99 7E 3C | Store accumulator to absolute,Y
	ORA $3866,Y		  ; 19 66 38 | Logical OR with accumulator (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	STA $1A			  ; 85 1A | Store accumulator to zero page
	PLX				  ; FA | Pull X register from stack
	LDA $73977B		  ; AF 7B 97 73 | Load from absolute long address into accumulator
	ROR $E2			  ; 66 E2 | Rotate right (zero page)
	ADC $2A84,Y		  ; 79 84 2A | Add with carry (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	LDA ($48),Y		  ; B1 48 | Load from (zero page),Y into accumulator
	PLY				  ; 7A | Pull Y register from stack
	BRA $50			  ; 80 50 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	SBC ($10,X)		  ; E1 10 | Subtract with carry ((zero page,X))
	SEP #$10			 ; E2 10 | Set processor status bits
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP $ACCD			; 4C CD AC | Jump to address
	ROR $F614			; 6E 14 F6 | Rotate right (absolute)
	BNE $B7			  ; D0 B7 | Branch if not equal
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	BPL $33			  ; 10 33 | Branch if positive
	ORA $CD3A,Y		  ; 19 3A CD | Logical OR with accumulator (absolute,Y)
	JMP ($F493)		  ; 6C 93 F4 | Jump to address (absolute indirect)
	BCS $4F			  ; B0 4F | Branch if carry set

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0D5
; Address: $F6AE38
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0D5:
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	AND ($4E),Y		  ; 31 4E | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0D6
; Address: $F6AE40
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0D6:
	JSL $FB0BFA		  ; 22 FA 0B FB | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	PHB				  ; 8B | Push data bank register to stack
	ADC ($E9),Y		  ; 71 E9 | Add with carry ((zero page),Y)
	NOP				  ; EA | No operation
	BEQ $0C			  ; F0 0C | Branch if equal
	SBC #$14			 ; E9 14 | Subtract with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC ($88),Y		  ; 71 88 | Add with carry ((zero page),Y)
	BCC $70			  ; 90 70 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	SBC ($03,X)		  ; E1 03 | Subtract with carry ((zero page,X))
	SBC ($41,X)		  ; E1 41 | Subtract with carry ((zero page,X))
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	DEC $E19E,X		  ; DE 9E E1 | Decrement (absolute,X)
	BPL $EE			  ; 10 EE | Branch if positive
	BVS $C8			  ; 70 C8 | Branch if overflow set
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $5E			  ; 80 5E | Branch always
	BRA $7F			  ; 80 7F | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	LDA				  ; BF FF BF FF | Load from absolute long,X into accumulator
	DEC $E7FB			; CE FB E7 | Decrement (absolute)
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0D7
; Address: $F6AEAB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0D7:
	JSL $2C1D7E		  ; 22 7E 1D 2C | Jump to subroutine long
	ASL $4027,X		  ; 1E 27 40 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BPL $20			  ; 10 20 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	SBC $FF			  ; E5 FF | Subtract with carry (zero page)
	PEA #$0CFE		   ; F4 FE 0C | Push effective address to stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0D8
; Address: $F6AEC5
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0D8:
	CMP #$E5			 ; C9 E5 | Compare accumulator (immediate)
	ADC ($6E,X)		  ; 61 6E | Add with carry ((zero page,X))
	ORA ($04),Y		  ; 11 04 | Logical OR with accumulator ((zero page),Y)
	STA				  ; 9F CB FF 00 | Store accumulator to absolute long,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ADC #$E1			 ; 69 E1 | Add with carry (immediate)
	BMI $E0			  ; 30 E0 | Game work RAM access
	BRA $20			  ; 80 20 | Branch always
	JMP $DF0C			; 4C 0C DF | Jump to address
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	BPL $1F			  ; 10 1F | Branch if positive
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	BRA $1C			  ; 80 1C | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	ASL $BFE1,X		  ; 1E E1 BF | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LSR $0E			  ; 46 0E | Logical shift right (zero page)
	STA $4830,Y		  ; 99 30 48 | Store accumulator to absolute,Y
	BVS $88			  ; 70 88 | Branch if overflow set
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $88			  ; E6 88 | Increment (zero page)
	ORA ($0D),Y		  ; 11 0D | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	LDX #$E5			 ; A2 E5 | Load immediate value into X register
	ADC $63			  ; 65 63 | Add with carry (zero page)
	INC $F8FD,X		  ; FE FD F8 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0DA
; Address: $F6AF50
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0DA:
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	STZ $F806			; 9C 06 F8 | Store zero to absolute
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0DB
; Address: $F6AF61
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0DB:
	CMP ($E2,X)		  ; C1 E2 | Compare accumulator ((zero page,X))
	CPY #$D3			 ; C0 D3 | Compare Y register (immediate)
	ORA ($EA,X)		  ; 01 EA | Logical OR with accumulator ((zero page,X))
	CPX #$6B			 ; E0 6B | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0DE
; Address: $F6AF74
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0DE:
	JSR $D100			; 20 00 D1 | Jump to subroutine
	BVC $80			  ; 50 80 | Branch if overflow clear
	AND ($40,X)		  ; 21 40 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0DF
; Address: $F6AF7C
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0DF:
	JSR $0040			; 20 40 00 | Jump to subroutine
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$3A			 ; 09 3A | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ADC $FB35,X		  ; 7D 35 FB | Add with carry (absolute,X)
	AND $D6DC			; 2D DC D6 | Logical AND with accumulator (absolute)
	BMI $18			  ; 30 18 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BVS $8F			  ; 70 8F | Branch if overflow set
	ADC $F386,Y		  ; 79 86 F3 | Add with carry (absolute,Y)
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	INC				  ; 1A | Increment accumulator
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$62			 ; E0 62 | Compare X register (immediate)
	CPX #$43			 ; E0 43 | Compare X register (immediate)
	CMP ($B2,X)		  ; C1 B2 | Compare accumulator ((zero page,X))
	BRA $C9			  ; 80 C9 | Branch always
	PEA #$7A70		   ; F4 70 7A | Push effective address to stack
	SEC				  ; 38 | Set carry flag
	AND $0E0C,X		  ; 3D 0C 0E | Logical AND with accumulator (absolute,X)
	SBC ($10,X)		  ; E1 10 | Subtract with carry ((zero page,X))
	BRA $20			  ; 80 20 | Branch always
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	LDY $F802,X		  ; BC 02 F8 | Load from absolute,X into Y register
	STX $F3			  ; 86 F3 | Store X register to zero page
	PHA				  ; 48 | Push accumulator to stack
	BCC $DF			  ; 90 DF | Branch if carry clear
	BNE $28			  ; D0 28 | Branch if not equal
	TAY				  ; A8 | Transfer accumulator to Y register
	CPX $18			  ; E4 18 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0E0
; Address: $F6B016
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0E0:
	NOP				  ; EA | No operation
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	CPY $0B			  ; C4 0B | Compare Y register (zero page)
	PLB				  ; AB | Pull data bank register from stack
	PHP				  ; 08 | Push processor status to stack
	AND $5E			  ; 25 5E | Logical AND with accumulator (zero page)
	ADC #$DE			 ; 69 DE | Add with carry (immediate)
	INC				  ; 1A | Increment accumulator
	SBC $FD16,X		  ; FD 16 FD | Subtract with carry (absolute,X)
	SBC $2916,X		  ; FD 16 29 | Subtract with carry (absolute,X)
	ROL $1C51			; 2E 51 1C | Rotate left (absolute)
	PHY				  ; 5A | Push Y register to stack
	LDA $78			  ; A5 78 | Load from zero page into accumulator
	ADC $F586,Y		  ; 79 86 F5 | Add with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BNE $3F			  ; D0 3F | Branch if not equal
	ORA ($F7),Y		  ; 11 F7 | Logical OR with accumulator ((zero page),Y)
	WDM #$F7			 ; 42 F7 | Reserved instruction
	REP #$EB			 ; C2 EB | Reset processor status bits
	TAY				  ; A8 | Transfer accumulator to Y register
	SBC $F807,X		  ; FD 07 F8 | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPY $30			  ; C4 30 | Compare Y register (zero page)
	CMP ($2E),Y		  ; D1 2E | Compare accumulator ((zero page),Y)
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	LDX $2A5F			; AE 5F 2A | Load from absolute address into X register
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	CMP ($80),Y		  ; D1 80 | Compare accumulator ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$28			 ; C0 28 | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $AB			  ; B0 AB | Branch if carry set
	ORA ($F2,X)		  ; 01 F2 | Logical OR with accumulator ((zero page,X))
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0E1
; Address: $F6B07B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0E1:
	STA $DD20,X		  ; 9D 20 DD | Store accumulator to absolute,X
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $27A2,X		  ; 1E A2 27 | Arithmetic shift left (absolute,X)
	DEC $D86A,X		  ; DE 6A D8 | Decrement (absolute,X)
	CPX $D498			; EC 98 D4 | Compare X register (absolute)
	BCS $51			  ; B0 51 | Branch if carry set
	JMP ($6FA7)		  ; 6C A7 6F | Jump to address (absolute indirect)
	STZ $DC60			; 9C 60 DC | Store zero to absolute

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0E2
; Address: $F6B095
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0E2:
	JSR $6090			; 20 90 60 | Jump to subroutine
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	AND ($C6,X)		  ; 21 C6 | Logical AND with accumulator ((zero page,X))
	CPY #$07			 ; C0 07 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0E4
; Address: $F6B0A3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0E4:
	JSR $7020			; 20 20 70 | Jump to subroutine
	BVS $20			  ; 70 20 | Branch if overflow set
	BEQ $60			  ; F0 60 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0E6
; Address: $F6B0B6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0E6:
	JSR $6050			; 20 50 60 | Jump to subroutine
	BCC $E0			  ; 90 E0 | Game work RAM access
	BPL $C0			  ; 10 C0 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0E7
; Address: $F6B0BD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0E7:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	BPL $18			  ; 10 18 | Branch if positive
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0E9
; Address: $F6B100
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0E9:
	BRA $FF			  ; 80 FF | Branch always
	LDA ($C3),Y		  ; B1 C3 | Load from (zero page),Y into accumulator
	SBC #$D1			 ; E9 D1 | Subtract with carry (immediate)
	CPY $A8			  ; C4 A8 | Compare Y register (zero page)
	DEC $A8			  ; C6 A8 | Decrement (zero page)
	BRA $73			  ; 80 73 | Branch always
	ROL				  ; 2A | Rotate left (accumulator)
	SEC				  ; 38 | Set carry flag
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	ORA $003C			; 0D 3C 00 | Logical OR with accumulator (absolute)
	LDY $07			  ; A4 07 | Load from zero page into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	STA $E4C1,Y		  ; 99 C1 E4 | Store accumulator to absolute,Y
	BNE $C2			  ; D0 C2 | Branch if not equal
	LDY $ABC4			; AC C4 AB | Load from absolute address into Y register
	LDA ($FE,X)		  ; A1 FE | Load from (zero page,X) into accumulator
	CLC				  ; 18 | Clear carry flag
	ROL $00			  ; 26 00 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA $0E3C			; 0D 3C 0E | Logical OR with accumulator (absolute)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEP #$1D			 ; E2 1D | Set processor status bits
	DEX				  ; CA | Decrement X register
	EOR ($5F),Y		  ; 51 5F | Exclusive OR with accumulator ((zero page),Y)
	ROL $2C2C,X		  ; 3E 2C 2C | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0EA
; Address: $F6B16A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0EA:
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $1715,X		  ; 1E 15 17 | Arithmetic shift left (absolute,X)
	CPY $39			  ; C4 39 | Compare Y register (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($F7,X)		  ; E1 F7 | Subtract with carry ((zero page,X))
	CMP ($EF,X)		  ; C1 EF | Compare accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0EB
; Address: $F6B18A
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0EB:
	JSL $9F067F		  ; 22 7F 06 9F | Jump to subroutine long
	INC $08F7,X		  ; FE F7 08 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BVS $2E			  ; 70 2E | Branch if overflow set
	CMP ($1E),Y		  ; D1 1E | Compare accumulator ((zero page),Y)
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	STA ($DB,X)		  ; 81 DB | Store accumulator to (zero page,X)
	PHP				  ; 08 | Push processor status to stack
	LDA $BE27,Y		  ; B9 27 BE | Load from absolute,Y into accumulator
	LDX $1E1A,Y		  ; BE 1A 1E | Load from absolute,Y into X register
	ASL $7C83,X		  ; 1E 83 7C | Arithmetic shift left (absolute,X)
	EOR ($AA),Y		  ; 51 AA | Exclusive OR with accumulator ((zero page),Y)
	ORA ($F6,X)		  ; 01 F6 | Logical OR with accumulator ((zero page,X))
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	BCC $68			  ; 90 68 | Branch if carry clear
	BPL $A0			  ; 10 A0 | Branch if positive
	BPL $28			  ; 10 28 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	LDY $DE			  ; A4 DE | Load from zero page into Y register
	BNE $EF			  ; D0 EF | Branch if not equal
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	AND #$7F			 ; 29 7F | Logical AND with accumulator (immediate)
	ORA $021D			; 0D 1D 02 | Logical OR with accumulator (absolute)
	ORA $A8			  ; 05 A8 | Logical OR with accumulator (zero page)
	BCS $4E			  ; B0 4E | Branch if carry set
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	LDA				  ; BF 40 2F D0 | Load from absolute long,X into accumulator
	ORA $0032			; 0D 32 00 | Logical OR with accumulator (absolute)
	ORA $FF15			; 0D 15 FF | Logical OR with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	SBC $38			  ; E5 38 | Subtract with carry (zero page)
	BEQ $20			  ; F0 20 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0EC
; Address: $F6B1EF
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0EC:
	BRA $65			  ; 80 65 | Branch always
	TXA				  ; 8A | Transfer X register to accumulator
	BVC $87			  ; 50 87 | Branch if overflow clear
	CPX #$05			 ; E0 05 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	AND ($5F,X)		  ; 21 5F | Logical AND with accumulator ((zero page,X))
	BIT $50DC			; 2C DC 50 | Test bits in accumulator (absolute)
	CLV				  ; B8 | Clear overflow flag
	PHA				  ; 48 | Push accumulator to stack
	CLV				  ; B8 | Clear overflow flag
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	BPL $F8			  ; 10 F8 | Branch if positive
	JMP $1B502F		  ; 5C 2F 50 1B | Jump to address long
	STZ $5C			  ; 64 5C | Store zero to zero page
	SEC				  ; 38 | Set carry flag
	CPY $28			  ; C4 28 | Compare Y register (zero page)
	BMI $C8			  ; 30 C8 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	STY $60			  ; 84 60 | Store Y register to zero page
	STA				  ; 9F 07 F8 CC | Store accumulator to absolute long,X
	CMP $13E7,Y		  ; D9 E7 13 | Compare accumulator (absolute,Y)
	ROL $5F			  ; 26 5F | Rotate left (zero page)
	BIT $5E			  ; 24 5E | Test bits in accumulator (zero page)
	JMP ($17E8)		  ; 6C E8 17 | Jump to address (absolute indirect)
	BIT $38C7			; 2C C7 38 | Test bits in accumulator (absolute)
	BNE $0E			  ; D0 0E | Branch if not equal
	ADC ($1E),Y		  ; 71 1E | Add with carry ((zero page),Y)
	ADC ($1E,X)		  ; 61 1E | Add with carry ((zero page,X))
	ADC ($F1,X)		  ; 61 F1 | Add with carry ((zero page,X))
	ASL $FC0A			; 0E 0A FC | Arithmetic shift left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BCC $F1			  ; 90 F1 | Branch if carry clear
	STY $7B2B			; 8C 2B 7B | Store Y register to absolute address
	DEC $0AC2			; CE C2 0A | Decrement (absolute)
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	ORA $B1			  ; 05 B1 | Logical OR with accumulator (zero page)
	LSR $7F80			; 4E 80 7F | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0ED
; Address: $F6B27A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0ED:
	JSL $8048D4		  ; 22 D4 48 80 | Jump to subroutine long
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0EE
; Address: $F6B291
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0EE:
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	SBC $CE32,X		  ; FD 32 CE | Subtract with carry (absolute,X)
	DEC $3E			  ; C6 3E | Decrement (zero page)
	BIT #$7D			 ; 89 7D | Test bits in accumulator (immediate)
	LDX $F2			  ; A6 F2 | Load from zero page into X register
	PLA				  ; 68 | Pull accumulator from stack
	PHX				  ; DA | Push X register to stack
	AND $BD			  ; 25 BD | Logical AND with accumulator (zero page)
	WDM #$4E			 ; 42 4E | Reserved instruction
	LDA ($3E),Y		  ; B1 3E | Load from (zero page),Y into accumulator
	CMP ($7C,X)		  ; C1 7C | Compare accumulator ((zero page,X))
	BEQ $08			  ; F0 08 | Branch if equal
	LDA ($48),Y		  ; B1 48 | Load from (zero page),Y into accumulator
	ORA #$1E			 ; 09 1E | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0F0
; Address: $F6B2DB
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0F0:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	ASL $1E1A,X		  ; 1E 1A 1E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	SEC				  ; 38 | Set carry flag
	BVS $E8			  ; 70 E8 | Branch if overflow set
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0F2
; Address: $F6B316
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0F2:
	BMI $40			  ; 30 40 | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	BRA $D0			  ; 80 D0 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0F3
; Address: $F6B321
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0F3:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0F6
; Address: $F6B34A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0F6:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0F7
; Address: $F6B353
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0F7:
	JSR $1020			; 20 20 10 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BPL $20			  ; 10 20 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	BMI $78			  ; 30 78 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	SEI				  ; 78 | Set interrupt disable flag
	BPL $30			  ; 10 30 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	BVS $88			  ; 70 88 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $28			  ; 10 28 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BIT $0C			  ; 24 0C | Test bits in accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $6E12			; 4E 12 6E | Logical shift right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ROL $1751			; 2E 51 17 | Rotate left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	AND #$0B			 ; 29 0B | Logical AND with accumulator (immediate)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $D7			  ; 06 D7 | Arithmetic shift left (zero page)
	LDX $82			  ; A6 82 | Load from zero page into X register
	ROR $42			  ; 66 42 | Hardware register operation
	EOR ($92,X)		  ; 41 92 | Exclusive OR with accumulator ((zero page,X))
	BRA $E3			  ; 80 E3 | Branch always
	STA ($52,X)		  ; 81 52 | Store accumulator to (zero page,X)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0F9
; Address: $F6B3B8
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0F9:
	JSR $A180			; 20 80 A1 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ORA #$77			 ; 09 77 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	LDX $6E96			; AE 96 6E | Load from absolute address into X register
	CPX $FD44			; EC 44 FD | Compare X register (absolute)
	STY $BD			  ; 84 BD | Store Y register to zero page
	AND $6817,X		  ; 3D 17 68 | Logical AND with accumulator (absolute,X)
	ASL $79			  ; 06 79 | Arithmetic shift left (zero page)
	ASL $4CF1			; 0E F1 4C | Arithmetic shift left (absolute)
	LDA ($CA),Y		  ; B1 CA | Load from (zero page),Y into accumulator
	AND ($DC),Y		  ; 31 DC | Logical AND with accumulator ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	ADC ($1A,X)		  ; 61 1A | Add with carry ((zero page,X))
	LDA ($0F,X)		  ; A1 0F | Load from (zero page,X) into accumulator
	PHB				  ; 8B | Push data bank register to stack
	ASL $5772,X		  ; 1E 72 57 | Arithmetic shift left (absolute,X)
	REP #$A3			 ; C2 A3 | Reset processor status bits
	STA ($C3,X)		  ; 81 C3 | Store accumulator to (zero page,X)
	STA ($A2,X)		  ; 81 A2 | Store accumulator to (zero page,X)
	BRA $A3			  ; 80 A3 | Branch always
	STA ($82,X)		  ; 81 82 | Store accumulator to (zero page,X)
	BVS $01			  ; 70 01 | Branch if overflow set
	CPX #$22			 ; E0 22 | Compare X register (immediate)
	BRA $21			  ; 80 21 | PPU graphics register access
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $3C00,X		  ; 1E 00 3C | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $1C11			; 0E 11 1C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0FA
; Address: $F6B45B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0FA:
	JSL $D0C438		  ; 22 38 C4 D0 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0FB
; Address: $F6B479
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0FB:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $1E07			; 0E 07 1E | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $14			  ; 10 14 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0FC
; Address: $F6B4BC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0FC:
	BVS $80			  ; 70 80 | Branch if overflow set
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0FD
; Address: $F6B4C9
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0FD:
	BMI $0A			  ; 30 0A | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $FC0C			; 2E 0C FC | Rotate left (absolute)
	BMI $F0			  ; 30 F0 | Branch if negative
	ASL $3C31			; 0E 31 3C | Arithmetic shift left (absolute)
	REP #$F0			 ; C2 F0 | Reset processor status bits
	BEQ $00			  ; F0 00 | Branch if equal
	ORA $0C04			; 0D 04 0C | Logical OR with accumulator (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0A),Y		  ; 11 0A | Logical OR with accumulator ((zero page),Y)
	ORA ($04),Y		  ; 11 04 | Logical OR with accumulator ((zero page),Y)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	BRA $A3			  ; 80 A3 | Branch always
	STA ($A2,X)		  ; 81 A2 | Store accumulator to (zero page,X)
	BRA $D1			  ; 80 D1 | Branch always
	CPY #$68			 ; C0 68 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0FE
; Address: $F6B54A
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0FE:
	BVC $00			  ; 50 00 | Branch if overflow clear
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $80			  ; 50 80 | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	STA ($FE),Y		  ; 91 FE | Store accumulator to (zero page),Y
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	ORA $E4E7,Y		  ; 19 E7 E4 | Logical OR with accumulator (absolute,Y)
	BMI $F0			  ; 30 F0 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	STZ $F961,X		  ; 9E 61 F9 | Store zero to absolute,X
	ASL $E7			  ; 06 E7 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	BEQ $0C			  ; F0 0C | Branch if equal
	BRA $70			  ; 80 70 | Branch always
	BRA $40			  ; 80 40 | Branch always
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ASL $0F00			; 0E 00 0F | Arithmetic shift left (absolute)
	ORA $1E04,X		  ; 1D 04 1E | Logical OR with accumulator (absolute,X)
	BPL $3E			  ; 10 3E | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ROL $18			  ; 26 18 | Rotate left (zero page)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $340E			; 0E 0E 34 | Arithmetic shift left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $6818,X		  ; 1E 18 68 | Arithmetic shift left (absolute,X)
	ADC ($B2,X)		  ; 61 B2 | Add with carry ((zero page,X))
	STX $86			  ; 86 86 | Store X register to zero page
	ROL $FC0C,X		  ; 3E 0C FC | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_0FF
; Address: $F6B5F2
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_0FF:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $7900,X		  ; 1E 00 79 | Arithmetic shift left (absolute,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $DEC7,Y		  ; 39 C7 DE | Logical AND with accumulator (absolute,Y)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	AND $C0			  ; 25 C0 | Logical AND with accumulator (zero page)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	CLD				  ; D8 | Clear decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	LDY #$DC			 ; A0 DC | Load immediate value into Y register
	LDY $DE			  ; A4 DE | Load from zero page into Y register
	BVC $6E			  ; 50 6E | Branch if overflow clear
	EOR ($6F),Y		  ; 51 6F | Exclusive OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_100
; Address: $F6B671
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_100:
	JSR $24D8			; 20 D8 24 | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	BIT $DC			  ; 24 DC | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_101
; Address: $F6B677
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_101:
	JSL $6E126C		  ; 22 6C 12 6E | Jump to subroutine long
	ORA ($6F),Y		  ; 11 6F | Logical OR with accumulator ((zero page),Y)
	BPL $17			  ; 10 17 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_102
; Address: $F6B6A0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_102:
	PLP				  ; 28 | Pull processor status from stack
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	BMI $4C			  ; 30 4C | Branch if negative
	BMI $4C			  ; 30 4C | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $88			  ; 70 88 | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_103
; Address: $F6B6C4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_103:
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ROL $06			  ; 26 06 | Rotate left (zero page)
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $3100,Y		  ; 19 00 31 | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_104
; Address: $F6B6E2
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_104:
	JSR $213F			; 20 3F 21 | PPU graphics register access
	SEC				  ; 38 | Set carry flag
	SBC $FD78,X		  ; FD 78 FD | Subtract with carry (absolute,X)
	SBC $F9FC,Y		  ; F9 FC F9 | Subtract with carry (absolute,Y)
	BEQ $E9			  ; F0 E9 | Branch if equal
	BEQ $C9			  ; F0 C9 | Branch if equal
	BEQ $D3			  ; F0 D3 | Branch if equal
	CPX #$D3			 ; E0 D3 | Compare X register (immediate)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$4C			 ; 09 4C | Logical OR with accumulator (immediate)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $27FF,X		  ; FE FF 27 | Increment (absolute,X)
	SBC $4EF8,Y		  ; F9 F8 4E | Subtract with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CMP $0600,Y		  ; D9 00 06 | Compare accumulator (absolute,Y)
	BCS $00			  ; B0 00 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C1			 ; E0 C1 | Compare X register (immediate)
	SBC ($41),Y		  ; F1 41 | Subtract with carry ((zero page),Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_105
; Address: $F6B77F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_105:
	BCC $00			  ; 90 00 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	BPL $24			  ; 10 24 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP $92BA95		  ; 5C 95 BA 92 | Jump to address long

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_106
; Address: $F6B78B
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_106:
	LDA $FC30,Y		  ; B9 30 FC | Load from absolute,Y into accumulator
	BMI $FE			  ; 30 FE | Branch if negative
	CLC				  ; 18 | Clear carry flag
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BMI $60			  ; 30 60 | Branch if negative
	ASL $C110			; 0E 10 C1 | Arithmetic shift left (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ROL $8F00,X		  ; 3E 00 8F | Rotate left (absolute,X)
	ORA $1F01			; 0D 01 1F | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $70			  ; 10 70 | Branch if positive
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $1F10			; 0E 10 1F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_107
; Address: $F6B7D5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_107:
	JSR $201E			; 20 1E 20 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	BMI $48			  ; 30 48 | Branch if negative
	BCS $48			  ; B0 48 | Branch if carry set
	BMI $B0			  ; 30 B0 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_108
; Address: $F6B841
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_108:
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BRA $7F			  ; 80 7F | Branch always
	ROL $21C1,X		  ; 3E C1 21 | PPU graphics register access
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_109
; Address: $F6B872
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_109:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDX $FD1C,Y		  ; BE 1C FD | Load from absolute,Y into X register
	SEC				  ; 38 | Set carry flag
	SBC $FCF9,X		  ; FD F9 FC | Subtract with carry (absolute,X)
	SBC ($D8),Y		  ; F1 D8 | Subtract with carry ((zero page),Y)
	SBC ($B8,X)		  ; E1 B8 | Subtract with carry ((zero page,X))
	CMP ($78,X)		  ; C1 78 | Compare accumulator ((zero page,X))
	LDA ($7A,X)		  ; A1 7A | Load from (zero page,X) into accumulator
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $0E01			; 0E 01 0E | Arithmetic shift left (absolute)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$93			 ; E0 93 | Compare X register (immediate)
	CPX #$93			 ; E0 93 | Compare X register (immediate)
	CPX #$91			 ; E0 91 | Compare X register (immediate)
	SEP #$91			 ; E2 91 | Set processor status bits
	NOP				  ; EA | No operation
	LDA ($FA,X)		  ; A1 FA | Load from (zero page,X) into accumulator
	LDY #$FB			 ; A0 FB | Load immediate value into Y register
	LDY $2C13			; AC 13 2C | Load from absolute address into Y register
	LDY $2E13			; AC 13 2E | Load from absolute address into Y register
	ORA ($26),Y		  ; 11 26 | Logical OR with accumulator ((zero page),Y)
	ORA ($16),Y		  ; 11 16 | Logical OR with accumulator ((zero page),Y)
	AND ($1F,X)		  ; 21 1F | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_10C
; Address: $F6B906
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_10C:
	JSR $217F			; 20 7F 21 | PPU graphics register access
	BMI $48			  ; 30 48 | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	BVS $88			  ; 70 88 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_10D
; Address: $F6B922
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_10D:
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	SBC $FDD8,X		  ; FD D8 FD | Subtract with carry (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	INC $FED8,X		  ; FE D8 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_10E
; Address: $F6B934
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_10E:
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA ($82),Y		  ; 11 82 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	CMP ($88),Y		  ; D1 88 | Compare accumulator ((zero page),Y)
	EOR $44			  ; 45 44 | Exclusive OR with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX #$22			 ; A2 22 | Load immediate value into X register
	ROR $B710			; 6E 10 B7 | Rotate right (absolute)
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	EOR $1022			; 4D 22 10 | Exclusive OR with accumulator (absolute)
	BEQ $90			  ; F0 90 | Branch if equal
	BVS $28			  ; 70 28 | Branch if overflow set
	BRA $1C			  ; 80 1C | Branch always
	BCC $1E			  ; 90 1E | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	STA $238744		  ; 8F 44 87 23 | Store accumulator to absolute long address
	BMI $48			  ; 30 48 | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $1C			  ; 24 1C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_10F
; Address: $F6B979
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_10F:
	JSL $87118E		  ; 22 8E 11 87 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $07			  ; 30 07 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $E3			  ; F0 E3 | Branch if equal
	BEQ $E1			  ; F0 E1 | Branch if equal
	PLX				  ; FA | Pull X register from stack
	SBC ($FA,X)		  ; E1 FA | Subtract with carry ((zero page,X))
	SBC ($FA,X)		  ; E1 FA | Subtract with carry ((zero page,X))
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	BEQ $FD			  ; F0 FD | Branch if equal
	BCS $FD			  ; B0 FD | Branch if carry set

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_110
; Address: $F6B9D5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_110:
	AND ($96,X)		  ; 21 96 | Logical AND with accumulator ((zero page,X))
	AND ($96,X)		  ; 21 96 | Logical AND with accumulator ((zero page,X))
	AND ($17,X)		  ; 21 17 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_111
; Address: $F6B9DB
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_111:
	JSR $300B			; 20 0B 30 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $1C00			; 0E 00 1C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	BMI $20			  ; 30 20 | Branch if negative
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BMI $48			  ; 30 48 | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	ORA $320F,X		  ; 1D 0F 32 | Logical OR with accumulator (absolute,X)
	ORA $0833			; 0D 33 08 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $12			  ; 10 12 | Branch if positive
	BIT $2C13			; 2C 13 2C | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	CPY $E7			  ; C4 E7 | Compare Y register (zero page)
	SBC $E4C1,Y		  ; F9 C1 E4 | Subtract with carry (absolute,Y)
	CLD				  ; D8 | Clear decimal mode flag
	DEC $38			  ; C6 38 | Decrement (zero page)
	ORA ($36,X)		  ; 01 36 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	PLX				  ; FA | Pull X register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY $0600,X		  ; BC 00 06 | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	ORA $063C			; 0D 3C 06 | Logical OR with accumulator (absolute)
	INC $6798,X		  ; FE 98 67 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ROL $3C10,X		  ; 3E 10 3C | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_113
; Address: $F6BA5F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_113:
	JSL $AFEF4F		  ; 22 4F EF AF | Jump to subroutine long
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_115
; Address: $F6BA75
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_115:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	INC $FE7F,X		  ; FE 7F FE | Increment (absolute,X)
	EOR $08			  ; 45 08 | Exclusive OR with accumulator (zero page)
	WDM #$0C			 ; 42 0C | Reserved instruction
	WDM #$04			 ; 42 04 | Reserved instruction
	ADC ($06,X)		  ; 61 06 | Add with carry ((zero page,X))
	ADC ($02,X)		  ; 61 02 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_117
; Address: $F6BAA0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_117:
	JSL $4A31D1		  ; 22 D1 31 4A | Jump to subroutine long
	ORA ($68),Y		  ; 11 68 | Logical OR with accumulator ((zero page),Y)
	ORA $0864,Y		  ; 19 64 08 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	LDA $DE18,X		  ; BD 18 DE | Load from absolute,X into accumulator
	EOR $C622,X		  ; 5D 22 C6 | Exclusive OR with accumulator (absolute,X)
	AND ($A6),Y		  ; 31 A6 | Logical AND with accumulator ((zero page),Y)
	ORA ($A2),Y		  ; 11 A2 | Logical OR with accumulator ((zero page),Y)
	ORA $0873,Y		  ; 19 73 08 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PHY				  ; 5A | Push Y register to stack
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_119
; Address: $F6BAC3
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_119:
	JSR $A010			; 20 10 A0 | Jump to subroutine
	BPL $A0			  ; 10 A0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BCC $08			  ; 90 08 | Branch if carry clear
	BPL $08			  ; 10 08 | Branch if positive
	BMI $38			  ; 30 38 | Branch if negative
	BVS $C0			  ; 70 C0 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BCC $F8			  ; 90 F8 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_11B
; Address: $F6BAE4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_11B:
	JSR $243C			; 20 3C 24 | Jump to subroutine
	ROL $1E14,X		  ; 3E 14 1E | Rotate left (absolute,X)
	ASL $1E14,X		  ; 1E 14 1E | Arithmetic shift left (absolute,X)
	ASL $08F0,X		  ; 1E F0 08 | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STY $38			  ; 84 38 | Store Y register to zero page
	WDM #$1C			 ; 42 1C | Reserved instruction

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_11D
; Address: $F6BAFD
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_11D:
	JSL $07221C		  ; 22 1C 22 07 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	CMP ($E1,X)		  ; C1 E1 | Compare accumulator ((zero page,X))
	CPX #$E2			 ; E0 E2 | Compare X register (immediate)
	CPY $CAE5			; CC E5 CA | Compare Y register (absolute)
	CPY #$B1			 ; C0 B1 | Compare Y register (immediate)
	STA ($3E,X)		  ; 81 3E | Store accumulator to (zero page,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL $0300,X		  ; 1E 00 03 | Arithmetic shift left (absolute,X)
	STA $0E1C			; 8D 1C 0E | Store accumulator to absolute address
	ASL $3F00,X		  ; 1E 00 3F | Arithmetic shift left (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	SEI				  ; 78 | Set interrupt disable flag
	BPL $3C			  ; 10 3C | Branch if positive
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	BPL $6A			  ; 10 6A | Branch if positive
	BPL $68			  ; 10 68 | Branch if positive
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	BIT $3807			; 2C 07 38 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_11E
; Address: $F6BB5C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_11E:
	JSL $5A205D		  ; 22 5D 20 5A | Jump to subroutine long
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $F7			  ; F0 F7 | Branch if equal
	AND ($B7),Y		  ; 31 B7 | Logical AND with accumulator ((zero page),Y)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	BPL $0E			  ; 10 0E | Branch if positive
	ORA ($16),Y		  ; 11 16 | Logical OR with accumulator ((zero page),Y)
	SBC #$F6			 ; E9 F6 | Subtract with carry (immediate)
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	ORA #$B7			 ; 09 B7 | Logical OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	BEQ $39			  ; F0 39 | Branch if equal
	PHB				  ; 8B | Push data bank register to stack
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_11F
; Address: $F6BB86
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_11F:
	WDM #$BC			 ; 42 BC | Reserved instruction
	LSR				  ; 4A | Logical shift right (accumulator)
	LDY $DDAC,X		  ; BC AC DD | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_120
; Address: $F6BB8C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_120:
	JSL $DA62DA		  ; 22 DA 62 DA | Jump to subroutine long
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	PEA #$659A		   ; F4 9A 65 | Push effective address to stack
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CMP $5222,X		  ; DD 22 52 | Compare accumulator (absolute,X)
	LDA $B449			; AD 49 B4 | Load from absolute address into accumulator
	BIT $7C			  ; 24 7C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_122
; Address: $F6BBA6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_122:
	JSR $3078			; 20 78 30 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	ADC $3F18,X		  ; 7D 18 3F | Add with carry (absolute,X)
	ORA $3C3F,X		  ; 1D 3F 3C | Logical OR with accumulator (absolute,X)
	WDM #$38			 ; 42 38 | Reserved instruction
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA $1D22,X		  ; 1D 22 1D | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_123
; Address: $F6BBBF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_123:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	BMI $10			  ; 30 10 | Branch if negative
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_125
; Address: $F6BBCE
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_125:
	BRA $40			  ; 80 40 | Branch always
	BMI $20			  ; 30 20 | Branch if negative
	CLD				  ; D8 | Clear decimal mode flag
	BRA $70			  ; 80 70 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	ROR $3E7D,X		  ; 7E 7D 3E | Rotate right (absolute,X)
	LSR $3E3C,X		  ; 5E 3C 3E | Logical shift right (absolute,X)
	BIT $1D1B			; 2C 1B 1D | Test bits in accumulator (absolute)
	AND ($1A,X)		  ; 21 1A | Logical AND with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROL $D9			  ; 26 D9 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	BIT $DCCB			; 2C CB DC | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_126
; Address: $F6BC09
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_126:
	JSL $931901		  ; 22 01 19 93 | Jump to subroutine long
	ORA #$DE			 ; 09 DE | Logical OR with accumulator (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_127
; Address: $F6BC14
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_127:
	BMI $00			  ; 30 00 | Branch if negative
	INC $E7			  ; E6 E7 | Increment (zero page)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STZ $0E63			; 9C 63 0E | Store zero to absolute
	SBC ($10),Y		  ; F1 10 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_128
; Address: $F6BC21
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_128:
	JSR $A110			; 20 10 A1 | Jump to subroutine
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	BEQ $3F			  ; F0 3F | Branch if equal
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $003F,X		  ; 1E 3F 00 | Arithmetic shift left (absolute,X)
	ADC $3E82,X		  ; 7D 82 3E | Add with carry (absolute,X)
	CMP ($5E,X)		  ; C1 5E | Compare accumulator ((zero page,X))
	LDA ($08,X)		  ; A1 08 | Load from (zero page,X) into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive
	BMI $F0			  ; 30 F0 | Branch if negative
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	STY $F0			  ; 84 F0 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	ORA $0906			; 0D 06 09 | Logical OR with accumulator (absolute)
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ORA $0B13			; 0D 13 0B | Logical OR with accumulator (absolute)
	ASL $3E			  ; 06 3E | Arithmetic shift left (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $1E			  ; 10 1E | Branch if positive
	AND ($18,X)		  ; 21 18 | Logical AND with accumulator ((zero page,X))
	INC $B8			  ; E6 B8 | Increment (zero page)
	CMP $36			  ; C5 36 | Compare accumulator (zero page)
	DEC $9E66			; CE 66 9E | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_129
; Address: $F6BCA8
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_129:
	PLA				  ; 68 | Pull accumulator from stack
	STZ $BC44			; 9C 44 BC | Store zero to absolute
	TSX				  ; BA | Transfer stack pointer to X register
	LDX #$5D			 ; A2 5D | Load immediate value into X register
	STA $7A			  ; 85 7A | Store accumulator to zero page
	LSR $1EB1			; 4E B1 1E | Logical shift right (absolute)
	SBC ($1C,X)		  ; E1 1C | Subtract with carry ((zero page,X))
	DEX				  ; CA | Decrement X register
	DEC				  ; 3A | Decrement accumulator
	CPY $39			  ; C4 39 | Compare Y register (zero page)
	CPY $10			  ; C4 10 | Compare Y register (zero page)
	JMP ($6C18)		  ; 6C 18 6C | Jump to address (absolute indirect)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	ASL $050C			; 0E 0C 05 | Arithmetic shift left (absolute)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($28,X)		  ; 01 28 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	BIT $1753			; 2C 53 17 | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	ROL $0D			  ; 26 0D | Rotate left (zero page)
	BPL $02			  ; 10 02 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ROL $DE			  ; 26 DE | Rotate left (zero page)
	LSR $9C3E			; 4E 3E 9C | Logical shift right (absolute)
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	LDY #$21			 ; A0 21 | PPU graphics register access
	BRA $43			  ; 80 43 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_12A
; Address: $F6BCF1
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_12A:
	JSR $502F			; 20 2F 50 | Jump to subroutine
	LSR $3EA1,X		  ; 5E A1 3E | Logical shift right (absolute,X)
	CMP ($3C,X)		  ; C1 3C | Compare accumulator ((zero page,X))
	REP #$38			 ; C2 38 | Reset processor status bits
	CMP $21			  ; C5 21 | PPU graphics register access
	PHX				  ; DA | Push X register to stack
	LDY $4F			  ; A4 4F | Load from zero page into Y register
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	ADC ($22),Y		  ; 71 22 | Add with carry ((zero page),Y)
	BEQ $63			  ; F0 63 | Branch if equal
	SBC ($E2,X)		  ; E1 E2 | Subtract with carry ((zero page,X))
	CPY #$6A			 ; C0 6A | Compare Y register (immediate)
	BCC $71			  ; 90 71 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	ADC $6A80,Y		  ; 79 80 6A | Add with carry (absolute,Y)
	BCC $70			  ; 90 70 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	SBC ($18,X)		  ; E1 18 | Subtract with carry ((zero page,X))
	CPX #$10			 ; E0 10 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_12B
; Address: $F6BD1E
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_12B:
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ASL $0C03			; 0E 03 0C | Arithmetic shift left (absolute)
	ASL $0203			; 0E 03 02 | Arithmetic shift left (absolute)
	ORA $0F03			; 0D 03 0F | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA ($B1),Y		  ; 11 B1 | Logical OR with accumulator ((zero page),Y)
	LDA				  ; BF 7F 7F 3C | Load from absolute long,X into accumulator
	AND $0100,X		  ; 3D 00 01 | Logical AND with accumulator (absolute,X)
	BRA $83			  ; 80 83 | Branch always
	LDA ($4E),Y		  ; B1 4E | Load from (zero page),Y into accumulator
	LDA				  ; BF 40 7F 80 | Load from absolute long,X into accumulator
	LDA $4681,X		  ; BD 81 46 | Load from absolute,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$24			 ; A0 24 | Load immediate value into Y register
	AND #$DE			 ; 29 DE | Logical AND with accumulator (immediate)
	LDY $B956,X		  ; BC 56 B9 | Load from absolute,X into Y register
	ADC $F936,Y		  ; 79 36 F9 | Add with carry (absolute,Y)
	BIT $EB			  ; 24 EB | Test bits in accumulator (zero page)
	EOR $5AA2,X		  ; 5D A2 5A | Exclusive OR with accumulator (absolute,X)
	LDA $38			  ; A5 38 | Load from zero page into accumulator
	LDA ($4E),Y		  ; B1 4E | Load from (zero page),Y into accumulator
	ADC ($8E),Y		  ; 71 8E | Add with carry ((zero page),Y)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	BIT $EF2C			; 2C 2C EF | Test bits in accumulator (absolute)
	BPL $F0			  ; 10 F0 | Branch if positive
	LSR				  ; 4A | Logical shift right (accumulator)
	CLD				  ; D8 | Clear decimal mode flag
	CMP $3332,Y		  ; D9 32 33 | Compare accumulator (absolute,Y)
	TSX				  ; BA | Transfer stack pointer to X register
	BPL $33			  ; 10 33 | Branch if positive
	CPY $0FF0			; CC F0 0F | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_12C
; Address: $F6BD9B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_12C:
	JSL $B3C42B		  ; 22 2B C4 B3 | Jump to subroutine long
	JMP $CFCE5F		  ; 5C 5F CE CF | Jump to address long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	DEC $3F			  ; C6 3F | Decrement (zero page)
	CPY #$39			 ; C0 39 | Compare Y register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_12D
; Address: $F6BDB1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_12D:
	LDY #$CF			 ; A0 CF | Load immediate value into Y register
	BMI $23			  ; 30 23 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_12E
; Address: $F6BDBA
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_12E:
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	PEA #$748B		   ; F4 8B 74 | Push effective address to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BPL $A8			  ; 10 A8 | Branch if positive
	STY $00F8			; 8C F8 00 | Store Y register to absolute address
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	DEY				  ; 88 | Decrement Y register
	STZ $7488			; 9C 88 74 | Store zero to absolute
	BNE $20			  ; D0 20 | Branch if not equal
	BPL $00			  ; 10 00 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $28			  ; 10 28 | Branch if positive
	BMI $C8			  ; 30 C8 | Branch if negative
	BRA $40			  ; 80 40 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SBC ($A0),Y		  ; F1 A0 | Subtract with carry ((zero page),Y)
	LSR $61E1,X		  ; 5E E1 61 | Logical shift right (absolute,X)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	CPX #$11			 ; E0 11 | Compare X register (immediate)
	CMP ($2E),Y		  ; D1 2E | Compare accumulator ((zero page),Y)
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	ASL $3E			  ; 06 3E | Arithmetic shift left (zero page)
	ADC $5D2C			; 6D 2C 5D | Add with carry (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PHX				  ; DA | Push X register to stack
	TXS				  ; 9A | Transfer X register to stack pointer
	PLY				  ; 7A | Pull Y register from stack
	SBC $E6			  ; E5 E6 | Subtract with carry (zero page)
	BRA $87			  ; 80 87 | Branch always
	ASL $2C21,X		  ; 1E 21 2C | Arithmetic shift left (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	STA $F5			  ; 85 F5 | Store accumulator to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $1B			  ; E4 1B | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_12F
; Address: $F6BE3F
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_12F:
	JMP ($BA4A)		  ; 6C 4A BA | Jump to address (absolute indirect)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL				  ; 2A | Rotate left (accumulator)
	PLX				  ; FA | Pull X register from stack
	LSR $E2			  ; 46 E2 | Logical shift right (zero page)
	ROR $E2			  ; 66 E2 | Rotate right (zero page)
	AND #$D4			 ; 29 D4 | Logical AND with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	AND $E9C4,Y		  ; 39 C4 E9 | Logical AND with accumulator (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	CMP ($30,X)		  ; C1 30 | Compare accumulator ((zero page,X))
	SBC ($10,X)		  ; E1 10 | Subtract with carry ((zero page,X))
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $A3			  ; C5 A3 | Compare accumulator (zero page)
	LSR $397E			; 4E 7E 39 | Logical shift right (absolute)
	SEC				  ; 38 | Set carry flag
	DEC $00			  ; C6 00 | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	JMP $B93846		  ; 5C 46 38 B9 | Jump to address long
	DEC $00			  ; C6 00 | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $C0			  ; 80 C0 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	CMP ($E1,X)		  ; C1 E1 | Compare accumulator ((zero page,X))
	CMP ($E1,X)		  ; C1 E1 | Compare accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_131
; Address: $F6BEF1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_131:
	JSR $41BE			; 20 BE 41 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	BRA $7B			  ; 80 7B | Branch always
	CPY #$21			 ; C0 21 | PPU graphics register access
	EOR ($22,X)		  ; 41 22 | Exclusive OR with accumulator ((zero page,X))
	ADC ($1A,X)		  ; 61 1A | Add with carry ((zero page,X))
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_132
; Address: $F6BF04
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_132:
	ADC $7B			  ; 65 7B | Add with carry (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	INC $FE8E			; EE 8E FE | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BIT $4CB3			; 2C B3 4C | Test bits in accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_133
; Address: $F6BF17
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_133:
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	DEC $BE31			; CE 31 BE | Decrement (absolute)
	EOR ($78,X)		  ; 41 78 | Exclusive OR with accumulator ((zero page,X))
	STX $B9			  ; 86 B9 | Store X register to zero page
	LDA $7575,Y		  ; B9 75 75 | Load from absolute,Y into accumulator
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	WDM #$69			 ; 42 69 | Reserved instruction
	PLB				  ; AB | Pull data bank register from stack
	AND $3242			; 2D 42 32 | Logical AND with accumulator (absolute)
	EOR ($14,X)		  ; 41 14 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_134
; Address: $F6BF3F
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_134:
	JSR $9D6D			; 20 6D 9D | Jump to subroutine
	BIT $24DC			; 2C DC 24 | Test bits in accumulator (absolute)
	CMP $EF90			; CD 90 EF | Compare accumulator (absolute)
	CPX $8C			  ; E4 8C | Compare X register (zero page)
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	STA $CC72			; 8D 72 CC | Store accumulator to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	JMP $807E			; 4C 7E 80 | Jump to address
	BNE $B4			  ; D0 B4 | Branch if not equal
	ROR $6DA7			; 6E A7 6D | Rotate right (absolute)
	LDA $D0			  ; A5 D0 | Load from zero page into accumulator
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	DEY				  ; 88 | Decrement Y register
	PHB				  ; 8B | Push data bank register to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_135
; Address: $F6BF75
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_135:
	CPY #$95			 ; C0 95 | Compare Y register (immediate)
	WDM #$20			 ; 42 20 | Reserved instruction
	STA $B0			  ; 85 B0 | Store accumulator to zero page
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $F0			  ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_137
; Address: $F6BF85
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_137:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	INC				  ; 1A | Increment accumulator
	ORA $0615			; 0D 15 06 | Logical OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	DEC $3E			  ; C6 3E | Decrement (zero page)
	BEQ $4D			  ; F0 4D | Branch if equal
	ORA ($B1,X)		  ; 01 B1 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $F806			; 9C 06 F8 | Store zero to absolute
	CMP ($FC,X)		  ; C1 FC | Compare accumulator ((zero page,X))
	ORA ($B1,X)		  ; 01 B1 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($A3,X)		  ; 01 A3 | Logical OR with accumulator ((zero page,X))
	STA ($22,X)		  ; 81 22 | Store accumulator to (zero page,X)
	REP #$80			 ; C2 80 | Reset processor status bits
	STA ($A2,X)		  ; 81 A2 | Store accumulator to (zero page,X)
	BRA $43			  ; 80 43 | Branch always
	ORA ($82,X)		  ; 01 82 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $40			  ; 80 40 | Branch always
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $7F			  ; 70 7F | Branch if overflow set
	STA				  ; 9F 1F 6E 0E | Store accumulator to absolute long,X
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F 00 6F 00 | Store accumulator to absolute long,X
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_138
; Address: $F6C024
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_138:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $08			  ; F0 08 | Branch if equal
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $1C			  ; 10 1C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	BPL $1C			  ; 10 1C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $28			  ; 10 28 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_13A
; Address: $F6C055
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_13A:
	JSR $200C			; 20 0C 20 | Jump to subroutine
	BPL $20			  ; 10 20 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ASL $071E,X		  ; 1E 1E 07 | Arithmetic shift left (absolute,X)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $0060,Y		  ; 19 60 00 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ROL $013F,X		  ; 3E 3F 01 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_13B
; Address: $F6C0A7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_13B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_13C
; Address: $F6C0EC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_13C:
	JSR $103C			; 20 3C 10 | Jump to subroutine
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_13D
; Address: $F6C0F8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_13D:
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BVS $88			  ; 70 88 | Branch if overflow set
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_13F
; Address: $F6C11F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_13F:
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_141
; Address: $F6C13D
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_141:
	JSR $10E0			; 20 E0 10 | Jump to subroutine
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $3E			  ; 06 3E | Arithmetic shift left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $1E			  ; 10 1E | Branch if positive
	AND ($3C,X)		  ; 21 3C | Logical AND with accumulator ((zero page,X))
	WDM #$78			 ; 42 78 | Reserved instruction
	STY $70			  ; 84 70 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $0E11			; 0E 11 0E | Arithmetic shift left (absolute)
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
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
	PLY				  ; 7A | Pull Y register from stack
	PEA #$F20C		   ; F4 0C F2 | Push effective address to stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	BMI $39			  ; 30 39 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	BRA $41			  ; 80 41 | Branch always
	BRA $10			  ; 80 10 | Branch always
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	INC $BF78,X		  ; FE 78 BF | Increment (absolute,X)
	ASL $73FF			; 0E FF 73 | Arithmetic shift left (absolute)
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_142
; Address: $F6C1F2
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_142:
	SED				  ; F8 | Set decimal mode flag
	ASL $3E			  ; 06 3E | Arithmetic shift left (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BEQ $47			  ; F0 47 | Branch if equal
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $90			  ; 90 90 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_143
; Address: $F6C24A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_143:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_144
; Address: $F6C256
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_144:
	JSR $8000			; 20 00 80 | Jump to subroutine
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_147
; Address: $F6C268
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_147:
	JSR $007C			; 20 7C 00 | Jump to subroutine
	BVS $40			  ; 70 40 | Branch if overflow set
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BVS $88			  ; 70 88 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $48			  ; 30 48 | Branch if negative
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $88			  ; 70 88 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_148
; Address: $F6C285
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_148:
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BPL $1E			  ; 10 1E | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BMI $20			  ; 30 20 | Branch if negative
	BVC $30			  ; 50 30 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $1C			  ; 24 1C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_149
; Address: $F6C29D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_149:
	JSL $30110E		  ; 22 0E 11 30 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	BIT $1333			; 2C 33 13 | Test bits in accumulator (absolute)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $6C			  ; A4 6C | Load from zero page into Y register
	JMP $231C			; 4C 1C 23 | Jump to address
	CLC				  ; 18 | Clear carry flag
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	BVC $EE			  ; 50 EE | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_14A
; Address: $F6C2E5
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_14A:
	STZ $7090			; 9C 90 70 | Store zero to absolute
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	EOR #$6C			 ; 49 6C | Exclusive OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $70			  ; 64 70 | Store zero to zero page
	DEY				  ; 88 | Decrement Y register
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_14C
; Address: $F6C331
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_14C:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_14D
; Address: $F6C371
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_14D:
	BCC $E0			  ; 90 E0 | Game work RAM access
	BPL $40			  ; 10 40 | Branch if positive
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_14E
; Address: $F6C377
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_14E:
	JSR $4080			; 20 80 40 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $08			  ; 80 08 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0711			; 0E 11 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_14F
; Address: $F6C3B8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_14F:
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	ROL $6818,X		  ; 3E 18 68 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_150
; Address: $F6C3C6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_150:
	JSR $3058			; 20 58 30 | Jump to subroutine
	BNE $40			  ; D0 40 | Branch if not equal
	LDY #$E0			 ; A0 E0 | Game work RAM access
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BRA $0E			  ; 80 0E | Branch always
	ORA ($1C),Y		  ; 11 1C | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_151
; Address: $F6C3D3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_151:
	JSL $105428		  ; 22 28 54 10 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	BVC $A8			  ; 50 A8 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_152
; Address: $F6C3DA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_152:
	JSR $A0D0			; 20 D0 A0 | Jump to subroutine
	BVC $80			  ; 50 80 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_153
; Address: $F6C3E0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_153:
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $150A			; 0D 0A 15 | Logical OR with accumulator (absolute)
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_154
; Address: $F6C404
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_154:
	JSR $103E			; 20 3E 10 | Jump to subroutine
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVS $88			  ; 70 88 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	WDM #$1E			 ; 42 1E | Reserved instruction
	AND ($0F,X)		  ; 21 0F | Logical AND with accumulator ((zero page,X))
	BPL $06			  ; 10 06 | Branch if positive
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	LDY $0000,X		  ; BC 00 00 | Load from absolute,X into Y register
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_155
; Address: $F6C43C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_155:
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCS $4C			  ; B0 4C | Branch if carry set
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_156
; Address: $F6C441
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_156:
	ORA $0706,X		  ; 1D 06 07 | Logical OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $0722,X		  ; 1D 22 07 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STZ $BB7F			; 9C 7F BB | Store zero to absolute
	SEC				  ; 38 | Set carry flag
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $03			  ; 80 03 | Branch always
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $07F8,X		  ; FE F8 07 | Increment (absolute,X)
	STY $7B			  ; 84 7B | Store Y register to zero page
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	PLY				  ; 7A | Pull Y register from stack
	STA $FC			  ; 85 FC | Store accumulator to zero page
	BEQ $0C			  ; F0 0C | Branch if equal
	BRA $70			  ; 80 70 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_157
; Address: $F6C4F7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_157:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_158
; Address: $F6C501
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_158:
	BIT $1C			  ; 24 1C | Test bits in accumulator (zero page)
	BIT $1C			  ; 24 1C | Test bits in accumulator (zero page)
	BIT $0C			  ; 24 0C | Test bits in accumulator (zero page)
	BPL $3C			  ; 10 3C | Branch if positive
	ASL $3A04,X		  ; 1E 04 3A | Arithmetic shift left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_159
; Address: $F6C51D
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_159:
	JSL $90110E		  ; 22 0E 11 90 | Jump to subroutine long
	BIT $3B			  ; 24 3B | Test bits in accumulator (zero page)
	ORA $061E,Y		  ; 19 1E 06 | Logical OR with accumulator (absolute,Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX $3B13			; EC 13 3B | Compare X register (absolute)
	CPY $1E			  ; C4 1E | Compare Y register (zero page)
	AND ($07,X)		  ; 21 07 | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	LDY $E6D8,X		  ; BC D8 E6 | Load from absolute,X into Y register
	JMP ($44F3)		  ; 6C F3 44 | Jump to address (absolute indirect)
	DEY				  ; 88 | Decrement Y register
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $B0			  ; 30 B0 | Branch if negative
	JMP $1AE4			; 4C E4 1A | Jump to address
	STA $847B			; 8D 7B 84 | Store accumulator to absolute address
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	STY $7C			  ; 84 7C | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_15A
; Address: $F6C597
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_15A:
	JSR $100F			; 20 0F 10 | Jump to subroutine
	ASL $1F09,X		  ; 1E 09 1F | Arithmetic shift left (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0F11			; 0E 11 0F | Arithmetic shift left (absolute)
	BPL $07			  ; 10 07 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_15B
; Address: $F6C5C4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_15B:
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $FF			  ; 80 FF | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_15C
; Address: $F6C5D6
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_15C:
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	BRA $01			  ; 80 01 | Branch always
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($64,X)		  ; 61 64 | Add with carry ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	BRA $01			  ; 80 01 | Branch always
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $01			  ; F0 01 | Branch if equal
	CPX #$05			 ; E0 05 | Compare X register (immediate)
	BRA $0A			  ; 80 0A | Branch always
	JMP ($B808)		  ; 6C 08 B8 | Jump to address (absolute indirect)
	BMI $E0			  ; 30 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STZ $7E00,X		  ; 9E 00 7E | Store zero to absolute,X
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_15D
; Address: $F6C67F
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_15D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SBC $E007,Y		  ; F9 07 E0 | Game work RAM access
	ASL $00FF			; 0E FF 00 | Arithmetic shift left (absolute)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ASL $640E			; 0E 0E 64 | Arithmetic shift left (absolute)
	CPX $30FF			; EC FF 30 | Compare X register (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $7C00			; 0E 00 7C | Arithmetic shift left (absolute)
	BRA $F3			  ; 80 F3 | Branch always
	BEQ $0C			  ; F0 0C | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_15E
; Address: $F6C6C3
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_15E:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $FE			  ; 80 FE | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $FE			  ; 80 FE | Branch always
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ROR $8000,X		  ; 7E 00 80 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPX $E0			  ; E4 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $18			  ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_15F
; Address: $F6C75F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_15F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	BCS $40			  ; B0 40 | Branch if carry set
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $F0			  ; 30 F0 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	STY $38			  ; 84 38 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_160
; Address: $F6C7A0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_160:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $70			  ; 80 70 | Branch always
	CLV				  ; B8 | Clear overflow flag
	INY				  ; C8 | Increment Y register
	BCC $3C			  ; 90 3C | Branch if carry clear
	STZ $1C			  ; 64 1C | Store zero to zero page
	RTI				  ; 40 | Return from interrupt
	BIT $1C28			; 2C 28 1C | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_161
; Address: $F6C7D1
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_161:
	BPL $70			  ; 10 70 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_162
; Address: $F6C7E0
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_162:
	JSR $00F0			; 20 F0 00 | Jump to subroutine
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $20			  ; 10 20 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	BRA $18			  ; 80 18 | Branch always
	BRA $38			  ; 80 38 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BMI $08			  ; 30 08 | Branch if negative
	BMI $08			  ; 30 08 | Branch if negative
	BMI $08			  ; 30 08 | Branch if negative
	BVS $08			  ; 70 08 | Branch if overflow set
	BVS $08			  ; 70 08 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	ROR $7820,X		  ; 7E 20 78 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BPL $1C			  ; 10 1C | Branch if positive
	SEC				  ; 38 | Set carry flag
	LSR $30			  ; 46 30 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_164
; Address: $F6C83F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_164:
	BCC $3E			  ; 90 3E | Branch if carry clear
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_165
; Address: $F6C86E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_165:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	AND $100F,Y		  ; 39 0F 10 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_166
; Address: $F6C891
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_166:
	JSR $1000			; 20 00 10 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	LDY #$38			 ; A0 38 | Load immediate value into Y register
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $88			  ; 70 88 | Branch if overflow set
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	BMI $78			  ; 30 78 | Branch if negative

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_167
; Address: $F6C8EA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_167:
	JSR $2878			; 20 78 28 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BEQ $0C			  ; F0 0C | Branch if equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_168
; Address: $F6C8F5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_168:
	JSL $38221C		  ; 22 1C 22 38 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BVS $88			  ; 70 88 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_169
; Address: $F6C90D
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_169:
	ROL $7800,X		  ; 3E 00 78 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $1E			  ; 10 1E | Branch if positive
	AND ($38,X)		  ; 21 38 | Logical AND with accumulator ((zero page,X))
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $0100			; 0D 00 01 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	BPL $C0			  ; 10 C0 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_16A
; Address: $F6C953
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_16A:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $0A04			; 0D 04 0A | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $150A			; 0D 0A 15 | Logical OR with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_16B
; Address: $F6C999
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_16B:
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $1B05			; 0D 05 1B | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BVS $88			  ; 70 88 | Branch if overflow set
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $7C00,X		  ; 1E 00 7C | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	BRA $F0			  ; 80 F0 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $1C11			; 0E 11 1C | Arithmetic shift left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STY $F0			  ; 84 F0 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	BPL $F0			  ; 10 F0 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BVS $88			  ; 70 88 | Branch if overflow set
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $1B			  ; 06 1B | Arithmetic shift left (zero page)
	ASL $3608,X		  ; 1E 08 36 | Arithmetic shift left (absolute,X)
	BPL $2C			  ; 10 2C | Branch if positive
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0A11			; 0E 11 0A | Arithmetic shift left (absolute)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_16C
; Address: $F6CA5B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_16C:
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $28			  ; 10 28 | Branch if positive
	BPL $68			  ; 10 68 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_16D
; Address: $F6CAA4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_16D:
	JSR $40D0			; 20 D0 40 | Jump to subroutine
	BCS $40			  ; B0 40 | Branch if carry set
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_16E
; Address: $F6CAAC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_16E:
	BRA $40			  ; 80 40 | Branch always
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	BMI $C8			  ; 30 C8 | Branch if negative
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_170
; Address: $F6CABF
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_170:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $1A0C			; 0D 0C 1A | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP ($D828)		  ; 6C 28 D8 | Jump to address (absolute indirect)
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BIT $5852			; 2C 52 58 | Test bits in accumulator (absolute)
	LDY $B0			  ; A4 B0 | Load from zero page into Y register
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_171
; Address: $F6CAF7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_171:
	BCC $40			  ; 90 40 | Branch if carry clear
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_172
; Address: $F6CB0B
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_172:
	INC				  ; 1A | Increment accumulator
	ROL $3408,X		  ; 3E 08 34 | Rotate left (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	BPL $0A			  ; 10 0A | Branch if positive
	ASL $1421,X		  ; 1E 21 14 | Arithmetic shift left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BMI $6C			  ; 30 6C | Branch if negative
	BMI $6C			  ; 30 6C | Branch if negative
	BPL $6C			  ; 10 6C | Branch if positive
	BPL $6C			  ; 10 6C | Branch if positive
	BPL $6C			  ; 10 6C | Branch if positive
	BPL $6C			  ; 10 6C | Branch if positive
	ROR $6E30			; 6E 30 6E | Rotate right (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BIT $2C52			; 2C 52 2C | Test bits in accumulator (absolute)
	ASL $1A1F			; 0E 1F 1A | Arithmetic shift left (absolute)
	BIT $7E			  ; 24 7E | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	ASL $1E11			; 0E 11 1E | Arithmetic shift left (absolute)
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	AND ($3C,X)		  ; 21 3C | Logical AND with accumulator ((zero page,X))
	WDM #$78			 ; 42 78 | Reserved instruction
	STY $F8			  ; 84 F8 | Store Y register to zero page
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $0D02			; 0D 02 0D | Logical OR with accumulator (absolute)
	ORA $0F04			; 0D 04 0F | Logical OR with accumulator (absolute)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_173
; Address: $F6CB98
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_173:
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $04			  ; 80 04 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BMI $30			  ; 30 30 | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	BPL $60			  ; 10 60 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_174
; Address: $F6CBCA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_174:
	JSR $6050			; 20 50 60 | Jump to subroutine
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $08			  ; D0 08 | Branch if not equal
	ROL				  ; 2A | Rotate left (accumulator)
	BPL $2C			  ; 10 2C | Branch if positive
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_175
; Address: $F6CBD8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_175:
	JSR $1058			; 20 58 10 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	BIT $1074			; 2C 74 10 | Test bits in accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	BVC $E0			  ; 50 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_176
; Address: $F6CBE8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_176:
	JSR $20D0			; 20 D0 20 | Jump to subroutine
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $34			  ; D0 34 | Branch if not equal
	LSR				  ; 4A | Logical shift right (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_177
; Address: $F6CBF7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_177:
	TYA				  ; 98 | Transfer Y register to accumulator
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_178
; Address: $F6CC1D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_178:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BMI $78			  ; 30 78 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_179
; Address: $F6CC27
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_179:
	SED				  ; F8 | Set decimal mode flag
	BRA $F8			  ; 80 F8 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BMI $38			  ; 30 38 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BRA $F8			  ; 80 F8 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$13			 ; 29 13 | Logical AND with accumulator (immediate)
	BIT $1609			; 2C 09 16 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $F9F1			; 0E F1 F9 | Arithmetic shift left (absolute)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	ASL $F8E1,X		  ; 1E E1 F8 | Arithmetic shift left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	BRA $70			  ; 80 70 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BCS $48			  ; B0 48 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_17C
; Address: $F6CC99
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_17C:
	BRA $00			  ; 80 00 | Branch always
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $FC			  ; F0 FC | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BRA $20			  ; 80 20 | Branch always
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $28			  ; D0 28 | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	ROL $3F26,X		  ; 3E 26 3F | Rotate left (absolute,X)
	ORA $500F			; 0D 0F 50 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	BVC $A8			  ; 50 A8 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $78			  ; A4 78 | Load from zero page into Y register
	STY $3C			  ; 84 3C | Store Y register to zero page
	WDM #$3E			 ; 42 3E | Reserved instruction
	EOR ($1F,X)		  ; 41 1F | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_17D
; Address: $F6CCFD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_17D:
	JSR $100F			; 20 0F 10 | Jump to subroutine
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BMI $28			  ; 30 28 | Branch if negative

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_17E
; Address: $F6CD22
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_17E:
	JSR $64DC			; 20 DC 64 | Jump to subroutine
	ORA ($6F),Y		  ; 11 6F | Logical OR with accumulator ((zero page),Y)
	BIT $1773			; 2C 73 17 | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $58			  ; A4 58 | Load from zero page into Y register
	LDY $5C			  ; A4 5C | Load from zero page into Y register
	BVC $33			  ; 50 33 | Branch if overflow clear
	JMP $2718			; 4C 18 27 | Jump to address

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_17F
; Address: $F6CD3D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_17F:
	CLC				  ; 18 | Clear carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	DEC $E0			  ; C6 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	DEC $39			  ; C6 39 | Decrement (zero page)
	SEP #$F0			 ; E2 F0 | Set processor status bits
	BEQ $00			  ; F0 00 | Branch if equal
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $1E11			; 0E 11 1E | Arithmetic shift left (absolute)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_180
; Address: $F6CD88
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_180:
	BMI $30			  ; 30 30 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	JMP $0000			; 4C 00 00 | Jump to address
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $FC			  ; F0 FC | Branch if equal
	INC $7E7C,X		  ; FE 7C 7E | Increment (absolute,X)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BEQ $0C			  ; F0 0C | Branch if equal
	ROL $7E			  ; 26 7E | Rotate left (zero page)
	ROR $2E14,X		  ; 7E 14 2E | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_181
; Address: $F6CDF9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_181:
	JSR $413E			; 20 3E 41 | Jump to subroutine
	WDM #$2C			 ; 42 2C | Reserved instruction
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_183
; Address: $F6CE24
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_183:
	JSR $80E0			; 20 E0 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	REP #$F8			 ; C2 F8 | Reset processor status bits
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $3C			  ; 10 3C | Branch if positive
	ROL $1E02,X		  ; 3E 02 1E | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP ($947E)		  ; 6C 7E 94 | Jump to address (absolute indirect)
	INC $2814,X		  ; FE 14 28 | Increment (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ASL $3E11			; 0E 11 3E | Arithmetic shift left (absolute)
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	BIT $1333			; 2C 33 13 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ROL $3341,X		  ; 3E 41 33 | Rotate left (absolute,X)
	JMP $231C			; 4C 1C 23 | Jump to address
	BPL $03			  ; 10 03 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $F11F,X		  ; 1E 1F F1 | Arithmetic shift left (absolute,X)
	INC $F10E,X		  ; FE 0E F1 | Increment (absolute,X)
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	INC $F101,X		  ; FE 01 F1 | Increment (absolute,X)
	ASL $F00F			; 0E 0F F0 | Arithmetic shift left (absolute)
	BRA $7C			  ; 80 7C | Branch always
	BRA $00			  ; 80 00 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	BNE $38			  ; D0 38 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	BIT $30			  ; 24 30 | Test bits in accumulator (zero page)
	INY				  ; C8 | Increment Y register
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_184
; Address: $F6CF3E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_184:
	STA				  ; 9F 00 00 00 | Store accumulator to absolute long,X
	CPX $0062			; EC 62 00 | Compare X register (absolute)
	STZ $0000			; 9C 00 00 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_185
; Address: $F6CF65
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_185:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	LDA				  ; BF 00 00 00 | Load from absolute long,X into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $F0			  ; 10 F0 | Branch if positive
	SBC $CA0C,X		  ; FD 0C CA | Subtract with carry (absolute,X)
	ASL $F4			  ; 06 F4 | Arithmetic shift left (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $6900,Y		  ; F9 00 69 | Subtract with carry (absolute,Y)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$11			 ; 09 11 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	STY $AF			  ; 84 AF | Store Y register to zero page
	EOR ($0E),Y		  ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	STA				  ; 9F 00 BD 00 | Store accumulator to absolute long,X
	PEA #$AF00		   ; F4 00 AF | Push effective address to stack
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC $04FF,Y		  ; F9 FF 04 | Subtract with carry (absolute,Y)
	DEC $3F0E			; CE 0E 3F | Decrement (absolute)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	DEC $3FFF			; CE FF 3F | Decrement (absolute)
	INC $006F,X		  ; FE 6F 00 | Increment (absolute,X)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	DEC $3300			; CE 00 33 | Decrement (absolute)
	BMI $FF			  ; 30 FF | Branch if negative
	AND ($22),Y		  ; 31 22 | Logical AND with accumulator ((zero page),Y)
	LDA ($94),Y		  ; B1 94 | Load from (zero page),Y into accumulator
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	STA $F667ED		  ; 8F ED 67 F6 | Store accumulator to absolute long address
	PLX				  ; FA | Pull X register from stack
	ADC #$CE			 ; 69 CE | Add with carry (immediate)
	LSR $8300			; 4E 00 83 | Logical shift right (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	STZ $EE00			; 9C 00 EE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_186
; Address: $F6D045
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_186:
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BEQ $C7			  ; F0 C7 | Branch if equal
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	SBC $C600,Y		  ; F9 00 C6 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $B0			  ; F0 B0 | Branch if equal
	STY $C25C			; 8C 5C C2 | Store Y register to absolute address
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $7F00			; 0D 00 7F | Logical OR with accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	INC $E9E0,X		  ; FE E0 E9 | Increment (absolute,X)
	STA ($D7,X)		  ; 81 D7 | Store accumulator to (zero page,X)
	LDA				  ; BF 29 7F 4F | Load from absolute long,X into accumulator
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 7F 00 | Load from absolute long,X into accumulator
	INC $E900,X		  ; FE 00 E9 | Increment (absolute,X)
	ORA ($BF,X)		  ; 01 BF | Logical OR with accumulator ((zero page,X))
	CPX $F7E3			; EC E3 F7 | Compare X register (absolute)
	ORA ($FD),Y		  ; 11 FD | Logical OR with accumulator ((zero page),Y)
	CPX $F2FE			; EC FE F2 | Compare X register (absolute)
	SBC $00B0			; ED B0 00 | Subtract with carry (absolute)
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	CPY #$FD			 ; C0 FD | Compare Y register (immediate)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_188
; Address: $F6D125
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_188:
	JSR $E040			; 20 40 E0 | Game work RAM access
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BVC $E0			  ; 50 E0 | Game work RAM access
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_189
; Address: $F6D12E
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_189:
	LDY #$68			 ; A0 68 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BCC $00			  ; 90 00 | Branch if carry clear
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA $1D08,X		  ; 1D 08 1D | Logical OR with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	ORA $0507			; 0D 07 05 | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	LDY #$51			 ; A0 51 | Load immediate value into Y register
	CPX #$D3			 ; E0 D3 | Compare X register (immediate)
	SBC ($B7),Y		  ; F1 B7 | Subtract with carry ((zero page),Y)
	CMP ($BF),Y		  ; D1 BF | Compare accumulator ((zero page),Y)
	LDA				  ; BF EA 77 B8 | Load from absolute long,X into accumulator
	ASL $3E01,X		  ; 1E 01 3E | Arithmetic shift left (absolute,X)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ROR $FE01			; 6E 01 FE | Rotate right (absolute)
	STX $25EE			; 8E EE 25 | Store X register to absolute address
	PLX				  ; FA | Pull X register from stack
	STZ $3F60			; 9C 60 3F | Store zero to absolute
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FE			  ; 80 FE | Branch always
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	ASL $D9			  ; 06 D9 | Arithmetic shift left (zero page)
	ORA $EB			  ; 05 EB | Logical OR with accumulator (zero page)
	ORA ($36,X)		  ; 01 36 | Logical OR with accumulator ((zero page,X))
	DEC $59			  ; C6 59 | Decrement (zero page)
	CPY #$AD			 ; C0 AD | Compare Y register (immediate)
	NOP				  ; EA | No operation
	INC $A5			  ; E6 A5 | Increment (zero page)
	EOR ($5F,X)		  ; 41 5F | Exclusive OR with accumulator ((zero page,X))
	LDA ($1D,X)		  ; A1 1D | Load from (zero page,X) into accumulator
	LDA ($3F,X)		  ; A1 3F | Load from (zero page,X) into accumulator
	ADC $3FC3,X		  ; 7D C3 3F | Add with carry (absolute,X)
	BRA $1A			  ; 80 1A | Branch always
	BRA $3E			  ; 80 3E | Branch always
	STZ $00			  ; 64 00 | Store zero to zero page
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	BCC $C0			  ; 90 C0 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BCS $18			  ; B0 18 | Branch if carry set

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_18B
; Address: $F6D1D2
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_18B:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	JMP $13A05E		  ; 5C 5E A0 13 | Jump to address long
	LDY $3C9A			; AC 9A 3C | Load from absolute address into Y register
	PLY				  ; 7A | Pull Y register from stack
	ORA $2300			; 0D 00 23 | Logical OR with accumulator (absolute)
	LDA $5300			; AD 00 53 | Load from absolute address into accumulator
	BEQ $FC			  ; F0 FC | Branch if equal
	STY $3FFF			; 8C FF 3F | Store Y register to absolute address
	STA $0F3F07		  ; 8F 07 3F 0F | Store accumulator to absolute long address
	LDY $7300,X		  ; BC 00 73 | Load from absolute,X into Y register
	SBC $F306,Y		  ; F9 06 F3 | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	BEQ $FC			  ; F0 FC | Branch if equal
	INC $FDC6,X		  ; FE C6 FD | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $F800,Y		  ; F9 00 F8 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BVC $F1			  ; 50 F1 | Branch if overflow clear
	SBC $B23F			; ED 3F B2 | Subtract with carry (absolute)
	STA				  ; 9F ED A3 62 | Store accumulator to absolute long,X
	ORA ($B2,X)		  ; 01 B2 | Logical OR with accumulator ((zero page,X))
	LDA $939D			; AD 9D 93 | Load from absolute address into accumulator
	ASL $8000			; 0E 00 80 | Arithmetic shift left (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	INC $5200,X		  ; FE 00 52 | Increment (absolute,X)
	JMP ($0000)		  ; 6C 00 00 | Jump to address (absolute indirect)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BCC $80			  ; 90 80 | Branch if carry clear
	BPL $80			  ; 10 80 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_18D
; Address: $F6D2A0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_18D:
	PHP				  ; 08 | Push processor status to stack
	ORA $1B01,Y		  ; 19 01 1B | Logical OR with accumulator (absolute,Y)
	ORA ($1B,X)		  ; 01 1B | Logical OR with accumulator ((zero page,X))
	ORA ($1B,X)		  ; 01 1B | Logical OR with accumulator ((zero page,X))
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_18E
; Address: $F6D2B0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_18E:
	ORA $0A00			; 0D 00 0A | Logical OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LSR $CCFE			; 4E FE CC | Logical shift right (absolute)
	INC $BFCC,X		  ; FE CC BF | Increment (absolute,X)
	ADC $7306,Y		  ; 79 06 73 | Add with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	SBC $B8EB			; ED EB B8 | Subtract with carry (absolute)
	SBC $F4FC,X		  ; FD FC F4 | Subtract with carry (absolute,X)
	PEA #$F8FA		   ; F4 FA F8 | Push effective address to stack
	CPX $FB			  ; E4 FB | Compare X register (zero page)
	CPX $FE			  ; E4 FE | Compare X register (zero page)
	BPL $8A			  ; 10 8A | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_190
; Address: $F6D300
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_190:
	LDY #$68			 ; A0 68 | Load immediate value into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	BMI $58			  ; 30 58 | Branch if negative
	BCS $A8			  ; B0 A8 | Branch if carry set
	BVS $A8			  ; 70 A8 | Branch if overflow set
	BVS $94			  ; 70 94 | Branch if overflow set
	BVS $C4			  ; 70 C4 | Branch if overflow set
	BVS $C4			  ; 70 C4 | Branch if overflow set
	BVS $90			  ; 70 90 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	ORA $190B,Y		  ; 19 0B 19 | Logical OR with accumulator (absolute,Y)
	ORA $1E0B,Y		  ; 19 0B 1E | Logical OR with accumulator (absolute,Y)
	ORA $050E			; 0D 0E 05 | Logical OR with accumulator (absolute)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	ROL $1FCF			; 2E CF 1F | Rotate left (absolute)
	SBC ($57,X)		  ; E1 57 | Subtract with carry ((zero page,X))
	BEQ $6B			  ; F0 6B | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	AND $96FC			; 2D FC 96 | Logical AND with accumulator (absolute)
	ROR $0070,X		  ; 7E 70 00 | Rotate right (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	ROL $1F00,X		  ; 3E 00 1F | Rotate left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $0E			  ; F0 0E | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC ($9F),Y		  ; F1 9F | Subtract with carry ((zero page),Y)
	ADC $FB			  ; 65 FB | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_191
; Address: $F6D36A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_191:
	LDA $04FB50		  ; AF 50 FB 04 | Load from absolute long address into accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BCC $6E			  ; 90 6E | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_192
; Address: $F6D376
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_192:
	STA $E601,Y		  ; 99 01 E6 | Store accumulator to absolute,Y
	ASL $50			  ; 06 50 | Arithmetic shift left (zero page)
	BVC $84			  ; 50 84 | Branch if overflow clear
	SBC $7F03,X		  ; FD 03 7F | Subtract with carry (absolute,X)
	INC $1B			  ; E6 1B | Increment (zero page)
	INC $FD07,X		  ; FE 07 FD | Increment (absolute,X)
	LSR $9EFB			; 4E FB 9E | Logical shift right (absolute)
	SBC $D97E			; ED 7E D9 | Subtract with carry (absolute)
	INC $00C4,X		  ; FE C4 00 | Increment (absolute,X)
	LDY $20			  ; A4 20 | Load from zero page into Y register
	BPL $08			  ; 10 08 | Branch if positive
	BVC $40			  ; 50 40 | Branch if overflow clear
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	BEQ $30			  ; F0 30 | Branch if equal
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $0707			; 0E 07 07 | Arithmetic shift left (absolute)
	LDA $FDAFFE		  ; AF FE AF FD | Load from absolute long address into accumulator
	LDX $5DEF,Y		  ; BE EF 5D | Load from absolute,Y into X register
	EOR $43F1			; 4D F1 43 | Exclusive OR with accumulator (absolute)
	BEQ $95			  ; F0 95 | Branch if equal
	ROR $000F,X		  ; 7E 0F 00 | Rotate right (absolute,X)
	ASL $1C00			; 0E 00 1C | Arithmetic shift left (absolute)
	ORA $0E00,X		  ; 1D 00 0E | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $FE78,X		  ; FD 78 FE | Subtract with carry (absolute,X)
	WDM #$FF			 ; 42 FF | Reserved instruction
	BEQ $F3			  ; F0 F3 | Branch if equal
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	SBC $FF36,Y		  ; F9 36 FF | Subtract with carry (absolute,Y)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	SBC $FE00,X		  ; FD 00 FE | Subtract with carry (absolute,X)
	CPY $0F30			; CC 30 0F | Compare Y register (absolute)
	ORA #$C6			 ; 09 C6 | Logical OR with accumulator (immediate)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	STX $FB00			; 8E 00 FB | Store X register to absolute address
	PEA #$2CF0		   ; F4 F0 2C | Push effective address to stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_193
; Address: $F6D429
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_193:
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	AND ($C3),Y		  ; 31 C3 | Logical AND with accumulator ((zero page),Y)
	BMI $CB			  ; 30 CB | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BMI $3C			  ; 30 3C | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	ROR $7283,X		  ; 7E 83 72 | Rotate right (absolute,X)
	PLX				  ; FA | Pull X register from stack
	DEC $9CAF,X		  ; DE AF 9C | Decrement (absolute,X)
	PLX				  ; FA | Pull X register from stack
	AND $005C,X		  ; 3D 5C 00 | Logical AND with accumulator (absolute,X)
	JMP $00D800		  ; 5C 00 D8 00 | Jump to address long
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $80			  ; 90 80 | Branch if carry clear
	BVC $40			  ; 50 40 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_194
; Address: $F6D45C
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_194:
	JSR $4000			; 20 00 40 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	BVS $38			  ; 70 38 | Branch if overflow set
	BVS $B8			  ; 70 B8 | Branch if overflow set
	BEQ $70			  ; F0 70 | Branch if equal
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $10			  ; 80 10 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA ($DF,X)		  ; A1 DF | Load from (zero page,X) into accumulator
	INC $BF			  ; E6 BF | Increment (zero page)
	STA				  ; 9F A0 B0 3F | Store accumulator to absolute long,X
	LDY $7F3F,X		  ; BC 3F 7F | Load from absolute,X into Y register
	DEC $9F00,X		  ; DE 00 9F | Decrement (absolute,X)
	LDA ($0E),Y		  ; B1 0E | Load from (zero page),Y into accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_195
; Address: $F6D4C4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_195:
	LDA $E00F78		  ; AF 78 0F E0 | Game work RAM access
	LDA				  ; BF 84 3F 84 | Load from absolute long,X into accumulator
	LDA				  ; BF 84 7C 13 | Load from absolute long,X into accumulator
	TXS				  ; 9A | Transfer X register to stack pointer
	BVC $B6			  ; 50 B6 | Branch if overflow clear
	BPL $6C			  ; 10 6C | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_196
; Address: $F6D4D6
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_196:
	CLC				  ; 18 | Clear carry flag
	PEA #$7484		   ; F4 84 74 | Push effective address to stack
	SEP #$02			 ; E2 02 | Set processor status bits
	JMP $CC68			; 4C 68 CC | Jump to address
	INX				  ; E8 | Increment X register
	JMP $F84CF8		  ; 5C F8 4C F8 | Jump to address long
	INY				  ; C8 | Increment Y register
	BEQ $C8			  ; F0 C8 | Branch if equal
	BEQ $C8			  ; F0 C8 | Branch if equal
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $90			  ; F0 90 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	BVS $EF			  ; 70 EF | Branch if overflow set
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $FCF7,Y		  ; 19 F7 FC | Logical OR with accumulator (absolute,Y)
	ROL $C0C0,X		  ; 3E C0 C0 | Rotate left (absolute,X)
	AND ($F1),Y		  ; 31 F1 | Logical AND with accumulator ((zero page),Y)
	DEC $F0FF			; CE FF F0 | Decrement (absolute)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	SBC $F72C,X		  ; FD 2C F7 | Subtract with carry (absolute,X)
	ORA $62EE,Y		  ; 19 EE 62 | Logical OR with accumulator (absolute,Y)
	STZ $FCC2			; 9C C2 FC | Store zero to absolute
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CMP $623F			; CD 3F 62 | Compare accumulator (absolute)
	STA				  ; 9F B1 7F 9E | Store accumulator to absolute long,X
	ADC $3E43,X		  ; 7D 43 3E | Add with carry (absolute,X)
	DEY				  ; 88 | Decrement Y register
	CMP $73C2			; CD C2 73 | Compare accumulator (absolute)
	ROL $8FFF,X		  ; 3E FF 8F | Rotate left (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $07			  ; F0 07 | Branch if equal
	BMI $FF			  ; 30 FF | Branch if negative
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_197
; Address: $F6D5F1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_197:
	JSR $001C			; 20 1C 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SBC $FD62,X		  ; FD 62 FD | Subtract with carry (absolute,X)
	JMP $B1F3			; 4C F3 B1 | Jump to address
	DEC $708C,X		  ; DE 8C 70 | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_198
; Address: $F6D60B
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_198:
	BEQ $70			  ; F0 70 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0E01			; 0E 01 0E | Arithmetic shift left (absolute)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ROL $5F8A,X		  ; 3E 8A 5F | Rotate left (absolute,X)
	CPY $AD			  ; C4 AD | Compare Y register (zero page)
	SEP #$BF			 ; E2 BF | Set processor status bits
	BEQ $BF			  ; F0 BF | Branch if equal
	BEQ $57			  ; F0 57 | Branch if equal
	BEQ $29			  ; F0 29 | Branch if equal
	INC $FE29,X		  ; FE 29 FE | Increment (absolute,X)
	ADC $3700,X		  ; 7D 00 37 | Add with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVC $BF			  ; 50 BF | Branch if overflow clear
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	LDA $BD4F,X		  ; BD 4F BD | Load from absolute,X into accumulator
	SEP #$0F			 ; E2 0F | Set processor status bits
	SEP #$0F			 ; E2 0F | Set processor status bits
	STA ($10),Y		  ; 91 10 | Store accumulator to (zero page),Y
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $50			  ; F0 50 | Branch if equal
	BCS $E0			  ; B0 E0 | Game work RAM access
	BCS $40			  ; B0 40 | Branch if carry set
	BCS $40			  ; B0 40 | Branch if carry set
	BCS $50			  ; B0 50 | Branch if carry set
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_199
; Address: $F6D68E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_199:
	BCC $60			  ; 90 60 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $E707,X		  ; 1E 07 E7 | Arithmetic shift left (absolute,X)
	INC $E0FF,X		  ; FE FF E0 | Game work RAM access
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	INC $FFF0,X		  ; FE F0 FF | Increment (absolute,X)
	SBC $F000,X		  ; FD 00 F0 | Subtract with carry (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_19A
; Address: $F6D70E
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_19A:
	LDY $0083,X		  ; BC 83 00 | Load from absolute,X into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	CPY $0C			  ; C4 0C | Compare Y register (zero page)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	DEC $BF			  ; C6 BF | Decrement (zero page)
	LDA ($DF,X)		  ; A1 DF | Load from (zero page,X) into accumulator
	ROR $6EDF			; 6E DF 6E | Rotate right (absolute)
	BPL $0F			  ; 10 0F | Branch if positive
	ASL $0101			; 0E 01 01 | Arithmetic shift left (absolute)
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	ORA $F3EC,X		  ; 1D EC F3 | Logical OR with accumulator (absolute,X)
	CPX $08F3			; EC F3 08 | Compare X register (absolute)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_19B
; Address: $F6D7C0
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_19B:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	STY $34			  ; 84 34 | Store Y register to zero page
	LDA				  ; BF DB FF CB | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	STA $FF11,Y		  ; 99 11 FF | Store accumulator to absolute,Y
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	STA $8FFF87		  ; 8F 87 FF 8F | Store accumulator to absolute long address
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	INC $7F00			; EE 00 7F | Increment (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_19C
; Address: $F6D836
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_19C:
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 00 78 06 | Store accumulator to absolute long,X
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	INC $FD21			; EE 21 FD | Increment (absolute)
	BPL $FC			  ; 10 FC | Branch if positive
	AND ($0E),Y		  ; 31 0E | Logical AND with accumulator ((zero page),Y)
	ASL $FFE0,X		  ; 1E E0 FF | Arithmetic shift left (absolute,X)
	CMP $0300,X		  ; DD 00 03 | Compare accumulator (absolute,X)
	BPL $FC			  ; 10 FC | Branch if positive
	STZ $9CFF			; 9C FF 9C | Store zero to absolute
	SED				  ; F8 | Set decimal mode flag
	CPX $DB			  ; E4 DB | Compare X register (zero page)
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	CPX $BF			  ; E4 BF | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_19D
; Address: $F6D877
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_19D:
	JSR $001B			; 20 1B 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDY $E480,X		  ; BC 80 E4 | Load from absolute,X into Y register
	CMP $B67E			; CD 7E B6 | Compare accumulator (absolute)
	STX $0789			; 8E 89 07 | Store X register to absolute address
	SED				  ; F8 | Set decimal mode flag
	STA $C90EC8		  ; 8F C8 0E C9 | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	BCS $00			  ; B0 00 | Branch if carry set
	BVS $00			  ; 70 00 | Branch if overflow set
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_19E
; Address: $F6D8A6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_19E:
	JSR $9000			; 20 00 90 | Jump to subroutine
	BRA $70			  ; 80 70 | Branch always
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1A0
; Address: $F6D8CE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1A0:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $3E1E,X		  ; 1E 1E 3E | Arithmetic shift left (absolute,X)
	ROL $3E3E,X		  ; 3E 3E 3E | Rotate left (absolute,X)
	ROL $3C3E,X		  ; 3E 3E 3C | Rotate left (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1A1
; Address: $F6D8F4
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1A1:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $7C			  ; 30 7C | Branch if negative
	CPY $BF			  ; C4 BF | Compare Y register (zero page)
	CLV				  ; B8 | Clear overflow flag
	BMI $0F			  ; 30 0F | Branch if negative
	INC $9F1F,X		  ; FE 1F 9F | Increment (absolute,X)
	STA ($77,X)		  ; 81 77 | Store accumulator to (zero page,X)
	BEQ $99			  ; F0 99 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	STA				  ; 9F F1 0F 0F | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BEQ $FD			  ; F0 FD | Branch if equal
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$82			 ; E0 82 | Compare X register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	INC $FF41,X		  ; FE 41 FF | Increment (absolute,X)
	BCC $FC			  ; 90 FC | Branch if carry clear
	STZ $39E3			; 9C E3 39 | Store zero to absolute
	INC $C03E,X		  ; FE 3E C0 | Increment (absolute,X)
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	BCC $38			  ; 90 38 | Branch if carry clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $FF			  ; 70 FF | Branch if overflow set
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	BIT #$F6			 ; 89 F6 | Test bits in accumulator (immediate)
	DEC $1070			; CE 70 10 | Decrement (absolute)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1A2
; Address: $F6D9E5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1A2:
	JSL $4D413E		  ; 22 3E 41 4D | Jump to subroutine long
	CMP ($1F,X)		  ; C1 1F | Compare accumulator ((zero page,X))
	STA ($9F),Y		  ; 91 9F | Store accumulator to (zero page),Y
	ORA ($7D),Y		  ; 11 7D | Logical OR with accumulator ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ROR $EE00			; 6E 00 EE | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1A3
; Address: $F6D9FE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1A3:
	STA				  ; 9F 00 00 00 | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1A4
; Address: $F6DA0E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1A4:
	JSR $0090			; 20 90 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1A5
; Address: $F6DA24
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1A5:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	AND $4F1F,Y		  ; 39 1F 4F | Logical AND with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BNE $18			  ; D0 18 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	DEC $CFEA,X		  ; DE EA CF | Decrement (absolute,X)
	PEA #$F4D7		   ; F4 D7 F4 | Push effective address to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $7F1E,X		  ; 1E 1E 7F | Arithmetic shift left (absolute,X)
	ADC $5ADD,X		  ; 7D DD 5A | Add with carry (absolute,X)
	BIT $106D			; 2C 6D 10 | Test bits in accumulator (absolute)
	ROL $3C00,X		  ; 3E 00 3C | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ADC $BE70,X		  ; 7D 70 BE | Add with carry (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	INC $F7C5,X		  ; FE C5 F7 | Increment (absolute,X)
	STY $F5			  ; 84 F5 | Store Y register to zero page
	STY $ED			  ; 84 ED | Store Y register to zero page
	LSR $5E12,X		  ; 5E 12 5E | Logical shift right (absolute,X)
	INC				  ; 1A | Increment accumulator
	STA				  ; 9F 00 75 00 | Store accumulator to absolute long,X
	PLX				  ; FA | Pull X register from stack
	SBC $ED00			; ED 00 ED | Subtract with carry (absolute)
	BCC $C0			  ; 90 C0 | Branch if carry clear
	BNE $60			  ; D0 60 | Branch if not equal
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1A6
; Address: $F6DAC7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1A6:
	INX				  ; E8 | Increment X register
	LDY #$68			 ; A0 68 | Load immediate value into Y register
	BCC $78			  ; 90 78 | Branch if carry clear
	CPX #$78			 ; E0 78 | Compare X register (immediate)
	CPX #$78			 ; E0 78 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1A7
; Address: $F6DAD2
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1A7:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $5C			  ; 90 5C | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	AND ($11,X)		  ; 21 11 | Logical AND with accumulator ((zero page,X))
	BPL $0F			  ; 10 0F | Branch if positive
	ORA $0303			; 0D 03 03 | Logical OR with accumulator (absolute)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	PLX				  ; FA | Pull X register from stack
	LDY $3D			  ; A4 3D | Load from zero page into Y register
	WDM #$8C			 ; 42 8C | Reserved instruction
	INC $E418,X		  ; FE 18 E4 | Increment (absolute,X)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BRA $40			  ; 80 40 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	REP #$00			 ; C2 00 | Reset processor status bits
	LDY $0000,X		  ; BC 00 00 | Load from absolute,X into Y register
	ASL $3A1E,X		  ; 1E 1E 3A | Arithmetic shift left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1A8
; Address: $F6DB29
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1A8:
	JSL $003C18		  ; 22 18 3C 00 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	ORA ($21),Y		  ; 11 21 | PPU graphics register access
	ORA $0729,Y		  ; 19 29 07 | Logical OR with accumulator (absolute,Y)
	ROL $2E03			; 2E 03 2E | Rotate left (absolute)
	ORA $0336,Y		  ; 19 36 03 | Logical OR with accumulator (absolute,Y)
	ASL $1600,X		  ; 1E 00 16 | Arithmetic shift left (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	LDA				  ; BF AD BF BE | Load from absolute long,X into accumulator
	LSR $7DFF,X		  ; 5E FF 7D | Logical shift right (absolute,X)
	LDY $3F9A,X		  ; BC 9A 3F | Load from absolute,X into Y register
	ORA $3F7E,X		  ; 1D 7E 3F | Logical OR with accumulator (absolute,X)
	LDA $00FF10		  ; AF 10 FF 00 | Load from absolute long address into accumulator
	SBC $EE10			; ED 10 EE | Subtract with carry (absolute)
	BPL $DE			  ; 10 DE | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1AA
; Address: $F6DB83
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1AA:
	BCS $A0			  ; B0 A0 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	CPX $D0			  ; E4 D0 | Compare X register (zero page)
	CPX $D0			  ; E4 D0 | Compare X register (zero page)
	JMP $085C08		  ; 5C 08 5C 08 | Jump to address long
	INX				  ; E8 | Increment X register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BNE $98			  ; D0 98 | Branch if not equal
	INX				  ; E8 | Increment X register
	CPY $CEEC			; CC EC CE | Compare Y register (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	ORA $37			  ; 05 37 | Logical OR with accumulator (zero page)
	ORA $37			  ; 05 37 | Logical OR with accumulator (zero page)
	ROL $3E0F,X		  ; 3E 0F 3E | Rotate left (absolute,X)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROR $7F3F,X		  ; 7E 3F 7F | Rotate right (absolute,X)
	ROR $7E7F,X		  ; 7E 7F 7E | Rotate right (absolute,X)
	JMP ($6CEF)		  ; 6C EF 6C | Jump to address (absolute indirect)
	DEC $9E20,X		  ; DE 20 9E | Decrement (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1AB
; Address: $F6DC34
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1AB:
	STZ $BC60,X		  ; 9E 60 BC | Store zero to absolute,X
	WDM #$F9			 ; 42 F9 | Reserved instruction
	SBC $EB04,Y		  ; F9 04 EB | Subtract with carry (absolute,Y)
	ASL $EB			  ; 06 EB | Arithmetic shift left (zero page)
	ASL $DC			  ; 06 DC | Arithmetic shift left (zero page)
	INX				  ; E8 | Increment X register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1AC
; Address: $F6DC44
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1AC:
	LDY $98			  ; A4 98 | Load from zero page into Y register
	ROL				  ; 2A | Rotate left (accumulator)
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1AE
; Address: $F6DC56
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1AE:
	LDY $00			  ; A4 00 | Load from zero page into Y register
	LDY $00			  ; A4 00 | Load from zero page into Y register
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	ASL $0722			; 0E 22 07 | Arithmetic shift left (absolute)
	AND $0A			  ; 25 0A | Logical AND with accumulator (zero page)
	ORA $0301			; 0D 01 03 | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	PHX				  ; DA | Push X register to stack
	SED				  ; F8 | Set decimal mode flag
	DEC				  ; 3A | Decrement accumulator
	CPY $30			  ; C4 30 | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $40			  ; 80 40 | Branch always
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1B1
; Address: $F6DCAC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1B1:
	JSL $0C210C		  ; 22 0C 21 0C | Jump to subroutine long
	SBC $F9F7,Y		  ; F9 F7 F9 | Subtract with carry (absolute,Y)
	SBC ($0C),Y		  ; F1 0C | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	STZ $95			  ; 64 95 | Store zero to zero page
	STZ $03			  ; 64 03 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1B2
; Address: $F6DCDB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1B2:
	JSR $2036			; 20 36 20 | Jump to subroutine
	STZ $F610			; 9C 10 F6 | Store zero to absolute
	DEC $DE3C,X		  ; DE 3C DE | Decrement (absolute,X)
	LDY $B8F4,X		  ; BC F4 B8 | Load from absolute,X into Y register
	LDY $78			  ; A4 78 | Load from zero page into Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1B3
; Address: $F6DCFC
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1B3:
	BRA $80			  ; 80 80 | Branch always
	AND ($0C,X)		  ; 21 0C | Logical AND with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA $1917,Y		  ; 19 17 19 | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $BB			  ; 46 BB | Logical shift right (zero page)
	AND $FB			  ; 25 FB | Logical AND with accumulator (zero page)
	AND $7F			  ; 25 7F | Logical AND with accumulator (zero page)
	STA $FB			  ; 85 FB | Store accumulator to zero page
	STA $8C			  ; 85 8C | Store accumulator to zero page
	NOP				  ; EA | No operation
	PLX				  ; FA | Pull X register from stack
	ORA $B5			  ; 05 B5 | Logical OR with accumulator (zero page)
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	EOR $04			  ; 45 04 | Exclusive OR with accumulator (zero page)
	ADC $04			  ; 65 04 | Add with carry (zero page)
	LDY $78			  ; A4 78 | Load from zero page into Y register
	CPX $EC38			; EC 38 EC | Compare X register (absolute)
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PEA #$5068		   ; F4 68 50 | Push effective address to stack
	PLA				  ; 68 | Pull accumulator from stack
	BNE $E8			  ; D0 E8 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	LDA				  ; BF 82 BF 83 | Load from absolute long,X into accumulator
	JMP $E14CC1		  ; 5C C1 4C E1 | Jump to address long

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1B4
; Address: $F6DD88
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1B4:
	JSR $30FF			; 20 FF 30 | Jump to subroutine
	JMP $63FF			; 4C FF 63 | Jump to address
	ROL $1E00,X		  ; 3E 00 1E | Rotate left (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	CPX #$58			 ; E0 58 | Compare X register (immediate)
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	BNE $28			  ; D0 28 | Branch if not equal
	BNE $D0			  ; D0 D0 | Branch if not equal
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1B5
; Address: $F6DDC0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1B5:
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ADC ($FE,X)		  ; 61 FE | Add with carry ((zero page,X))
	LDA ($7F,X)		  ; A1 7F | Load from (zero page,X) into accumulator
	LDA ($7F),Y		  ; B1 7F | Load from (zero page),Y into accumulator
	STX $7F			  ; 86 7F | Store X register to zero page
	STY $7F			  ; 84 7F | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	ADC ($1E,X)		  ; 61 1E | Add with carry ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1B6
; Address: $F6DE02
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1B6:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $1F0E			; 0E 0E 1F | Arithmetic shift left (absolute)
	ROL $783E,X		  ; 3E 3E 78 | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $70			  ; 70 70 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1BA
; Address: $F6DE30
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1BA:
	ASL $211E,X		  ; 1E 1E 21 | PPU graphics register access
	ADC $797F,Y		  ; 79 7F 79 | Add with carry (absolute,Y)
	INC $F8E8,X		  ; FE E8 F8 | Increment (absolute,X)
	BNE $F0			  ; D0 F0 | Branch if not equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $16			  ; 05 16 | Logical OR with accumulator (zero page)
	ORA $102E			; 0D 2E 10 | Logical OR with accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1BB
; Address: $F6DE4E
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1BB:
	JSR $0014			; 20 14 00 | Jump to subroutine
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	STY $7684			; 8C 84 76 | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	STY $7F			  ; 84 7F | Store Y register to zero page
	STA $7D			  ; 85 7D | Store accumulator to zero page
	BVS $00			  ; 70 00 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $40			  ; 70 40 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BVS $70			  ; 70 70 | Branch if overflow set
	BRA $40			  ; 80 40 | Branch always
	AND ($80,X)		  ; 21 80 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1BD
; Address: $F6DEAE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1BD:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $130A			; 0E 0A 13 | Arithmetic shift left (absolute)
	ROL $2C1C			; 2E 1C 2C | Rotate left (absolute)
	BMI $1F			  ; 30 1F | Branch if negative

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1BE
; Address: $F6DECF
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1BE:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BPL $01			  ; 10 01 | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SBC $D7			  ; E5 D7 | Subtract with carry (zero page)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	ROL				  ; 2A | Rotate left (accumulator)
	AND $0FCD			; 2D CD 0F | Logical AND with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ASL $0C00,X		  ; 1E 00 0C | Arithmetic shift left (absolute,X)
	ASL $0C0C,X		  ; 1E 0C 0C | Arithmetic shift left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1C0
; Address: $F6DF62
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1C0:
	JSR $3020			; 20 20 30 | Jump to subroutine
	BMI $18			  ; 30 18 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BNE $F0			  ; D0 F0 | Branch if not equal
	BVC $70			  ; 50 70 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	DEC				  ; 3A | Decrement accumulator
	BRA $7E			  ; 80 7E | Branch always
	CPX #$1B			 ; E0 1B | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	AND $0F0C			; 2D 0C 0F | Logical AND with accumulator (absolute)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	LDY #$3F			 ; A0 3F | Load immediate value into Y register
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $511E,X		  ; 1E 1E 51 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1C1
; Address: $F6DF9D
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1C1:
	BVS $A0			  ; 70 A0 | Branch if overflow set
	LDA				  ; BF 8B FB 64 | Load from absolute long,X into accumulator
	CPX #$13			 ; E0 13 | Compare X register (immediate)
	LDA ($79),Y		  ; B1 79 | Load from (zero page),Y into accumulator
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	ORA $A0F2			; 0D F2 A0 | Logical OR with accumulator (absolute)
	CMP ($E0,X)		  ; C1 E0 | Game work RAM access
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	DEC $70			  ; C6 70 | Decrement (zero page)
	ORA ($3E),Y		  ; 11 3E | Logical OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $56E8,X		  ; BC E8 56 | Load from absolute,X into Y register
	STZ $01			  ; 64 01 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $86			  ; 26 86 | Rotate left (zero page)
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $BE40			; EC 40 BE | Compare X register (absolute)
	RTI				  ; 40 | Return from interrupt
	LDX $A458,Y		  ; BE 58 A4 | Load from absolute,Y into X register
	BCS $48			  ; B0 48 | Branch if carry set
	BPL $EE			  ; 10 EE | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BIT $B2EC			; 2C EC B2 | Test bits in accumulator (absolute)
	INC $FEB2,X		  ; FE B2 FE | Increment (absolute,X)
	LDY $FC			  ; A4 FC | Load from zero page into Y register
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ASL $81FE			; 0E FE 81 | Arithmetic shift left (absolute)
	STA $00EF,Y		  ; 99 EF 00 | Store accumulator to absolute,Y
	ADC $651A,X		  ; 7D 1A 65 | Add with carry (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	JMP $457F			; 4C 7F 45 | Jump to address
	BMI $3F			  ; 30 3F | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1C2
; Address: $F6E025
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1C2:
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	ASL $51A0			; 0E A0 51 | Arithmetic shift left (absolute)
	LDA ($2F),Y		  ; B1 2F | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1C5
; Address: $F6E037
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1C5:
	JSR $B1A0			; 20 A0 B1 | Jump to subroutine
	LDA ($AE),Y		  ; B1 AE | Load from (zero page),Y into accumulator
	BNE $4F			  ; D0 4F | Branch if not equal
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1C7
; Address: $F6E048
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1C7:
	JSR $C021			; 20 21 C0 | Jump to subroutine
	CPY #$83			 ; C0 83 | Compare Y register (immediate)
	ORA $0400,Y		  ; 19 00 04 | Logical OR with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1C8
; Address: $F6E060
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1C8:
	JSR $F0C0			; 20 C0 F0 | Jump to subroutine
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BPL $60			  ; 10 60 | Branch if positive
	INX				  ; E8 | Increment X register
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	LDA ($BE),Y		  ; B1 BE | Load from (zero page),Y into accumulator
	LDA ($6B),Y		  ; B1 6B | Load from (zero page),Y into accumulator
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1C9
; Address: $F6E078
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1C9:
	BCC $00			  ; 90 00 | Branch if carry clear
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ASL $CA04,X		  ; 1E 04 CA | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	AND #$D6			 ; 29 D6 | Logical AND with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	ASL $CECA,X		  ; 1E CA CE | Arithmetic shift left (absolute,X)
	SBC $FF16,X		  ; FD 16 FF | Subtract with carry (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1CA
; Address: $F6E0BA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1CA:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BCS $00			  ; B0 00 | Branch if carry set
	BNE $00			  ; D0 00 | Branch if not equal
	INX				  ; E8 | Increment X register
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1CB
; Address: $F6E0D4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1CB:
	JSR $1000			; 20 00 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ADC $651A,X		  ; 7D 1A 65 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1CC
; Address: $F6E0E5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1CC:
	BMI $04			  ; 30 04 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack
	BPL $6E			  ; 10 6E | Branch if positive
	ORA ($33,X)		  ; 01 33 | Logical OR with accumulator ((zero page,X))
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR $7F			  ; 45 7F | Exclusive OR with accumulator (zero page)
	BMI $3F			  ; 30 3F | Branch if negative
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	LSR $337F			; 4E 7F 33 | Logical shift right (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 03 EF 90 | Store accumulator to absolute long,X
	BIT $0887			; 2C 87 08 | Test bits in accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1CD
; Address: $F6E10B
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1CD:
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	STA				  ; 9F 90 2F E8 | Store accumulator to absolute long,X
	CPY $58			  ; C4 58 | Compare Y register (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $F9E6,Y		  ; 19 E6 F9 | Logical OR with accumulator (absolute,Y)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	STX $F1			  ; 86 F1 | Store X register to zero page
	ASL $06F9			; 0E F9 06 | Arithmetic shift left (absolute)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	SBC $472A,X		  ; FD 2A 47 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	WDM #$46			 ; 42 46 | Reserved instruction
	BIT $13BC			; 2C BC 13 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	LDA $E101,Y		  ; B9 01 E1 | Load from absolute,Y into accumulator
	ORA ($BA,X)		  ; 01 BA | Logical OR with accumulator ((zero page,X))
	ORA ($88,X)		  ; 01 88 | Logical OR with accumulator ((zero page,X))
	JMP $C703			; 4C 03 C7 | Jump to address
	BPL $20			  ; 10 20 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1CF
; Address: $F6E16C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1CF:
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $96			  ; 80 96 | Branch always
	BPL $F0			  ; 10 F0 | Branch if positive
	BMI $D0			  ; 30 D0 | Branch if negative

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1D0
; Address: $F6E176
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1D0:
	JSR $60E0			; 20 E0 60 | Jump to subroutine
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack
	ROR $3301			; 6E 01 33 | Rotate right (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	LSR $337D			; 4E 7D 33 | Logical shift right (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA $2E4730		  ; 8F 30 47 2E | Store accumulator to absolute long address
	ADC ($44,X)		  ; 61 44 | Add with carry ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$8F			 ; E0 8F | Compare X register (immediate)
	DEY				  ; 88 | Decrement Y register
	CPY $51			  ; C4 51 | Compare Y register (zero page)
	STA ($63,X)		  ; 81 63 | Store accumulator to (zero page,X)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	PLX				  ; FA | Pull X register from stack
	INC $FC04,X		  ; FE 04 FC | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BMI $F0			  ; 30 F0 | Branch if negative
	ASL $0301			; 0E 01 03 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	ASL $03F1			; 0E F1 03 | Arithmetic shift left (absolute)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $2724			; 0E 24 27 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1D1
; Address: $F6E1E6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1D1:
	JSR $5822			; 20 22 58 | Jump to subroutine
	DEC				  ; 3A | Decrement accumulator
	BIT $177E			; 2C 7E 17 | Test bits in accumulator (absolute)
	BRA $F0			  ; 80 F0 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	CMP $C500,X		  ; DD 00 C5 | Compare accumulator (absolute,X)
	STX $4701			; 8E 01 47 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1D2
; Address: $F6E1FD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1D2:
	BRA $67			  ; 80 67 | Branch always
	STY $82			  ; 84 82 | Store Y register to zero page
	AND $9477,X		  ; 3D 77 94 | Logical AND with accumulator (absolute,X)
	LDA $26			  ; A5 26 | Load from zero page into accumulator
	PHP				  ; 08 | Push processor status to stack
	ORA $1810			; 0D 10 18 | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1D3
; Address: $F6E20B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1D3:
	BVS $E0			  ; 70 E0 | Game work RAM access
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$21			 ; E0 21 | PPU graphics register access
	ROR $1B			  ; 66 1B | Rotate right (zero page)
	STA $1875			; 8D 75 18 | Store accumulator to absolute address
	INX				  ; E8 | Increment X register
	BVS $90			  ; 70 90 | Branch if overflow set
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1D5
; Address: $F6E234
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1D5:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDA ($FA),Y		  ; B1 FA | Load from (zero page),Y into accumulator
	DEC				  ; 3A | Decrement accumulator
	SEI				  ; 78 | Set interrupt disable flag
	BVS $82			  ; 70 82 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEP #$1C			 ; E2 1C | Set processor status bits
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	WDM #$B1			 ; 42 B1 | Reserved instruction
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $01			  ; 80 01 | Branch always
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($1C),Y		  ; 11 1C | Logical OR with accumulator ((zero page),Y)
	ORA $2F06			; 0D 06 2F | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1D6
; Address: $F6E2AA
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1D6:
	ASL $090F,X		  ; 1E 0F 09 | Arithmetic shift left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0502			; 0D 02 05 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ASL $39E0,X		  ; 1E E0 39 | Arithmetic shift left (absolute,X)
	LDX $F9BF,Y		  ; BE BF F9 | Load from absolute,Y into X register
	PEA #$F0E0		   ; F4 E0 F0 | Push effective address to stack
	CMP #$EF			 ; C9 EF | Compare accumulator (immediate)
	BCS $F8			  ; B0 F8 | Branch if carry set
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA $001000		  ; 8F 00 10 00 | Store accumulator to absolute long address
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BVS $30			  ; 70 30 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $B4			  ; 10 B4 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1D7
; Address: $F6E344
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1D7:
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	BPL $1C			  ; 10 1C | Branch if positive
	ASL $2E			  ; 06 2E | Arithmetic shift left (zero page)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BEQ $3C			  ; F0 3C | Branch if equal
	RTI				  ; 40 | Return from interrupt
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BEQ $58			  ; F0 58 | Branch if equal
	NOP				  ; EA | No operation
	INC $F8FE,X		  ; FE FE F8 | Increment (absolute,X)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CMP ($E1,X)		  ; C1 E1 | Compare accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	INC $F8F0,X		  ; FE F0 F8 | Increment (absolute,X)
	ORA $81			  ; 05 81 | Logical OR with accumulator (zero page)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STZ $8000,X		  ; 9E 00 80 | Store zero to absolute,X
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	ASL $EEEC			; 0E EC EE | Arithmetic shift left (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	BRA $00			  ; 80 00 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1D8
; Address: $F6E3E6
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1D8:
	ORA $070F			; 0D 0F 07 | Logical OR with accumulator (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ROL $0EC0,X		  ; 3E C0 0E | Rotate left (absolute,X)
	BEQ $06			  ; F0 06 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	CPX $99			  ; E4 99 | Compare X register (zero page)
	CMP ($7E,X)		  ; C1 7E | Compare accumulator ((zero page,X))
	AND $1A			  ; 25 1A | Logical AND with accumulator (zero page)
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	INY				  ; C8 | Increment Y register
	SBC ($3F),Y		  ; F1 3F | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1D9
; Address: $F6E410
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1D9:
	JSL $197903		  ; 22 03 79 19 | Jump to subroutine long
	LDX $3F			  ; A6 3F | Load from zero page into X register
	REP #$1F			 ; C2 1F | Reset processor status bits
	SED				  ; F8 | Set decimal mode flag
	BIT $07			  ; 24 07 | Test bits in accumulator (zero page)
	BVS $0F			  ; 70 0F | Branch if overflow set
	LDA				  ; BF 00 00 C0 | Load from absolute long,X into accumulator
	BRA $58			  ; 80 58 | Branch always
	LDY $DC20,X		  ; BC 20 DC | Load from absolute,X into Y register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1DA
; Address: $F6E42E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1DA:
	JSR $40DC			; 20 DC 40 | Jump to subroutine
	CPY #$58			 ; C0 58 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	LDY $BC			  ; A4 BC | Load from zero page into Y register
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1DB
; Address: $F6E43A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1DB:
	JSR $18E0			; 20 E0 18 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1A04,X		  ; 1D 04 1A | Logical OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $1F			  ; 10 1F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ASL $0C0C,X		  ; 1E 0C 0C | Arithmetic shift left (absolute,X)
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	BPL $E8			  ; 10 E8 | Branch if positive
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1DD
; Address: $F6E478
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1DD:
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	BCC $F0			  ; 90 F0 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1DF
; Address: $F6E486
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1DF:
	PLX				  ; FA | Pull X register from stack
	SBC $03FC,X		  ; FD FC 03 | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	INC $CE70,X		  ; FE 70 CE | Increment (absolute,X)
	STY $2473			; 8C 73 24 | Store Y register to absolute address
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	STX $18			  ; 86 18 | Store X register to zero page
	CLC				  ; 18 | Clear carry flag
	BCS $80			  ; B0 80 | Branch if carry set
	DEC $033E			; CE 3E 03 | Decrement (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BNE $C0			  ; D0 C0 | Branch if not equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $20			  ; 80 20 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $F0			  ; 10 F0 | Branch if positive
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1E0
; Address: $F6E4DD
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1E0:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $08			  ; 80 08 | Branch always
	ORA $1A04,X		  ; 1D 04 1A | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $1F			  ; 10 1F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ASL $0C0C,X		  ; 1E 0C 0C | Arithmetic shift left (absolute,X)
	INC $F8FF,X		  ; FE FF F8 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA ($B1,X)		  ; 81 B1 | Store accumulator to (zero page,X)
	STA				  ; 9F FF 3F FF | Store accumulator to absolute long,X
	BVS $CF			  ; 70 CF | Branch if overflow set

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1E1
; Address: $F6E528
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1E1:
	STY $2473			; 8C 73 24 | Store Y register to absolute address
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	WDM #$0C			 ; 42 0C | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	CPY $033C			; CC 3C 03 | Compare Y register (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $F0			  ; 10 F0 | Branch if positive
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1E2
; Address: $F6E55D
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1E2:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($E1,X)		  ; 01 E1 | Logical OR with accumulator ((zero page,X))
	SBC ($F9,X)		  ; E1 F9 | Subtract with carry ((zero page,X))
	SBC $FDFD,Y		  ; F9 FD FD | Subtract with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	SBC $FD06,Y		  ; F9 06 FD | Subtract with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	PEA #$E8D9		   ; F4 D9 E8 | Push effective address to stack
	LDX $7DFF,Y		  ; BE FF 7D | Load from absolute,Y into X register
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	INC $E30E			; EE 0E E3 | Increment (absolute)
	LDA				  ; BF 00 FF 04 | Load from absolute long,X into accumulator
	BPL $2C			  ; 10 2C | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1E4
; Address: $F6E5A7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1E4:
	BVS $80			  ; 70 80 | Branch if overflow set
	BNE $D0			  ; D0 D0 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	INX				  ; E8 | Increment X register
	BEQ $24			  ; F0 24 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1E5
; Address: $F6E5B6
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1E5:
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	BMI $44			  ; 30 44 | Branch if negative
	SEC				  ; 38 | Set carry flag
	INC $FB04,X		  ; FE 04 FB | Increment (absolute,X)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ORA $F7F8,X		  ; 1D F8 F7 | Logical OR with accumulator (absolute,X)
	ASL $010F			; 0E 0F 01 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	ROR $99			  ; 66 99 | Rotate right (zero page)
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1E6
; Address: $F6E650
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1E6:
	INC $F808,X		  ; FE 08 F8 | Increment (absolute,X)
	BMI $47			  ; 30 47 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	STZ $60FC			; 9C FC 60 | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1E8
; Address: $F6E663
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1E8:
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	PEA #$FBFC		   ; F4 FC FB | Push effective address to stack
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	ROL $26			  ; 26 26 | Rotate left (zero page)
	REP #$C2			 ; C2 C2 | Reset processor status bits
	ROL $FF3E,X		  ; 3E 3E FF | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1E9
; Address: $F6E6CF
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1E9:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $83			  ; 70 83 | Branch if overflow set
	ORA ($7D,X)		  ; 01 7D | Logical OR with accumulator ((zero page,X))
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	INC $F900,X		  ; FE 00 F9 | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	JMP $4400			; 4C 00 44 | Jump to address
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	BPL $E0			  ; 10 E0 | Game work RAM access
	BCC $E0			  ; 90 E0 | Game work RAM access
	BCC $F0			  ; 90 F0 | Branch if carry clear
	CPY #$30			 ; C0 30 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1EA
; Address: $F6E70D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1EA:
	JSR $2098			; 20 98 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPX #$60			 ; E0 60 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1EC
; Address: $F6E71A
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1EC:
	JSR $C020			; 20 20 C0 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	STZ $7FFE,X		  ; 9E FE 7F | Store zero to absolute,X
	ADC $651A,X		  ; 7D 1A 65 | Add with carry (absolute,X)
	BMI $04			  ; 30 04 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack
	JMP $457F			; 4C 7F 45 | Jump to address
	BMI $3F			  ; 30 3F | Branch if negative
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	STA $018F07		  ; 8F 07 8F 01 | Store accumulator to absolute long address
	STY $87			  ; 84 87 | Store Y register to zero page
	STY $27			  ; 84 27 | Store Y register to zero page
	CPX $4F			  ; E4 4F | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	STA $888F88		  ; 8F 88 8F 88 | Store accumulator to absolute long address
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1ED
; Address: $F6E788
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1ED:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1EE
; Address: $F6E7A1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1EE:
	JSR $104C			; 20 4C 10 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	BIT $30			  ; 24 30 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1EF
; Address: $F6E7A8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1EF:
	JSL $1C1E30		  ; 22 30 1E 1C | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	BVS $00			  ; 70 00 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1F0
; Address: $F6E7B5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1F0:
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ADC $67			  ; 65 67 | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1F3
; Address: $F6E803
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1F3:
	PHP				  ; 08 | Push processor status to stack
	BPL $07			  ; 10 07 | Branch if positive
	BPL $0F			  ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1F4
; Address: $F6E809
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1F4:
	JSR $200F			; 20 0F 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1F5
; Address: $F6E814
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1F5:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1F6
; Address: $F6E81C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1F6:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1F8
; Address: $F6E825
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1F8:
	JSR $30A0			; 20 A0 30 | Jump to subroutine
	BNE $18			  ; D0 18 | Branch if not equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BCC $02			  ; 90 02 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1F9
; Address: $F6E838
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1F9:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1FA
; Address: $F6E847
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1FA:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL $1C3E,X		  ; 3E 3E 1C | Rotate left (absolute,X)
	AND $413F,Y		  ; 39 3F 41 | Logical AND with accumulator (absolute,Y)
	ROL $1C3E,X		  ; 3E 3E 1C | Rotate left (absolute,X)
	STX $0E8E			; 8E 8E 0E | Store X register to absolute address
	ASL $0404			; 0E 04 04 | Arithmetic shift left (absolute)
	ROR $3602			; 6E 02 36 | Rotate right (absolute)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $367D			; 4E 7D 36 | Logical shift right (absolute)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVC $7F			  ; 50 7F | Branch if overflow clear
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	BNE $F0			  ; D0 F0 | Branch if not equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1FB
; Address: $F6E8D1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1FB:
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BEQ $2F			  ; F0 2F | Branch if equal
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1FC
; Address: $F6E8E0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1FC:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1FD
; Address: $F6E8EA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1FD:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SBC $FE01,X		  ; FD 01 FE | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $3B13,X		  ; 1D 13 3B | Logical OR with accumulator (absolute,X)
	ROL $2726			; 2E 26 27 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1FE
; Address: $F6E908
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1FE:
	JSL $BB9923		  ; 22 23 99 BB | Jump to subroutine long
	CPX $77FE			; EC FE 77 | Compare X register (absolute)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	CPY #$84			 ; C0 84 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	DEC $6701			; CE 01 67 | Decrement (absolute)
	BRA $04			  ; 80 04 | Branch always
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_1FF
; Address: $F6E925
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_1FF:
	CPX $C1			  ; E4 C1 | Compare X register (zero page)
	ROL $F6F9,X		  ; 3E F9 F6 | Rotate left (absolute,X)
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_200
; Address: $F6E92E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_200:
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	INC $7F0B,X		  ; FE 0B 7F | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_201
; Address: $F6E936
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_201:
	BMI $3F			  ; 30 3F | Branch if negative
	BMI $0F			  ; 30 0F | Branch if negative
	LDA				  ; BF 43 7C 84 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BEQ $80			  ; F0 80 | Branch if equal
	BVS $80			  ; 70 80 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_203
; Address: $F6E94A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_203:
	BRA $70			  ; 80 70 | Branch always
	RTI				  ; 40 | Return from interrupt
	BCS $00			  ; B0 00 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_204
; Address: $F6E950
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_204:
	BCC $F0			  ; 90 F0 | Branch if carry clear
	BPL $F0			  ; 10 F0 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_205
; Address: $F6E955
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_205:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $60			  ; 80 60 | Branch always
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $90			  ; F0 90 | Branch if equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_207
; Address: $F6E965
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_207:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $1C09			; 0E 09 1C | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_208
; Address: $F6E990
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_208:
	JSR $701F			; 20 1F 70 | Jump to subroutine
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	SBC ($F3),Y		  ; F1 F3 | Subtract with carry ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BEQ $86			  ; F0 86 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	ASL $06E0,X		  ; 1E E0 06 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $C0			  ; 80 C0 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEP #$E2			 ; E2 E2 | Set processor status bits
	SEP #$E2			 ; E2 E2 | Set processor status bits
	STX $FE			  ; 86 FE | Store X register to zero page
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	BPL $30			  ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_209
; Address: $F6EA4A
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_209:
	BMI $70			  ; 30 70 | Branch if negative
	JMP $1F7F3D		  ; 5C 3D 7F 1F | Jump to address long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	BEQ $38			  ; F0 38 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	LSR $C0FE,X		  ; 5E FE C0 | Logical shift right (absolute,X)
	LDA				  ; BF C0 BF C0 | Load from absolute long,X into accumulator
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BVS $0F			  ; 70 0F | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	INC $0081,X		  ; FE 81 00 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	DEC				  ; 3A | Decrement accumulator
	ROL $7D7B,X		  ; 3E 7B 7D | Rotate left (absolute,X)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BNE $F0			  ; D0 F0 | Branch if not equal
	CPY $21			  ; C4 21 | PPU graphics register access
	CMP ($38,X)		  ; C1 38 | Compare accumulator ((zero page,X))
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $E7			  ; 80 E7 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ASL $0604			; 0E 04 06 | Arithmetic shift left (absolute)
	LSR $60E0,X		  ; 5E E0 60 | Logical shift right (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_20A
; Address: $F6EADE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_20A:
	JSR $0080			; 20 80 00 | Jump to subroutine
	ORA $101D			; 0D 1D 10 | Logical OR with accumulator (absolute)
	BMI $18			  ; 30 18 | Branch if negative
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BMI $70			  ; 30 70 | Branch if negative
	BMI $70			  ; 30 70 | Branch if negative
	BMI $70			  ; 30 70 | Branch if negative

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_20B
; Address: $F6EB08
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_20B:
	BMI $70			  ; 30 70 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BVS $4F			  ; 70 4F | Branch if overflow set
	BVS $4F			  ; 70 4F | Branch if overflow set
	BVS $4F			  ; 70 4F | Branch if overflow set
	BVS $4F			  ; 70 4F | Branch if overflow set
	JMP $00FF			; 4C FF 00 | Jump to address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	BEQ $F4			  ; F0 F4 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$FAF8		   ; F4 F8 FA | Push effective address to stack
	PLX				  ; FA | Pull X register from stack
	SBC $FAF6,X		  ; FD F6 FA | Subtract with carry (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	REP #$C2			 ; C2 C2 | Reset processor status bits
	REP #$C2			 ; C2 C2 | Reset processor status bits
	DEC $0ECE			; CE CE 0E | Decrement (absolute)
	ASL $0E0E			; 0E 0E 0E | Arithmetic shift left (absolute)
	ORA $1A04,X		  ; 1D 04 1A | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ASL $0C0C,X		  ; 1E 0C 0C | Arithmetic shift left (absolute,X)
	STA $FFC3FF		  ; 8F FF C3 FF | Store accumulator to absolute long address
	TYA				  ; 98 | Transfer Y register to accumulator
	BMI $C8			  ; 30 C8 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_20D
; Address: $F6EC13
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_20D:
	BPL $FF			  ; 10 FF | Branch if positive
	STY $FF67			; 8C 67 FF | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	BCC $F0			  ; 90 F0 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_20F
; Address: $F6EC2B
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_20F:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BNE $DC			  ; D0 DC | Branch if not equal
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	STA				  ; 9F FF 70 CF | Store accumulator to absolute long,X
	STY $2473			; 8C 73 24 | Store Y register to absolute address
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	LDY #$03			 ; A0 03 | Load immediate value into Y register
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	CPY $03BC			; CC BC 03 | Compare Y register (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	EOR #$7C			 ; 49 7C | Exclusive OR with accumulator (immediate)
	INC $ECFC,X		  ; FE FC EC | Increment (absolute,X)
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $82			  ; 80 82 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $F0			  ; 10 F0 | Branch if positive
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_210
; Address: $F6EC7D
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_210:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $2E			  ; 80 2E | Branch always
	ASL $0F3F,X		  ; 1E 3F 0F | Arithmetic shift left (absolute,X)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA $0600			; 0D 00 06 | Logical OR with accumulator (absolute)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $CC7F,X		  ; 1E 7F CC | Arithmetic shift left (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $19			  ; E6 19 | Increment (zero page)
	STY $0073			; 8C 73 00 | Store Y register to absolute address
	LDY $1800,X		  ; BC 00 18 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_212
; Address: $F6ECB3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_212:
	JSR $18FF			; 20 FF 18 | Jump to subroutine
	INC $19			  ; E6 19 | Increment (zero page)
	LDY $BC			  ; A4 BC | Load from zero page into Y register
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_214
; Address: $F6ECE8
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_214:
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPY $0133			; CC 33 01 | Compare Y register (absolute)
	ASL $0100,X		  ; 1E 00 01 | Arithmetic shift left (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BMI $2F			  ; 30 2F | Branch if negative
	ASL $011F,X		  ; 1E 1F 01 | Arithmetic shift left (absolute,X)
	ORA ($E3,X)		  ; 01 E3 | Logical OR with accumulator ((zero page,X))
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	STA ($E1,X)		  ; 81 E1 | Store accumulator to (zero page,X)
	BRA $7F			  ; 80 7F | Branch always
	STZ $DF20			; 9C 20 DF | Store zero to absolute
	BRA $02			  ; 80 02 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA $CEFF,Y		  ; 99 FF CE | Store accumulator to absolute,Y
	CPY $74A2			; CC A2 74 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $30			  ; 80 30 | Branch always
	DEY				  ; 88 | Decrement Y register
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_215
; Address: $F6ED8E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_215:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR $BBEC			; 4D EC BB | Exclusive OR with accumulator (absolute)
	JMP $000000		  ; 5C 00 00 00 | Jump to address long
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BMI $01			  ; 30 01 | Branch if negative
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_216
; Address: $F6EDC0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_216:
	CLC				  ; 18 | Clear carry flag
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $EB			  ; 10 EB | Branch if positive
	LDA $916E			; AD 6E 91 | Load from absolute address into accumulator
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	STA $FB6A,X		  ; 9D 6A FB | Store accumulator to absolute,X
	BIT $81FF			; 2C FF 81 | Test bits in accumulator (absolute)
	REP #$FE			 ; C2 FE | Reset processor status bits
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_217
; Address: $F6EDEC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_217:
	JSR $40E0			; 20 E0 40 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $3738			; 0E 38 37 | Arithmetic shift left (absolute)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_218
; Address: $F6EE04
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_218:
	JSL $FF007F		  ; 22 7F 00 FF | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	CPY $F20E			; CC 0E F2 | Compare Y register (absolute)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	BCS $D8			  ; B0 D8 | Branch if carry set
	CPY #$84			 ; C0 84 | Compare Y register (immediate)
	BEQ $54			  ; F0 54 | Branch if equal
	ASL $DEDC			; 0E DC DE | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_21A
; Address: $F6EE50
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_21A:
	JSR $7800			; 20 00 78 | Jump to subroutine
	TAY				  ; A8 | Transfer accumulator to Y register
	INY				  ; C8 | Increment Y register
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_21B
; Address: $F6EE5A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_21B:
	JSR $7C00			; 20 00 7C | Jump to subroutine
	LDY $0300,X		  ; BC 00 03 | Load from absolute,X into Y register
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	STY $048C			; 8C 8C 04 | Store Y register to absolute address
	INC $8EFE,X		  ; FE FE 8E | Increment (absolute,X)
	STX $0000			; 8E 00 00 | Store X register to absolute address
	ASL $002E			; 0E 2E 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_21C
; Address: $F6EEA3
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_21C:
	JSR $1909			; 20 09 19 | Jump to subroutine
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BMI $21			  ; 30 21 | PPU graphics register access
	SEC				  ; 38 | Set carry flag
	ORA $1F16,Y		  ; 19 16 1F | Logical OR with accumulator (absolute,Y)
	BPL $0F			  ; 10 0F | Branch if positive
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC $D9			  ; E6 D9 | Increment (zero page)
	SBC $F281,X		  ; FD 81 F2 | Subtract with carry (absolute,X)
	BRA $E1			  ; 80 E1 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	SBC ($61,X)		  ; E1 61 | Subtract with carry ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $0E06			; 0E 06 0E | Arithmetic shift left (absolute)
	ASL $0E09			; 0E 09 0E | Arithmetic shift left (absolute)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $80			  ; 10 80 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	STA $DFDF8F		  ; 8F 8F DF DF | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_21D
; Address: $F6EF79
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_21D:
	SED				  ; F8 | Set decimal mode flag
	STA $20DF70		  ; 8F 70 DF 20 | Store accumulator to absolute long address
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_21E
; Address: $F6EF83
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_21E:
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	BEQ $E8			  ; F0 E8 | Branch if equal
	BEQ $C8			  ; F0 C8 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_220
; Address: $F6EFC7
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_220:
	BVS $80			  ; 70 80 | Branch if overflow set
	BNE $D0			  ; D0 D0 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	INX				  ; E8 | Increment X register
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_221
; Address: $F6EFF6
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_221:
	JMP ($6C7C)		  ; 6C 7C 6C | Jump to address (absolute indirect)
	JMP ($7C7C)		  ; 6C 7C 7C | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	JMP ($6C7C)		  ; 6C 7C 6C | Jump to address (absolute indirect)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_222
; Address: $F6F03F
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_222:
	SEC				  ; 38 | Set carry flag
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F F0 FF F8 | Store accumulator to absolute long,X
	STZ $6F80			; 9C 80 6F | Store zero to absolute
	STX $9F			  ; 86 9F | Store X register to zero page
	BPL $FF			  ; 10 FF | Branch if positive
	STA				  ; 9F 60 FF 08 | Store accumulator to absolute long,X
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ADC #$EF			 ; 69 EF | Add with carry (immediate)
	STX $86			  ; 86 86 | Store X register to zero page
	BRA $FF			  ; 80 FF | Branch always
	BRA $7F			  ; 80 7F | Branch always
	ORA ($8E,X)		  ; 01 8E | Logical OR with accumulator ((zero page,X))
	BEQ $8E			  ; F0 8E | Branch if equal
	STX $0000			; 8E 00 00 | Store X register to absolute address
	ROL $18FF,X		  ; 3E FF 18 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	REP #$3D			 ; C2 3D | Reset processor status bits
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	STZ $30EC			; 9C EC 30 | Store zero to absolute
	BEQ $0F			  ; F0 0F | Branch if equal
	STA $02FA89		  ; 8F 89 FA 02 | Store accumulator to absolute long address
	DEC $39			  ; C6 39 | Decrement (zero page)
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_223
; Address: $F6F101
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_223:
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	STX $7E8C			; 8E 8C 7E | Store X register to absolute address
	CPY $E8			  ; C4 E8 | Compare Y register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_224
; Address: $F6F140
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_224:
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	JMP $447C			; 4C 7C 44 | Jump to address
	JMP ($387C)		  ; 6C 7C 38 | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	JMP ($6C7C)		  ; 6C 7C 6C | Jump to address (absolute indirect)
	JMP ($4C7C)		  ; 6C 7C 4C | Jump to address (absolute indirect)
	ROR $CF7E,X		  ; 7E 7E CF | Rotate right (absolute,X)
	ROR $3C7E,X		  ; 7E 7E 3C | Rotate right (absolute,X)
	LSR $877E			; 4E 7E 87 | Logical shift right (absolute)
	CMP $FDFF			; CD FF FD | Compare accumulator (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ROR $3C3C,X		  ; 7E 3C 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $3C2C			; 2C 2C 3C | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_225
; Address: $F6F1BB
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_225:
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $3E01,Y		  ; 19 01 3E | Logical OR with accumulator (absolute,Y)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $2619,Y		  ; 19 19 26 | Logical OR with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $0000,X		  ; BC 00 00 | Load from absolute,X into Y register
	BRA $40			  ; 80 40 | Branch always
	CPY #$58			 ; C0 58 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	LDY $BC			  ; A4 BC | Load from zero page into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	AND $3D40,Y		  ; 39 40 3D | Logical AND with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND ($09),Y		  ; 31 09 | Logical AND with accumulator ((zero page),Y)
	ADC $7D05,Y		  ; 79 05 7D | Add with carry (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_226
; Address: $F6F224
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_226:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$86			 ; C0 86 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	STA ($4E,X)		  ; 81 4E | Store accumulator to (zero page,X)
	BIT #$56			 ; 89 56 | Test bits in accumulator (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	DEC $48			  ; C6 48 | Decrement (zero page)
	BVC $DF			  ; 50 DF | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	JMP ($387C)		  ; 6C 7C 38 | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_227
; Address: $F6F262
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_227:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $7E6E			; 6E 6E 7E | Rotate right (absolute)
	ROR $3C3C,X		  ; 7E 3C 3C | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $463C			; 2C 3C 46 | Test bits in accumulator (absolute)
	ROR $7E6E,X		  ; 7E 6E 7E | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	AND $1A			  ; 25 1A | Logical AND with accumulator (zero page)
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_228
; Address: $F6F2A0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_228:
	JSR $E0DC			; 20 DC E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_229
; Address: $F6F2A8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_229:
	JSR $10DC			; 20 DC 10 | Jump to subroutine
	BIT $1800			; 2C 00 18 | Test bits in accumulator (absolute)
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_22A
; Address: $F6F2B4
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_22A:
	JSR $18E0			; 20 E0 18 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $0632			; 0D 32 06 | Logical OR with accumulator (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $F0			  ; 66 F0 | Rotate right (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_22B
; Address: $F6F2E4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_22B:
	JSR $20D0			; 20 D0 20 | Jump to subroutine
	BNE $3E			  ; D0 3E | Branch if not equal
	CPY #$09			 ; C0 09 | Compare Y register (immediate)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL $66			  ; 06 66 | Arithmetic shift left (zero page)
	INC $F808,X		  ; FE 08 F8 | Increment (absolute,X)
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $F0			  ; 10 F0 | Branch if positive
	INC $FFF0,X		  ; FE F0 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_22C
; Address: $F6F2FC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_22C:
	PHP				  ; 08 | Push processor status to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	INC $F448,X		  ; FE 48 F4 | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	BEQ $D0			  ; F0 D0 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$FE			 ; E0 FE | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_22D
; Address: $F6F311
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_22D:
	JSL $E004E4		  ; 22 E4 04 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BPL $2C			  ; 10 2C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $A1			  ; 10 A1 | Branch if positive
	SBC ($8C,X)		  ; E1 8C | Subtract with carry ((zero page,X))
	STX $00D0			; 8E D0 00 | Store X register to absolute address
	ASL $3200,X		  ; 1E 00 32 | Arithmetic shift left (absolute,X)
	BIT $000C			; 2C 0C 00 | Test bits in accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVS $40			  ; 70 40 | Branch if overflow set
	JMP $000050		  ; 5C 50 00 00 | Jump to address long
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	BEQ $3F			  ; F0 3F | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	BCC $80			  ; 90 80 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $88			  ; 90 88 | Branch if carry clear
	BRA $E0			  ; 80 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_22E
; Address: $F6F3D1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_22E:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BCC $60			  ; 90 60 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_22F
; Address: $F6F3E6
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_22F:
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	PHY				  ; 5A | Push Y register to stack
	ROR $0018,X		  ; 7E 18 00 | Rotate right (absolute,X)
	LDA $42			  ; A5 42 | Hardware register operation
	PHY				  ; 5A | Push Y register to stack
	ROR $0081,X		  ; 7E 81 00 | Rotate right (absolute,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	PHY				  ; 5A | Push Y register to stack
	CLC				  ; 18 | Clear carry flag
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_230
; Address: $F6F423
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_230:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BPL $C0			  ; 10 C0 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_231
; Address: $F6F436
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_231:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	LDY $2EB2			; AC B2 2E | Load from absolute address into Y register
	BMI $D3			  ; 30 D3 | Branch if negative
	ASL $0DEC,X		  ; 1E EC 0D | Arithmetic shift left (absolute,X)
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	ORA #$E2			 ; 09 E2 | Logical OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	CPY $E00C			; CC 0C E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA #$15			 ; 09 15 | Logical OR with accumulator (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $933C,X		  ; 1E 3C 93 | Arithmetic shift left (absolute,X)
	ASL $33AD,X		  ; 1E AD 33 | Arithmetic shift left (absolute,X)
	BPL $A1			  ; 10 A1 | Branch if positive
	SBC ($8C,X)		  ; E1 8C | Subtract with carry ((zero page,X))
	EOR ($2D),Y		  ; 51 2D | Exclusive OR with accumulator ((zero page),Y)
	LDA $C033			; AD 33 C0 | Load from absolute address into accumulator
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY $5E00			; CC 00 5E | Compare Y register (absolute)
	LDY $8C0C			; AC 0C 8C | Load from absolute address into Y register
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_232
; Address: $F6F49F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_232:
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	CPY $80			  ; C4 80 | Compare Y register (zero page)
	PLB				  ; AB | Pull data bank register from stack
	CPY #$BC			 ; C0 BC | Compare Y register (immediate)
	CPY $F839			; CC 39 F8 | Compare Y register (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_233
; Address: $F6F4CF
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_233:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	PHY				  ; 5A | Push Y register to stack
	ROR $0018,X		  ; 7E 18 00 | Rotate right (absolute,X)
	LDA $42			  ; A5 42 | Hardware register operation
	PHY				  ; 5A | Push Y register to stack
	ROR $FF81,X		  ; 7E 81 FF | Rotate right (absolute,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	PHY				  ; 5A | Push Y register to stack
	CLC				  ; 18 | Clear carry flag
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $E0			  ; 30 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_234
; Address: $F6F534
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_234:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_235
; Address: $F6F560
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_235:
	CPY $E4C8			; CC C8 E4 | Compare Y register (absolute)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BEQ $E8			  ; F0 E8 | Branch if equal
	BEQ $D0			  ; F0 D0 | Branch if equal

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_236
; Address: $F6F571
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_236:
	JSR $10E8			; 20 E8 10 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	STY $1B			  ; 84 1B | Store Y register to zero page
	STY $0C11			; 8C 11 0C | Store Y register to absolute address
	STA $00			  ; 85 00 | Store accumulator to zero page
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	DEY				  ; 88 | Decrement Y register
	BRA $84			  ; 80 84 | Branch always
	BRA $0C			  ; 80 0C | Branch always
	ASL $85			  ; 06 85 | Arithmetic shift left (zero page)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BMI $E0			  ; 30 E0 | Game work RAM access
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	BMI $28			  ; 30 28 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	BPL $E8			  ; 10 E8 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_237
; Address: $F6F5C9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_237:
	JSR $21C8			; 20 C8 21 | PPU graphics register access
	INY				  ; C8 | Increment Y register
	ADC ($44,X)		  ; 61 44 | Add with carry ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_238
; Address: $F6F5D2
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_238:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BPL $60			  ; 10 60 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	ADC ($21),Y		  ; 71 21 | PPU graphics register access
	CLD				  ; D8 | Clear decimal mode flag
	LDY #$CD			 ; A0 CD | Load immediate value into Y register
	ASL $1F9F			; 0E 9F 1F | Arithmetic shift left (absolute)
	ASL $38FE,X		  ; 1E FE 38 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL $9F30			; 2E 30 9F | Rotate left (absolute)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_239
; Address: $F6F5F5
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_239:
	BRA $FE			  ; 80 FE | Branch always
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	BRA $7F			  ; 80 7F | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	BPL $80			  ; 10 80 | Branch if positive
	BCC $50			  ; 90 50 | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $04			  ; F0 04 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	TXS				  ; 9A | Transfer X register to stack pointer
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	LDA $1ED331		  ; AF 31 D3 1E | Load from absolute long address into accumulator
	CPX $F70D			; EC 0D F7 | Compare X register (absolute)
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	ORA #$E2			 ; 09 E2 | Logical OR with accumulator (immediate)
	CPY $0F2F			; CC 2F 0F | Compare Y register (absolute)
	STA				  ; 9F CC 0C E0 | Store accumulator to absolute long,X
	PHP				  ; 08 | Push processor status to stack
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA #$15			 ; 09 15 | Logical OR with accumulator (immediate)
	BMI $9F			  ; 30 9F | Branch if negative
	CPX #$E5			 ; E0 E5 | Compare X register (immediate)
	SBC $F3C3			; ED C3 F3 | Subtract with carry (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $C3			  ; 46 C3 | Logical shift right (zero page)
	STX $C3			  ; 86 C3 | Store X register to zero page
	STX $C3			  ; 86 C3 | Store X register to zero page
	BMI $00			  ; 30 00 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ORA ($BB,X)		  ; 01 BB | Logical OR with accumulator ((zero page,X))
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_23B
; Address: $F6F689
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_23B:
	STY $8F12			; 8C 12 8F | Store Y register to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STY $80			  ; 84 80 | Store Y register to zero page
	STA $050285		  ; 8F 85 02 05 | Store accumulator to absolute long address
	STY $7E			  ; 84 7E | Store Y register to zero page
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	ROR $3CBD,X		  ; 7E BD 3C | Rotate right (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	LDA $BD			  ; A5 BD | Load from zero page into accumulator
	PHY				  ; 5A | Push Y register to stack
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	BMI $28			  ; 30 28 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	BPL $A8			  ; 10 A8 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_23C
; Address: $F6F6C7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_23C:
	JSR $20C8			; 20 C8 20 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	SBC ($44,X)		  ; E1 44 | Subtract with carry ((zero page,X))
	EOR ($C4,X)		  ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_23D
; Address: $F6F6D5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_23D:
	BPL $50			  ; 10 50 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	SBC ($A1),Y		  ; F1 A1 | Subtract with carry ((zero page),Y)
	EOR $D8A1,Y		  ; 59 A1 D8 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_23E
; Address: $F6F6DF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_23E:
	JSR $0709			; 20 09 07 | Jump to subroutine
	BPL $0F			  ; 10 0F | Branch if positive
	AND ($0E),Y		  ; 31 0E | Logical AND with accumulator ((zero page),Y)
	AND ($0E),Y		  ; 31 0E | Logical AND with accumulator ((zero page),Y)
	ORA $0402,X		  ; 1D 02 04 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0F00			; 0E 00 0F | Arithmetic shift left (absolute)
	BCC $E0			  ; 90 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_23F
; Address: $F6F702
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_23F:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	STX $5E2E			; 8E 2E 5E | Store X register to absolute address
	INC $FF			  ; E6 FF | Increment (zero page)
	EOR $10FD			; 4D FD 10 | Exclusive OR with accumulator (absolute)
	BEQ $20			  ; F0 20 | Branch if equal
	CPX #$86			 ; E0 86 | Compare X register (immediate)
	STA ($46,X)		  ; 81 46 | Store accumulator to (zero page,X)
	CMP ($57,X)		  ; C1 57 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_240
; Address: $F6F735
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_240:
	BRA $67			  ; 80 67 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SBC $F002,X		  ; FD 02 F0 | Subtract with carry (absolute,X)
	LDA $FFDFE0		  ; AF E0 DF FF | Load from absolute long address into accumulator
	ROR $7EBD,X		  ; 7E BD 7E | Rotate right (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	LDA $DB80,X		  ; BD 80 DB | Load from absolute,X into accumulator
	CMP ($E7,X)		  ; C1 E7 | Compare accumulator ((zero page,X))
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	LDA $24BD,X		  ; BD BD 24 | Load from absolute,X into accumulator
	LDA $DB5A,X		  ; BD 5A DB | Load from absolute,X into accumulator
	LDA $DB7E,X		  ; BD 7E DB | Load from absolute,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ROR $4281,X		  ; 7E 81 42 | Hardware register operation
	JMP $908D			; 4C 8D 90 | Jump to address
	TXS				  ; 9A | Transfer X register to stack pointer
	PLB				  ; AB | Pull data bank register from stack
	STY $A6			  ; 84 A6 | Store Y register to zero page
	BRA $82			  ; 80 82 | Branch always
	LDY $17FE			; AC FE 17 | Load from absolute address into Y register
	BVS $80			  ; 70 80 | Branch if overflow set
	LDX $9440			; AE 40 94 | Load from absolute address into X register
	RTI				  ; 40 | Return from interrupt
	CMP $FD00,Y		  ; D9 00 FD | Compare accumulator (absolute,Y)
	STX $4701			; 8E 01 47 | Store X register to absolute address
	BRA $67			  ; 80 67 | Branch always
	STY $E3			  ; 84 E3 | Store Y register to zero page
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	LDY $FE			  ; A4 FE | Load from zero page into Y register
	XBA				  ; EB | Exchange accumulator bytes
	STA $F50A			; 8D 0A F5 | Store accumulator to absolute address
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	REP #$5A			 ; C2 5A | Reset processor status bits
	CMP ($7F,X)		  ; C1 7F | Compare accumulator ((zero page,X))
	STA $FF			  ; 85 FF | Store accumulator to zero page
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ROL $7CFF,X		  ; 3E FF 7C | Rotate left (absolute,X)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_241
; Address: $F6F7F4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_241:
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SBC $F904,X		  ; FD 04 F9 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	BVC $0B			  ; 50 0B | Branch if overflow clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_242
; Address: $F6F80E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_242:
	JSR $0AF0			; 20 F0 0A | Jump to subroutine
	ORA ($46,X)		  ; 01 46 | Logical OR with accumulator ((zero page,X))
	CPX $EB07			; EC 07 EB | Compare X register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $D0			  ; 10 D0 | Branch if positive
	BRA $67			  ; 80 67 | Branch always
	ROR $99			  ; 66 99 | Rotate right (zero page)
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_243
; Address: $F6F834
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_243:
	CLC				  ; 18 | Clear carry flag
	STZ $60FC			; 9C FC 60 | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_244
; Address: $F6F841
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_244:
	PHB				  ; 8B | Push data bank register to stack
	AND #$59			 ; 29 59 | Logical AND with accumulator (immediate)
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$83			 ; E0 83 | Compare X register (immediate)
	STY $41			  ; 84 41 | Store Y register to zero page
	DEC $57			  ; C6 57 | Decrement (zero page)
	BRA $67			  ; 80 67 | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	STA $E701,Y		  ; 99 01 E7 | Store accumulator to absolute,Y
	DEC $FE			  ; C6 FE | Decrement (zero page)
	STA $E77E,Y		  ; 99 7E E7 | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	INC $1C01,X		  ; FE 01 1C | Increment (absolute,X)
	REP #$CC			 ; C2 CC | Reset processor status bits
	STA $1A90			; 8D 90 1A | Store accumulator to absolute address
	ROL $00			  ; 26 00 | Rotate left (zero page)
	BIT $177E			; 2C 7E 17 | Test bits in accumulator (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	LDX $1440			; AE 40 14 | Load from absolute address into X register
	CPY #$59			 ; C0 59 | Compare Y register (immediate)
	BRA $7D			  ; 80 7D | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_245
; Address: $F6F899
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_245:
	BRA $0E			  ; 80 0E | Branch always
	STA ($47,X)		  ; 81 47 | Store accumulator to (zero page,X)
	BRA $67			  ; 80 67 | Branch always
	STY $15			  ; 84 15 | Store Y register to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $1D02,X		  ; 1D 02 1D | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $0700			; 0D 00 07 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	BCC $68			  ; 90 68 | Branch if carry clear
	BVC $AC			  ; 50 AC | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $00			  ; A4 00 | Load from zero page into Y register
	SED				  ; F8 | Set decimal mode flag
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	LDY $FC			  ; A4 FC | Load from zero page into Y register
	LDY $FC			  ; A4 FC | Load from zero page into Y register
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_246
; Address: $F6F91A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_246:
	JSR $C0E0			; 20 E0 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_248
; Address: $F6F92E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_248:
	BIT $00B3			; 2C B3 00 | Test bits in accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	JMP $0000			; 4C 00 00 | Jump to address
	BRA $00			  ; 80 00 | Branch always
	BMI $40			  ; 30 40 | Branch if negative
	STZ $00B0			; 9C B0 00 | Store zero to absolute
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	ROL $E300,X		  ; 3E 00 E3 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_249
; Address: $F6F96F
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_249:
	JSL $000000		  ; 22 00 00 00 | Jump to subroutine long
	STZ $97			  ; 64 97 | Store zero to zero page
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX $04			  ; E4 04 | Compare X register (zero page)
	SEC				  ; 38 | Set carry flag
	CPY #$F3			 ; C0 F3 | Compare Y register (immediate)
	ROR $FEFF			; 6E FF FE | Rotate right (absolute)
	ROR $7D1D,X		  ; 7E 1D 7D | Rotate right (absolute,X)
	ASL $CE3E			; 0E 3E CE | Arithmetic shift left (absolute)
	DEC $FF13,X		  ; DE 13 FF | Decrement (absolute,X)
	SBC #$F9			 ; E9 F9 | Subtract with carry (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($20,X)		  ; C1 20 | Compare accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BEQ $C0			  ; F0 C0 | Branch if equal
	INC $00			  ; E6 00 | Increment (zero page)
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	LDA ($61,X)		  ; A1 61 | Load from (zero page,X) into accumulator
	LDX $69FF,Y		  ; BE FF 69 | Load from absolute,Y into X register
	ASL $1C32,X		  ; 1E 32 1C | Arithmetic shift left (absolute,X)
	REP #$BD			 ; C2 BD | Reset processor status bits
	ROL $9E00,X		  ; 3E 00 9E | Rotate left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BCC $00			  ; 90 00 | Branch if carry clear
	BNE $00			  ; D0 00 | Branch if not equal
	AND $800F,X		  ; 3D 0F 80 | Logical AND with accumulator (absolute,X)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	DEC $0000			; CE 00 00 | Decrement (absolute)
	DEC $00CE			; CE CE 00 | Decrement (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_24A
; Address: $F6FA56
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_24A:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $0309			; 0E 09 03 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_24B
; Address: $F6FA65
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_24B:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BMI $3E			  ; 30 3E | Branch if negative
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	ROL $0FC6,X		  ; 3E C6 0F | Rotate left (absolute,X)
	SBC ($07),Y		  ; F1 07 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BVS $FF			  ; 70 FF | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND $DEE0			; 2D E0 DE | Logical AND with accumulator (absolute)
	SEP #$1F			 ; E2 1F | Set processor status bits
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CMP $0032			; CD 32 00 | Compare accumulator (absolute)
	CPY $1E00			; CC 00 1E | Compare Y register (absolute)
	AND ($1D,X)		  ; 21 1D | Logical AND with accumulator ((zero page,X))
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	ORA ($DE,X)		  ; 01 DE | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_24D
; Address: $F6FB32
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_24D:
	DEC $01DF,X		  ; DE DF 01 | Decrement (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_24E
; Address: $F6FB3A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_24E:
	JSR $C0E0			; 20 E0 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEC $1031			; CE 31 10 | Decrement (absolute)
	INC $DC00			; EE 00 DC | Increment (absolute)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_24F
; Address: $F6FB52
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_24F:
	JSL $DCDCFE		  ; 22 FE DC DC | Jump to subroutine long
	ASL $0F3E			; 0E 3E 0F | Arithmetic shift left (absolute)
	ROL $3F21,X		  ; 3E 21 3F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_251
; Address: $F6FB7F
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_251:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BVS $7F			  ; 70 7F | Branch if overflow set
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BPL $FF			  ; 10 FF | Branch if positive
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BCS $E0			  ; B0 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	BEQ $E8			  ; F0 E8 | Branch if equal
	BEQ $E8			  ; F0 E8 | Branch if equal
	BEQ $C8			  ; F0 C8 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA				  ; 9F F0 FF F8 | Store accumulator to absolute long,X
	STZ $6F80			; 9C 80 6F | Store zero to absolute
	STX $9F			  ; 86 9F | Store X register to zero page
	STA				  ; 9F 60 FF 08 | Store accumulator to absolute long,X
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ADC #$EF			 ; 69 EF | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_252
; Address: $F6FC1E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_252:
	STX $86			  ; 86 86 | Store X register to zero page
	BRA $7F			  ; 80 7F | Branch always
	ORA ($8E,X)		  ; 01 8E | Logical OR with accumulator ((zero page,X))
	BEQ $8E			  ; F0 8E | Branch if equal
	STX $0000			; 8E 00 00 | Store X register to absolute address
	ASL $08FF			; 0E FF 08 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	REP #$3D			 ; C2 3D | Reset processor status bits
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_253
; Address: $F6FC6B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_253:
	JSL $E8AA10		  ; 22 10 AA E8 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BPL $A1			  ; 10 A1 | Branch if positive
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPY $F610			; CC 10 F6 | Compare Y register (absolute)
	CPX $EC0A			; EC 0A EC | Compare X register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $A80A			; EC 0A A8 | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_254
; Address: $F6FCB8
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_254:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BPL $04			  ; 10 04 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	SBC ($8C,X)		  ; E1 8C | Subtract with carry ((zero page,X))
	ASL $EC50			; 0E 50 EC | Arithmetic shift left (absolute)
	CPX $CE32			; EC 32 CE | Compare X register (absolute)
	BPL $F3			  ; 10 F3 | Branch if positive
	ASL $0DEE,X		  ; 1E EE 0D | Arithmetic shift left (absolute,X)
	INC $05			  ; E6 05 | Increment (zero page)
	LDY $8C0C			; AC 0C 8C | Load from absolute address into Y register
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	JMP ($200C)		  ; 6C 0C 20 | Jump to address (absolute indirect)
	BPL $02			  ; 10 02 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	CPY $0D			  ; C4 0D | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_255
; Address: $F6FD07
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_255:
	LDA $7D1C,X		  ; BD 1C 7D | Load from absolute,X into accumulator
	SBC $FD3C,X		  ; FD 3C FD | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	ASL $BE38			; 0E 38 BE | Arithmetic shift left (absolute)
	CPY #$7E			 ; C0 7E | Compare Y register (immediate)
	BRA $FE			  ; 80 FE | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SBC ($02),Y		  ; F1 02 | Subtract with carry ((zero page),Y)
	CPX $1D			  ; E4 1D | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	ASL $BE0C			; 0E 0C BE | Arithmetic shift left (absolute)
	ASL $3E7E,X		  ; 1E 7E 3E | Arithmetic shift left (absolute,X)
	INC $FF3F,X		  ; FE 3F FF | Increment (absolute,X)
	ASL $0F19,X		  ; 1E 19 0F | Arithmetic shift left (absolute,X)
	LDA				  ; BF C0 7F 80 | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_257
; Address: $F6FD48
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_257:
	JSR $6C3B			; 20 3B 6C | Jump to subroutine
	ADC $C878,Y		  ; 79 78 C8 | Add with carry (absolute,Y)
	PEA #$0080		   ; F4 80 00 | Push effective address to stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_258
; Address: $F6FD7C
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_258:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CMP $1DD9,Y		  ; D9 D9 1D | Compare accumulator (absolute,Y)
	ORA $0F0F,X		  ; 1D 0F 0F | Logical OR with accumulator (absolute,X)
	ASL $0E0E			; 0E 0E 0E | Arithmetic shift left (absolute)
	ASL $00FF			; 0E FF 00 | Arithmetic shift left (absolute)
	DEC $1E20,X		  ; DE 20 1E | Decrement (absolute,X)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	BEQ $0D			  ; F0 0D | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $B2			  ; F0 B2 | Branch if equal
	CPX #$A1			 ; E0 A1 | Compare X register (immediate)
	LDY $E1			  ; A4 E1 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_259
; Address: $F6FDA8
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_259:
	CPX #$F1			 ; E0 F1 | Compare X register (immediate)
	STY $102E			; 8C 2E 10 | Store Y register to absolute address
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	ASL $2800			; 0E 00 28 | Arithmetic shift left (absolute)
	DEY				  ; 88 | Decrement Y register
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	INC $EEFE,X		  ; FE FE EE | Increment (absolute,X)
	INC $C6C6			; EE C6 C6 | Increment (absolute)
	BPL $C7			  ; 10 C7 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $95			  ; F0 95 | Branch if equal
	STA $8BA3,X		  ; 9D A3 8B | Store accumulator to absolute,X
	STA $D4C7D2		  ; 8F D2 C7 D4 | Store accumulator to absolute long address
	STX $C3			  ; 86 C3 | Store X register to zero page
	LSR $C3			  ; 46 C3 | Logical shift right (zero page)
	LSR $C3			  ; 46 C3 | Logical shift right (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	TSX				  ; BA | Transfer stack pointer to X register
	TSX				  ; BA | Transfer stack pointer to X register
	ORA ($3B,X)		  ; 01 3B | Logical OR with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BNE $40			  ; D0 40 | Branch if not equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_25A
; Address: $F6FE12
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_25A:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $0F0E			; 0E 0E 0F | Arithmetic shift left (absolute)
	ASL $0E0F			; 0E 0F 0E | Arithmetic shift left (absolute)
	ORA $1D1F,X		  ; 1D 1F 1D | Logical OR with accumulator (absolute,X)
	ROL $F00D,X		  ; 3E 0D F0 | Rotate left (absolute,X)
	ASL $0EF0			; 0E F0 0E | Arithmetic shift left (absolute)
	BEQ $0E			  ; F0 0E | Branch if equal
	BEQ $0E			  ; F0 0E | Branch if equal
	BEQ $1C			  ; F0 1C | Branch if equal
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$3D			 ; E0 3D | Compare X register (immediate)
	CPY #$EC			 ; C0 EC | Compare Y register (immediate)
	ASL $1E43,X		  ; 1E 43 1E | Arithmetic shift left (absolute,X)
	ASL $0E1F			; 0E 1F 0E | Arithmetic shift left (absolute)
	ASL $0E1C			; 0E 1C 0E | Arithmetic shift left (absolute)
	PHY				  ; 5A | Push Y register to stack
	JMP $00C0			; 4C C0 00 | Jump to address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_25B
; Address: $F6FE56
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_25B:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SBC $F904,X		  ; FD 04 F9 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	BNE $0B			  ; D0 0B | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_25C
; Address: $F6FE8E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_25C:
	JSR $6AF0			; 20 F0 6A | Jump to subroutine
	ORA ($E6,X)		  ; 01 E6 | Logical OR with accumulator ((zero page,X))
	CPX $EB07			; EC 07 EB | Compare X register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $D0			  ; 10 D0 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	PLX				  ; FA | Pull X register from stack
	INC $FCF9,X		  ; FE F9 FC | Increment (absolute,X)
	SBC ($FC),Y		  ; F1 FC | Subtract with carry ((zero page),Y)
	BEQ $0B			  ; F0 0B | Branch if equal
	CPX #$0B			 ; E0 0B | Compare X register (immediate)
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	SBC $FB00,Y		  ; F9 00 FB | Subtract with carry (absolute,Y)
	BPL $E7			  ; 10 E7 | Branch if positive

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_25D
; Address: $F6FEDB
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_25D:
	JSR $C0C7			; 20 C7 C0 | Jump to subroutine
	STZ $58			  ; 64 58 | Store zero to zero page
	EOR $3C43,X		  ; 5D 43 3C | Exclusive OR with accumulator (absolute,X)
	EOR $8022,X		  ; 5D 22 80 | Exclusive OR with accumulator (absolute,X)
	BRA $07			  ; 80 07 | Branch always
	BRA $03			  ; 80 03 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $B807,X		  ; 9D 07 B8 | Store accumulator to absolute,X
	LDY #$3F			 ; A0 3F | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	BMI $CC			  ; 30 CC | Branch if negative

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_25E
; Address: $F6FF06
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_25E:
	PHP				  ; 08 | Push processor status to stack
	PEA #$B840		   ; F4 40 B8 | Push effective address to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA $110E			; 0D 0E 11 | Logical OR with accumulator (absolute)
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BPL $1F			  ; 10 1F | Branch if positive
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BCS $60			  ; B0 60 | Branch if carry set
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank6C_DmaFunction_25F
; Address: $F6FF50
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank6C_DmaFunction_25F:
	JSR $A0E0			; 20 E0 A0 | Jump to subroutine
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	BEQ $90			  ; F0 90 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
