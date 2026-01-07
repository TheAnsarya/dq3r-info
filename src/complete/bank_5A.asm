;==============================================================================
; Dragon Quest III - Bank $5A
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $ED0000-$ED7FFF
; Instructions: 5749
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_5A"

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_000
; Address: $ED8000
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_000:
	ORA $7B01,X		  ; 1D 01 7B | Logical OR with accumulator (absolute,X)
	ROR $F87E,X		  ; 7E 7E F8 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STA ($81,X)		  ; 81 81 | Update graphics data
	INC $F9FF,X		  ; FE FF F9 | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	INC $F9FF,X		  ; FE FF F9 | Increment (absolute,X)
	REP #$FE			 ; C2 FE | Reset processor status bits
	STY $FC			  ; 84 FC | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $C30E			; 0E 0E C3 | Arithmetic shift left (absolute)
	STA $FF1FFF		  ; 8F FF 1F FF | Update graphics data
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA ($7E,X)		  ; 81 7E | Update graphics data
	STA $00FF70		  ; 8F 70 FF 00 | Update graphics data
	STA				  ; 9F 60 01 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA $00FF00		  ; 8F 00 FF 00 | Update graphics data
	STA				  ; 9F 00 01 FE | Update graphics data
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_001
; Address: $ED80E1
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_001:
	JSR $0EF1			; 20 F1 0E | Jump to subroutine
	BRA $7F			  ; 80 7F | Branch always
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STA				  ; 9F 9F 7F 7F | Update graphics data
	LDA				  ; BF BF FF FF | Read graphics status
	INC $F0FF,X		  ; FE FF F0 | Increment (absolute,X)
	INC $F0FF,X		  ; FE FF F0 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_002
; Address: $ED814B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_002:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDA				  ; BF FF F0 F0 | Read graphics status
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	LDA				  ; BF FF FF FF | Read graphics status
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_003
; Address: $ED818A
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_003:
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	ASL $FF0F			; 0E 0F FF | Arithmetic shift left (absolute)
	INC $61FF,X		  ; FE FF 61 | Increment (absolute,X)
	ADC ($0F,X)		  ; 61 0F | Add with carry ((zero page,X))
	SBC $0EF9,Y		  ; F9 F9 0E | Subtract with carry (absolute,Y)
	ASL $7878			; 0E 78 78 | Arithmetic shift left (absolute)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ROL $FF3F,X		  ; 3E 3F FF | Rotate left (absolute,X)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	SEP #$FD			 ; E2 FD | Set processor status bits
	CMP $FB			  ; C5 FB | Compare accumulator (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	CPX $34			  ; E4 34 | Compare X register (zero page)
	CPY $CC34			; CC 34 CC | Compare Y register (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BMI $D0			  ; 30 D0 | Branch if negative
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	AND $7139,Y		  ; 39 39 71 | Logical AND with accumulator (absolute,Y)
	ADC ($73),Y		  ; 71 73 | Add with carry ((zero page),Y)
	BMI $6C			  ; 30 6C | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_004
; Address: $ED8264
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_004:
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$B8			 ; C0 B8 | Compare Y register (immediate)
	BRA $B9			  ; 80 B9 | Branch always
	BRA $BC			  ; 80 BC | Branch always
	BRA $DE			  ; 80 DE | Branch always
	CPY #$F7			 ; C0 F7 | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	ASL $1F1E,X		  ; 1E 1E 1F | Arithmetic shift left (absolute,X)
	STA $03630F		  ; 8F 0F 63 03 | Update graphics data
	LDY $FF00,X		  ; BC 00 FF | Load from absolute,X into Y register
	ORA $311F,X		  ; 1D 1F 31 | Logical OR with accumulator (absolute,X)
	AND ($3F,X)		  ; 21 3F | Logical AND with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	STA $FEF3F0		  ; 8F F0 F3 FE | Update graphics data
	INC $7F7F,X		  ; FE 7F 7F | Increment (absolute,X)
	SBC $F1FF,X		  ; FD FF F1 | Subtract with carry (absolute,X)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ADC $F37F,Y		  ; 79 7F F3 | Add with carry (absolute,Y)
	SBC $7E71,X		  ; FD 71 7E | Subtract with carry (absolute,X)
	SBC $F3FF,Y		  ; F9 FF F3 | Subtract with carry (absolute,Y)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC $F007,Y		  ; F9 07 F0 | Subtract with carry (absolute,Y)
	BEQ $0F			  ; F0 0F | Branch if equal
	CLC				  ; 18 | Clear carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	ASL $67FF,X		  ; 1E FF 67 | Arithmetic shift left (absolute,X)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	ASL $7B00			; 0E 00 7B | Arithmetic shift left (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $7DFF6B		  ; 8F 6B FF 7D | Update graphics data
	SBC $79FF,Y		  ; F9 FF 79 | Subtract with carry (absolute,Y)
	ADC $79FF,Y		  ; 79 FF 79 | Add with carry (absolute,Y)
	ASL $0E05			; 0E 05 0E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_005
; Address: $ED83B5
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_005:
	ASL $0F06			; 0E 06 0F | Arithmetic shift left (absolute)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	STX $1F			  ; 86 1F | Store X register to zero page
	ASL $1F84,X		  ; 1E 84 1F | Arithmetic shift left (absolute,X)
	STA				  ; 9F 9F FF FF | Update graphics data
	CMP $94FD,X		  ; DD FD 94 | Compare accumulator (absolute,X)
	LDY $679C,X		  ; BC 9C 67 | Load from absolute,X into Y register
	STA $1966,Y		  ; 99 66 19 | Update graphics data
	INC $73			  ; E6 73 | Increment (zero page)
	STY $2ED5			; 8C D5 2E | Store Y register to absolute address
	CMP ($2E),Y		  ; D1 2E | Compare accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY $FF43,X		  ; BC 43 FF | Load from absolute,X into Y register
	CPY $F0CE			; CC CE F0 | Compare Y register (absolute)
	PEA #$ECE8		   ; F4 E8 EC | Push effective address to stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $90			  ; 90 90 | Branch if carry clear
	BRA $CE			  ; 80 CE | Branch always
	AND ($F4),Y		  ; 31 F4 | Logical AND with accumulator ((zero page),Y)
	JMP ($4893)		  ; 6C 93 48 | Jump to address (absolute indirect)
	CLI				  ; 58 | Clear interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $6F			  ; 90 6F | Branch if carry clear
	STA ($A7,X)		  ; 81 A7 | Update graphics data
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_006
; Address: $ED8410
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_006:
	LDX $58			  ; A6 58 | Load from zero page into X register
	INC $1E00,X		  ; FE 00 1E | Increment (absolute,X)
	CPX #$6E			 ; E0 6E | Compare X register (immediate)
	BCC $0F			  ; 90 0F | Branch if carry clear
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $3F			  ; F0 3F | Branch if equal
	CMP ($F3),Y		  ; D1 F3 | Compare accumulator ((zero page),Y)
	CMP ($F3),Y		  ; D1 F3 | Compare accumulator ((zero page),Y)
	SBC ($C1),Y		  ; F1 C1 | Subtract with carry ((zero page),Y)
	BIT $2EC0			; 2C C0 2E | Test bits in accumulator (absolute)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BPL $0C			  ; 10 0C | Branch if positive
	BPL $0C			  ; 10 0C | Branch if positive
	BMI $0E			  ; 30 0E | Branch if negative
	SBC $AE12			; ED 12 AE | Subtract with carry (absolute)
	ORA ($7F),Y		  ; 11 7F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_007
; Address: $ED8440
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_007:
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BCC $32			  ; 90 32 | Branch if carry clear
	CMP $FF81			; CD 81 FF | Compare accumulator (absolute)
	BMI $FF			  ; 30 FF | Branch if negative
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	BVS $4E			  ; 70 4E | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROL $0E00,X		  ; 3E 00 0E | Rotate left (absolute,X)
	ASL $EF00			; 0E 00 EF | Arithmetic shift left (absolute)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BCC $FF			  ; 90 FF | Branch if carry clear
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CMP $FD03,X		  ; DD 03 FD | Compare accumulator (absolute,X)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	ROR $00E0			; 6E E0 00 | Rotate right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BRA $60			  ; 80 60 | Branch always
	STZ $906F			; 9C 6F 90 | Store zero to absolute
	STZ $98			  ; 64 98 | Store zero to zero page
	BCC $FF			  ; 90 FF | Branch if carry clear
	LDY $4E03,X		  ; BC 03 4E | Load from absolute,X into Y register
	CMP ($5F),Y		  ; D1 5F | Compare accumulator ((zero page),Y)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA				  ; 9F 00 9C 40 | Update graphics data
	LSR $5320			; 4E 20 53 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_008
; Address: $ED84DF
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_008:
	JSR $1FE0			; 20 E0 1F | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SBC $F905,Y		  ; F9 05 F9 | Subtract with carry (absolute,Y)
	ORA $F3			  ; 05 F3 | Logical OR with accumulator (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	STA $E400E3		  ; 8F E3 00 E4 | Update graphics data
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $F702,X		  ; 1D 02 F7 | Logical OR with accumulator (absolute,X)
	LDA				  ; BF 7B 9F 5C | Read graphics status
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $385F,X		  ; 1E 5F 38 | Arithmetic shift left (absolute,X)
	AND $7270,Y		  ; 39 70 72 | Logical AND with accumulator (absolute,Y)
	CPY $1F			  ; C4 1F | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_009
; Address: $ED8514
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_009:
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 00 BF 90 | Update graphics data
	CLV				  ; B8 | Clear overflow flag
	AND #$D6			 ; 29 D6 | Logical AND with accumulator (immediate)
	LDY $E880			; AC 80 E8 | Load from absolute address into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_00A
; Address: $ED8525
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_00A:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	JMP $6017E8		  ; 5C E8 17 60 | Jump to address long
	STA				  ; 9F E0 1F E0 | Update graphics data
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_00B
; Address: $ED853F
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_00B:
	JSR $9090			; 20 90 90 | Jump to subroutine
	STY $84			  ; 84 84 | Store Y register to zero page
	ASL $0777,X		  ; 1E 77 07 | Arithmetic shift left (absolute,X)
	BCC $6F			  ; 90 6F | Branch if carry clear
	STY $7B			  ; 84 7B | Store Y register to zero page
	SBC $FF07,Y		  ; F9 07 FF | Subtract with carry (absolute,Y)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA $6D39			; 0D 39 6D | Logical OR with accumulator (absolute)
	LDA				  ; BF FF 07 F8 | Read graphics status
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	INC $3701,X		  ; FE 01 37 | Increment (absolute,X)
	LDA $E37F,X		  ; BD 7F E3 | Read graphics status
	LDA				  ; BF FF 81 63 | Read graphics status
	ORA $3709			; 0D 09 37 | Logical OR with accumulator (absolute)
	LDA				  ; BF 3F FE FF | Read graphics status
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	ROR $F701,X		  ; 7E 01 F7 | Rotate right (absolute,X)
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	STY $F18F			; 8C 8F F1 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	DEC $9A02,X		  ; DE 02 9A | Decrement (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROR $ADFF,X		  ; 7E FF AD | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ROR $01			  ; 66 01 | Rotate right (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	AND ($02,X)		  ; 21 02 | Logical AND with accumulator ((zero page,X))
	ADC $F7			  ; 65 F7 | Add with carry (zero page)
	ROR $A0FF,X		  ; 7E FF A0 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CMP #$C8			 ; C9 C8 | Compare accumulator (immediate)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_00C
; Address: $ED85E4
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_00C:
	STA $FC99,Y		  ; 99 99 FC | Update graphics data
	CPY #$E0			 ; C0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	INC $8301,X		  ; FE 01 83 | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	SBC $E1			  ; E5 E1 | Subtract with carry (zero page)
	SED				  ; F8 | Set decimal mode flag
	BRA $33			  ; 80 33 | Branch always
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	BRA $8E			  ; 80 8E | Branch always
	ROR $28C0,X		  ; 7E C0 28 | Rotate right (absolute,X)
	CPX #$1B			 ; E0 1B | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STA $FEFE30		  ; 8F 30 FE FE | Update graphics data
	BEQ $F3			  ; F0 F3 | Branch if equal
	CPY #$C6			 ; C0 C6 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ROL $F13E,X		  ; 3E 3E F1 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	ROR $4767,X		  ; 7E 67 47 | Rotate right (absolute,X)
	STA				  ; 9F 1F 00 00 | Update graphics data
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC $BF07,Y		  ; F9 07 BF | Subtract with carry (absolute,Y)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_00D
; Address: $ED868A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_00D:
	BRA $80			  ; 80 80 | Branch always
	BEQ $1F			  ; F0 1F | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	STA ($01,X)		  ; 81 01 | Update graphics data
	STA				  ; 9F FF 10 FF | Update graphics data
	STA				  ; 9F FF 10 FF | Update graphics data
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	EOR $C7			  ; 45 C7 | Exclusive OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	STX $FE			  ; 86 FE | Store X register to zero page
	ADC $E3FF,X		  ; 7D FF E3 | Add with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F FF F1 F1 | Update graphics data
	STA				  ; 9F FF FF FF | Update graphics data

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_00E
; Address: $ED8722
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_00E:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STZ $319E,X		  ; 9E 9E 31 | Store zero to absolute,X
	SBC ($08),Y		  ; F1 08 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	INC $FC0C,X		  ; FE 0C FC | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	LDY $4EBF,X		  ; BC BF 4E | Load from absolute,X into Y register
	LSR $2727			; 4E 27 27 | Logical shift right (absolute)
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 80 F1 F0 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA				  ; 9F 80 FE FE | Update graphics data
	STA ($9F),Y		  ; 91 9F | Update graphics data
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	INC $BD01,X		  ; FE 01 BD | Increment (absolute,X)
	WDM #$FF			 ; 42 FF | Reserved instruction
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $FD			  ; 10 FD | Branch if positive
	LDA $0042,X		  ; BD 42 00 | Read graphics status
	BPL $FF			  ; 10 FF | Branch if positive
	INC $DF01,X		  ; FE 01 DF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_00F
; Address: $ED87C7
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_00F:
	JSR $04FB			; 20 FB 04 | Jump to subroutine
	LDA				  ; BF 40 DE 21 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	PLX				  ; FA | Pull X register from stack
	ORA $5D			  ; 05 5D | Logical OR with accumulator (zero page)
	LDX #$B5			 ; A2 B5 | Load immediate value into X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LDX $AD51,Y		  ; BE 51 AD | Load from absolute,Y into X register
	XBA				  ; EB | Exchange accumulator bytes
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	LDA $D746,Y		  ; B9 46 D7 | Read graphics status
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_010
; Address: $ED8805
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_010:
	JSR $14EF			; 20 EF 14 | Jump to subroutine
	CPY #$B9			 ; C0 B9 | Compare Y register (immediate)
	LSR $18F7			; 4E F7 18 | Logical shift right (absolute)
	ASL $B6A0,X		  ; 1E A0 B6 | Arithmetic shift left (absolute,X)
	SBC $19A0			; ED A0 19 | Subtract with carry (absolute)
	ADC ($4A,X)		  ; 61 4A | Add with carry ((zero page,X))
	STA $02F6,X		  ; 9D F6 02 | Update graphics data
	LDA ($00,X)		  ; A1 00 | Read graphics status
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $BA44,X		  ; 9E 44 BA | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_013
; Address: $ED8852
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_013:
	JSR $0100			; 20 00 01 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	CPX $00			  ; E4 00 | Compare X register (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP ($4C),Y		  ; D1 4C | Compare accumulator ((zero page),Y)
	PHB				  ; 8B | Push data bank register to stack
	AND #$F4			 ; 29 F4 | Logical AND with accumulator (immediate)
	BCC $2D			  ; 90 2D | Branch if carry clear
	AND $E7B6,Y		  ; 39 B6 E7 | Logical AND with accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	WDM #$00			 ; 42 00 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	INC				  ; 1A | Increment accumulator
	SBC ($D3,X)		  ; E1 D3 | Subtract with carry ((zero page,X))
	AND $9B61			; 2D 61 9B | Logical AND with accumulator (absolute)
	BIT $EA			  ; 24 EA | Test bits in accumulator (zero page)
	CMP $1806,X		  ; DD 06 18 | Compare accumulator (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_014
; Address: $ED889E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_014:
	JSR $7300			; 20 00 73 | Jump to subroutine
	LDX $78C2			; AE C2 78 | Load from absolute address into X register
	AND $4D			  ; 25 4D | Logical AND with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP $6C			  ; C5 6C | Compare accumulator (zero page)
	ORA $8690			; 0D 90 86 | Logical OR with accumulator (absolute)
	ADC #$9E			 ; 69 9E | Add with carry (immediate)
	RTI				  ; 40 | Return from interrupt
	STA $00			  ; 85 00 | Update graphics data
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PEA #$93C3		   ; F4 C3 93 | Push effective address to stack
	JMP $157A84		  ; 5C 84 7A 15 | Jump to address long
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_016
; Address: $ED88D2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_016:
	JSR $0100			; 20 00 01 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	STZ $00			  ; 64 00 | Store zero to zero page
	SED				  ; F8 | Set decimal mode flag
	INC $F0C0,X		  ; FE C0 F0 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_017
; Address: $ED88E5
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_017:
	CMP ($83,X)		  ; C1 83 | Compare accumulator ((zero page,X))
	ADC ($03),Y		  ; 71 03 | Add with carry ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	CMP $0700			; CD 00 07 | Compare accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $17			  ; 80 17 | Branch always
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STA ($FE,X)		  ; 81 FE | Update graphics data
	BPL $BF			  ; 10 BF | Branch if positive
	BRA $1F			  ; 80 1F | Branch always
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	LDA				  ; BF 40 1F E0 | Read graphics status
	LDY $39BC,X		  ; BC BC 39 | Load from absolute,X into Y register
	SBC $1FC0,Y		  ; F9 C0 1F | Subtract with carry (absolute,Y)
	BEQ $01			  ; F0 01 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	BIT $81			  ; 24 81 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $43			  ; 80 43 | Branch always
	DEC $3F			  ; C6 3F | Decrement (zero page)
	BRA $0F			  ; 80 0F | Branch always
	BEQ $47			  ; F0 47 | Branch if equal
	SEC				  ; 38 | Set carry flag
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	STA $FFC08F		  ; 8F 8F C0 FF | Update graphics data
	BRA $01			  ; 80 01 | Branch always
	BRA $3C			  ; 80 3C | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_018
; Address: $ED894C
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_018:
	CLC				  ; 18 | Clear carry flag
	BRA $07			  ; 80 07 | Branch always
	BVS $FF			  ; 70 FF | Branch if overflow set
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $00CE			; 0E CE 00 | Arithmetic shift left (absolute)
	CMP ($C7,X)		  ; C1 C7 | Compare accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CPY #$17			 ; C0 17 | Compare Y register (immediate)
	AND ($86),Y		  ; 31 86 | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	SEP #$C0			 ; E2 C0 | Set processor status bits
	BPL $3F			  ; 10 3F | Branch if positive
	SBC ($3F),Y		  ; F1 3F | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	ADC $E5			  ; 65 E5 | Add with carry (zero page)
	BRA $07			  ; 80 07 | Branch always
	CPX #$09			 ; E0 09 | Compare X register (immediate)
	SBC $9AFF,X		  ; FD FF 9A | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_019
; Address: $ED899E
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_019:
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	STZ $66			  ; 64 66 | Store zero to zero page
	DEC $CF			  ; C6 CF | Decrement (zero page)
	AND #$D7			 ; 29 D7 | Logical AND with accumulator (immediate)
	STA ($7E,X)		  ; 81 7E | Update graphics data
	BVC $2F			  ; 50 2F | Branch if overflow clear
	SBC $F03F,X		  ; FD 3F F0 | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	ASL $011F			; 0E 1F 01 | Arithmetic shift left (absolute)
	BRA $FF			  ; 80 FF | Branch always
	STZ $F37F			; 9C 7F F3 | Store zero to absolute
	INY				  ; C8 | Increment Y register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	NOP				  ; EA | No operation
	PLP				  ; 28 | Pull processor status from stack
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $00FF,Y		  ; 79 FF 00 | Add with carry (absolute,Y)
	CPY #$11			 ; C0 11 | Compare Y register (immediate)
	CPX $FC00			; EC 00 FC | Compare X register (absolute)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA $00DF,X		  ; 1D DF 00 | Logical OR with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	BRA $7F			  ; 80 7F | Branch always
	SEP #$3D			 ; E2 3D | Set processor status bits
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	ROR $19FE,X		  ; 7E FE 19 | Rotate right (absolute,X)
	CMP $FF01,X		  ; DD 01 FF | Compare accumulator (absolute,X)
	STA ($7F,X)		  ; 81 7F | Update graphics data
	INC $2B			  ; E6 2B | Increment (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX $F800			; EC 00 F8 | Compare X register (absolute)
	INC $F900,X		  ; FE 00 F9 | Increment (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPY #$23			 ; C0 23 | Compare Y register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_01A
; Address: $ED8A8F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_01A:
	JSR $7800			; 20 00 78 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $5F00,X		  ; 1E 00 5F | Arithmetic shift left (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	ROL $1E01,X		  ; 3E 01 1E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_01B
; Address: $ED8AA9
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_01B:
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	AND ($0C,X)		  ; 21 0C | Logical AND with accumulator ((zero page,X))
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BNE $00			  ; D0 00 | Branch if not equal
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$DB			 ; E0 DB | Compare X register (immediate)
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	ASL $8DD1			; 0E D1 8D | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_01D
; Address: $ED8AEC
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_01D:
	LDA				  ; BF C7 BF C3 | Read graphics status
	ORA $09FE,Y		  ; 19 FE 09 | Logical OR with accumulator (absolute,Y)
	INC $FF7D,X		  ; FE 7D FF | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	LDA ($4E),Y		  ; B1 4E | Read graphics status
	SBC $FD36,Y		  ; F9 36 FD | Subtract with carry (absolute,Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FFF9,X		  ; FE F9 FF | Increment (absolute,X)
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	CMP ($FA,X)		  ; C1 FA | Compare accumulator ((zero page,X))
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	SEP #$BC			 ; E2 BC | Set processor status bits
	CPY #$BC			 ; C0 BC | Compare Y register (immediate)
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	STY $FCF9			; 8C F9 FC | Store Y register to absolute address
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	SBC ($CE),Y		  ; F1 CE | Subtract with carry ((zero page),Y)
	CPX $D1			  ; E4 D1 | Compare X register (zero page)
	SEP #$D1			 ; E2 D1 | Set processor status bits
	CPY #$8B			 ; C0 8B | Compare Y register (immediate)
	CPY #$AB			 ; C0 AB | Compare Y register (immediate)
	BRA $13			  ; 80 13 | Branch always
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $F3			  ; F0 F3 | Branch if equal
	PLX				  ; FA | Pull X register from stack
	SBC $EF			  ; E5 EF | Subtract with carry (zero page)
	CPY #$F6			 ; C0 F6 | Compare Y register (immediate)
	STA ($FD,X)		  ; 81 FD | Update graphics data
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_01E
; Address: $ED8B93
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_01E:
	SBC $F8F8,Y		  ; F9 F8 F8 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FC			  ; F0 FC | Branch if equal
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BNE $CC			  ; D0 CC | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	BRA $7C			  ; 80 7C | Branch always
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_01F
; Address: $ED8BA8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_01F:
	ROR $99			  ; 66 99 | Rotate right (zero page)
	JMP ($4C93)		  ; 6C 93 4C | Jump to address (absolute indirect)
	STA ($9C),Y		  ; 91 9C | Update graphics data
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_020
; Address: $ED8BBD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_020:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_021
; Address: $ED8BE3
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_021:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BIT $60			  ; 24 60 | Test bits in accumulator (zero page)
	BPL $20			  ; 10 20 | Branch if positive
	BVC $00			  ; 50 00 | Branch if overflow clear
	STA $088F00		  ; 8F 00 8F 08 | Update graphics data
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $3063			; 9C 63 30 | Store zero to absolute
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_022
; Address: $ED8C35
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_022:
	BPL $00			  ; 10 00 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BMI $AF			  ; 30 AF | Branch if negative
	SBC $FEF3,Y		  ; F9 F3 FE | Subtract with carry (absolute,Y)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ASL $1F01,X		  ; 1E 01 1F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_023
; Address: $ED8C5F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_023:
	JSR $F8FF			; 20 FF F8 | Jump to subroutine
	STA $FF7FFF		  ; 8F FF 7F FF | Update graphics data
	STA				  ; 9F FF 8F FF | Update graphics data
	LDA				  ; BF BF 5F FF | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLY				  ; 7A | Pull Y register from stack
	INC $FFF1,X		  ; FE F1 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_024
; Address: $ED8CA2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_024:
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	DEC $FF31			; CE 31 FF | Decrement (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_025
; Address: $ED8CAD
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_025:
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 7F BF BF | Read graphics status
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	LDX $BFC1,Y		  ; BE C1 BF | Load from absolute,Y into X register
	CPY #$DD			 ; C0 DD | Compare Y register (immediate)
	SEP #$C9			 ; E2 C9 | Set processor status bits
	LDY #$C3			 ; A0 C3 | Load immediate value into Y register
	BVS $8A			  ; 70 8A | Branch if overflow set
	BEQ $08			  ; F0 08 | Branch if equal
	BCC $68			  ; 90 68 | Branch if carry clear
	BRA $B0			  ; 80 B0 | Branch always
	BRA $90			  ; 80 90 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $9C			  ; 80 9C | Branch always
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	BCS $40			  ; B0 40 | Branch if carry set
	BCS $40			  ; B0 40 | Branch if carry set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA $1308			; 0D 08 13 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	BCS $00			  ; B0 00 | Branch if carry set
	CPX $00			  ; E4 00 | Compare X register (zero page)
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	SBC $00			  ; E5 00 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_026
; Address: $ED8D91
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_026:
	JSR $200F			; 20 0F 20 | Jump to subroutine
	LDY #$0F			 ; A0 0F | Load immediate value into Y register
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	BEQ $07			  ; F0 07 | Branch if equal
	BEQ $C7			  ; F0 C7 | Branch if equal
	LDX $C9DF			; AE DF C9 | Load from absolute address into X register
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_027
; Address: $ED8DA6
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_027:
	STA $FE9FFE		  ; 8F FE 9F FE | Update graphics data
	LDA				  ; BF FF 87 FF | Read graphics status
	PLX				  ; FA | Pull X register from stack
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F C7 0F 57 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_028
; Address: $ED8DCA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_028:
	SBC $FD03,X		  ; FD 03 FD | Subtract with carry (absolute,X)
	PHX				  ; DA | Push X register to stack
	STA $AF47BF		  ; 8F BF 47 AF | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_029
; Address: $ED8DDB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_029:
	CMP #$AF			 ; C9 AF | Compare accumulator (immediate)
	EOR ($EF),Y		  ; 51 EF | Exclusive OR with accumulator ((zero page),Y)
	BPL $18			  ; 10 18 | Branch if positive
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	INC $3C			  ; E6 3C | Increment (zero page)
	REP #$38			 ; C2 38 | Reset processor status bits
	DEC $F8			  ; C6 F8 | Decrement (zero page)
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	ASL $0EF0			; 0E F0 0E | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_02A
; Address: $ED8DF3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_02A:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_02B
; Address: $ED8E03
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_02B:
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	STA				  ; 9F 00 CF 00 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	STA				  ; 9F CF 3F 27 | Update graphics data
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_02C
; Address: $ED8E9B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_02C:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	DEY				  ; 88 | Decrement Y register
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	CMP ($EE),Y		  ; D1 EE | Compare accumulator ((zero page),Y)
	CPX $ECF3			; EC F3 EC | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FEFD,X		  ; FE FD FE | Increment (absolute,X)
	BPL $FE			  ; 10 FE | Branch if positive
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_02D
; Address: $ED8F00
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_02D:
	JSR $00D2			; 20 D2 00 | Jump to subroutine
	BCS $10			  ; B0 10 | Branch if carry set
	INY				  ; C8 | Increment Y register
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $00			  ; 10 00 | Branch if positive
	BVC $00			  ; 50 00 | Branch if overflow clear
	BPL $00			  ; 10 00 | Branch if positive
	ORA $4F00			; 0D 00 4F | Logical OR with accumulator (absolute)
	LDA $00EF00		  ; AF 00 EF 00 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $0C			  ; 10 0C | Branch if positive
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SBC $F100,X		  ; FD 00 F1 | Subtract with carry (absolute,X)
	ASL $1F01,X		  ; 1E 01 1F | Arithmetic shift left (absolute,X)
	SBC $E800,X		  ; FD 00 E8 | Subtract with carry (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	CPX $EC03			; EC 03 EC | Compare X register (absolute)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	PEA #$FE00		   ; F4 00 FE | Push effective address to stack
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	CPX $DB			  ; E4 DB | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	SBC $FCFD			; ED FD FC | Subtract with carry (absolute)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_02E
; Address: $ED9009
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_02E:
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDA				  ; BF 00 3F 00 | Read graphics status
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_02F
; Address: $ED904B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_02F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	ROR $BA00,X		  ; 7E 00 BA | Rotate right (absolute,X)
	STA				  ; 9F 00 DF 00 | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	LDY #$50			 ; A0 50 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_030
; Address: $ED9068
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_030:
	JSR $00D0			; 20 D0 00 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	STA $00C700		  ; 8F 00 C7 00 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	STA				  ; 9F 5F 1F DF | Update graphics data

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_031
; Address: $ED90B1
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_031:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	LDY #$0F			 ; A0 0F | Load immediate value into Y register
	BCS $0F			  ; B0 0F | Branch if carry set
	BEQ $07			  ; F0 07 | Branch if equal
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	BCS $FF			  ; B0 FF | Branch if carry set
	BCS $FF			  ; B0 FF | Branch if carry set
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	LDA				  ; BF 7F BF DB | Read graphics status
	CMP $DC3F,X		  ; DD 3F DC | Compare accumulator (absolute,X)
	JMP $2CBF			; 4C BF 2C | Jump to address
	LDA				  ; BF BF DF DF | Read graphics status
	ORA $FFFD			; 0D FD FF | Logical OR with accumulator (absolute)
	LDA				  ; BF 5F DF 3F | Read graphics status
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_032
; Address: $ED9123
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_032:
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	LDA				  ; BF 00 FF 00 | Read graphics status
	SEC				  ; 38 | Set carry flag
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_033
; Address: $ED91A7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_033:
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	LDA				  ; BF 00 FF 00 | Read graphics status
	CLI				  ; 58 | Clear interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_035
; Address: $ED91CA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_035:
	JSR $0054			; 20 54 00 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	STX $8700			; 8E 00 87 | Store X register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	CMP $CF00			; CD 00 CF | Compare accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_036
; Address: $ED91FD
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_036:
	STA				  ; 9F 00 BC 00 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC $FCFF,Y		  ; F9 FF FC | Subtract with carry (absolute,Y)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	STZ $FF			  ; 64 FF | Store zero to zero page
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	LDA				  ; BF BF BF BF | Read graphics status
	LDA				  ; BF BF BF BF | Read graphics status
	LDA				  ; BF BF FF FF | Read graphics status
	LDA				  ; BF 7F BF 7F | Read graphics status
	LDA				  ; BF 7F BF 7F | Read graphics status
	LDA				  ; BF 7F 1F 5F | Read graphics status

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_037
; Address: $ED92B1
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_037:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $30			  ; 30 30 | Branch if negative
	ASL $001E,X		  ; 1E 1E 00 | Arithmetic shift left (absolute,X)
	CPX #$CF			 ; E0 CF | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SBC ($A3,X)		  ; E1 A3 | Subtract with carry ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($5C,X)		  ; 01 5C | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	PLX				  ; FA | Pull X register from stack
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $1FFE,X		  ; FE FE 1F | Increment (absolute,X)
	INC $F801,X		  ; FE 01 F8 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BRA $80			  ; 80 80 | Branch always
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	SBC $BFFD,X		  ; FD FD BF | Subtract with carry (absolute,X)
	LDA				  ; BF 00 EE 00 | Read graphics status
	ASL $00E0			; 0E E0 00 | Arithmetic shift left (absolute)
	ROR $C040,X		  ; 7E 40 C0 | Rotate right (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROL $FF3E,X		  ; 3E 3E FF | Rotate left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CMP ($7C,X)		  ; C1 7C | Compare accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BEQ $03			  ; F0 03 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	INC $C000,X		  ; FE 00 C0 | Increment (absolute,X)
	STA				  ; 9F DF 3F AF | Update graphics data
	LDA				  ; BF CE FE A8 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_038
; Address: $ED93F9
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_038:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	AND $FF2D			; 2D 2D FF | Logical AND with accumulator (absolute)
	BRA $FF			  ; 80 FF | Branch always
	PEA #$FCFF		   ; F4 FF FC | Push effective address to stack
	STA				  ; 9F 8F FF 9F | Update graphics data
	CPY #$BB			 ; C0 BB | Compare Y register (immediate)
	CPY $F7			  ; C4 F7 | Compare Y register (zero page)
	BMI $DE			  ; 30 DE | Branch if negative
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	DEY				  ; 88 | Decrement Y register
	STA $FF0FFF		  ; 8F FF 0F FF | Update graphics data
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	AND $F0C0,Y		  ; 39 C0 F0 | Logical AND with accumulator (absolute,Y)
	ORA $78			  ; 05 78 | Logical OR with accumulator (zero page)
	INC $FF08,X		  ; FE 08 FF | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	LDA $E4B9,Y		  ; B9 B9 E4 | Read graphics status
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $3F			  ; 80 3F | Branch always
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	ASL $FF0E			; 0E 0E FF | Arithmetic shift left (absolute)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $FFF9,Y		  ; F9 F9 FF | Subtract with carry (absolute,Y)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $06			  ; 80 06 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	ORA ($64,X)		  ; 01 64 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_039
; Address: $ED95B7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_039:
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	BPL $05			  ; 10 05 | Branch if positive
	SEP #$05			 ; E2 05 | Set processor status bits
	SEP #$E2			 ; E2 E2 | Set processor status bits
	ORA $007F,X		  ; 1D 7F 00 | Logical OR with accumulator (absolute,X)
	CMP $AA22,X		  ; DD 22 AA | Compare accumulator (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF FF DF DF | Read graphics status
	STA $FFFF8F		  ; 8F 8F FF FF | Update graphics data

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_03A
; Address: $ED95F3
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_03A:
	JSR $FCFF			; 20 FF FC | Jump to subroutine
	INC $F571,X		  ; FE 71 F5 | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	CPY $EDD2			; CC D2 ED | Compare Y register (absolute)
	DEC $FD			  ; C6 FD | Decrement (zero page)
	ADC $FFED,X		  ; 7D ED FF | Add with carry (absolute,X)
	SBC $8BFF,X		  ; FD FF 8B | Subtract with carry (absolute,X)
	STA $FFFFFB		  ; 8F FB FF FF | Update graphics data
	BRA $FF			  ; 80 FF | Branch always
	LDA				  ; BF 40 7F F0 | Read graphics status
	LDA $FFE050		  ; AF 50 E0 FF | Read graphics status
	INX				  ; E8 | Increment X register
	XBA				  ; EB | Exchange accumulator bytes
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	STA				  ; 9F FF BF FF | Update graphics data
	LDY $FFFC,X		  ; BC FC FF | Load from absolute,X into Y register
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF FF 7F FF | Read graphics status
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	SBC $FBFE,X		  ; FD FE FB | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$DD			 ; E0 DD | Compare X register (immediate)
	SEP #$FC			 ; E2 FC | Set processor status bits
	SBC $FEC3,X		  ; FD C3 FE | Subtract with carry (absolute,X)
	SBC $FBFC,X		  ; FD FC FB | Subtract with carry (absolute,X)
	SEP #$DD			 ; E2 DD | Set processor status bits
	CPY $C0FF			; CC FF C0 | Compare Y register (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $FF			  ; 80 FF | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $EF			  ; F0 EF | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	XBA				  ; EB | Exchange accumulator bytes
	PEA #$FEF3		   ; F4 F3 FE | Push effective address to stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $BF40			; ED 40 BF | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_03B
; Address: $ED96C9
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_03B:
	SBC ($1F),Y		  ; F1 1F | Subtract with carry ((zero page),Y)
	STA				  ; 9F CF 7F DF | Update graphics data
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	BVS $EF			  ; 70 EF | Branch if overflow set
	BPL $FF			  ; 10 FF | Branch if positive
	CLV				  ; B8 | Clear overflow flag
	BVS $8F			  ; 70 8F | Branch if overflow set
	PEA #$F807		   ; F4 07 F8 | Push effective address to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BIT $807F			; 2C 7F 80 | Test bits in accumulator (absolute)
	LDA				  ; BF BF DF C6 | Read graphics status
	BEQ $FB			  ; F0 FB | Branch if equal
	LDX $7F			  ; A6 7F | Load from zero page into X register
	SBC $3FFF,X		  ; FD FF 3F | Subtract with carry (absolute,X)
	LDA				  ; BF 5F DF 3F | Read graphics status
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_03C
; Address: $ED97C3
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_03C:
	JSR $708F			; 20 8F 70 | Jump to subroutine
	STZ $9C61,X		  ; 9E 61 9C | Store zero to absolute,X
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	BEQ $F3			  ; F0 F3 | Branch if equal
	CPX #$EC			 ; E0 EC | Compare X register (immediate)
	CPY #$CD			 ; C0 CD | Compare Y register (immediate)
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	BRA $81			  ; 80 81 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	STA $FF03FF		  ; 8F FF 03 FF | Update graphics data
	INC $E401,X		  ; FE 01 E4 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_03D
; Address: $ED986D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_03D:
	INC				  ; 1A | Increment accumulator
	CPY $39			  ; C4 39 | Compare Y register (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_03E
; Address: $ED9877
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_03E:
	LDY $F300,X		  ; BC 00 F3 | Load from absolute,X into Y register
	INC $00			  ; E6 00 | Increment (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 5F 0F CF | Update graphics data

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_03F
; Address: $ED9899
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_03F:
	JSR $3007			; 20 07 30 | Jump to subroutine
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	CPX #$3D			 ; E0 3D | Compare X register (immediate)
	STA				  ; 9F 7F 9F 3F | Update graphics data
	LDA				  ; BF 7F BF FF | Read graphics status
	CLI				  ; 58 | Clear interrupt disable flag
	STZ $FF			  ; 64 FF | Store zero to zero page
	PLX				  ; FA | Pull X register from stack
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $88			  ; 70 88 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	LSR $09			  ; 46 09 | Logical shift right (zero page)
	ASL $1C61,X		  ; 1E 61 1C | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_040
; Address: $ED98EE
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_040:
	JSR $805C			; 20 5C 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	LDA ($00,X)		  ; A1 00 | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	INC $FCFD,X		  ; FE FD FC | Increment (absolute,X)
	SBC $FDFE,X		  ; FD FE FD | Subtract with carry (absolute,X)
	INC $FBF8,X		  ; FE F8 FB | Increment (absolute,X)
	SBC $FDFE,Y		  ; F9 FE FD | Subtract with carry (absolute,Y)
	SBC $FCE2,X		  ; FD E2 FC | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CMP $3A			  ; C5 3A | Compare accumulator (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$7B			 ; E0 7B | Compare X register (immediate)
	STY $70			  ; 84 70 | Store Y register to zero page
	STX $3E40			; 8E 40 3E | Store X register to absolute address
	BNE $60			  ; D0 60 | Branch if not equal
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_041
; Address: $ED9979
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_041:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	SBC ($11,X)		  ; E1 11 | Subtract with carry ((zero page,X))
	SBC ($13,X)		  ; E1 13 | Subtract with carry ((zero page,X))
	STA ($61,X)		  ; 81 61 | Update graphics data
	BRA $60			  ; 80 60 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	REP #$00			 ; C2 00 | Reset processor status bits
	STX $0E01			; 8E 01 0E | Store X register to absolute address
	ORA ($8C,X)		  ; 01 8C | Logical OR with accumulator ((zero page,X))
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	AND $7100,Y		  ; 39 00 71 | Logical AND with accumulator (absolute,Y)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_042
; Address: $ED99BB
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_042:
	JSR $E00F			; 20 0F E0 | Game work RAM access
	BEQ $FC			  ; F0 FC | Branch if equal
	BEQ $E8			  ; F0 E8 | Branch if equal
	PEA #$F4E8		   ; F4 E8 F4 | Push effective address to stack
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	BRA $E4			  ; 80 E4 | Branch always
	LDY #$E4			 ; A0 E4 | Load immediate value into Y register
	BEQ $0B			  ; F0 0B | Branch if equal
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	CPX #$13			 ; E0 13 | Compare X register (immediate)
	CPX #$1B			 ; E0 1B | Compare X register (immediate)
	CPX #$1B			 ; E0 1B | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_043
; Address: $ED99E0
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_043:
	JSR $005E			; 20 5E 00 | Jump to subroutine
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	REP #$02			 ; C2 02 | Reset processor status bits
	LDA ($07,X)		  ; A1 07 | Read graphics status
	BRA $06			  ; 80 06 | Branch always
	EOR ($04,X)		  ; 41 04 | Exclusive OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	AND $5C00,X		  ; 3D 00 5C | Logical AND with accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag
	LDA				  ; BF FF BF FF | Read graphics status
	SBC $FDFF,X		  ; FD FF FD | Subtract with carry (absolute,X)
	SBC $FDFE,X		  ; FD FE FD | Subtract with carry (absolute,X)
	INC $01FF,X		  ; FE FF 01 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC ($EE),Y		  ; F1 EE | Subtract with carry ((zero page),Y)
	CMP #$F6			 ; C9 F6 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_044
; Address: $ED9A44
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_044:
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	JMP $9901			; 4C 01 99 | Jump to address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $06			  ; 80 06 | Branch always
	STA $00			  ; 85 00 | Update graphics data
	ROR $00			  ; 66 00 | Rotate right (zero page)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	LDA $40B840		  ; AF 40 B8 40 | Read graphics status
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $0F			  ; 80 0F | Branch always
	STA $FFFF8F		  ; 8F 8F FF FF | Update graphics data
	SBC $09FF,X		  ; FD FF 09 | Subtract with carry (absolute,X)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	BVS $9F			  ; 70 9F | Branch if overflow set
	ORA $0800			; 0D 00 08 | Logical OR with accumulator (absolute)
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	BRA $00			  ; 80 00 | Branch always
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC $E8F5,Y		  ; F9 F5 E8 | Subtract with carry (absolute,Y)
	PEA #$00FF		   ; F4 FF 00 | Push effective address to stack
	SBC ($02,X)		  ; E1 02 | Subtract with carry ((zero page,X))
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA ($DD),Y		  ; 11 DD | Logical OR with accumulator ((zero page),Y)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $CCFF,X		  ; FE FF CC | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BNE $DF			  ; D0 DF | Branch if not equal
	BEQ $F7			  ; F0 F7 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $D0			  ; 80 D0 | Branch always
	CMP $DFC2			; CD C2 DF | Compare accumulator (absolute)
	DEC $9EEF			; CE EF 9E | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_045
; Address: $ED9B29
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_045:
	STZ $FFF1,X		  ; 9E F1 FF | Store zero to absolute,X
	BEQ $FC			  ; F0 FC | Branch if equal
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	CPY #$22			 ; C0 22 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $10			  ; 80 10 | Branch always
	BRA $61			  ; 80 61 | Branch always
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	BMI $C0			  ; 30 C0 | Branch if negative
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 C3 FD | Read graphics status
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SBC $FEFE,Y		  ; F9 FE FE | Subtract with carry (absolute,Y)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	SEP #$F1			 ; E2 F1 | Set processor status bits
	CPX $E0EE			; EC EE E0 | Game work RAM access
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	CPX #$11			 ; E0 11 | Compare X register (immediate)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	STA $9F9F00		  ; 8F 00 9F 9F | Update graphics data
	STA				  ; 9F 9F 1F 1F | Update graphics data
	SBC $FFFD,X		  ; FD FD FF | Subtract with carry (absolute,X)
	STA				  ; 9F 60 9F 60 | Update graphics data
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BCC $04			  ; 90 04 | Branch if carry clear
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $CC1D,X		  ; 1D 1D CC | Logical OR with accumulator (absolute,X)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	SEP #$FF			 ; E2 FF | Set processor status bits
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	SBC $FEFE,X		  ; FD FE FE | Subtract with carry (absolute,X)
	STA $80DF,X		  ; 9D DF 80 | Update graphics data
	SEC				  ; 38 | Set carry flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA $987F,X		  ; BD 7F 98 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA ($7F,X)		  ; 81 7F | Update graphics data
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_046
; Address: $ED9C0B
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_046:
	SBC $F801,X		  ; FD 01 F8 | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	SBC $F802,X		  ; FD 02 F8 | Subtract with carry (absolute,X)
	CMP ($F0,X)		  ; C1 F0 | Compare accumulator ((zero page,X))
	STX $20C0			; 8E C0 20 | Store X register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	INC $E801,X		  ; FE 01 E8 | Increment (absolute,X)
	PEA #$C8F5		   ; F4 F5 C8 | Push effective address to stack
	ASL $7F19,X		  ; 1E 19 7F | Arithmetic shift left (absolute,X)
	ORA $0DB8,Y		  ; 19 B8 0D | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	STA				  ; 9F 11 FC 33 | Update graphics data
	BVS $EE			  ; 70 EE | Branch if overflow set
	CPX #$6C			 ; E0 6C | Compare X register (immediate)
	BPL $30			  ; 10 30 | Branch if positive
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ORA ($EC,X)		  ; 01 EC | Logical OR with accumulator ((zero page,X))
	BEQ $01			  ; F0 01 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$1A			 ; C0 1A | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CMP $AE3E,X		  ; DD 3E AE | Compare accumulator (absolute,X)
	ORA $0A07,Y		  ; 19 07 0A | Logical OR with accumulator (absolute,Y)
	ORA ($BC,X)		  ; 01 BC | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF FF FF FF | Read graphics status
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA $3BE0,X		  ; 1D E0 3B | Logical OR with accumulator (absolute,X)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	EOR ($3D),Y		  ; 51 3D | Exclusive OR with accumulator ((zero page),Y)
	BRA $7E			  ; 80 7E | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 1F EF 1F | Read graphics status

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_047
; Address: $ED9D6E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_047:
	LDA $FF7F,Y		  ; B9 7F FF | Read graphics status
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHB				  ; 8B | Push data bank register to stack
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_048
; Address: $ED9DAE
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_048:
	JSR $FF13			; 20 13 FF | Jump to subroutine
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 1F FF 41 | Read graphics status
	LDA				  ; BF 3D C3 88 | Read graphics status
	BRA $FF			  ; 80 FF | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $3FFF,X		  ; FE FF 3F | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_049
; Address: $ED9E6A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_049:
	BEQ $FF			  ; F0 FF | Branch if equal
	STA $FF00FF		  ; 8F FF 00 FF | Update graphics data
	BRA $FF			  ; 80 FF | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	ROR $3EFF,X		  ; 7E FF 3E | Rotate right (absolute,X)
	SBC $C13E,Y		  ; F9 3E C1 | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	BPL $EF			  ; 10 EF | Branch if positive
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_04A
; Address: $ED9F20
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_04A:
	JSR $FCFF			; 20 FF FC | Jump to subroutine
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	CLC				  ; 18 | Clear carry flag
	BVS $FF			  ; 70 FF | Branch if overflow set
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $F9FF			; 0E FF F9 | Arithmetic shift left (absolute)
	INC $F01F,X		  ; FE 1F F0 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	INC $F0FF,X		  ; FE FF F0 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_04B
; Address: $ED9FAC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_04B:
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_04C
; Address: $ED9FC8
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_04C:
	BRA $7F			  ; 80 7F | Branch always
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	ASL $38FF			; 0E FF 38 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	ROR $FFFF,X		  ; 7E FF FF | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BEQ $1D			  ; F0 1D | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	LDY $B8C3,X		  ; BC C3 B8 | Load from absolute,X into Y register
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $3C			  ; 80 3C | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $6001,X		  ; FE 01 60 | Increment (absolute,X)
	BPL $0F			  ; 10 0F | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	ADC $05FE,X		  ; 7D FE 05 | Add with carry (absolute,X)
	INC $FF18,X		  ; FE 18 FF | Increment (absolute,X)
	SBC $13FE,Y		  ; F9 FE 13 | Subtract with carry (absolute,Y)
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $CF			  ; 30 CF | Branch if negative
	BRA $FF			  ; 80 FF | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	SBC $0006,Y		  ; F9 06 00 | Subtract with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $1FFF,X		  ; FE FF 1F | Increment (absolute,X)
	INC $FF			  ; E6 FF | Increment (zero page)
	INC $23FF,X		  ; FE FF 23 | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $3FFF,X		  ; FE FF 3F | Increment (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	INC $EF01,X		  ; FE 01 EF | Increment (absolute,X)
	SBC $1FFF,Y		  ; F9 FF 1F | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_04D
; Address: $EDA164
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_04D:
	JSR $FFFF			; 20 FF FF | Jump to subroutine
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP $CFFF,Y		  ; D9 FF CF | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_04E
; Address: $EDA1A6
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_04E:
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	STZ $0861,X		  ; 9E 61 08 | Store zero to absolute,X
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F FF FF FF | Update graphics data
	ROR $03FF,X		  ; 7E FF 03 | Rotate right (absolute,X)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	STA				  ; 9F FF FF FF | Update graphics data
	STA				  ; 9F FF 3C C3 | Update graphics data
	BRA $FF			  ; 80 FF | Branch always
	AND $FEFE,X		  ; 3D FE FE | Logical AND with accumulator (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BEQ $FF			  ; F0 FF | Branch if equal
	STA				  ; 9F E0 7F 80 | Update graphics data
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $8FFF,Y		  ; F9 FF 8F | Subtract with carry (absolute,Y)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	STX $F8FF			; 8E FF F8 | Store X register to absolute address
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	AND $F8FF,Y		  ; 39 FF F8 | Logical AND with accumulator (absolute,Y)
	BEQ $FF			  ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_050
; Address: $EDA33A
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_050:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	INC $7FFF,X		  ; FE FF 7F | Increment (absolute,X)
	INC $F8FF,X		  ; FE FF F8 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	BEQ $E0			  ; F0 E0 | Game work RAM access
	DEC $00FF,X		  ; DE FF 00 | Decrement (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	INC $80FF,X		  ; FE FF 80 | Increment (absolute,X)
	NOP				  ; EA | No operation
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	BEQ $7E			  ; F0 7E | Branch if equal
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ASL $00F1			; 0E F1 00 | Arithmetic shift left (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC $FEFF,Y		  ; F9 FF FE | Subtract with carry (absolute,Y)
	SBC #$F6			 ; E9 F6 | Subtract with carry (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	DEC $39			  ; C6 39 | Decrement (zero page)
	BRA $00			  ; 80 00 | Branch always
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	BVC $20			  ; 50 20 | Branch if overflow clear
	STY $FF70			; 8C 70 FF | Store Y register to absolute address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $0001,X		  ; 1E 01 00 | Arithmetic shift left (absolute,X)
	ASL $F801			; 0E 01 F8 | Arithmetic shift left (absolute)
	STA $F80470		  ; 8F 70 04 F8 | Update graphics data
	BVS $FF			  ; 70 FF | Branch if overflow set
	LDA $FF0371		  ; AF 71 03 FF | Read graphics status
	CMP $3B			  ; C5 3B | Compare accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	STA $017670		  ; 8F 70 76 01 | Update graphics data
	LDA				  ; BF 9E FF FF | Read graphics status
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BPL $E0			  ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_051
; Address: $EDA50F
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_051:
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	BVS $84			  ; 70 84 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	INC $C701,X		  ; FE 01 C7 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $00FF			; 0E FF 00 | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $7F			  ; 80 7F | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	RTI				  ; 40 | Return from interrupt
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_052
; Address: $EDA5CC
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_052:
	JSR $FEC0			; 20 C0 FE | Jump to subroutine
	LDA				  ; BF BF 55 55 | Read graphics status
	INC $7F07,X		  ; FE 07 7F | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FE81,X		  ; FE 81 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	DEC $00			  ; C6 00 | Decrement (zero page)
	SBC $1F00,Y		  ; F9 00 1F | Subtract with carry (absolute,Y)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	TAX				  ; AA | Transfer accumulator to X register
	BVS $80			  ; 70 80 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	ADC $FF00,X		  ; 7D 00 FF | Add with carry (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC $6006,Y		  ; F9 06 60 | Subtract with carry (absolute,Y)
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_053
; Address: $EDA655
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_053:
	PLB				  ; AB | Pull data bank register from stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC ($3F),Y		  ; F1 3F | Subtract with carry ((zero page),Y)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_054
; Address: $EDA680
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_054:
	JSR $803F			; 20 3F 80 | Jump to subroutine
	STA $FF7E7F		  ; 8F 7F 7E FF | Update graphics data
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $C0F1			; 0E F1 C0 | Arithmetic shift left (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX #$15			 ; E0 15 | Compare X register (immediate)
	CPX #$EA			 ; E0 EA | Compare X register (immediate)
	CPX #$0D			 ; E0 0D | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	NOP				  ; EA | No operation
	BEQ $F2			  ; F0 F2 | Branch if equal
	STY $FF			  ; 84 FF | Store Y register to zero page
	BIT #$07			 ; 89 07 | Test bits in accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$CA			 ; A0 CA | Load immediate value into Y register
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	BCS $B0			  ; B0 B0 | Branch if carry set
	CPY #$AA			 ; C0 AA | Compare Y register (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	BRA $FF			  ; 80 FF | Branch always
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	ADC ($0F),Y		  ; 71 0F | Add with carry ((zero page),Y)
	SBC $F8			  ; E5 F8 | Subtract with carry (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDA				  ; BF BF FF FF | Read graphics status
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	STA				  ; 9F FF E0 E0 | Update graphics data

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_055
; Address: $EDA75A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_055:
	LDX $00BE,Y		  ; BE BE 00 | Load from absolute,Y into X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	STZ $FF00			; 9C 00 FF | Store zero to absolute
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BMI $C1			  ; 30 C1 | Branch if negative

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_056
; Address: $EDA79A
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_056:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	DEY				  ; 88 | Decrement Y register
	SBC $9F00,X		  ; FD 00 9F | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	STA $00FFC0		  ; 8F C0 FF 00 | Update graphics data
	INC $E0FE,X		  ; FE FE E0 | Game work RAM access
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	STX $F900			; 8E 00 F9 | Store X register to absolute address
	BRA $37			  ; 80 37 | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $8F02,Y		  ; F9 02 8F | Subtract with carry (absolute,Y)
	ROR $FFF8,X		  ; 7E F8 FF | Rotate right (absolute,X)
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	STA ($00,X)		  ; 81 00 | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	ROR $807E,X		  ; 7E 7E 80 | Rotate right (absolute,X)
	BRA $FC			  ; 80 FC | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY $FF00			; CC 00 FF | Compare Y register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA $00FF00		  ; 8F 00 FF 00 | Update graphics data
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	BVS $70			  ; 70 70 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_057
; Address: $EDA8F2
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_057:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INC $E300,X		  ; FE 00 E3 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 00 70 00 | Read graphics status
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	BRA $80			  ; 80 80 | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STA $E17E00		  ; 8F 00 7E E1 | Update graphics data
	CLV				  ; B8 | Clear overflow flag
	BRA $00			  ; 80 00 | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $7700			; 0E 00 77 | Arithmetic shift left (absolute)
	STY $7F70			; 8C 70 7F | Store Y register to absolute address
	BRA $0F			  ; 80 0F | Branch always
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $F018,X		  ; FE 18 F0 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	PHB				  ; 8B | Push data bank register to stack
	PEA #$00F4		   ; F4 F4 00 | Push effective address to stack
	LDY $0200,X		  ; BC 00 02 | Load from absolute,X into Y register
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPX $C0EC			; EC EC C0 | Compare X register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FB7F,X		  ; FE 7F FB | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_058
; Address: $EDAA85
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_058:
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	BMI $FF			  ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_059
; Address: $EDAAC9
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_059:
	BEQ $FF			  ; F0 FF | Branch if equal
	DEC $00FF,X		  ; DE FF 00 | Decrement (absolute,X)
	INC $E300,X		  ; FE 00 E3 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$09			 ; E0 09 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BEQ $00			  ; F0 00 | Branch if equal
	LDA ($00),Y		  ; B1 00 | Read graphics status
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	LSR $FF4E			; 4E 4E FF | Logical shift right (absolute)
	INC $FC0F,X		  ; FE 0F FC | Increment (absolute,X)
	REP #$1F			 ; C2 1F | Reset processor status bits
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F FC FF 40 | Update graphics data
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	INC $C7FF,X		  ; FE FF C7 | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_05B
; Address: $EDAC4F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_05B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BVS $FF			  ; 70 FF | Branch if overflow set
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_05C
; Address: $EDACA3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_05C:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	INC $F0FF,X		  ; FE FF F0 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_05D
; Address: $EDACCE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_05D:
	CPY $00FF			; CC FF 00 | Compare Y register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $CF			  ; F0 CF | Branch if equal
	INC $E0FF,X		  ; FE FF E0 | Game work RAM access
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_05E
; Address: $EDAD89
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_05E:
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($E2,X)		  ; 01 E2 | Logical OR with accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	STA				  ; 9F FF 07 FF | Update graphics data
	SEI				  ; 78 | Set interrupt disable flag
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $FFFF			; EE FF FF | Increment (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $7F			  ; 80 7F | Branch always
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	DEC $8FFC,X		  ; DE FC 8F | Decrement (absolute,X)
	BEQ $7F			  ; F0 7F | Branch if equal
	CPY #$F1			 ; C0 F1 | Compare Y register (immediate)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BPL $FF			  ; 10 FF | Branch if positive
	INC $ED3E,X		  ; FE 3E ED | Increment (absolute,X)
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	STA				  ; 9F C7 7F 0F | Update graphics data
	LDA				  ; BF FE FF E0 | Read graphics status
	BRA $FF			  ; 80 FF | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_05F
; Address: $EDAECC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_05F:
	SBC $FF3F,X		  ; FD 3F FF | Subtract with carry (absolute,X)
	SEP #$00			 ; E2 00 | Set processor status bits
	AND $FFCE,X		  ; 3D CE FF | Logical AND with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_060
; Address: $EDAF0B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_060:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	INY				  ; C8 | Increment Y register
	DEC $1F21,X		  ; DE 21 1F | Decrement (absolute,X)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	INC $FF1C,X		  ; FE 1C FF | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_061
; Address: $EDAFCA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_061:
	BRA $E3			  ; 80 E3 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	BMI $D9			  ; 30 D9 | Branch if negative

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_062
; Address: $EDAFE4
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_062:
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	ORA ($BF,X)		  ; 01 BF | Logical OR with accumulator ((zero page,X))
	ASL $1DFB			; 0E FB 1D | Arithmetic shift left (absolute)
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	ADC ($67),Y		  ; 71 67 | Add with carry ((zero page),Y)
	INC $F01F,X		  ; FE 1F F0 | Increment (absolute,X)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $00FF			; 0E FF 00 | Arithmetic shift left (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BVS $FF			  ; 70 FF | Branch if overflow set
	BPL $FF			  ; 10 FF | Branch if positive
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $FFC7,Y		  ; F9 C7 FF | Subtract with carry (absolute,Y)
	SBC $F1FF,Y		  ; F9 FF F1 | Subtract with carry (absolute,Y)
	SBC $D6FF,Y		  ; F9 FF D6 | Subtract with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_063
; Address: $EDB0EB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_063:
	JSR $C0FF			; 20 FF C0 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPX $FFF3			; EC F3 FF | Compare X register (absolute)
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_064
; Address: $EDB11A
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_064:
	JSR $0420			; 20 20 04 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	STA				  ; 9F 7F FF FF | Update graphics data
	LDA $00FF00		  ; AF 00 FF 00 | Read graphics status
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STZ $BC0F,X		  ; 9E 0F BC | Store zero to absolute,X
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_065
; Address: $EDB15E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_065:
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF E0 7F E0 | Read graphics status
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $10FF			; 0E FF 10 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_066
; Address: $EDB1A1
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_066:
	SEC				  ; 38 | Set carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BPL $FF			  ; 10 FF | Branch if positive
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	STX $1CFF			; 8E FF 1C | Store X register to absolute address
	AND $77FF,Y		  ; 39 FF 77 | Logical AND with accumulator (absolute,Y)
	LDA				  ; BF FF 7F FE | Read graphics status
	BEQ $FF			  ; F0 FF | Branch if equal
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Update graphics data
	INC $CCFF,X		  ; FE FF CC | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_067
; Address: $EDB22D
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_067:
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	STY $10FF			; 8C FF 10 | Store Y register to absolute address
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 00 FF 00 | Read graphics status
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BNE $00			  ; D0 00 | Branch if not equal
	INX				  ; E8 | Increment X register
	BRA $7F			  ; 80 7F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ADC $F03F,Y		  ; 79 3F F0 | Add with carry (absolute,Y)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	CLD				  ; D8 | Clear decimal mode flag
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA $31FF,X		  ; 1D FF 31 | Logical OR with accumulator (absolute,X)
	STY $FF			  ; 84 FF | Store Y register to zero page
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	INC $FCEF,X		  ; FE EF FC | Increment (absolute,X)
	PEA #$99FF		   ; F4 FF 99 | Push effective address to stack
	STA				  ; 9F F0 FF E0 | Update graphics data
	STY $08FF			; 8C FF 08 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_069
; Address: $EDB366
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_069:
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BNE $EF			  ; D0 EF | Branch if not equal

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_06A
; Address: $EDB386
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_06A:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	BCS $0F			  ; B0 0F | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	INC $7CFF,X		  ; FE FF 7C | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_06B
; Address: $EDB3AA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_06B:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	INC $FF07,X		  ; FE 07 FF | Increment (absolute,X)
	ASL $08FF			; 0E FF 08 | Arithmetic shift left (absolute)
	BMI $FF			  ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_06C
; Address: $EDB3CF
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_06C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $78FF,X		  ; 1E FF 78 | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	BEQ $FD			  ; F0 FD | Branch if equal
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SBC $FFFE,X		  ; FD FE FF | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BNE $FF			  ; D0 FF | Branch if not equal
	STA $E707F8		  ; 8F F8 07 E7 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	BNE $2F			  ; D0 2F | Branch if not equal
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	ASL $0740,X		  ; 1E 40 07 | Arithmetic shift left (absolute,X)
	CMP #$37			 ; C9 37 | Compare accumulator (immediate)
	ASL $47E1,X		  ; 1E E1 47 | Arithmetic shift left (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_06E
; Address: $EDB508
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_06E:
	ROL $FCFF,X		  ; 3E FF FC | Rotate left (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ADC ($9F,X)		  ; 61 9F | Add with carry ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	SBC $FFF8,X		  ; FD F8 FF | Subtract with carry (absolute,X)
	SBC $C3BC,X		  ; FD BC C3 | Subtract with carry (absolute,X)
	ORA ($EF),Y		  ; 11 EF | Logical OR with accumulator ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	BNE $FF			  ; D0 FF | Branch if not equal

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_06F
; Address: $EDB5A7
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_06F:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SBC $C2FE,X		  ; FD FE C2 | Subtract with carry (absolute,X)
	AND $FFC0,X		  ; 3D C0 FF | Logical AND with accumulator (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FE			  ; F0 FE | Branch if equal
	BEQ $F8			  ; F0 F8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CMP $01E1,Y		  ; D9 E1 01 | Compare accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_070
; Address: $EDB5F1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_070:
	SED				  ; F8 | Set decimal mode flag
	INC $F8F9,X		  ; FE F9 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $F9FE,Y		  ; F9 FE F9 | Subtract with carry (absolute,Y)
	INC $FBFC,X		  ; FE FC FB | Increment (absolute,X)
	ASL $5C7F			; 0E 7F 5C | Arithmetic shift left (absolute)
	INC $FE18,X		  ; FE 18 FE | Increment (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_071
; Address: $EDB613
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_071:
	JSR $807F			; 20 7F 80 | Jump to subroutine
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDX $BF00,Y		  ; BE 00 BF | Load from absolute,Y into X register
	LDA				  ; BF 04 70 10 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_072
; Address: $EDB62A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_072:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $0F			  ; 80 0F | Branch always
	BPL $04			  ; 10 04 | Branch if positive
	LDX $BF41,Y		  ; BE 41 BF | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 40 70 8F | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_073
; Address: $EDB639
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_073:
	STA				  ; 9F C0 3F 8F | Update graphics data
	BVS $14			  ; 70 14 | Branch if overflow set
	XBA				  ; EB | Exchange accumulator bytes
	STX $11			  ; 86 11 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_074
; Address: $EDB644
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_074:
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BVC $78			  ; 50 78 | Branch if overflow clear
	INC				  ; 1A | Increment accumulator
	STA				  ; 9F 7F 97 6B | Update graphics data
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	BVS $8F			  ; 70 8F | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	STA $C7			  ; 85 C7 | Update graphics data
	SEC				  ; 38 | Set carry flag
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	LDA				  ; BF 3F FF DF | Read graphics status
	LDA				  ; BF EF 1F 78 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	LDA ($CE),Y		  ; B1 CE | Read graphics status
	BMI $CF			  ; 30 CF | Branch if negative
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROR $7CFF,X		  ; 7E FF 7C | Rotate right (absolute,X)
	STA				  ; 9F FC 03 DE | Update graphics data
	LDA				  ; BF 7F 7F FF | Read graphics status
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $F9FF,X		  ; FE FF F9 | Increment (absolute,X)
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	SBC $CB00,X		  ; FD 00 CB | Subtract with carry (absolute,X)
	AND ($0F),Y		  ; 31 0F | Logical AND with accumulator ((zero page),Y)
	PEA #$F4CE		   ; F4 CE F4 | Push effective address to stack
	EOR $9BB0			; 4D B0 9B | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CPY #$FD			 ; C0 FD | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FE			  ; F0 FE | Branch if equal
	SBC ($FD),Y		  ; F1 FD | Subtract with carry ((zero page),Y)
	LDY $DF			  ; A4 DF | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_075
; Address: $EDB75F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_075:
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	ROR $7EFF,X		  ; 7E FF 7E | Rotate right (absolute,X)
	ADC $7B78,Y		  ; 79 78 7B | Add with carry (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_076
; Address: $EDB76B
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_076:
	RTI				  ; 40 | Return from interrupt
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	ADC $7B86,Y		  ; 79 86 7B | Add with carry (absolute,Y)
	STY $EF			  ; 84 EF | Store Y register to zero page
	BPL $C7			  ; 10 C7 | Branch if positive
	SEC				  ; 38 | Set carry flag
	STA $003870		  ; 8F 70 38 00 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	AND $3CFF,X		  ; 3D FF 3C | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	BMI $21			  ; 30 21 | PPU graphics register access
	CPY #$61			 ; C0 61 | Compare Y register (immediate)
	BRA $08			  ; 80 08 | Branch always
	CLC				  ; 18 | Clear carry flag
	BVS $3F			  ; 70 3F | Branch if overflow set
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $EF			  ; F0 EF | Branch if equal
	ASL $4FFF,X		  ; 1E FF 4F | Arithmetic shift left (absolute,X)
	SBC $F14A,X		  ; FD 4A F1 | Subtract with carry (absolute,X)
	ADC ($E0),Y		  ; 71 E0 | Game work RAM access
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $0407,X		  ; 1E 07 04 | Arithmetic shift left (absolute,X)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BRA $83			  ; 80 83 | Branch always
	LDY $F07F,X		  ; BC 7F F0 | Load from absolute,X into Y register
	SED				  ; F8 | Set decimal mode flag
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	STA $FFFCFF		  ; 8F FF FC FF | Update graphics data

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_077
; Address: $EDB804
; Size: 123 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_077:
	LDX $F0FF,Y		  ; BE FF F0 | Load from absolute,Y into X register
	BVS $8F			  ; 70 8F | Branch if overflow set
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	REP #$3D			 ; C2 3D | Reset processor status bits
	BMI $FF			  ; 30 FF | Branch if negative
	STA				  ; 9F FF 03 FF | Update graphics data
	STA				  ; 9F FF 05 FF | Update graphics data
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	SBC ($20),Y		  ; F1 20 | Subtract with carry ((zero page),Y)
	SBC $FFFE,Y		  ; F9 FE FF | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	STA $FFFF			; 8D FF FF | Update graphics data
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 91 BF 9A | Update graphics data
	SBC $FC9C,X		  ; FD 9C FC | Subtract with carry (absolute,X)
	LDY $3CFC,X		  ; BC FC 3C | Load from absolute,X into Y register
	LDA				  ; BF FC BC FF | Read graphics status
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F E0 BF C0 | Update graphics data
	ADC $FC02,X		  ; 7D 02 FC | Add with carry (absolute,X)
	PEA #$E703		   ; F4 03 E7 | Push effective address to stack
	PEA #$FF03		   ; F4 03 FF | Push effective address to stack
	STA $081F08		  ; 8F 08 1F 08 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	STA $E01F70		  ; 8F 70 1F E0 | Game work RAM access
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $DE			  ; 80 DE | Branch always
	BRA $9F			  ; 80 9F | Branch always
	STZ $FF00,X		  ; 9E 00 FF | Store zero to absolute,X
	SBC $FFD7,X		  ; FD D7 FF | Subtract with carry (absolute,X)
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	REP #$00			 ; C2 00 | Reset processor status bits
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	INC $FF21,X		  ; FE 21 FF | Increment (absolute,X)
	INC $F878,X		  ; FE 78 F8 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_078
; Address: $EDB94C
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_078:
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $90			  ; F0 90 | Branch if equal
	BRA $FC			  ; 80 FC | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	ROL $7D00,X		  ; 3E 00 7D | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STA $FF14FF		  ; 8F FF 14 FF | Update graphics data
	INC $0CC6,X		  ; FE C6 0C | Increment (absolute,X)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ROL $193E,X		  ; 3E 3E 19 | Rotate left (absolute,X)
	INC $0FF8,X		  ; FE F8 0F | Increment (absolute,X)
	ADC $0507,Y		  ; 79 07 05 | Add with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SBC $7E07,Y		  ; F9 07 7E | Subtract with carry (absolute,Y)
	STA ($C0,X)		  ; 81 C0 | Update graphics data
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	STA $FFFF7F		  ; 8F 7F FF FF | Update graphics data
	INC $60FF,X		  ; FE FF 60 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $06			  ; 80 06 | Branch always
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC ($F9),Y		  ; F1 F9 | Subtract with carry ((zero page),Y)
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PEA #$F903		   ; F4 03 F9 | Push effective address to stack
	INC $F9F9,X		  ; FE F9 F9 | Increment (absolute,X)
	INC $FCFB,X		  ; FE FB FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $F9FE,Y		  ; F9 FE F9 | Subtract with carry (absolute,Y)
	INC $FBFC,X		  ; FE FC FB | Increment (absolute,X)
	LSR $5CFF			; 4E FF 5C | Logical shift right (absolute)
	ASL $19E7			; 0E E7 19 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_079
; Address: $EDBA13
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_079:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	STA ($FF,X)		  ; 81 FF | Update graphics data
	LDY $F0C3,X		  ; BC C3 F0 | Load from absolute,X into Y register
	BEQ $9F			  ; F0 9F | Branch if equal
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	BRA $7F			  ; 80 7F | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_07A
; Address: $EDBA66
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_07A:
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STA $FF			  ; 85 FF | Update graphics data
	SBC $FFC1,X		  ; FD C1 FF | Subtract with carry (absolute,X)
	AND $7FFF,X		  ; 3D FF 7F | Logical AND with accumulator (absolute,X)
	CMP #$3E			 ; C9 3E | Compare accumulator (immediate)
	INC $F0FF,X		  ; FE FF F0 | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	DEC $FEFF,X		  ; DE FF FE | Decrement (absolute,X)
	LDX $FFFF,Y		  ; BE FF FF | Load from absolute,Y into X register
	LDA $FFFF,X		  ; BD FF FF | Read graphics status
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BEQ $C0			  ; F0 C0 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	BEQ $FE			  ; F0 FE | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	CPX #$B8			 ; E0 B8 | Compare X register (immediate)
	BVS $FE			  ; 70 FE | Branch if overflow set
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	STX $FFFF			; 8E FF FF | Store X register to absolute address
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA ($CF,X)		  ; 01 CF | Logical OR with accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	INC $FF3C,X		  ; FE 3C FF | Increment (absolute,X)
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $FF0E,X		  ; FE 0E FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 40 3F FF | Read graphics status
	STA $0F337F		  ; 8F 7F 33 0F | Update graphics data
	STA				  ; 9F 7F 7F FF | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_07B
; Address: $EDBB78
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_07B:
	INC $E0FF,X		  ; FE FF E0 | Game work RAM access
	BRA $FF			  ; 80 FF | Branch always
	BEQ $7F			  ; F0 7F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ROR $03FF,X		  ; 7E FF 03 | Rotate right (absolute,X)
	SBC $C3F8,X		  ; FD F8 C3 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ASL $0CF8			; 0E F8 0C | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	CMP $2FFC			; CD FC 2F | Compare accumulator (absolute)
	CMP $0FDF,X		  ; DD DF 0F | Compare accumulator (absolute,X)
	LDA				  ; BF FD FA FB | Read graphics status
	INC $FCF1,X		  ; FE F1 FC | Increment (absolute,X)
	SBC $FFF2,X		  ; FD F2 FF | Subtract with carry (absolute,X)
	BNE $DF			  ; D0 DF | Branch if not equal
	LDY #$B2			 ; A0 B2 | Load immediate value into Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ROL $3E7F,X		  ; 3E 7F 3E | Rotate left (absolute,X)
	ROR $F8F9,X		  ; 7E F9 F8 | Rotate right (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)
	CMP ($CF,X)		  ; C1 CF | Compare accumulator ((zero page,X))
	CMP $FF			  ; C5 FF | Compare accumulator (zero page)
	BRA $8F			  ; 80 8F | Branch always
	BIT #$06			 ; 89 06 | Test bits in accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	STA				  ; 9F 00 37 08 | Update graphics data
	BMI $FE			  ; 30 FE | Branch if negative
	SBC $F6FF,Y		  ; F9 FF F6 | Subtract with carry (absolute,Y)
	SBC $CAFE,X		  ; FD FE CA | Subtract with carry (absolute,X)
	INX				  ; E8 | Increment X register
	STA ($07,X)		  ; 81 07 | Update graphics data
	STA ($07,X)		  ; 81 07 | Update graphics data
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	STA $78FF70		  ; 8F 70 FF 78 | Update graphics data
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	STA $FF87FF		  ; 8F FF 87 FF | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	ORA $77			  ; 05 77 | Logical OR with accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $73			  ; 80 73 | Branch always
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_07C
; Address: $EDBC55
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_07C:
	INC $FCFC,X		  ; FE FC FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	SEP #$31			 ; E2 31 | Set processor status bits
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 00 FF 1D | Update graphics data
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $FE			  ; F0 FE | Branch if equal
	INC $C1C1,X		  ; FE C1 C1 | Increment (absolute,X)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	INC $F0E0,X		  ; FE E0 F0 | Increment (absolute,X)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	PEA #$DFE0		   ; F4 E0 DF | Push effective address to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_07D
; Address: $EDBCB2
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_07D:
	LDA				  ; BF 40 FE 01 | Read graphics status
	BVS $1B			  ; 70 1B | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STA				  ; 9F 9F C0 00 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	ASL $3F00,X		  ; 1E 00 3F | Arithmetic shift left (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	CPY $E0			  ; C4 E0 | Game work RAM access
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROL $F300,X		  ; 3E 00 F3 | Rotate left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SBC ($0A),Y		  ; F1 0A | Subtract with carry ((zero page),Y)
	STY $FF60			; 8C 60 FF | Store Y register to absolute address
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STY $3F0C			; 8C 0C 3F | Store Y register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ASL $F5			  ; 06 F5 | Arithmetic shift left (zero page)
	ASL $CF			  ; 06 CF | Arithmetic shift left (zero page)
	BMI $3F			  ; 30 3F | Branch if negative
	CPY #$F9			 ; C0 F9 | Compare Y register (immediate)
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_07E
; Address: $EDBD1A
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_07E:
	SBC ($F0),Y		  ; F1 F0 | Subtract with carry ((zero page),Y)
	INC $FFF9,X		  ; FE F9 FF | Increment (absolute,X)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	BEQ $3F			  ; F0 3F | Branch if equal
	BEQ $3F			  ; F0 3F | Branch if equal
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	SEP #$FC			 ; E2 FC | Set processor status bits
	ASL $1FFE			; 0E FE 1F | Arithmetic shift left (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF E0 00 FF | Read graphics status
	SBC $FEFF,X		  ; FD FF FE | Subtract with carry (absolute,X)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BRA $FE			  ; 80 FE | Branch always
	STA				  ; 9F FF 0F FF | Update graphics data
	LDA				  ; BF FF FC FC | Read graphics status
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $FD5F,X		  ; FE 5F FD | Increment (absolute,X)
	INC $B1FF,X		  ; FE FF B1 | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	INC $E100,X		  ; FE 00 E1 | Increment (absolute,X)
	ORA $FFC2,Y		  ; 19 C2 FF | Logical OR with accumulator (absolute,Y)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $78FE,X		  ; FE FE 78 | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $FF			  ; F0 FF | Branch if equal
	BVS $BF			  ; 70 BF | Branch if overflow set
	TSX				  ; BA | Transfer stack pointer to X register
	BRA $CF			  ; 80 CF | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ADC $007D,X		  ; 7D 7D 00 | Add with carry (absolute,X)
	BRA $EC			  ; 80 EC | Branch always
	DEC $FF			  ; C6 FF | Decrement (zero page)
	BRA $FF			  ; 80 FF | Branch always
	LDA				  ; BF 45 00 FF | Read graphics status
	ROL $00FF			; 2E FF 00 | Rotate left (absolute)
	INC $BFFF,X		  ; FE FF BF | Increment (absolute,X)
	LDA				  ; BF 00 00 00 | Read graphics status
	ASL $FFFF,X		  ; 1E FF FF | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	INC $F0EF			; EE EF F0 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_07F
; Address: $EDBE1C
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_07F:
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PLY				  ; 7A | Pull Y register from stack
	INC $1FFF,X		  ; FE FF 1F | Increment (absolute,X)
	SBC $00FF,Y		  ; F9 FF 00 | Subtract with carry (absolute,Y)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY #$9A			 ; C0 9A | Compare Y register (immediate)
	ORA ($37,X)		  ; 01 37 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $0F			  ; 30 0F | Branch if negative
	SBC $B8FF,X		  ; FD FF B8 | Subtract with carry (absolute,X)
	BVC $8F			  ; 50 8F | Branch if overflow clear
	INC $E0FF,X		  ; FE FF E0 | Game work RAM access
	EOR ($BF),Y		  ; 51 BF | Exclusive OR with accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	STY $FF			  ; 84 FF | Store Y register to zero page
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BVS $8F			  ; 70 8F | Branch if overflow set
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	LDA ($CF,X)		  ; A1 CF | Read graphics status
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	BPL $FF			  ; 10 FF | Branch if positive
	LDA				  ; BF FF FF FF | Read graphics status
	BRA $7E			  ; 80 7E | Branch always
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $FFF0,X		  ; FE F0 FF | Increment (absolute,X)
	STZ $C0E1,X		  ; 9E E1 C0 | Store zero to absolute,X
	CLC				  ; 18 | Clear carry flag
	DEC $01E0,X		  ; DE E0 01 | Decrement (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_080
; Address: $EDBF23
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_080:
	JSR $0079			; 20 79 00 | Jump to subroutine
	STA $00F600		  ; 8F 00 F6 00 | Update graphics data
	ROR $8C1D			; 6E 1D 8C | Rotate right (absolute)
	BMI $30			  ; 30 30 | Branch if negative
	INC $70FE,X		  ; FE FE 70 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_081
; Address: $EDBF37
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_081:
	BVS $0D			  ; 70 0D | Branch if overflow set
	ORA $FFFF			; 0D FF FF | Logical OR with accumulator (absolute)
	SBC $F802,X		  ; FD 02 F8 | Subtract with carry (absolute,X)
	SBC $E37C,Y		  ; F9 7C E3 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	TXA				  ; 8A | Transfer X register to accumulator
	ADC ($CC,X)		  ; 61 CC | Add with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($7F),Y		  ; 11 7F | Logical OR with accumulator ((zero page),Y)
	LDA				  ; BF FF FF FF | Read graphics status
	CPX #$ED			 ; E0 ED | Compare X register (immediate)
	CPX $FEFF			; EC FF FE | Compare X register (absolute)
	INC $113F,X		  ; FE 3F 11 | Increment (absolute,X)
	INC $F06C,X		  ; FE 6C F0 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_082
; Address: $EDBF70
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_082:
	JSR $0CE0			; 20 E0 0C | Jump to subroutine
	CPX $FE12			; EC 12 FE | Compare X register (absolute)
	DEC $FFFE,X		  ; DE FE FF | Decrement (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	STA $F80370		  ; 8F 70 03 F8 | Update graphics data
	INC $C300,X		  ; FE 00 C3 | Increment (absolute,X)
	STA				  ; 9F 00 E0 E0 | Update graphics data
	BVS $70			  ; 70 70 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_084
; Address: $EDBFE0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_084:
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BNE $FF			  ; D0 FF | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	STA ($FF),Y		  ; 91 FF | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 9F 7F D7 | Read graphics status
	BIT $E7			  ; 24 E7 | Test bits in accumulator (zero page)
	ORA $FF8F,Y		  ; 19 8F FF | Logical OR with accumulator (absolute,Y)
	CLD				  ; D8 | Clear decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_085
; Address: $EDC027
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_085:
	BRA $CF			  ; 80 CF | Branch always
	CPY $FCFF			; CC FF FC | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $D0FF,X		  ; FE FF D0 | Increment (absolute,X)
	BNE $2F			  ; D0 2F | Branch if not equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STA				  ; 9F FF DF FF | Update graphics data
	LDA				  ; BF FF 30 D0 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	BEQ $0A			  ; F0 0A | Branch if equal
	LDA $19CF2F		  ; AF 2F CF 19 | Read graphics status
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	SBC $FFCF,Y		  ; F9 CF FF | Subtract with carry (absolute,Y)
	STA				  ; 9F FF DF FF | Update graphics data
	SBC $3EC5,X		  ; FD C5 3E | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_086
; Address: $EDC0A3
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_086:
	JSR $303F			; 20 3F 30 | Jump to subroutine
	STA				  ; 9F 99 CC CC | Update graphics data
	CMP $B2CD			; CD CD B2 | Compare accumulator (absolute)
	LDX $FF22			; AE 22 FF | Load from absolute address into X register
	CMP $C9FF,Y		  ; D9 FF C9 | Compare accumulator (absolute,Y)
	SEP #$FF			 ; E2 FF | Set processor status bits
	CMP $DFFF			; CD FF DF | Compare accumulator (absolute)
	STA				  ; 9F 9F 9F 9F | Update graphics data
	LDA				  ; BF FF FF FF | Read graphics status
	LDA				  ; BF 3F FF 5F | Read graphics status
	LSR $31F3			; 4E F3 31 | Logical shift right (absolute)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	EOR $6FFF,X		  ; 5D FF 6F | Exclusive OR with accumulator (absolute,X)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BMI $FF			  ; 30 FF | Branch if negative
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STA $9AFF,Y		  ; 99 FF 9A | Update graphics data

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_087
; Address: $EDC15E
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_087:
	STY $FF			  ; 84 FF | Store Y register to zero page
	DEC $EF32			; CE 32 EF | Decrement (absolute)
	CMP $FE29,Y		  ; D9 29 FE | Compare accumulator (absolute,Y)
	ASL $0EFE			; 0E FE 0E | Arithmetic shift left (absolute)
	INC $F81E,X		  ; FE 1E F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	CMP ($FF),Y		  ; D1 FF | Compare accumulator ((zero page),Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	SBC $FEF9,Y		  ; F9 F9 FE | Subtract with carry (absolute,Y)
	INC $FCFC,X		  ; FE FC FC | Increment (absolute,X)
	ROL $373E,X		  ; 3E 3E 37 | Rotate left (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ASL $0F0F,X		  ; 1E 0F 0F | Arithmetic shift left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	REP #$FF			 ; C2 FF | Reset processor status bits
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY $43			  ; C4 43 | Compare Y register (zero page)
	BCS $3B			  ; B0 3B | Branch if carry set
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	ASL $FA			  ; 06 FA | Arithmetic shift left (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_088
; Address: $EDC202
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_088:
	BRA $7F			  ; 80 7F | Branch always
	STY $F473			; 8C 73 F4 | Store Y register to absolute address
	LDX $4301,Y		  ; BE 01 43 | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF FF 7F FF | Read graphics status
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	LDA				  ; BF 5F 9F 7F | Read graphics status
	LDA				  ; BF 2F EF 07 | Read graphics status
	LDA				  ; BF FF BF FF | Read graphics status
	LDA				  ; BF FF 9F FF | Read graphics status
	BVC $EF			  ; 50 EF | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_089
; Address: $EDC242
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_089:
	STA $7A			  ; 85 7A | Update graphics data
	LSR $FEB1			; 4E B1 FE | Logical shift right (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 40 7F 80 | Read graphics status
	LDA				  ; BF FF D7 FF | Read graphics status
	NOP				  ; EA | No operation
	SBC $FF			  ; E5 FF | Subtract with carry (zero page)
	STA $8F7B7E		  ; 8F 7E 7B 8F | Update graphics data
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	ORA $03FC			; 0D FC 03 | Logical OR with accumulator (absolute)
	ORA #$FB			 ; 09 FB | Logical OR with accumulator (immediate)
	LDA				  ; BF FF FF FF | Read graphics status
	AND $9FFF,X		  ; 3D FF 9F | Logical AND with accumulator (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CLV				  ; B8 | Clear overflow flag
	CMP $FF			  ; C5 FF | Compare accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 7F 9F 7E | Read graphics status
	DEC $F83F,X		  ; DE 3F F8 | Decrement (absolute,X)
	INC $8001,X		  ; FE 01 80 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_08A
; Address: $EDC2B6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_08A:
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	SBC $80FF,Y		  ; F9 FF 80 | Subtract with carry (absolute,Y)
	BRA $99			  ; 80 99 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_08B
; Address: $EDC2C6
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_08B:
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Read graphics status
	SBC $FF7F,X		  ; FD 7F FF | Subtract with carry (absolute,X)
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	STA				  ; 9F FF BF FF | Update graphics data
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BIT $E8EC			; 2C EC E8 | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	STY $FF8F			; 8C 8F FF | Store Y register to absolute address
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	AND $FF25,X		  ; 3D 25 FF | Logical AND with accumulator (absolute,X)
	SEP #$F9			 ; E2 F9 | Set processor status bits
	SBC $F8F8,Y		  ; F9 F8 F8 | Subtract with carry (absolute,Y)
	INC $FFEE			; EE EE FF | Increment (absolute)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	STA				  ; 9F 9F 0F 0F | Update graphics data
	ROL $3F2C			; 2E 2C 3F | Rotate left (absolute)
	STA $FFBFFF		  ; 8F FF BF FF | Update graphics data
	CMP ($FF),Y		  ; D1 FF | Compare accumulator ((zero page),Y)
	STA $FF9C,X		  ; 9D 9C FF | Update graphics data
	BEQ $F7			  ; F0 F7 | Branch if equal
	SBC $FFFC,X		  ; FD FC FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_08C
; Address: $EDC36B
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_08C:
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FEFF,Y		  ; F9 FF FE | Subtract with carry (absolute,Y)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	PHB				  ; 8B | Push data bank register to stack
	ORA $2EF1,Y		  ; 19 F1 2E | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ASL $FFFF			; 0E FF FF | Arithmetic shift left (absolute)
	LDA				  ; BF BF FF FF | Read graphics status
	STZ $09FF,X		  ; 9E FF 09 | Store zero to absolute,X
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BPL $FF			  ; 10 FF | Branch if positive
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	EOR $86FF			; 4D FF 86 | Exclusive OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR $CC8E,X		  ; 7E 8E CC | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($F0),Y		  ; 11 F0 | Logical OR with accumulator ((zero page),Y)
	BIT #$46			 ; 89 46 | Test bits in accumulator (immediate)
	DEC $59			  ; C6 59 | Decrement (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	BMI $87			  ; 30 87 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $BF			  ; 80 BF | Branch always
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	LDY $00FF,X		  ; BC FF 00 | Load from absolute,X into Y register
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHB				  ; 8B | Push data bank register to stack
	BRA $FE			  ; 80 FE | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	AND $1EFF,Y		  ; 39 FF 1E | Logical AND with accumulator (absolute,Y)
	ROL $3FFF,X		  ; 3E FF 3F | Rotate left (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_08D
; Address: $EDC49A
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_08D:
	BRA $FF			  ; 80 FF | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	ORA $F9			  ; 05 F9 | Logical OR with accumulator (zero page)
	SBC $FE03,X		  ; FD 03 FE | Subtract with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ROR $7FFF,X		  ; 7E FF 7F | Rotate right (absolute,X)
	LDA				  ; BF BF BF BF | Read graphics status
	LDA				  ; BF 7F FF AF | Read graphics status
	LDA				  ; BF FF 5F FF | Read graphics status
	DEC $E7E7			; CE E7 E7 | Decrement (absolute)
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ADC $7C79,Y		  ; 79 79 7C | Add with carry (absolute,Y)
	LDA				  ; BF BF 3F 3F | Read graphics status
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	ORA $FF19,Y		  ; 19 19 FF | Logical OR with accumulator (absolute,Y)
	AND $FFFF,Y		  ; 39 FF FF | Logical AND with accumulator (absolute,Y)
	SBC $FFF9,Y		  ; F9 F9 FF | Subtract with carry (absolute,Y)
	LDA				  ; BF 40 CF 30 | Read graphics status
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	BPL $00			  ; 10 00 | Branch if positive
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BRA $FF			  ; 80 FF | Branch always
	STA ($FF),Y		  ; 91 FF | Update graphics data

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_08E
; Address: $EDC5BB
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_08E:
	JSR $38FF			; 20 FF 38 | Jump to subroutine
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $F106,Y		  ; F9 06 F1 | Subtract with carry (absolute,Y)
	ASL $7F80			; 0E 80 7F | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	BMI $FF			  ; 30 FF | Branch if negative
	RTI				  ; 40 | Return from interrupt
	INC $8EFF,X		  ; FE FF 8E | Increment (absolute,X)
	LDA				  ; BF FF 70 FF | Read graphics status
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_08F
; Address: $EDC607
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_08F:
	BMI $FE			  ; 30 FE | Branch if negative
	WDM #$F8			 ; 42 F8 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	LDA $976D			; AD 6D 97 | Read graphics status
	ROR $7F8F,X		  ; 7E 8F 7F | Rotate right (absolute,X)
	ADC ($BF,X)		  ; 61 BF | Add with carry ((zero page,X))
	SBC $E109,Y		  ; F9 09 E1 | Subtract with carry (absolute,Y)
	AND ($02,X)		  ; 21 02 | Logical AND with accumulator ((zero page,X))
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 9F | Read graphics status
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_090
; Address: $EDC65A
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_090:
	JSR $CCFF			; 20 FF CC | Jump to subroutine
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 08 F7 3A | Read graphics status
	CMP $1E			  ; C5 1E | Compare accumulator (zero page)
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	CPX #$9D			 ; E0 9D | Compare X register (immediate)
	STA				  ; 9F FF BF FF | Update graphics data
	ROR $036E			; 6E 6E 03 | Rotate right (absolute)
	SBC $F8FF,Y		  ; F9 FF F8 | Subtract with carry (absolute,Y)
	STA ($FF),Y		  ; 91 FF | Update graphics data
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	BEQ $EF			  ; F0 EF | Branch if equal
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $E8FF,X		  ; FE FF E8 | Increment (absolute,X)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $3EFF,X		  ; 1E FF 3E | Arithmetic shift left (absolute,X)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	SBC $E1FF,Y		  ; F9 FF E1 | Subtract with carry (absolute,Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FC			  ; F0 FC | Branch if equal
	JMP $D3F3			; 4C F3 D3 | Jump to address
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	ASL $0FFF,X		  ; 1E FF 0F | Arithmetic shift left (absolute,X)
	LDA				  ; BF 2F FF FF | Read graphics status

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_091
; Address: $EDC741
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_091:
	PHP				  ; 08 | Push processor status to stack
	BRA $FF			  ; 80 FF | Branch always
	STA ($FF,X)		  ; 81 FF | Update graphics data
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	INC $E0			  ; E6 E0 | Game work RAM access
	INC $FF7F,X		  ; FE 7F FF | Increment (absolute,X)
	PEA #$F9FF		   ; F4 FF F9 | Push effective address to stack
	INC $FF			  ; E6 FF | Increment (zero page)
	SEC				  ; 38 | Set carry flag
	STA $FF0EFF		  ; 8F FF 0E FF | Update graphics data
	ORA ($95,X)		  ; 01 95 | Logical OR with accumulator ((zero page,X))
	SBC $FFF9,Y		  ; F9 F9 FF | Subtract with carry (absolute,Y)
	ORA $C7FC,Y		  ; 19 FC C7 | Logical OR with accumulator (absolute,Y)
	BEQ $3F			  ; F0 3F | Branch if equal
	SBC ($1C),Y		  ; F1 1C | Subtract with carry ((zero page),Y)
	CPY $FD34			; CC 34 FD | Compare Y register (absolute)
	SBC $7C19,Y		  ; F9 19 7C | Subtract with carry (absolute,Y)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	STZ $EE9C			; 9C 9C EE | Store zero to absolute
	ROL $46C6			; 2E C6 46 | Rotate left (absolute)
	BRA $80			  ; 80 80 | Branch always
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F FF 63 FF | Update graphics data
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	AND $7FFF,Y		  ; 39 FF 7F | Logical AND with accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDA				  ; BF FF FF FF | Read graphics status
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 60 9F 40 | Read graphics status
	LDA				  ; BF 00 FF 00 | Read graphics status
	BRA $7F			  ; 80 7F | Branch always
	SBC $79FF,Y		  ; F9 FF 79 | Subtract with carry (absolute,Y)
	SBC $D8FF,X		  ; FD FF D8 | Subtract with carry (absolute,X)
	CMP $B3FF,Y		  ; D9 FF B3 | Compare accumulator (absolute,Y)
	BEQ $0D			  ; F0 0D | Branch if equal
	NOP				  ; EA | No operation
	AND $DA			  ; 25 DA | Logical AND with accumulator (zero page)
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_092
; Address: $EDC80B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_092:
	STA				  ; 9F 22 DD 20 | Update graphics data
	CMP $FFFF,X		  ; DD FF FF | Compare accumulator (absolute,X)
	SBC $FDFE,X		  ; FD FE FD | Subtract with carry (absolute,X)
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_093
; Address: $EDC846
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_093:
	STA $FF7FFF		  ; 8F FF 7F FF | Update graphics data
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	STA $FF7FFF		  ; 8F FF 7F FF | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $DBFF,X		  ; FE FF DB | Increment (absolute,X)
	CPX $4EB1			; EC B1 4E | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CPY $40FF			; CC FF 40 | Compare Y register (absolute)
	LDA				  ; BF 8A 77 37 | Read graphics status
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $F6FF			; EE FF F6 | Increment (absolute)
	DEC $FD			  ; C6 FD | Decrement (zero page)
	SEP #$FD			 ; E2 FD | Set processor status bits
	BVC $EF			  ; 50 EF | Branch if overflow clear
	LDA $79FF,X		  ; BD FF 79 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	LSR $FFFF			; 4E FF FF | Logical shift right (absolute)
	SBC $F9FF,X		  ; FD FF F9 | Subtract with carry (absolute,X)
	BEQ $C7			  ; F0 C7 | Branch if equal
	DEC $E9			  ; C6 E9 | Decrement (zero page)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $F6FF,Y		  ; F9 FF F6 | Subtract with carry (absolute,Y)
	BRA $FA			  ; 80 FA | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA $FF19,Y		  ; 19 19 FF | Logical OR with accumulator (absolute,Y)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $FFF9,Y		  ; F9 F9 FF | Subtract with carry (absolute,Y)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	AND $FE25,X		  ; 3D 25 FE | Logical AND with accumulator (absolute,X)
	REP #$FF			 ; C2 FF | Reset processor status bits
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDX $7FA6,Y		  ; BE A6 7F | Load from absolute,Y into X register
	ADC $FF46,Y		  ; 79 46 FF | Add with carry (absolute,Y)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_094
; Address: $EDC9DC
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_094:
	BRA $FF			  ; 80 FF | Branch always
	STX $FF			  ; 86 FF | Store X register to zero page
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	LSR $7EB1			; 4E B1 7E | Logical shift right (absolute)
	STA ($BF,X)		  ; 81 BF | Update graphics data
	RTI				  ; 40 | Return from interrupt
	BRA $3F			  ; 80 3F | Branch always
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $FF			  ; E5 FF | Subtract with carry (zero page)
	DEC $72FF			; CE FF 72 | Decrement (absolute)
	STA $FB16E9		  ; 8F E9 16 FB | Update graphics data
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	LDA				  ; BF FF BF FF | Read graphics status
	ADC $FFFF,X		  ; 7D FF FF | Add with carry (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	STA $7E			  ; 85 7E | Update graphics data
	ORA $FFF7,X		  ; 1D F7 FF | Logical OR with accumulator (absolute,X)
	LDX $CFDF			; AE DF CF | Load from absolute address into X register
	PHP				  ; 08 | Push processor status to stack
	BMI $FF			  ; 30 FF | Branch if negative
	XBA				  ; EB | Exchange accumulator bytes
	AND $FFFF,X		  ; 3D FF FF | Logical AND with accumulator (absolute,X)
	SBC $29FF,Y		  ; F9 FF 29 | Subtract with carry (absolute,Y)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	SBC $EE51,X		  ; FD 51 EE | Subtract with carry (absolute,X)
	CPX $FFDF			; EC DF FF | Compare X register (absolute)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	STA $FF72			; 8D 72 FF | Update graphics data
	SBC #$7F			 ; E9 7F | Subtract with carry (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	ADC $1E1E,X		  ; 7D 1E 1E | Add with carry (absolute,X)
	CPY $E1CC			; CC CC E1 | Compare Y register (absolute)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_095
; Address: $EDCB4E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_095:
	STA				  ; 9F 9F 3F FF | Update graphics data
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	ORA $01FF,Y		  ; 19 FF 01 | Logical OR with accumulator (absolute,Y)
	BPL $FF			  ; 10 FF | Branch if positive
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	BRA $E3			  ; 80 E3 | Branch always
	LSR $86FF			; 4E FF 86 | Logical shift right (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA $89FE,Y		  ; 19 FE 89 | Logical OR with accumulator (absolute,Y)
	ADC $38C7,X		  ; 7D C7 38 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_096
; Address: $EDCBC9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_096:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	STZ $ADFF,X		  ; 9E FF AD | Store zero to absolute,X
	INC $FF7F			; EE 7F FF | Increment (absolute)
	BVS $FF			  ; 70 FF | Branch if overflow set

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_097
; Address: $EDCBDA
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_097:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	STA $3867,Y		  ; 99 67 38 | Update graphics data
	SBC $FE02,X		  ; FD 02 FE | Subtract with carry (absolute,X)
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	SBC $FC10,X		  ; FD 10 FC | Subtract with carry (absolute,X)
	BVC $FC			  ; 50 FC | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	INC $FFF8,X		  ; FE F8 FF | Increment (absolute,X)
	INC $F90F,X		  ; FE 0F F9 | Increment (absolute,X)
	STA				  ; 9F F4 BF FD | Update graphics data
	PHX				  ; DA | Push X register to stack
	ASL $CE2D			; 0E 2D CE | Arithmetic shift left (absolute)
	BPL $E7			  ; 10 E7 | Branch if positive
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_098
; Address: $EDCC16
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_098:
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC ($02),Y		  ; F1 02 | Subtract with carry ((zero page),Y)
	SBC $1B02,X		  ; FD 02 1B | Subtract with carry (absolute,X)
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	ROR $D81F			; 6E 1F D8 | Rotate right (absolute)
	SBC ($0F,X)		  ; E1 0F | Subtract with carry ((zero page,X))
	LSR $7F9F			; 4E 9F 7F | Logical shift right (absolute)
	LDA				  ; BF FF 9F 7F | Read graphics status
	INC				  ; 1A | Increment accumulator
	ADC $F000,Y		  ; 79 00 F0 | Add with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_09A
; Address: $EDCC41
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_09A:
	STA				  ; 9F 30 CF 88 | Update graphics data
	ADC ($DE,X)		  ; 61 DE | Add with carry ((zero page,X))
	SBC $996F,X		  ; FD 6F 99 | Subtract with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	ASL $7600			; 0E 00 76 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	AND $00FF,Y		  ; 39 FF 00 | Logical AND with accumulator (absolute,Y)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	ORA $FFFF,Y		  ; 19 FF FF | Logical OR with accumulator (absolute,Y)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $FE			  ; 30 FE | Branch if negative

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_09B
; Address: $EDCC75
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_09B:
	JSR $00F0			; 20 F0 00 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF 00 F3 FF | Read graphics status
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	ROR $50F1			; 6E F1 50 | Rotate right (absolute)
	LDA $98FF82		  ; AF 82 FF 98 | Read graphics status
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	INC $FFFF			; EE FF FF | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	BVC $00			  ; 50 00 | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	STA				  ; 9F 6F E1 A0 | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	ADC $DFFF,Y		  ; 79 FF DF | Add with carry (absolute,Y)
	EOR ($1E,X)		  ; 41 1E | Exclusive OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_09C
; Address: $EDCCBE
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_09C:
	JSR $FF00			; 20 00 FF | Jump to subroutine
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	CPY $03			  ; C4 03 | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	BMI $06			  ; 30 06 | Branch if negative
	INC $34FF,X		  ; FE FF 34 | Increment (absolute,X)
	DEC $EF1E,X		  ; DE 1E EF | Decrement (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	ORA $FFFF,Y		  ; 19 FF FF | Logical OR with accumulator (absolute,Y)
	INC $84FF,X		  ; FE FF 84 | Increment (absolute,X)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	STA $04FF			; 8D FF 04 | Update graphics data
	ADC ($7F,X)		  ; 61 7F | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_09D
; Address: $EDCD08
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_09D:
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	LSR $7393			; 4E 93 73 | Logical shift right (absolute)
	ORA #$F9			 ; 09 F9 | Logical OR with accumulator (immediate)
	STA $34FF			; 8D FF 34 | Update graphics data
	SBC #$C1			 ; E9 C1 | Subtract with carry (immediate)
	BMI $01			  ; 30 01 | Branch if negative
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	CLC				  ; 18 | Clear carry flag
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	LDA $E718,Y		  ; B9 18 E7 | Read graphics status
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	ORA $FD			  ; 05 FD | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F FF 3F C0 | Update graphics data
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	STA $BFFF,Y		  ; 99 FF BF | Update graphics data
	LDY $1CFF,X		  ; BC FF 1C | Load from absolute,X into Y register
	STA				  ; 9F FF FF 00 | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	SEI				  ; 78 | Set interrupt disable flag
	CPY $40BF			; CC BF 40 | Compare Y register (absolute)
	STA $FF1870		  ; 8F 70 18 FF | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	ROR $FEFF,X		  ; 7E FF FE | Rotate right (absolute,X)
	INC $F001,X		  ; FE 01 F0 | Increment (absolute,X)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SBC $E502,X		  ; FD 02 E5 | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	DEX				  ; CA | Decrement X register
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal
	BEQ $1F			  ; F0 1F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	LDA $898A71		  ; AF 71 8A 89 | Read graphics status
	PEA #$AC43		   ; F4 43 AC | Push effective address to stack

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_09E
; Address: $EDCE0B
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_09E:
	SEC				  ; 38 | Set carry flag
	JMP ($C03F)		  ; 6C 3F C0 | Jump to address (absolute indirect)
	SBC $FF06,Y		  ; F9 06 FF | Subtract with carry (absolute,Y)
	LDA				  ; BF 00 FE 03 | Read graphics status
	ORA $C258,Y		  ; 19 58 C2 | Logical OR with accumulator (absolute,Y)
	BMI $E5			  ; 30 E5 | Branch if negative
	ORA $0BF6,Y		  ; 19 F6 0B | Logical OR with accumulator (absolute,Y)
	BEQ $03			  ; F0 03 | Branch if equal
	ASL $0083			; 0E 83 00 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF E0 1E F0 | Read graphics status
	BEQ $3C			  ; F0 3C | Branch if equal
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	BEQ $79			  ; F0 79 | Branch if equal
	BEQ $C7			  ; F0 C7 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	BCS $86			  ; B0 86 | Branch if carry set
	SBC $FD42,Y		  ; F9 42 FD | Subtract with carry (absolute,Y)
	ADC #$D6			 ; 69 D6 | Add with carry (immediate)
	CLV				  ; B8 | Clear overflow flag
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	BMI $26			  ; 30 26 | Branch if negative
	AND $3D12,Y		  ; 39 12 3D | Logical AND with accumulator (absolute,Y)
	AND #$16			 ; 29 16 | Logical AND with accumulator (immediate)
	BPL $47			  ; 10 47 | Branch if positive
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR $CC8E,X		  ; 7E 8E CC | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($F0),Y		  ; 11 F0 | Logical OR with accumulator ((zero page),Y)
	BVS $DF			  ; 70 DF | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	BMI $87			  ; 30 87 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $8F			  ; 80 8F | Branch always
	LDA				  ; BF 00 7F 7F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STY $9C00			; 8C 00 9C | Store Y register to absolute address
	BRA $00			  ; 80 00 | Branch always
	CPX $5810			; EC 10 58 | Compare X register (absolute)
	CPX #$CE			 ; E0 CE | Compare X register (immediate)
	DEC $9999			; CE 99 99 | Decrement (absolute)
	BMI $30			  ; 30 30 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_09F
; Address: $EDCEB0
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_09F:
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	INC $7DFF			; EE FF 7D | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STY $9D00			; 8C 00 9D | Store Y register to absolute address
	ORA ($B1,X)		  ; 01 B1 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	DEC $99CE			; CE CE 99 | Decrement (absolute)
	STA $3232,Y		  ; 99 32 32 | Update graphics data
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	LDX $6D8E			; AE 8E 6D | Load from absolute address into X register
	CLC				  ; 18 | Clear carry flag
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CMP $3900			; CD 00 39 | Compare accumulator (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	INC $FFEF,X		  ; FE EF FF | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BCC $00			  ; 90 00 | Branch if carry clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $3099,Y		  ; 99 99 30 | Update graphics data
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	ROR $00			  ; 66 00 | Rotate right (zero page)
	BRA $98			  ; 80 98 | Branch always
	LDA ($BF),Y		  ; B1 BF | Read graphics status
	INC $7FFF			; EE FF 7F | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ADC $FE			  ; 65 FE | Add with carry (zero page)
	ADC $DFFF,Y		  ; 79 FF DF | Add with carry (absolute,Y)
	DEC $99CE			; CE CE 99 | Decrement (absolute)
	STA $3030,Y		  ; 99 30 30 | Update graphics data

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0A0
; Address: $EDCF76
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0A0:
	JSR $3100			; 20 00 31 | Jump to subroutine
	ROR $00			  ; 66 00 | Rotate right (zero page)
	SBC $F706,Y		  ; F9 06 F7 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	JMP $E718A3		  ; 5C A3 18 E7 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	PLX				  ; FA | Pull X register from stack
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CPX $FF			  ; E4 FF | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0A1
; Address: $EDCF9A
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0A1:
	SBC $F1FF,Y		  ; F9 FF F1 | Subtract with carry (absolute,Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	CMP $1E			  ; C5 1E | Compare accumulator (zero page)
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	BEQ $7F			  ; F0 7F | Branch if equal
	BRA $1C			  ; 80 1C | Branch always
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 20 DF 20 | Read graphics status
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	SBC $F0FE,X		  ; FD FE F0 | Subtract with carry (absolute,X)
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	ASL $1FE1,X		  ; 1E E1 1F | Arithmetic shift left (absolute,X)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPX $FF1F			; EC 1F FF | Compare X register (absolute)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	BPL $FF			  ; 10 FF | Branch if positive
	BNE $0F			  ; D0 0F | Branch if not equal
	BEQ $16			  ; F0 16 | Branch if equal
	SBC #$5F			 ; E9 5F | Subtract with carry (immediate)
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	SBC $FF8F,X		  ; FD 8F FF | Subtract with carry (absolute,X)
	STA				  ; 9F AB 5F C3 | Update graphics data
	LDA ($FF,X)		  ; A1 FF | Read graphics status
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ROR $7D84			; 6E 84 7D | Rotate right (absolute)
	CLC				  ; 18 | Clear carry flag
	SBC #$0F			 ; E9 0F | Subtract with carry (immediate)
	BEQ $8D			  ; F0 8D | Branch if equal
	STZ $1F61,X		  ; 9E 61 1F | Store zero to absolute,X
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $FAF8,Y		  ; F9 F8 FA | Subtract with carry (absolute,Y)
	SBC ($F6),Y		  ; F1 F6 | Subtract with carry ((zero page),Y)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0A2
; Address: $EDD037
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0A2:
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	LDA ($36),Y		  ; B1 36 | Read graphics status
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	INY				  ; C8 | Increment Y register
	BRA $7F			  ; 80 7F | Branch always
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	EOR $C982			; 4D 82 C9 | Exclusive OR with accumulator (absolute)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	PLX				  ; FA | Pull X register from stack
	BEQ $EF			  ; F0 EF | Branch if equal
	CPX $DB			  ; E4 DB | Compare X register (zero page)
	INC $DB			  ; E6 DB | Increment (zero page)
	ROR $1C11			; 6E 11 1C | Rotate right (absolute)
	SBC $CA35			; ED 35 CA | Subtract with carry (absolute)
	ROL $12D1			; 2E D1 12 | Rotate left (absolute)
	SBC $FF00			; ED 00 FF | Subtract with carry (absolute)
	INC $1C11			; EE 11 1C | Increment (absolute)
	SBC $CA35			; ED 35 CA | Subtract with carry (absolute)
	ROL $12D1			; 2E D1 12 | Rotate left (absolute)
	SBC $FF02			; ED 02 FF | Subtract with carry (absolute)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	DEC $6D			  ; C6 6D | Decrement (zero page)
	STY $086B			; 8C 6B 08 | Store Y register to absolute address
	REP #$31			 ; C2 31 | Reset processor status bits
	STY $63			  ; 84 63 | Store Y register to zero page
	ORA #$E6			 ; 09 E6 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0A3
; Address: $EDD08D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0A3:
	JSR $28D7			; 20 D7 28 | Jump to subroutine
	LDA $73C0,Y		  ; B9 C0 73 | Read graphics status
	BRA $F7			  ; 80 F7 | Branch always
	DEC $9C31			; CE 31 9C | Decrement (absolute)
	ORA $DFE6,Y		  ; 19 E6 DF | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0A4
; Address: $EDD09D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0A4:
	JSR $28D7			; 20 D7 28 | Jump to subroutine
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$01			 ; E2 01 | Set processor status bits
	STZ $83			  ; 64 83 | Store zero to zero page
	SBC $02			  ; E5 02 | Subtract with carry (zero page)
	STZ $2610,X		  ; 9E 10 26 | Store zero to absolute,X
	BMI $07			  ; 30 07 | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	INC $7C01,X		  ; FE 01 7C | Increment (absolute,X)
	SBC $FB02,X		  ; FD 02 FB | Subtract with carry (absolute,X)
	ADC $F386,Y		  ; 79 86 F3 | Add with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INC $E401,X		  ; FE 01 E4 | Increment (absolute,X)
	ADC $F386,Y		  ; 79 86 F3 | Add with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0A5
; Address: $EDD0D9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0A5:
	PHP				  ; 08 | Push processor status to stack
	INC $E401,X		  ; FE 01 E4 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BPL $C6			  ; 10 C6 | Branch if positive
	LSR $C680,X		  ; 5E 80 C6 | Logical shift right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BRA $F7			  ; 80 F7 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0A6
; Address: $EDD107
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0A6:
	JSR $627A			; 20 7A 62 | Jump to subroutine
	WDM #$3A			 ; 42 3A | Reserved instruction
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	STA $BD00,X		  ; 9D 00 BD | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	LDA $02			  ; A5 02 | Read graphics status
	CMP $02			  ; C5 02 | Compare accumulator (zero page)
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	STY $7B			  ; 84 7B | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	CPY $EDFB			; CC FB ED | Compare Y register (absolute)
	BEQ $0D			  ; F0 0D | Branch if equal
	ORA $1DF2			; 0D F2 1D | Logical OR with accumulator (absolute)
	SEP #$19			 ; E2 19 | Set processor status bits
	INC $38			  ; E6 38 | Increment (zero page)
	SBC $ED10			; ED 10 ED | Subtract with carry (absolute)
	LDA				  ; BF FF BF FF | Read graphics status
	SBC $FDFE,X		  ; FD FE FD | Subtract with carry (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BVS $8F			  ; 70 8F | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0A7
; Address: $EDD18B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0A7:
	STA				  ; 9F C0 3F 01 | Update graphics data
	INC $FF			  ; E6 FF | Increment (zero page)
	SBC $FDFF,X		  ; FD FF FD | Subtract with carry (absolute,X)
	SBC $5BFF,Y		  ; F9 FF 5B | Subtract with carry (absolute,Y)
	INC $7F			  ; E6 7F | Increment (zero page)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0A8
; Address: $EDD1A1
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0A8:
	BRA $3F			  ; 80 3F | Branch always
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $1F			  ; 80 1F | Branch always
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	SBC $43A0			; ED A0 43 | Subtract with carry (absolute)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	LDA ($FF),Y		  ; B1 FF | Read graphics status
	STA				  ; 9F FF 8F FF | Update graphics data
	LDA $FF43,X		  ; BD 43 FF | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	INC $19			  ; E6 19 | Increment (zero page)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	STA				  ; 9F FF FF FF | Update graphics data
	LDX $F7FF,Y		  ; BE FF F7 | Load from absolute,Y into X register
	PHP				  ; 08 | Push processor status to stack
	BPL $8F			  ; 10 8F | Branch if positive
	BVS $9F			  ; 70 9F | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0A9
; Address: $EDD1E8
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0A9:
	ORA $08E2,X		  ; 1D E2 08 | Logical OR with accumulator (absolute,X)
	AND $78FF,X		  ; 3D FF 78 | Logical AND with accumulator (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	STY $7B			  ; 84 7B | Store Y register to zero page
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $71			  ; 10 71 | Branch if positive
	STX $8778			; 8E 78 87 | Store X register to absolute address
	BRA $66			  ; 80 66 | Branch always
	STA $83FF,Y		  ; 99 FF 83 | Update graphics data
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $CF			  ; F0 CF | Branch if equal
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $807C80		  ; 5C 80 7C 80 | Jump to address long
	STY $7A			  ; 84 7A | Store Y register to zero page
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	BIT $FF94			; 2C 94 FF | Test bits in accumulator (absolute)
	LSR $BBBD			; 4E BD BB | Logical shift right (absolute)
	JMP $749B			; 4C 9B 74 | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $CC30			; CC 30 CC | Compare Y register (absolute)
	BMI $48			  ; 30 48 | Branch if negative
	BCS $9A			  ; B0 9A | Branch if carry set
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	CPX #$15			 ; E0 15 | Compare X register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BMI $DF			  ; 30 DF | Branch if negative

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0AD
; Address: $EDD263
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0AD:
	JSR $000B			; 20 0B 00 | Jump to subroutine
	BVC $1E			  ; 50 1E | Branch if overflow clear
	ORA ($BA,X)		  ; 01 BA | Logical OR with accumulator ((zero page,X))
	LDA ($FE,X)		  ; A1 FE | Read graphics status
	SBC ($F8,X)		  ; E1 F8 | Subtract with carry ((zero page,X))
	LDA $01FE00		  ; AF 00 FE 01 | Read graphics status
	LSR $1E01,X		  ; 5E 01 1E | Logical shift right (absolute,X)
	ORA ($1B,X)		  ; 01 1B | Logical OR with accumulator ((zero page,X))
	STA $BD66,Y		  ; 99 66 BD | Update graphics data
	WDM #$6F			 ; 42 6F | Reserved instruction
	BCC $67			  ; 90 67 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$F30C		   ; F4 0C F3 | Push effective address to stack
	STA $BD66,Y		  ; 99 66 BD | Update graphics data
	WDM #$6F			 ; 42 6F | Reserved instruction
	BCC $67			  ; 90 67 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$F20D		   ; F4 0D F2 | Push effective address to stack
	CPY $5E			  ; C4 5E | Compare Y register (zero page)
	LDA ($4F,X)		  ; A1 4F | Read graphics status
	BCS $CE			  ; B0 CE | Branch if carry set
	AND ($F6),Y		  ; 31 F6 | Logical AND with accumulator ((zero page),Y)
	ORA #$4A			 ; 09 4A | Logical OR with accumulator (immediate)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CPY $5E			  ; C4 5E | Compare Y register (zero page)
	LDA ($6F,X)		  ; A1 6F | Read graphics status
	BCS $EE			  ; B0 EE | Branch if carry set
	AND ($F7),Y		  ; 31 F7 | Logical AND with accumulator ((zero page),Y)
	ORA #$4A			 ; 09 4A | Logical OR with accumulator (immediate)
	BMI $E8			  ; 30 E8 | Branch if negative
	INY				  ; C8 | Increment Y register
	PEA #$C4DC		   ; F4 DC C4 | Push effective address to stack
	LDA $BC			  ; A5 BC | Read graphics status
	LDA $FA4A,X		  ; BD 4A FA | Read graphics status
	WDM #$81			 ; 42 81 | Reserved instruction
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	BRA $04			  ; 80 04 | Branch always
	BRA $04			  ; 80 04 | Branch always
	LSR $9A01,X		  ; 5E 01 9A | Logical shift right (absolute,X)
	ORA ($BB,X)		  ; 01 BB | Logical OR with accumulator ((zero page,X))
	CMP ($78,X)		  ; C1 78 | Compare accumulator ((zero page,X))
	ORA ($78,X)		  ; 01 78 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0AE
; Address: $EDD2EE
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0AE:
	BVS $0F			  ; 70 0F | Branch if overflow set
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 30 F7 38 | Read graphics status
	SEI				  ; 78 | Set interrupt disable flag
	CMP $DB00,X		  ; DD 00 DB | Compare accumulator (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	LDA $90776D		  ; AF 6D 77 90 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	INC $DC22,X		  ; FE 22 DC | Increment (absolute,X)
	BIT $6858			; 2C 58 68 | Test bits in accumulator (absolute)
	BPL $50			  ; 10 50 | Branch if positive

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0AF
; Address: $EDD31B
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0AF:
	JSR $0080			; 20 80 00 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	ROR $BF01,X		  ; 7E 01 BF | Rotate right (absolute,X)
	STA $4AB1			; 8D B1 4A | Update graphics data
	ORA $7B76,Y		  ; 19 76 7B | Logical OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	LDA $9178,X		  ; BD 78 91 | Read graphics status
	SEI				  ; 78 | Set interrupt disable flag
	BVC $38			  ; 50 38 | Branch if overflow clear
	BMI $A0			  ; 30 A0 | Branch if negative
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SBC $738C,Y		  ; F9 8C 73 | Subtract with carry (absolute,Y)
	CMP $9B22,X		  ; DD 22 9B | Compare accumulator (absolute,X)
	ADC $DF			  ; 65 DF | Add with carry (zero page)
	CPY #$4D			 ; C0 4D | Compare Y register (immediate)
	BRA $09			  ; 80 09 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY $FF			  ; A4 FF | Load from zero page into Y register
	LDA $09F7			; AD F7 09 | Read graphics status
	CPX $FD53			; EC 53 FD | Compare X register (absolute)
	SEP #$FD			 ; E2 FD | Set processor status bits
	INC $8EFF			; EE FF 8E | Increment (absolute)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX $8E00			; EC 00 8E | Compare X register (absolute)
	BCC $EC			  ; 90 EC | Branch if carry clear
	BMI $03			  ; 30 03 | Branch if negative
	BCS $67			  ; B0 67 | Branch if carry set
	BNE $FF			  ; D0 FF | Branch if not equal
	BEQ $F2			  ; F0 F2 | Branch if equal
	BEQ $EC			  ; F0 EC | Branch if equal
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0B0
; Address: $EDD3AB
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0B0:
	SBC $F3			  ; E5 F3 | Subtract with carry (zero page)
	SBC $E9F7			; ED F7 E9 | Subtract with carry (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	LDA #$3B			 ; A9 3B | Read graphics status
	LDA				  ; BF FF F7 ED | Read graphics status
	STY $44			  ; 84 44 | Store Y register to zero page
	BRA $53			  ; 80 53 | Branch always
	BRA $BF			  ; 80 BF | Branch always
	LDA				  ; BF 00 F7 00 | Read graphics status
	ORA #$FE			 ; 09 FE | Logical OR with accumulator (immediate)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0B1
; Address: $EDD3E9
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0B1:
	JSR $ED93			; 20 93 ED | Jump to subroutine
	CMP $CF87,X		  ; DD 87 CF | Compare accumulator (absolute,X)
	STA ($20,X)		  ; 81 20 | Update graphics data
	LDA $00			  ; A5 00 | Read graphics status
	SBC #$E0			 ; E9 E0 | Game work RAM access
	BRA $7B			  ; 80 7B | Branch always
	PEA #$DA7F		   ; F4 7F DA | Push effective address to stack
	DEC $F7			  ; C6 F7 | Decrement (zero page)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SBC $D0FC,Y		  ; F9 FC D0 | Subtract with carry (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	DEC $00			  ; C6 00 | Decrement (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0B2
; Address: $EDD422
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0B2:
	RTI				  ; 40 | Return from interrupt
	DEC $FF00,X		  ; DE 00 FF | Decrement (absolute,X)
	DEC $3019			; CE 19 30 | Decrement (absolute)
	AND $FFFB,X		  ; 3D FB FF | Logical AND with accumulator (absolute,X)
	AND $BFFF,X		  ; 3D FF BF | Logical AND with accumulator (absolute,X)
	STZ $BF01,X		  ; 9E 01 BF | Store zero to absolute,X
	ROR $C63D			; 6E 3D C6 | Rotate right (absolute)
	AND $3D00,Y		  ; 39 00 3D | Logical AND with accumulator (absolute,Y)
	LDA				  ; BF 00 0E F1 | Read graphics status
	ASL $8DF1			; 0E F1 8D | Arithmetic shift left (absolute)
	STA ($3E,X)		  ; 81 3E | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	BCS $F3			  ; B0 F3 | Branch if carry set
	STY $F10F			; 8C 0F F1 | Store Y register to absolute address
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	SBC ($3F,X)		  ; E1 3F | Subtract with carry ((zero page,X))
	ADC ($7F,X)		  ; 61 7F | Add with carry ((zero page,X))
	LDA $0F8F1F		  ; AF 1F 8F 0F | Read graphics status
	STA $BF000F		  ; 8F 0F 00 BF | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	BIT $25D3			; 2C D3 25 | Test bits in accumulator (absolute)
	PHX				  ; DA | Push X register to stack
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0B3
; Address: $EDD46C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0B3:
	RTI				  ; 40 | Return from interrupt
	LDX $FA00			; AE 00 FA | Load from absolute address into X register
	ASL $BFFF			; 0E FF BF | Arithmetic shift left (absolute)
	CMP #$F3			 ; C9 F3 | Compare accumulator (immediate)
	EOR ($E8),Y		  ; 51 E8 | Exclusive OR with accumulator ((zero page),Y)
	ORA $F8			  ; 05 F8 | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	SBC $FF68,X		  ; FD 68 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0B4
; Address: $EDD486
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0B4:
	JSR $02DF			; 20 DF 02 | Jump to subroutine
	SBC $B806,X		  ; FD 06 B8 | Subtract with carry (absolute,X)
	LDX $2570,Y		  ; BE 70 25 | Load from absolute,Y into X register
	STA $00			  ; 85 00 | Update graphics data
	ORA $81			  ; 05 81 | Logical OR with accumulator (zero page)
	INC $D7FF			; EE FF D7 | Increment (absolute)
	LDX $9E41,Y		  ; BE 41 9E | Load from absolute,Y into X register
	TAX				  ; AA | Transfer accumulator to X register
	BVC $AF			  ; 50 AF | Branch if overflow clear
	BMI $CF			  ; 30 CF | Branch if negative
	ORA $0086,Y		  ; 19 86 00 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0B5
; Address: $EDD4A8
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0B5:
	JSR $784F			; 20 4F 78 | Jump to subroutine
	ROR $3FBD,X		  ; 7E BD 3F | Rotate right (absolute,X)
	DEC $7FDD,X		  ; DE DD 7F | Decrement (absolute,X)
	LDA $79CF,Y		  ; B9 CF 79 | Read graphics status
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	BCC $0F			  ; 90 0F | Branch if carry clear
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	ASL $7B00,X		  ; 1E 00 7B | Arithmetic shift left (absolute,X)
	STY $DB			  ; 84 DB | Store Y register to zero page
	BIT $F7			  ; 24 F7 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	SBC $FDE2,X		  ; FD E2 FD | Subtract with carry (absolute,X)
	JMP $19E6			; 4C E6 19 | Jump to address
	REP #$3D			 ; C2 3D | Reset processor status bits
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 67 3F D8 | Update graphics data
	STA $807F,Y		  ; 99 7F 80 | Update graphics data
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	ORA ($F8),Y		  ; 11 F8 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	STZ $1DFE			; 9C FE 1D | Store zero to absolute

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0B6
; Address: $EDD527
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0B6:
	JSR $689F			; 20 9F 68 | Jump to subroutine
	ROL $04C1,X		  ; 3E C1 04 | Rotate left (absolute,X)
	STZ $1C00			; 9C 00 1C | Store zero to absolute

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0B9
; Address: $EDD558
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0B9:
	JSL $004400		  ; 22 00 44 00 | Jump to subroutine long
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	STY $18FF			; 8C FF 18 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	STY $1800			; 8C 00 18 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F FF 9E FF | Update graphics data
	ROL $ACFF,X		  ; 3E FF AC | Rotate left (absolute,X)
	REP #$E7			 ; C2 E7 | Reset processor status bits
	STA				  ; 9F 00 9E 00 | Update graphics data
	ROL $AC00,X		  ; 3E 00 AC | Rotate left (absolute,X)
	REP #$00			 ; C2 00 | Reset processor status bits
	SBC $FB77,Y		  ; F9 77 FB | Subtract with carry (absolute,Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	AND $CCFF			; 2D FF CC | Logical AND with accumulator (absolute)
	INC $D6FF			; EE FF D6 | Increment (absolute)
	BNE $FF			  ; D0 FF | Branch if not equal
	BRA $FF			  ; 80 FF | Branch always
	AND $CC00			; 2D 00 CC | Logical AND with accumulator (absolute)
	INC $D600			; EE 00 D6 | Increment (absolute)
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	LDX $DEFF,Y		  ; BE FF DE | Load from absolute,Y into X register
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	INY				  ; C8 | Increment Y register
	LDX $DE00,Y		  ; BE 00 DE | Load from absolute,Y into X register
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	INY				  ; C8 | Increment Y register
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC $E9FF,Y		  ; F9 FF E9 | Subtract with carry (absolute,Y)
	BRA $03			  ; 80 03 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC $E900,Y		  ; F9 00 E9 | Subtract with carry (absolute,Y)
	STA $E3			  ; 85 E3 | Update graphics data
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0BA
; Address: $EDD630
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0BA:
	JMP $1930			; 4C 30 19 | Jump to address
	CLC				  ; 18 | Clear carry flag
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY $7EFF			; CC FF 7E | Compare Y register (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY $7E00			; CC 00 7E | Compare Y register (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	LDA				  ; BF 4E 7F 8C | Read graphics status
	ASL $0C00			; 0E 00 0C | Arithmetic shift left (absolute)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	INC $1801,X		  ; FE 01 18 | Increment (absolute,X)
	DEC $3F			  ; C6 3F | Decrement (zero page)
	BMI $CF			  ; 30 CF | Branch if negative
	LSR $0FA1,X		  ; 5E A1 0F | Logical shift right (absolute,X)
	BEQ $98			  ; F0 98 | Branch if equal
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	BEQ $7F			  ; F0 7F | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STY $00FF			; 8C FF 00 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0BB
; Address: $EDD6CC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0BB:
	JSR $0DDF			; 20 DF 0D | Jump to subroutine
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	INC $1801,X		  ; FE 01 18 | Increment (absolute,X)
	BMI $CF			  ; 30 CF | Branch if negative
	LSR $0FA1,X		  ; 5E A1 0F | Logical shift right (absolute,X)
	BEQ $FC			  ; F0 FC | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0BC
; Address: $EDD74C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0BC:
	JSR $01DF			; 20 DF 01 | Jump to subroutine
	INC $0007,X		  ; FE 07 00 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STX $FC71			; 8E 71 FC | Store X register to absolute address
	BEQ $F3			  ; F0 F3 | Branch if equal
	INC $1801,X		  ; FE 01 18 | Increment (absolute,X)
	BMI $CF			  ; 30 CF | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $0F			  ; 80 0F | Branch always
	BEQ $FC			  ; F0 FC | Branch if equal

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0BD
; Address: $EDD7AB
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0BD:
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0BE
; Address: $EDD7CC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0BE:
	JSR $01DF			; 20 DF 01 | Jump to subroutine
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0BF
; Address: $EDD80C
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0BF:
	JSR $01DF			; 20 DF 01 | Jump to subroutine
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDX $63FE,Y		  ; BE FE 63 | Load from absolute,Y into X register
	ASL $FFFF,X		  ; 1E FF FF | Arithmetic shift left (absolute,X)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ROR $0FFF,X		  ; 7E FF 0F | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $A1FE			; 0E FE A1 | Arithmetic shift left (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $38FE,X		  ; 1E FE 38 | Arithmetic shift left (absolute,X)
	STX $038F			; 8E 8F 03 | Store X register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $FF			  ; F0 FF | Branch if equal
	ROL $F03F,X		  ; 3E 3F F0 | Rotate left (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF FF 7F FF | Read graphics status
	ASL $FFFF,X		  ; 1E FF FF | Arithmetic shift left (absolute,X)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ROR $FFFF,X		  ; 7E FF FF | Rotate right (absolute,X)
	LDA ($DF,X)		  ; A1 DF | Read graphics status
	SEC				  ; 38 | Set carry flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $F0FF,X		  ; FE FF F0 | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	AND $C43D,X		  ; 3D 3D C4 | Logical AND with accumulator (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0C0
; Address: $EDD950
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0C0:
	REP #$00			 ; C2 00 | Reset processor status bits
	SEC				  ; 38 | Set carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	STX $87			  ; 86 87 | Store X register to zero page
	BCS $BF			  ; B0 BF | Branch if carry set
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	REP #$FE			 ; C2 FE | Reset processor status bits
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $C43D,X		  ; 3D 3D C4 | Logical AND with accumulator (absolute,X)
	ROL $E0FF,X		  ; 3E FF E0 | Game work RAM access
	REP #$00			 ; C2 00 | Reset processor status bits
	SEC				  ; 38 | Set carry flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CPY $FC			  ; C4 FC | Compare Y register (zero page)
	STX $87			  ; 86 87 | Store X register to zero page
	BCS $BF			  ; B0 BF | Branch if carry set
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	REP #$FE			 ; C2 FE | Reset processor status bits
	BNE $FF			  ; D0 FF | Branch if not equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	LDY $0CFC,X		  ; BC FC 0C | Load from absolute,X into Y register
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STZ $0300,X		  ; 9E 00 03 | Store zero to absolute,X
	ASL $0300,X		  ; 1E 00 03 | Arithmetic shift left (absolute,X)
	STY $80FC			; 8C FC 80 | Store Y register to absolute address
	BRA $07			  ; 80 07 | Branch always
	BVS $70			  ; 70 70 | Branch if overflow set
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	ASL $8D1E,X		  ; 1E 1E 8D | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0C1
; Address: $EDDA6F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0C1:
	JSR $0003			; 20 03 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	STA $001E00		  ; 8F 00 1E 00 | Update graphics data
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0C2
; Address: $EDDA80
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0C2:
	ASL $F01F,X		  ; 1E 1F F0 | Arithmetic shift left (absolute,X)
	SBC $07E1			; ED E1 07 | Subtract with carry (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $F800,X		  ; 1E 00 F8 | Arithmetic shift left (absolute,X)
	AND ($F1),Y		  ; 31 F1 | Logical AND with accumulator ((zero page),Y)
	BPL $10			  ; 10 10 | Branch if positive
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	ASL $EF00			; 0E 00 EF | Arithmetic shift left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STY $80FC			; 8C FC 80 | Store Y register to absolute address
	BRA $07			  ; 80 07 | Branch always
	BVS $70			  ; 70 70 | Branch if overflow set
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	ASL $8D1E,X		  ; 1E 1E 8D | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	STA $001E00		  ; 8F 00 1E 00 | Update graphics data
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	ASL $F01F,X		  ; 1E 1F F0 | Arithmetic shift left (absolute,X)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $F800,X		  ; 1E 00 F8 | Arithmetic shift left (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $03			  ; F0 03 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY $FF00			; CC 00 FF | Compare Y register (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $CF			  ; 30 CF | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $0F			  ; 30 0F | Branch if negative
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0C3
; Address: $EDDBC2
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0C3:
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $33			  ; 30 33 | Branch if negative
	CPY $00C0			; CC C0 00 | Compare Y register (absolute)
	BMI $FF			  ; 30 FF | Branch if negative
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY $30CF			; CC CF 30 | Compare Y register (absolute)
	BEQ $03			  ; F0 03 | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $0F			  ; 30 0F | Branch if negative
	CPY #$F3			 ; C0 F3 | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BMI $C3			  ; 30 C3 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0C4
; Address: $EDDE0B
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0C4:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$F3			 ; C0 F3 | Compare Y register (immediate)
	CPY $0F03			; CC 03 0F | Compare Y register (absolute)
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $CF			  ; 30 CF | Branch if negative
	BEQ $C3			  ; F0 C3 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BMI $CF			  ; 30 CF | Branch if negative
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $FC			  ; F0 FC | Branch if equal
	CPY $0CF3			; CC F3 0C | Compare Y register (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BMI $33			  ; 30 33 | Branch if negative
	CPY $00FF			; CC FF 00 | Compare Y register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	CPY $FF33			; CC 33 FF | Compare Y register (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BMI $C0			  ; 30 C0 | Branch if negative
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0C5
; Address: $EDDFB7
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0C5:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $CF			  ; 30 CF | Branch if negative
	CPY #$F3			 ; C0 F3 | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	REP #$03			 ; C2 03 | Reset processor status bits
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	INC $E000			; EE 00 E0 | Game work RAM access
	AND $04FF,Y		  ; 39 FF 04 | Logical AND with accumulator (absolute,Y)
	BVS $3F			  ; 70 3F | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA				  ; 9F FF 6F 1F | Update graphics data
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $1F			  ; F0 1F | Branch if equal
	INC $FF1C,X		  ; FE 1C FF | Increment (absolute,X)
	ROL $7FFF,X		  ; 3E FF 7F | Rotate left (absolute,X)
	SEP #$FD			 ; E2 FD | Set processor status bits
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $7F			  ; F0 7F | Branch if equal
	PLX				  ; FA | Pull X register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0C6
; Address: $EDE108
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0C6:
	BMI $00			  ; 30 00 | Branch if negative
	SBC $FF60,Y		  ; F9 60 FF | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0C7
; Address: $EDE122
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0C7:
	SEC				  ; 38 | Set carry flag
	JMP $9C03			; 4C 03 9C | Jump to address
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $00			  ; B0 00 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0C8
; Address: $EDE13C
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0C8:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ASL $10FF,X		  ; 1E FF 10 | Arithmetic shift left (absolute,X)
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	INC				  ; 1A | Increment accumulator
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	ORA ($BF,X)		  ; 01 BF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	SBC ($DF),Y		  ; F1 DF | Subtract with carry ((zero page),Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $869F,X		  ; FD 9F 86 | Subtract with carry (absolute,X)
	ADC $FF00,Y		  ; 79 00 FF | Add with carry (absolute,Y)
	INC $FFC1,X		  ; FE C1 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0C9
; Address: $EDE1CC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0C9:
	JSR $183F			; 20 3F 18 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0CA
; Address: $EDE1E2
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0CA:
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BEQ $7F			  ; F0 7F | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	BNE $FF			  ; D0 FF | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $FE03,X		  ; FE 03 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0CB
; Address: $EDE26A
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0CB:
	BMI $1F			  ; 30 1F | Branch if negative
	BEQ $1F			  ; F0 1F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA				  ; 9F 01 FF 81 | Update graphics data
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	INC $F600,X		  ; FE 00 F6 | Increment (absolute,X)
	ORA ($61,X)		  ; 01 61 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BPL $D8			  ; 10 D8 | Branch if positive
	BPL $D8			  ; 10 D8 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0CC
; Address: $EDE2EE
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0CC:
	LDA $FF58,X		  ; BD 58 FF | Read graphics status
	BPL $27			  ; 10 27 | Branch if positive
	BPL $27			  ; 10 27 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF 7F FF 3F | Read graphics status
	INC $FE07,X		  ; FE 07 FE | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $FB			  ; F0 FB | Branch if equal
	CPX $FB			  ; E4 FB | Compare X register (zero page)
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CMP $CF6F,X		  ; DD 6F CF | Compare accumulator (absolute,X)
	DEC $5EDD			; CE DD 5E | Decrement (absolute)
	PLY				  ; 7A | Pull Y register from stack
	TSX				  ; BA | Transfer stack pointer to X register
	PLY				  ; 7A | Pull Y register from stack
	TSX				  ; BA | Transfer stack pointer to X register
	RTI				  ; 40 | Return from interrupt
	STZ $9E50			; 9C 50 9E | Store zero to absolute
	BVS $BE			  ; 70 BE | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0CD
; Address: $EDE3B7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0CD:
	LDX $AF78,Y		  ; BE 78 AF | Load from absolute,Y into X register
	SEI				  ; 78 | Set interrupt disable flag
	LDA $1DE71D		  ; AF 1D E7 1D | Read graphics status
	STY $FC87			; 8C 87 FC | Store Y register to absolute address
	INY				  ; C8 | Increment Y register
	BRA $7F			  ; 80 7F | Branch always
	WDM #$7F			 ; 42 7F | Reserved instruction
	SEI				  ; 78 | Set interrupt disable flag
	ORA $1DFF			; 0D FF 1D | Logical OR with accumulator (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $02			  ; 80 02 | Branch always
	BRA $02			  ; 80 02 | Branch always

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0CF
; Address: $EDE3EB
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0CF:
	STA $02038E		  ; 8F 8E 03 02 | Update graphics data
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	STY $3CFF			; 8C FF 3C | Store Y register to absolute address
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $FD07,X		  ; FD 07 FD | Subtract with carry (absolute,X)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $FDFA,X		  ; FD FA FD | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	NOP				  ; EA | No operation
	CMP $EC			  ; C5 EC | Compare accumulator (zero page)
	SBC $0007,Y		  ; F9 07 00 | Subtract with carry (absolute,Y)
	BPL $07			  ; 10 07 | Branch if positive
	BPL $07			  ; 10 07 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	LDY $BC7C,X		  ; BC 7C BC | Load from absolute,X into Y register
	JMP $F81CB8		  ; 5C B8 1C F8 | Jump to address long
	SED				  ; F8 | Set decimal mode flag
	STZ $9C78			; 9C 78 9C | Store zero to absolute
	SEI				  ; 78 | Set interrupt disable flag
	LDY $1B50,X		  ; BC 50 1B | Load from absolute,X into Y register
	ADC $6D1B,X		  ; 7D 1B 6D | Add with carry (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0D0
; Address: $EDE484
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0D0:
	EOR #$4F			 ; 49 4F | Exclusive OR with accumulator (immediate)
	EOR $595F,Y		  ; 59 5F 59 | Exclusive OR with accumulator (absolute,Y)
	STA ($97),Y		  ; 91 97 | Update graphics data
	BPL $96			  ; 10 96 | Branch if positive
	BRA $86			  ; 80 86 | Branch always
	BRA $9F			  ; 80 9F | Branch always
	BCC $FF			  ; 90 FF | Branch if carry clear
	BCS $FF			  ; B0 FF | Branch if carry set
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	SBC $027F,Y		  ; F9 7F 02 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0D1
; Address: $EDE4AB
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0D1:
	JSR $007F			; 20 7F 00 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BVS $1F			  ; 70 1F | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	DEC $FE03			; CE 03 FE | Decrement (absolute)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BMI $00			  ; 30 00 | Branch if negative
	SBC ($FC,X)		  ; E1 FC | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVS $FE			  ; 70 FE | Branch if overflow set
	BRA $7D			  ; 80 7D | Branch always
	STX $7D			  ; 86 7D | Store X register to zero page
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BEQ $9F			  ; F0 9F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	ROL $7CE7,X		  ; 3E E7 7C | Rotate left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	CPY $73			  ; C4 73 | Compare Y register (zero page)
	ROR $C9			  ; 66 C9 | Rotate right (zero page)
	STA $8B			  ; 85 8B | Update graphics data
	STY $ED15			; 8C 15 ED | Store Y register to absolute address
	BPL $0F			  ; 10 0F | Branch if positive
	BVS $0F			  ; 70 0F | Branch if overflow set
	BEQ $0F			  ; F0 0F | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	ROL $7CF2,X		  ; 3E F2 7C | Rotate left (absolute,X)
	PLX				  ; FA | Pull X register from stack
	LDX $FA			  ; A6 FA | Load from zero page into X register
	STZ $F7			  ; 64 F7 | Store zero to zero page
	ADC #$F7			 ; 69 F7 | Add with carry (immediate)
	ADC #$ED			 ; 69 ED | Add with carry (immediate)
	AND ($CF),Y		  ; 31 CF | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0D2
; Address: $EDE554
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0D2:
	AND ($CF),Y		  ; 31 CF | Logical AND with accumulator ((zero page),Y)
	CMP $9F61,X		  ; DD 61 9F | Compare accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0D3
; Address: $EDE55B
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0D3:
	STA				  ; 9F 60 9F E0 | Update graphics data
	BRA $84			  ; 80 84 | Branch always
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	DEX				  ; CA | Decrement X register
	DEY				  ; 88 | Decrement Y register
	DEC $DDC8			; CE C8 DD | Decrement (absolute)
	EOR $51DC,Y		  ; 59 DC 51 | Exclusive OR with accumulator (absolute,Y)
	INC $DE23,X		  ; FE 23 DE | Increment (absolute,X)
	SBC $7A37,Y		  ; F9 37 7A | Subtract with carry (absolute,Y)
	LDA $00FF00		  ; AF 00 FF 00 | Read graphics status
	LDA				  ; BF 78 BF 7C | Read graphics status
	LSR $C3BF			; 4E BF C3 | Logical shift right (absolute)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0D4
; Address: $EDE5AC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0D4:
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BPL $FF			  ; 10 FF | Branch if positive
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FF03,X		  ; FE 03 FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $0E97			; EE 97 0E | Increment (absolute)
	ORA $E9FF			; 0D FF E9 | Logical OR with accumulator (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	NOP				  ; EA | No operation
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0D6
; Address: $EDE636
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0D6:
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	AND $3F00,X		  ; 3D 00 3F | Logical AND with accumulator (absolute,X)
	INC $FBEB,X		  ; FE EB FB | Increment (absolute,X)
	DEC $FD			  ; C6 FD | Decrement (zero page)
	SBC $FFB6,X		  ; FD B6 FF | Subtract with carry (absolute,X)
	LDY $F3			  ; A4 F3 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0D7
; Address: $EDE64B
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0D7:
	ADC $69F7			; 6D F7 69 | Add with carry (absolute)
	INC $17E8			; EE E8 17 | Increment (absolute)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BNE $2F			  ; D0 2F | Branch if not equal
	BCS $4F			  ; B0 4F | Branch if carry set
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	INC $19			  ; E6 19 | Increment (zero page)
	LDA $BD56,Y		  ; B9 56 BD | Read graphics status
	LSR $7B			  ; 46 7B | Logical shift right (zero page)
	STY $73			  ; 84 73 | Store Y register to zero page
	STY $2DF2			; 8C F2 2D | Store Y register to absolute address
	ADC $6BB4			; 6D B4 6B | Add with carry (absolute)
	BPL $EF			  ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0D9
; Address: $EDE67C
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0D9:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BRA $F8			  ; 80 F8 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	BRA $07			  ; 80 07 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BPL $1F			  ; 10 1F | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0DA
; Address: $EDE722
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0DA:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	AND $FD39,Y		  ; 39 39 FD | Logical AND with accumulator (absolute,Y)
	SBC $EEEE,X		  ; FD EE EE | Subtract with carry (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0DB
; Address: $EDE748
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0DB:
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SBC $FFFE,X		  ; FD FE FF | Subtract with carry (absolute,X)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	ROR $2FC5,X		  ; 7E C5 2F | Rotate right (absolute,X)
	BNE $6D			  ; D0 6D | Branch if not equal
	STA ($5B,X)		  ; 81 5B | Update graphics data
	LDX $77			  ; A6 77 | Load from zero page into X register
	TXA				  ; 8A | Transfer X register to accumulator
	LSR $45BE			; 4E BE 45 | Logical shift right (absolute)
	STY $FB			  ; 84 FB | Store Y register to zero page
	ORA #$76			 ; 09 76 | Logical OR with accumulator (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	INC $D89E			; EE 9E D8 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0DC
; Address: $EDE785
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0DC:
	JSR $29D9			; 20 D9 29 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	INC $7C0F,X		  ; FE 0F 7C | Increment (absolute,X)
	STA $C64C9B		  ; 8F 9B 4C C6 | Update graphics data
	AND $738D,Y		  ; 39 8D 73 | Logical AND with accumulator (absolute,Y)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	LDA $103F40		  ; AF 40 3F 10 | Read graphics status
	STA $B4EF10		  ; 8F 10 EF B4 | Update graphics data
	AND $DB			  ; 25 DB | Logical AND with accumulator (zero page)
	AND #$D7			 ; 29 D7 | Logical AND with accumulator (immediate)
	AND #$D7			 ; 29 D7 | Logical AND with accumulator (immediate)
	ADC #$B7			 ; 69 B7 | Add with carry (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	DEX				  ; CA | Decrement X register
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $78			  ; 80 78 | Branch always
	SED				  ; F8 | Set decimal mode flag
	ORA $FB			  ; 05 FB | Logical OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0DD
; Address: $EDE802
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0DD:
	BRA $FF			  ; 80 FF | Branch always
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $1AF8			; 0E F8 1A | Arithmetic shift left (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0DE
; Address: $EDE848
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0DE:
	JSR $183F			; 20 3F 18 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	BVS $DF			  ; 70 DF | Branch if overflow set
	BNE $0F			  ; D0 0F | Branch if not equal

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0DF
; Address: $EDE87E
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0DF:
	JSR $FF00			; 20 00 FF | Jump to subroutine
	LDA				  ; BF FF 7F 9F | Read graphics status
	LDA				  ; BF FF FF FF | Read graphics status
	SBC $F4FA,Y		  ; F9 FA F4 | Subtract with carry (absolute,Y)
	SBC $E7FF,Y		  ; F9 FF E7 | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	JMP ($DD93)		  ; 6C 93 DD | Jump to address (absolute indirect)
	LDX $5D			  ; A6 5D | Load from zero page into X register
	LDX $2DDA			; AE DA 2D | Load from absolute address into X register
	TSX				  ; BA | Transfer stack pointer to X register
	EOR $5BBC,X		  ; 5D BC 5B | Exclusive OR with accumulator (absolute,X)
	AND $72FF,Y		  ; 39 FF 72 | Logical AND with accumulator (absolute,Y)
	LDA				  ; BF 00 FF 00 | Read graphics status
	LDA $767F,Y		  ; B9 7F 76 | Read graphics status
	LDY $B949,X		  ; BC 49 B9 | Load from absolute,X into Y register
	ASL $3EEF			; 0E EF 3E | Arithmetic shift left (absolute)
	INC $FD4A,X		  ; FE 4A FD | Increment (absolute,X)
	SBC $BF46,X		  ; FD 46 BF | Subtract with carry (absolute,X)
	JMP $10BF			; 4C BF 10 | Jump to address
	BPL $EF			  ; 10 EF | Branch if positive
	CMP ($ED),Y		  ; D1 ED | Compare accumulator ((zero page),Y)
	DEC $BA4A,X		  ; DE 4A BA | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0E0
; Address: $EDE908
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0E0:
	PLA				  ; 68 | Pull accumulator from stack
	LDA $7390,Y		  ; B9 90 73 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	BRA $FF			  ; 80 FF | Branch always
	BVS $0F			  ; 70 0F | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	ADC $FEFE,X		  ; 7D FE FE | Add with carry (absolute,X)
	ADC $FF7D,X		  ; 7D 7D FF | Add with carry (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	AND $80FE,Y		  ; 39 FE 80 | Logical AND with accumulator (absolute,Y)
	BRA $FF			  ; 80 FF | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $9EFF,X		  ; FE FF 9E | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $FDFA,X		  ; FD FA FD | Subtract with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	DEC $80FF			; CE FF 80 | Decrement (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $C3			  ; E6 C3 | Increment (zero page)
	CMP ($7F,X)		  ; C1 7F | Compare accumulator ((zero page,X))
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ADC $FF07,Y		  ; 79 07 FF | Add with carry (absolute,Y)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	LDA				  ; BF 5F 5F FF | Read graphics status
	LSR $65FE,X		  ; 5E FE 65 | Logical shift right (absolute,X)
	SBC $4C			  ; E5 4C | Subtract with carry (zero page)
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	LDA				  ; BF 1F FF 0F | Read graphics status
	ASL $20FF,X		  ; 1E FF 20 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SEP #$E7			 ; E2 E7 | Set processor status bits
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $EF			  ; 66 EF | Rotate right (zero page)
	CMP $9D85,X		  ; DD 85 9D | Compare accumulator (absolute,X)
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0E1
; Address: $EDEA5C
; Size: 122 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0E1:
	JSL $FF62FF		  ; 22 FF 62 FF | Jump to subroutine long
	ROR $37B7,X		  ; 7E B7 37 | Rotate right (absolute,X)
	INC $FE6D,X		  ; FE 6D FE | Increment (absolute,X)
	ADC $6BFF			; 6D FF 6B | Add with carry (absolute)
	SBC $FCDB,X		  ; FD DB FC | Subtract with carry (absolute,X)
	STX $B6AC			; 8E AC B6 | Store X register to absolute address
	BCC $08			  ; 90 08 | Branch if carry clear
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SBC $FC03,X		  ; FD 03 FC | Subtract with carry (absolute,X)
	BVC $FD			  ; 50 FD | Branch if overflow clear
	CMP $FF19,Y		  ; D9 19 FF | Compare accumulator (absolute,Y)
	STA ($7F),Y		  ; 91 7F | Update graphics data
	AND #$F5			 ; 29 F5 | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$D2			 ; E2 D2 | Set processor status bits
	BRA $7F			  ; 80 7F | Branch always
	BRA $5F			  ; 80 5F | Branch always
	STZ $9F			  ; 64 9F | Store zero to zero page
	AND $0DDF			; 2D DF 0D | Logical AND with accumulator (absolute)
	STA				  ; 9F FF 9F FF | Update graphics data
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CMP $F0FF,Y		  ; D9 FF F0 | Compare accumulator (absolute,Y)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	CMP $F4D9,Y		  ; D9 D9 F4 | Compare accumulator (absolute,Y)
	PEA #$FFFC		   ; F4 FC FF | Push effective address to stack
	INC $7FFF,X		  ; FE FF 7F | Increment (absolute,X)
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	INC $7FFE,X		  ; FE FE 7F | Increment (absolute,X)
	INC $E0FE,X		  ; FE FE E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	BRA $A6			  ; 80 A6 | Branch always
	STA				  ; 9F FF DF FF | Update graphics data
	LDA				  ; BF BF DF DF | Read graphics status
	INC $E51B,X		  ; FE 1B E5 | Increment (absolute,X)
	STA $1B			  ; 85 1B | Update graphics data
	CPX $83			  ; E4 83 | Compare X register (zero page)
	INC $F4FF,X		  ; FE FF F4 | Increment (absolute,X)
	SBC $1AFE,Y		  ; F9 FE 1A | Subtract with carry (absolute,Y)
	ORA $FEF9,X		  ; 1D F9 FE | Logical OR with accumulator (absolute,X)
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	TAX				  ; AA | Transfer accumulator to X register
	LDA $FFF8			; AD F8 FF | Read graphics status
	BEQ $F7			  ; F0 F7 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0E3
; Address: $EDEB4A
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0E3:
	PLB				  ; AB | Pull data bank register from stack
	PHB				  ; 8B | Push data bank register to stack
	INC $7FFE,X		  ; FE FE 7F | Increment (absolute,X)
	STA				  ; 9F FF 5F FF | Update graphics data
	ORA $CBFD			; 0D FD CB | Logical OR with accumulator (absolute)
	PLB				  ; AB | Pull data bank register from stack
	SBC $FFE8,X		  ; FD E8 FF | Subtract with carry (absolute,X)
	DEC $77CE			; CE CE 77 | Decrement (absolute)
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	LDY $93C3,X		  ; BC C3 93 | Load from absolute,X into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDA				  ; BF BF BF BF | Read graphics status
	STA				  ; 9F 00 FF 00 | Update graphics data
	STA				  ; 9F 60 00 00 | Update graphics data
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0E4
; Address: $EDEBE8
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0E4:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	ROL $FF3E,X		  ; 3E 3E FF | Rotate left (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BMI $CF			  ; 30 CF | Branch if negative
	INC $E0FE,X		  ; FE FE E0 | Game work RAM access
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $E5			  ; E5 E5 | Subtract with carry (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	BCC $E7			  ; 90 E7 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F A0 F3 CB | Update graphics data
	BCC $C7			  ; 90 C7 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0E5
; Address: $EDEC37
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0E5:
	CMP $FF00,X		  ; DD 00 FF | Compare accumulator (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA $09F0			; 8D F0 09 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	AND #$39			 ; 29 39 | Logical AND with accumulator (immediate)
	PHY				  ; 5A | Push Y register to stack
	DEC				  ; 3A | Decrement accumulator
	BVS $79			  ; 70 79 | Branch if overflow set
	BEQ $A6			  ; F0 A6 | Branch if equal
	BIT $CF			  ; 24 CF | Test bits in accumulator (zero page)
	STA $FF			  ; 85 FF | Update graphics data
	INC $FFC6,X		  ; FE C6 FF | Increment (absolute,X)
	CMP $BF			  ; C5 BF | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0E6
; Address: $EDEC5A
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0E6:
	INC				  ; 1A | Increment accumulator
	SBC $B57A,X		  ; FD 7A B5 | Subtract with carry (absolute,X)
	CMP $8700			; CD 00 87 | Compare accumulator (absolute)
	LDX $E8A2,Y		  ; BE A2 E8 | Load from absolute,Y into X register
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	BRA $2C			  ; 80 2C | Branch always
	PHP				  ; 08 | Push processor status to stack
	EOR $6D09,Y		  ; 59 09 6D | Exclusive OR with accumulator (absolute,Y)
	AND $54			  ; 25 54 | Logical AND with accumulator (zero page)
	JMP $55F7			; 4C F7 55 | Jump to address
	AND $6FD7			; 2D D7 6F | Logical AND with accumulator (absolute)
	LDA $DBB7,X		  ; BD B7 DB | Read graphics status
	LDA $D0B74A		  ; AF 4A B7 D0 | Read graphics status
	BEQ $61			  ; F0 61 | Branch if equal
	BVS $B0			  ; 70 B0 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	CMP #$E9			 ; C9 E9 | Compare accumulator (immediate)
	SBC #$69			 ; E9 69 | Subtract with carry (immediate)
	ORA ($64,X)		  ; 01 64 | Logical OR with accumulator ((zero page,X))
	BRA $34			  ; 80 34 | Branch always
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	INC $FF07,X		  ; FE 07 FF | Increment (absolute,X)
	LDA				  ; BF 76 9F 1E | Read graphics status
	SBC $FB1F,X		  ; FD 1F FB | Subtract with carry (absolute,X)
	STA $25CD			; 8D CD 25 | Update graphics data
	SBC $05			  ; E5 05 | Subtract with carry (zero page)
	SBC $93			  ; E5 93 | Subtract with carry (zero page)
	ADC $3F3E,X		  ; 7D 3E 3F | Add with carry (absolute,X)
	ORA $00FF			; 0D FF 00 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF F2 FF F6 | Read graphics status
	ASL $E6			  ; 06 E6 | Arithmetic shift left (zero page)
	PLY				  ; 7A | Pull Y register from stack
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	ADC $FBFF,Y		  ; 79 FF FB | Add with carry (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0E7
; Address: $EDECEC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0E7:
	LDA				  ; BF 3F DF 1C | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	ADC $FF7D,X		  ; 7D 7D FF | Add with carry (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0E9
; Address: $EDECFE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0E9:
	SBC $E71C,X		  ; FD 1C E7 | Subtract with carry (absolute,X)
	LDA ($FF,X)		  ; A1 FF | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	LDA $EBAD			; AD AD EB | Read graphics status
	INC $FEB2,X		  ; FE B2 FE | Increment (absolute,X)
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	SBC $ADFF,X		  ; FD FF AD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0EA
; Address: $EDED2B
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0EA:
	LDX $0279			; AE 79 02 | Load from absolute address into X register
	CPX $D807			; EC 07 D8 | Compare X register (absolute)
	SBC $FCFE,X		  ; FD FE FC | Subtract with carry (absolute,X)
	LDA $D803B4		  ; AF B4 03 D8 | Read graphics status
	LDA $AF17FB		  ; AF FB 17 AF | Read graphics status
	LDA				  ; BF 2F FF 93 | Read graphics status
	LDA				  ; BF FF FF B3 | Read graphics status
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	LDA				  ; BF FF BF FF | Read graphics status
	SBC ($40,X)		  ; E1 40 | Subtract with carry ((zero page,X))
	LDA				  ; BF 9C FF F8 | Read graphics status
	SBC $CFFF			; ED FF CF | Subtract with carry (absolute)
	LDA				  ; BF 53 53 9D | Read graphics status
	STA $FADA,X		  ; 9D DA FA | Update graphics data
	CMP $CFFD			; CD FD CF | Compare accumulator (absolute)
	SBC $BF			  ; E5 BF | Subtract with carry (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BMI $CF			  ; 30 CF | Branch if negative
	STX $FF			  ; 86 FF | Store X register to zero page
	STA				  ; 9F FF DF FF | Update graphics data
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	PEA #$FFFF		   ; F4 FF FF | Push effective address to stack
	ADC $B679,Y		  ; 79 79 B6 | Add with carry (absolute,Y)
	STA				  ; 9F 9F DF DF | Update graphics data
	INC $F4FD,X		  ; FE FD F4 | Increment (absolute,X)
	INC $1801,X		  ; FE 01 18 | Increment (absolute,X)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	SBC $FFFF			; ED FF FF | Subtract with carry (absolute)
	LDA				  ; BF 3F FF 1F | Read graphics status
	STA ($81,X)		  ; 81 81 | Update graphics data
	SBC $FFED			; ED ED FF | Subtract with carry (absolute)
	STA $FFEFFF		  ; 8F FF EF FF | Update graphics data
	STA $EFEF8F		  ; 8F 8F EF EF | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	REP #$FD			 ; C2 FD | Reset processor status bits
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX $FB			  ; E4 FB | Compare X register (zero page)
	STA				  ; 9F 9F C7 C7 | Update graphics data
	INC $E3EE			; EE EE E3 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0EB
; Address: $EDEE30
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0EB:
	JSR $8080			; 20 80 80 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	SBC $F700,X		  ; FD 00 F7 | Subtract with carry (absolute,X)
	INC $D802,X		  ; FE 02 D8 | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	LDA				  ; BF 00 27 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	BRA $01			  ; 80 01 | Branch always

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0EC
; Address: $EDEE5C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0EC:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0ED
; Address: $EDEE6B
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0ED:
	BRA $EF			  ; 80 EF | Branch always
	BIT $B793			; 2C 93 B7 | Test bits in accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	LDY $8100			; AC 00 81 | Load from absolute address into Y register
	PHP				  ; 08 | Push processor status to stack
	BCS $64			  ; B0 64 | Branch if carry set
	STY $10			  ; 84 10 | Store Y register to zero page
	BMI $00			  ; 30 00 | Branch if negative
	PLY				  ; 7A | Pull Y register from stack
	STA				  ; 9F F9 4F 7C | Update graphics data
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	SBC $FC83,X		  ; FD 83 FC | Subtract with carry (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $2FEE,X		  ; 9D EE 2F | Update graphics data
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	PEA #$FCFF		   ; F4 FF FC | Push effective address to stack
	LDA				  ; BF D0 3F 18 | Read graphics status
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX $AEBD			; EC BD AE | Compare X register (absolute)
	BRA $EF			  ; 80 EF | Branch always
	BEQ $F5			  ; F0 F5 | Branch if equal
	INC				  ; 1A | Increment accumulator
	BPL $EF			  ; 10 EF | Branch if positive
	BVC $EF			  ; 50 EF | Branch if overflow clear
	LDY $0DC3			; AC C3 0D | Load from absolute address into Y register
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0EE
; Address: $EDEEDA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0EE:
	JSR $501E			; 20 1E 50 | Jump to subroutine
	XBA				  ; EB | Exchange accumulator bytes
	TSX				  ; BA | Transfer stack pointer to X register
	BCS $E0			  ; B0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0EF
; Address: $EDEEE3
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0EF:
	JSR $D2B3			; 20 B3 D2 | Jump to subroutine
	INC $39			  ; E6 39 | Increment (zero page)
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	PHX				  ; DA | Push X register to stack
	AND $B7			  ; 25 B7 | Logical AND with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BCS $1F			  ; B0 1F | Branch if carry set
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STA $4202,Y		  ; 99 02 42 | Hardware register operation
	LDA $00			  ; A5 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0F0
; Address: $EDEF00
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0F0:
	PHY				  ; 5A | Push Y register to stack
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	ASL $3EE4			; 0E E4 3E | Arithmetic shift left (absolute)
	AND $DACF,X		  ; 3D CF DA | Logical AND with accumulator (absolute,X)
	BIT $6A95			; 2C 95 6A | Test bits in accumulator (absolute)
	INC $A101,X		  ; FE 01 A1 | Increment (absolute,X)
	ASL $1EE1,X		  ; 1E E1 1E | Arithmetic shift left (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA ($0C),Y		  ; B1 0C | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0F1
; Address: $EDEF20
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0F1:
	STA $150F,Y		  ; 99 0F 15 | Update graphics data
	PHX				  ; DA | Push X register to stack
	LDA $00FF74		  ; AF 74 FF 00 | Read graphics status
	BPL $BF			  ; 10 BF | Branch if positive
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	STY $FF			  ; 84 FF | Store Y register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PHX				  ; DA | Push X register to stack
	SBC $F9D8,Y		  ; F9 D8 F9 | Subtract with carry (absolute,Y)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	BRA $7F			  ; 80 7F | Branch always
	LDY $3A43,X		  ; BC 43 3A | Load from absolute,X into Y register
	STA				  ; 9F 00 C0 40 | Update graphics data
	SBC $B5F7,X		  ; FD F7 B5 | Subtract with carry (absolute,X)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	JMP $FF04F3		  ; 5C F3 04 FF | Jump to address long
	INX				  ; E8 | Increment X register
	LDA				  ; BF FF FF F7 | Read graphics status
	LDA				  ; BF FE FE E7 | Read graphics status
	DEX				  ; CA | Decrement X register
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	LDA				  ; BF 47 FF C3 | Read graphics status
	LDA				  ; BF A3 FE 01 | Read graphics status
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	CPX #$7D			 ; E0 7D | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0F2
; Address: $EDEFB0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0F2:
	INC $FFE0,X		  ; FE E0 FF | Increment (absolute,X)
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)
	REP #$7F			 ; C2 7F | Reset processor status bits
	STZ $8060			; 9C 60 80 | Store zero to absolute
	ORA ($69,X)		  ; 01 69 | Logical OR with accumulator ((zero page,X))
	ADC #$FF			 ; 69 FF | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0F3
; Address: $EDEFCA
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0F3:
	STA				  ; 9F 00 FF 00 | Update graphics data
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ADC #$F3			 ; 69 F3 | Add with carry (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	NOP				  ; EA | No operation
	PLP				  ; 28 | Pull processor status from stack
	BRA $61			  ; 80 61 | Branch always
	ROL $00			  ; 26 00 | Rotate left (zero page)
	SBC $E800			; ED 00 E8 | Subtract with carry (absolute)
	ADC $FB02,X		  ; 7D 02 FB | Add with carry (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	REP #$00			 ; C2 00 | Reset processor status bits
	BCS $00			  ; B0 00 | Branch if carry set
	NOP				  ; EA | No operation
	BMI $00			  ; 30 00 | Branch if negative
	LSR $EF80,X		  ; 5E 80 EF | Logical shift right (absolute,X)
	BPL $BA			  ; 10 BA | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BRA $21			  ; 80 21 | PPU graphics register access
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	LDY #$3F			 ; A0 3F | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $94			  ; 10 94 | Branch if positive
	LSR $FE00,X		  ; 5E 00 FE | Logical shift right (absolute,X)
	LDA #$00			 ; A9 00 | Read graphics status
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	REP #$00			 ; C2 00 | Reset processor status bits
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BPL $74			  ; 10 74 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	PEA #$FF00		   ; F4 00 FF | Push effective address to stack
	PLX				  ; FA | Pull X register from stack
	XBA				  ; EB | Exchange accumulator bytes
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	LDA				  ; BF 00 FE 00 | Read graphics status
	BPL $B7			  ; 10 B7 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	LDA #$04			 ; A9 04 | Read graphics status

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0F4
; Address: $EDF0EC
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0F4:
	EOR $8200			; 4D 00 82 | Exclusive OR with accumulator (absolute)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	SBC $1A			  ; E5 1A | Subtract with carry (zero page)
	STY $00FE			; 8C FE 00 | Store Y register to absolute address
	SBC $3B02,X		  ; FD 02 3B | Subtract with carry (absolute,X)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	CMP ($14,X)		  ; C1 14 | Compare accumulator ((zero page,X))
	SEP #$0E			 ; E2 0E | Set processor status bits
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $006F			; 0E 6F 00 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	ADC $1D4F			; 6D 4F 1D | Add with carry (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	AND $DB			  ; 25 DB | Logical AND with accumulator (zero page)
	SBC $FE4F,X		  ; FD 4F FE | Subtract with carry (absolute,X)
	ORA ($7D,X)		  ; 01 7D | Logical OR with accumulator ((zero page,X))
	BMI $CF			  ; 30 CF | Branch if negative
	REP #$00			 ; C2 00 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	LDA $E17D,X		  ; BD 7D E1 | Read graphics status
	LDA #$1F			 ; A9 1F | Read graphics status
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	SBC $FFE1,X		  ; FD E1 FF | Subtract with carry (absolute,X)
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	EOR #$BF			 ; 49 BF | Exclusive OR with accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	BCS $AC			  ; B0 AC | Branch if carry set
	LDA $C3FF9E		  ; AF 9E FF C3 | Read graphics status
	SEP #$FF			 ; E2 FF | Set processor status bits
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	LDA $FFFF9E		  ; AF 9E FF FF | Read graphics status
	SEP #$FF			 ; E2 FF | Set processor status bits
	STA $7400,Y		  ; 99 00 74 | Update graphics data
	STZ $607F			; 9C 7F 60 | Store zero to absolute
	INC $30FF,X		  ; FE FF 30 | Increment (absolute,X)
	STA $1966FF		  ; 8F FF 66 19 | Update graphics data
	SBC $C306,Y		  ; F9 06 C3 | Subtract with carry (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0F5
; Address: $EDF19A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0F5:
	INC $30FF,X		  ; FE FF 30 | Increment (absolute,X)
	STA $008DFF		  ; 8F FF 8D 00 | Update graphics data
	STA $E2C0,X		  ; 9D C0 E2 | Update graphics data
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0F6
; Address: $EDF1AC
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0F6:
	BRA $FF			  ; 80 FF | Branch always
	LDA ($FF,X)		  ; A1 FF | Read graphics status
	BRA $A2			  ; 80 A2 | Branch always
	CMP $FFC2,X		  ; DD C2 FF | Compare accumulator (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $FF			  ; 80 FF | Branch always
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	LDX $00			  ; A6 00 | Load from zero page into X register
	AND #$C2			 ; 29 C2 | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	STZ $83FF			; 9C FF 83 | Store zero to absolute
	SBC $1406,Y		  ; F9 06 14 | Subtract with carry (absolute,Y)
	XBA				  ; EB | Exchange accumulator bytes
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	STZ $83FF			; 9C FF 83 | Store zero to absolute
	LDA $CD00,X		  ; BD 00 CD | Read graphics status
	CMP $3B			  ; C5 3B | Compare accumulator (zero page)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $30			  ; 80 30 | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0F7
; Address: $EDF227
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0F7:
	JSL $6810F7		  ; 22 F7 10 68 | Jump to subroutine long
	BRA $2E			  ; 80 2E | Branch always
	BCC $5F			  ; 90 5F | Branch if carry clear
	LDY #$0B			 ; A0 0B | Load immediate value into Y register
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $25			  ; 05 25 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $A541			; 9C 41 A5 | Store zero to absolute
	INC $F701,X		  ; FE 01 F7 | Increment (absolute,X)
	INC $AA00,X		  ; FE 00 AA | Increment (absolute,X)
	AND ($5C,X)		  ; 21 5C | Logical AND with accumulator ((zero page,X))
	LDA ($7D,X)		  ; A1 7D | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	RTI				  ; 40 | Return from interrupt
	CPY #$CB			 ; C0 CB | Compare Y register (immediate)
	LDA				  ; BF 00 F5 0A | Read graphics status
	LDA $807F00		  ; AF 00 7F 80 | Read graphics status
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	LSR $ED00,X		  ; 5E 00 ED | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0F8
; Address: $EDF27C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0F8:
	NOP				  ; EA | No operation
	INC $6D00,X		  ; FE 00 6D | Increment (absolute,X)
	SBC $FE02,X		  ; FD 02 FE | Subtract with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA $B502,X		  ; BD 02 B5 | Read graphics status
	BPL $02			  ; 10 02 | Branch if positive
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ADC $FD00,X		  ; 7D 00 FD | Add with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDA ($02),Y		  ; B1 02 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0F9
; Address: $EDF2AB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0F9:
	JSR $205F			; 20 5F 20 | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0FA
; Address: $EDF2B4
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0FA:
	JSL $209A08		  ; 22 08 9A 20 | Jump to subroutine long
	JMP $144A			; 4C 4A 14 | Jump to address
	PLY				  ; 7A | Pull Y register from stack
	BRA $5D			  ; 80 5D | Branch always
	LDA				  ; BF 40 BF 40 | Read graphics status
	LSR $FC80,X		  ; 5E 80 FC | Logical shift right (absolute,X)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	BVS $00			  ; 70 00 | Branch if overflow set
	SBC $BF00,Y		  ; F9 00 BF | Subtract with carry (absolute,Y)
	BIT #$EF			 ; 89 EF | Test bits in accumulator (immediate)
	BPL $39			  ; 10 39 | Branch if positive
	ASL $2F			  ; 06 2F | Arithmetic shift left (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ADC $F000,X		  ; 7D 00 F0 | Add with carry (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	INC $9300,X		  ; FE 00 93 | Increment (absolute,X)
	JMP ($FF3E)		  ; 6C 3E FF | Jump to address (absolute indirect)
	LDX $E440,Y		  ; BE 40 E4 | Load from absolute,Y into X register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BMI $0F			  ; 30 0F | Branch if negative
	ROL $FFFF,X		  ; 3E FF FF | Rotate left (absolute,X)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0FB
; Address: $EDF31A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0FB:
	LDA				  ; BF 00 F9 06 | Read graphics status
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 3F F7 07 | Read graphics status
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BIT $0703			; 2C 03 07 | Test bits in accumulator (absolute)
	LDA				  ; BF FD DD F8 | Read graphics status
	INC $D001,X		  ; FE 01 D0 | Increment (absolute,X)
	LDA				  ; BF FF DD 00 | Read graphics status
	STA ($FF,X)		  ; 81 FF | Update graphics data

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0FC
; Address: $EDF344
; Size: 122 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0FC:
	STA				  ; 9F FF F7 F7 | Update graphics data
	EOR ($04),Y		  ; 51 04 | Exclusive OR with accumulator ((zero page),Y)
	CMP #$CF			 ; C9 CF | Compare accumulator (immediate)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	STA				  ; 9F FF FF F7 | Update graphics data
	TSX				  ; BA | Transfer stack pointer to X register
	SBC $EFDF,X		  ; FD DF EF | Subtract with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROL $ADFE,X		  ; 3E FE AD | Rotate left (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $3A00			; 8D 00 3A | Update graphics data
	BRA $C1			  ; 80 C1 | Branch always
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	INC $A8FF,X		  ; FE FF A8 | Increment (absolute,X)
	BRA $45			  ; 80 45 | Branch always
	TSX				  ; BA | Transfer stack pointer to X register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	INC $EBEF			; EE EF EB | Increment (absolute)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	LDY $00			  ; A4 00 | Load from zero page into Y register
	PHP				  ; 08 | Push processor status to stack
	LSR $3E			  ; 46 3E | Logical shift right (zero page)
	SED				  ; F8 | Set decimal mode flag
	INC $FFEF,X		  ; FE EF FF | Increment (absolute,X)
	STA $7E00,X		  ; 9D 00 7E | Update graphics data
	SBC $1A			  ; E5 1A | Subtract with carry (zero page)
	ROR $FFF8,X		  ; 7E F8 FF | Rotate right (absolute,X)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	LDA $AABD,X		  ; BD BD AA | Read graphics status
	PLP				  ; 28 | Pull processor status from stack
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $FF27			; 0D 27 FF | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	LDA $28FF,X		  ; BD FF 28 | Read graphics status
	TYA				  ; 98 | Transfer Y register to accumulator
	STA				  ; 9F FF F3 FF | Update graphics data
	STA				  ; 9F FF E7 FF | Update graphics data
	SBC $0DFD,X		  ; FD FD 0D | Subtract with carry (absolute,X)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	SBC $FDFF,X		  ; FD FF FD | Subtract with carry (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	STA				  ; 9F FF F1 FF | Update graphics data
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA				  ; 9F FF FF FF | Update graphics data
	CPY $1EFF			; CC FF 1E | Compare Y register (absolute)
	STY $FF			  ; 84 FF | Store Y register to zero page
	ASL $FFFF,X		  ; 1E FF FF | Arithmetic shift left (absolute,X)
	STA				  ; 9F 60 93 68 | Update graphics data

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0FD
; Address: $EDF425
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0FD:
	INY				  ; C8 | Increment Y register
	PHA				  ; 48 | Push accumulator to stack
	CMP $7702,X		  ; DD 02 77 | Compare accumulator (absolute,X)
	DEC $6B00			; CE 00 6B | Decrement (absolute)
	LDA $FA00			; AD 00 FA | Read graphics status
	ADC $F180,Y		  ; 79 80 F1 | Add with carry (absolute,Y)
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	LDX $7F00,Y		  ; BE 00 7F | Load from absolute,Y into X register
	STA				  ; 9F 00 05 00 | Update graphics data
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0FE
; Address: $EDF466
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0FE:
	JSR $1400			; 20 00 14 | Jump to subroutine
	ORA $2084,Y		  ; 19 84 20 | Logical OR with accumulator (absolute,Y)
	EOR $0F00			; 4D 00 0F | Exclusive OR with accumulator (absolute)
	STA $6D92			; 8D 92 6D | Update graphics data
	BEQ $0F			  ; F0 0F | Branch if equal
	LSR				  ; 4A | Logical shift right (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$1E			 ; A0 1E | Load immediate value into Y register
	ORA ($DC,X)		  ; 01 DC | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	STY $2373			; 8C 73 23 | Store Y register to absolute address
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$00			 ; A9 00 | Read graphics status
	PHB				  ; 8B | Push data bank register to stack
	ADC $C002,X		  ; 7D 02 C0 | Add with carry (absolute,X)
	INX				  ; E8 | Increment X register
	ROR				  ; 6A | Rotate right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND $DF			  ; 25 DF | Logical AND with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY $5B			  ; A4 5B | Load from zero page into Y register
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	XBA				  ; EB | Exchange accumulator bytes
	AND $1A			  ; 25 1A | Logical AND with accumulator (zero page)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	LDX #$1A			 ; A2 1A | Load immediate value into X register
	CLC				  ; 18 | Clear carry flag
	CPX #$6D			 ; E0 6D | Compare X register (immediate)
	JMP ($1983)		  ; 6C 83 19 | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	ORA #$D5			 ; 09 D5 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_0FF
; Address: $EDF4D5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_0FF:
	ROL				  ; 2A | Rotate left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	SBC $EF93			; ED 93 EF | Subtract with carry (absolute)
	PHB				  ; 8B | Push data bank register to stack
	STZ $F0			  ; 64 F0 | Store zero to zero page
	ORA $60FF			; 0D FF 60 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_100
; Address: $EDF4E8
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_100:
	JSL $1065DD		  ; 22 DD 65 10 | Jump to subroutine long
	BNE $0F			  ; D0 0F | Branch if not equal
	BPL $EF			  ; 10 EF | Branch if positive
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	CMP $55BA,X		  ; DD BA 55 | Compare accumulator (absolute,X)
	BCC $2E			  ; 90 2E | Branch if carry clear
	STZ $00FF,X		  ; 9E FF 00 | Store zero to absolute,X
	LDA				  ; BF BF 77 FF | Read graphics status
	LDX $FFFF,Y		  ; BE FF FF | Load from absolute,Y into X register
	BVS $FF			  ; 70 FF | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BRA $FF			  ; 80 FF | Branch always
	CLC				  ; 18 | Clear carry flag
	ROR $99			  ; 66 99 | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	BVS $FF			  ; 70 FF | Branch if overflow set
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	CLC				  ; 18 | Clear carry flag
	ROR $99			  ; 66 99 | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	BVS $FF			  ; 70 FF | Branch if overflow set
	LDA				  ; BF 40 FD 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_101
; Address: $EDF5A5
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_101:
	JSL $FF02BD		  ; 22 BD 02 FF | Jump to subroutine long
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CPY $FA00			; CC 00 FA | Compare Y register (absolute)
	LDA #$00			 ; A9 00 | Read graphics status
	ADC $6200,X		  ; 7D 00 62 | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BNE $07			  ; D0 07 | Branch if not equal
	STA ($55,X)		  ; 81 55 | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $BF10			; EE 10 BF | Increment (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($AA),Y		  ; 71 AA | Add with carry ((zero page),Y)
	CMP $F500,Y		  ; D9 00 F5 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_102
; Address: $EDF5DA
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_102:
	INC $FC01			; EE 01 FC | Increment (absolute)
	PLP				  ; 28 | Pull processor status from stack
	TXS				  ; 9A | Transfer X register to stack pointer
	INC $FA01,X		  ; FE 01 FA | Increment (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CPX $1F			  ; E4 1F | Compare X register (zero page)
	EOR ($7E,X)		  ; 41 7E | Exclusive OR with accumulator ((zero page,X))
	INC $FBFE,X		  ; FE FE FB | Increment (absolute,X)
	BVS $0F			  ; 70 0F | Branch if overflow set
	STZ $077F			; 9C 7F 07 | Store zero to absolute
	LDX $FE7D,Y		  ; BE 7D FE | Load from absolute,Y into X register
	TXA				  ; 8A | Transfer X register to accumulator
	AND $B1			  ; 25 B1 | Logical AND with accumulator (zero page)
	BIT $C803			; 2C 03 C8 | Test bits in accumulator (absolute)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BPL $EF			  ; 10 EF | Branch if positive
	AND $DE			  ; 25 DE | Logical AND with accumulator (zero page)
	AND $DB			  ; 25 DB | Logical AND with accumulator (zero page)
	INC $FB37,X		  ; FE 37 FB | Increment (absolute,X)
	SBC $7900,X		  ; FD 00 79 | Subtract with carry (absolute,X)
	ADC $FD02,Y		  ; 79 02 FD | Add with carry (absolute,Y)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SBC $79FF,X		  ; FD FF 79 | Subtract with carry (absolute,X)
	ADC $FDFF,Y		  ; 79 FF FD | Add with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	STA $6066,Y		  ; 99 66 60 | Update graphics data
	ORA $9CFF,Y		  ; 19 FF 9C | Logical OR with accumulator (absolute,Y)
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	BRA $7F			  ; 80 7F | Branch always
	BEQ $7F			  ; F0 7F | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	STZ $0063			; 9C 63 00 | Store zero to absolute
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	CPY $60FF			; CC FF 60 | Compare Y register (absolute)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BIT $4B			  ; 24 4B | Test bits in accumulator (zero page)
	BCC $FE			  ; 90 FE | Branch if carry clear
	AND $4F00,X		  ; 3D 00 4F | Logical AND with accumulator (absolute,X)
	BMI $24			  ; 30 24 | Branch if negative

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_103
; Address: $EDF6D1
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_103:
	CLC				  ; 18 | Clear carry flag
	CMP $BB00,X		  ; DD 00 BB | Compare accumulator (absolute,X)
	LDA $002500		  ; AF 00 25 00 | Read graphics status
	BPL $C2			  ; 10 C2 | Branch if positive
	BRA $B7			  ; 80 B7 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BRA $68			  ; 80 68 | Branch always
	BRA $D4			  ; 80 D4 | Branch always
	INC $6901,X		  ; FE 01 69 | Increment (absolute,X)
	JMP $00FF00		  ; 5C 00 FF 00 | Jump to address long
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	STA				  ; 9F 03 63 01 | Update graphics data
	ADC ($C5),Y		  ; 71 C5 | Add with carry ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	EOR #$1E			 ; 49 1E | Exclusive OR with accumulator (immediate)
	LDX #$7C			 ; A2 7C | Load immediate value into X register
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	CPY #$F7			 ; C0 F7 | Compare Y register (immediate)
	CMP ($04),Y		  ; D1 04 | Compare accumulator ((zero page),Y)
	INC $AE1D,X		  ; FE 1D AE | Increment (absolute,X)
	LSR $FE3F,X		  ; 5E 3F FE | Logical shift right (absolute,X)
	INC $F6FF,X		  ; FE FF F6 | Increment (absolute,X)
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	LDA				  ; BF 40 FC 03 | Read graphics status

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_104
; Address: $EDF72F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_104:
	JSR $F73D			; 20 3D F7 | Jump to subroutine
	LDA				  ; BF B7 FF AB | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	CLV				  ; B8 | Clear overflow flag
	STA $077870		  ; 8F 70 78 07 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_105
; Address: $EDF74C
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_105:
	STA $03FC70		  ; 8F 70 FC 03 | Update graphics data
	LDA				  ; BF FF 00 0C | Read graphics status
	BNE $07			  ; D0 07 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $0F			  ; 30 0F | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	REP #$3D			 ; C2 3D | Reset processor status bits
	EOR ($3E,X)		  ; 41 3E | Exclusive OR with accumulator ((zero page,X))
	CMP ($0E,X)		  ; C1 0E | Compare accumulator ((zero page,X))
	ORA $FFCF,X		  ; 1D CF FF | Logical OR with accumulator (absolute,X)
	LDA				  ; BF FF FF FF | Read graphics status
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $0F			  ; 30 0F | Branch if negative

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_106
; Address: $EDF7C2
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_106:
	CLC				  ; 18 | Clear carry flag
	DEC $FF01			; CE 01 FF | Decrement (absolute)
	EOR ($3E,X)		  ; 41 3E | Exclusive OR with accumulator ((zero page,X))
	CMP $8302			; CD 02 83 | Compare accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($A0),Y		  ; 11 A0 | Logical OR with accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	CPX $0A			  ; E4 0A | Compare X register (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA ($48),Y		  ; B1 48 | Read graphics status
	SBC $EE10			; ED 10 EE | Subtract with carry (absolute)
	DEY				  ; 88 | Decrement Y register
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF 00 FE 00 | Read graphics status
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	STY $08			  ; 84 08 | Store Y register to zero page
	LDX $6D00,Y		  ; BE 00 6D | Load from absolute,Y into X register
	RTI				  ; 40 | Return from interrupt
	LDY $EE42,X		  ; BC 42 EE | Load from absolute,X into Y register
	BPL $77			  ; 10 77 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	BIT $FE			  ; 24 FE | Test bits in accumulator (zero page)
	BPL $7F			  ; 10 7F | Branch if positive
	ASL $041F			; 0E 1F 04 | Arithmetic shift left (absolute)
	PLB				  ; AB | Pull data bank register from stack
	PHY				  ; 5A | Push Y register to stack
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ADC $4900,X		  ; 7D 00 49 | Add with carry (absolute,X)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	LDA $BC			  ; A5 BC | Read graphics status
	ORA ($DF,X)		  ; 01 DF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_107
; Address: $EDF847
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_107:
	JSR $28D7			; 20 D7 28 | Jump to subroutine
	LDX $19			  ; A6 19 | Load from zero page into X register
	ADC $7F92			; 6D 92 7F | Add with carry (absolute)
	BRA $FF			  ; 80 FF | Branch always
	AND $FF			  ; 25 FF | Logical AND with accumulator (zero page)
	LDA $E7			  ; A5 E7 | Read graphics status
	STA ($21,X)		  ; 81 21 | PPU graphics register access
	PLP				  ; 28 | Pull processor status from stack
	ORA $9A40,X		  ; 1D 40 9A | Logical OR with accumulator (absolute,X)
	DEX				  ; CA | Decrement X register
	CLC				  ; 18 | Clear carry flag
	LDA				  ; BF 40 FF 00 | Read graphics status
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_108
; Address: $EDF872
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_108:
	STA				  ; 9F 7F 7F FF | Update graphics data
	LDA				  ; BF 7F 2F 27 | Read graphics status
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	INC $C701,X		  ; FE 01 C7 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	LDA				  ; BF FF DF DF | Read graphics status
	ORA $AF			  ; 05 AF | Logical OR with accumulator (zero page)
	ORA $43			  ; 05 43 | Logical OR with accumulator (zero page)
	REP #$3D			 ; C2 3D | Reset processor status bits
	BRA $FF			  ; 80 FF | Branch always
	CMP ($1C,X)		  ; C1 1C | Compare accumulator ((zero page,X))
	BPL $FF			  ; 10 FF | Branch if positive
	SBC $FF06,Y		  ; F9 06 FF | Subtract with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	BEQ $3C			  ; F0 3C | Branch if equal
	RTI				  ; 40 | Return from interrupt
	JMP $0078			; 4C 78 00 | Jump to address
	CLC				  ; 18 | Clear carry flag
	LDA				  ; BF FF FF FF | Read graphics status
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STY $78			  ; 84 78 | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ROR $FD00,X		  ; 7E 00 FD | Rotate right (absolute,X)
	LDA				  ; BF 40 F7 00 | Read graphics status
	DEC $B701,X		  ; DE 01 B7 | Decrement (absolute,X)
	ROL $AA00			; 2E 00 AA | Rotate left (absolute)
	SBC $FD00			; ED 00 FD | Subtract with carry (absolute)
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_109
; Address: $EDF983
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_109:
	JSR $40BF			; 20 BF 40 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($ED,X)		  ; 01 ED | Logical OR with accumulator ((zero page,X))
	PEA #$E500		   ; F4 00 E5 | Push effective address to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	CMP ($12,X)		  ; C1 12 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_10A
; Address: $EDF9A1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_10A:
	JSR $00F7			; 20 F7 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	LSR $FC83			; 4E 83 FC | Logical shift right (absolute)
	TSX				  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_10B
; Address: $EDF9AB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_10B:
	AND ($26),Y		  ; 31 26 | Logical AND with accumulator ((zero page),Y)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	SBC $0000			; ED 00 00 | Subtract with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $8100,Y		  ; 19 00 81 | Logical OR with accumulator (absolute,Y)
	BMI $03			  ; 30 03 | Branch if negative
	STA ($44,X)		  ; 81 44 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_10C
; Address: $EDF9BD
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_10C:
	STA $36C8,Y		  ; 99 C8 36 | Update graphics data
	LDA ($00),Y		  ; B1 00 | Read graphics status
	CLI				  ; 58 | Clear interrupt disable flag
	XBA				  ; EB | Exchange accumulator bytes
	PLY				  ; 7A | Pull Y register from stack
	ORA ($BE,X)		  ; 01 BE | Logical OR with accumulator ((zero page,X))
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	LSR $0029			; 4E 29 00 | Logical shift right (absolute)
	INC				  ; 1A | Increment accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))
	BIT #$40			 ; 89 40 | Test bits in accumulator (immediate)
	SBC $F700,Y		  ; F9 00 F7 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC $7000,Y		  ; F9 00 70 | Subtract with carry (absolute,Y)
	BRA $B7			  ; 80 B7 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $06			  ; 30 06 | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY $F600			; CC 00 F6 | Compare Y register (absolute)
	WDM #$08			 ; 42 08 | Reserved instruction
	LDA				  ; BF 4C D9 22 | Read graphics status
	BVC $FF			  ; 50 FF | Branch if overflow clear
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	WDM #$00			 ; 42 00 | Reserved instruction
	TSX				  ; BA | Transfer stack pointer to X register
	CLC				  ; 18 | Clear carry flag
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	CPX $DE70			; EC 70 DE | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_10D
; Address: $EDFA27
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_10D:
	JSR $40BC			; 20 BC 40 | Jump to subroutine
	ROR $00			  ; 66 00 | Rotate right (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_10E
; Address: $EDFA32
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_10E:
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	AND $7700,Y		  ; 39 00 77 | Logical AND with accumulator (absolute,Y)
	LDA $00FF00		  ; AF 00 FF 00 | Read graphics status
	SBC $DF02,X		  ; FD 02 DF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_10F
; Address: $EDFA41
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_10F:
	JSR $00FE			; 20 FE 00 | Jump to subroutine
	INC $2B00,X		  ; FE 00 2B | Increment (absolute,X)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_110
; Address: $EDFA4C
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_110:
	SED				  ; F8 | Set decimal mode flag
	DEC $6B10			; CE 10 6B | Decrement (absolute)
	ORA ($B5,X)		  ; 01 B5 | Logical OR with accumulator ((zero page,X))
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	ORA $F4			  ; 05 F4 | Logical OR with accumulator (zero page)
	DEC $00FD,X		  ; DE FD 00 | Decrement (absolute,X)
	AND ($02,X)		  ; 21 02 | Logical AND with accumulator ((zero page,X))
	JMP ($E303)		  ; 6C 03 E3 | Jump to address (absolute indirect)
	LDA				  ; BF 40 6F 90 | Read graphics status
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	LDA $1BDF,X		  ; BD DF 1B | Read graphics status
	LDA				  ; BF 40 0F 50 | Read graphics status
	LDA #$42			 ; A9 42 | Hardware register operation
	BIT $10EF			; 2C EF 10 | Test bits in accumulator (absolute)
	SBC $7F00,Y		  ; F9 00 7F | Subtract with carry (absolute,Y)
	XBA				  ; EB | Exchange accumulator bytes
	BIT $D8			  ; 24 D8 | Test bits in accumulator (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $FF00,X		  ; 1E 00 FF | Arithmetic shift left (absolute,X)
	CPY $D733			; CC 33 D7 | Compare Y register (absolute)
	INY				  ; C8 | Increment Y register
	CPY #$F1			 ; C0 F1 | Compare Y register (immediate)
	CPY #$F1			 ; C0 F1 | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	SBC $6900,Y		  ; F9 00 69 | Subtract with carry (absolute,Y)
	AND $E700,X		  ; 3D 00 E7 | Logical AND with accumulator (absolute,X)
	BRA $1B			  ; 80 1B | Branch always
	CLC				  ; 18 | Clear carry flag
	ROL $AF08			; 2E 08 AF | Rotate left (absolute)
	LDA				  ; BF 00 DF 00 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	STA ($18,X)		  ; 81 18 | Update graphics data
	BMI $4C			  ; 30 4C | Branch if negative
	AND $C0			  ; 25 C0 | Logical AND with accumulator (zero page)
	ROR $91			  ; 66 91 | Rotate right (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	BPL $BF			  ; 10 BF | Branch if positive
	INC $FD01,X		  ; FE 01 FD | Increment (absolute,X)
	INC				  ; 1A | Increment accumulator
	BMI $80			  ; 30 80 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	SEP #$01			 ; E2 01 | Set processor status bits
	CMP $0400,Y		  ; D9 00 04 | Compare accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	REP #$0D			 ; C2 0D | Reset processor status bits
	CPY #$9B			 ; C0 9B | Compare Y register (immediate)
	LDA $FE01,Y		  ; B9 01 FE | Read graphics status

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_111
; Address: $EDFB48
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_111:
	EOR $7730			; 4D 30 77 | Exclusive OR with accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	BIT $3F			  ; 24 3F | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	STZ $EC			  ; 64 EC | Store zero to zero page
	ORA ($37,X)		  ; 01 37 | Logical OR with accumulator ((zero page,X))
	BRA $8B			  ; 80 8B | Branch always
	BRA $16			  ; 80 16 | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA $7960,Y		  ; 99 60 79 | Update graphics data
	BRA $A4			  ; 80 A4 | Branch always
	ROR $EE00			; 6E 00 EE | Rotate right (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $BF			  ; F0 BF | Branch if equal
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDA ($40),Y		  ; B1 40 | Read graphics status
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	LSR $5E00			; 4E 00 5E | Logical shift right (absolute)
	LDA $8906,Y		  ; B9 06 89 | Read graphics status
	STA $00087F		  ; 8F 7F 08 00 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	EOR $2302,X		  ; 5D 02 23 | Exclusive OR with accumulator (absolute,X)
	LDA $8E04,Y		  ; B9 04 8E | Read graphics status
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	ORA $F7			  ; 05 F7 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	ASL $2FDF			; 0E DF 2F | Arithmetic shift left (absolute)
	LDA $FD7F,X		  ; BD 7F FD | Read graphics status
	SBC $01A6,X		  ; FD A6 01 | Subtract with carry (absolute,X)
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	CPX #$DA			 ; E0 DA | Compare X register (immediate)
	BCC $20			  ; 90 20 | Branch if carry clear
	ADC $2987,Y		  ; 79 87 29 | Add with carry (absolute,Y)
	LDA				  ; BF FF FF 00 | Read graphics status
	BEQ $00			  ; F0 00 | Branch if equal
	INC $1E0D,X		  ; FE 0D 1E | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	DEC $06			  ; C6 06 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	BEQ $00			  ; F0 00 | Branch if equal
	LSR $86			  ; 46 86 | Logical shift right (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC $F0FF,Y		  ; F9 FF F0 | Subtract with carry (absolute,Y)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_112
; Address: $EDFC2C
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_112:
	DEC $06			  ; C6 06 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	BEQ $00			  ; F0 00 | Branch if equal
	DEC $06			  ; C6 06 | Decrement (zero page)
	SBC $E0FF,Y		  ; F9 FF E0 | Game work RAM access
	STZ $60			  ; 64 60 | Store zero to zero page
	WDM #$42			 ; 42 42 | Hardware register operation
	TYA				  ; 98 | Transfer Y register to accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	STA $8700,Y		  ; 99 00 87 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	STA $BD24,Y		  ; 99 24 BD | Update graphics data
	WDM #$FF			 ; 42 FF | Reserved instruction
	WDM #$02			 ; 42 02 | Reserved instruction
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA $F900,Y		  ; 19 00 F9 | Logical OR with accumulator (absolute,Y)
	INY				  ; C8 | Increment Y register
	ROR $FF81,X		  ; 7E 81 FF | Rotate right (absolute,X)
	ASL $5C02,X		  ; 1E 02 5C | Arithmetic shift left (absolute,X)
	ORA ($BD,X)		  ; 01 BD | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	AND ($FD,X)		  ; 21 FD | Logical AND with accumulator ((zero page,X))
	INC $FD00			; EE 00 FD | Increment (absolute)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	BPL $1E			  ; 10 1E | Branch if positive
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	STY $2C01			; 8C 01 2C | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_113
; Address: $EDFCD5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_113:
	JSR $20C3			; 20 C3 20 | Jump to subroutine
	DEC $FC00,X		  ; DE 00 FC | Decrement (absolute,X)
	DEY				  ; 88 | Decrement Y register
	BVS $A7			  ; 70 A7 | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag
	PHY				  ; 5A | Push Y register to stack
	LDY #$9F			 ; A0 9F | Load immediate value into Y register
	SBC $9500			; ED 00 95 | Subtract with carry (absolute)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	LDA $0500			; AD 00 05 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_115
; Address: $EDFCFD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_115:
	ORA $EB			  ; 05 EB | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $98			  ; 80 98 | Branch always

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_116
; Address: $EDFD07
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_116:
	JSR $40B0			; 20 B0 40 | Jump to subroutine
	ROL $E040,X		  ; 3E 40 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA				  ; 9F 00 06 00 | Update graphics data
	BEQ $00			  ; F0 00 | Branch if equal
	SEC				  ; 38 | Set carry flag
	BMI $30			  ; 30 30 | Branch if negative
	INX				  ; E8 | Increment X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $BF00			; 0E 00 BF | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	ASL $FD0E			; 0E 0E FD | Arithmetic shift left (absolute)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($98,X)		  ; 01 98 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $F001,X		  ; FE 01 F0 | Increment (absolute,X)
	SBC $7703,X		  ; FD 03 77 | Subtract with carry (absolute,X)
	STA $9FEF17		  ; 8F 17 EF 9F | Update graphics data
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ORA ($4C),Y		  ; 11 4C | Logical OR with accumulator ((zero page),Y)
	CPX $827D			; EC 7D 82 | Compare X register (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $19			  ; E6 19 | Increment (zero page)
	EOR $5DFE,Y		  ; 59 FE 5D | Exclusive OR with accumulator (absolute,Y)
	SBC $FFEF,X		  ; FD EF FF | Subtract with carry (absolute,X)
	LDA				  ; BF FF FF FF | Read graphics status
	WDM #$08			 ; 42 08 | Reserved instruction
	STA				  ; 9F 00 FC 03 | Update graphics data
	EOR $B845			; 4D 45 B8 | Exclusive OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	SBC $EC0A,X		  ; FD 0A EC | Subtract with carry (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	ADC $BDFF,X		  ; 7D FF BD | Add with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ASL $88F1			; 0E F1 88 | Arithmetic shift left (absolute)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	BPL $97			  ; 10 97 | Branch if positive
	PLY				  ; 7A | Pull Y register from stack
	ROL				  ; 2A | Rotate left (accumulator)
	CPY $3830			; CC 30 38 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_117
; Address: $EDFDE5
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_117:
	CPY #$7B			 ; C0 7B | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	LSR $DF4E			; 4E 4E DF | Logical shift right (absolute)
	SED				  ; F8 | Set decimal mode flag
	LDA ($FF),Y		  ; B1 FF | Read graphics status
	ORA $4001			; 0D 01 40 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 9F 00 00 | Update graphics data
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $BFFF,X		  ; FE FF BF | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_118
; Address: $EDFE1E
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_118:
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BVS $70			  ; 70 70 | Branch if overflow set
	STX $FF80			; 8E 80 FF | Store X register to absolute address
	BEQ $FF			  ; F0 FF | Branch if equal
	STA $FF7FFF		  ; 8F FF 7F FF | Update graphics data
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	ASL $C0FF			; 0E FF C0 | Arithmetic shift left (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $00FF,X		  ; 1E FF 00 | Arithmetic shift left (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BNE $FF			  ; D0 FF | Branch if not equal
	STA $FFFF8F		  ; 8F 8F FF FF | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	BVS $FF			  ; 70 FF | Branch if overflow set
	STA $FFFF8F		  ; 8F 8F FF FF | Update graphics data
	BVS $FF			  ; 70 FF | Branch if overflow set
	STY $84			  ; 84 84 | Store Y register to zero page
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	ASL $00FF			; 0E FF 00 | Arithmetic shift left (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ASL $00FF			; 0E FF 00 | Arithmetic shift left (absolute)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	DEC $DBFF,X		  ; DE FF DB | Decrement (absolute,X)
	LDA				  ; BF 7F 3E FF | Read graphics status

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_119
; Address: $EDFF2E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_119:
	ROR $D8BF,X		  ; 7E BF D8 | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5A_GraphicsFunction_11A
; Address: $EDFF4F
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank5A_GraphicsFunction_11A:
	INC $FF03			; EE 03 FF | Increment (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SBC $EC9B,Y		  ; F9 9B EC | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	SBC $97F4,X		  ; FD F4 97 | Subtract with carry (absolute,X)
	ADC $08FF,Y		  ; 79 FF 08 | Add with carry (absolute,Y)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	STZ $F8FF			; 9C FF F8 | Store zero to absolute
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	STA $53A3DD		  ; 8F DD A3 53 | Update graphics data
	STA $FA9D,X		  ; 9D 9D FA | Update graphics data
	PLX				  ; FA | Pull X register from stack
	SBC $7FFD,X		  ; FD FD 7F | Subtract with carry (absolute,X)
	ROL $8F			  ; 26 8F | Rotate left (zero page)
	BVC $A7			  ; 50 A7 | Branch if overflow clear
	SEI				  ; 78 | Set interrupt disable flag
	BMI $CF			  ; 30 CF | Branch if negative
	STX $FF			  ; 86 FF | Store X register to zero page
	STA				  ; 9F FF DF FF | Update graphics data
	ADC $B679,Y		  ; 79 79 B6 | Add with carry (absolute,Y)
	STA				  ; 9F 9F DF DF | Update graphics data
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	SBC $83			  ; E5 83 | Subtract with carry (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	SBC $FFF9,X		  ; FD F9 FF | Subtract with carry (absolute,X)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC $39FE,X		  ; FD FE 39 | Subtract with carry (absolute,X)
	ROL $8780,X		  ; 3E 80 87 | Rotate left (absolute,X)
	SBC #$EE			 ; E9 EE | Subtract with carry (immediate)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	STA $FFCFFF		  ; 8F FF CF FF | Update graphics data
	STA $EFCF8F		  ; 8F 8F CF EF | Update graphics data
	STA				  ; 9F 7F 1F FF | Update graphics data
