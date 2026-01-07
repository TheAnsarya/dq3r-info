;==============================================================================
; Dragon Quest III - Bank $50
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $E80000-$E87FFF
; Instructions: 9139
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_50"

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_000
; Address: $E88002
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_000:
	ADC $C7B6,Y		  ; 79 B6 C7 | Add with carry (absolute,Y)
	ORA #$F7			 ; 09 F7 | Logical OR with accumulator (immediate)
	INC $3E12			; EE 12 3E | Increment (absolute)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 67 FF 1F | Update graphics data
	STA $07078F		  ; 8F 8F 07 07 | Update graphics data
	INC $00			  ; E6 00 | Increment (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	ADC $FF00,X		  ; 7D 00 FF | Add with carry (absolute,X)
	INC $00			  ; E6 00 | Increment (zero page)
	LDY #$AC			 ; A0 AC | Load immediate value into Y register
	BRA $98			  ; 80 98 | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_001
; Address: $E88047
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_001:
	JSR $6000			; 20 00 60 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	JMP $007800		  ; 5C 00 78 00 | Jump to address long
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	AND $FE19,Y		  ; 39 19 FE | Logical AND with accumulator (absolute,Y)
	ORA $4DBD,Y		  ; 19 BD 4D | Logical OR with accumulator (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	PHB				  ; 8B | Push data bank register to stack
	ROL $F4CF,X		  ; 3E CF F4 | Rotate left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_002
; Address: $E88087
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_002:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $0EC1			; 4E C1 0E | Logical shift right (absolute)
	ORA $221D			; 0D 1D 22 | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_003
; Address: $E880A8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_003:
	ASL $33D9			; 0E D9 33 | Arithmetic shift left (absolute)
	LDY $2F23			; AC 23 2F | Load from absolute address into Y register
	LSR $B015,X		  ; 5E 15 B0 | Logical shift right (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX $EE00			; EC 00 EE | Compare X register (absolute)
	INC $C300			; EE 00 C3 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_004
; Address: $E880BE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_004:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_006
; Address: $E880D0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_006:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $3F			  ; 30 3F | Branch if negative
	BMI $3F			  ; 30 3F | Branch if negative
	ROL $1C1F,X		  ; 3E 1F 1C | Rotate left (absolute,X)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_007
; Address: $E880F2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_007:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_008
; Address: $E8810D
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_008:
	EOR #$73			 ; 49 73 | Exclusive OR with accumulator (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STY $FC00			; 8C 00 FC | Store Y register to absolute address
	SBC $FF9A,X		  ; FD 9A FF | Subtract with carry (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	LDA				  ; BF 4C FE 13 | Read graphics status
	AND $7F00,X		  ; 3D 00 7F | Logical AND with accumulator (absolute,X)
	ASL $2E00,X		  ; 1E 00 2E | Arithmetic shift left (absolute,X)
	SBC $1EFF,Y		  ; F9 FF 1E | Subtract with carry (absolute,Y)
	ROR $2982,X		  ; 7E 82 29 | Rotate right (absolute,X)
	ADC $184D,X		  ; 7D 4D 18 | Add with carry (absolute,X)
	ORA $D9DB,Y		  ; 19 DB D9 | Logical OR with accumulator (absolute,Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STZ $FE00,X		  ; 9E 00 FE | Store zero to absolute,X
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	ORA ($6A,X)		  ; 01 6A | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_009
; Address: $E88167
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_009:
	INC				  ; 1A | Increment accumulator
	SED				  ; F8 | Set decimal mode flag
	CPY $41			  ; C4 41 | Compare Y register (zero page)
	CMP ($24,X)		  ; C1 24 | Compare accumulator ((zero page,X))
	SBC $81			  ; E5 81 | Subtract with carry (zero page)
	STA $590081		  ; 8F 81 00 59 | Update graphics data
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	ROL $1A00,X		  ; 3E 00 1A | Rotate left (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_00A
; Address: $E88182
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_00A:
	JSR $F010			; 20 10 F0 | Jump to subroutine
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	CPX $0700			; EC 00 07 | Compare X register (absolute)
	RTI				  ; 40 | Return from interrupt
	ASL $46			  ; 06 46 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ROR $2981,X		  ; 7E 81 29 | Rotate right (absolute,X)
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA				  ; 9F 00 7A 00 | Update graphics data
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	BPL $FF			  ; 10 FF | Branch if positive
	CPY #$F7			 ; C0 F7 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CPX #$B8			 ; E0 B8 | Compare X register (immediate)
	SBC $1F00,Y		  ; F9 00 1F | Subtract with carry (absolute,Y)
	ADC $C7B6,Y		  ; 79 B6 C7 | Add with carry (absolute,Y)
	ORA #$F7			 ; 09 F7 | Logical OR with accumulator (immediate)
	INC $DE12			; EE 12 DE | Increment (absolute)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	EOR $F3A6,X		  ; 5D A6 F3 | Exclusive OR with accumulator (absolute,X)
	CPY #$EC			 ; C0 EC | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PLY				  ; 7A | Pull Y register from stack
	SEC				  ; 38 | Set carry flag
	PLX				  ; FA | Pull X register from stack
	LDA				  ; BF 47 9E 66 | Read graphics status
	ORA $3F			  ; 05 3F | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $E800			; CE 00 E8 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_00B
; Address: $E8823E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_00B:
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $2ED8,Y		  ; F9 D8 2E | Subtract with carry (absolute,Y)
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	BCS $47			  ; B0 47 | Branch if carry set
	ADC $3985,X		  ; 7D 85 39 | Add with carry (absolute,X)
	CMP ($FA,X)		  ; C1 FA | Compare accumulator ((zero page,X))
	ORA $1A00,Y		  ; 19 00 1A | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ASL $1600			; 0E 00 16 | Arithmetic shift left (absolute)
	SBC ($7E,X)		  ; E1 7E | Subtract with carry ((zero page,X))
	LSR $6E9D,X		  ; 5E 9D 6E | Logical shift right (absolute,X)
	LDA $23A3			; AD A3 23 | Read graphics status
	ADC #$89			 ; 69 89 | Add with carry (immediate)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	REP #$00			 ; C2 00 | Reset processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_00C
; Address: $E88274
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_00C:
	BMI $00			  ; 30 00 | Branch if negative
	PLX				  ; FA | Pull X register from stack
	ROL $3B00,X		  ; 3E 00 3B | Rotate left (absolute,X)
	ORA $BA00			; 0D 00 BA | Logical OR with accumulator (absolute)
	ADC $6783,X		  ; 7D 83 67 | Add with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC ($F5),Y		  ; F1 F5 | Subtract with carry ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	CMP $FEDD			; CD DD FE | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ASL $1D0F			; 0E 0F 1D | Arithmetic shift left (absolute)
	ASL $0F01,X		  ; 1E 01 0F | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BIT $2F23			; 2C 23 2F | Test bits in accumulator (absolute)
	LSR $0015,X		  ; 5E 15 00 | Logical shift right (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ROL $2F00			; 2E 00 2F | Rotate left (absolute)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY $7B			  ; A4 7B | Load from zero page into Y register
	BVS $77			  ; 70 77 | Branch if overflow set
	BIT #$77			 ; 89 77 | Test bits in accumulator (immediate)
	BIT #$27			 ; 89 27 | Test bits in accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	LDX $0000			; AE 00 00 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_00F
; Address: $E882E5
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_00F:
	CLD				  ; D8 | Clear decimal mode flag
	CPY $EE30			; CC 30 EE | Compare Y register (absolute)
	ORA ($F4),Y		  ; 11 F4 | Logical OR with accumulator ((zero page),Y)
	PHB				  ; 8B | Push data bank register to stack
	CMP $E5FB			; CD FB E5 | Compare accumulator (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0500			; 0D 00 05 | Logical OR with accumulator (absolute)
	BIT $40			  ; 24 40 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA #$5F			 ; 09 5F | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY $00			  ; A4 00 | Load from zero page into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA				  ; BF 00 BF 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA				  ; BF 00 BF 00 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	DEX				  ; CA | Decrement X register
	PLY				  ; 7A | Pull Y register from stack
	LSR $5E8D			; 4E 8D 5E | Logical shift right (absolute)
	STA $7EE1,X		  ; 9D E1 7E | Update graphics data
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_011
; Address: $E88341
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_011:
	SEC				  ; 38 | Set carry flag
	SBC $FA1E,X		  ; FD 1E FA | Subtract with carry (absolute,X)
	ORA $3BF5			; 0D F5 3B | Logical OR with accumulator (absolute)
	SBC ($67),Y		  ; F1 67 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	ADC $BA83,X		  ; 7D 83 BA | Add with carry (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	BIT $E8E7			; 2C E7 E8 | Test bits in accumulator (absolute)
	CMP $8B65,Y		  ; D9 65 8B | Compare accumulator (absolute,Y)
	CMP ($F3,X)		  ; C1 F3 | Compare accumulator ((zero page,X))
	BRA $6D			  ; 80 6D | Branch always
	TXA				  ; 8A | Transfer X register to accumulator
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_013
; Address: $E88378
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_013:
	CLC				  ; 18 | Clear carry flag
	ASL $1800,X		  ; 1E 00 18 | Arithmetic shift left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CPY #$F7			 ; C0 F7 | Compare Y register (immediate)
	EOR $6FA6,X		  ; 5D A6 6F | Exclusive OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ADC $FA05,X		  ; 7D 05 FA | Add with carry (absolute,X)
	STA				  ; 9F 61 BF 49 | Update graphics data
	SEC				  ; 38 | Set carry flag
	PLY				  ; 7A | Pull Y register from stack
	INC $CF00,X		  ; FE 00 CF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $FF09,Y		  ; 79 09 FF | Add with carry (absolute,Y)
	LDA $847F52		  ; AF 52 7F 84 | Read graphics status
	ASL $F92F,X		  ; 1E 2F F9 | Arithmetic shift left (absolute,X)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	INC $5E00,X		  ; FE 00 5E | Increment (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA ($9F,X)		  ; 81 9F | Update graphics data
	STA $24AF,X		  ; 9D AF 24 | Update graphics data
	SBC $DD			  ; E5 DD | Subtract with carry (zero page)
	CPY #$71			 ; C0 71 | Compare Y register (immediate)
	CPY $5CAB			; CC AB 5C | Compare Y register (absolute)
	SBC $6002,X		  ; FD 02 60 | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	INC				  ; 1A | Increment accumulator
	TSX				  ; BA | Transfer stack pointer to X register
	BRA $00			  ; 80 00 | Branch always
	EOR $EC00,Y		  ; 59 00 EC | Exclusive OR with accumulator (absolute,Y)
	CPX $5C5C			; EC 5C 5C | Compare X register (absolute)
	ROR $BF60			; 6E 60 BF | Rotate right (absolute)
	LDY #$7D			 ; A0 7D | Load immediate value into Y register
	BCC $FD			  ; 90 FD | Branch if carry clear
	STX $A8			  ; 86 A8 | Store X register to zero page
	LDA				  ; BF 00 BF 00 | Read graphics status
	SEI				  ; 78 | Set interrupt disable flag
	BNE $00			  ; D0 00 | Branch if not equal
	INY				  ; C8 | Increment Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ADC $FA05,X		  ; 7D 05 FA | Add with carry (absolute,X)
	STA				  ; 9F 63 BF 4B | Update graphics data
	ASL $C0			  ; 06 C0 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	INC $CF00,X		  ; FE 00 CF | Increment (absolute,X)
	ASL $0200,X		  ; 1E 00 02 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_014
; Address: $E8843E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_014:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_015
; Address: $E8844F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_015:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_016
; Address: $E8845C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_016:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BIT #$BF			 ; 89 BF | Test bits in accumulator (immediate)
	LDY $16FD,X		  ; BC FD 16 | Load from absolute,X into Y register
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	ASL $451E,X		  ; 1E 1E 45 | Arithmetic shift left (absolute,X)
	ORA $70			  ; 05 70 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_017
; Address: $E88481
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_017:
	SED				  ; F8 | Set decimal mode flag
	LDY $FCCC,X		  ; BC CC FC | Load from absolute,X into Y register
	ORA $287A,Y		  ; 19 7A 28 | Logical OR with accumulator (absolute,Y)
	ROR $0E06			; 6E 06 0E | Rotate right (absolute)
	LDX $8C			  ; A6 8C | Load from zero page into X register
	ASL $07E8			; 0E E8 07 | Arithmetic shift left (absolute)
	STA $00			  ; 85 00 | Update graphics data
	STA ($00),Y		  ; 91 00 | Update graphics data
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SEP #$E0			 ; E2 E0 | Game work RAM access
	EOR $9E41			; 4D 41 9E | Exclusive OR with accumulator (absolute)
	BRA $29			  ; 80 29 | Branch always
	CLC				  ; 18 | Clear carry flag
	CMP ($31),Y		  ; D1 31 | Compare accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $51			  ; 06 51 | Arithmetic shift left (zero page)
	BVC $1F			  ; 50 1F | Branch if overflow clear
	LDX $7F00,Y		  ; BE 00 7F | Load from absolute,Y into X register
	INC $7700			; EE 00 77 | Increment (absolute)
	SBC $AF00,Y		  ; F9 00 AF | Subtract with carry (absolute,Y)
	AND $1E3F			; 2D 3F 1E | Logical AND with accumulator (absolute)
	LSR $487F,X		  ; 5E 7F 48 | Logical shift right (absolute,X)
	ROR $7E2C,X		  ; 7E 2C 7E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_018
; Address: $E884CC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_018:
	CMP $BEFD,X		  ; DD FD BE | Compare accumulator (absolute,X)
	AND ($5E,X)		  ; 21 5E | Logical AND with accumulator ((zero page,X))
	ADC ($1E,X)		  ; 61 1E | Add with carry ((zero page,X))
	BIT #$7A			 ; 89 7A | Test bits in accumulator (immediate)
	STA $B3			  ; 85 B3 | Update graphics data
	JMP $5EA1			; 4C A1 5E | Jump to address
	CMP $EC			  ; C5 EC | Compare accumulator (zero page)
	BPL $30			  ; 10 30 | Branch if positive
	BEQ $3E			  ; F0 3E | Branch if equal
	INC $FC87,X		  ; FE 87 FC | Increment (absolute,X)
	BEQ $30			  ; F0 30 | Branch if equal
	CMP ($07,X)		  ; C1 07 | Compare accumulator ((zero page,X))
	STA				  ; 9F 9E FF F8 | Update graphics data
	ASL $F800			; 0E 00 F8 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_019
; Address: $E88524
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_019:
	BRA $40			  ; 80 40 | Branch always
	CLI				  ; 58 | Clear interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_01A
; Address: $E8852B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_01A:
	SBC $3BDF,X		  ; FD DF 3B | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	STA $EF			  ; 85 EF | Update graphics data
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_01B
; Address: $E8855E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_01B:
	JSR $3800			; 20 00 38 | Jump to subroutine
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_01C
; Address: $E88576
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_01C:
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	JMP ($371C)		  ; 6C 1C 37 | Jump to address (absolute indirect)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_01D
; Address: $E88592
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_01D:
	JMP ($6300)		  ; 6C 00 63 | Jump to address (absolute indirect)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPY #$8E			 ; C0 8E | Compare Y register (immediate)
	INC				  ; 1A | Increment accumulator
	DEY				  ; 88 | Decrement Y register
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $3E00,X		  ; 1E 00 3E | Arithmetic shift left (absolute,X)
	PLX				  ; FA | Pull X register from stack
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_01E
; Address: $E885BE
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_01E:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STZ $EA98,X		  ; 9E 98 EA | Store zero to absolute,X
	TAY				  ; A8 | Transfer accumulator to Y register
	BMI $E6			  ; 30 E6 | Branch if negative
	PHY				  ; 5A | Push Y register to stack
	ROL				  ; 2A | Rotate left (accumulator)
	CPX $67			  ; E4 67 | Compare X register (zero page)
	STA $B800,X		  ; 9D 00 B8 | Update graphics data
	PEA #$F500		   ; F4 00 F5 | Push effective address to stack
	STY $CD			  ; 84 CD | Store Y register to zero page
	SBC ($45,X)		  ; E1 45 | Subtract with carry ((zero page,X))
	STZ $411C			; 9C 1C 41 | Store zero to absolute
	INC $941B,X		  ; FE 1B 94 | Increment (absolute,X)
	STA $1D			  ; 85 1D | Update graphics data
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	EOR $BA			  ; 45 BA | Exclusive OR with accumulator (zero page)
	ADC #$BE			 ; 69 BE | Add with carry (immediate)
	EOR ($94,X)		  ; 41 94 | Exclusive OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_01F
; Address: $E885FC
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_01F:
	STA $7A			  ; 85 7A | Update graphics data
	BEQ $96			  ; F0 96 | Branch if equal
	ASL $07B3,X		  ; 1E B3 07 | Arithmetic shift left (absolute,X)
	BIT #$03			 ; 89 03 | Test bits in accumulator (immediate)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA $7D56			; 0D 56 7D | Logical OR with accumulator (absolute)
	AND ($1A),Y		  ; 31 1A | Logical AND with accumulator ((zero page),Y)
	CPX $05			  ; E4 05 | Compare X register (zero page)
	PLX				  ; FA | Pull X register from stack
	STY $0502			; 8C 02 05 | Store Y register to absolute address
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $6D12			; 0D 12 6D | Logical OR with accumulator (absolute)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL $7F3F,X		  ; 3E 3F 7F | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag
	ADC $0086,Y		  ; 79 86 00 | Add with carry (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	ROR $FFFE,X		  ; 7E FE FF | Rotate right (absolute,X)
	ORA ($F5,X)		  ; 01 F5 | Logical OR with accumulator ((zero page,X))
	DEC $9C3E			; CE 3E 9C | Decrement (absolute)
	SEP #$1E			 ; E2 1E | Set processor status bits
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_020
; Address: $E88668
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_020:
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	DEC $9FFF,X		  ; DE FF 9F | Decrement (absolute,X)
	ASL $2300,X		  ; 1E 00 23 | Arithmetic shift left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $E0			  ; 30 E0 | Game work RAM access
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $60			  ; F0 60 | Branch if equal
	INC $D6			  ; E6 D6 | Increment (zero page)
	STA				  ; 9F D9 DF AF | Update graphics data
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ORA $3000,Y		  ; 19 00 30 | Logical OR with accumulator (absolute,Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_021
; Address: $E8869C
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_021:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BIT $21			  ; 24 21 | PPU graphics register access
	SBC ($61,X)		  ; E1 61 | Subtract with carry ((zero page,X))
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	DEC $9FFF,X		  ; DE FF 9F | Decrement (absolute,X)
	ASL $8400,X		  ; 1E 00 84 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	STZ $E300,X		  ; 9E 00 E3 | Store zero to absolute,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	CPX #$B4			 ; E0 B4 | Compare X register (immediate)
	BEQ $66			  ; F0 66 | Branch if equal
	CPX #$D6			 ; E0 D6 | Compare X register (immediate)
	DEC $1F2D			; CE 2D 1F | Decrement (absolute)
	STA				  ; 9F D8 DE AE | Update graphics data
	INC $0018,X		  ; FE 18 00 | Increment (absolute,X)
	ASL $3100,X		  ; 1E 00 31 | Arithmetic shift left (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_022
; Address: $E886DC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_022:
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT $A5			  ; 24 A5 | Test bits in accumulator (zero page)
	LDA $4300,X		  ; BD 00 43 | Read graphics status
	REP #$DB			 ; C2 DB | Reset processor status bits
	LSR				  ; 4A | Logical shift right (accumulator)
	REP #$7C			 ; C2 7C | Reset processor status bits
	LDA $5A			  ; A5 5A | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	WDM #$BD			 ; 42 BD | Reserved instruction
	LSR				  ; 4A | Logical shift right (accumulator)
	WDM #$BD			 ; 42 BD | Reserved instruction
	SBC $E201,X		  ; FD 01 E2 | Subtract with carry (absolute,X)
	STA $AD1C,Y		  ; 99 1C AD | Update graphics data
	AND $E0EF,Y		  ; 39 EF E0 | Game work RAM access
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_023
; Address: $E8870E
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_023:
	BRA $00			  ; 80 00 | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $E31C,X		  ; FD 1C E3 | Subtract with carry (absolute,X)
	AND $E0C6,Y		  ; 39 C6 E0 | Game work RAM access
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $A6			  ; 80 A6 | Branch always
	CMP $FF80,Y		  ; D9 80 FF | Compare accumulator (absolute,Y)
	STY $53FC			; 8C FC 53 | Store Y register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	BIT $047F			; 2C 7F 04 | Test bits in accumulator (absolute)
	INC $FC2C,X		  ; FE 2C FC | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BPL $60			  ; 10 60 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BEQ $80			  ; F0 80 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ADC ($4C),Y		  ; 71 4C | Add with carry ((zero page),Y)
	JMP $5858			; 4C 58 58 | Jump to address
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	ROR $E67E,X		  ; 7E 7E E6 | Rotate right (absolute,X)
	INC $E6			  ; E6 E6 | Increment (zero page)
	INC $E6			  ; E6 E6 | Increment (zero page)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC $ED00			; ED 00 ED | Subtract with carry (absolute)
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	EOR $5B5D,X		  ; 5D 5D 5B | Exclusive OR with accumulator (absolute,X)
	STA				  ; 9F 9F 9D 9D | Update graphics data
	ORA $3D1D,X		  ; 1D 1D 3D | Logical OR with accumulator (absolute,X)
	STA ($00),Y		  ; 91 00 | Update graphics data
	ORA $8900,Y		  ; 19 00 89 | Logical OR with accumulator (absolute,Y)
	LDA				  ; BF 27 67 BC | Read graphics status
	SBC $7F16,X		  ; FD 16 7F | Subtract with carry (absolute,X)
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	ASL $851E,X		  ; 1E 1E 85 | Arithmetic shift left (absolute,X)
	ORA $90			  ; 05 90 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_024
; Address: $E887BC
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_024:
	PLX				  ; FA | Pull X register from stack
	STY $6300			; 8C 00 63 | Store Y register to absolute address
	PLX				  ; FA | Pull X register from stack
	LDY $FCCF,X		  ; BC CF FC | Load from absolute,X into Y register
	INC				  ; 1A | Increment accumulator
	PLY				  ; 7A | Pull Y register from stack
	PLP				  ; 28 | Pull processor status from stack
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	STA $05ED0D		  ; 8F 0D ED 05 | Update graphics data
	STA $00			  ; 85 00 | Update graphics data
	BCC $00			  ; 90 00 | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	EOR $82C0,Y		  ; 59 C0 82 | Exclusive OR with accumulator (absolute,Y)
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	EOR ($24,X)		  ; 41 24 | Exclusive OR with accumulator ((zero page,X))
	STA $D1D1,Y		  ; 99 D1 D1 | Update graphics data
	CPX $9A			  ; E4 9A | Compare X register (zero page)
	PLY				  ; 7A | Pull Y register from stack
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 02 FD 40 | Read graphics status
	LDA				  ; BF 40 BF 00 | Read graphics status
	CMP ($2E),Y		  ; D1 2E | Compare accumulator ((zero page),Y)
	BRA $7F			  ; 80 7F | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $02			  ; 80 02 | Branch always
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_025
; Address: $E88857
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_025:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	CPY #$EE			 ; C0 EE | Compare Y register (immediate)
	INC $CECE			; EE CE CE | Increment (absolute)
	CMP $CFCD			; CD CD CF | Compare accumulator (absolute)
	LDA $CD00			; AD 00 CD | Read graphics status
	ORA $151D,X		  ; 1D 1D 15 | Logical OR with accumulator (absolute,X)
	ORA $1100,Y		  ; 19 00 11 | Logical OR with accumulator (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHB				  ; 8B | Push data bank register to stack
	STZ $61FF			; 9C FF 61 | Store zero to absolute
	ADC ($81,X)		  ; 61 81 | Add with carry ((zero page,X))
	PEA #$DE3F		   ; F4 3F DE | Push effective address to stack
	STA				  ; 9F FF 04 00 | Update graphics data
	STZ $E300,X		  ; 9E 00 E3 | Store zero to absolute,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL $B5FE,X		  ; 1E FE B5 | Arithmetic shift left (absolute,X)
	PEA #$E063		   ; F4 63 E0 | Game work RAM access
	DEC $1F2E			; CE 2E 1F | Decrement (absolute)
	STA				  ; 9F DB DF AF | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_026
; Address: $E888DC
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_026:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $0F			  ; 10 0F | Branch if positive
	ORA $0937,Y		  ; 19 37 09 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $40			  ; 80 40 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	INX				  ; E8 | Increment X register
	BVC $C8			  ; 50 C8 | Branch if overflow clear
	BCS $B4			  ; B0 B4 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	LDY $E2			  ; A4 E2 | Load from zero page into Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_027
; Address: $E88918
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_027:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_028
; Address: $E88921
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_028:
	BMI $20			  ; 30 20 | Branch if negative
	BPL $60			  ; 10 60 | Branch if positive
	BMI $60			  ; 30 60 | Branch if negative
	BMI $60			  ; 30 60 | Branch if negative
	BMI $70			  ; 30 70 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	BEQ $68			  ; F0 68 | Branch if equal
	BEQ $28			  ; F0 28 | Branch if equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_02B
; Address: $E8893A
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_02B:
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY $7CCF			; CC CF 7C | Compare Y register (absolute)
	LDA ($7F,X)		  ; A1 7F | Read graphics status
	BVC $FF			  ; 50 FF | Branch if overflow clear
	CPY $2033			; CC 33 20 | Compare Y register (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROL $85FF,X		  ; 3E FF 85 | Rotate left (absolute,X)
	INC $FF0A,X		  ; FE 0A FF | Increment (absolute,X)
	CPY $FA04			; CC 04 FA | Compare Y register (absolute)
	CPX $D8F0			; EC F0 D8 | Compare X register (absolute)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	ASL $1E10			; 0E 10 1E | Arithmetic shift left (absolute)
	STA $85			  ; 85 85 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	ROL $1C26,X		  ; 3E 26 1C | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	DEC				  ; 3A | Decrement accumulator
	DEC $7F			  ; C6 7F | Decrement (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	INC $CDCF,X		  ; FE CF CD | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	BRA $7C			  ; 80 7C | Branch always
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	AND ($61),Y		  ; 31 61 | Logical AND with accumulator ((zero page),Y)
	ADC #$31			 ; 69 31 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_02C
; Address: $E889E9
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_02C:
	AND ($B4,X)		  ; 21 B4 | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_02F
; Address: $E889F8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_02F:
	BVS $07			  ; 70 07 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	CPX $58			  ; E4 58 | Compare X register (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDX $FC44,Y		  ; BE 44 FC | Load from absolute,Y into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $10			  ; 10 10 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_031
; Address: $E88A16
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_031:
	BMI $02			  ; 30 02 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR $7C00,X		  ; 7E 00 7C | Rotate right (absolute,X)
	BVC $00			  ; 50 00 | Branch if overflow clear
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BPL $E8			  ; 10 E8 | Branch if positive
	SEC				  ; 38 | Set carry flag
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_032
; Address: $E88A45
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_032:
	JSR $10E0			; 20 E0 10 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ASL $5C00,X		  ; 1E 00 5C | Arithmetic shift left (absolute,X)
	LDX $0600			; AE 00 06 | Load from absolute address into X register
	JMP ($DFEC)		  ; 6C EC DF | Jump to address (absolute indirect)
	CPY $0032			; CC 32 00 | Compare Y register (absolute)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BVS $E3			  ; 70 E3 | Branch if overflow set
	BRA $FD			  ; 80 FD | Branch always
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	STA $009C00		  ; 8F 00 9C 00 | Update graphics data
	BRA $83			  ; 80 83 | Branch always
	BIT #$FB			 ; 89 FB | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_033
; Address: $E88AA6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_033:
	INC $60			  ; E6 60 | Increment (zero page)
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	STA				  ; 9F 00 79 00 | Update graphics data
	BMI $00			  ; 30 00 | Branch if negative
	ORA $B2FF,Y		  ; 19 FF B2 | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_034
; Address: $E88AC5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_034:
	CPX $DECE			; EC CE DE | Compare X register (absolute)
	LDX $7F1E,Y		  ; BE 1E 7F | Load from absolute,Y into X register
	ADC ($0E,X)		  ; 61 0E | Add with carry ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA $1300			; 0D 00 13 | Logical OR with accumulator (absolute)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	BRA $83			  ; 80 83 | Branch always
	PHB				  ; 8B | Push data bank register to stack
	SBC ($61,X)		  ; E1 61 | Subtract with carry ((zero page,X))
	BPL $39			  ; 10 39 | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_035
; Address: $E88AEB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_035:
	JSR $F0F8			; 20 F8 F0 | Jump to subroutine
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	STZ $EF00,X		  ; 9E 00 EF | Store zero to absolute,X
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_036
; Address: $E88B05
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_036:
	CPX #$D6			 ; E0 D6 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	AND $0F			  ; 25 0F | Logical AND with accumulator (zero page)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ASL $0215,X		  ; 1E 15 02 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_037
; Address: $E88B30
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_037:
	JSR $3000			; 20 00 30 | Jump to subroutine
	ORA $1700,Y		  ; 19 00 17 | Logical OR with accumulator (absolute,Y)
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_038
; Address: $E88B3F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_038:
	JSR $B031			; 20 31 B0 | Jump to subroutine
	ORA ($D1),Y		  ; 11 D1 | Logical OR with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_039
; Address: $E88B46
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_039:
	RTI				  ; 40 | Return from interrupt
	BCC $E6			  ; 90 E6 | Branch if carry clear
	STA ($05),Y		  ; 91 05 | Update graphics data
	AND ($CF),Y		  ; 31 CF | Logical AND with accumulator ((zero page),Y)
	STA ($6E),Y		  ; 91 6E | Update graphics data
	BRA $3F			  ; 80 3F | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_03A
; Address: $E88B56
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_03A:
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ASL $0301			; 0E 01 03 | Arithmetic shift left (absolute)
	BRA $AC			  ; 80 AC | Branch always
	STZ $6A			  ; 64 6A | Store zero to zero page
	SEP #$40			 ; E2 40 | Set processor status bits
	ROL $7FB4,X		  ; 3E B4 7F | Rotate left (absolute,X)
	CPY $44			  ; C4 44 | Compare Y register (zero page)
	ORA $BF00,X		  ; 1D 00 BF | Logical OR with accumulator (absolute,X)
	INC $7F0B,X		  ; FE 0B 7F | Increment (absolute,X)
	BEQ $E3			  ; F0 E3 | Branch if equal
	CPY $BB			  ; C4 BB | Compare Y register (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BPL $40			  ; 10 40 | Branch if positive
	BPL $80			  ; 10 80 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_03B
; Address: $E88B87
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_03B:
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $A0			  ; 30 A0 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_03C
; Address: $E88B90
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_03C:
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	BVS $80			  ; 70 80 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	STA				  ; 9F E0 1B 64 | Update graphics data
	JMP ($C831)		  ; 6C 31 C8 | Jump to address (absolute indirect)
	ROR $5596			; 6E 96 55 | Rotate right (absolute)
	LDA $1A			  ; A5 1A | Read graphics status
	NOP				  ; EA | No operation
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	DEC $39			  ; C6 39 | Decrement (zero page)
	DEC $39			  ; C6 39 | Decrement (zero page)
	INC $19			  ; E6 19 | Increment (zero page)
	SBC $FA00,Y		  ; F9 00 FA | Subtract with carry (absolute,Y)
	SBC $D887,Y		  ; F9 87 D8 | Subtract with carry (absolute,Y)
	LDX $49			  ; A6 49 | Load from zero page into X register
	JMP ($9613)		  ; 6C 13 96 | Jump to address (absolute indirect)
	BIT #$32			 ; 89 32 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_03D
; Address: $E88BCC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_03D:
	JSR $E4E7			; 20 E7 E4 | Jump to subroutine
	ROR $98			  ; 66 98 | Rotate right (zero page)
	STZ $9CE3			; 9C E3 9C | Store zero to absolute
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $4F			  ; 80 4F | Branch always
	BRA $1F			  ; 80 1F | Branch always
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_03E
; Address: $E88BDF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_03E:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BMI $F0			  ; 30 F0 | Branch if negative
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	INY				  ; C8 | Increment Y register
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_03F
; Address: $E88C02
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_03F:
	JSR $10E0			; 20 E0 10 | Jump to subroutine
	BEQ $A0			  ; F0 A0 | Branch if equal
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	BMI $20			  ; 30 20 | Branch if negative
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	BVC $00			  ; 50 00 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal
	BNE $00			  ; D0 00 | Branch if not equal
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BNE $B0			  ; D0 B0 | Branch if not equal
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	STZ $1C			  ; 64 1C | Store zero to zero page
	CPX $F884			; EC 84 F8 | Compare X register (absolute)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $70			  ; 80 70 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $7C			  ; 80 7C | Branch always
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	ASL $030E,X		  ; 1E 0E 03 | Arithmetic shift left (absolute,X)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA $1816			; 0D 16 18 | Logical OR with accumulator (absolute)
	ASL $0211			; 0E 11 02 | Arithmetic shift left (absolute)
	ORA $0E00,X		  ; 1D 00 0E | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $3000,Y		  ; 19 00 30 | Logical OR with accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_040
; Address: $E88C65
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_040:
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	AND ($2D,X)		  ; 21 2D | Logical AND with accumulator ((zero page,X))
	STZ $265F,X		  ; 9E 5F 26 | Store zero to absolute,X
	LDY $03			  ; A4 03 | Load from zero page into Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEC $EE00,X		  ; DE 00 EE | Decrement (absolute,X)
	BPL $DF			  ; 10 DF | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_041
; Address: $E88C7B
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_041:
	JSR $DB26			; 20 26 DB | Jump to subroutine
	SBC $ABAA,X		  ; FD AA AB | Subtract with carry (absolute,X)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	BIT #$20			 ; 89 20 | Test bits in accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	TSX				  ; BA | Transfer stack pointer to X register
	ADC #$1B			 ; 69 1B | Add with carry (immediate)
	BIT $E6			  ; 24 E6 | Test bits in accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPX $FE01			; EC 01 FE | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	JMP $8400			; 4C 00 84 | Jump to address
	ORA $2000,Y		  ; 19 00 20 | Logical OR with accumulator (absolute,Y)
	BNE $AC			  ; D0 AC | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $68			  ; F0 68 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_042
; Address: $E88CA8
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_042:
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $30			  ; D0 30 | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	LDA #$52			 ; A9 52 | Read graphics status
	LDY #$C9			 ; A0 C9 | Load immediate value into Y register
	BMI $CA			  ; 30 CA | Branch if negative
	INY				  ; C8 | Increment Y register
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	BRA $60			  ; 80 60 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA $4A			  ; 85 4A | Update graphics data

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_043
; Address: $E88CE2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_043:
	EOR $0B			  ; 45 0B | Exclusive OR with accumulator (zero page)
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ROR $7F00,X		  ; 7E 00 7F | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_044
; Address: $E88D02
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_044:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	WDM #$00			 ; 42 00 | Reserved instruction
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	LSR $7F			  ; 46 7F | Logical shift right (zero page)
	ASL $307F			; 0E 7F 30 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BIT $02			  ; 24 02 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_045
; Address: $E88D30
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_045:
	JSR $E8F0			; 20 F0 E8 | Jump to subroutine
	INC $FEC8,X		  ; FE C8 FE | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	INC $FEE4,X		  ; FE E4 FE | Increment (absolute,X)
	BCS $FE			  ; B0 FE | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $A080,X		  ; FE 80 A0 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_046
; Address: $E88D42
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_046:
	JSR $A060			; 20 60 A0 | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	ROR $7EF1,X		  ; 7E F1 7E | Rotate right (absolute,X)
	STA $431C,X		  ; 9D 1C 43 | Update graphics data
	BRA $3F			  ; 80 3F | Branch always
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Update graphics data
	BRA $80			  ; 80 80 | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	BVS $30			  ; 70 30 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	CPY $F800			; CC 00 F8 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_047
; Address: $E88D7C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_047:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BPL $28			  ; 10 28 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	BCC $04			  ; 90 04 | Branch if carry clear
	STX $3212			; 8E 12 32 | Store X register to absolute address
	ORA $0AC5,Y		  ; 19 C5 0A | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_048
; Address: $E88D8C
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_048:
	BRA $06			  ; 80 06 | Branch always
	LDA ($00),Y		  ; B1 00 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PEA #$FC00		   ; F4 00 FC | Push effective address to stack
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $380E			; 2C 0E 38 | Test bits in accumulator (absolute)
	EOR ($37,X)		  ; 41 37 | Exclusive OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	INC				  ; 1A | Increment accumulator
	ADC $05			  ; 65 05 | Add with carry (zero page)
	INC $3C66,X		  ; FE 66 3C | Increment (absolute,X)
	JMP $D6283C		  ; 5C 3C 28 D6 | Jump to address long
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	ASL $060E			; 0E 0E 06 | Arithmetic shift left (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	LDA ($04,X)		  ; A1 04 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	NOP				  ; EA | No operation
	ORA $78			  ; 05 78 | Logical OR with accumulator (zero page)
	BPL $34			  ; 10 34 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	BVS $0C			  ; 70 0C | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	ORA $DD00			; 0D 00 DD | Logical OR with accumulator (absolute)
	BIT $3C00			; 2C 00 3C | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	BRA $30			  ; 80 30 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_049
; Address: $E88E46
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_049:
	AND $3F42			; 2D 42 3F | Logical AND with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	AND $3F42,X		  ; 3D 42 3F | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	AND $2A02,X		  ; 3D 02 2A | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_04A
; Address: $E88E54
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_04A:
	AND $7F			  ; 25 7F | Logical AND with accumulator (zero page)
	ORA $7F			  ; 05 7F | Logical OR with accumulator (zero page)
	BPL $7F			  ; 10 7F | Branch if positive
	PHY				  ; 5A | Push Y register to stack
	ROL $5A			  ; 26 5A | Rotate left (zero page)
	ROL $FA			  ; 26 FA | Rotate left (zero page)
	ASL $D2			  ; 06 D2 | Arithmetic shift left (zero page)
	ROL $2ED2			; 2E D2 2E | Rotate left (absolute)
	ROL $FE48			; 2E 48 FE | Rotate left (absolute)
	PHA				  ; 48 | Push accumulator to stack
	INC $FE40,X		  ; FE 40 FE | Increment (absolute,X)
	INC $FE80,X		  ; FE 80 FE | Increment (absolute,X)
	BRA $FE			  ; 80 FE | Branch always
	BRA $FE			  ; 80 FE | Branch always
	BRA $FE			  ; 80 FE | Branch always
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $150A,X		  ; 1D 0A 15 | Logical OR with accumulator (absolute,X)
	BPL $3F			  ; 10 3F | Branch if positive
	ROL $6E96			; 2E 96 6E | Rotate left (absolute)
	JMP ($EC54)		  ; 6C 54 EC | Jump to address (absolute indirect)
	CPY $7C			  ; C4 7C | Compare Y register (zero page)
	STZ $FC			  ; 64 FC | Store zero to zero page
	STZ $FC			  ; 64 FC | Store zero to zero page
	JMP ($80FC)		  ; 6C FC 80 | Jump to address (absolute indirect)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL $1415,X		  ; 1E 15 14 | Arithmetic shift left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	JMP ($E8FC)		  ; 6C FC E8 | Jump to address (absolute indirect)
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	INC $F8F4,X		  ; FE F4 F8 | Increment (absolute,X)
	BVC $E0			  ; 50 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_04C
; Address: $E88F20
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_04C:
	STA				  ; 9F E0 1B 64 | Update graphics data
	JMP ($C831)		  ; 6C 31 C8 | Jump to address (absolute indirect)
	ADC $5C96			; 6D 96 5C | Add with carry (absolute)
	LDA $ED1C			; AD 1C ED | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	DEC $39			  ; C6 39 | Decrement (zero page)
	DEC $39			  ; C6 39 | Decrement (zero page)
	INC $19			  ; E6 19 | Increment (zero page)
	SED				  ; F8 | Set decimal mode flag
	ORA ($F2,X)		  ; 01 F2 | Logical OR with accumulator ((zero page,X))
	ORA ($F6,X)		  ; 01 F6 | Logical OR with accumulator ((zero page,X))
	ORA ($A9,X)		  ; 01 A9 | Logical OR with accumulator ((zero page,X))
	ORA #$F8			 ; 09 F8 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_04D
; Address: $E88F46
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_04D:
	JSR $A300			; 20 00 A3 | Jump to subroutine
	DEC $23			  ; C6 23 | Decrement (zero page)
	CMP $1621,X		  ; DD 21 16 | Compare accumulator (absolute,X)
	CPX #$27			 ; E0 27 | Compare X register (immediate)
	CPY #$0D			 ; C0 0D | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	BRA $3E			  ; 80 3E | Branch always
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	STX $80			  ; 86 80 | Store X register to zero page
	BMI $CF			  ; 30 CF | Branch if negative
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $88			  ; F0 88 | Branch if equal
	BVS $98			  ; 70 98 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $FBEC			; 0D EC FB | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	BIT #$21			 ; 89 21 | PPU graphics register access
	PHX				  ; DA | Push X register to stack
	INC $FE61,X		  ; FE 61 FE | Increment (absolute,X)
	SEP #$FE			 ; E2 FE | Set processor status bits
	PLY				  ; 7A | Pull Y register from stack
	SBC ($04,X)		  ; E1 04 | Subtract with carry ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))
	ORA ($B5,X)		  ; 01 B5 | Logical OR with accumulator ((zero page,X))
	BCS $1C			  ; B0 1C | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	INC $01			  ; E6 01 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_04E
; Address: $E88FAB
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_04E:
	BRA $E3			  ; 80 E3 | Branch always
	LDY #$CB			 ; A0 CB | Load immediate value into Y register
	INY				  ; C8 | Increment Y register
	PHA				  ; 48 | Push accumulator to stack
	CPX $03			  ; E4 03 | Compare X register (zero page)
	BCS $07			  ; B0 07 | Branch if carry set
	JMP $79C6A3		  ; 5C A3 C6 79 | Jump to address long
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	SBC $5807,Y		  ; F9 07 58 | Subtract with carry (absolute,Y)
	ROL $49			  ; 26 49 | Rotate left (zero page)
	STY $B613			; 8C 13 B6 | Store Y register to absolute address
	AND #$6A			 ; 29 6A | Logical AND with accumulator (immediate)
	SBC $08			  ; E5 08 | Subtract with carry (zero page)
	CPX $E602			; EC 02 E6 | Compare X register (absolute)
	CLC				  ; 18 | Clear carry flag
	STZ $9C63			; 9C 63 9C | Store zero to absolute
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $1F			  ; 80 1F | Branch always
	BRA $3F			  ; 80 3F | Branch always
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_04F
; Address: $E88FF2
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_04F:
	JSR $2000			; 20 00 20 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($C2,X)		  ; A1 C2 | Read graphics status
	ROL $50			  ; 26 50 | Rotate left (zero page)
	LDA $A651			; AD 51 A6 | Read graphics status
	PHX				  ; DA | Push X register to stack
	AND #$50			 ; 29 50 | Logical AND with accumulator (immediate)
	STA $72			  ; 85 72 | Update graphics data
	ORA $1CE6,X		  ; 1D E6 1C | Logical OR with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_050
; Address: $E89034
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_050:
	INC $7D00,X		  ; FE 00 7D | Increment (absolute,X)
	INC $E401,X		  ; FE 01 E4 | Increment (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_051
; Address: $E89040
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_051:
	PLX				  ; FA | Pull X register from stack
	CMP $320F,X		  ; DD 0F 32 | Compare accumulator (absolute,X)
	LDX #$B4			 ; A2 B4 | Load immediate value into X register
	BIT $5E			  ; 24 5E | Test bits in accumulator (zero page)
	DEC $F4D0,X		  ; DE D0 F4 | Decrement (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	ADC $9080,X		  ; 7D 80 90 | Add with carry (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_052
; Address: $E89054
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_052:
	AND $2BD0			; 2D D0 2B | Logical AND with accumulator (absolute)
	BNE $0D			  ; D0 0D | Branch if not equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $0F			  ; 70 0F | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	STA $92526F		  ; 8F 6F 52 92 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	STY $8F00			; 8C 00 8F | Store Y register to absolute address
	LDA				  ; BF 00 E3 1C | Read graphics status
	STA $ED1270		  ; 8F 70 12 ED | Update graphics data
	CPX #$23			 ; E0 23 | Compare X register (immediate)
	CMP ($0F,X)		  ; C1 0F | Compare accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $82			  ; 85 82 | Update graphics data
	SBC $E4			  ; E5 E4 | Subtract with carry (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($DC,X)		  ; 01 DC | Logical OR with accumulator ((zero page,X))
	BEQ $0C			  ; F0 0C | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	STA ($7E,X)		  ; 81 7E | Update graphics data
	SBC $1A			  ; E5 1A | Subtract with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	WDM #$41			 ; 42 41 | Reserved instruction
	ASL $C001			; 0E 01 C0 | Arithmetic shift left (absolute)
	JMP ($8894)		  ; 6C 94 88 | Jump to address (absolute indirect)
	PEA #$E00B		   ; F4 0B E0 | Game work RAM access
	EOR $70			  ; 45 70 | Exclusive OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Read graphics status
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	BRA $7F			  ; 80 7F | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	STA $8F06,Y		  ; 99 06 8F | Update graphics data
	STY $0B			  ; 84 0B | Store Y register to zero page
	CMP ($3A,X)		  ; C1 3A | Compare accumulator ((zero page,X))
	ORA #$FA			 ; 09 FA | Logical OR with accumulator (immediate)
	CMP $A3A5,Y		  ; D9 A5 A3 | Compare accumulator (absolute,Y)
	SBC $01A7,Y		  ; F9 A7 01 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_053
; Address: $E890CD
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_053:
	LSR $91			  ; 46 91 | Logical shift right (zero page)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	LSR $5E00,X		  ; 5E 00 5E | Logical shift right (absolute,X)
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	BIT $332C			; 2C 2C 33 | Test bits in accumulator (absolute)
	LDY $B6BF,X		  ; BC BF B6 | Load from absolute,X into Y register
	LDX $EE66,Y		  ; BE 66 EE | Load from absolute,Y into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CLD				  ; D8 | Clear decimal mode flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BPL $01			  ; 10 01 | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_054
; Address: $E890FF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_054:
	JSR $6F6F			; 20 6F 6F | Jump to subroutine
	ROL $26			  ; 26 26 | Rotate left (zero page)
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$ED			 ; C0 ED | Compare Y register (immediate)
	BPL $FD			  ; 10 FD | Branch if positive
	ADC $2D80,X		  ; 7D 80 2D | Add with carry (absolute,X)
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BEQ $FF			  ; F0 FF | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_055
; Address: $E89128
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_055:
	SEP #$E2			 ; E2 E2 | Set processor status bits
	LDX #$A2			 ; A2 A2 | Load immediate value into X register
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 40 9B 40 | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	BVC $33			  ; 50 33 | Branch if overflow clear
	ROL $85FF,X		  ; 3E FF 85 | Rotate left (absolute,X)
	INC $FF0A,X		  ; FE 0A FF | Increment (absolute,X)
	BMI $CF			  ; 30 CF | Branch if negative
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	DEC $000C,X		  ; DE 0C 00 | Decrement (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BVS $E8			  ; 70 E8 | Branch if overflow set
	STY $84D7			; 8C D7 84 | Store Y register to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_057
; Address: $E89178
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_057:
	STA $007300		  ; 8F 00 73 00 | Update graphics data
	STA				  ; 9F 00 6F 7F | Update graphics data
	JMP $6FEF7C		  ; 5C 7C EF 6F | Jump to address long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_058
; Address: $E89186
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_058:
	ASL $DA87,X		  ; 1E 87 DA | Arithmetic shift left (absolute,X)
	SBC ($1F),Y		  ; F1 1F | Subtract with carry ((zero page),Y)
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $60			  ; 80 60 | Branch always
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_05A
; Address: $E891B4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_05A:
	JSR $6000			; 20 00 60 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_05B
; Address: $E891BC
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_05B:
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $18E3			; 9C E3 18 | Store zero to absolute
	BRA $7D			  ; 80 7D | Branch always
	AND ($C8),Y		  ; 31 C8 | Logical AND with accumulator ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	INC $32			  ; E6 32 | Increment (zero page)
	RTI				  ; 40 | Return from interrupt
	STZ $1B			  ; 64 1B | Store zero to zero page
	DEC $39			  ; C6 39 | Decrement (zero page)
	DEC $39			  ; C6 39 | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	SBC $FC00,X		  ; FD 00 FC | Subtract with carry (absolute,X)
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	DEC $6EDC,X		  ; DE DC 6E | Decrement (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	BCS $72			  ; B0 72 | Branch if carry set
	CPX $F14D			; EC 4D F1 | Compare X register (absolute)
	LDA $4D			  ; A5 4D | Read graphics status
	LDY $CE74			; AC 74 CE | Load from absolute address into Y register
	CPX $F897			; EC 97 F8 | Compare X register (absolute)
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$BE			 ; E0 BE | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX $1A			  ; E4 1A | Compare X register (zero page)
	LDY $4053			; AC 53 40 | Load from absolute address into Y register
	BRA $F0			  ; 80 F0 | Branch always
	BPL $66			  ; 10 66 | Branch if positive
	BRA $D0			  ; 80 D0 | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_05C
; Address: $E8922A
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_05C:
	ORA ($F7),Y		  ; 11 F7 | Logical OR with accumulator ((zero page),Y)
	INC $00E7			; EE E7 00 | Increment (absolute)
	BPL $EF			  ; 10 EF | Branch if positive
	BRA $0F			  ; 80 0F | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive
	BPL $64			  ; 10 64 | Branch if positive
	ASL $CBE0,X		  ; 1E E0 CB | Arithmetic shift left (absolute,X)
	DEC $F39E,X		  ; DE 9E F3 | Decrement (absolute,X)
	REP #$EF			 ; C2 EF | Reset processor status bits
	CPX $EC13			; EC 13 EC | Compare X register (absolute)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND ($10,X)		  ; 21 10 | Logical AND with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $1C			  ; 10 1C | Branch if positive
	CLC				  ; 18 | Clear carry flag
	STA $0589			; 8D 89 05 | Update graphics data
	ORA ($E7,X)		  ; 01 E7 | Logical OR with accumulator ((zero page,X))
	CMP ($B3,X)		  ; C1 B3 | Compare accumulator ((zero page,X))
	BCC $E8			  ; 90 E8 | Branch if carry clear
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ROL $19			  ; 26 19 | Rotate left (zero page)
	EOR ($2E),Y		  ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
	EOR $A587,Y		  ; 59 87 A5 | Exclusive OR with accumulator (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	STY $B692			; 8C 92 B6 | Store Y register to absolute address
	SBC #$9A			 ; E9 9A | Subtract with carry (immediate)
	BMI $B7			  ; 30 B7 | Branch if negative
	BIT $A3			  ; 24 A3 | Test bits in accumulator (zero page)
	INC $6200,X		  ; FE 00 62 | Increment (absolute,X)
	STZ $9CE3			; 9C E3 9C | Store zero to absolute
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	CPY #$4F			 ; C0 4F | Compare Y register (immediate)
	BRA $DF			  ; 80 DF | Branch always
	ASL $C6			  ; 06 C6 | Arithmetic shift left (zero page)
	STX $06			  ; 86 06 | Store X register to zero page
	ASL $8E0E			; 0E 0E 8E | Arithmetic shift left (absolute)
	STX $8686			; 8E 86 86 | Store X register to absolute address
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	LSR $C6			  ; 46 C6 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_05D
; Address: $E892B1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_05D:
	JSR $310E			; 20 0E 31 | Jump to subroutine
	ASL $8E71			; 0E 71 8E | Arithmetic shift left (absolute)
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	ADC ($06),Y		  ; 71 06 | Add with carry ((zero page),Y)
	ADC $3946,Y		  ; 79 46 39 | Add with carry (absolute,Y)
	LSR $39			  ; 46 39 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_05E
; Address: $E892C0
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_05E:
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $CCCC			; CC CC CC | Compare Y register (absolute)
	CPY $4444			; CC 44 44 | Compare Y register (absolute)
	BCS $CE			  ; B0 CE | Branch if carry set
	AND ($CC),Y		  ; 31 CC | Logical AND with accumulator ((zero page),Y)
	CPY $CC33			; CC 33 CC | Compare Y register (absolute)
	CPY $CC33			; CC 33 CC | Compare Y register (absolute)
	AND $25			  ; 25 25 | Logical AND with accumulator (zero page)
	ADC $65			  ; 65 65 | Add with carry (zero page)
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	JMP $A94C			; 4C 4C A9 | Jump to address
	SBC #$12			 ; E9 12 | Subtract with carry (immediate)
	CMP $CC32			; CD 32 CC | Compare accumulator (absolute)
	CPY $CC33			; CC 33 CC | Compare Y register (absolute)
	JMP $4CB3			; 4C B3 4C | Jump to address
	DEC $8E8F			; CE 8F 8E | Decrement (absolute)
	STY $9A8F			; 8C 8F 9A | Store Y register to absolute address
	STA $0999,Y		  ; 99 99 09 | Update graphics data
	ORA #$42			 ; 09 42 | Hardware register operation
	RTI				  ; 40 | Return from interrupt
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	ASL $68			  ; 06 68 | Arithmetic shift left (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	CPX $10E3			; EC E3 10 | Compare X register (absolute)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $06			  ; F0 06 | Branch if equal
	CPX #$08			 ; E0 08 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_05F
; Address: $E89338
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_05F:
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	INC				  ; 1A | Increment accumulator
	ORA $0360			; 0D 60 03 | Logical OR with accumulator (absolute)
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_060
; Address: $E8935A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_060:
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	CPY #$88			 ; C0 88 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_061
; Address: $E89370
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_061:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_062
; Address: $E8937E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_062:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($C2,X)		  ; A1 C2 | Read graphics status
	BNE $2B			  ; D0 2B | Branch if not equal
	AND $D8			  ; 25 D8 | Logical AND with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	STX $0477			; 8E 77 04 | Store X register to absolute address
	SBC ($1C),Y		  ; F1 1C | Subtract with carry ((zero page),Y)
	ADC ($7F,X)		  ; 61 7F | Add with carry ((zero page,X))
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	ORA ($E1,X)		  ; 01 E1 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_063
; Address: $E893C0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_063:
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	AND #$BF			 ; 29 BF | Logical AND with accumulator (immediate)
	BRA $FD			  ; 80 FD | Branch always
	PLX				  ; FA | Pull X register from stack
	EOR ($B9,X)		  ; 41 B9 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_064
; Address: $E893D0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_064:
	JSR $C0DF			; 20 DF C0 | Jump to subroutine
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	CPY $4F			  ; C4 4F | Compare Y register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_066
; Address: $E893E9
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_066:
	JSR $A58D			; 20 8D A5 | Jump to subroutine
	AND ($C1,X)		  ; 21 C1 | Logical AND with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	DEX				  ; CA | Decrement X register
	CLV				  ; B8 | Clear overflow flag
	STA				  ; 9F 00 FF 00 | Update graphics data
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	EOR $3A			  ; 45 3A | Exclusive OR with accumulator (zero page)
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	BRA $81			  ; 80 81 | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	LDA $300141		  ; AF 41 01 30 | Read graphics status
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	INC $C401,X		  ; FE 01 C4 | Increment (absolute,X)
	BNE $04			  ; D0 04 | Branch if not equal
	ROR $AE80,X		  ; 7E 80 AE | Rotate right (absolute,X)
	STA $2A			  ; 85 2A | Update graphics data
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	AND ($38,X)		  ; 21 38 | Logical AND with accumulator ((zero page,X))
	ASL $EE			  ; 06 EE | Arithmetic shift left (zero page)
	ORA ($56),Y		  ; 11 56 | Logical OR with accumulator ((zero page),Y)
	CMP #$A0			 ; C9 A0 | Compare accumulator (immediate)
	STA ($97),Y		  ; 91 97 | Update graphics data
	JMP $C03B			; 4C 3B C0 | Jump to address
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BMI $0F			  ; 30 0F | Branch if negative
	ORA $6806,Y		  ; 19 06 68 | Logical OR with accumulator (absolute,Y)
	STY $4A			  ; 84 4A | Store Y register to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_067
; Address: $E89444
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_067:
	BEQ $CB			  ; F0 CB | Branch if equal
	CPX $FB			  ; E4 FB | Compare X register (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND ($0E),Y		  ; 31 0E | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_068
; Address: $E8944C
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_068:
	JSR $380F			; 20 0F 38 | Jump to subroutine
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STY $04			  ; 84 04 | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	LSR $45			  ; 46 45 | Logical shift right (zero page)
	LSR $45			  ; 46 45 | Logical shift right (zero page)
	ROR $6E7D,X		  ; 7E 7D 6E | Rotate right (absolute,X)
	ADC $65			  ; 65 65 | Add with carry (zero page)
	EOR $45			  ; 45 45 | Exclusive OR with accumulator (zero page)
	PHY				  ; 5A | Push Y register to stack
	ROR $6E90			; 6E 90 6E | Rotate right (absolute)
	BCC $7C			  ; 90 7C | Branch if carry clear
	BRA $7C			  ; 80 7C | Branch always
	BRA $74			  ; 80 74 | Branch always
	TXA				  ; 8A | Transfer X register to accumulator
	TAX				  ; AA | Transfer accumulator to X register
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $50			  ; A4 50 | Load from zero page into Y register
	LDY $0000			; AC 00 00 | Load from absolute address into Y register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	STA $279B,Y		  ; 99 9B 27 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	DEC $A0			  ; C6 A0 | Decrement (zero page)
	STZ $A023			; 9C 23 A0 | Store zero to absolute
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BRA $E3			  ; 80 E3 | Branch always
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_069
; Address: $E8953A
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_069:
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $D0			  ; F0 D0 | Branch if equal
	BCS $80			  ; B0 80 | Branch if carry set
	AND $2010			; 2D 10 20 | Logical AND with accumulator (absolute)
	BPL $2F			  ; 10 2F | Branch if positive
	BVS $0F			  ; 70 0F | Branch if overflow set
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	AND $1EDC,X		  ; 3D DC 1E | Logical AND with accumulator (absolute,X)
	SBC #$0A			 ; E9 0A | Subtract with carry (immediate)
	BRA $00			  ; 80 00 | Branch always
	WDM #$80			 ; 42 80 | Reserved instruction
	SBC ($02,X)		  ; E1 02 | Subtract with carry ((zero page,X))
	STA				  ; 9F 00 00 00 | Update graphics data
	TSX				  ; BA | Transfer stack pointer to X register
	LDX $6662,Y		  ; BE 62 66 | Load from absolute,Y into X register
	ROR $0A			  ; 66 0A | Rotate right (zero page)
	ASL $DB			  ; 06 DB | Arithmetic shift left (zero page)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($07,X)		  ; 41 07 | Exclusive OR with accumulator ((zero page,X))
	STA $9907,Y		  ; 99 07 99 | Update graphics data
	SBC $F807,Y		  ; F9 07 F8 | Subtract with carry (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_06A
; Address: $E895A3
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_06A:
	CPY #$58			 ; C0 58 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	CLD				  ; D8 | Clear decimal mode flag
	INX				  ; E8 | Increment X register
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	ROR $D5BF,X		  ; 7E BF D5 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CMP $0000			; CD 00 00 | Compare accumulator (absolute)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	ADC ($1E,X)		  ; 61 1E | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_06B
; Address: $E895DE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_06B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	DEC $CE9C,X		  ; DE 9C CE | Decrement (absolute,X)
	DEC $FF00			; CE 00 FF | Decrement (absolute)
	BNE $2E			  ; D0 2E | Branch if not equal
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BPL $17			  ; 10 17 | Branch if positive
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_06C
; Address: $E89606
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_06C:
	ASL $BE09			; 0E 09 BE | Arithmetic shift left (absolute)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BPL $EC			  ; 10 EC | Branch if positive
	BPL $E8			  ; 10 E8 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $20			  ; F0 20 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDX #$DE			 ; A2 DE | Load immediate value into X register
	LDX $DA			  ; A6 DA | Load from zero page into X register
	BIT $3818			; 2C 18 38 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	BNE $9C			  ; D0 9C | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag
	CPY $7E00			; CC 00 7E | Compare Y register (absolute)
	ROR $7C80,X		  ; 7E 80 7C | Rotate right (absolute,X)
	BRA $78			  ; 80 78 | Branch always
	BRA $78			  ; 80 78 | Branch always
	BPL $6C			  ; 10 6C | Branch if positive
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0F00,Y		  ; 19 00 0F | Logical OR with accumulator (absolute,Y)
	ORA ($48),Y		  ; 11 48 | Logical OR with accumulator ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	WDM #$81			 ; 42 81 | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	STA ($00),Y		  ; 91 00 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $22			  ; 30 22 | Branch if negative
	ROL $A4			  ; 26 A4 | Rotate left (zero page)
	ORA $5154			; 0D 54 51 | Logical OR with accumulator (absolute)
	CMP ($26,X)		  ; C1 26 | Compare accumulator ((zero page,X))
	ORA $DB00,X		  ; 1D 00 DB | Logical OR with accumulator (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	STY $90F0			; 8C F0 90 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_06F
; Address: $E896AF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_06F:
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_070
; Address: $E896C0
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_070:
	BNE $C8			  ; D0 C8 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDX #$6A			 ; A2 6A | Load immediate value into X register
	BCC $14			  ; 90 14 | Branch if carry clear
	DEX				  ; CA | Decrement X register
	CLC				  ; 18 | Clear carry flag
	CPX $38CA			; EC CA 38 | Compare X register (absolute)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	BPL $EC			  ; 10 EC | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ADC #$2E			 ; 69 2E | Add with carry (immediate)
	ORA #$D6			 ; 09 D6 | Logical OR with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	STA $6B			  ; 85 6B | Update graphics data
	BPL $ED			  ; 10 ED | Branch if positive
	LDA $00FB			; AD FB 00 | Read graphics status
	LDA				  ; BF 00 DB 00 | Read graphics status
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROR $D9			  ; 66 D9 | Rotate right (zero page)
	CMP $FB			  ; C5 FB | Compare accumulator (zero page)
	REP #$AF			 ; C2 AF | Reset processor status bits
	STX $EF			  ; 86 EF | Store X register to zero page
	STY $0467			; 8C 67 04 | Store Y register to absolute address
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 00 3E 00 | Read graphics status
	ADC $7900,X		  ; 7D 00 79 | Add with carry (absolute,X)
	INC $1100,X		  ; FE 00 11 | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	SBC #$18			 ; E9 18 | Subtract with carry (immediate)
	AND $1450			; 2D 50 14 | Logical AND with accumulator (absolute)
	AND ($0A),Y		  ; 31 0A | Logical AND with accumulator ((zero page),Y)
	ORA ($2C),Y		  ; 11 2C | Logical OR with accumulator ((zero page),Y)
	ASL $007F,X		  ; 1E 7F 00 | Arithmetic shift left (absolute,X)
	ASL $4F00,X		  ; 1E 00 4F | Arithmetic shift left (absolute,X)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	CMP $4D24			; CD 24 4D | Compare accumulator (absolute)
	EOR ($E4),Y		  ; 51 E4 | Exclusive OR with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_071
; Address: $E89749
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_071:
	BNE $32			  ; D0 32 | Branch if not equal
	EOR $AA47,Y		  ; 59 47 AA | Exclusive OR with accumulator (absolute,Y)
	ORA $A8			  ; 05 A8 | Logical OR with accumulator (zero page)
	INC $FD00			; EE 00 FD | Increment (absolute)
	STA ($48),Y		  ; 91 48 | Update graphics data
	CMP #$3C			 ; C9 3C | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_072
; Address: $E89766
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_072:
	AND $33D6,Y		  ; 39 D6 33 | Logical AND with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	LSR $44B0			; 4E B0 44 | Logical shift right (absolute)
	LDA ($BF),Y		  ; B1 BF | Read graphics status
	ROL $6D00,X		  ; 3E 00 6D | Rotate left (absolute,X)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	INC $0200,X		  ; FE 00 02 | Increment (absolute,X)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_073
; Address: $E89782
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_073:
	JSR $74C6			; 20 C6 74 | Jump to subroutine
	JMP $AC38			; 4C 38 AC | Jump to address
	BPL $36			  ; 10 36 | Branch if positive
	CLI				  ; 58 | Clear interrupt disable flag
	LDX #$0A			 ; A2 0A | Load immediate value into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	CPX $EE00			; EC 00 EE | Compare X register (absolute)
	SBC $7C00,X		  ; FD 00 7C | Subtract with carry (absolute,X)
	EOR #$B6			 ; 49 B6 | Exclusive OR with accumulator (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	DEC $3D			  ; C6 3D | Decrement (zero page)
	BIT $5F			  ; 24 5F | Test bits in accumulator (zero page)
	ORA $72			  ; 05 72 | Logical OR with accumulator (zero page)
	LDA #$56			 ; A9 56 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $7A			  ; 85 7A | Update graphics data
	SBC $FB00,X		  ; FD 00 FB | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_074
; Address: $E897C2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_074:
	JSL $33449D		  ; 22 9D 44 33 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_075
; Address: $E897CA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_075:
	JSL $D32CD9		  ; 22 D9 2C D3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	ORA $1723,Y		  ; 19 23 17 | Logical OR with accumulator (absolute,Y)
	ADC ($37,X)		  ; 61 37 | Add with carry ((zero page,X))
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_076
; Address: $E897E8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_076:
	PHP				  ; 08 | Push processor status to stack
	BMI $1D			  ; 30 1D | Branch if negative
	ORA ($12),Y		  ; 11 12 | Logical OR with accumulator ((zero page),Y)
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))
	ROR $5B00,X		  ; 7E 00 5B | Rotate right (absolute,X)
	BIT $D0			  ; 24 D0 | Test bits in accumulator (zero page)
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_077
; Address: $E89804
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_077:
	JSR $C81D			; 20 1D C8 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	TXA				  ; 8A | Transfer X register to accumulator
	WDM #$05			 ; 42 05 | Reserved instruction
	PLA				  ; 68 | Pull accumulator from stack
	LDA $FB00,X		  ; BD 00 FB | Read graphics status
	EOR $D8			  ; 45 D8 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_078
; Address: $E89824
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_078:
	PHB				  ; 8B | Push data bank register to stack
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_079
; Address: $E8982A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_079:
	STA $5154			; 8D 54 51 | Update graphics data
	CMP ($36,X)		  ; C1 36 | Compare accumulator ((zero page,X))
	LDA				  ; BF 00 77 00 | Read graphics status
	BNE $24			  ; D0 24 | Branch if not equal
	CPY #$68			 ; C0 68 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_07A
; Address: $E89844
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_07A:
	JSL $8EC41E		  ; 22 1E C4 8E | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	STY $5810			; 8C 10 58 | Store Y register to absolute address
	BVC $68			  ; 50 68 | Branch if overflow clear
	BPL $FC			  ; 10 FC | Branch if positive
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $318A			; ED 8A 31 | Subtract with carry (absolute)
	ADC ($96,X)		  ; 61 96 | Add with carry ((zero page,X))
	SEP #$04			 ; E2 04 | Set processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ROR $B9			  ; 66 B9 | Rotate right (zero page)
	DEC				  ; 3A | Decrement accumulator
	WDM #$2D			 ; 42 2D | Reserved instruction
	ADC $01			  ; 65 01 | Add with carry (zero page)
	INC $40			  ; E6 40 | Increment (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	REP #$00			 ; C2 00 | Reset processor status bits
	ROL $0903			; 2E 03 09 | Rotate left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($18),Y		  ; 11 18 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CMP #$2C			 ; C9 2C | Compare accumulator (immediate)
	CMP ($75,X)		  ; C1 75 | Compare accumulator ((zero page,X))
	ASL $0B88,X		  ; 1E 88 0B | Arithmetic shift left (absolute,X)
	SBC #$1A			 ; E9 1A | Subtract with carry (immediate)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	STA ($28),Y		  ; 91 28 | Update graphics data
	BIT #$B4			 ; 89 B4 | Test bits in accumulator (immediate)
	STA $5431,Y		  ; 99 31 54 | Update graphics data
	LDY #$46			 ; A0 46 | Load immediate value into Y register
	AND $40			  ; 25 40 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_07B
; Address: $E898F2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_07B:
	ROR $6F00,X		  ; 7E 00 6F | Rotate right (absolute,X)
	REP #$00			 ; C2 00 | Reset processor status bits
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_07C
; Address: $E89902
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_07C:
	JSR $78C0			; 20 C0 78 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	BCC $60			  ; 90 60 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	CPY #$84			 ; C0 84 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $F8			  ; 80 F8 | Branch always
	SED				  ; F8 | Set decimal mode flag
	JMP $4400			; 4C 00 44 | Jump to address
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ADC $6058			; 6D 58 60 | Add with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	ASL $0E0F			; 0E 0F 0E | Arithmetic shift left (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ASL $000B			; 0E 0B 00 | Arithmetic shift left (absolute)
	ROL $0038,X		  ; 3E 38 00 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BPL $12			  ; 10 12 | Branch if positive
	DEX				  ; CA | Decrement X register
	DEY				  ; 88 | Decrement Y register
	ROR				  ; 6A | Rotate right (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	ROR $9728,X		  ; 7E 28 97 | Rotate right (absolute,X)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STA ($00,X)		  ; 81 00 | Update graphics data
	EOR $4D00,Y		  ; 59 00 4D | Exclusive OR with accumulator (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_07E
; Address: $E899A7
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_07E:
	JSL $F2275B		  ; 22 5B 27 F2 | Jump to subroutine long
	LDX $AE			  ; A6 AE | Load from zero page into X register
	BIT $183E			; 2C 3E 18 | Test bits in accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $D800,X		  ; 1D 00 D8 | Logical OR with accumulator (absolute,X)
	EOR $D300,Y		  ; 59 00 D3 | Exclusive OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	STY $9808			; 8C 08 98 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_07F
; Address: $E899CA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_07F:
	BNE $90			  ; D0 90 | Branch if not equal
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	BCC $80			  ; 90 80 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_081
; Address: $E899DC
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_081:
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	ROL $05			  ; 26 05 | Rotate left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$48			 ; 09 48 | Logical OR with accumulator (immediate)
	JMP ($0060)		  ; 6C 60 00 | Jump to address (absolute indirect)
	ASL $1C0E			; 0E 0E 1C | Arithmetic shift left (absolute)
	ASL $3818,X		  ; 1E 18 38 | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ADC $2F49			; 6D 49 2F | Add with carry (absolute)
	EOR $DF			  ; 45 DF | Exclusive OR with accumulator (zero page)
	REP #$37			 ; C2 37 | Reset processor status bits
	LDY #$07			 ; A0 07 | Load immediate value into Y register
	STA $A9EB			; 8D EB A9 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $B6			  ; 85 B6 | Update graphics data
	CLV				  ; B8 | Clear overflow flag
	AND $5B00,Y		  ; 39 00 5B | Logical AND with accumulator (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	BIT $0C02			; 2C 02 0C | Test bits in accumulator (absolute)
	ORA $17			  ; 05 17 | Logical OR with accumulator (zero page)
	BPL $08			  ; 10 08 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SBC $D334,X		  ; FD 34 D3 | Subtract with carry (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	DEC $69E1			; CE E1 69 | Decrement (absolute)
	PEA #$251D		   ; F4 1D 25 | Push effective address to stack
	ASL $0004			; 0E 04 00 | Arithmetic shift left (absolute)
	SBC $3100			; ED 00 31 | Subtract with carry (absolute)
	SEP #$00			 ; E2 00 | Set processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $CC06			; 6E 06 CC | Rotate right (absolute)
	AND $67			  ; 25 67 | Logical AND with accumulator (zero page)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_082
; Address: $E89A6E
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_082:
	BIT $7932			; 2C 32 79 | Test bits in accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ADC $2500			; 6D 00 25 | Add with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $DB30,X		  ; FD 30 DB | Subtract with carry (absolute,X)
	LDX $494A			; AE 4A 49 | Load from absolute address into X register
	AND #$E8			 ; 29 E8 | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	CMP $B894			; CD 94 B8 | Compare accumulator (absolute)
	PLX				  ; FA | Pull X register from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA ($00),Y		  ; 91 00 | Update graphics data
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $AD00			; ED 00 AD | Subtract with carry (absolute)
	ROR $CD26			; 6E 26 CD | Rotate right (absolute)
	BVC $C6			  ; 50 C6 | Branch if overflow clear
	BPL $CC			  ; 10 CC | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA ($01),Y		  ; B1 01 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3A00,Y		  ; 99 00 3A | Update graphics data
	AND $6900			; 2D 00 69 | Logical AND with accumulator (absolute)
	INC $F400,X		  ; FE 00 F4 | Increment (absolute,X)
	DEC $8A18,X		  ; DE 18 8A | Decrement (absolute,X)
	DEC $C4			  ; C6 C4 | Decrement (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	CLV				  ; B8 | Clear overflow flag
	INY				  ; C8 | Increment Y register
	BCC $5D			  ; 90 5D | Branch if carry clear
	CLV				  ; B8 | Clear overflow flag
	BPL $CA			  ; 10 CA | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	ROR $A800			; 6E 00 A8 | Rotate right (absolute)
	JMP ($F900)		  ; 6C 00 F9 | Jump to address (absolute indirect)
	STX $CF			  ; 86 CF | Store X register to zero page
	BCS $BF			  ; B0 BF | Branch if carry set
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_083
; Address: $E89AEA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_083:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	BRA $F9			  ; 80 F9 | Branch always
	ADC $F765,X		  ; 7D 65 F7 | Add with carry (absolute,X)
	JMP $142A04		  ; 5C 04 2A 14 | Jump to address long
	ORA $0B37,X		  ; 1D 37 0B | Logical OR with accumulator (absolute,X)
	JMP ($0600)		  ; 6C 00 06 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_084
; Address: $E89B16
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_084:
	PHP				  ; 08 | Push processor status to stack
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $A0			  ; 80 A0 | Branch always
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPX #$30			 ; E0 30 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_087
; Address: $E89B38
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_087:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	ORA $1B01,Y		  ; 19 01 1B | Logical OR with accumulator (absolute,Y)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $0D0A			; 0D 0A 0D | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	BPL $00			  ; 10 00 | Branch if positive
	BCC $C0			  ; 90 C0 | Branch if carry clear
	BNE $C0			  ; D0 C0 | Branch if not equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	BVS $10			  ; 70 10 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	BVC $00			  ; 50 00 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0C08			; 0E 08 0C | Arithmetic shift left (absolute)
	BPL $0C			  ; 10 0C | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA $0F00			; 0D 00 0F | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_088
; Address: $E89BB1
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_088:
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $B0			  ; 80 B0 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	AND $0F00,X		  ; 3D 00 0F | Logical AND with accumulator (absolute,X)
	SEP #$00			 ; E2 00 | Set processor status bits
	PEA #$E000		   ; F4 00 E0 | Game work RAM access
	CPY #$B8			 ; C0 B8 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	CPY #$B8			 ; C0 B8 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$70			 ; C0 70 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_08A
; Address: $E89C2D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_08A:
	JSR $3020			; 20 20 30 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	BMI $00			  ; 30 00 | Branch if negative
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $C0			  ; D0 C0 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	ORA $1D08,X		  ; 1D 08 1D | Logical OR with accumulator (absolute,X)
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	ORA $0C0C,X		  ; 1D 0C 0C | Logical OR with accumulator (absolute,X)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_08B
; Address: $E89C61
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_08B:
	JSR $62BA			; 20 BA 62 | Jump to subroutine
	CPY $98F8			; CC F8 98 | Compare Y register (absolute)
	ROL $AE			  ; 26 AE | Rotate left (zero page)
	BIT $083E			; 2C 3E 08 | Test bits in accumulator (absolute)
	STA $3300,X		  ; 9D 00 33 | Update graphics data
	CLI				  ; 58 | Clear interrupt disable flag
	CMP $D300,Y		  ; D9 00 D3 | Compare accumulator (absolute,Y)
	BIT $3808			; 2C 08 38 | Test bits in accumulator (absolute)
	BVC $DC			  ; 50 DC | Branch if overflow clear
	REP #$3A			 ; C2 3A | Reset processor status bits
	DEY				  ; 88 | Decrement Y register
	INX				  ; E8 | Increment X register
	BCS $F0			  ; B0 F0 | Branch if carry set
	LDY #$94			 ; A0 94 | Load immediate value into Y register
	STY $F4			  ; 84 F4 | Store Y register to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_08C
; Address: $E89C96
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_08C:
	WDM #$00			 ; 42 00 | Reserved instruction
	PHA				  ; 48 | Push accumulator to stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	SEI				  ; 78 | Set interrupt disable flag
	AND $D144			; 2D 44 D1 | Logical AND with accumulator (absolute)
	STZ $F6			  ; 64 F6 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_08D
; Address: $E89CA7
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_08D:
	JSR $10D7			; 20 D7 10 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	ORA ($EF),Y		  ; 11 EF | Logical OR with accumulator ((zero page),Y)
	LDA $FB00			; AD 00 FB | Read graphics status
	INC $FD00			; EE 00 FD | Increment (absolute)
	STA $3A40,Y		  ; 99 40 3A | Update graphics data
	CMP ($3D,X)		  ; C1 3D | Compare accumulator ((zero page,X))
	ADC $7396,Y		  ; 79 96 73 | Add with carry (absolute,Y)
	INC $F400,X		  ; FE 00 F4 | Increment (absolute,X)
	ORA ($BF,X)		  ; 01 BF | Logical OR with accumulator ((zero page,X))
	ROL $6D00,X		  ; 3E 00 6D | Rotate left (absolute,X)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	INC $6E00,X		  ; FE 00 6E | Increment (absolute,X)
	LSR $4C			  ; 46 4C | Logical shift right (zero page)
	CMP $4B			  ; C5 4B | Compare accumulator (zero page)
	DEC $92			  ; C6 92 | Decrement (zero page)
	ORA ($65,X)		  ; 01 65 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STA $3A00,Y		  ; 99 00 3A | Update graphics data
	AND $6500			; 2D 00 65 | Logical AND with accumulator (absolute)
	INC $00			  ; E6 00 | Increment (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	SED				  ; F8 | Set decimal mode flag
	BMI $D8			  ; 30 D8 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	STY $CC			  ; 84 CC | Store Y register to zero page
	JMP ($440C)		  ; 6C 0C 44 | Jump to address (absolute indirect)
	STY $40			  ; 84 40 | Store Y register to zero page
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	INY				  ; C8 | Increment Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_08E
; Address: $E89D34
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_08E:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	WDM #$39			 ; 42 39 | Reserved instruction
	STY $FA			  ; 84 FA | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	PLY				  ; 7A | Pull Y register from stack
	LDA $FB00,X		  ; BD 00 FB | Read graphics status
	CMP $BB40,X		  ; DD 40 BB | Compare accumulator (absolute,X)
	DEY				  ; 88 | Decrement Y register
	JMP $04DD04		  ; 5C 04 DD 04 | Jump to address long
	BMI $FC			  ; 30 FC | Branch if negative
	LDA				  ; BF 00 77 00 | Read graphics status
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $40			  ; 80 40 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_08F
; Address: $E89DC3
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_08F:
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA $BB20,Y		  ; 99 20 BB | Update graphics data
	STA ($BD,X)		  ; 81 BD | Update graphics data

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_090
; Address: $E89DE5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_090:
	BCC $75			  ; 90 75 | Branch if carry clear
	BPL $E6			  ; 10 E6 | Branch if positive
	REP #$00			 ; C2 00 | Reset processor status bits
	ROR $6F00,X		  ; 7E 00 6F | Rotate right (absolute,X)
	REP #$00			 ; C2 00 | Reset processor status bits
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_092
; Address: $E89E0F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_092:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA $DB00,X		  ; 1D 00 DB | Logical OR with accumulator (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	STX $99			  ; 86 99 | Store X register to zero page
	LDA				  ; BF 40 C7 F8 | Read graphics status
	LSR $6D31			; 4E 31 6D | Logical shift right (absolute)
	PLY				  ; 7A | Pull Y register from stack
	STA $30			  ; 85 30 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_093
; Address: $E89E34
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_093:
	BNE $00			  ; D0 00 | Branch if not equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	TXS				  ; 9A | Transfer X register to stack pointer
	ADC ($99,X)		  ; 61 99 | Add with carry ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CPY $FD			  ; C4 FD | Compare Y register (zero page)
	STY $49B6			; 8C B6 49 | Store Y register to absolute address
	LSR $4CA1,X		  ; 5E A1 4C | Logical shift right (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_094
; Address: $E89E5C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_094:
	JSR $1200			; 20 00 12 | Jump to subroutine
	ORA $0D03			; 0D 03 0D | Logical OR with accumulator (absolute)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ORA $1E			  ; 05 1E | Logical OR with accumulator (zero page)
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BVS $A0			  ; 70 A0 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	CPX #$38			 ; E0 38 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_096
; Address: $E89E88
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_096:
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $EC			  ; 70 EC | Branch if overflow set
	BMI $EC			  ; 30 EC | Branch if negative
	BIT $0040			; 2C 40 00 | Test bits in accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_097
; Address: $E89E98
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_097:
	JSR $6800			; 20 00 68 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	PLY				  ; 7A | Pull Y register from stack
	STA $6D			  ; 85 6D | Update graphics data
	DEC $C7B1			; CE B1 C7 | Decrement (absolute)
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 40 3C 23 | Read graphics status
	STX $99			  ; 86 99 | Store X register to zero page
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_098
; Address: $E89EBE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_098:
	BMI $00			  ; 30 00 | Branch if negative
	LSR $B6A1,X		  ; 5E A1 B6 | Logical shift right (absolute,X)
	EOR #$73			 ; 49 73 | Exclusive OR with accumulator (immediate)
	STA $1FE3			; 8D E3 1F | Update graphics data
	SBC $3C02,X		  ; FD 02 3C | Subtract with carry (absolute,X)
	CPY $61			  ; C4 61 | Compare Y register (zero page)
	STA $B39A,Y		  ; 99 9A B3 | Update graphics data

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_099
; Address: $E89ED2
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_099:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	JMP $1B00			; 4C 00 1B | Jump to address
	ASL $1B			  ; 06 1B | Arithmetic shift left (zero page)
	PHY				  ; 5A | Push Y register to stack
	ADC $3B			  ; 65 3B | Add with carry (zero page)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INC $6F4E,X		  ; FE 4E 6F | Increment (absolute,X)
	LDA $FABE7E		  ; AF 7E BE FA | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_09A
; Address: $E89F1B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_09A:
	ASL $3030			; 0E 30 30 | Arithmetic shift left (absolute)
	BVC $90			  ; 50 90 | Branch if overflow clear
	BMI $B0			  ; 30 B0 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_09C
; Address: $E89F27
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_09C:
	JSR $3818			; 20 18 38 | Jump to subroutine
	INX				  ; E8 | Increment X register
	PLP				  ; 28 | Pull processor status from stack
	INX				  ; E8 | Increment X register
	ORA #$60			 ; 09 60 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	ASL $031C,X		  ; 1E 1C 03 | Arithmetic shift left (absolute,X)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1700,X		  ; 1E 00 17 | Arithmetic shift left (absolute,X)
	ADC #$07			 ; 69 07 | Add with carry (immediate)
	PHP				  ; 08 | Push processor status to stack
	EOR ($B7),Y		  ; 51 B7 | Exclusive OR with accumulator ((zero page),Y)
	AND ($F6),Y		  ; 31 F6 | Logical AND with accumulator ((zero page),Y)
	SBC $E7			  ; E5 E7 | Subtract with carry (zero page)
	SEP #$06			 ; E2 06 | Set processor status bits
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0F00			; 0E 00 0F | Arithmetic shift left (absolute)
	ASL $1C00,X		  ; 1E 00 1C | Arithmetic shift left (absolute,X)
	INC $CB00,X		  ; FE 00 CB | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	CLD				  ; D8 | Clear decimal mode flag
	BNE $00			  ; D0 00 | Branch if not equal
	BIT #$79			 ; 89 79 | Test bits in accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_09D
; Address: $E89FA0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_09D:
	JSR $3024			; 20 24 30 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_09E
; Address: $E89FB8
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_09E:
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	EOR ($01),Y		  ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
	ORA $0002			; 0D 02 00 | Logical OR with accumulator (absolute)
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $4172,X		  ; 1D 72 41 | Logical OR with accumulator (absolute,X)
	WDM #$7E			 ; 42 7E | Reserved instruction
	SED				  ; F8 | Set decimal mode flag
	DEC $3BE0,X		  ; DE E0 3B | Decrement (absolute,X)
	CMP $36DC,X		  ; DD DC 36 | Compare accumulator (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_09F
; Address: $E8A003
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_09F:
	ROR $6C38,X		  ; 7E 38 6C | Rotate right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0A1
; Address: $E8A00C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0A1:
	DEC $A8C0			; CE C0 A8 | Decrement (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 00 3F 00 | Update graphics data
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0A3
; Address: $E8A02D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0A3:
	JSR $20A0			; 20 A0 20 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0A4
; Address: $E8A036
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0A4:
	BNE $00			  ; D0 00 | Branch if not equal
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ASL $26			  ; 06 26 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $2900,Y		  ; 19 00 29 | Logical OR with accumulator (absolute,Y)
	AND $E000,Y		  ; 39 00 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0A6
; Address: $E8A064
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0A6:
	JSR $F800			; 20 00 F8 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	DEC				  ; 3A | Decrement accumulator
	BIT $16			  ; 24 16 | Test bits in accumulator (zero page)
	DEC $10			  ; C6 10 | Decrement (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	INC $FA00,X		  ; FE 00 FA | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0A7
; Address: $E8A080
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0A7:
	JSL $003116		  ; 22 16 31 00 | Jump to subroutine long
	LSR $4108,X		  ; 5E 08 41 | Logical shift right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ROR $6180,X		  ; 7E 80 61 | Rotate right (absolute,X)
	STZ $0039,X		  ; 9E 39 00 | Store zero to absolute,X
	ROR $34D5,X		  ; 7E D5 34 | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	BMI $7C			  ; 30 7C | Branch if negative
	SEC				  ; 38 | Set carry flag
	PLB				  ; AB | Pull data bank register from stack
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	SEC				  ; 38 | Set carry flag
	LSR $7761,X		  ; 5E 61 77 | Logical shift right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	STA				  ; 9F 00 AC E7 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF 00 FF 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	TSX				  ; BA | Transfer stack pointer to X register
	STA $3D			  ; 85 3D | Update graphics data
	ASL $3E7E,X		  ; 1E 7E 3E | Arithmetic shift left (absolute,X)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	LSR $484F			; 4E 4F 48 | Logical shift right (absolute)
	PHA				  ; 48 | Push accumulator to stack
	BNE $40			  ; D0 40 | Branch if not equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0A8
; Address: $E8A106
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0A8:
	BNE $40			  ; D0 40 | Branch if not equal
	EOR #$9B			 ; 49 9B | Exclusive OR with accumulator (immediate)
	STX $8B			  ; 86 8B | Store X register to zero page
	BCS $00			  ; B0 00 | Branch if carry set
	LDA				  ; BF 00 BF 00 | Read graphics status
	BCS $00			  ; B0 00 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$C900		   ; F4 00 C9 | Push effective address to stack
	AND $0507,Y		  ; 39 07 05 | Logical AND with accumulator (absolute,Y)
	ASL $5800,X		  ; 1E 00 58 | Arithmetic shift left (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	STA ($42),Y		  ; 91 42 | Hardware register operation
	EOR $91D2			; 4D D2 91 | Exclusive OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLX				  ; FA | Pull X register from stack
	ROL $9721,X		  ; 3E 21 97 | Rotate left (absolute,X)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BRA $C0			  ; 80 C0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	STY $3C			  ; 84 3C | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0A9
; Address: $E8A163
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0A9:
	JSL $7E1E52		  ; 22 52 1E 7E | Jump to subroutine long
	ROL $20E1,X		  ; 3E E1 20 | Rotate left (absolute,X)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0AA
; Address: $E8A186
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0AA:
	LDA $6565B0		  ; AF B0 65 65 | Read graphics status
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDA $00FF90		  ; AF 90 FF 00 | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	TXS				  ; 9A | Transfer X register to stack pointer
	BCC $00			  ; 90 00 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$FE			 ; 09 FE | Logical OR with accumulator (immediate)
	EOR ($B6),Y		  ; 51 B6 | Exclusive OR with accumulator ((zero page),Y)
	AND ($F6),Y		  ; 31 F6 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0AB
; Address: $E8A1A9
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0AB:
	SBC $E7			  ; E5 E7 | Subtract with carry (zero page)
	SEP #$06			 ; E2 06 | Set processor status bits
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $1C00,X		  ; 1E 00 1C | Arithmetic shift left (absolute,X)
	INC $0B00,X		  ; FE 00 0B | Increment (absolute,X)
	CPX $E81C			; EC 1C E8 | Compare X register (absolute)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BIT #$79			 ; 89 79 | Test bits in accumulator (immediate)
	PEA #$F300		   ; F4 00 F3 | Push effective address to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$42			 ; C0 42 | Hardware register operation
	LSR $0C18			; 4E 18 0C | Logical shift right (absolute)
	PLP				  ; 28 | Pull processor status from stack
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	STX $3800			; 8E 00 38 | Store X register to absolute address
	DEC $3F			  ; C6 3F | Decrement (zero page)
	LDA ($00),Y		  ; B1 00 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	STA $B58760		  ; 8F 60 87 B5 | Update graphics data
	LSR $C3			  ; 46 C3 | Logical shift right (zero page)
	BNE $00			  ; D0 00 | Branch if not equal
	BPL $FF			  ; 10 FF | Branch if positive
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$FE			 ; 09 FE | Logical OR with accumulator (immediate)
	EOR ($B6),Y		  ; 51 B6 | Exclusive OR with accumulator ((zero page),Y)
	BMI $F6			  ; 30 F6 | Branch if negative
	SEP #$E6			 ; E2 E6 | Set processor status bits
	INC $E2			  ; E6 E2 | Increment (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	PEA #$FF00		   ; F4 00 FF | Push effective address to stack
	ORA $1D00			; 0D 00 1D | Logical OR with accumulator (absolute)
	ORA $FD00,X		  ; 1D 00 FD | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0AC
; Address: $E8A241
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0AC:
	JSR $5DA2			; 20 A2 5D | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SBC $DE0F,Y		  ; F9 0F DE | Subtract with carry (absolute,Y)
	LSR $0696			; 4E 96 06 | Logical shift right (absolute)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	LDA ($00),Y		  ; B1 00 | Read graphics status
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	AND $34C5,Y		  ; 39 C5 34 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0AD
; Address: $E8A265
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0AD:
	SED				  ; F8 | Set decimal mode flag
	CPY $70			  ; C4 70 | Compare Y register (zero page)
	PEA #$4570		   ; F4 70 45 | Push effective address to stack
	CMP ($79,X)		  ; C1 79 | Compare accumulator ((zero page,X))
	STY $4F			  ; 84 4F | Store Y register to zero page
	INY				  ; C8 | Increment Y register
	INC $8700,X		  ; FE 00 87 | Increment (absolute,X)
	STA $008F00		  ; 8F 00 8F 00 | Update graphics data
	LDX $FF00,Y		  ; BE 00 FF | Load from absolute,Y into X register
	BIT #$73			 ; 89 73 | Test bits in accumulator (immediate)
	ADC ($72),Y		  ; 71 72 | Add with carry ((zero page),Y)
	BEQ $D5			  ; F0 D5 | Branch if equal
	SBC ($65),Y		  ; F1 65 | Subtract with carry ((zero page),Y)
	EOR ($7C,X)		  ; 41 7C | Exclusive OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STX $0F00			; 8E 00 0F | Store X register to absolute address
	ASL $FE00			; 0E 00 FE | Arithmetic shift left (absolute)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INX				  ; E8 | Increment X register
	ORA ($E2,X)		  ; 01 E2 | Logical OR with accumulator ((zero page,X))
	ORA $FEE2,X		  ; 1D E2 FE | Logical OR with accumulator (absolute,X)
	INC $2EF2			; EE F2 2E | Increment (absolute)
	CPY $0318			; CC 18 03 | Compare Y register (absolute)
	ORA $1D00,X		  ; 1D 00 1D | Logical OR with accumulator (absolute,X)
	CMP $F700,X		  ; DD 00 F7 | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0AE
; Address: $E8A2C1
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0AE:
	JSR $5DA2			; 20 A2 5D | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	PLX				  ; FA | Pull X register from stack
	CMP $FD00,Y		  ; D9 00 FD | Compare accumulator (absolute,Y)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	BEQ $84			  ; F0 84 | Branch if equal
	BMI $F4			  ; 30 F4 | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	STY $7F			  ; 84 7F | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	STA $00CF00		  ; 8F 00 CF 00 | Update graphics data
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	LDA $3F3C,X		  ; BD 3C 3F | Read graphics status
	ROL $3EBE,X		  ; 3E BE 3E | Rotate left (absolute,X)
	LDX $003E,Y		  ; BE 3E 00 | Load from absolute,Y into X register
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ASL $3E0C,X		  ; 1E 0C 3E | Arithmetic shift left (absolute,X)
	ASL $0E2F,X		  ; 1E 2F 0E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0AF
; Address: $E8A329
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0AF:
	ASL $C6E7			; 0E E7 C6 | Arithmetic shift left (absolute)
	CMP ($C0),Y		  ; D1 C0 | Compare accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	AND $3F00,Y		  ; 39 00 3F | Logical AND with accumulator (absolute,Y)
	INC $E200			; EE 00 E2 | Increment (absolute)
	EOR ($C0),Y		  ; 51 C0 | Exclusive OR with accumulator ((zero page),Y)
	ASL $C108,X		  ; 1E 08 C1 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 09 00 FE | Read graphics status
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	SBC $3F00,Y		  ; F9 00 3F | Subtract with carry (absolute,Y)
	BNE $77			  ; D0 77 | Branch if not equal
	BCS $37			  ; B0 37 | Branch if carry set
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	AND $3886,Y		  ; 39 86 38 | Logical AND with accumulator (absolute,Y)
	STX $69			  ; 86 69 | Store X register to zero page
	EOR ($BC,X)		  ; 41 BC | Exclusive OR with accumulator ((zero page,X))
	STA $00CF00		  ; 8F 00 CF 00 | Update graphics data
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	INY				  ; C8 | Increment Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BPL $20			  ; 10 20 | Branch if positive
	LDX #$8B			 ; A2 8B | Load immediate value into X register
	BIT $D0			  ; 24 D0 | Test bits in accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	XBA				  ; EB | Exchange accumulator bytes
	ROR $A24A,X		  ; 7E 4A A2 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0B0
; Address: $E8A3A8
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0B0:
	RTI				  ; 40 | Return from interrupt
	LDY $14			  ; A4 14 | Load from zero page into Y register
	BPL $68			  ; 10 68 | Branch if positive
	ADC $FF00,X		  ; 7D 00 FF | Add with carry (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	BPL $FF			  ; 10 FF | Branch if positive
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	BRA $7F			  ; 80 7F | Branch always
	STA ($7E,X)		  ; 81 7E | Update graphics data
	BCS $37			  ; B0 37 | Branch if carry set
	STA ($06,X)		  ; 81 06 | Update graphics data
	ORA #$86			 ; 09 86 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	STX $68			  ; 86 68 | Store X register to zero page
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	DEC $DA00			; CE 00 DA | Decrement (absolute)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0B1
; Address: $E8A406
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0B1:
	LDX $9E3E,Y		  ; BE 3E 9E | Load from absolute,Y into X register
	ASL $0081,X		  ; 1E 81 00 | Arithmetic shift left (absolute,X)
	ROR $81			  ; 66 81 | Rotate right (zero page)
	ROL $FFC1,X		  ; 3E C1 FF | Rotate left (absolute,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	ADC $7D3C,X		  ; 7D 3C 7D | Add with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ADC $018E,Y		  ; 79 8E 01 | Add with carry (absolute,Y)
	CLV				  ; B8 | Clear overflow flag
	BEQ $0F			  ; F0 0F | Branch if equal
	AND ($08,X)		  ; 21 08 | Logical AND with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	CPY $F3			  ; C4 F3 | Compare Y register (zero page)
	CPY $AE91			; CC 91 AE | Compare Y register (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	CPY #$85			 ; C0 85 | Compare Y register (immediate)
	ORA $09F2			; 0D F2 09 | Logical OR with accumulator (absolute)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 00 0F 00 | Update graphics data
	BNE $77			  ; D0 77 | Branch if not equal
	BCS $37			  ; B0 37 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 01 FD 8F | Read graphics status
	INC $8000,X		  ; FE 00 80 | Increment (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $E17F,X		  ; 1E 7F E1 | Arithmetic shift left (absolute,X)
	ADC $C087,Y		  ; 79 87 C0 | Add with carry (absolute,Y)
	LDY $D880,X		  ; BC 80 D8 | Load from absolute,X into Y register
	CPY #$91			 ; C0 91 | Compare Y register (immediate)
	LDA ($7C,X)		  ; A1 7C | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	STX $00			  ; 86 00 | Store X register to zero page
	ROR $1B00,X		  ; 7E 00 1B | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPX #$96			 ; E0 96 | Compare X register (immediate)
	DEC $1F2F			; CE 2F 1F | Decrement (absolute)
	STA				  ; 9F 09 4F 27 | Update graphics data
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0B2
; Address: $E8A4DC
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0B2:
	BEQ $00			  ; F0 00 | Branch if equal
	INY				  ; C8 | Increment Y register
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	LDX $20			  ; A6 20 | Load from zero page into X register
	ROL $9228			; 2E 28 92 | Rotate left (absolute)
	ROL $7E7E,X		  ; 3E 7E 7E | Rotate left (absolute,X)
	ROR $7F4F,X		  ; 7E 4F 7F | Rotate right (absolute,X)
	STA ($01,X)		  ; 81 01 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	INC $E000,X		  ; FE 00 E0 | Game work RAM access
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	ASL $EE7F			; 0E 7F EE | Arithmetic shift left (absolute)
	BEQ $F1			  ; F0 F1 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	LDA $18FD,Y		  ; B9 FD 18 | Read graphics status
	ROR $7EBC,X		  ; 7E BC 7E | Rotate right (absolute,X)
	STA ($1F),Y		  ; 91 1F | Update graphics data
	LSR $87			  ; 46 87 | Logical shift right (zero page)
	BMI $C7			  ; 30 C7 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	ROL $7E57,X		  ; 3E 57 7E | Rotate left (absolute,X)
	AND $28FA,Y		  ; 39 FA 28 | Logical AND with accumulator (absolute,Y)
	LDA				  ; BF 09 EF C1 | Read graphics status
	STA ($00,X)		  ; 81 00 | Update graphics data
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	INC $3A01,X		  ; FE 01 3A | Increment (absolute,X)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	BRA $F8			  ; 80 F8 | Branch always
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	LDA $4A83,Y		  ; B9 83 4A | Read graphics status
	LDX $7333,Y		  ; BE 33 73 | Load from absolute,Y into X register
	ROR $7E			  ; 66 7E | Rotate right (zero page)
	ROL $7FFF,X		  ; 3E FF 7F | Rotate left (absolute,X)
	CPY $8400			; CC 00 84 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0B3
; Address: $E8A598
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0B3:
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STX $30E6			; 8E E6 30 | Store X register to absolute address
	BEQ $60			  ; F0 60 | Branch if equal
	CPX #$D6			 ; E0 D6 | Compare X register (immediate)
	STA				  ; 9F B9 9F 6F | Update graphics data
	ORA $0F00,Y		  ; 19 00 0F | Logical OR with accumulator (absolute,Y)
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0B5
; Address: $E8A5BE
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0B5:
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	BRA $1F			  ; 80 1F | Branch always
	ASL $3E3F,X		  ; 1E 3F 3E | Arithmetic shift left (absolute,X)
	AND $D23E,X		  ; 3D 3E D2 | Logical AND with accumulator (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SEP #$00			 ; E2 00 | Set processor status bits
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA $F8			  ; 05 F8 | Logical OR with accumulator (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ROR $5881,X		  ; 7E 81 58 | Rotate right (absolute,X)
	STA ($76,X)		  ; 81 76 | Update graphics data
	BIT #$7E			 ; 89 7E | Test bits in accumulator (immediate)
	STA ($06,X)		  ; 81 06 | Update graphics data
	SBC $00FF,Y		  ; F9 FF 00 | Subtract with carry (absolute,Y)
	ROL $00D1,X		  ; 3E D1 00 | Rotate left (absolute,X)
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	BRA $00			  ; 80 00 | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	BMI $E7			  ; 30 E7 | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0B6
; Address: $E8A623
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0B6:
	JSR $002C			; 20 2C 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA $0B01			; 0D 01 0B | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	STZ $0CFE,X		  ; 9E FE 0C | Store zero to absolute,X
	ASL $0C00			; 0E 00 0C | Arithmetic shift left (absolute)
	ASL $2300,X		  ; 1E 00 23 | Arithmetic shift left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $61			  ; F0 61 | Branch if equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0B7
; Address: $E8A665
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0B7:
	CPX #$D6			 ; E0 D6 | Compare X register (immediate)
	STA				  ; 9F D9 DF A3 | Update graphics data
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0B8
; Address: $E8A67C
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0B8:
	JSR $CC00			; 20 00 CC | Jump to subroutine
	CLI				  ; 58 | Clear interrupt disable flag
	ROR $7C4D,X		  ; 7E 4D 7C | Rotate right (absolute,X)
	BRA $66			  ; 80 66 | Branch always
	BIT #$40			 ; 89 40 | Test bits in accumulator (immediate)
	REP #$1D			 ; C2 1D | Reset processor status bits
	SBC $E30C,Y		  ; F9 0C E3 | Subtract with carry (absolute,Y)
	STA ($00,X)		  ; 81 00 | Update graphics data
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $08			  ; F0 08 | Branch if equal
	BCS $34			  ; B0 34 | Branch if carry set
	BMI $34			  ; 30 34 | Branch if negative
	ADC $787A,Y		  ; 79 7A 78 | Add with carry (absolute,Y)
	STA				  ; 9F 08 CF FF | Update graphics data
	STA $00			  ; 85 00 | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0B9
; Address: $E8A6BE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0B9:
	BMI $00			  ; 30 00 | Branch if negative
	ORA #$11			 ; 09 11 | Logical OR with accumulator (immediate)
	BIT $07			  ; 24 07 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	JMP $8F4F9F		  ; 5C 9F 4F 8F | Jump to address long
	ASL $3800,X		  ; 1E 00 38 | Arithmetic shift left (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0BA
; Address: $E8A6DA
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0BA:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	BIT $E0			  ; 24 E0 | Game work RAM access
	BPL $F2			  ; 10 F2 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PLX				  ; FA | Pull X register from stack
	DEC				  ; 3A | Decrement accumulator
	SBC $F1F2,Y		  ; F9 F2 F1 | Subtract with carry (absolute,Y)
	DEC $C1			  ; C6 C1 | Decrement (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ORA $1301			; 0D 01 13 | Logical OR with accumulator (absolute)
	ORA $0301			; 0D 01 03 | Logical OR with accumulator (absolute)
	ASL $1C00			; 0E 00 1C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0BB
; Address: $E8A71C
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0BB:
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	BCC $64			  ; 90 64 | Branch if carry clear
	SEI				  ; 78 | Set interrupt disable flag
	AND $FE3F,Y		  ; 39 3F FE | Logical AND with accumulator (absolute,Y)
	ASL $05E5,X		  ; 1E E5 05 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	EOR ($18,X)		  ; 41 18 | Exclusive OR with accumulator ((zero page,X))
	LSR $1E7E			; 4E 7E 1E | Logical shift right (absolute)
	ROR $682B,X		  ; 7E 2B 68 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	LDA $F01580		  ; AF 80 15 F0 | Read graphics status
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	ORA $8E00			; 0D 00 8E | Logical OR with accumulator (absolute)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BCC $C0			  ; 90 C0 | Branch if carry clear
	BPL $40			  ; 10 40 | Branch if positive
	JMP $4E55			; 4C 55 4E | Jump to address
	EOR $00F0			; 4D F0 00 | Exclusive OR with accumulator (absolute)
	LDA				  ; BF 00 B8 00 | Read graphics status
	CLV				  ; B8 | Clear overflow flag
	LDY $BA00,X		  ; BC 00 BA | Load from absolute,X into Y register
	CPY #$BC			 ; C0 BC | Compare Y register (immediate)
	EOR $C11C,X		  ; 5D 1C C1 | Exclusive OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL $900E,X		  ; 1E 0E 90 | Arithmetic shift left (absolute,X)
	LSR $DE48			; 4E 48 DE | Logical shift right (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	STX $0043			; 8E 43 00 | Store X register to absolute address
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	LSR $6E70,X		  ; 5E 70 6E | Logical shift right (absolute,X)
	JMP ($5C5C)		  ; 6C 5C 5C | Jump to address (absolute indirect)
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	LDA ($FF,X)		  ; A1 FF | Read graphics status
	STA ($FF,X)		  ; 81 FF | Update graphics data
	STA ($FF,X)		  ; 81 FF | Update graphics data
	BVS $80			  ; 70 80 | Branch if overflow set
	STX $9E50			; 8E 50 9E | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0BC
; Address: $E8A7C6
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0BC:
	ROL $255A			; 2E 5A 25 | Rotate left (absolute)
	LSR $4C01,X		  ; 5E 01 4C | Logical shift right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	AND #$0D			 ; 29 0D | Logical AND with accumulator (immediate)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ASL $047F			; 0E 7F 04 | Arithmetic shift left (absolute)
	ROL $0E00,X		  ; 3E 00 0E | Rotate left (absolute,X)
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	ADC ($0A),Y		  ; 71 0A | Add with carry ((zero page),Y)
	ADC $5A74,Y		  ; 79 74 5A | Add with carry (absolute,Y)
	LDY $7A			  ; A4 7A | Load from zero page into Y register
	BRA $32			  ; 80 32 | Branch always
	CLC				  ; 18 | Clear carry flag
	BMI $0C			  ; 30 0C | Branch if negative
	STA $20F700		  ; 8F 00 F7 20 | Update graphics data
	INC $FE70,X		  ; FE 70 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0BD
; Address: $E8A7F9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0BD:
	JSR $00FE			; 20 FE 00 | Jump to subroutine
	CPX $FC00			; EC 00 FC | Compare X register (absolute)
	STZ $7300			; 9C 00 73 | Store zero to absolute
	BIT $0A0C			; 2C 0C 0A | Test bits in accumulator (absolute)
	LSR $130E			; 4E 0E 13 | Logical shift right (absolute)
	STA				  ; 9F 00 7C 00 | Update graphics data
	ORA $1C00			; 0D 00 1C | Logical OR with accumulator (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	EOR $721B,Y		  ; 59 1B 72 | Exclusive OR with accumulator (absolute,Y)
	EOR ($1F,X)		  ; 41 1F | Exclusive OR with accumulator ((zero page,X))
	DEC $9F7F,X		  ; DE 7F 9F | Decrement (absolute,X)
	STZ $00			  ; 64 00 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0BF
; Address: $E8A83A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0BF:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY $F0			  ; C4 F0 | Compare Y register (zero page)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0C1
; Address: $E8A84A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0C1:
	JSR $3080			; 20 80 30 | Jump to subroutine
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $0C			  ; 80 0C | Branch always
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0C4
; Address: $E8A864
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0C4:
	STY $4C			  ; 84 4C | Store Y register to zero page
	INY				  ; C8 | Increment Y register
	JMP ($0013)		  ; 6C 13 00 | Jump to address (absolute indirect)
	CLC				  ; 18 | Clear carry flag
	BIT #$F9			 ; 89 F9 | Test bits in accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	SBC $FB00,Y		  ; F9 00 FB | Subtract with carry (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHX				  ; DA | Push X register to stack
	DEC $4E4E			; CE 4E 4E | Decrement (absolute)
	ASL $0E1F			; 0E 1F 0E | Arithmetic shift left (absolute)
	AND #$D8			 ; 29 D8 | Logical AND with accumulator (immediate)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	STX $3601			; 8E 01 36 | Store X register to absolute address
	CMP #$31			 ; C9 31 | Compare accumulator (immediate)
	LDA ($00),Y		  ; B1 00 | Read graphics status
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ROL $04			  ; 26 04 | Rotate left (zero page)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	BPL $1E			  ; 10 1E | Branch if positive
	BPL $3E			  ; 10 3E | Branch if positive
	BVC $3E			  ; 50 3E | Branch if overflow clear
	ROL $8AF4,X		  ; 3E F4 8A | Rotate left (absolute,X)
	ROL $3E7E,X		  ; 3E 7E 3E | Rotate left (absolute,X)
	LSR $09			  ; 46 09 | Logical shift right (zero page)
	ADC ($20),Y		  ; 71 20 | Add with carry ((zero page),Y)
	ROL $FFC1,X		  ; 3E C1 FF | Rotate left (absolute,X)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	STA ($FF,X)		  ; 81 FF | Update graphics data
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Update graphics data
	STA ($FF,X)		  ; 81 FF | Update graphics data
	STX $FF			  ; 86 FF | Store X register to zero page
	INX				  ; E8 | Increment X register
	XBA				  ; EB | Exchange accumulator bytes
	BRA $8F			  ; 80 8F | Branch always
	DEY				  ; 88 | Decrement Y register
	STA $FCFFF8		  ; 8F F8 FF FC | Update graphics data
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0C5
; Address: $E8A906
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0C5:
	JSR $20A0			; 20 A0 20 | Jump to subroutine
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	BNE $1C			  ; D0 1C | Branch if not equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $22			  ; F0 22 | Branch if equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0C6
; Address: $E8A91D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0C6:
	INC $FE3E,X		  ; FE 3E FE | Increment (absolute,X)
	ASL $0524,X		  ; 1E 24 05 | Arithmetic shift left (absolute,X)
	ASL $1525			; 0E 25 15 | Arithmetic shift left (absolute)
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0C7
; Address: $E8A92D
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0C7:
	JSR $130B			; 20 0B 13 | Jump to subroutine
	ROL $3B00,X		  ; 3E 00 3B | Rotate left (absolute,X)
	ROL $7F00,X		  ; 3E 00 7F | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BIT $A0			  ; 24 A0 | Test bits in accumulator (zero page)
	BVS $A4			  ; 70 A4 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register
	STY $84			  ; 84 84 | Store Y register to zero page
	INC				  ; 1A | Increment accumulator
	BPL $E4			  ; 10 E4 | Branch if positive
	BVC $08			  ; 50 08 | Branch if overflow clear
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	LDA $ECBD,X		  ; BD BD EC | Read graphics status
	CPX $C8C8			; EC C8 C8 | Compare X register (absolute)
	LDA $E800			; AD 00 E8 | Read graphics status
	WDM #$00			 ; 42 00 | Reserved instruction
	BIT #$3E			 ; 89 3E | Test bits in accumulator (immediate)
	CMP $04			  ; C5 04 | Compare accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack
	AND $1001,X		  ; 3D 01 10 | Logical AND with accumulator (absolute,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	AND $1800,X		  ; 3D 00 18 | Logical AND with accumulator (absolute,X)
	ROL $1C00,X		  ; 3E 00 1C | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0C9
; Address: $E8A9A5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0C9:
	JSR $7010			; 20 10 70 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0CA
; Address: $E8A9AA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0CA:
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	BRA $00			  ; 80 00 | Branch always
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0CB
; Address: $E8A9B4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0CB:
	BNE $00			  ; D0 00 | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0CC
; Address: $E8A9BC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0CC:
	SEI				  ; 78 | Set interrupt disable flag
	BPL $00			  ; 10 00 | Branch if positive
	BIT #$73			 ; 89 73 | Test bits in accumulator (immediate)
	ADC ($72),Y		  ; 71 72 | Add with carry ((zero page),Y)
	BVS $55			  ; 70 55 | Branch if overflow set
	BVS $0C			  ; 70 0C | Branch if overflow set
	WDM #$A0			 ; 42 A0 | Reserved instruction

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0CD
; Address: $E8A9CF
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0CD:
	JSL $8E0006		  ; 22 06 00 8E | Jump to subroutine long
	STA $00AF00		  ; 8F 00 AF 00 | Update graphics data
	STA $00FF00		  ; 8F 00 FF 00 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	ORA $10EF			; 0D EF 10 | Logical OR with accumulator (absolute)
	AND ($C0),Y		  ; 31 C0 | Logical AND with accumulator ((zero page),Y)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	STA ($07,X)		  ; 81 07 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0CE
; Address: $E8AA0B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0CE:
	JSR $4080			; 20 80 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0CF
; Address: $E8AA14
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0CF:
	JSR $2000			; 20 00 20 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHY				  ; 5A | Push Y register to stack
	STA ($1D,X)		  ; 81 1D | Update graphics data
	STA ($03),Y		  ; 91 03 | Update graphics data
	STY $8502			; 8C 02 85 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	TSX				  ; BA | Transfer stack pointer to X register
	PLY				  ; 7A | Pull Y register from stack
	BRA $1F			  ; 80 1F | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0D0
; Address: $E8AA33
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0D0:
	JSR $30EE			; 20 EE 30 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 00 85 00 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	LSR $D9			  ; 46 D9 | Logical shift right (zero page)
	SBC $2700,X		  ; FD 00 27 | Subtract with carry (absolute,X)
	ROL $FE			  ; 26 FE | Rotate left (zero page)
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CMP $FF00,Y		  ; D9 00 FF | Compare accumulator (absolute,Y)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0D1
; Address: $E8AA68
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0D1:
	BPL $00			  ; 10 00 | Branch if positive
	LSR				  ; 4A | Logical shift right (accumulator)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BNE $D0			  ; D0 D0 | Branch if not equal
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	PHY				  ; 5A | Push Y register to stack
	DEC $BE1C,X		  ; DE 1C BE | Decrement (absolute,X)
	ROL $7FFF,X		  ; 3E FF 7F | Rotate left (absolute,X)
	ASL $027E,X		  ; 1E 7E 02 | Arithmetic shift left (absolute,X)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	SEP #$00			 ; E2 00 | Set processor status bits
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	ASL $3E0C,X		  ; 1E 0C 3E | Arithmetic shift left (absolute,X)
	ASL $0E2F,X		  ; 1E 2F 0E | Arithmetic shift left (absolute,X)
	ASL $C6E1			; 0E E1 C6 | Arithmetic shift left (absolute)
	CMP ($C0),Y		  ; D1 C0 | Compare accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	AND $3F00,Y		  ; 39 00 3F | Logical AND with accumulator (absolute,Y)
	INC $8100			; EE 00 81 | Increment (absolute)
	ROL $A02F,X		  ; 3E 2F A0 | Rotate left (absolute,X)
	BVC $90			  ; 50 90 | Branch if overflow clear
	STA				  ; 9F 10 90 40 | Update graphics data
	BRA $23			  ; 80 23 | Branch always
	STZ $BF40			; 9C 40 BF | Store zero to absolute
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	ORA $1706,Y		  ; 19 06 17 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	BNE $00			  ; D0 00 | Branch if not equal
	PEA #$500B		   ; F4 0B 50 | Push effective address to stack
	LDA $FF00FF		  ; AF FF 00 FF | Read graphics status
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $2C19,Y		  ; 19 19 2C | Logical OR with accumulator (absolute,Y)
	AND $F7F6			; 2D F6 F7 | Logical AND with accumulator (absolute)
	CPY $DDFF			; CC FF DD | Compare Y register (absolute)
	SBC $FFB3,X		  ; FD B3 FF | Subtract with carry (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0D2
; Address: $E8AB33
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0D2:
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	CMP $29FF,X		  ; DD FF 29 | Compare accumulator (absolute,X)
	STA				  ; 9F DA F1 59 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	SBC ($7C),Y		  ; F1 7C | Subtract with carry ((zero page),Y)
	SBC $00D7,X		  ; FD D7 00 | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0D3
; Address: $E8AB72
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0D3:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	CPY #$75			 ; C0 75 | Compare Y register (immediate)
	JMP $5904			; 4C 04 59 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	INC $02			  ; E6 02 | Increment (zero page)
	INX				  ; E8 | Increment X register
	SBC $FE00			; ED 00 FE | Subtract with carry (absolute)
	REP #$FC			 ; C2 FC | Reset processor status bits
	STA $1F00,X		  ; 9D 00 1F | Update graphics data
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	AND $FF00,X		  ; 3D 00 FF | Logical AND with accumulator (absolute,X)
	STA				  ; 9F 00 1F 00 | Update graphics data
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	LSR $7761,X		  ; 5E 61 77 | Logical shift right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF 00 FF 00 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	TSX				  ; BA | Transfer stack pointer to X register
	STA $3D			  ; 85 3D | Update graphics data
	ASL $3E7E,X		  ; 1E 7E 3E | Arithmetic shift left (absolute,X)
	CPX #$20			 ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0D4
; Address: $E8ABEA
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0D4:
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BNE $C0			  ; D0 C0 | Branch if not equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BCS $A0			  ; B0 A0 | Branch if carry set
	BCS $A0			  ; B0 A0 | Branch if carry set
	BCS $A0			  ; B0 A0 | Branch if carry set
	BCC $80			  ; 90 80 | Branch if carry clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	STX $163F			; 8E 3F 16 | Store X register to absolute address
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	STZ $691E,X		  ; 9E 1E 69 | Store zero to absolute,X
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $7F01,X		  ; 7E 01 7F | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0D5
; Address: $E8AC41
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0D5:
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	STA ($78,X)		  ; 81 78 | Update graphics data
	ROL $B5A1,X		  ; 3E A1 B5 | Rotate left (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $6F			  ; 90 6F | Branch if carry clear
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ASL $3F1F,X		  ; 1E 1F 3F | Arithmetic shift left (absolute,X)
	ORA $3800,X		  ; 1D 00 38 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0D6
; Address: $E8AC7A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0D6:
	JSR $6000			; 20 00 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$60			 ; E0 60 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0D7
; Address: $E8AC8E
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0D7:
	BCS $20			  ; B0 20 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	BNE $00			  ; D0 00 | Branch if not equal
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $6BEF,X		  ; FD EF 6B | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SBC $FBFD,Y		  ; F9 FD FB | Subtract with carry (absolute,Y)
	SBC $FEFF,Y		  ; F9 FF FE | Subtract with carry (absolute,Y)
	CMP #$C9			 ; C9 C9 | Compare accumulator (immediate)
	ROL $36			  ; 26 36 | Rotate left (zero page)
	AND #$18			 ; 29 18 | Logical AND with accumulator (immediate)
	DEC $31			  ; C6 31 | Decrement (zero page)
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	SEP #$11			 ; E2 11 | Set processor status bits
	ADC ($D5),Y		  ; 71 D5 | Add with carry ((zero page),Y)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BNE $D0			  ; D0 D0 | Branch if not equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $10			  ; 80 10 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	INC $CC42			; EE 42 CC | Increment (absolute)
	CMP $CF00			; CD 00 CF | Compare accumulator (absolute)
	LDA $CF00			; AD 00 CF | Read graphics status
	ORA $1500,Y		  ; 19 00 15 | Logical OR with accumulator (absolute,Y)
	ORA $1500,Y		  ; 19 00 15 | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	XBA				  ; EB | Exchange accumulator bytes
	BEQ $65			  ; F0 65 | Branch if equal
	ADC $EF			  ; 65 EF | Add with carry (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0D8
; Address: $E8AD6F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0D8:
	BPL $FF			  ; 10 FF | Branch if positive
	TXS				  ; 9A | Transfer X register to stack pointer
	BPL $00			  ; 10 00 | Branch if positive
	LDA				  ; BF 00 FF 00 | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0D9
; Address: $E8AD82
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0D9:
	ORA #$FA			 ; 09 FA | Logical OR with accumulator (immediate)
	LDA ($33),Y		  ; B1 33 | Read graphics status
	BEQ $E3			  ; F0 E3 | Branch if equal
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $3F			  ; 80 3F | Branch always
	BRA $FC			  ; 80 FC | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	STA ($61,X)		  ; 81 61 | Update graphics data
	ORA $3F9C,X		  ; 1D 9C 3F | Logical OR with accumulator (absolute,X)
	DEC $9FFF,X		  ; DE FF 9F | Decrement (absolute,X)
	INC $E300,X		  ; FE 00 E3 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	STA				  ; 9F D8 DE 60 | Update graphics data
	DEC $3000,X		  ; DE 00 30 | Decrement (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0DA
; Address: $E8ADFC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0DA:
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	AND $E139,X		  ; 3D 39 E1 | Logical AND with accumulator (absolute,X)
	ADC ($01,X)		  ; 61 01 | Add with carry ((zero page,X))
	ASL $2320,X		  ; 1E 20 23 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ORA $FF4C			; 0D 4C FF | Logical OR with accumulator (absolute)
	DEC $00			  ; C6 00 | Decrement (zero page)
	STZ $FF00,X		  ; 9E 00 FF | Store zero to absolute,X
	STY $00			  ; 84 00 | Store Y register to zero page
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STA $2F5711		  ; 8F 11 57 2F | Update graphics data
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0DB
; Address: $E8AE3C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0DB:
	INX				  ; E8 | Increment X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	JMP $7B0C			; 4C 0C 7B | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTI				  ; 40 | Return from interrupt
	AND $0C00,X		  ; 3D 00 0C | Logical AND with accumulator (absolute,X)
	ORA $0700			; 0D 00 07 | Logical OR with accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	BRA $A8			  ; 80 A8 | Branch always
	BCS $58			  ; B0 58 | Branch if carry set
	BVS $B8			  ; 70 B8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0DC
; Address: $E8AE69
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0DC:
	JSR $00F0			; 20 F0 00 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	LDX $DD			  ; A6 DD | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0DD
; Address: $E8AE87
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0DD:
	JSL $2D8064		  ; 22 64 80 2D | Jump to subroutine long
	STA $28BF10		  ; 8F 10 BF 28 | Update graphics data
	CMP $FF00,X		  ; DD 00 FF | Compare accumulator (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	BPL $55			  ; 10 55 | Branch if positive
	PHB				  ; 8B | Push data bank register to stack
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0DE
; Address: $E8AEC1
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0DE:
	JSR $FD02			; 20 02 FD | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ADC #$9F			 ; 69 9F | Add with carry (immediate)
	ASL $06FE			; 0E FE 06 | Arithmetic shift left (absolute)
	INC $16			  ; E6 16 | Increment (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	INC $3A01,X		  ; FE 01 3A | Increment (absolute,X)
	CPY $02			  ; C4 02 | Compare Y register (zero page)
	SED				  ; F8 | Set decimal mode flag
	ROR $7EFE,X		  ; 7E FE 7E | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0DF
; Address: $E8AEEB
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0DF:
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	SBC $8100,X		  ; FD 00 81 | Subtract with carry (absolute,X)
	STA ($00,X)		  ; 81 00 | Update graphics data
	LDA				  ; BF 00 FF 00 | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $539A			; ED 9A 53 | Subtract with carry (absolute)
	INC $3FF8			; EE F8 3F | Increment (absolute)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $FF			  ; F0 FF | Branch if equal
	WDM #$DF			 ; 42 DF | Reserved instruction
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0E1
; Address: $E8AF44
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0E1:
	JSR $E000			; 20 00 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BEQ $F4			  ; F0 F4 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0E2
; Address: $E8AF56
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0E2:
	JSR $3000			; 20 00 30 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BCC $15			  ; 90 15 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	AND $BD28,X		  ; 3D 28 BD | Logical AND with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	LDA $BD3A,X		  ; BD 3A BD | Read graphics status
	TSX				  ; BA | Transfer stack pointer to X register
	AND $BB3B,X		  ; 3D 3B BB | Logical AND with accumulator (absolute,X)
	SBC $C500			; ED 00 C5 | Subtract with carry (absolute)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CPY $8000			; CC 00 80 | Compare Y register (absolute)
	DEC $CE80			; CE 80 CE | Decrement (absolute)
	DEC $CF00			; CE 00 CF | Decrement (absolute)
	INY				  ; C8 | Increment Y register
	SBC $4AF5,X		  ; FD F5 4A | Subtract with carry (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $A1			  ; 06 A1 | Arithmetic shift left (zero page)
	BPL $0E			  ; 10 0E | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0E3
; Address: $E8AFA5
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0E3:
	SED				  ; F8 | Set decimal mode flag
	ORA ($F6,X)		  ; 01 F6 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F CF 40 3E | Update graphics data
	BRA $61			  ; 80 61 | Branch always
	STZ $00F9,X		  ; 9E F9 00 | Store zero to absolute,X
	LDA				  ; BF 00 FF 00 | Read graphics status
	ORA $3FF0			; 0D F0 3F | Logical OR with accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROR $4481,X		  ; 7E 81 44 | Rotate right (absolute,X)
	CMP $32			  ; C5 32 | Compare accumulator (zero page)
	BIT #$3A			 ; 89 3A | Test bits in accumulator (immediate)
	STA ($06,X)		  ; 81 06 | Update graphics data
	SBC $00FF,Y		  ; F9 FF 00 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	STA $FFFEFF		  ; 8F FF FE FF | Update graphics data
	DEC $B5DE,X		  ; DE DE B5 | Decrement (absolute,X)
	SBC $C2FD,X		  ; FD FD C2 | Subtract with carry (absolute,X)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	BMI $CE			  ; 30 CE | Branch if negative
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	INC $3800,X		  ; FE 00 38 | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	JMP ($2083)		  ; 6C 83 20 | Jump to address (absolute indirect)
	CMP $5120,X		  ; DD 20 51 | Compare accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0E4
; Address: $E8B049
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0E4:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SBC $7100,X		  ; FD 00 71 | Subtract with carry (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0E5
; Address: $E8B058
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0E5:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	AND $39BC,X		  ; 3D BC 39 | Logical AND with accumulator (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	LDA $B738,Y		  ; B9 38 B7 | Read graphics status
	BCS $0C			  ; B0 0C | Branch if carry set
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDY #$5E			 ; A0 5E | Load immediate value into Y register
	LDX $5CBE			; AE BE 5C | Load from absolute address into X register
	ASL $00F8,X		  ; 1E F8 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0E6
; Address: $E8B0A0
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0E6:
	CLC				  ; 18 | Clear carry flag
	STA $3DB8,X		  ; 9D B8 3D | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	LDA $AD28			; AD 28 AD | Read graphics status
	BPL $97			  ; 10 97 | Branch if positive
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $8055			; 0D 55 80 | Logical OR with accumulator (absolute)
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	LDY $00			  ; A4 00 | Load from zero page into Y register
	CPY $CE01			; CC 01 CE | Compare Y register (absolute)
	DEX				  ; CA | Decrement X register
	BRA $FF			  ; 80 FF | Branch always
	ADC #$7F			 ; 69 7F | Add with carry (immediate)
	INC $C8BE,X		  ; FE BE C8 | Increment (absolute,X)
	LSR $7F00			; 4E 00 7F | Logical shift right (absolute)
	BRA $00			  ; 80 00 | Branch always
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	LDA $CA1C,X		  ; BD 1C CA | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0E7
; Address: $E8B0E6
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0E7:
	ROL $E442,X		  ; 3E 42 E4 | Rotate left (absolute,X)
	STA $E9C0,Y		  ; 99 C0 E9 | Update graphics data
	LDA ($00,X)		  ; A1 00 | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ROL $00			  ; 26 00 | Rotate left (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	NOP				  ; EA | No operation
	INC $4678			; EE 78 46 | Increment (absolute)
	SBC $99			  ; E5 99 | Subtract with carry (zero page)
	STX $FDFE			; 8E FE FD | Store X register to absolute address
	JMP ($00C7)		  ; 6C C7 00 | Jump to address (absolute indirect)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	STZ $00			  ; 64 00 | Store zero to zero page
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	INC $AFFF,X		  ; FE FF AF | Increment (absolute,X)
	LDA ($5F,X)		  ; A1 5F | Read graphics status
	LDA $1F5FBF		  ; AF BF 5F 1F | Read graphics status
	STA $FF03EF		  ; 8F EF 03 FF | Update graphics data
	CMP ($FD,X)		  ; C1 FD | Compare accumulator ((zero page,X))
	INC $F7FF,X		  ; FE FF F7 | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0E8
; Address: $E8B165
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0E8:
	XBA				  ; EB | Exchange accumulator bytes
	SED				  ; F8 | Set decimal mode flag
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	BRA $00			  ; 80 00 | Branch always
	CPY $00FF			; CC FF 00 | Compare Y register (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal
	BCS $FF			  ; B0 FF | Branch if carry set
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	DEC $D7F8			; CE F8 D7 | Decrement (absolute)
	SBC $7B7E,Y		  ; F9 7E 7B | Subtract with carry (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	INY				  ; C8 | Increment Y register
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $08			  ; F0 08 | Branch if equal
	BNE $2C			  ; D0 2C | Branch if not equal
	ORA $FD			  ; 05 FD | Logical OR with accumulator (zero page)
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	LDX #$15			 ; A2 15 | Load immediate value into X register
	SEP #$FB			 ; E2 FB | Set processor status bits
	DEC				  ; 3A | Decrement accumulator
	INC $59			  ; E6 59 | Increment (zero page)
	LDX $6F			  ; A6 6F | Load from zero page into X register
	BCC $04			  ; 90 04 | Branch if carry clear
	CMP $FF00,X		  ; DD 00 FF | Compare accumulator (absolute,X)
	CMP $FF00,X		  ; DD 00 FF | Compare accumulator (absolute,X)
	STY $FB			  ; 84 FB | Store Y register to zero page
	BPL $6B			  ; 10 6B | Branch if positive
	XBA				  ; EB | Exchange accumulator bytes
	BRA $5A			  ; 80 5A | Branch always
	INC				  ; 1A | Increment accumulator
	RTI				  ; 40 | Return from interrupt
	LDX $9A41,Y		  ; BE 41 9A | Load from absolute,Y into X register
	ADC $7F			  ; 65 7F | Add with carry (zero page)
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	SED				  ; F8 | Set decimal mode flag
	ORA ($77,X)		  ; 01 77 | Logical OR with accumulator ((zero page,X))
	BPL $41			  ; 10 41 | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0E9
; Address: $E8B226
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0E9:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $3D2B,X		  ; 3D 2B 3D | Logical AND with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0EA
; Address: $E8B22D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0EA:
	AND $3D2B,X		  ; 3D 2B 3D | Logical AND with accumulator (absolute,X)
	INC $6F00,X		  ; FE 00 6F | Increment (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0EB
; Address: $E8B236
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0EB:
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $E9B0			; 0E B0 E9 | Arithmetic shift left (absolute)
	ASL $29			  ; 06 29 | Arithmetic shift left (zero page)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	INX				  ; E8 | Increment X register
	CMP $D956,X		  ; DD 56 D9 | Compare accumulator (absolute,X)
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	DEX				  ; CA | Decrement X register
	ROR $347F,X		  ; 7E 7F 34 | Rotate right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEX				  ; CA | Decrement X register
	EOR ($AF),Y		  ; 51 AF | Exclusive OR with accumulator ((zero page),Y)
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	LDA $DFFF4F		  ; AF 4F FF DF | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	STA $FFFEFF		  ; 8F FF FE FF | Update graphics data
	DEC $B5DE,X		  ; DE DE B5 | Decrement (absolute,X)
	SBC $C2FD,X		  ; FD FD C2 | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $3563,X		  ; 3D 63 35 | Logical AND with accumulator (absolute,X)
	ADC $793F			; 6D 3F 79 | Add with carry (absolute)
	STZ $36			  ; 64 36 | Store zero to zero page
	STZ $36			  ; 64 36 | Store zero to zero page
	STZ $36			  ; 64 36 | Store zero to zero page
	ROR $36			  ; 66 36 | Rotate right (zero page)
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0EC
; Address: $E8B300
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0EC:
	CMP ($52),Y		  ; D1 52 | Compare accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	ADC $69D2,Y		  ; 79 D2 69 | Add with carry (absolute,Y)
	REP #$78			 ; C2 78 | Reset processor status bits
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	AND ($8A,X)		  ; 21 8A | Logical AND with accumulator ((zero page,X))
	LDA $FF5FFF		  ; AF FF 5F FF | Read graphics status
	STA ($7F,X)		  ; 81 7F | Update graphics data
	LDA $1F5FBF		  ; AF BF 5F 1F | Read graphics status
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	STA $85			  ; 85 85 | Update graphics data
	INC $F7FF,X		  ; FE FF F7 | Increment (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	BCS $00			  ; B0 00 | Branch if carry set
	LDA #$A9			 ; A9 A9 | Read graphics status
	STA ($FF,X)		  ; 81 FF | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	PLP				  ; 28 | Pull processor status from stack
	BRA $00			  ; 80 00 | Branch always
	BCS $FF			  ; B0 FF | Branch if carry set
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	NOP				  ; EA | No operation
	SBC $FC3A			; ED 3A FC | Subtract with carry (absolute)
	INC $E7			  ; E6 E7 | Increment (zero page)
	ASL $57E9			; 0E E9 57 | Arithmetic shift left (absolute)
	CPX #$8F			 ; E0 8F | Compare X register (immediate)
	BEQ $D8			  ; F0 D8 | Branch if equal
	CPX #$1B			 ; E0 1B | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	CPX $66			  ; E4 66 | Compare X register (zero page)
	AND $3E78,Y		  ; 39 78 3E | Logical AND with accumulator (absolute,Y)
	ROR $9FE0,X		  ; 7E E0 9F | Rotate right (absolute,X)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	LDA #$00			 ; A9 00 | Read graphics status
	STA $8700,Y		  ; 99 00 87 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	LDA				  ; BF 00 BF 00 | Read graphics status
	SBC ($CA,X)		  ; E1 CA | Subtract with carry ((zero page,X))
	LDA $88			  ; A5 88 | Read graphics status
	LDA ($8C,X)		  ; A1 8C | Read graphics status

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0ED
; Address: $E8B3E6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0ED:
	AND $4700,Y		  ; 39 00 47 | Logical AND with accumulator (absolute,Y)
	LSR $B9			  ; 46 B9 | Logical shift right (zero page)
	INC $0203,X		  ; FE 03 02 | Increment (absolute,X)
	LDA $3F00,X		  ; BD 00 3F | Read graphics status
	LDA $0100,Y		  ; B9 00 01 | Read graphics status
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	CMP ($D7),Y		  ; D1 D7 | Compare accumulator ((zero page),Y)
	SBC ($89,X)		  ; E1 89 | Subtract with carry ((zero page,X))
	PEA #$FCD7		   ; F4 D7 FC | Push effective address to stack
	BEQ $9E			  ; F0 9E | Branch if equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0EE
; Address: $E8B40B
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0EE:
	JSR $01FF			; 20 FF 01 | Jump to subroutine
	BIT $02			  ; 24 02 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ASL $0300,X		  ; 1E 00 03 | Arithmetic shift left (absolute,X)
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	ROR $A65B,X		  ; 7E 5B A6 | Rotate right (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	LDX $DB80,Y		  ; BE 80 DB | Load from absolute,Y into X register
	CMP ($7E,X)		  ; C1 7E | Compare accumulator ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $00E300		  ; 8F 00 E3 00 | Update graphics data
	ROL $F100,X		  ; 3E 00 F1 | Rotate left (absolute,X)
	BCC $FC			  ; 90 FC | Branch if carry clear
	TAX				  ; AA | Transfer accumulator to X register
	CPX $5F			  ; E4 5F | Compare X register (zero page)
	LDY #$1F			 ; A0 1F | Load immediate value into Y register
	ORA $E0C0,X		  ; 1D C0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	ROR				  ; 6A | Rotate right (accumulator)
	INC $FE38			; EE 38 FE | Increment (absolute)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	DEC $E030			; CE 30 E0 | Game work RAM access
	BPL $E3			  ; 10 E3 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPX $07			  ; E4 07 | Compare X register (zero page)
	CMP $87			  ; C5 87 | Compare accumulator (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	INC $2618			; EE 18 26 | Increment (absolute)
	ASL $9A61,X		  ; 1E 61 9A | Arithmetic shift left (absolute,X)
	INC $75			  ; E6 75 | Increment (zero page)
	CMP $0038			; CD 38 00 | Compare accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0EF
; Address: $E8B498
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0EF:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	STY $1100			; 8C 00 11 | Store Y register to absolute address
	LDX $B6FE,Y		  ; BE FE B6 | Load from absolute,Y into X register
	INC $7373,X		  ; FE 73 73 | Increment (absolute,X)
	DEX				  ; CA | Decrement X register
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	STA $EAFF			; 8D FF EA | Update graphics data
	ROL $0CFF			; 2E FF 0C | Rotate left (absolute)
	STA $3E3F8F		  ; 8F 8F 3F 3E | Update graphics data
	PEA #$D8DF		   ; F4 DF D8 | Push effective address to stack
	BEQ $DB			  ; F0 DB | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $70			  ; F0 70 | Branch if equal
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	PLB				  ; AB | Pull data bank register from stack
	LDA ($5F,X)		  ; A1 5F | Read graphics status
	LDA $1F5FBF		  ; AF BF 5F 1F | Read graphics status
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP $DF33			; CD 33 DF | Compare accumulator (absolute)
	INC $F7FF,X		  ; FE FF F7 | Increment (absolute,X)
	CPY $0000			; CC 00 00 | Compare Y register (absolute)
	BCS $00			  ; B0 00 | Branch if carry set
	CMP $F0			  ; C5 F0 | Compare accumulator (zero page)
	LDA $B9			  ; A5 B9 | Read graphics status
	TSX				  ; BA | Transfer stack pointer to X register
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA ($C3),Y		  ; B1 C3 | Read graphics status
	SBC ($83,X)		  ; E1 83 | Subtract with carry ((zero page,X))
	ASL $0F1F,X		  ; 1E 1F 0F | Arithmetic shift left (absolute,X)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	STX $1E10			; 8E 10 1E | Store X register to absolute address
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $D6AA,X		  ; 9D AA D6 | Update graphics data
	SBC $00F0			; ED F0 00 | Subtract with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0F0
; Address: $E8B55C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0F0:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	ROL $FE4F,X		  ; 3E 4F FE | Rotate left (absolute,X)
	LDA $BF70,X		  ; BD 70 BF | Read graphics status
	ROR $7EBD,X		  ; 7E BD 7E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0F1
; Address: $E8B571
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0F1:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PEA #$F89C		   ; F4 9C F8 | Push effective address to stack
	PEA #$F27C		   ; F4 7C F2 | Push effective address to stack
	ROR $0EBD,X		  ; 7E BD 0E | Rotate right (absolute,X)
	SBC $BD7E,X		  ; FD 7E BD | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $E301,X		  ; FE 01 E3 | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STZ $4F73			; 9C 73 4F | Store zero to absolute
	BPL $FF			  ; 10 FF | Branch if positive
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($91),Y		  ; 11 91 | Logical OR with accumulator ((zero page),Y)
	CMP $5FFF,X		  ; DD FF 5F | Compare accumulator (absolute,X)
	CMP $DD7F,X		  ; DD 7F DD | Compare accumulator (absolute,X)
	LDA				  ; BF 4C FF EE | Read graphics status
	ROR $9CFF			; 6E FF 9C | Rotate right (absolute)
	DEC $56FF			; CE FF 56 | Decrement (absolute)
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	ORA $00FF,X		  ; 1D FF 00 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	AND ($40,X)		  ; 21 40 | Logical AND with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $44			  ; 80 44 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROR $FF7E,X		  ; 7E 7E FF | Rotate right (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	STY $02			  ; 84 02 | Store Y register to zero page
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	BEQ $F0			  ; F0 F0 | Branch if equal
	ROR $FF7E,X		  ; 7E 7E FF | Rotate right (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BCS $D0			  ; B0 D0 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0F3
; Address: $E8B62A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0F3:
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0F5
; Address: $E8B645
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0F5:
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	BCC $40			  ; 90 40 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0F8
; Address: $E8B65E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0F8:
	BCC $00			  ; 90 00 | Branch if carry clear
	INC				  ; 1A | Increment accumulator
	ROL $FE4F,X		  ; 3E 4F FE | Rotate left (absolute,X)
	LDA $BF70,X		  ; BD 70 BF | Read graphics status
	ROR $7EBD,X		  ; 7E BD 7E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0F9
; Address: $E8B67F
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0F9:
	JSR $98F0			; 20 F0 98 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	PEA #$F27C		   ; F4 7C F2 | Push effective address to stack
	ROR $0EBD,X		  ; 7E BD 0E | Rotate right (absolute,X)
	SBC $BD7E,X		  ; FD 7E BD | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	PEA #$00F8		   ; F4 F8 00 | Push effective address to stack
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $63			  ; 80 63 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	ROR $0F80,X		  ; 7E 80 0F | Rotate right (absolute,X)
	CPY #$1B			 ; C0 1B | Compare Y register (immediate)
	BRA $5D			  ; 80 5D | Branch always
	LDY #$6D			 ; A0 6D | Load immediate value into Y register
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	STA $058A01		  ; 8F 01 8A 05 | Update graphics data
	ORA $0F71			; 0D 71 0F | Logical OR with accumulator (absolute)
	REP #$01			 ; C2 01 | Reset processor status bits
	ORA $B2			  ; 05 B2 | Logical OR with accumulator (zero page)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0FA
; Address: $E8B704
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0FA:
	JSR $1020			; 20 20 10 | Jump to subroutine
	BVS $40			  ; 70 40 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_0FD
; Address: $E8B710
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_0FD:
	JSR $5000			; 20 00 50 | Jump to subroutine
	BNE $00			  ; D0 00 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $00			  ; B0 00 | Branch if carry set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	AND $534F			; 2D 4F 53 | Logical AND with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	LSR $7A70,X		  ; 5E 70 7A | Logical shift right (absolute,X)
	BPL $ED			  ; 10 ED | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	PEA #$F8AA		   ; F4 AA F8 | Push effective address to stack
	BEQ $F8			  ; F0 F8 | Branch if equal
	BVS $F4			  ; 70 F4 | Branch if overflow set
	JMP $8CF82C		  ; 5C 2C F8 8C | Jump to address long
	INY				  ; C8 | Increment Y register
	CLV				  ; B8 | Clear overflow flag
	PLX				  ; FA | Pull X register from stack
	ORA $56			  ; 05 56 | Logical OR with accumulator (zero page)
	LDA #$FE			 ; A9 FE | Read graphics status
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA ($82,X)		  ; 01 82 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	STA ($0E),Y		  ; 91 0E | Update graphics data
	STY $F202			; 8C 02 F2 | Store Y register to absolute address
	STY $9CE2			; 8C E2 9C | Store Y register to absolute address
	LDX $BF99,Y		  ; BE 99 BF | Load from absolute,Y into X register
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	DEX				  ; CA | Decrement X register
	ADC $41B6,Y		  ; 79 B6 41 | Add with carry (absolute,Y)
	LDA $7DB371		  ; AF 71 B3 7D | Read graphics status
	EOR $7DF3,X		  ; 5D F3 7D | Exclusive OR with accumulator (absolute,X)
	LDA				  ; BF F9 FF FF | Read graphics status
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_101
; Address: $E8B7DE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_101:
	JSR $3A00			; 20 00 3A | Jump to subroutine
	LSR $2F30,X		  ; 5E 30 2F | Logical shift right (absolute,X)
	BMI $37			  ; 30 37 | Branch if negative
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($20,X)		  ; C1 20 | Compare accumulator ((zero page,X))
	BVC $1F			  ; 50 1F | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_102
; Address: $E8B7F9
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_102:
	CLC				  ; 18 | Clear carry flag
	BVC $08			  ; 50 08 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	BNE $A6			  ; D0 A6 | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $D8			  ; F0 D8 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	ASL $0A01			; 0E 01 0A | Arithmetic shift left (absolute)
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($F4,X)		  ; 01 F4 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA $0900			; 0D 00 09 | Logical OR with accumulator (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	ASL $7131			; 0E 31 71 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $3131			; 0E 31 31 | Arithmetic shift left (absolute)
	LSR $93EC			; 4E EC 93 | Logical shift right (absolute)
	ROR $78			  ; 66 78 | Rotate right (zero page)
	BMI $3F			  ; 30 3F | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_103
; Address: $E8B882
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_103:
	INC $1E			  ; E6 1E | Increment (zero page)
	ASL $FCFE			; 0E FE FC | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FCFC,X		  ; FE FC FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_106
; Address: $E8B8C7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_106:
	RTI				  ; 40 | Return from interrupt
	BCS $80			  ; B0 80 | Branch if carry set
	BNE $40			  ; D0 40 | Branch if not equal
	BVC $80			  ; 50 80 | Branch if overflow clear
	BNE $80			  ; D0 80 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_107
; Address: $E8B8D6
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_107:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	AND $333B			; 2D 3B 33 | Logical AND with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BVS $D0			  ; 70 D0 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	CLD				  ; D8 | Clear decimal mode flag
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CPY $E4			  ; C4 E4 | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	CPX #$D4			 ; E0 D4 | Compare X register (immediate)
	PEA #$020C		   ; F4 0C 02 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_108
; Address: $E8B91E
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_108:
	PHP				  ; 08 | Push processor status to stack
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ASL $0E01			; 0E 01 0E | Arithmetic shift left (absolute)
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	BPL $1B			  ; 10 1B | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	ASL $0F1F,X		  ; 1E 1F 0F | Arithmetic shift left (absolute,X)
	ROL $66			  ; 26 66 | Rotate left (zero page)
	AND $3F8D			; 2D 8D 3F | Logical AND with accumulator (absolute)
	ADC $3E			  ; 65 3E | Add with carry (zero page)
	STA ($7B,X)		  ; 81 7B | Update graphics data
	TSX				  ; BA | Transfer stack pointer to X register
	ASL $16C3,X		  ; 1E C3 16 | Arithmetic shift left (absolute,X)
	ROL $59			  ; 26 59 | Rotate left (zero page)
	ORA $02F2			; 0D F2 02 | Logical OR with accumulator (absolute)
	SBC $433C,X		  ; FD 3C 43 | Subtract with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	BPL $EF			  ; 10 EF | Branch if positive
	INC $AA2A			; EE 2A AA | Increment (absolute)
	EOR ($51),Y		  ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	TAX				  ; AA | Transfer accumulator to X register
	DEY				  ; 88 | Decrement Y register
	TAX				  ; AA | Transfer accumulator to X register
	LDX $39FF			; AE FF 39 | Load from absolute address into X register
	AND $3E2A,X		  ; 3D 2A 3E | Logical AND with accumulator (absolute,X)
	AND $293D,Y		  ; 39 3D 29 | Logical AND with accumulator (absolute,Y)
	AND $5414			; 2D 14 54 | Logical AND with accumulator (absolute)
	EOR $65			  ; 45 65 | Exclusive OR with accumulator (zero page)
	BIT $74			  ; 24 74 | Test bits in accumulator (zero page)
	WDM #$00			 ; 42 00 | Reserved instruction
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	WDM #$00			 ; 42 00 | Reserved instruction
	BRA $EB			  ; 80 EB | Branch always
	PLX				  ; FA | Pull X register from stack
	STY $A4			  ; 84 A4 | Store Y register to zero page
	CPY $E4			  ; C4 E4 | Compare Y register (zero page)
	STZ $A0			  ; 64 A0 | Store zero to zero page
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	ROL $04			  ; 26 04 | Rotate left (zero page)
	ASL $1C08			; 0E 08 1C | Arithmetic shift left (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_109
; Address: $E8B9B4
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_109:
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP $4813			; 4C 13 48 | Jump to address
	DEC $19			  ; C6 19 | Decrement (zero page)
	INC $FE11			; EE 11 FE | Increment (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ASL $000F			; 0E 0F 00 | Arithmetic shift left (absolute)
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $13			  ; 10 13 | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	ASL $0F1F,X		  ; 1E 1F 0F | Arithmetic shift left (absolute,X)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ASL $0F11			; 0E 11 0F | Arithmetic shift left (absolute)
	ORA $0003,X		  ; 1D 03 00 | Logical OR with accumulator (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BCC $70			  ; 90 70 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	BNE $20			  ; D0 20 | Branch if not equal
	BCC $90			  ; 90 90 | Branch if carry clear
	BCC $90			  ; 90 90 | Branch if carry clear
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive
	INC $AFFF,X		  ; FE FF AF | Increment (absolute,X)
	INC $5EA1,X		  ; FE A1 5E | Increment (absolute,X)
	LDX $5EBF			; AE BF 5E | Load from absolute address into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_10A
; Address: $E8BA38
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_10A:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVC $60			  ; 50 60 | Branch if overflow clear
	BVS $70			  ; 70 70 | Branch if overflow set
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $00			  ; F0 00 | Branch if equal
	ADC $3701,Y		  ; 79 01 37 | Add with carry (absolute,Y)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $0102			; 0D 02 01 | Logical OR with accumulator (absolute)
	ROR $3A00,X		  ; 7E 00 3A | Rotate right (absolute,X)
	ORA ($55),Y		  ; 11 55 | Logical OR with accumulator ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	CMP $5511,X		  ; DD 11 55 | Compare accumulator (absolute,X)
	BVC $54			  ; 50 54 | Branch if overflow clear
	EOR $55			  ; 45 55 | Exclusive OR with accumulator (zero page)
	STZ $75			  ; 64 75 | Store zero to zero page
	RTI				  ; 40 | Return from interrupt
	BPL $11			  ; 10 11 | Branch if positive
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_10B
; Address: $E8BA92
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_10B:
	JSL $FFAAFF		  ; 22 FF AA FF | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	TXA				  ; 8A | Transfer X register to accumulator
	TAX				  ; AA | Transfer accumulator to X register
	INC $4FFF			; EE FF 4F | Increment (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF 00 9F 00 | Read graphics status
	BRA $73			  ; 80 73 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BEQ $D8			  ; F0 D8 | Branch if equal
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_10C
; Address: $E8BAC8
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_10C:
	BVC $50			  ; 50 50 | Branch if overflow clear
	BPL $10			  ; 10 10 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($EE,X)		  ; 01 EE | Logical OR with accumulator ((zero page,X))
	ORA ($AE,X)		  ; 01 AE | Logical OR with accumulator ((zero page,X))
	ORA ($EC,X)		  ; 01 EC | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	BPL $E8			  ; 10 E8 | Branch if positive
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ROL $9021,X		  ; 3E 21 90 | Rotate left (absolute,X)
	EOR $75E6,Y		  ; 59 E6 75 | Exclusive OR with accumulator (absolute,Y)
	NOP				  ; EA | No operation
	STA				  ; 9F 60 00 00 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_10D
; Address: $E8BB20
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_10D:
	BRA $E0			  ; 80 E0 | Game work RAM access
	BRA $A0			  ; 80 A0 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	PLY				  ; 7A | Pull Y register from stack
	CPY $CCFA			; CC FA CC | Compare Y register (absolute)
	PLX				  ; FA | Pull X register from stack
	BMI $CA			  ; 30 CA | Branch if negative
	BPL $F0			  ; 10 F0 | Branch if positive
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	STY $FE			  ; 84 FE | Store Y register to zero page
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	STZ $001F			; 9C 1F 00 | Store zero to absolute
	STA $E0FD80		  ; 8F 80 FD E0 | Game work RAM access
	AND $F9E0,Y		  ; 39 E0 F9 | Logical AND with accumulator (absolute,Y)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	ORA $1900,X		  ; 1D 00 19 | Logical OR with accumulator (absolute,X)
	ORA $F800,Y		  ; 19 00 F8 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_10E
; Address: $E8BB61
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_10E:
	PHP				  ; 08 | Push processor status to stack
	TAX				  ; AA | Transfer accumulator to X register
	BNE $5F			  ; D0 5F | Branch if not equal
	STZ $AD			  ; 64 AD | Store zero to zero page
	BCS $66			  ; B0 66 | Branch if carry set
	ADC $6D			  ; 65 6D | Add with carry (zero page)
	ADC $C0C0			; 6D C0 C0 | Add with carry (absolute)
	LDA $00F490		  ; AF 90 F4 00 | Read graphics status
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	LDA $65E570		  ; AF 70 E5 65 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $7F			  ; 10 7F | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_10F
; Address: $E8BB94
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_10F:
	JSR $8000			; 20 00 80 | Jump to subroutine
	TXS				  ; 9A | Transfer X register to stack pointer
	BCC $00			  ; 90 00 | Branch if carry clear
	LDA				  ; BF 00 FF 00 | Read graphics status
	CPY $C6			  ; C4 C6 | Compare Y register (zero page)
	CLV				  ; B8 | Clear overflow flag
	DEC				  ; 3A | Decrement accumulator
	CLD				  ; D8 | Clear decimal mode flag
	INC				  ; 1A | Increment accumulator
	BPL $14			  ; 10 14 | Branch if positive
	INY				  ; C8 | Increment Y register
	CLI				  ; 58 | Clear interrupt disable flag
	BNE $C4			  ; D0 C4 | Branch if not equal
	BPL $14			  ; 10 14 | Branch if positive
	CPY $3A			  ; C4 3A | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	DEC $18			  ; C6 18 | Decrement (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	CPX $BC40			; EC 40 BC | Compare X register (absolute)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	BPL $EC			  ; 10 EC | Branch if positive
	ORA ($55),Y		  ; 11 55 | Logical OR with accumulator ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	CMP $5511,X		  ; DD 11 55 | Compare accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR $EF			  ; 45 EF | Exclusive OR with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_110
; Address: $E8BBD2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_110:
	JSL $FFAAFF		  ; 22 FF AA FF | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	INC $10FF,X		  ; FE FF 10 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_111
; Address: $E8BBE2
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_111:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVC $50			  ; 50 50 | Branch if overflow clear
	LDY $5EBC,X		  ; BC BC 5E | Load from absolute,X into Y register
	INC $FCAC,X		  ; FE AC FC | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)
	INC $AF00,X		  ; FE 00 AF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $60			  ; 70 60 | Branch if overflow set
	ROL $013C,X		  ; 3E 3C 01 | Rotate left (absolute,X)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BCS $00			  ; B0 00 | Branch if carry set
	STA				  ; 9F 00 03 00 | Update graphics data
	INC $F700,X		  ; FE 00 F7 | Increment (absolute,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	DEC				  ; 3A | Decrement accumulator
	ORA $3D			  ; 05 3D | Logical OR with accumulator (zero page)
	ASL $BEFE,X		  ; 1E FE BE | Arithmetic shift left (absolute,X)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BVC $7F			  ; 50 7F | Branch if overflow clear
	BVC $70			  ; 50 70 | Branch if overflow clear
	STA				  ; 9F 0F D0 40 | Update graphics data
	EOR #$DB			 ; 49 DB | Exclusive OR with accumulator (immediate)
	JMP $8615			; 4C 15 86 | Jump to address
	PHB				  ; 8B | Push data bank register to stack
	BRA $00			  ; 80 00 | Branch always
	STA $00F000		  ; 8F 00 F0 00 | Update graphics data
	LDA				  ; BF 00 B0 00 | Read graphics status
	BCS $00			  ; B0 00 | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	PEA #$4000		   ; F4 00 40 | Push effective address to stack
	BRA $20			  ; 80 20 | Branch always
	BRA $78			  ; 80 78 | Branch always
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_112
; Address: $E8BC87
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_112:
	JSR $6040			; 20 40 60 | Jump to subroutine
	BRA $70			  ; 80 70 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_113
; Address: $E8BC8F
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_113:
	BRA $40			  ; 80 40 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	ADC $E07E,X		  ; 7D 7E E0 | Game work RAM access
	JMP $4F37			; 4C 37 4F | Jump to address
	SEI				  ; 78 | Set interrupt disable flag
	AND $FF39,Y		  ; 39 39 FF | Logical AND with accumulator (absolute,Y)
	CMP #$B1			 ; C9 B1 | Compare accumulator (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	DEC $FF			  ; C6 FF | Decrement (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BCC $5E			  ; 90 5E | Branch if carry clear
	ORA ($DF),Y		  ; 11 DF | Logical OR with accumulator ((zero page),Y)
	ORA $40D3,X		  ; 1D D3 40 | Logical OR with accumulator (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $C6			  ; 80 C6 | Branch always
	SBC $21FF,Y		  ; F9 FF 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_114
; Address: $E8BCD2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_114:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	CPX #$84			 ; E0 84 | Compare X register (immediate)
	STY $8F7B			; 8C 7B 8F | Store Y register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	BNE $20			  ; D0 20 | Branch if not equal
	BRA $83			  ; 80 83 | Branch always
	STY $038F			; 8C 8F 03 | Store Y register to absolute address
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BVS $FF			  ; 70 FF | Branch if overflow set
	INC $06			  ; E6 06 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_115
; Address: $E8BD02
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_115:
	JSR $2CCE			; 20 CE 2C | Jump to subroutine
	DEX				  ; CA | Decrement X register
	STX $186E			; 8E 6E 18 | Store X register to absolute address
	ASL $D0			  ; 06 D0 | Arithmetic shift left (zero page)
	DEC $9E82			; CE 82 9E | Decrement (absolute)
	SBC $19C3,X		  ; FD C3 19 | Subtract with carry (absolute,X)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_116
; Address: $E8BD26
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_116:
	STA ($01,X)		  ; 81 01 | Update graphics data
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	INC $F400,X		  ; FE 00 F4 | Increment (absolute,X)
	ROL $FF00,X		  ; 3E 00 FF | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	DEX				  ; CA | Decrement X register
	LDX $F8FE			; AE FE F8 | Load from absolute address into X register
	SED				  ; F8 | Set decimal mode flag
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $1F			  ; 10 1F | Branch if positive
	ORA $4F0D			; 0D 0D 4F | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_117
; Address: $E8BD74
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_117:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX $E81C			; EC 1C E8 | Compare X register (absolute)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)
	ROR $7B88,X		  ; 7E 88 7B | Rotate right (absolute,X)
	PEA #$F300		   ; F4 00 F3 | Push effective address to stack
	BRA $F0			  ; 80 F0 | Branch always
	BVC $50			  ; 50 50 | Branch if overflow clear
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BCC $C0			  ; 90 C0 | Branch if carry clear
	BMI $40			  ; 30 40 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA #$71			 ; 09 71 | Logical OR with accumulator (immediate)
	ADC ($09),Y		  ; 71 09 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_118
; Address: $E8BDC4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_118:
	JSR $3160			; 20 60 31 | Jump to subroutine
	ADC ($C7),Y		  ; 71 C7 | Add with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register
	STX $FF			  ; 86 FF | Store X register to zero page
	STX $FF			  ; 86 FF | Store X register to zero page
	STA				  ; 9F FF 8E FF | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_119
; Address: $E8BDDC
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_119:
	PHP				  ; 08 | Push processor status to stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	CPX $FF2C			; EC 2C FF | Compare X register (absolute)
	LDA				  ; BF 00 FF 08 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	SEP #$FB			 ; E2 FB | Set processor status bits
	EOR ($BB,X)		  ; 41 BB | Exclusive OR with accumulator ((zero page,X))
	EOR ($51),Y		  ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
	DEC $FE6E,X		  ; DE 6E FE | Decrement (absolute,X)
	ROR $4CFE			; 6E FE 4C | Rotate right (absolute)
	DEC $FF04,X		  ; DE 04 FF | Decrement (absolute,X)
	LDX $21FF			; AE FF 21 | PPU graphics register access
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	CMP $DDE3,X		  ; DD E3 DD | Compare accumulator (absolute,X)
	CMP #$FE			 ; C9 FE | Compare accumulator (immediate)
	INC $5E40,X		  ; FE 40 5E | Increment (absolute,X)
	BVS $6E			  ; 70 6E | Branch if overflow set
	JMP ($5C5C)		  ; 6C 5C 5C | Jump to address (absolute indirect)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA ($FF,X)		  ; A1 FF | Read graphics status
	STA ($FF,X)		  ; 81 FF | Update graphics data
	STA ($FF,X)		  ; 81 FF | Update graphics data
	SEC				  ; 38 | Set carry flag
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $F0F0,X		  ; 7E F0 F0 | Rotate right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA ($00,X)		  ; 81 00 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	CPY $0800			; CC 00 08 | Compare Y register (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $00			  ; B0 00 | Branch if carry set
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BVS $02			  ; 70 02 | Branch if overflow set
	AND $1807,X		  ; 3D 07 18 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA $1E0F,Y		  ; 19 0F 1E | Logical OR with accumulator (absolute,Y)
	ASL $86F6			; 0E F6 86 | Arithmetic shift left (absolute)
	STX $7F			  ; 86 7F | Store X register to zero page
	BPL $00			  ; 10 00 | Branch if positive
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ADC $7900,Y		  ; 79 00 79 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_11A
; Address: $E8BEA0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_11A:
	SEI				  ; 78 | Set interrupt disable flag
	PHB				  ; 8B | Push data bank register to stack
	BVS $73			  ; 70 73 | Branch if overflow set
	BVS $F3			  ; 70 F3 | Branch if overflow set
	SBC ($65),Y		  ; F1 65 | Subtract with carry ((zero page),Y)
	EOR ($7C,X)		  ; 41 7C | Exclusive OR with accumulator ((zero page,X))
	STA $000F00		  ; 8F 00 0F 00 | Update graphics data
	ASL $FE00			; 0E 00 FE | Arithmetic shift left (absolute)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BEQ $10			  ; F0 10 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_11B
; Address: $E8BEC9
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_11B:
	INC $F2F0,X		  ; FE F0 F2 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX $FE00			; EC 00 FE | Compare X register (absolute)
	INC $0200,X		  ; FE 00 02 | Increment (absolute,X)
	ASL $C600			; 0E 00 C6 | Arithmetic shift left (absolute)
	INC $4600,X		  ; FE 00 46 | Increment (absolute,X)
	BVC $3E			  ; 50 3E | Branch if overflow clear
	BNE $BE			  ; D0 BE | Branch if not equal
	ROL $8AF4,X		  ; 3E F4 8A | Rotate left (absolute,X)
	ROL $3E7E,X		  ; 3E 7E 3E | Rotate left (absolute,X)
	LSR $09			  ; 46 09 | Logical shift right (zero page)
	ADC ($81),Y		  ; 71 81 | Add with carry ((zero page),Y)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Update graphics data
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Update graphics data
	STA ($FF,X)		  ; 81 FF | Update graphics data
	STX $FF			  ; 86 FF | Store X register to zero page
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	BRA $F0			  ; 80 F0 | Branch always
	INX				  ; E8 | Increment X register
	XBA				  ; EB | Exchange accumulator bytes
	STX $0FFF			; 8E FF 0F | Store X register to absolute address
	LDY $06BE			; AC BE 06 | Load from absolute address into Y register
	ASL $EEF4,X		  ; 1E F4 EE | Arithmetic shift left (absolute,X)
	ROR $FE			  ; 66 FE | Rotate right (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	ROL				  ; 2A | Rotate left (accumulator)
	REP #$FB			 ; C2 FB | Reset processor status bits
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $B810,X		  ; 1E 10 B8 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_11C
; Address: $E8BF44
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_11C:
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	INC $EE			  ; E6 EE | Increment (zero page)
	SBC $63C3,X		  ; FD C3 63 | Subtract with carry (absolute,X)
	CMP $DDE3,X		  ; DD E3 DD | Compare accumulator (absolute,X)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	BPL $1C			  ; 10 1C | Branch if positive
	ORA #$2F			 ; 09 2F | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	BPL $27			  ; 10 27 | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_11E
; Address: $E8BF72
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_11E:
	JSR $4800			; 20 00 48 | Jump to subroutine
	JMP $3000			; 4C 00 30 | Jump to address
	ROL $3F00,X		  ; 3E 00 3F | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_11F
; Address: $E8BF81
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_11F:
	BPL $60			  ; 10 60 | Branch if positive
	INX				  ; E8 | Increment X register
	BMI $F4			  ; 30 F4 | Branch if negative
	BVS $F2			  ; 70 F2 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_120
; Address: $E8BF89
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_120:
	JSL $E0C2F0		  ; 22 F0 C2 E0 | Game work RAM access
	STY $C0			  ; 84 C0 | Store Y register to zero page
	CLV				  ; B8 | Clear overflow flag
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ASL $DE00			; 0E 00 DE | Arithmetic shift left (absolute)
	ROL $7C00,X		  ; 3E 00 7C | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	BCS $B0			  ; B0 B0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_121
; Address: $E8BFA4
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_121:
	JSR $0720			; 20 20 07 | Jump to subroutine
	JMP ($706C)		  ; 6C 6C 70 | Jump to address (absolute indirect)
	BVS $01			  ; 70 01 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STA $00FE00		  ; 8F 00 FE 00 | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	RTI				  ; 40 | Return from interrupt
	AND $FF3D,X		  ; 3D 3D FF | Logical AND with accumulator (absolute,X)
	LDA				  ; BF 00 FF 00 | Read graphics status
	REP #$00			 ; C2 00 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_122
; Address: $E8BFE0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_122:
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Read graphics status
	CMP $EA00,X		  ; DD 00 EA | Compare accumulator (absolute,X)
	NOP				  ; EA | No operation
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_123
; Address: $E8C020
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_123:
	JSL $C0D1D6		  ; 22 D6 D1 C0 | Jump to subroutine long
	ASL $C108,X		  ; 1E 08 C1 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 09 00 FE | Read graphics status
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	AND $3F00,Y		  ; 39 00 3F | Logical AND with accumulator (absolute,Y)
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$96			 ; A0 96 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_124
; Address: $E8C048
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_124:
	RTI				  ; 40 | Return from interrupt
	ROL $14A4,X		  ; 3E A4 14 | Rotate left (absolute,X)
	BPL $68			  ; 10 68 | Branch if positive
	INC $B700,X		  ; FE 00 B7 | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $5877			; 0E 77 58 | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	JMP $7033			; 4C 33 70 | Jump to address
	STY $FF			  ; 84 FF | Store Y register to zero page
	STY $FF			  ; 84 FF | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	DEC				  ; 3A | Decrement accumulator
	LDA				  ; BF 37 B7 2E | Read graphics status
	LDA ($10),Y		  ; B1 10 | Read graphics status
	EOR $75E6,Y		  ; 59 E6 75 | Exclusive OR with accumulator (absolute,Y)
	NOP				  ; EA | No operation
	STA				  ; 9F 60 00 00 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	CPY $37FB			; CC FB 37 | Compare Y register (absolute)
	INY				  ; C8 | Increment Y register
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	STY $FF			  ; 84 FF | Store Y register to zero page
	SBC $F1CF,X		  ; FD CF F1 | Subtract with carry (absolute,X)
	ASL $7CA2,X		  ; 1E A2 7C | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_125
; Address: $E8C0CA
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_125:
	ROL $BAF0			; 2E F0 BA | Rotate left (absolute)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $40DF,X		  ; 1D DF 40 | Logical OR with accumulator (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	SBC $7B05			; ED 05 7B | Subtract with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	ROL $71			  ; 26 71 | Rotate left (zero page)
	LDX $D900			; AE 00 D9 | Load from absolute address into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_126
; Address: $E8C0EF
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_126:
	BCC $A0			  ; 90 A0 | Branch if carry clear
	ROR $3F00,X		  ; 7E 00 3F | Rotate right (absolute,X)
	LDA $F000,Y		  ; B9 00 F0 | Read graphics status
	JMP $A2E605		  ; 5C 05 E6 A2 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack
	LDX $80			  ; A6 80 | Load from zero page into X register
	JMP ($D408)		  ; 6C 08 D4 | Jump to address (absolute indirect)
	LDX $F900,Y		  ; BE 00 F9 | Load from absolute,Y into X register
	ORA $FF00,X		  ; 1D 00 FF | Logical OR with accumulator (absolute,X)
	LDX $FC00,Y		  ; BE 00 FC | Load from absolute,Y into X register
	ORA $1C			  ; 05 1C | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_127
; Address: $E8C124
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_127:
	JSL $1C331F		  ; 22 1F 33 1C | Jump to subroutine long
	AND $6008,Y		  ; 39 08 60 | Logical AND with accumulator (absolute,Y)
	STA $FF91,Y		  ; 99 91 FF | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_128
; Address: $E8C134
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_128:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ROL $00			  ; 26 00 | Rotate left (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	STA $344B34		  ; 8F 34 4B 34 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	BRA $03			  ; 80 03 | Branch always
	BEQ $01			  ; F0 01 | Branch if equal
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	BPL $04			  ; 10 04 | Branch if positive
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $C703,X		  ; 3E 03 C7 | Rotate left (absolute,X)
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_129
; Address: $E8C17A
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_129:
	CMP ($30,X)		  ; C1 30 | Compare accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	REP #$7A			 ; C2 7A | Reset processor status bits
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY $EEB2			; CC B2 EE | Compare Y register (absolute)
	LSR $E7			  ; 46 E7 | Logical shift right (zero page)
	BNE $F1			  ; D0 F1 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	ROR $2100,X		  ; 7E 00 21 | PPU graphics register access
	ORA $0F80,Y		  ; 19 80 0F | Logical OR with accumulator (absolute,Y)
	ASL $6120,X		  ; 1E 20 61 | Arithmetic shift left (absolute,X)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPX #$74			 ; E0 74 | Compare X register (immediate)
	STY $8779			; 8C 79 87 | Store Y register to absolute address
	ROL $DF00,X		  ; 3E 00 DF | Rotate left (absolute,X)
	STA $B084B4		  ; 8F B4 84 B0 | Update graphics data
	INY				  ; C8 | Increment Y register
	STA ($EF),Y		  ; 91 EF | Update graphics data
	INX				  ; E8 | Increment X register
	AND $33F3,X		  ; 3D F3 33 | Logical AND with accumulator (absolute,X)
	BMI $06			  ; 30 06 | Branch if negative
	BMI $01			  ; 30 01 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	PHX				  ; DA | Push X register to stack
	STX $49			  ; 86 49 | Store X register to zero page
	INX				  ; E8 | Increment X register
	LDY $1ED1			; AC D1 1E | Load from absolute address into Y register
	CMP ($1E),Y		  ; D1 1E | Compare accumulator ((zero page),Y)
	ADC $AE			  ; 65 AE | Add with carry (zero page)
	INC				  ; 1A | Increment accumulator
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	LDX $E5BB,Y		  ; BE BB E5 | Load from absolute,Y into X register
	SBC $F844,Y		  ; F9 44 F8 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	CPY $78			  ; C4 78 | Compare Y register (zero page)
	CPY #$22			 ; C0 22 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	STX $00			  ; 86 00 | Store X register to zero page
	LDA $5D			  ; A5 5D | Read graphics status

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_12A
; Address: $E8C222
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_12A:
	CMP $C6AD			; CD AD C6 | Compare accumulator (absolute)
	LSR $F6			  ; 46 F6 | Logical shift right (zero page)
	ASL $F6			  ; 06 F6 | Arithmetic shift left (zero page)
	INC $D6			  ; E6 D6 | Increment (zero page)
	AND ($4A),Y		  ; 31 4A | Logical AND with accumulator ((zero page),Y)
	CMP $02			  ; C5 02 | Compare accumulator (zero page)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA #$C0			 ; 09 C0 | Logical OR with accumulator (immediate)
	STY $80			  ; 84 80 | Store Y register to zero page
	BVS $81			  ; 70 81 | Branch if overflow set
	ROL $8EC1,X		  ; 3E C1 8E | Rotate left (absolute,X)
	SBC ($06),Y		  ; F1 06 | Subtract with carry ((zero page),Y)
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	SBC $FD32,X		  ; FD 32 FD | Subtract with carry (absolute,X)
	ROR $079F			; 6E 9F 07 | Rotate right (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	EOR ($EE),Y		  ; 51 EE | Exclusive OR with accumulator ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	JMP $CF3CAF		  ; 5C AF 3C CF | Jump to address long
	STA				  ; 9F 1F 00 1F | Update graphics data
	STA				  ; 9F 00 FF 00 | Update graphics data
	BPL $EF			  ; 10 EF | Branch if positive
	BMI $C1			  ; 30 C1 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	BMI $DF			  ; 30 DF | Branch if negative
	CMP $EC53,Y		  ; D9 53 EC | Compare accumulator (absolute,Y)
	XBA				  ; EB | Exchange accumulator bytes
	CPX $0048			; EC 48 00 | Compare X register (absolute)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	INY				  ; C8 | Increment Y register
	CPY $CE00			; CC 00 CE | Compare Y register (absolute)
	SBC $AE3E,X		  ; FD 3E AE | Subtract with carry (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	AND $5EC2,X		  ; 3D C2 5E | Logical AND with accumulator (absolute,X)
	LDX #$F7			 ; A2 F7 | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	INC $8F12			; EE 12 8F | Increment (absolute)
	BVS $1E			  ; 70 1E | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA ($09,X)		  ; 81 09 | Update graphics data

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_12B
; Address: $E8C2B4
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_12B:
	JSR $4100			; 20 00 41 | Jump to subroutine
	STA $7C03,X		  ; 9D 03 7C | Update graphics data
	SBC $1A01,Y		  ; F9 01 1A | Subtract with carry (absolute,Y)
	SBC $89			  ; E5 89 | Subtract with carry (zero page)
	ORA $8E77			; 0D 77 8E | Logical OR with accumulator (absolute)
	STZ $3166,X		  ; 9E 66 31 | Store zero to absolute,X
	LDA $F829			; AD 29 F8 | Read graphics status
	STZ $F8			  ; 64 F8 | Store zero to zero page
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $84			  ; F0 84 | Branch if equal
	BVS $04			  ; 70 04 | Branch if overflow set
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	SEP #$43			 ; E2 43 | Set processor status bits
	ASL $F3			  ; 06 F3 | Arithmetic shift left (zero page)
	ROR $4581,X		  ; 7E 81 45 | Rotate right (absolute,X)
	LDX $BE41,Y		  ; BE 41 BE | Load from absolute,Y into X register
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	LDA $3EC7,Y		  ; B9 C7 3E | Read graphics status
	CMP ($5F,X)		  ; C1 5F | Compare accumulator ((zero page,X))
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	CPY $E600			; CC 00 E6 | Compare Y register (absolute)
	INC $04			  ; E6 04 | Increment (zero page)
	STZ $3FA4			; 9C A4 3F | Store zero to absolute
	BCC $5F			  ; 90 5F | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $89			  ; F0 89 | Branch if equal
	BVS $DF			  ; 70 DF | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_12C
; Address: $E8C314
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_12C:
	LDA				  ; BF 20 BF 00 | Read graphics status
	LDA				  ; BF 00 7F 04 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STY $4B46			; 8C 46 4B | Store Y register to absolute address
	STA $A771			; 8D 71 A7 | Update graphics data
	LDA $79F3,Y		  ; B9 F3 79 | Read graphics status
	SBC $7984,Y		  ; F9 84 79 | Subtract with carry (absolute,Y)
	DEC $39			  ; C6 39 | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	SBC $FD08,Y		  ; F9 08 FD | Subtract with carry (absolute,Y)
	SBC $FF04,X		  ; FD 04 FF | Subtract with carry (absolute,X)
	CPX $EED9			; EC D9 EE | Compare X register (absolute)
	DEY				  ; 88 | Decrement Y register
	ORA $296E,Y		  ; 19 6E 29 | Logical OR with accumulator (absolute,Y)
	ROR $0E79,X		  ; 7E 79 0E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_12D
; Address: $E8C34C
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_12D:
	LDA				  ; BF CE 6E BF | Read graphics status
	DEC $4E00			; CE 00 4E | Decrement (absolute)
	BRA $7E			  ; 80 7E | Branch always
	BRA $3E			  ; 80 3E | Branch always
	BRA $EE			  ; 80 EE | Branch always
	LDA				  ; BF 00 9E 61 | Read graphics status
	ROR $7E81,X		  ; 7E 81 7E | Rotate right (absolute,X)
	STA ($F5,X)		  ; 81 F5 | Update graphics data
	SBC $C017			; ED 17 C0 | Subtract with carry (absolute)
	ROL $6E90,X		  ; 3E 90 6E | Rotate left (absolute,X)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	LDA ($02,X)		  ; A1 02 | Read graphics status
	STA ($04,X)		  ; 81 04 | Update graphics data
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($EA,X)		  ; 01 EA | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	TXA				  ; 8A | Transfer X register to accumulator
	ADC #$1D			 ; 69 1D | Add with carry (immediate)
	EOR ($4E),Y		  ; 51 4E | Exclusive OR with accumulator ((zero page),Y)
	BCS $7C			  ; B0 7C | Branch if carry set
	STX $0DF5			; 8E F5 0D | Store X register to absolute address
	SBC ($0A),Y		  ; F1 0A | Subtract with carry ((zero page),Y)
	ADC ($80,X)		  ; 61 80 | Add with carry ((zero page,X))
	BCC $5F			  ; 90 5F | Branch if carry clear
	BRA $F8			  ; 80 F8 | Branch always
	ORA ($CE,X)		  ; 01 CE | Logical OR with accumulator ((zero page,X))
	ORA ($AB,X)		  ; 01 AB | Logical OR with accumulator ((zero page,X))
	BEQ $9A			  ; F0 9A | Branch if equal
	SBC ($88),Y		  ; F1 88 | Subtract with carry ((zero page),Y)
	BEQ $DF			  ; F0 DF | Branch if equal
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CMP $0C01,X		  ; DD 01 0C | Compare accumulator (absolute,X)
	ASL $0E01			; 0E 01 0E | Arithmetic shift left (absolute)
	STX $0000			; 8E 00 00 | Store X register to absolute address
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $8F			  ; F0 8F | Branch if equal
	ADC ($01),Y		  ; 71 01 | Add with carry ((zero page),Y)
	BRA $80			  ; 80 80 | Branch always
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_12E
; Address: $E8C3E9
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_12E:
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $E0			  ; 06 E0 | Game work RAM access
	ASL $F000,X		  ; 1E 00 F0 | Arithmetic shift left (absolute,X)
	ADC $F5			  ; 65 F5 | Add with carry (zero page)
	INC $FD			  ; E6 FD | Increment (zero page)
	DEC $AFFE			; CE FE AF | Decrement (absolute)
	ORA $3DEF,X		  ; 1D EF 3D | Logical OR with accumulator (absolute,X)
	AND $D037,Y		  ; 39 37 D0 | Logical AND with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEC $BC3E			; CE 3E BC | Decrement (absolute)
	CPX $FC			  ; E4 FC | Compare X register (zero page)
	STY $FC			  ; 84 FC | Store Y register to zero page
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA #$F1			 ; 09 F1 | Logical OR with accumulator (immediate)
	ROL $7C01,X		  ; 3E 01 7C | Rotate left (absolute,X)
	SBC $F102,X		  ; FD 02 F1 | Subtract with carry (absolute,X)
	ASL $FA			  ; 06 FA | Arithmetic shift left (zero page)
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	CPX $AF			  ; E4 AF | Compare X register (zero page)
	CMP $FD13,X		  ; DD 13 FD | Compare accumulator (absolute,X)
	SBC ($FB,X)		  ; E1 FB | Subtract with carry ((zero page,X))
	LDX $01BE,Y		  ; BE BE 01 | Load from absolute,Y into X register
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ASL $11			  ; 06 11 | Arithmetic shift left (zero page)
	LSR $7060,X		  ; 5E 60 70 | Logical shift right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_12F
; Address: $E8C464
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_12F:
	INC $F2F1,X		  ; FE F1 F2 | Increment (absolute,X)
	SBC $FDF2,X		  ; FD F2 FD | Subtract with carry (absolute,X)
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	ROR $6D41,X		  ; 7E 41 6D | Rotate right (absolute,X)
	STA ($6F,X)		  ; 81 6F | Update graphics data
	STA $F000F0		  ; 8F F0 00 F0 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 00 5F 80 | Read graphics status
	ORA $360A			; 0D 0A 36 | Logical OR with accumulator (absolute)
	ADC ($51),Y		  ; 71 51 | Add with carry ((zero page),Y)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BMI $50			  ; 30 50 | Branch if negative
	JMP ($0F00)		  ; 6C 00 0F | Jump to address (absolute indirect)
	ASL $1F7F			; 0E 7F 1F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_130
; Address: $E8C49C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_130:
	STA $FF83FF		  ; 8F FF 83 FF | Update graphics data
	BCC $70			  ; 90 70 | Branch if carry clear
	LDY $EEB4			; AC B4 EE | Load from absolute address into Y register
	NOP				  ; EA | No operation
	ADC $B7B5,X		  ; 7D B5 B7 | Add with carry (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_131
; Address: $E8C4AB
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_131:
	ADC #$74			 ; 69 74 | Add with carry (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BPL $FE			  ; 10 FE | Branch if positive
	BRA $FF			  ; 80 FF | Branch always
	PHA				  ; 48 | Push accumulator to stack
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	LDX $45			  ; A6 45 | Load from zero page into X register
	ASL $27			  ; 06 27 | Arithmetic shift left (zero page)
	ORA $17			  ; 05 17 | Logical OR with accumulator (zero page)
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	EOR $18			  ; 45 18 | Exclusive OR with accumulator (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	INX				  ; E8 | Increment X register
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PEA #$E09C		   ; F4 9C E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	CPY $70			  ; C4 70 | Compare Y register (zero page)
	STY $FCF4			; 8C F4 FC | Store Y register to absolute address
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PEA #$E003		   ; F4 03 E0 | Game work RAM access
	BNE $03			  ; D0 03 | Branch if not equal
	CPX $FC03			; EC 03 FC | Compare X register (absolute)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 80 | Read graphics status
	BVC $70			  ; 50 70 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_133
; Address: $E8C50C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_133:
	JSR $0020			; 20 20 00 | Jump to subroutine
	STY $1003			; 8C 03 10 | Store Y register to absolute address
	STA $61837C		  ; 8F 7C 83 61 | Update graphics data
	STZ $F807,X		  ; 9E 07 F8 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_134
; Address: $E8C51C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_134:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	AND $3D27,Y		  ; 39 27 3D | Logical AND with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_135
; Address: $E8C537
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_135:
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	PLB				  ; AB | Pull data bank register from stack
	PEA #$5B24		   ; F4 24 5B | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	INC $6F76,X		  ; FE 76 6F | Increment (absolute,X)
	AND $3F			  ; 25 3F | Logical AND with accumulator (zero page)
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	STZ $BE50,X		  ; 9E 50 BE | Store zero to absolute,X
	STZ $F4			  ; 64 F4 | Store zero to zero page
	LSR $F6			  ; 46 F6 | Logical shift right (zero page)
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	STZ $E4			  ; 64 E4 | Store zero to zero page
	BVC $50			  ; 50 50 | Branch if overflow clear
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	LSR $FE			  ; 46 FE | Logical shift right (zero page)
	CLC				  ; 18 | Clear carry flag
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_136
; Address: $E8C58F
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_136:
	NOP				  ; EA | No operation
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $3300			; 0E 00 33 | Arithmetic shift left (absolute)
	BVS $03			  ; 70 03 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	STY $8600			; 8C 00 86 | Store Y register to absolute address
	CMP ($B0,X)		  ; C1 B0 | Compare accumulator ((zero page,X))
	LDA #$DA			 ; A9 DA | Read graphics status
	STY $7200			; 8C 00 72 | Store Y register to absolute address
	EOR $02			  ; 45 02 | Exclusive OR with accumulator (zero page)
	ASL $79			  ; 06 79 | Arithmetic shift left (zero page)
	ORA $26			  ; 05 26 | Logical OR with accumulator (zero page)
	WDM #$67			 ; 42 67 | Reserved instruction
	ORA $17			  ; 05 17 | Logical OR with accumulator (zero page)
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	LDA				  ; BF BF 78 80 | Read graphics status
	ROL $D8			  ; 26 D8 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_137
; Address: $E8C5D5
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_137:
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	INX				  ; E8 | Increment X register
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	LDA				  ; BF FF 10 F7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	DEC $F05E,X		  ; DE 5E F0 | Decrement (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $7C0E			; 0E 0E 7C | Arithmetic shift left (absolute)
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ASL $7E27,X		  ; 1E 27 7E | Arithmetic shift left (absolute,X)
	AND ($F0,X)		  ; 21 F0 | Logical AND with accumulator ((zero page,X))
	ASL $7CF1			; 0E F1 7C | Arithmetic shift left (absolute)
	STA				  ; 9F FF FF 86 | Update graphics data
	ADC $2605,Y		  ; 79 05 26 | Add with carry (absolute,Y)
	WDM #$67			 ; 42 67 | Reserved instruction
	ORA $17			  ; 05 17 | Logical OR with accumulator (zero page)
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	LDA				  ; BF BF 78 00 | Read graphics status
	ROL $D8			  ; 26 D8 | Rotate left (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	INX				  ; E8 | Increment X register
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	LDA				  ; BF FF C8 35 | Read graphics status
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPY $70			  ; C4 70 | Compare Y register (zero page)
	STY $FCF4			; 8C F4 FC | Store Y register to absolute address
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	CPX $FC03			; EC 03 FC | Compare X register (absolute)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF A0 | Read graphics status
	BVS $B0			  ; 70 B0 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_138
; Address: $E8C647
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_138:
	ADC ($04,X)		  ; 61 04 | Add with carry ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ROR $2C7E,X		  ; 7E 7E 2C | Rotate right (absolute,X)
	BMI $0F			  ; 30 0F | Branch if negative
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ROR $39FF,X		  ; 7E FF 39 | Rotate right (absolute,X)
	AND $1F3B,X		  ; 3D 3B 1F | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_139
; Address: $E8C66C
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_139:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BVS $70			  ; 70 70 | Branch if overflow set
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BVS $FF			  ; 70 FF | Branch if overflow set
	BMI $FF			  ; 30 FF | Branch if negative
	EOR $F800			; 4D 00 F8 | Exclusive OR with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	ASL $A1			  ; 06 A1 | Arithmetic shift left (zero page)
	ADC ($FC,X)		  ; 61 FC | Add with carry ((zero page,X))
	ROL $FFFE,X		  ; 3E FE FF | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag
	STZ $0300,X		  ; 9E 00 03 | Store zero to absolute,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $DFFF,X		  ; 3E FF DF | Rotate left (absolute,X)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $B6			  ; 80 B6 | Branch always
	EOR #$7F			 ; 49 7F | Exclusive OR with accumulator (immediate)
	BRA $C7			  ; 80 C7 | Branch always
	SEC				  ; 38 | Set carry flag
	ROR $0081,X		  ; 7E 81 00 | Rotate right (absolute,X)
	ORA $3B00,X		  ; 1D 00 3B | Logical OR with accumulator (absolute,X)
	SBC $8700			; ED 00 87 | Subtract with carry (absolute)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ROL $FEF1			; 2E F1 FE | Rotate left (absolute)
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $F800			; 0E 00 F8 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $1606			; 0D 06 16 | Logical OR with accumulator (absolute)
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ASL $26			  ; 06 26 | Arithmetic shift left (zero page)
	ORA #$3A			 ; 09 3A | Logical OR with accumulator (immediate)
	ADC $0000,X		  ; 7D 00 00 | Add with carry (absolute,X)
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	AND $2900,Y		  ; 39 00 29 | Logical AND with accumulator (absolute,Y)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$70			 ; C0 70 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_13B
; Address: $E8C72D
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_13B:
	CLD				  ; D8 | Clear decimal mode flag
	BMI $F8			  ; 30 F8 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $7D			  ; 06 7D | Arithmetic shift left (zero page)
	AND ($5F,X)		  ; 21 5F | Logical AND with accumulator ((zero page,X))
	AND $5F			  ; 25 5F | Logical AND with accumulator (zero page)
	ASL $1E77			; 0E 77 1E | Arithmetic shift left (absolute)
	INC $31			  ; E6 31 | Increment (zero page)
	LDA $F829			; AD 29 F8 | Read graphics status
	STZ $FB			  ; 64 FB | Store zero to zero page
	RTI				  ; 40 | Return from interrupt
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $04			  ; 50 04 | Branch if overflow clear
	BVS $04			  ; 70 04 | Branch if overflow set
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	SEP #$43			 ; E2 43 | Set processor status bits
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	INY				  ; C8 | Increment Y register
	BPL $FF			  ; 10 FF | Branch if positive
	LDA				  ; BF C8 3F D8 | Read graphics status
	LDX $1C71,Y		  ; BE 71 1C | Load from absolute,Y into X register
	ADC $08E2,Y		  ; 79 E2 08 | Add with carry (absolute,Y)
	ORA $2700			; 0D 00 27 | Logical OR with accumulator (absolute)
	ROR $04			  ; 66 04 | Rotate right (zero page)
	LDY $4974,X		  ; BC 74 49 | Load from absolute,X into Y register
	LDA $B743			; AD 43 B7 | Read graphics status
	LDA ($F7,X)		  ; A1 F7 | Read graphics status
	ADC ($F3,X)		  ; 61 F3 | Add with carry ((zero page,X))
	BVS $E5			  ; 70 E5 | Branch if overflow set
	CMP ($61),Y		  ; D1 61 | Compare accumulator ((zero page),Y)
	SBC $F221,Y		  ; F9 21 F2 | Subtract with carry (absolute,Y)
	ASL $F3			  ; 06 F3 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	SBC $F90A,Y		  ; F9 0A F9 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	SBC $FB0C,X		  ; FD 0C FB | Subtract with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $06FF			; 0E FF 06 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	SBC $FCFE,X		  ; FD FE FC | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SBC $FEFD,X		  ; FD FD FE | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	BEQ $FE			  ; F0 FE | Branch if equal
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_13C
; Address: $E8C7C1
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_13C:
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	TXA				  ; 8A | Transfer X register to accumulator
	SBC $6916,X		  ; FD 16 69 | Subtract with carry (absolute,X)
	ORA $FF7F,X		  ; 1D 7F FF | Logical OR with accumulator (absolute,X)
	CMP ($2E),Y		  ; D1 2E | Compare accumulator ((zero page),Y)
	ASL $F51E,X		  ; 1E 1E F5 | Arithmetic shift left (absolute,X)
	ORA $0FF7			; 0D F7 0F | Logical OR with accumulator (absolute)
	SBC ($08),Y		  ; F1 08 | Subtract with carry ((zero page),Y)
	ADC ($80,X)		  ; 61 80 | Add with carry ((zero page,X))
	BCC $DF			  ; 90 DF | Branch if carry clear
	DEC				  ; 3A | Decrement accumulator
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	PLB				  ; AB | Pull data bank register from stack
	BEQ $9A			  ; F0 9A | Branch if equal
	SBC ($88),Y		  ; F1 88 | Subtract with carry ((zero page),Y)
	DEC $DEF1			; CE F1 DE | Decrement (absolute)
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $0E01			; 0E 01 0E | Arithmetic shift left (absolute)
	STX $4000			; 8E 00 40 | Store X register to absolute address
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $8F			  ; F0 8F | Branch if equal
	ADC ($41),Y		  ; 71 41 | Add with carry ((zero page),Y)
	LDA				  ; BF 00 FF 00 | Read graphics status
	SBC ($7B,X)		  ; E1 7B | Subtract with carry ((zero page,X))
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $F9			  ; 80 F9 | Branch always
	INC $F8F7,X		  ; FE F7 F8 | Increment (absolute,X)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	NOP				  ; EA | No operation
	INC $FEED,X		  ; FE ED FE | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1F09			; 0E 09 1F | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_13D
; Address: $E8C876
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_13D:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BCC $00			  ; 90 00 | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal
	BCC $00			  ; 90 00 | Branch if carry clear
	CPY #$A6			 ; C0 A6 | Compare Y register (immediate)
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $2F			  ; 10 2F | Branch if positive
	BIT $ECD3			; 2C D3 EC | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_13E
; Address: $E8C8BA
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_13E:
	JSR $C003			; 20 03 C0 | Jump to subroutine
	ROR $C001,X		  ; 7E 01 C0 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $B800,X		  ; 7E 00 B8 | Rotate right (absolute,X)
	INC $3801,X		  ; FE 01 38 | Increment (absolute,X)
	STA ($7E,X)		  ; 81 7E | Update graphics data
	SEC				  ; 38 | Set carry flag
	CPY #$23			 ; C0 23 | Compare Y register (immediate)
	ASL $00EF			; 0E EF 00 | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_13F
; Address: $E8C8F8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_13F:
	JSR $10C0			; 20 C0 10 | Jump to subroutine
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	CPX $0010			; EC 10 00 | Compare X register (absolute)
	BMI $C0			  ; 30 C0 | Branch if negative
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_140
; Address: $E8C908
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_140:
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	STA				  ; 9F 60 EF 00 | Update graphics data
	BPL $00			  ; 10 00 | Branch if positive
	ASL $00E0			; 0E E0 00 | Arithmetic shift left (absolute)
	STA $FF8700		  ; 8F 00 87 FF | Update graphics data
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	CLD				  ; D8 | Clear decimal mode flag
	STA $007000		  ; 8F 00 70 00 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	BEQ $E4			  ; F0 E4 | Branch if equal
	CMP ($7F,X)		  ; C1 7F | Compare accumulator ((zero page,X))
	LSR $79A7,X		  ; 5E A7 79 | Logical shift right (absolute,X)
	STA ($F8,X)		  ; 81 F8 | Update graphics data
	SEC				  ; 38 | Set carry flag
	BIT $17			  ; 24 17 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_141
; Address: $E8C958
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_141:
	STX $00			  ; 86 00 | Store X register to zero page
	PHP				  ; 08 | Push processor status to stack
	CPY #$CB			 ; C0 CB | Compare Y register (immediate)
	CPX #$AC			 ; E0 AC | Compare X register (immediate)
	BVC $0F			  ; 50 0F | Branch if overflow clear
	BVS $13			  ; 70 13 | Branch if overflow set
	JMP ($EF90)		  ; 6C 90 EF | Jump to address (absolute indirect)
	DEY				  ; 88 | Decrement Y register
	ROL $9F4F,X		  ; 3E 4F 9F | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_142
; Address: $E8C97A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_142:
	BVS $08			  ; 70 08 | Branch if overflow set
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_143
; Address: $E8C981
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_143:
	BRA $80			  ; 80 80 | Branch always
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
	SBC $7F39,Y		  ; F9 39 7F | Subtract with carry (absolute,Y)
	LDA				  ; BF 46 BF 7F | Read graphics status
	LDX $E0E7,Y		  ; BE E7 E0 | Game work RAM access
	ROL $3801,X		  ; 3E 01 38 | Rotate left (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	STA $1F			  ; 85 1F | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($2C,X)		  ; 01 2C | Logical OR with accumulator ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_144
; Address: $E8C9D9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_144:
	ADC $B0			  ; 65 B0 | Add with carry (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	CPX $C16D			; EC 6D C1 | Compare X register (absolute)
	BCS $CF			  ; B0 CF | Branch if carry set
	BRA $F8			  ; 80 F8 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BCC $E8			  ; 90 E8 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	ROR $4081,X		  ; 7E 81 40 | Rotate right (absolute,X)
	BRA $78			  ; 80 78 | Branch always
	BRA $63			  ; 80 63 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_145
; Address: $E8C9FE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_145:
	SED				  ; F8 | Set decimal mode flag
	STZ $0703			; 9C 03 07 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_146
; Address: $E8CA12
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_146:
	SED				  ; F8 | Set decimal mode flag
	CPX #$78			 ; E0 78 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_147
; Address: $E8CA16
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_147:
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF CB 34 05 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	STA ($FF,X)		  ; 81 FF | Update graphics data
	SBC $E3F0			; ED F0 E3 | Subtract with carry (absolute)
	SBC $F373,X		  ; FD 73 F3 | Subtract with carry (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BVS $01			  ; 70 01 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	CPY #$F9			 ; C0 F9 | Compare Y register (immediate)
	STA ($7F,X)		  ; 81 7F | Update graphics data
	ROL $F9			  ; 26 F9 | Rotate left (zero page)
	LDA				  ; BF 40 7F 00 | Read graphics status
	SEC				  ; 38 | Set carry flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLV				  ; B8 | Clear overflow flag
	BRA $07			  ; 80 07 | Branch always
	LDA				  ; BF 00 FB 07 | Read graphics status
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	DEC				  ; 3A | Decrement accumulator
	CMP ($E3,X)		  ; C1 E3 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_148
; Address: $E8CA6B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_148:
	JSR $E01F			; 20 1F E0 | Game work RAM access
	ROL $00C0,X		  ; 3E C0 00 | Rotate left (absolute,X)
	SBC $3001,X		  ; FD 01 30 | Subtract with carry (absolute,X)
	BRA $01			  ; 80 01 | Branch always
	BVC $F1			  ; 50 F1 | Branch if overflow clear
	LDY $E1			  ; A4 E1 | Load from zero page into Y register
	CPY $0F20			; CC 20 0F | Compare Y register (absolute)
	EOR ($1F,X)		  ; 41 1F | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_149
; Address: $E8CA90
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_149:
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	ROR $5E0F,X		  ; 7E 0F 5E | Rotate right (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	BMI $DF			  ; 30 DF | Branch if negative
	BNE $AF			  ; D0 AF | Branch if not equal
	LDY #$0F			 ; A0 0F | Load immediate value into Y register
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	STZ $77FC			; 9C FC 77 | Store zero to absolute
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $CB01,X		  ; FD 01 CB | Subtract with carry (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	ROR $C001,X		  ; 7E 01 C0 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	ROL $3A24,X		  ; 3E 24 3A | Rotate left (absolute,X)
	EOR $0000,Y		  ; 59 00 00 | Exclusive OR with accumulator (absolute,Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	REP #$FC			 ; C2 FC | Reset processor status bits
	SEP #$FD			 ; E2 FD | Set processor status bits
	ORA $1F07,X		  ; 1D 07 1F | Logical OR with accumulator (absolute,X)
	ASL $EF61,X		  ; 1E 61 EF | Arithmetic shift left (absolute,X)
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$67			 ; E0 67 | Compare X register (immediate)
	BRA $F7			  ; 80 F7 | Branch always
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	BEQ $7F			  ; F0 7F | Branch if equal
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC $7F7F,X		  ; FD 7F 7F | Subtract with carry (absolute,X)
	SBC $D507,Y		  ; F9 07 D5 | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BRA $7F			  ; 80 7F | Branch always
	BRA $7C			  ; 80 7C | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_14A
; Address: $E8CB8B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_14A:
	BRA $FA			  ; 80 FA | Branch always
	STA ($95,X)		  ; 81 95 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	ORA ($C3,X)		  ; 01 C3 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 00 BF 00 | Read graphics status
	LDA $BB00,Y		  ; B9 00 BB | Read graphics status
	INX				  ; E8 | Increment X register
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC $6200,X		  ; FD 00 62 | Subtract with carry (absolute,X)
	LDY $5C03,X		  ; BC 03 5C | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_14B
; Address: $E8CBAE
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_14B:
	JSR $03DF			; 20 DF 03 | Jump to subroutine
	SEP #$02			 ; E2 02 | Set processor status bits
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	STX $021F			; 8E 1F 02 | Store X register to absolute address
	BCC $F1			  ; 90 F1 | Branch if carry clear
	BPL $F1			  ; 10 F1 | Branch if positive
	ORA ($E6,X)		  ; 01 E6 | Logical OR with accumulator ((zero page,X))
	ORA ($EE,X)		  ; 01 EE | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_14C
; Address: $E8CBD5
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_14C:
	CPY $4C13			; CC 13 4C | Compare Y register (absolute)
	ORA ($8E),Y		  ; 11 8E | Logical OR with accumulator ((zero page),Y)
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	BPL $F0			  ; 10 F0 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	STX $78			  ; 86 78 | Store X register to zero page
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	STA $01FF00		  ; 8F 00 FF 01 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	DEC $71			  ; C6 71 | Decrement (zero page)
	CMP $FF26,Y		  ; D9 26 FF | Compare accumulator (absolute,Y)
	STA				  ; 9F 00 BF 00 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $FE00			; 2E 00 FE | Rotate left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_14D
; Address: $E8CC31
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_14D:
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	CMP ($2E),Y		  ; D1 2E | Compare accumulator ((zero page),Y)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	INC				  ; 1A | Increment accumulator
	CMP $EF0E,X		  ; DD 0E EF | Compare accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_14E
; Address: $E8CC50
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_14E:
	JSR $10C1			; 20 C1 10 | Jump to subroutine
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	INC $EC00,X		  ; FE 00 EC | Increment (absolute,X)
	BPL $EC			  ; 10 EC | Branch if positive
	BPL $E0			  ; 10 E0 | Game work RAM access
	BRA $40			  ; 80 40 | Branch always
	ORA $E6			  ; 05 E6 | Logical OR with accumulator (zero page)
	WDM #$03			 ; 42 03 | Reserved instruction
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	INC $10EF			; EE EF 10 | Increment (absolute)
	SBC $00F3,Y		  ; F9 F3 00 | Subtract with carry (absolute,Y)
	ORA $BDE0,Y		  ; 19 E0 BD | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	STA $EF60,X		  ; 9D 60 EF | Update graphics data
	BPL $00			  ; 10 00 | Branch if positive
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STY $FC0F			; 8C 0F FC | Store Y register to absolute address
	STA $808BF0		  ; 8F F0 8B 80 | Update graphics data
	STA $708F70		  ; 8F 70 8F 70 | Update graphics data
	STX $4945			; 8E 45 49 | Store X register to absolute address
	STA $BFBF7F		  ; 8F 7F BF BF | Update graphics data
	SEI				  ; 78 | Set interrupt disable flag
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SBC ($34),Y		  ; F1 34 | Subtract with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($78,X)		  ; 01 78 | Logical OR with accumulator ((zero page,X))
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	STX $8F			  ; 86 8F | Store X register to zero page
	BNE $8F			  ; D0 8F | Branch if not equal
	STA $0E8F0F		  ; 8F 0F 8F 0E | Update graphics data

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_14F
; Address: $E8CD0A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_14F:
	JSR $9F7F			; 20 7F 9F | Jump to subroutine
	BVC $19			  ; 50 19 | Branch if overflow clear
	STZ $20DE,X		  ; 9E DE 20 | Store zero to absolute,X
	STA $708F70		  ; 8F 70 8F 70 | Update graphics data

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_150
; Address: $E8CD17
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_150:
	BEQ $47			  ; F0 47 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $D0			  ; 80 D0 | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_151
; Address: $E8CD1D
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_151:
	JSR $6098			; 20 98 60 | Jump to subroutine
	SBC $77F0,Y		  ; F9 F0 77 | Subtract with carry (absolute,Y)
	STA $0FFF08		  ; 8F 08 FF 0F | Update graphics data
	BEQ $FC			  ; F0 FC | Branch if equal
	BCS $7F			  ; B0 7F | Branch if carry set
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $5F			  ; 30 5F | Branch if negative
	LDY #$5D			 ; A0 5D | Load immediate value into Y register
	LDX #$5E			 ; A2 5E | Load immediate value into X register
	LDA ($E6,X)		  ; A1 E6 | Read graphics status
	STA $DFA0,Y		  ; 99 A0 DF | Update graphics data
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	BNE $FF			  ; D0 FF | Branch if not equal
	BNE $FF			  ; D0 FF | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CMP ($07,X)		  ; C1 07 | Compare accumulator ((zero page,X))
	CMP ($1F,X)		  ; C1 1F | Compare accumulator ((zero page,X))
	SBC $FF39,Y		  ; F9 39 FF | Subtract with carry (absolute,Y)
	DEC $3F			  ; C6 3F | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	ASL $0006,X		  ; 1E 06 00 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FDF2,X		  ; FD F2 FD | Subtract with carry (absolute,X)
	REP #$FC			 ; C2 FC | Reset processor status bits
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	SBC $7F7E,X		  ; FD 7E 7F | Subtract with carry (absolute,X)
	ROL $883F,X		  ; 3E 3F 88 | Rotate left (absolute,X)
	BIT #$1E			 ; 89 1E | Test bits in accumulator (immediate)
	STA $1E			  ; 85 1E | Update graphics data
	EOR #$0E			 ; 49 0E | Exclusive OR with accumulator (immediate)
	EOR #$0E			 ; 49 0E | Exclusive OR with accumulator (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_152
; Address: $E8CDBB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_152:
	STZ $B0			  ; 64 B0 | Store zero to zero page
	CLV				  ; B8 | Clear overflow flag
	BCS $B8			  ; B0 B8 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	CPX #$90			 ; E0 90 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_153
; Address: $E8CDC8
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_153:
	JSR $0838			; 20 38 08 | Jump to subroutine
	PEA #$D62F		   ; F4 2F D6 | Push effective address to stack
	BIT $5D			  ; 24 5D | Test bits in accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	CPY #$09			 ; C0 09 | Compare Y register (immediate)
	BRA $83			  ; 80 83 | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $0F0C			; 0E 0C 0F | Arithmetic shift left (absolute)
	STA $000000		  ; 8F 00 00 00 | Update graphics data
	ORA $0FF1			; 0D F1 0F | Logical OR with accumulator (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $8F			  ; F0 8F | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	STA				  ; 9F 00 81 00 | Update graphics data
	BRA $7F			  ; 80 7F | Branch always
	CLV				  ; B8 | Clear overflow flag
	INC $C5FE,X		  ; FE FE C5 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ROR $0706,X		  ; 7E 06 07 | Rotate right (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROR $0781,X		  ; 7E 81 07 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CMP ($A2,X)		  ; C1 A2 | Compare accumulator ((zero page,X))
	ASL $C0			  ; 06 C0 | Arithmetic shift left (zero page)
	SBC $EE1D,X		  ; FD 1D EE | Subtract with carry (absolute,X)
	ROL $5B79			; 2E 79 5B | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_154
; Address: $E8CE57
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_154:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	ASL $018D			; 0E 8D 01 | Arithmetic shift left (absolute)
	STA ($01,X)		  ; 81 01 | Update graphics data
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $8070			; 8C 70 80 | Store Y register to absolute address
	ROR $FE01,X		  ; 7E 01 FE | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_155
; Address: $E8CE76
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_155:
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA ($40,X)		  ; 81 40 | Update graphics data
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register
	BCS $F0			  ; B0 F0 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BVS $70			  ; 70 70 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BEQ $0F			  ; F0 0F | Branch if equal
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 0F F0 70 | Read graphics status
	STA $BCFF00		  ; 8F 00 FF BC | Update graphics data
	INC $A086,X		  ; FE 86 A0 | Increment (absolute,X)
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC ($C0),Y		  ; F1 C0 | Subtract with carry ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX $04			  ; E4 04 | Compare X register (zero page)
	CPX $04			  ; E4 04 | Compare X register (zero page)
	ROL $E0E7,X		  ; 3E E7 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_156
; Address: $E8CEEC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_156:
	BEQ $FC			  ; F0 FC | Branch if equal
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $30FF			; 2C FF 30 | Test bits in accumulator (absolute)
	BMI $EF			  ; 30 EF | Branch if negative
	BRA $01			  ; 80 01 | Branch always
	BVC $F1			  ; 50 F1 | Branch if overflow clear
	BPL $F1			  ; 10 F1 | Branch if positive
	CPX $C16C			; EC 6C C1 | Compare X register (absolute)
	CMP ($0C,X)		  ; C1 0C | Compare accumulator ((zero page,X))
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	ROR $5E0F,X		  ; 7E 0F 5E | Rotate right (absolute,X)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_157
; Address: $E8CF27
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_157:
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	BVC $01			  ; 50 01 | Branch if overflow clear
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	STA $FE			  ; 85 FE | Update graphics data
	ASL $0939			; 0E 39 09 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	AND ($C0,X)		  ; 21 C0 | Logical AND with accumulator ((zero page,X))
	BEQ $18			  ; F0 18 | Branch if equal
	BVS $FC			  ; 70 FC | Branch if overflow set
	STA				  ; 9F 4C 47 9F | Update graphics data
	STA $000000		  ; 8F 00 00 00 | Update graphics data
	STA $200C8F		  ; 8F 8F 0C 20 | Update graphics data
	STA				  ; 9F 20 4F B0 | Update graphics data
	BEQ $8F			  ; F0 8F | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	STA $FCB1FF		  ; 8F FF B1 FC | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	CMP ($C8,X)		  ; C1 C8 | Compare accumulator ((zero page,X))
	DEC $F8			  ; C6 F8 | Decrement (zero page)
	ROR $E67E,X		  ; 7E 7E E6 | Rotate right (absolute,X)
	INC $FC			  ; E6 FC | Increment (zero page)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROR $E681,X		  ; 7E 81 E6 | Rotate right (absolute,X)
	SBC $FFFC,Y		  ; F9 FC FF | Subtract with carry (absolute,Y)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	SBC #$21			 ; E9 21 | PPU graphics register access
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))
	STZ $FF9E,X		  ; 9E 9E FF | Store zero to absolute,X
	BRA $D8			  ; 80 D8 | Branch always
	ORA ($CE),Y		  ; 11 CE | Logical OR with accumulator ((zero page),Y)
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	STZ $FFFF,X		  ; 9E FF FF | Store zero to absolute,X
	BPL $F7			  ; 10 F7 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ASL $7F27,X		  ; 1E 27 7F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_158
; Address: $E8CFF5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_158:
	JSR $0FF0			; 20 F0 0F | Jump to subroutine
	BEQ $7C			  ; F0 7C | Branch if equal
	STA				  ; 9F FF FF 82 | Update graphics data

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_159
; Address: $E8D005
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_159:
	CPX #$C2			 ; E0 C2 | Compare X register (immediate)
	CPY $FA			  ; C4 FA | Compare Y register (zero page)
	PLY				  ; 7A | Pull Y register from stack
	SEC				  ; 38 | Set carry flag
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX $04			  ; E4 04 | Compare X register (zero page)
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA $FB			  ; 05 FB | Logical OR with accumulator (zero page)
	ROL $F9			  ; 26 F9 | Rotate left (zero page)
	LDA				  ; BF C0 FF 00 | Read graphics status
	SEC				  ; 38 | Set carry flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_15A
; Address: $E8D033
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_15A:
	JSR $0006			; 20 06 00 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	LDA				  ; BF 00 3A C1 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	CMP ($E3,X)		  ; C1 E3 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_15B
; Address: $E8D047
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_15B:
	JSR $20DF			; 20 DF 20 | Jump to subroutine
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	SBC $2401,X		  ; FD 01 24 | Subtract with carry (absolute,X)
	SBC ($A4,X)		  ; E1 A4 | Subtract with carry ((zero page,X))
	SBC ($FC,X)		  ; E1 FC | Subtract with carry ((zero page,X))
	CPY $CC03			; CC 03 CC | Compare Y register (absolute)
	AND ($0E,X)		  ; 21 0E | Logical AND with accumulator ((zero page,X))
	AND ($0E,X)		  ; 21 0E | Logical AND with accumulator ((zero page,X))
	EOR ($1E,X)		  ; 41 1E | Exclusive OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	TSX				  ; BA | Transfer stack pointer to X register
	BMI $3F			  ; 30 3F | Branch if negative
	BMI $DF			  ; 30 DF | Branch if negative
	BNE $DF			  ; D0 DF | Branch if not equal
	BNE $AF			  ; D0 AF | Branch if not equal
	LDY #$2A			 ; A0 2A | Load immediate value into Y register
	LDY $DB			  ; A4 DB | Load from zero page into Y register
	CMP ($EF),Y		  ; D1 EF | Compare accumulator ((zero page),Y)
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	LDY $7FBF,X		  ; BC BF 7F | Load from absolute,X into Y register
	LDA				  ; BF 03 BF C0 | Read graphics status
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_15C
; Address: $E8D09C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_15C:
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	ROL $E5			  ; 26 E5 | Rotate left (zero page)
	ROR $9D			  ; 66 9D | Rotate right (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	STZ $06E1,X		  ; 9E E1 06 | Store zero to absolute,X
	AND $FE85,X		  ; 3D 85 FE | Logical AND with accumulator (absolute,X)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ADC $776B			; 6D 6B 77 | Add with carry (absolute)
	DEC $F9			  ; C6 F9 | Decrement (zero page)
	CMP ($EF),Y		  ; D1 EF | Compare accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	BEQ $43			  ; F0 43 | Branch if equal
	LDY $FF3F,X		  ; BC 3F FF | Load from absolute,X into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_15D
; Address: $E8D0D1
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_15D:
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$C1			 ; C0 C1 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CMP $2CFE,X		  ; DD FE 2C | Compare accumulator (absolute,X)
	INX				  ; E8 | Increment X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	INC $1700,X		  ; FE 00 17 | Increment (absolute,X)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BVS $CC			  ; 70 CC | Branch if overflow set
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	DEC $24			  ; C6 24 | Decrement (zero page)
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	LDY $3C00,X		  ; BC 00 3C | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	PHX				  ; DA | Push X register to stack
	ASL $C9			  ; 06 C9 | Arithmetic shift left (zero page)
	INX				  ; E8 | Increment X register
	LDY $9E51			; AC 51 9E | Load from absolute address into Y register
	EOR ($9E),Y		  ; 51 9E | Exclusive OR with accumulator ((zero page),Y)
	ADC $AE			  ; 65 AE | Add with carry (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_15E
; Address: $E8D132
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_15E:
	BEQ $00			  ; F0 00 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA #$00			 ; A9 00 | Read graphics status
	STA ($7E),Y		  ; 91 7E | Update graphics data
	STA ($7E),Y		  ; 91 7E | Update graphics data
	BNE $3F			  ; D0 3F | Branch if not equal
	BNE $3F			  ; D0 3F | Branch if not equal
	BEQ $BF			  ; F0 BF | Branch if equal
	BMI $7F			  ; 30 7F | Branch if negative
	LDA				  ; BF 00 7F 80 | Read graphics status
	SBC $DD07,Y		  ; F9 07 DD | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_15F
; Address: $E8D165
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_15F:
	JSR $38D5			; 20 D5 38 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $F8			  ; 80 F8 | Branch always
	SED				  ; F8 | Set decimal mode flag
	ORA ($C3,X)		  ; 01 C3 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 00 BF 00 | Read graphics status
	LDA				  ; BF 00 B9 00 | Read graphics status
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC $7E00,X		  ; FD 00 7E | Subtract with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	LDY #$1F			 ; A0 1F | Load immediate value into Y register
	NOP				  ; EA | No operation
	CMP #$81			 ; C9 81 | Compare accumulator (immediate)
	CMP $D881,Y		  ; D9 81 D8 | Compare accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	STX $8E1F			; 8E 1F 8E | Store X register to absolute address
	WDM #$E3			 ; 42 E3 | Reserved instruction
	WDM #$E3			 ; 42 E3 | Reserved instruction
	LDY #$C1			 ; A0 C1 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_160
; Address: $E8D1B7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_160:
	BVS $D3			  ; 70 D3 | Branch if overflow set
	JMP $195C1B		  ; 5C 1B 5C 19 | Jump to address long
	STZ $DF98,X		  ; 9E 98 DF | Store zero to absolute,X
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	CPX $FF			  ; E4 FF | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_161
; Address: $E8D1E0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_161:
	BIT $DF			  ; 24 DF | Test bits in accumulator (zero page)
	JMP ($FCDF)		  ; 6C DF FC | Jump to address (absolute indirect)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($5E,X)		  ; 01 5E | Logical OR with accumulator ((zero page,X))
	LDA ($5E,X)		  ; A1 5E | Read graphics status
	LDA ($4D,X)		  ; A1 4D | Read graphics status

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_163
; Address: $E8D1F6
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_163:
	CLC				  ; 18 | Clear carry flag
	STZ $EC00			; 9C 00 EC | Store zero to absolute
	JMP $E6FC			; 4C FC E6 | Jump to address
	DEX				  ; CA | Decrement X register
	TSX				  ; BA | Transfer stack pointer to X register
	CLD				  ; D8 | Clear decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	INY				  ; C8 | Increment Y register
	STA ($C5,X)		  ; 81 C5 | Update graphics data
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BNE $E0			  ; D0 E0 | Game work RAM access
	CPY $7C			  ; C4 7C | Compare Y register (zero page)
	CPX #$8C			 ; E0 8C | Compare X register (immediate)
	LDA				  ; BF 0E 8D 2F | Read graphics status
	NOP				  ; EA | No operation
	SBC $131D			; ED 1D 13 | Subtract with carry (absolute)
	AND $F323,X		  ; 3D 23 F3 | Logical AND with accumulator (absolute,X)
	CMP ($F7,X)		  ; C1 F7 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BMI $70			  ; 30 70 | Branch if negative
	BRA $C0			  ; 80 C0 | Branch always
	CPX $CC00			; EC 00 CC | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	ASL $8CB1			; 0E B1 8C | Arithmetic shift left (absolute)
	LDX $7E49,Y		  ; BE 49 7E | Load from absolute,Y into X register
	AND ($3E),Y		  ; 31 3E | Logical AND with accumulator ((zero page),Y)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	AND $0D00,Y		  ; 39 00 0D | Logical AND with accumulator (absolute,Y)
	WDM #$0C			 ; 42 0C | Reserved instruction
	STA ($48,X)		  ; 81 48 | Update graphics data
	CMP ($F0,X)		  ; C1 F0 | Compare accumulator ((zero page,X))
	SBC $003C,X		  ; FD 3C 00 | Subtract with carry (absolute,X)
	ASL $1F11			; 0E 11 1F | Arithmetic shift left (absolute)
	PHB				  ; 8B | Push data bank register to stack
	STA $85			  ; 85 85 | Update graphics data
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	PLY				  ; 7A | Pull Y register from stack
	BMI $3F			  ; 30 3F | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_164
; Address: $E8D282
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_164:
	BMI $3F			  ; 30 3F | Branch if negative
	SBC $FDFF,X		  ; FD FF FD | Subtract with carry (absolute,X)
	DEY				  ; 88 | Decrement Y register
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA $708F70		  ; 8F 70 8F 70 | Update graphics data
	BRA $7C			  ; 80 7C | Branch always
	BRA $FB			  ; 80 FB | Branch always
	BRA $FA			  ; 80 FA | Branch always
	STA ($95,X)		  ; 81 95 | Update graphics data
	STX $4945			; 8E 45 49 | Store X register to absolute address
	STA $BB00B9		  ; 8F B9 00 BB | Update graphics data
	INX				  ; E8 | Increment X register
	AND #$E8			 ; 29 E8 | Logical AND with accumulator (immediate)
	AND #$F1			 ; 29 F1 | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	LDY #$1F			 ; A0 1F | Load immediate value into Y register
	AND $DE			  ; 25 DE | Logical AND with accumulator (zero page)
	ORA $FBFE,Y		  ; 19 FE FB | Logical OR with accumulator (absolute,Y)
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $18			  ; 80 18 | Branch always
	BRA $18			  ; 80 18 | Branch always
	BRA $18			  ; 80 18 | Branch always
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	LDY #$C1			 ; A0 C1 | Load immediate value into Y register
	SBC ($61,X)		  ; E1 61 | Subtract with carry ((zero page,X))
	STX $C1			  ; 86 C1 | Store X register to zero page
	ROL $C1			  ; 26 C1 | Rotate left (zero page)
	ROL $6F81			; 2E 81 6F | Rotate left (absolute)
	STA $0F8F51		  ; 8F 51 8F 0F | Update graphics data
	ORA $199E,Y		  ; 19 9E 19 | Logical OR with accumulator (absolute,Y)
	ASL $1807,X		  ; 1E 07 18 | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BPL $6F			  ; 10 6F | Branch if positive
	BPL $5F			  ; 10 5F | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_165
; Address: $E8D2FD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_165:
	JSR $700F			; 20 0F 70 | Jump to subroutine
	CPX $E0F3			; EC F3 E0 | Game work RAM access
	BNE $C1			  ; D0 C1 | Branch if not equal
	AND $7FE7			; 2D E7 7F | Logical AND with accumulator (absolute)
	LDY #$61			 ; A0 61 | Load immediate value into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	CPX #$BE			 ; E0 BE | Compare X register (immediate)
	CMP ($F0,X)		  ; C1 F0 | Compare accumulator ((zero page,X))
	CPX #$CF			 ; E0 CF | Compare X register (immediate)
	CPY #$92			 ; C0 92 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_166
; Address: $E8D318
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_166:
	STZ $C701,X		  ; 9E 01 C7 | Store zero to absolute,X
	DEC $D800			; CE 00 D8 | Decrement (absolute)
	BRA $8C			  ; 80 8C | Branch always
	DEC $F9			  ; C6 F9 | Decrement (zero page)
	LDX #$FD			 ; A2 FD | Load immediate value into X register
	CMP $8FF0,X		  ; DD F0 8F | Compare accumulator (absolute,X)
	STY $3F73			; 8C 73 3F | Store Y register to absolute address
	BRA $1F			  ; 80 1F | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 63 7C | Read graphics status

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_167
; Address: $E8D346
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_167:
	JSR $3B1B			; 20 1B 3B | Jump to subroutine
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY $77			  ; C4 77 | Compare Y register (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	BPL $13			  ; 10 13 | Branch if positive
	CPX $E413			; EC 13 E4 | Compare X register (absolute)
	ORA ($F2,X)		  ; 01 F2 | Logical OR with accumulator ((zero page,X))
	ORA ($E2,X)		  ; 01 E2 | Logical OR with accumulator ((zero page,X))
	ADC ($F0,X)		  ; 61 F0 | Add with carry ((zero page,X))
	BVS $7D			  ; 70 7D | Branch if overflow set
	ORA ($E3),Y		  ; 11 E3 | Logical OR with accumulator ((zero page),Y)
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($6E,X)		  ; 01 6E | Logical OR with accumulator ((zero page,X))
	STA ($02,X)		  ; 81 02 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $718E,X		  ; 7D 8E 71 | Add with carry (absolute,X)
	ADC $5E80,X		  ; 7D 80 5E | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_168
; Address: $E8D388
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_168:
	JSR $F0C4			; 20 C4 F0 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	INC				  ; 1A | Increment accumulator
	LDY $F1			  ; A4 F1 | Load from zero page into Y register
	DEY				  ; 88 | Decrement Y register
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	ASL $0421,X		  ; 1E 21 04 | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	RTI				  ; 40 | Return from interrupt
	LDY $5EB3			; AC B3 5E | Load from absolute address into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $83			  ; 80 83 | Branch always
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_169
; Address: $E8D3C6
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_169:
	SBC ($61,X)		  ; E1 61 | Subtract with carry ((zero page,X))
	STZ $E602,X		  ; 9E 02 E6 | Store zero to absolute,X
	PLX				  ; FA | Pull X register from stack
	ADC ($08,X)		  ; 61 08 | Add with carry ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	STZ $FD00,X		  ; 9E 00 FD | Store zero to absolute,X
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	STZ $FF1C,X		  ; 9E 1C FF | Store zero to absolute,X
	JMP ($DFEC)		  ; 6C EC DF | Jump to address (absolute indirect)
	CPY $0032			; CC 32 00 | Compare Y register (absolute)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	STX $20			  ; 86 20 | Store X register to zero page
	BMI $CF			  ; 30 CF | Branch if negative
	ADC $037F,Y		  ; 79 7F 03 | Add with carry (absolute,Y)
	BVS $E3			  ; 70 E3 | Branch if overflow set
	BRA $FD			  ; 80 FD | Branch always
	STA $0340,Y		  ; 99 40 03 | Update graphics data
	BCC $FC			  ; 90 FC | Branch if carry clear
	STA $009C00		  ; 8F 00 9C 00 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 64 0F FC | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	BRA $33			  ; 80 33 | Branch always
	LDA				  ; BF 00 7F 00 | Read graphics status
	STZ $3EB0			; 9C B0 3E | Store zero to absolute
	BVS $A6			  ; 70 A6 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	ROR $1E9F,X		  ; 7E 9F 1E | Rotate right (absolute,X)
	STX $D437			; 8E 37 D4 | Store X register to absolute address
	BVC $00			  ; 50 00 | Branch if overflow clear
	BCC $00			  ; 90 00 | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	INC $00			  ; E6 00 | Increment (zero page)
	BIT $0B00			; 2C 00 0B | Test bits in accumulator (absolute)
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	BMI $0F			  ; 30 0F | Branch if negative
	JMP ($6C13)		  ; 6C 13 6C | Jump to address (absolute indirect)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPY $9F00			; CC 00 9F | Compare Y register (absolute)
	SEC				  ; 38 | Set carry flag
	BEQ $20			  ; F0 20 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 7F BC 7F | Read graphics status
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_16A
; Address: $E8D490
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_16A:
	STA $00FF70		  ; 8F 70 FF 00 | Update graphics data
	EOR #$8F			 ; 49 8F | Exclusive OR with accumulator (immediate)
	LDA				  ; BF 7F BF BF | Read graphics status
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SBC $F9C7,X		  ; FD C7 F9 | Subtract with carry (absolute,X)
	ASL $1EF3			; 0E F3 1E | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	STA $8F0F8F		  ; 8F 8F 0F 8F | Update graphics data
	STA $010F0F		  ; 8F 0F 0F 01 | Update graphics data
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	AND ($7F,X)		  ; 21 7F | Logical AND with accumulator ((zero page,X))
	AND ($7F,X)		  ; 21 7F | Logical AND with accumulator ((zero page,X))
	STA $708F70		  ; 8F 70 8F 70 | Update graphics data
	STA $F00F70		  ; 8F 70 0F F0 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $9F			  ; 80 9F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_16B
; Address: $E8D502
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_16B:
	CMP $3A			  ; C5 3A | Compare accumulator (zero page)
	SBC #$7F			 ; E9 7F | Subtract with carry (immediate)
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BRA $69			  ; 80 69 | Branch always
	BRA $41			  ; 80 41 | Branch always
	BEQ $80			  ; F0 80 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $EE			  ; 80 EE | Branch always
	ORA ($E6),Y		  ; 11 E6 | Logical OR with accumulator ((zero page),Y)
	ORA $8D73,Y		  ; 19 73 8D | Logical OR with accumulator (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_16C
; Address: $E8D528
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_16C:
	SBC #$13			 ; E9 13 | Subtract with carry (immediate)
	CMP ($23,X)		  ; C1 23 | Compare accumulator ((zero page,X))
	ADC ($A2),Y		  ; 71 A2 | Add with carry ((zero page),Y)
	SBC ($9F),Y		  ; F1 9F | Subtract with carry ((zero page),Y)
	STA $1CEF2C		  ; 8F 2C EF 1C | Update graphics data
	CPY #$9C			 ; C0 9C | Compare Y register (immediate)
	CPY #$9C			 ; C0 9C | Compare Y register (immediate)
	STA $60F9,Y		  ; 99 F9 60 | Update graphics data
	LDX #$58			 ; A2 58 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_16D
; Address: $E8D549
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_16D:
	CLV				  ; B8 | Clear overflow flag
	INX				  ; E8 | Increment X register
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$E3			 ; E0 E3 | Compare X register (immediate)
	STZ $9CE3			; 9C E3 9C | Store zero to absolute
	DEC $80			  ; C6 80 | Decrement (zero page)
	CMP $C702,X		  ; DD 02 C7 | Compare accumulator (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX #$ED			 ; E0 ED | Compare X register (immediate)
	SBC $FEEC,X		  ; FD EC FE | Subtract with carry (absolute,X)
	STZ $7EF3			; 9C F3 7E | Store zero to absolute
	SBC ($0F,X)		  ; E1 0F | Subtract with carry ((zero page,X))
	BVS $0F			  ; 70 0F | Branch if overflow set
	BVS $83			  ; 70 83 | Branch if overflow set
	JMP ($9E61)		  ; 6C 61 9E | Jump to address (absolute indirect)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $9E			  ; 80 9E | Branch always
	STZ $1F00,X		  ; 9E 00 1F | Store zero to absolute,X
	BPL $6F			  ; 10 6F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	REP #$0C			 ; C2 0C | Reset processor status bits
	TSX				  ; BA | Transfer stack pointer to X register
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_16E
; Address: $E8D591
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_16E:
	JSR $30C6			; 20 C6 30 | Jump to subroutine
	ROR $3A90			; 6E 90 3A | Rotate right (absolute)
	RTI				  ; 40 | Return from interrupt
	ASL $0A20,X		  ; 1E 20 0A | Arithmetic shift left (absolute,X)
	STX $38			  ; 86 38 | Store X register to zero page
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	STZ $474C,X		  ; 9E 4C 47 | Store zero to absolute,X
	STA				  ; 9F 03 4F 02 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	STA $210C8F		  ; 8F 8F 0C 21 | PPU graphics register access
	STA				  ; 9F 20 4F B0 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STY $0073			; 8C 73 00 | Store Y register to absolute address
	STA $9090FF		  ; 8F FF 90 90 | Update graphics data
	BRA $F8			  ; 80 F8 | Branch always
	CPX $1C6C			; EC 6C 1C | Compare X register (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_16F
; Address: $E8D5CE
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_16F:
	BCC $F0			  ; 90 F0 | Branch if carry clear
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	ROR $C61F			; 6E 1F C6 | Rotate right (absolute)
	ASL $6100,X		  ; 1E 00 61 | Arithmetic shift left (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $FE00			; 8D 00 FE | Update graphics data
	LDA				  ; BF AF 6F 39 | Read graphics status
	LDA $BC0C,Y		  ; B9 0C BC | Read graphics status
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $CFC7,X		  ; 9E C7 CF | Store zero to absolute,X
	SED				  ; F8 | Set decimal mode flag
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	DEC $40			  ; C6 40 | Decrement (zero page)
	RTI				  ; 40 | Return from interrupt
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	LDY #$F4			 ; A0 F4 | Load immediate value into Y register
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	REP #$DE			 ; C2 DE | Reset processor status bits
	SBC ($04,X)		  ; E1 04 | Subtract with carry ((zero page,X))
	JMP ($CCDC)		  ; 6C DC CC | Jump to address (absolute indirect)
	STA ($4E,X)		  ; 81 4E | Update graphics data
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	LSR $8F30			; 4E 30 8F | Logical shift right (absolute)
	BEQ $8B			  ; F0 8B | Branch if equal
	CPY #$8B			 ; C0 8B | Compare Y register (immediate)
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	JMP $CC0E			; 4C 0E CC | Jump to address
	STA $030F03		  ; 8F 03 0F 03 | Update graphics data
	EOR $CDB1			; 4D B1 CD | Exclusive OR with accumulator (absolute)
	AND ($8F),Y		  ; 31 8F | Logical AND with accumulator ((zero page),Y)
	BVS $0F			  ; 70 0F | Branch if overflow set
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $80			  ; F0 80 | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_170
; Address: $E8D668
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_170:
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	LDA				  ; BF 80 7F 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_171
; Address: $E8D67D
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_171:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $7C01,X		  ; FE 01 7C | Increment (absolute,X)
	ORA ($78,X)		  ; 01 78 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CMP ($A2,X)		  ; C1 A2 | Compare accumulator ((zero page,X))
	ASL $A2			  ; 06 A2 | Arithmetic shift left (zero page)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	INC $FE82,X		  ; FE 82 FE | Increment (absolute,X)
	STX $FD			  ; 86 FD | Store X register to zero page
	SBC $EE1D,X		  ; FD 1D EE | Subtract with carry (absolute,X)
	ROL $5B79			; 2E 79 5B | Rotate left (absolute)
	ADC $9F5B,Y		  ; 79 5B 9F | Add with carry (absolute,Y)
	BVC $19			  ; 50 19 | Branch if overflow clear
	STZ $9B1C,X		  ; 9E 1C 9B | Store zero to absolute,X
	ASL $0C8D			; 0E 8D 0C | Arithmetic shift left (absolute)
	STA $018100		  ; 8F 00 81 01 | Update graphics data
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_172
; Address: $E8D6B1
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_172:
	JSR $6098			; 20 98 60 | Jump to subroutine
	STA $8D60,Y		  ; 99 60 8D | Update graphics data
	BVS $8F			  ; 70 8F | Branch if overflow set
	BVS $81			  ; 70 81 | Branch if overflow set
	ROR $FE01,X		  ; 7E 01 FE | Rotate right (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FCFD,X		  ; FE FD FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $97FE,Y		  ; F9 FE 97 | Subtract with carry (absolute,Y)
	DEX				  ; CA | Decrement X register
	ROL $5827,X		  ; 3E 27 58 | Rotate left (absolute,X)
	CPX $FFFF			; EC FF FF | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $D3			  ; E6 D3 | Increment (zero page)
	BNE $FF			  ; D0 FF | Branch if not equal
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	BEQ $84			  ; F0 84 | Branch if equal
	INX				  ; E8 | Increment X register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	CPY #$C1			 ; C0 C1 | Compare Y register (immediate)
	CPY #$C4			 ; C0 C4 | Compare Y register (immediate)
	BRA $C7			  ; 80 C7 | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_173
; Address: $E8D71B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_173:
	BRA $FF			  ; 80 FF | Branch always
	BRA $EF			  ; 80 EF | Branch always
	BRA $80			  ; 80 80 | Branch always
	STA $FD			  ; 85 FD | Update graphics data
	ASL $7C			  ; 06 7C | Arithmetic shift left (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_174
; Address: $E8D729
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_174:
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	BEQ $98			  ; F0 98 | Branch if equal
	BEQ $7C			  ; F0 7C | Branch if equal
	INC $C800,X		  ; FE 00 C8 | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ASL $1B00			; 0E 00 1B | Arithmetic shift left (absolute)
	BIT $C5			  ; 24 C5 | Test bits in accumulator (zero page)
	ASL $42			  ; 06 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_175
; Address: $E8D74E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_175:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	SBC $FC00,Y		  ; F9 00 FC | Subtract with carry (absolute,Y)
	BRA $A0			  ; 80 A0 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	INC				  ; 1A | Increment accumulator
	ROR $7EF1,X		  ; 7E F1 7E | Rotate right (absolute,X)
	STA $431C,X		  ; 9D 1C 43 | Update graphics data
	BRA $3F			  ; 80 3F | Branch always
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	STA ($00,X)		  ; 81 00 | Update graphics data
	BRA $FC			  ; 80 FC | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_176
; Address: $E8D787
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_176:
	ADC ($04,X)		  ; 61 04 | Add with carry ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ROR $EC7E,X		  ; 7E 7E EC | Rotate right (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ROR $E2FF,X		  ; 7E FF E2 | Rotate right (absolute,X)
	SBC $E0E0,Y		  ; F9 E0 E0 | Game work RAM access
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	CPX $E0			  ; E4 E0 | Game work RAM access
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_177
; Address: $E8D7C6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_177:
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	BRA $7C			  ; 80 7C | Branch always
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	ORA $83E7,Y		  ; 19 E7 83 | Logical OR with accumulator (absolute,Y)
	STA $006000		  ; 8F 00 60 00 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_178
; Address: $E8D7EA
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_178:
	SEI				  ; 78 | Set interrupt disable flag
	ROR $FE70,X		  ; 7E 70 FE | Rotate right (absolute,X)
	ORA $F00F,Y		  ; 19 0F F0 | Logical OR with accumulator (absolute,Y)
	BEQ $8F			  ; F0 8F | Branch if equal
	BVS $60			  ; 70 60 | Branch if overflow set
	STA				  ; 9F 60 9F 7E | Update graphics data
	STA ($FE,X)		  ; 81 FE | Update graphics data
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	CMP $F8			  ; C5 F8 | Compare accumulator (zero page)
	CMP $F8			  ; C5 F8 | Compare accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $7E78,X		  ; 7E 78 7E | Rotate right (absolute,X)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ROR $7E81,X		  ; 7E 81 7E | Rotate right (absolute,X)
	STA ($07,X)		  ; 81 07 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_179
; Address: $E8D833
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_179:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$67			 ; C0 67 | Compare Y register (immediate)
	BRA $F4			  ; 80 F4 | Branch always
	NOP				  ; EA | No operation
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	SBC ($E5,X)		  ; E1 E5 | Subtract with carry ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_17A
; Address: $E8D87B
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_17A:
	BNE $E0			  ; D0 E0 | Game work RAM access
	CPY $7C			  ; C4 7C | Compare Y register (zero page)
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	LDA				  ; BF 0E 89 2F | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	CPX $131D			; EC 1D 13 | Compare X register (absolute)
	AND $F323,X		  ; 3D 23 F3 | Logical AND with accumulator (absolute,X)
	CMP ($F7,X)		  ; C1 F7 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BMI $70			  ; 30 70 | Branch if negative
	BRA $C0			  ; 80 C0 | Branch always
	CPX $CC00			; EC 00 CC | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $FE09,X		  ; BD 09 FE | Read graphics status
	ADC $87F6,X		  ; 7D F6 87 | Add with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	STA $FA			  ; 85 FA | Update graphics data
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $FA			  ; 80 FA | Branch always
	BRA $FE			  ; 80 FE | Branch always
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ASL $63			  ; 06 63 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	JMP $986800		  ; 5C 00 68 98 | Jump to address long
	DEC				  ; 3A | Decrement accumulator
	DEC $1A			  ; C6 1A | Decrement (zero page)
	CPX $8E			  ; E4 8E | Compare X register (zero page)
	SBC ($5B),Y		  ; F1 5B | Subtract with carry ((zero page),Y)
	CPX $01			  ; E4 01 | Compare X register (zero page)
	LDX $9F16,Y		  ; BE 16 9F | Load from absolute,Y into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SEC				  ; 38 | Set carry flag
	ASL $1FF1			; 0E F1 1F | Arithmetic shift left (absolute)
	PHB				  ; 8B | Push data bank register to stack
	STA $85			  ; 85 85 | Update graphics data
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_17C
; Address: $E8D92E
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_17C:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BCS $00			  ; B0 00 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	BCC $00			  ; 90 00 | Branch if carry clear
	ORA $273F			; 0D 3F 27 | Logical OR with accumulator (absolute)
	LDY $16FD,X		  ; BC FD 16 | Load from absolute,X into Y register
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	STZ $451E,X		  ; 9E 1E 45 | Store zero to absolute,X
	STA $30			  ; 85 30 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	CLC				  ; 18 | Clear carry flag
	CLV				  ; B8 | Clear overflow flag
	CPY $19FC			; CC FC 19 | Compare Y register (absolute)
	PLY				  ; 7A | Pull Y register from stack
	PLP				  ; 28 | Pull processor status from stack
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	STA $00EF08		  ; 8F 08 EF 00 | Update graphics data
	STA $00			  ; 85 00 | Update graphics data
	BCC $00			  ; 90 00 | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	REP #$63			 ; C2 63 | Reset processor status bits
	BNE $71			  ; D0 71 | Branch if not equal
	CPX $5D			  ; E4 5D | Compare X register (zero page)
	LDY $5D			  ; A4 5D | Load from zero page into Y register
	DEC $D66F			; CE 6F D6 | Decrement (absolute)
	ROR $5C00,X		  ; 7E 00 5C | Rotate right (absolute,X)
	STA $8F00,X		  ; 9D 00 8F | Update graphics data
	STA ($00),Y		  ; 91 00 | Update graphics data
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY #$8E			 ; C0 8E | Compare Y register (immediate)
	ADC ($86),Y		  ; 71 86 | Add with carry ((zero page),Y)
	ADC $7B85,Y		  ; 79 85 7B | Add with carry (absolute,Y)
	CPY $4281			; CC 81 42 | Hardware register operation
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	AND $8D00,X		  ; 3D 00 8D | Logical AND with accumulator (absolute,X)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	CMP ($80),Y		  ; D1 80 | Compare accumulator ((zero page),Y)
	STY $E18C			; 8C 8C E1 | Store Y register to absolute address
	BRA $BA			  ; 80 BA | Branch always
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_17D
; Address: $E8D9E4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_17D:
	PHY				  ; 5A | Push Y register to stack
	BRA $D2			  ; 80 D2 | Branch always
	WDM #$F1			 ; 42 F1 | Reserved instruction
	ORA ($58,X)		  ; 01 58 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	LDA $FE00,X		  ; BD 00 FE | Read graphics status
	TYA				  ; 98 | Transfer Y register to accumulator
	AND ($40),Y		  ; 31 40 | Logical AND with accumulator ((zero page),Y)
	LDA ($67),Y		  ; B1 67 | Read graphics status
	BNE $F0			  ; D0 F0 | Branch if not equal
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_17F
; Address: $E8DA2B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_17F:
	BMI $6D			  ; 30 6D | Branch if negative
	BNE $F0			  ; D0 F0 | Branch if not equal
	BRA $40			  ; 80 40 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	INY				  ; C8 | Increment Y register
	BNE $64			  ; D0 64 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_180
; Address: $E8DA5C
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_180:
	JSR $9000			; 20 00 90 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	TSX				  ; BA | Transfer stack pointer to X register
	STZ $00			  ; 64 00 | Store zero to zero page
	STZ $00			  ; 64 00 | Store zero to zero page
	STY $9C00			; 8C 00 9C | Store Y register to absolute address
	SEC				  ; 38 | Set carry flag
	ADC $FF00,X		  ; 7D 00 FF | Add with carry (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA ($00,X)		  ; 81 00 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	INC $E9FF,X		  ; FE FF E9 | Increment (absolute,X)
	ROL $003E			; 2E 3E 00 | Rotate left (absolute)
	CLC				  ; 18 | Clear carry flag
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	ROL $0000			; 2E 00 00 | Rotate left (absolute)
	LDX $5F			  ; A6 5F | Load from zero page into X register
	LDA				  ; BF DE FE 4E | Read graphics status
	INC $FE0E,X		  ; FE 0E FE | Increment (absolute,X)
	INC $D6			  ; E6 D6 | Increment (zero page)
	AND ($4A),Y		  ; 31 4A | Logical AND with accumulator ((zero page),Y)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_181
; Address: $E8DAD2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_181:
	JSR $2100			; 20 00 21 | PPU graphics register access
	AND ($40,X)		  ; 21 40 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA #$C0			 ; 09 C0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_182
; Address: $E8DADC
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_182:
	STY $80			  ; 84 80 | Store Y register to zero page
	BVS $81			  ; 70 81 | Branch if overflow set
	STZ $8773			; 9C 73 87 | Store zero to absolute
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SBC $9F6E,X		  ; FD 6E 9F | Subtract with carry (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $A8			  ; 80 A8 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	ROR $536E			; 6E 6E 53 | Rotate right (absolute)
	STZ $05BE,X		  ; 9E BE 05 | Store zero to absolute,X
	STA $30			  ; 85 30 | Update graphics data
	STA ($00),Y		  ; 91 00 | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	SED				  ; F8 | Set decimal mode flag
	ORA $AF			  ; 05 AF | Logical OR with accumulator (zero page)
	AND $066F			; 2D 6F 06 | Logical AND with accumulator (absolute)
	STA $FFEF08		  ; 8F 08 EF FF | Update graphics data
	PLX				  ; FA | Pull X register from stack
	BNE $00			  ; D0 00 | Branch if not equal
	BCC $00			  ; 90 00 | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_183
; Address: $E8DB40
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_183:
	JSR $40E1			; 20 E1 40 | Jump to subroutine
	DEC $DF3E,X		  ; DE 3E DF | Decrement (absolute,X)
	CPX $F1EE			; EC EE F1 | Compare X register (absolute)
	ASL $2101,X		  ; 1E 01 21 | PPU graphics register access
	ASL $00C0,X		  ; 1E C0 00 | Arithmetic shift left (absolute,X)
	SEP #$00			 ; E2 00 | Set processor status bits
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_184
; Address: $E8DB60
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_184:
	JSR $40E0			; 20 E0 40 | Jump to subroutine
	STA ($79,X)		  ; 81 79 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_185
; Address: $E8DB68
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_185:
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	LDY $5F			  ; A4 5F | Load from zero page into Y register
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	AND #$16			 ; 29 16 | Logical AND with accumulator (immediate)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_186
; Address: $E8DB7D
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_186:
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	INC $9DFC			; EE FC 9D | Increment (absolute)
	ROR $4FE1,X		  ; 7E E1 4F | Rotate right (absolute,X)
	BVS $0F			  ; 70 0F | Branch if overflow set
	BEQ $83			  ; F0 83 | Branch if equal
	JMP ($9E61)		  ; 6C 61 9E | Jump to address (absolute indirect)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $9E			  ; 80 9E | Branch always
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	BPL $6F			  ; 10 6F | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $E0			  ; 30 E0 | Game work RAM access
	BMI $E0			  ; 30 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_187
; Address: $E8DBB8
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_187:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	BIT $A0			  ; 24 A0 | Test bits in accumulator (zero page)
	ORA ($E2,X)		  ; 01 E2 | Logical OR with accumulator ((zero page,X))
	EOR $A6			  ; 45 A6 | Exclusive OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	JMP $27D8A3		  ; 5C A3 D8 27 | Jump to address long
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STZ $9D00			; 9C 00 9D | Store zero to absolute
	STA $C100,Y		  ; 99 00 C1 | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $83			  ; 80 83 | Branch always
	PHB				  ; 8B | Push data bank register to stack
	SBC ($61,X)		  ; E1 61 | Subtract with carry ((zero page,X))
	CMP ($1C,X)		  ; C1 1C | Compare accumulator ((zero page,X))
	PEA #$5E1F		   ; F4 1F 5E | Push effective address to stack
	BRA $00			  ; 80 00 | Branch always
	STZ $E300,X		  ; 9E 00 E3 | Store zero to absolute,X
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CPX #$D7			 ; E0 D7 | Compare X register (immediate)
	DEC $1F2F			; CE 2F 1F | Decrement (absolute)
	STA				  ; 9F D9 DF AF | Update graphics data
	INC $0007,X		  ; FE 07 00 | Increment (absolute,X)
	ORA $1F00			; 0D 00 1F | Logical OR with accumulator (absolute)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_189
; Address: $E8DC1C
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_189:
	JSR $0100			; 20 00 01 | Jump to subroutine
	CPX #$A3			 ; E0 A3 | Compare X register (immediate)
	DEC $A6			  ; C6 A6 | Decrement (zero page)
	SBC ($A9,X)		  ; E1 A9 | Subtract with carry ((zero page,X))
	LDA				  ; BF FE E1 FF | Read graphics status
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $CC			  ; F0 CC | Branch if equal
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	CMP $D680,Y		  ; D9 80 D6 | Compare accumulator (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	INC $FFE0,X		  ; FE E0 FF | Increment (absolute,X)
	BEQ $7E			  ; F0 7E | Branch if equal
	STX $07			  ; 86 07 | Store X register to zero page
	ROR $D1C0,X		  ; 7E C0 D1 | Rotate right (absolute,X)
	ROR $61			  ; 66 61 | Rotate right (zero page)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ROL $9800			; 2E 00 98 | Rotate left (absolute)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $0001			; 0E 01 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_18A
; Address: $E8DC87
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_18A:
	JSR $4100			; 20 00 41 | Jump to subroutine
	INC $3880,X		  ; FE 80 38 | Increment (absolute,X)
	ROL $B801,X		  ; 3E 01 B8 | Rotate left (absolute,X)
	STA ($7E,X)		  ; 81 7E | Update graphics data
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	ASL $00EF			; 0E EF 00 | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	AND ($C0,X)		  ; 21 C0 | Logical AND with accumulator ((zero page,X))
	ORA ($E0),Y		  ; 11 E0 | Game work RAM access
	SBC $F110			; ED 10 F1 | Subtract with carry (absolute)
	ASL $26DB			; 0E DB 26 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_18F
; Address: $E8DCCD
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_18F:
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	STA ($00,X)		  ; 81 00 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $30			  ; 80 30 | Branch always
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$BF			 ; 89 BF | Test bits in accumulator (immediate)
	LDY $16FD,X		  ; BC FD 16 | Load from absolute,X into Y register
	SBC ($7F),Y		  ; F1 7F | Subtract with carry ((zero page),Y)
	STZ $451E,X		  ; 9E 1E 45 | Store zero to absolute,X
	ORA $70			  ; 05 70 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	SED				  ; F8 | Set decimal mode flag
	LDY $FCCC,X		  ; BC CC FC | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	PLY				  ; 7A | Pull Y register from stack
	PLP				  ; 28 | Pull processor status from stack
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	STA $07EE09		  ; 8F 09 EE 07 | Update graphics data
	STY $00			  ; 84 00 | Store Y register to zero page
	BCC $00			  ; 90 00 | Branch if carry clear
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	SBC $E7E7,Y		  ; F9 E7 E7 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_190
; Address: $E8DD48
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_190:
	DEC $FE			  ; C6 FE | Decrement (zero page)
	DEC $E7DF,X		  ; DE DF E7 | Decrement (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	CMP ($D0,X)		  ; C1 D0 | Compare accumulator ((zero page,X))
	CPX #$C4			 ; E0 C4 | Compare X register (immediate)
	BVS $E0			  ; 70 E0 | Game work RAM access
	ROR $F9			  ; 66 F9 | Rotate right (zero page)
	BVS $8D			  ; 70 8D | Branch if overflow set
	JMP $2E73			; 4C 73 2E | Jump to address
	CMP ($E3),Y		  ; D1 E3 | Compare accumulator ((zero page),Y)
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	BRA $9F			  ; 80 9F | Branch always
	STZ $9C00			; 9C 00 9C | Store zero to absolute
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	BPL $6F			  ; 10 6F | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_191
; Address: $E8DD81
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_191:
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $70			  ; 10 70 | Branch if positive
	BCS $70			  ; B0 70 | Branch if carry set
	BCC $60			  ; 90 60 | Branch if carry clear
	BRA $B0			  ; 80 B0 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_193
; Address: $E8DD92
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_193:
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_194
; Address: $E8DD9A
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_194:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	LDA $BF79,Y		  ; B9 79 BF | Read graphics status
	DEC $3F			  ; C6 3F | Decrement (zero page)
	ROL $60E7,X		  ; 3E E7 60 | Rotate left (absolute,X)
	LDX $F801,Y		  ; BE 01 F8 | Load from absolute,Y into X register
	ASL $46			  ; 06 46 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	INC $C2FD,X		  ; FE FD C2 | Increment (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	SBC $FB03,X		  ; FD 03 FB | Subtract with carry (absolute,X)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_195
; Address: $E8DDD4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_195:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC ($8E),Y		  ; 71 8E | Add with carry ((zero page),Y)
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	JMP $F0FF			; 4C FF F0 | Jump to address
	SBC ($E2,X)		  ; E1 E2 | Subtract with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1C00			; 0D 00 1C | Logical OR with accumulator (absolute)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_196
; Address: $E8DE02
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_196:
	ASL $E4			  ; 06 E4 | Arithmetic shift left (zero page)
	CPY $0B			  ; C4 0B | Compare Y register (zero page)
	CPY $F867			; CC 67 F8 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	PEA #$EE6B		   ; F4 6B EE | Push effective address to stack
	ASL $1A00,X		  ; 1E 00 1A | Arithmetic shift left (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	STA ($00),Y		  ; 91 00 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	LDY #$7E			 ; A0 7E | Load immediate value into Y register
	PLX				  ; FA | Pull X register from stack
	ADC $23DC,X		  ; 7D DC 23 | Add with carry (absolute,X)
	ROL $7EC1,X		  ; 3E C1 7E | Rotate left (absolute,X)
	STA ($5C,X)		  ; 81 5C | Update graphics data
	ORA $00FF,Y		  ; 19 FF 00 | Logical OR with accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $8700,X		  ; 1D 00 87 | Logical OR with accumulator (absolute,X)
	PLX				  ; FA | Pull X register from stack
	INC $00			  ; E6 00 | Increment (zero page)
	ASL $0720,X		  ; 1E 20 07 | Arithmetic shift left (absolute,X)
	ASL $5811			; 0E 11 58 | Arithmetic shift left (absolute)
	LDA				  ; BF 61 9E 23 | Read graphics status
	STY $3EF3			; 8C F3 3E | Store Y register to absolute address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $FE36			; 2D 36 FE | Logical AND with accumulator (absolute)
	STA $000000		  ; 8F 00 00 00 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $4100,X		  ; 3E 00 41 | Rotate left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	AND $01C7,Y		  ; 39 C7 01 | Logical AND with accumulator (absolute,Y)
	ROR $F9			  ; 66 F9 | Rotate right (zero page)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_197
; Address: $E8DEB2
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_197:
	CLV				  ; B8 | Clear overflow flag
	BRA $00			  ; 80 00 | Branch always
	STX $20			  ; 86 20 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	SEC				  ; 38 | Set carry flag
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	CPY #$FD			 ; C0 FD | Compare Y register (immediate)
	CMP ($E3,X)		  ; C1 E3 | Compare accumulator ((zero page,X))
	ORA $21DF,X		  ; 1D DF 21 | PPU graphics register access
	ASL $3EE1,X		  ; 1E E1 3E | Arithmetic shift left (absolute,X)
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	SBC $E3FE,Y		  ; F9 FE E3 | Subtract with carry (absolute,Y)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	JMP ($76BF)		  ; 6C BF 76 | Jump to address (absolute indirect)
	SBC $FF60,Y		  ; F9 60 FF | Subtract with carry (absolute,Y)
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $FA			  ; 65 FA | Add with carry (zero page)
	PLX				  ; FA | Pull X register from stack
	SBC $7F7A,X		  ; FD 7A 7F | Subtract with carry (absolute,X)
	BVS $7F			  ; 70 7F | Branch if overflow set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_198
; Address: $E8DF0C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_198:
	STY $DD52			; 8C 52 DD | Store Y register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $02			  ; 84 02 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	BCC $03			  ; 90 03 | Branch if carry clear
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	ASL $C481			; 0E 81 C4 | Arithmetic shift left (absolute)
	BVC $AF			  ; 50 AF | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	XBA				  ; EB | Exchange accumulator bytes
	AND ($FE,X)		  ; 21 FE | Logical AND with accumulator ((zero page,X))
	ORA #$72			 ; 09 72 | Logical OR with accumulator (immediate)
	AND $0066,Y		  ; 39 66 00 | Logical AND with accumulator (absolute,Y)
	STZ $7200,X		  ; 9E 00 72 | Store zero to absolute,X
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_199
; Address: $E8DF42
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_199:
	JSR $02DF			; 20 DF 02 | Jump to subroutine
	SBC $F2CD,X		  ; FD CD F2 | Subtract with carry (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	LDY #$58			 ; A0 58 | Load immediate value into Y register
	STZ $00			  ; 64 00 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_19A
; Address: $E8DF52
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_19A:
	CPX $CF00			; EC 00 CF | Compare X register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $0011			; 0E 11 00 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	LDA $BA			  ; A5 BA | Read graphics status
	ROR $6A			  ; 66 6A | Rotate right (zero page)
	ROR $FF00			; 6E 00 FF | Rotate right (absolute)
	DEY				  ; 88 | Decrement Y register
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	JMP $9100			; 4C 00 91 | Jump to address
	INC $7700,X		  ; FE 00 77 | Increment (absolute,X)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	SBC $D507,Y		  ; F9 07 D5 | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BRA $FA			  ; 80 FA | Branch always
	CMP ($55,X)		  ; C1 55 | Compare accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($43,X)		  ; 01 43 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 00 BF 00 | Read graphics status
	LDA $BB00,Y		  ; B9 00 BB | Read graphics status
	PEA #$E804		   ; F4 04 E8 | Push effective address to stack
	AND #$3E			 ; 29 3E | Logical AND with accumulator (immediate)
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	LDA $5C02,X		  ; BD 02 5C | Read graphics status

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_19B
; Address: $E8DFCE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_19B:
	JSR $03DF			; 20 DF 03 | Jump to subroutine
	SEP #$02			 ; E2 02 | Set processor status bits
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	CMP ($40,X)		  ; C1 40 | Compare accumulator ((zero page,X))
	STA ($80,X)		  ; 81 80 | Update graphics data
	ORA ($82,X)		  ; 01 82 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_19C
; Address: $E8E00E
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_19C:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $4E00			; 2C 00 4E | Test bits in accumulator (absolute)
	CMP $89			  ; C5 89 | Compare accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SBC ($34),Y		  ; F1 34 | Subtract with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	BRA $3F			  ; 80 3F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $3F			  ; 80 3F | Branch always
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA ($79,X)		  ; 01 79 | Logical OR with accumulator ((zero page,X))
	STX $00			  ; 86 00 | Store X register to zero page
	BRA $00			  ; 80 00 | Branch always
	STY $90F0			; 8C F0 90 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_19D
; Address: $E8E06C
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_19D:
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	AND $4039,Y		  ; 39 39 40 | Logical AND with accumulator (absolute,Y)
	LSR $40			  ; 46 40 | Logical shift right (zero page)
	RTI				  ; 40 | Return from interrupt
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $3C06,Y		  ; 39 06 3C | Logical AND with accumulator (absolute,Y)
	LDA				  ; BF 38 80 00 | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CPX #$91			 ; E0 91 | Compare X register (immediate)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	BRA $C7			  ; 80 C7 | Branch always
	ROR $D201			; 6E 01 D2 | Rotate right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C1			 ; C0 C1 | Compare Y register (immediate)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $38			  ; 06 38 | Arithmetic shift left (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_19E
; Address: $E8E0DF
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_19E:
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	BMI $5C			  ; 30 5C | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_19F
; Address: $E8E0E7
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_19F:
	JSR $007C			; 20 7C 00 | Jump to subroutine
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BNE $20			  ; D0 20 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPX $E0			  ; E4 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	DEY				  ; 88 | Decrement Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	CLV				  ; B8 | Clear overflow flag
	INC $C5FE,X		  ; FE FE C5 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ROR $0706,X		  ; 7E 06 07 | Rotate right (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROR $0781,X		  ; 7E 81 07 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CMP ($A2,X)		  ; C1 A2 | Compare accumulator ((zero page,X))
	ASL $C1			  ; 06 C1 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $EE1D,X		  ; FD 1D EE | Subtract with carry (absolute,X)
	ROL $5B79			; 2E 79 5B | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1A0
; Address: $E8E157
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1A0:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $7C3B			; 0D 3B 7C | Logical OR with accumulator (absolute)
	LDA				  ; BF 00 A3 01 | Read graphics status
	INC $FC02,X		  ; FE 02 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $40			  ; 80 40 | Branch always
	JMP $10F022		  ; 5C 22 F0 10 | Jump to address long
	STA $BF83			; 8D 83 BF | Update graphics data
	EOR ($CF,X)		  ; 41 CF | Exclusive OR with accumulator ((zero page,X))
	ORA $FD			  ; 05 FD | Logical OR with accumulator (zero page)
	STY $9E7C			; 8C 7C 9E | Store Y register to absolute address
	ADC ($0F,X)		  ; 61 0F | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BMI $0E			  ; 30 0E | Branch if negative
	CPY $97F0			; CC F0 97 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1A1
; Address: $E8E1A3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1A1:
	SBC $8582,Y		  ; F9 82 85 | Subtract with carry (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	CMP $09			  ; C5 09 | Compare accumulator (zero page)
	CPY $BB			  ; C4 BB | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1A3
; Address: $E8E1B6
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1A3:
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT $B52B			; 2C 2B B5 | Test bits in accumulator (absolute)
	INC $F1FF,X		  ; FE FF F1 | Increment (absolute,X)
	INC $FF4A,X		  ; FE 4A FF | Increment (absolute,X)
	STX $E47F			; 8E 7F E4 | Store X register to absolute address
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $14			  ; 80 14 | Branch always
	BRA $00			  ; 80 00 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	ROL $1FC1,X		  ; 3E C1 1F | Rotate left (absolute,X)
	CPX #$2F			 ; E0 2F | Compare X register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	LDX $00			  ; A6 00 | Load from zero page into X register
	INC $00			  ; E6 00 | Increment (zero page)
	ORA $D000			; 0D 00 D0 | Logical OR with accumulator (absolute)
	INC $9668			; EE 68 96 | Increment (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	DEY				  ; 88 | Decrement Y register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BMI $F0			  ; 30 F0 | Branch if negative
	ASL $8600			; 0E 00 86 | Arithmetic shift left (absolute)
	DEX				  ; CA | Decrement X register
	INC $7E00,X		  ; FE 00 7E | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	ROR $5918			; 6E 18 59 | Rotate right (absolute)
	ROL $08			  ; 26 08 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1A5
; Address: $E8E244
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1A5:
	BPL $60			  ; 10 60 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	STZ $97			  ; 64 97 | Store zero to zero page
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1A6
; Address: $E8E25A
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1A6:
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PEA #$E800		   ; F4 00 E8 | Push effective address to stack
	RTI				  ; 40 | Return from interrupt
	DEC				  ; 3A | Decrement accumulator
	ASL $C6			  ; 06 C6 | Arithmetic shift left (zero page)
	STY $88FC			; 8C FC 88 | Store Y register to absolute address
	CLI				  ; 58 | Clear interrupt disable flag
	BPL $50			  ; 10 50 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BEQ $00			  ; F0 00 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	ADC $EF2C,Y		  ; 79 2C EF | Add with carry (absolute,Y)
	EOR $3A			  ; 45 3A | Exclusive OR with accumulator (zero page)
	AND $2918,X		  ; 3D 18 29 | Logical AND with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	LSR $0006			; 4E 06 00 | Logical shift right (absolute)
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $73			  ; 80 73 | Branch always
	BRA $22			  ; 80 22 | Branch always
	CMP ($26,X)		  ; C1 26 | Compare accumulator ((zero page,X))
	CMP ($06,X)		  ; C1 06 | Compare accumulator ((zero page,X))
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	LDY #$85			 ; A0 85 | Load immediate value into Y register
	PLY				  ; 7A | Pull Y register from stack
	BNE $3F			  ; D0 3F | Branch if not equal
	XBA				  ; EB | Exchange accumulator bytes
	ASL $1CF3			; 0E F3 1C | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1A7
; Address: $E8E2B2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1A7:
	JSR $F800			; 20 00 F8 | Jump to subroutine
	LDY $0C02,X		  ; BC 02 0C | Load from absolute,X into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	CPY #$89			 ; C0 89 | Compare Y register (immediate)
	BPL $CF			  ; 10 CF | Branch if positive
	BVS $27			  ; 70 27 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	CPX $6F90			; EC 90 6F | Compare X register (absolute)
	STA $8E66,Y		  ; 99 66 8E | Update graphics data
	ADC ($2D),Y		  ; 71 2D | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1A8
; Address: $E8E2D0
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1A8:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $8F00			; 0E 00 8F | Arithmetic shift left (absolute)
	REP #$00			 ; C2 00 | Reset processor status bits
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	AND ($EB,X)		  ; 21 EB | Logical AND with accumulator ((zero page,X))
	BEQ $03			  ; F0 03 | Branch if equal
	CMP #$F1			 ; C9 F1 | Compare accumulator (immediate)
	ASL $11			  ; 06 11 | Arithmetic shift left (zero page)
	INC $F20D			; EE 0D F2 | Increment (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	JMP $470C			; 4C 0C 47 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	DEC $3E			  ; C6 3E | Decrement (zero page)
	LDA $FF7E5F		  ; AF 5F 7E FF | Read graphics status
	INC $9E69,X		  ; FE 69 9E | Increment (absolute,X)
	ORA $0EFE			; 0D FE 0E | Logical OR with accumulator (absolute)
	SBC $31			  ; E5 31 | Subtract with carry (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	SBC $FF00			; ED 00 FF | Subtract with carry (absolute)
	BRA $FD			  ; 80 FD | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1A9
; Address: $E8E321
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1A9:
	BCC $A0			  ; 90 A0 | Branch if carry clear
	BNE $20			  ; D0 20 | Branch if not equal
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $08			  ; F0 08 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $28			  ; 80 28 | Branch always
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1AA
; Address: $E8E366
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1AA:
	CLC				  ; 18 | Clear carry flag
	ROR $9F6C,X		  ; 7E 6C 9F | Rotate right (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	CMP $0C			  ; C5 0C | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1AB
; Address: $E8E36E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1AB:
	JSR $001E			; 20 1E 00 | Jump to subroutine
	WDM #$00			 ; 42 00 | Reserved instruction
	STA ($00,X)		  ; 81 00 | Update graphics data
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ASL $C800,X		  ; 1E 00 C8 | Arithmetic shift left (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	BEQ $00			  ; F0 00 | Branch if equal
	INY				  ; C8 | Increment Y register
	BRA $C4			  ; 80 C4 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	JMP $4400			; 4C 00 44 | Jump to address
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1AC
; Address: $E8E3A4
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1AC:
	BEQ $73			  ; F0 73 | Branch if equal
	STX $7E			  ; 86 7E | Store X register to zero page
	ASL $757E,X		  ; 1E 7E 75 | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROL $0001			; 2E 01 00 | Rotate left (absolute)
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $FE			  ; D0 FE | Branch if not equal
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	ROR $03			  ; 66 03 | Rotate right (zero page)
	INC $BD7D,X		  ; FE 7D BD | Increment (absolute,X)
	ROR $1DFE,X		  ; 7E FE 1D | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY #$87			 ; C0 87 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1AD
; Address: $E8E3DA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1AD:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($BF,X)		  ; 41 BF | Exclusive OR with accumulator ((zero page,X))
	INC $BE11			; EE 11 BE | Increment (absolute)
	EOR ($16,X)		  ; 41 16 | Exclusive OR with accumulator ((zero page,X))
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	ADC #$1F			 ; 69 1F | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1AE
; Address: $E8E3ED
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1AE:
	JSL $000483		  ; 22 83 04 00 | Jump to subroutine long
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	REP #$80			 ; C2 80 | Reset processor status bits
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	LDA $EEFE,X		  ; BD FE EE | Read graphics status
	LDA $FF0357		  ; AF 57 03 FF | Read graphics status
	CMP $3B			  ; C5 3B | Compare accumulator (zero page)
	EOR ($BF,X)		  ; 41 BF | Exclusive OR with accumulator ((zero page,X))
	EOR $BD			  ; 45 BD | Exclusive OR with accumulator (zero page)
	STA $0E05,X		  ; 9D 05 0E | Update graphics data
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	BEQ $99			  ; F0 99 | Branch if equal
	INC $C0C0,X		  ; FE C0 C0 | Increment (absolute,X)
	SBC $ED02,X		  ; FD 02 ED | Subtract with carry (absolute,X)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	INC $C000,X		  ; FE 00 C0 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BCS $70			  ; B0 70 | Branch if carry set
	BCS $F0			  ; B0 F0 | Branch if carry set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1B0
; Address: $E8E46A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1B0:
	BMI $70			  ; 30 70 | Branch if negative
	BVS $F0			  ; 70 F0 | Branch if overflow set
	BNE $D0			  ; D0 D0 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	PLP				  ; 28 | Pull processor status from stack
	ASL $1F2F			; 0E 2F 1F | Arithmetic shift left (absolute)
	BPL $1F			  ; 10 1F | Branch if positive
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1B2
; Address: $E8E49C
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1B2:
	JSR $3800			; 20 00 38 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $1C00,X		  ; 1E 00 1C | Arithmetic shift left (absolute,X)
	ORA $0300			; 0D 00 03 | Logical OR with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $535F			; 4C 5F 53 | Jump to address
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	BCS $C0			  ; B0 C0 | Branch if carry set
	LDA				  ; BF 40 D0 40 | Read graphics status
	BEQ $40			  ; F0 40 | Branch if equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPX #$4C			 ; E0 4C | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $BA			  ; 80 BA | Branch always
	ORA ($CF,X)		  ; 01 CF | Logical OR with accumulator ((zero page,X))
	BMI $F3			  ; 30 F3 | Branch if negative
	STY $00FF			; 8C FF 00 | Store Y register to absolute address
	JMP $5111E0		  ; 5C E0 11 51 | Jump to address long
	TSX				  ; BA | Transfer stack pointer to X register
	JMP $0E1120		  ; 5C 20 11 0E | Jump to address long
	STY $46A1			; 8C A1 46 | Store Y register to absolute address
	BCS $43			  ; B0 43 | Branch if carry set
	BEQ $03			  ; F0 03 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1B3
; Address: $E8E50B
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1B3:
	STA $7C80,Y		  ; 99 80 7C | Update graphics data
	BRA $7C			  ; 80 7C | Branch always
	CPY $6D30			; CC 30 6D | Compare Y register (absolute)
	BPL $27			  ; 10 27 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	STA $0406,Y		  ; 99 06 04 | Update graphics data
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($A5,X)		  ; 01 A5 | Logical OR with accumulator ((zero page,X))
	ORA ($B3,X)		  ; 01 B3 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	BRA $00			  ; 80 00 | Branch always
	LDA $5A			  ; A5 5A | Read graphics status
	JMP $6798			; 4C 98 67 | Jump to address
	TXA				  ; 8A | Transfer X register to accumulator
	BRA $7C			  ; 80 7C | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1B4
; Address: $E8E544
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1B4:
	CLV				  ; B8 | Clear overflow flag
	BRA $B0			  ; 80 B0 | Branch always
	BRA $70			  ; 80 70 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$90			 ; C0 90 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BCS $00			  ; B0 00 | Branch if carry set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	CPX $E1			  ; E4 E1 | Compare X register (zero page)
	ADC $1F76,Y		  ; 79 76 1F | Add with carry (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	BEQ $70			  ; F0 70 | Branch if equal
	BEQ $1F			  ; F0 1F | Branch if equal
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1B5
; Address: $E8E5E3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1B5:
	STA				  ; 9F 06 3E 18 | Update graphics data
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1B6
; Address: $E8E5F4
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1B6:
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	CPX #$C4			 ; E0 C4 | Compare X register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	LDY #$3F			 ; A0 3F | Load immediate value into Y register
	BRA $3F			  ; 80 3F | Branch always
	NOP				  ; EA | No operation
	SBC $131D			; ED 1D 13 | Subtract with carry (absolute)
	LDA $F3A3,X		  ; BD A3 F3 | Read graphics status
	CMP ($F7,X)		  ; C1 F7 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1B7
; Address: $E8E610
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1B7:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $C0			  ; 80 C0 | Branch always
	CPX $4C00			; EC 00 4C | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCS $88			  ; B0 88 | Branch if carry set
	BCS $44			  ; B0 44 | Branch if carry set
	CLI				  ; 58 | Clear interrupt disable flag
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BPL $08			  ; 10 08 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	ASL $A4			  ; 06 A4 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1B8
; Address: $E8E64D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1B8:
	JSL $008022		  ; 22 22 80 00 | Jump to subroutine long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	SEP #$FB			 ; E2 FB | Set processor status bits

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1B9
; Address: $E8E661
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1B9:
	JSR $63BB			; 20 BB 63 | Jump to subroutine
	CPY $98F8			; CC F8 98 | Compare Y register (absolute)
	ROL $AE			  ; 26 AE | Rotate left (zero page)
	BIT $083E			; 2C 3E 08 | Test bits in accumulator (absolute)
	STZ $3300			; 9C 00 33 | Store zero to absolute
	CLI				  ; 58 | Clear interrupt disable flag
	CMP $D300,Y		  ; D9 00 D3 | Compare accumulator (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA $1E19,X		  ; 1D 19 1E | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1BA
; Address: $E8E693
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1BA:
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BPL $F8			  ; 10 F8 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	ASL $0FF8,X		  ; 1E F8 0F | Arithmetic shift left (absolute,X)
	BRA $07			  ; 80 07 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1BB
; Address: $E8E6A9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1BB:
	STX $6B			  ; 86 6B | Store X register to zero page
	LDA				  ; BF FC A3 D3 | Read graphics status
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1BC
; Address: $E8E6B5
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1BC:
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPY $9EC0			; CC C0 9E | Compare Y register (absolute)
	BVS $13			  ; 70 13 | Branch if overflow set
	JMP ($EC13)		  ; 6C 13 EC | Jump to address (absolute indirect)
	SEP #$11			 ; E2 11 | Set processor status bits
	ROR $F1			  ; 66 F1 | Rotate right (zero page)
	BEQ $E2			  ; F0 E2 | Branch if equal
	ORA ($E3),Y		  ; 11 E3 | Logical OR with accumulator ((zero page),Y)
	BRA $FD			  ; 80 FD | Branch always
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	CPX $18			  ; E4 18 | Compare X register (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1BE
; Address: $E8E6E8
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1BE:
	JSR $3036			; 20 36 30 | Jump to subroutine
	BVS $03			  ; 70 03 | Branch if overflow set
	TXS				  ; 9A | Transfer X register to stack pointer
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	DEC $08			  ; C6 08 | Decrement (zero page)
	STY $40AB			; 8C AB 40 | Store Y register to absolute address
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC $DB30,X		  ; FD 30 DB | Subtract with carry (absolute,X)
	LDX $494A			; AE 4A 49 | Load from absolute address into X register
	AND #$68			 ; 29 68 | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	CPY $B895			; CC 95 B8 | Compare Y register (absolute)
	PLX				  ; FA | Pull X register from stack
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1BF
; Address: $E8E734
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1BF:
	STA ($00),Y		  ; 91 00 | Update graphics data
	ROR				  ; 6A | Rotate right (accumulator)
	SBC $AD00			; ED 00 AD | Subtract with carry (absolute)
	CMP #$DF			 ; C9 DF | Compare accumulator (immediate)
	STA $8699,Y		  ; 99 99 86 | Update graphics data
	ROL $7F92,X		  ; 3E 92 7F | Rotate left (absolute,X)
	LSR $05C5,X		  ; 5E C5 05 | Logical shift right (absolute,X)
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1C0
; Address: $E8E750
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1C0:
	JSR $6600			; 20 00 66 | Jump to subroutine
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDA ($00,X)		  ; A1 00 | Read graphics status
	PLX				  ; FA | Pull X register from stack
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	ASL $0101,X		  ; 1E 01 01 | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1C1
; Address: $E8E770
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1C1:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	CPX #$21			 ; E0 21 | PPU graphics register access
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($5D,X)		  ; 81 5D | Update graphics data
	RTI				  ; 40 | Return from interrupt
	TXS				  ; 9A | Transfer X register to stack pointer
	STA ($71),Y		  ; 91 71 | Update graphics data
	CPX #$2A			 ; E0 2A | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	XBA				  ; EB | Exchange accumulator bytes
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$A2			 ; E0 A2 | Compare X register (immediate)
	ADC $1A			  ; 65 1A | Add with carry (zero page)
	DEC $D500			; CE 00 D5 | Decrement (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPX $C0			  ; E4 C0 | Compare X register (zero page)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX #$C5			 ; E0 C5 | Compare X register (immediate)
	SBC $FEEA,Y		  ; F9 EA FE | Subtract with carry (absolute,Y)
	STZ $7EF3			; 9C F3 7E | Store zero to absolute
	SBC ($0F,X)		  ; E1 0F | Subtract with carry ((zero page,X))
	BVS $0F			  ; 70 0F | Branch if overflow set
	BVS $83			  ; 70 83 | Branch if overflow set
	JMP ($9E61)		  ; 6C 61 9E | Jump to address (absolute indirect)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $9E			  ; 80 9E | Branch always
	STZ $1F00,X		  ; 9E 00 1F | Store zero to absolute,X
	BPL $6F			  ; 10 6F | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1C2
; Address: $E8E7C1
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1C2:
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1C3
; Address: $E8E7C7
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1C3:
	TSX				  ; BA | Transfer stack pointer to X register
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $20			  ; D0 20 | Branch if not equal
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	JMP ($3A90)		  ; 6C 90 3A | Jump to address (absolute indirect)
	RTI				  ; 40 | Return from interrupt
	ASL $0A20,X		  ; 1E 20 0A | Arithmetic shift left (absolute,X)
	STX $38			  ; 86 38 | Store X register to zero page
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	ORA ($24,X)		  ; 01 24 | Logical OR with accumulator ((zero page,X))
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	STZ $50			  ; 64 50 | Store zero to zero page
	DEY				  ; 88 | Decrement Y register
	BCC $00			  ; 90 00 | Branch if carry clear
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ASL $0C06			; 0E 06 0C | Arithmetic shift left (absolute)
	ORA $40			  ; 05 40 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BPL $28			  ; 10 28 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $04			  ; 10 04 | Branch if positive
	BIT $1A			  ; 24 1A | Test bits in accumulator (zero page)
	ORA $1A00,Y		  ; 19 00 1A | Logical OR with accumulator (absolute,Y)
	JMP ($2000)		  ; 6C 00 20 | Jump to address (absolute indirect)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1C4
; Address: $E8E83E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1C4:
	JSR $8000			; 20 00 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	BRA $7E			  ; 80 7E | Branch always
	STA ($6C,X)		  ; 81 6C | Update graphics data
	LDX $B801,Y		  ; BE 01 B8 | Load from absolute,Y into X register
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1C5
; Address: $E8E85C
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1C5:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT $1C			  ; 24 1C | Test bits in accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	STA $3F			  ; 85 3F | Update graphics data
	DEY				  ; 88 | Decrement Y register
	STA $E300,X		  ; 9D 00 E3 | Update graphics data
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	EOR $41			  ; 45 41 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ROL $8EC1,X		  ; 3E C1 8E | Rotate left (absolute,X)
	SBC ($06),Y		  ; F1 06 | Subtract with carry ((zero page),Y)
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	SBC $FB66,X		  ; FD 66 FB | Subtract with carry (absolute,X)
	STA $AD7F,X		  ; 9D 7F AD | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BMI $1C			  ; 30 1C | Branch if negative
	BVC $18			  ; 50 18 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	BMI $60			  ; 30 60 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1C8
; Address: $E8E8FC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1C8:
	JSR $0000			; 20 00 00 | Jump to subroutine
	TAY				  ; A8 | Transfer accumulator to Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	BVS $00			  ; 70 00 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	BVC $60			  ; 50 60 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1C9
; Address: $E8E92B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1C9:
	ASL $180C			; 0E 0C 18 | Arithmetic shift left (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1CA
; Address: $E8E936
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1CA:
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1CB
; Address: $E8E93E
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1CB:
	JSR $8C00			; 20 00 8C | Jump to subroutine
	STA $451E			; 8D 1E 45 | Update graphics data
	ROL $3F50,X		  ; 3E 50 3F | Rotate left (absolute,X)
	EOR ($3F),Y		  ; 51 3F | Exclusive OR with accumulator ((zero page),Y)
	STA $DB7F,Y		  ; 99 7F DB | Update graphics data
	AND $EFD1			; 2D D1 EF | Logical AND with accumulator (absolute)
	STA ($EF),Y		  ; 91 EF | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	INC $FE8A,X		  ; FE 8A FE | Increment (absolute,X)
	LDX $B6FE			; AE FE B6 | Load from absolute address into X register
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1CD
; Address: $E8E983
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1CD:
	JSR $A05C			; 20 5C A0 | Jump to subroutine
	LSR $B9			  ; 46 B9 | Logical shift right (zero page)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ROL $B6FE			; 2E FE B6 | Rotate left (absolute)
	INC $F6FE,X		  ; FE FE F6 | Increment (absolute,X)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ASL $3900,X		  ; 1E 00 39 | Arithmetic shift left (absolute,X)
	SEP #$3C			 ; E2 3C | Set processor status bits
	LSR				  ; 4A | Logical shift right (accumulator)
	LDY $BCCA,X		  ; BC CA BC | Load from absolute,X into Y register
	STA $DBFE,Y		  ; 99 FE DB | Update graphics data
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $04			  ; 10 04 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BMI $58			  ; 30 58 | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1CE
; Address: $E8E9CB
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1CE:
	JSR $00CE			; 20 CE 00 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLB				  ; AB | Pull data bank register from stack
	LDA $CCED,Y		  ; B9 ED CC | Read graphics status
	RTI				  ; 40 | Return from interrupt
	ORA $1800,X		  ; 1D 00 18 | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STY $4073			; 8C 73 40 | Store Y register to absolute address
	LDA				  ; BF 60 9F 00 | Read graphics status
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1CF
; Address: $E8EA17
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1CF:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	INX				  ; E8 | Increment X register
	STA				  ; 9F 00 01 00 | Update graphics data
	STY $DE2D			; 8C 2D DE | Store Y register to absolute address
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	BVC $BF			  ; 50 BF | Branch if overflow clear
	EOR ($BF),Y		  ; 51 BF | Exclusive OR with accumulator ((zero page),Y)
	STA $DB7F,Y		  ; 99 7F DB | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND $EFD1			; 2D D1 EF | Logical AND with accumulator (absolute)
	STA ($EF),Y		  ; 91 EF | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	INC $FE8A,X		  ; FE 8A FE | Increment (absolute,X)
	LDX $B6FE			; AE FE B6 | Load from absolute address into X register
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $0F00,Y		  ; 19 00 0F | Logical OR with accumulator (absolute,Y)
	EOR $DD00,Y		  ; 59 00 DD | Exclusive OR with accumulator (absolute,Y)
	BCC $7F			  ; 90 7F | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	PLY				  ; 7A | Pull Y register from stack
	BRA $00			  ; 80 00 | Branch always
	STA ($00),Y		  ; 91 00 | Update graphics data
	LDY $64			  ; A4 64 | Load from zero page into Y register
	STZ $E4			  ; 64 E4 | Store zero to zero page
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PEA #$E0F4		   ; F4 F4 E0 | Game work RAM access
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	PEA #$E0F4		   ; F4 F4 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1D0
; Address: $E8EAF3
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1D0:
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	PHX				  ; DA | Push X register to stack
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $6DFE,X		  ; FE FE 6D | Increment (absolute,X)
	ROR $2625			; 6E 25 26 | Rotate right (absolute)
	ROL $27			  ; 26 27 | Rotate left (zero page)
	BRA $FF			  ; 80 FF | Branch always
	BRA $8F			  ; 80 8F | Branch always
	BEQ $FE			  ; F0 FE | Branch if equal
	CMP ($C5,X)		  ; C1 C5 | Compare accumulator ((zero page,X))
	REP #$C9			 ; C2 C9 | Reset processor status bits
	CPY #$A2			 ; C0 A2 | Compare Y register (immediate)
	SEP #$AB			 ; E2 AB | Set processor status bits
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1D1
; Address: $E8EB3C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1D1:
	JSL $F708DD		  ; 22 DD 08 F7 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	STZ $20E8			; 9C E8 20 | Store zero to absolute
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	ASL $1700			; 0E 00 17 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	BPL $EF			  ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1D2
; Address: $E8EB54
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1D2:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	CMP #$DD			 ; C9 DD | Compare accumulator (immediate)
	CPY #$D4			 ; C0 D4 | Compare Y register (immediate)
	LDY $E4			  ; A4 E4 | Load from zero page into Y register
	STZ $E4			  ; 64 E4 | Store zero to zero page
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STX $02			  ; 86 02 | Store X register to zero page
	EOR $CD00,X		  ; 5D 00 CD | Exclusive OR with accumulator (absolute,X)
	BRA $4E			  ; 80 4E | Branch always
	PHP				  ; 08 | Push processor status to stack
	ADC $3B00,Y		  ; 79 00 3B | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1D3
; Address: $E8EBE3
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1D3:
	SBC ($1B,X)		  ; E1 1B | Subtract with carry ((zero page,X))
	BMI $6D			  ; 30 6D | Branch if negative
	BPL $35			  ; 10 35 | Branch if positive
	BPL $1B			  ; 10 1B | Branch if positive
	ASL $007F,X		  ; 1E 7F 00 | Arithmetic shift left (absolute,X)
	ASL $4F00,X		  ; 1E 00 4F | Arithmetic shift left (absolute,X)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $40			  ; 10 40 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1D4
; Address: $E8EC2A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1D4:
	BRA $70			  ; 80 70 | Branch always
	BPL $F0			  ; 10 F0 | Branch if positive
	BCC $B0			  ; 90 B0 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1D6
; Address: $E8EC40
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1D6:
	STX $E80F			; 8E 0F E8 | Store X register to absolute address
	INX				  ; E8 | Increment X register
	BCC $C0			  ; 90 C0 | Branch if carry clear
	BPL $40			  ; 10 40 | Branch if positive
	JMP $4E55			; 4C 55 4E | Jump to address
	EOR $00FE			; 4D FE 00 | Exclusive OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	BMI $0F			  ; 30 0F | Branch if negative
	BCS $0F			  ; B0 0F | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	LDY $BA00,X		  ; BC 00 BA | Load from absolute,X into Y register
	BPL $1F			  ; 10 1F | Branch if positive
	ORA $4F0D			; 0D 0D 4F | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive
	ORA $4F32			; 0D 32 4F | Logical OR with accumulator (absolute)
	BMI $40			  ; 30 40 | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$FE			 ; 09 FE | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1D7
; Address: $E8EC84
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1D7:
	EOR ($B6),Y		  ; 51 B6 | Exclusive OR with accumulator ((zero page),Y)
	AND ($F6),Y		  ; 31 F6 | Logical AND with accumulator ((zero page),Y)
	SBC $E7			  ; E5 E7 | Subtract with carry (zero page)
	SEP #$06			 ; E2 06 | Set processor status bits
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INC $18			  ; E6 18 | Increment (zero page)
	CPX $18			  ; E4 18 | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	BVC $50			  ; 50 50 | Branch if overflow clear
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1D8
; Address: $E8ECA8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1D8:
	JSR $F0D0			; 20 D0 F0 | Jump to subroutine
	BCS $00			  ; B0 00 | Branch if carry set
	BPL $E8			  ; 10 E8 | Branch if positive
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1D9
; Address: $E8ECC2
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1D9:
	ORA #$FA			 ; 09 FA | Logical OR with accumulator (immediate)
	LDA ($33),Y		  ; B1 33 | Read graphics status
	BEQ $E3			  ; F0 E3 | Branch if equal
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	STA $B58760		  ; 8F 60 87 B5 | Update graphics data
	LSR $C3			  ; 46 C3 | Logical shift right (zero page)
	BNE $00			  ; D0 00 | Branch if not equal
	BPL $FF			  ; 10 FF | Branch if positive
	INX				  ; E8 | Increment X register
	BPL $E0			  ; 10 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	PEA #$FB08		   ; F4 08 FB | Push effective address to stack
	BVS $02			  ; 70 02 | Branch if overflow set
	AND $1807,X		  ; 3D 07 18 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1DA
; Address: $E8ED07
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1DA:
	CLC				  ; 18 | Clear carry flag
	ORA $1E0F,Y		  ; 19 0F 1E | Logical OR with accumulator (absolute,Y)
	ASL $86F6			; 0E F6 86 | Arithmetic shift left (absolute)
	STX $7F			  ; 86 7F | Store X register to zero page
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($E0),Y		  ; 11 E0 | Game work RAM access
	ADC $7900,Y		  ; 79 00 79 | Add with carry (absolute,Y)
	AND $34C5,Y		  ; 39 C5 34 | Logical AND with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	CPY $70			  ; C4 70 | Compare Y register (zero page)
	PEA #$4570		   ; F4 70 45 | Push effective address to stack
	CMP ($79,X)		  ; C1 79 | Compare accumulator ((zero page,X))
	STY $4F			  ; 84 4F | Store Y register to zero page
	INY				  ; C8 | Increment Y register
	PEA #$FE08		   ; F4 08 FE | Push effective address to stack
	STA $008F00		  ; 8F 00 8F 00 | Update graphics data
	LDX $FF00,Y		  ; BE 00 FF | Load from absolute,Y into X register
	BMI $7B			  ; 30 7B | Branch if negative
	BIT #$73			 ; 89 73 | Test bits in accumulator (immediate)
	ADC ($72),Y		  ; 71 72 | Add with carry ((zero page),Y)
	BEQ $D5			  ; F0 D5 | Branch if equal
	SBC ($65),Y		  ; F1 65 | Subtract with carry ((zero page),Y)
	EOR ($7C,X)		  ; 41 7C | Exclusive OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STX $0F00			; 8E 00 0F | Store X register to absolute address
	INC $F801,X		  ; FE 01 F8 | Increment (absolute,X)
	CPX $6470			; EC 70 64 | Compare X register (absolute)
	BEQ $38			  ; F0 38 | Branch if equal
	CPX #$12			 ; E0 12 | Compare X register (immediate)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	BEQ $F2			  ; F0 F2 | Branch if equal
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	STZ $CE00			; 9C 00 CE | Store zero to absolute
	INC $C200,X		  ; FE 00 C2 | Increment (absolute,X)
	INC $3E00,X		  ; FE 00 3E | Increment (absolute,X)
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	BEQ $84			  ; F0 84 | Branch if equal
	BMI $F4			  ; 30 F4 | Branch if negative
	BMI $48			  ; 30 48 | Branch if negative
	STY $7F			  ; 84 7F | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	BMI $8F			  ; 30 8F | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	ROR $CF01,X		  ; 7E 01 CF | Rotate right (absolute,X)
	ASL $041E,X		  ; 1E 1E 04 | Arithmetic shift left (absolute,X)
	CPY $00			  ; C4 00 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1DB
; Address: $E8EDAF
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1DB:
	CLV				  ; B8 | Clear overflow flag
	BMI $00			  ; 30 00 | Branch if negative
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPY #$83			 ; C0 83 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CPY #$EE			 ; C0 EE | Compare Y register (immediate)
	INC $1F1E,X		  ; FE 1E 1F | Increment (absolute,X)
	LDA				  ; BF C3 D7 42 | Read graphics status
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BCS $28			  ; B0 28 | Branch if carry set
	BPL $81			  ; 10 81 | Branch if positive
	BPL $D0			  ; 10 D0 | Branch if positive
	BCS $37			  ; B0 37 | Branch if carry set
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	AND $3886,Y		  ; 39 86 38 | Logical AND with accumulator (absolute,Y)
	STX $69			  ; 86 69 | Store X register to zero page
	EOR ($BC,X)		  ; 41 BC | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	LDA				  ; BF 40 BF 40 | Read graphics status
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA $3FF0			; 0D F0 3F | Logical OR with accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROR $4481,X		  ; 7E 81 44 | Rotate right (absolute,X)
	CMP $32			  ; C5 32 | Compare accumulator (zero page)
	BIT #$3A			 ; 89 3A | Test bits in accumulator (immediate)
	STA ($06,X)		  ; 81 06 | Update graphics data
	SBC $00FF,Y		  ; F9 FF 00 | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	BCS $37			  ; B0 37 | Branch if carry set
	STA ($06,X)		  ; 81 06 | Update graphics data
	ORA #$86			 ; 09 86 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	STX $68			  ; 86 68 | Store X register to zero page
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	LDX $F17E,Y		  ; BE 7E F1 | Load from absolute,Y into X register
	AND ($DB),Y		  ; 31 DB | Logical AND with accumulator ((zero page),Y)
	ROR $40BF,X		  ; 7E BF 40 | Rotate right (absolute,X)
	LDA				  ; BF 41 BE CE | Read graphics status
	SBC $007C,Y		  ; F9 7C 00 | Subtract with carry (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BRA $FB			  ; 80 FB | Branch always
	STZ $7E			  ; 64 7E | Store zero to zero page
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1DC
; Address: $E8EE68
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1DC:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($05),Y		  ; 11 05 | Logical OR with accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $3F			  ; 24 3F | Test bits in accumulator (zero page)
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)
	ORA ($2F),Y		  ; 11 2F | Logical OR with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	JMP $704871		  ; 5C 71 48 70 | Jump to address long
	PLP				  ; 28 | Pull processor status from stack
	BMI $3E			  ; 30 3E | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1DD
; Address: $E8EE9B
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1DD:
	JSR $301F			; 20 1F 30 | Jump to subroutine
	BVS $80			  ; 70 80 | Branch if overflow set
	BRA $10			  ; 80 10 | Branch always
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	BVC $10			  ; 50 10 | Branch if overflow clear
	BCC $20			  ; 90 20 | Branch if carry clear
	BCC $40			  ; 90 40 | Branch if carry clear
	BCC $50			  ; 90 50 | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	PEA #$641C		   ; F4 1C 64 | Push effective address to stack
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	CPX $FF2C			; EC 2C FF | Compare X register (absolute)
	LDA				  ; BF 00 FF 28 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BCS $F8			  ; B0 F8 | Branch if carry set
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	BVC $50			  ; 50 50 | Branch if overflow clear
	DEC $FE6C,X		  ; DE 6C FE | Decrement (absolute,X)
	JMP ($4CFE)		  ; 6C FE 4C | Jump to address (absolute indirect)
	DEC $FC04,X		  ; DE 04 FC | Decrement (absolute,X)
	LDY $21FC			; AC FC 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1DE
; Address: $E8EEFA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1DE:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	LDA $EB72,X		  ; BD 72 EB | Read graphics status

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1DF
; Address: $E8EF07
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1DF:
	JSR $807F			; 20 7F 80 | Jump to subroutine
	ADC $6686,Y		  ; 79 86 66 | Add with carry (absolute,Y)
	STA $CEB1,Y		  ; 99 B1 CE | Update graphics data
	ORA $3F00,Y		  ; 19 00 3F | Logical OR with accumulator (absolute,Y)
	CLV				  ; B8 | Clear overflow flag
	DEC $7C			  ; C6 7C | Decrement (zero page)
	LDY $FB45,X		  ; BC 45 FB | Load from absolute,X into Y register
	ORA $9F			  ; 05 9F | Logical OR with accumulator (zero page)
	ADC ($35,X)		  ; 61 35 | Add with carry ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $FB00,Y		  ; F9 00 FB | Subtract with carry (absolute,Y)
	BPL $4F			  ; 10 4F | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BMI $C8			  ; 30 C8 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	REP #$00			 ; C2 00 | Reset processor status bits
	INC $C03E,X		  ; FE 3E C0 | Increment (absolute,X)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	ROR $601F,X		  ; 7E 1F 60 | Rotate right (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $DE00,X		  ; FE 00 DE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1E0
; Address: $E8EF80
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1E0:
	JSR $1849			; 20 49 18 | Jump to subroutine
	LDA $2AFE55		  ; AF 55 FE 2A | Read graphics status
	PHY				  ; 5A | Push Y register to stack
	AND $24			  ; 25 24 | Logical AND with accumulator (zero page)
	WDM #$26			 ; 42 26 | Reserved instruction
	EOR #$20			 ; 49 20 | Exclusive OR with accumulator (immediate)
	LSR $5F20			; 4E 20 5F | Logical shift right (absolute)
	BMI $D7			  ; 30 D7 | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1E1
; Address: $E8EF93
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1E1:
	JSR $F801			; 20 01 F8 | Jump to subroutine
	STA $F8			  ; 85 F8 | Update graphics data
	BVS $59			  ; 70 59 | Branch if overflow set
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	STZ $2281			; 9C 81 22 | Store zero to absolute
	CPY #$1B			 ; C0 1B | Compare Y register (immediate)
	LDA ($39),Y		  ; B1 39 | Read graphics status
	AND $991B,Y		  ; 39 1B 99 | Logical AND with accumulator (absolute,Y)
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1E2
; Address: $E8EFB5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1E2:
	CLC				  ; 18 | Clear carry flag
	REP #$24			 ; C2 24 | Reset processor status bits
	LDA $42			  ; A5 42 | Hardware register operation
	LSR $81			  ; 46 81 | Logical shift right (zero page)
	LSR $81			  ; 46 81 | Logical shift right (zero page)
	ROR $81			  ; 66 81 | Rotate right (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	JMP $4C7F			; 4C 7F 4C | Jump to address
	BMI $7F			  ; 30 7F | Branch if negative
	LDY $06BE			; AC BE 06 | Load from absolute address into Y register
	ASL $EEF4,X		  ; 1E F4 EE | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1E3
; Address: $E8EFE7
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1E3:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$D8			 ; E0 D8 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	BIT $C0F0			; 2C F0 C0 | Test bits in accumulator (absolute)
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $26FE,X		  ; 1E FE 26 | Arithmetic shift left (absolute,X)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	INC $CF70,X		  ; FE 70 CF | Increment (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	EOR $5FB3			; 4D B3 5F | Exclusive OR with accumulator (absolute)
	LDA $7F5F67		  ; AF 67 5F 7F | Read graphics status
	BEQ $43			  ; F0 43 | Branch if equal
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CMP $8E36			; CD 36 8E | Compare accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	JMP ($0093)		  ; 6C 93 00 | Jump to address (absolute indirect)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $FAF9,Y		  ; F9 F9 FA | Subtract with carry (absolute,Y)
	SBC $FB00,Y		  ; F9 00 FB | Subtract with carry (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	EOR ($29,X)		  ; 41 29 | Exclusive OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	ROL $294C			; 2E 4C 29 | Rotate left (absolute)
	EOR $21			  ; 45 21 | PPU graphics register access
	EOR $5235,Y		  ; 59 35 52 | Exclusive OR with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	AND $035E,Y		  ; 39 5E 03 | Logical AND with accumulator (absolute,Y)
	ORA ($56,X)		  ; 01 56 | Logical OR with accumulator ((zero page,X))
	LSR $4E00,X		  ; 5E 00 4E | Logical shift right (absolute,X)
	BIT #$67			 ; 89 67 | Test bits in accumulator (immediate)
	STA ($37,X)		  ; 81 37 | Update graphics data

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1E5
; Address: $E8F089
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1E5:
	JSL $9C623E		  ; 22 3E 62 9C | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	NOP				  ; EA | No operation
	STA ($7E,X)		  ; 81 7E | Update graphics data
	STA ($BE,X)		  ; 81 BE | Update graphics data
	CMP ($BE,X)		  ; C1 BE | Compare accumulator ((zero page,X))
	EOR ($DD,X)		  ; 41 DD | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1E6
; Address: $E8F09B
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1E6:
	JSL $F636EA		  ; 22 EA 36 F6 | Jump to subroutine long
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	CPX $FF2C			; EC 2C FF | Compare X register (absolute)
	LDA				  ; BF 00 FF 08 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	BCS $F8			  ; B0 F8 | Branch if carry set
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	EOR ($51),Y		  ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
	DEC $FE6E,X		  ; DE 6E FE | Decrement (absolute,X)
	ROR $4CFE			; 6E FE 4C | Rotate right (absolute)
	DEC $FC04,X		  ; DE 04 FC | Decrement (absolute,X)
	LDX $21FF			; AE FF 21 | PPU graphics register access
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	SBC $0103,Y		  ; F9 03 01 | Subtract with carry (absolute,Y)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	WDM #$A0			 ; 42 A0 | Reserved instruction

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1E7
; Address: $E8F0EF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1E7:
	JSL $FE0006		  ; 22 06 00 FE | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	ADC ($35,X)		  ; 61 35 | Add with carry ((zero page,X))
	PLB				  ; AB | Pull data bank register from stack
	LDY $43			  ; A4 43 | Load from zero page into Y register
	BVS $42			  ; 70 42 | Hardware register operation
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1E8
; Address: $E8F10E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1E8:
	BCC $F0			  ; 90 F0 | Branch if carry clear
	DEC $5F88,X		  ; DE 88 5F | Decrement (absolute,X)
	BNE $BF			  ; D0 BF | Branch if not equal
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	BVS $1F			  ; 70 1F | Branch if overflow set
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1EA
; Address: $E8F127
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1EA:
	DEY				  ; 88 | Decrement Y register
	BRA $90			  ; 80 90 | Branch always
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	INC $FF0A,X		  ; FE 0A FF | Increment (absolute,X)
	ROR $FA0E,X		  ; 7E 0E FA | Rotate right (absolute,X)
	INC $FF03,X		  ; FE 03 FF | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	BRA $F0			  ; 80 F0 | Branch always
	BRA $8F			  ; 80 8F | Branch always
	STA $008F8F		  ; 8F 8F 8F 00 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STX $0FFF			; 8E FF 0F | Store X register to absolute address
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	LDY $06BE			; AC BE 06 | Load from absolute address into Y register
	ASL $EEF4,X		  ; 1E F4 EE | Arithmetic shift left (absolute,X)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $F8FF,X		  ; FE FF F8 | Increment (absolute,X)
	STA ($3E,X)		  ; 81 3E | Update graphics data
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	BCC $03			  ; 90 03 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1EB
; Address: $E8F189
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1EB:
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$23			 ; C0 23 | Compare Y register (immediate)
	STZ $BF40			; 9C 40 BF | Store zero to absolute
	BRA $00			  ; 80 00 | Branch always
	STA				  ; 9F 00 BF 00 | Update graphics data
	ORA $3FF0			; 0D F0 3F | Logical OR with accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 30 8C 42 | Read graphics status
	LDY $BD42,X		  ; BC 42 BD | Load from absolute,X into Y register
	BVS $32			  ; 70 32 | Branch if overflow set
	LDX #$20			 ; A2 20 | Load immediate value into X register
	WDM #$80			 ; 42 80 | Reserved instruction
	ASL $0040,X		  ; 1E 40 00 | Arithmetic shift left (absolute,X)
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STY $C200			; 8C 00 C2 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1EC
; Address: $E8F1D8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1EC:
	DEC $FE00,X		  ; DE 00 FE | Decrement (absolute,X)
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1ED
; Address: $E8F1F2
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1ED:
	JSR $3200			; 20 00 32 | Jump to subroutine
	STY $00			  ; 84 00 | Store Y register to zero page
	BPL $00			  ; 10 00 | Branch if positive
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PEA #$F000		   ; F4 00 F0 | Push effective address to stack
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	STA $00			  ; 85 00 | Update graphics data
	STA $9D08,X		  ; 9D 08 9D | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	LDX $BF08			; AE 08 BF | Load from absolute address into X register
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	LDA $00CF0C		  ; AF 0C CF 00 | Read graphics status
	AND $713D,X		  ; 3D 3D 71 | Logical AND with accumulator (absolute,X)
	ADC ($30),Y		  ; 71 30 | Add with carry ((zero page),Y)
	BPL $79			  ; 10 79 | Branch if positive
	BPL $F9			  ; 10 F9 | Branch if positive
	BPL $DD			  ; 10 DD | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	REP #$00			 ; C2 00 | Reset processor status bits
	STX $EF00			; 8E 00 EF | Store X register to absolute address
	BPL $1F			  ; 10 1F | Branch if positive
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1F0
; Address: $E8F273
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1F0:
	JSR $0070			; 20 70 00 | Jump to subroutine
	BVS $0F			  ; 70 0F | Branch if overflow set
	BVS $0F			  ; 70 0F | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	CPX $00			  ; E4 00 | Compare X register (zero page)
	PEA #$0400		   ; F4 00 04 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	BPL $FE			  ; 10 FE | Branch if positive
	INC $7500,X		  ; FE 00 75 | Increment (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1F1
; Address: $E8F2AE
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1F1:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	BVC $00			  ; 50 00 | Branch if overflow clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $02FB			; 0E FB 02 | Arithmetic shift left (absolute)
	LDA				  ; BF 02 B7 02 | Read graphics status
	BCC $00			  ; 90 00 | Branch if carry clear
	BNE $00			  ; D0 00 | Branch if not equal
	SEP #$00			 ; E2 00 | Set processor status bits
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC $BD00,X		  ; FD 00 BD | Subtract with carry (absolute,X)
	LDA $BE00,X		  ; BD 00 BE | Read graphics status
	STZ $DC00			; 9C 00 DC | Store zero to absolute
	INX				  ; E8 | Increment X register
	NOP				  ; EA | No operation
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	JMP $5D04			; 4C 04 5D | Jump to address
	SBC $7F04			; ED 04 7F | Subtract with carry (absolute)
	ASL $06D7			; 0E D7 06 | Arithmetic shift left (absolute)
	ROL $E8			  ; 26 E8 | Rotate left (zero page)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	SBC $D900,Y		  ; F9 00 D9 | Subtract with carry (absolute,Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL $1E5F,X		  ; 1E 5F 1E | Arithmetic shift left (absolute,X)
	EOR $04			  ; 45 04 | Exclusive OR with accumulator (zero page)
	AND $6D00			; 2D 00 6D | Logical AND with accumulator (absolute)
	ADC $00			  ; 65 00 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1F2
; Address: $E8F356
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1F2:
	ADC $00			  ; 65 00 | Add with carry (zero page)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	CPY $88C4			; CC C4 88 | Compare Y register (absolute)
	DEY				  ; 88 | Decrement Y register
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	PEA #$7094		   ; F4 94 70 | Push effective address to stack
	BPL $42			  ; 10 42 | Hardware register operation
	ORA $3B00			; 0D 00 3B | Logical OR with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1F3
; Address: $E8F37E
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1F3:
	SBC $E400,X		  ; FD 00 E4 | Subtract with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	AND $373C			; 2D 3C 37 | Logical AND with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	STY $1984			; 8C 84 19 | Store Y register to absolute address
	PHP				  ; 08 | Push processor status to stack
	WDM #$44			 ; 42 44 | Reserved instruction
	JMP $CC4C			; 4C 4C CC | Jump to address
	JMP $46C6			; 4C C6 46 | Jump to address
	PLP				  ; 28 | Pull processor status from stack
	LDA $BB00,X		  ; BD 00 BB | Read graphics status
	LDA $4100,Y		  ; B9 00 41 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	CMP #$48			 ; C9 48 | Compare accumulator (immediate)
	SBC $6D6C			; ED 6C 6D | Subtract with carry (absolute)
	JMP ($6E6F)		  ; 6C 6F 6E | Jump to address (absolute indirect)
	ROL $2E2F			; 2E 2F 2E | Rotate left (absolute)
	LDA $BF2C			; AD 2C BF | Read graphics status
	STA ($00),Y		  ; 91 00 | Update graphics data
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	STA				  ; 9F C1 1C 81 | Update graphics data
	ASL $81			  ; 06 81 | Arithmetic shift left (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	STA ($54,X)		  ; 81 54 | Update graphics data
	LDA				  ; BF E9 BF 00 | Read graphics status
	ROR $1091,X		  ; 7E 91 10 | Rotate right (absolute,X)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	ROR $9079,X		  ; 7E 79 90 | Rotate right (absolute,X)
	BPL $12			  ; 10 12 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	BPL $50			  ; 10 50 | Branch if positive
	LDA				  ; BF 30 FF 61 | Read graphics status

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1F4
; Address: $E8F40E
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1F4:
	CMP $00CD,X		  ; DD CD 00 | Compare accumulator (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($C8),Y		  ; 11 C8 | Logical OR with accumulator ((zero page),Y)
	ORA $48FA			; 0D FA 48 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	INC $DC66			; EE 66 DC | Increment (absolute)
	LDY $A804			; AC 04 A8 | Load from absolute address into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	INY				  ; C8 | Increment Y register
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	STA $BB00,Y		  ; 99 00 BB | Update graphics data
	EOR $4F05			; 4D 05 4F | Exclusive OR with accumulator (absolute)
	EOR $9C05,X		  ; 5D 05 9C | Exclusive OR with accumulator (absolute,X)
	STA $9A01,Y		  ; 99 01 9A | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	LDX $BF00,Y		  ; BE 00 BF | Load from absolute,Y into X register
	LDA $50D200		  ; AF 00 D2 50 | Read graphics status
	BPL $D2			  ; 10 D2 | Branch if positive
	BPL $C2			  ; 10 C2 | Branch if positive
	LDA $00EF00		  ; AF 00 EF 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	PHB				  ; 8B | Push data bank register to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	STA $10D708		  ; 8F 08 D7 10 | Update graphics data
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BPL $65			  ; 10 65 | Branch if positive
	ROL $06			  ; 26 06 | Rotate left (zero page)
	ROL $06			  ; 26 06 | Rotate left (zero page)
	AND $04			  ; 25 04 | Logical AND with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	PHX				  ; DA | Push X register to stack
	DEC $CE00,X		  ; DE 00 CE | Decrement (absolute,X)
	CPY $AD00			; CC 00 AD | Compare Y register (absolute)
	BIT $0C8D			; 2C 8D 0C | Test bits in accumulator (absolute)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1F5
; Address: $E8F4E7
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1F5:
	PHP				  ; 08 | Push processor status to stack
	REP #$00			 ; C2 00 | Reset processor status bits
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	REP #$00			 ; C2 00 | Reset processor status bits
	NOP				  ; EA | No operation
	PHP				  ; 08 | Push processor status to stack
	INC $F600,X		  ; FE 00 F6 | Increment (absolute,X)
	INC $F600,X		  ; FE 00 F6 | Increment (absolute,X)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	SEC				  ; 38 | Set carry flag
	BMI $08			  ; 30 08 | Branch if negative
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BVC $38			  ; 50 38 | Branch if overflow clear
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1F6
; Address: $E8F510
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1F6:
	JSR $5000			; 20 00 50 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	ROR $465C			; 6E 5C 46 | Rotate right (absolute)
	JMP $514D51		  ; 5C 51 4D 51 | Jump to address long
	EOR $4C72			; 4D 72 4C | Exclusive OR with accumulator (absolute)
	ADC ($4C),Y		  ; 71 4C | Add with carry ((zero page),Y)
	SBC ($5D,X)		  ; E1 5D | Subtract with carry ((zero page,X))
	SBC $FD83,X		  ; FD 83 FD | Subtract with carry (absolute,X)
	SBC $FE83,X		  ; FD 83 FE | Subtract with carry (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	DEC $CFDE,X		  ; DE DE CF | Decrement (absolute,X)
	DEC $9C94,X		  ; DE 94 9C | Decrement (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ROL $F7FF,X		  ; 3E FF F7 | Rotate left (absolute,X)
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	AND ($FE,X)		  ; 21 FE | Logical AND with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP ($7F,X)		  ; C1 7F | Compare accumulator ((zero page,X))
	EOR #$0D			 ; 49 0D | Exclusive OR with accumulator (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	ROR				  ; 6A | Rotate right (accumulator)
	INC $EFE9			; EE E9 EF | Increment (absolute)
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	STZ $F2FF,X		  ; 9E FF F2 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1F7
; Address: $E8F572
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1F7:
	STA				  ; 9F EF 11 FF | Update graphics data
	BPL $FF			  ; 10 FF | Branch if positive
	INX				  ; E8 | Increment X register
	LDA				  ; BF F4 CB 07 | Read graphics status
	STA $DD67,Y		  ; 99 67 DD | Update graphics data
	SBC $C45C			; ED 5C C4 | Subtract with carry (absolute)
	JMP $514E53		  ; 5C 53 4E 51 | Jump to address long
	JMP $4E73			; 4C 73 4E | Jump to address
	LSR $A266,X		  ; 5E 66 A2 | Logical shift right (absolute,X)
	LDX $7E83,Y		  ; BE 83 7E | Load from absolute,Y into X register
	ROR $7F83,X		  ; 7E 83 7F | Rotate right (absolute,X)
	STA ($FE,X)		  ; 81 FE | Update graphics data
	INC $FE81,X		  ; FE 81 FE | Increment (absolute,X)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	ADC $7900,Y		  ; 79 00 79 | Add with carry (absolute,Y)
	DEX				  ; CA | Decrement X register
	PHX				  ; DA | Push X register to stack
	BPL $65			  ; 10 65 | Branch if positive
	ADC $00			  ; 65 00 | Add with carry (zero page)
	SBC $EF00			; ED 00 EF | Subtract with carry (absolute)
	LDA $00AF00		  ; AF 00 AF 00 | Read graphics status
	LDA $006F00		  ; AF 00 6F 00 | Read graphics status
	LDA				  ; BF 00 BF 00 | Read graphics status
	LDA				  ; BF 00 84 00 | Read graphics status
	STA $9D08,X		  ; 9D 08 9D | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	LDA $18BF08		  ; AF 08 BF 18 | Read graphics status
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	TAX				  ; AA | Transfer accumulator to X register
	PHP				  ; 08 | Push processor status to stack
	DEC $DF00			; CE 00 DF | Decrement (absolute)
	REP #$00			 ; C2 00 | Reset processor status bits
	SEP #$00			 ; E2 00 | Set processor status bits
	JMP ($6C00)		  ; 6C 00 6C | Jump to address (absolute indirect)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CPY #$B8			 ; C0 B8 | Compare Y register (immediate)
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1F9
; Address: $E8F672
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1F9:
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1FA
; Address: $E8F67E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1FA:
	JSR $8700			; 20 00 87 | Jump to subroutine
	ASL $3FB7,X		  ; 1E B7 3F | Arithmetic shift left (absolute,X)
	STZ $D23F			; 9C 3F D2 | Store zero to absolute
	ADC $6CC7,X		  ; 7D C7 6C | Add with carry (absolute,X)
	CMP ($7E,X)		  ; C1 7E | Compare accumulator ((zero page,X))
	INC $F9			  ; E6 F9 | Increment (zero page)
	CMP $7A			  ; C5 7A | Compare accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1FB
; Address: $E8F698
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1FB:
	TXA				  ; 8A | Transfer X register to accumulator
	ADC $728D,X		  ; 7D 8D 72 | Add with carry (absolute,X)
	STY $7B			  ; 84 7B | Store Y register to zero page
	ADC $C87F,X		  ; 7D 7F C8 | Add with carry (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $AFF1,X		  ; FE F1 AF | Increment (absolute,X)
	PHX				  ; DA | Push X register to stack
	DEC $FFFF			; CE FF FF | Decrement (absolute)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 88 77 C0 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $B9			  ; 46 B9 | Logical shift right (zero page)
	SBC $7E8F,X		  ; FD 8F 7E | Subtract with carry (absolute,X)
	ROR $47FF			; 6E FF 47 | Rotate right (absolute)
	ROR $FECC,X		  ; 7E CC FE | Rotate right (absolute,X)
	STA $5472			; 8D 72 54 | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	BIT $42D3			; 2C D3 42 | Hardware register operation
	LDA $F30D,X		  ; BD 0D F3 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $0F			  ; F0 0F | Branch if equal
	LDA #$EC			 ; A9 EC | Read graphics status
	STA $AD70,X		  ; 9D 70 AD | Update graphics data
	PEA #$D872		   ; F4 72 D8 | Push effective address to stack
	LDA $C1DC,Y		  ; B9 DC C1 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	SBC $93FC			; ED FC 93 | Subtract with carry (absolute)
	ROR $F20F,X		  ; 7E 0F F2 | Rotate right (absolute,X)
	ROR $5CAB,X		  ; 7E AB 5C | Rotate right (absolute,X)
	SBC $E61B			; ED 1B E6 | Subtract with carry (absolute)
	LDX $9E63,Y		  ; BE 63 9E | Load from absolute,Y into X register
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $0500			; 0D 00 05 | Logical OR with accumulator (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1FC
; Address: $E8F760
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1FC:
	LDA				  ; BF 00 BF 00 | Read graphics status
	LDA $9F00,X		  ; BD 00 9F | Read graphics status
	STA $9D00			; 8D 00 9D | Update graphics data
	STA $BF00,X		  ; 9D 00 BF | Update graphics data
	LDA				  ; BF 00 BD 00 | Read graphics status
	LDA				  ; BF 00 BD 00 | Read graphics status
	LDA $BD00,X		  ; BD 00 BD | Read graphics status
	LDA $F200,X		  ; BD 00 F2 | Read graphics status
	BPL $EA			  ; 10 EA | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	SEP #$00			 ; E2 00 | Set processor status bits
	SEP #$00			 ; E2 00 | Set processor status bits
	INC $00			  ; E6 00 | Increment (zero page)
	INC $00			  ; E6 00 | Increment (zero page)
	LDA $00EB00		  ; AF 00 EB 00 | Read graphics status
	LDA				  ; BF 00 FB 00 | Read graphics status
	JMP ($EC00)		  ; 6C 00 EC | Jump to address (absolute indirect)
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	STA				  ; 9F C0 1D 80 | Update graphics data
	STA ($6B,X)		  ; 81 6B | Update graphics data
	STA ($54,X)		  ; 81 54 | Update graphics data
	LDX $BEE8,Y		  ; BE E8 BE | Load from absolute,Y into X register
	ROR $2C2C,X		  ; 7E 2C 2C | Rotate right (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Update graphics data

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1FD
; Address: $E8F7E2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1FD:
	JSR $6000			; 20 00 60 | Jump to subroutine
	DEX				  ; CA | Decrement X register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1FE
; Address: $E8F7F2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1FE:
	JSR $6200			; 20 00 62 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_1FF
; Address: $E8F80C
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_1FF:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND $3900,Y		  ; 39 00 39 | Logical AND with accumulator (absolute,Y)
	AND $3100,Y		  ; 39 00 31 | Logical AND with accumulator (absolute,Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND $3900,Y		  ; 39 00 39 | Logical AND with accumulator (absolute,Y)
	AND $3100,Y		  ; 39 00 31 | Logical AND with accumulator (absolute,Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	STZ $BC00			; 9C 00 BC | Store zero to absolute
	LDY $B400,X		  ; BC 00 B4 | Load from absolute,X into Y register
	CLV				  ; B8 | Clear overflow flag
	BCS $00			  ; B0 00 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY $BC00,X		  ; BC 00 BC | Load from absolute,X into Y register
	LDY $B400,X		  ; BC 00 B4 | Load from absolute,X into Y register
	CLV				  ; B8 | Clear overflow flag
	BCS $00			  ; B0 00 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_200
; Address: $E8F8AE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_200:
	JSR $3800			; 20 00 38 | Jump to subroutine
	CLV				  ; B8 | Clear overflow flag
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_201
; Address: $E8F8BE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_201:
	JSR $1000			; 20 00 10 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDA $8D20,Y		  ; B9 20 8D | Read graphics status
	STA $001000		  ; 8F 00 10 00 | Update graphics data
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_202
; Address: $E8F8E0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_202:
	JSR $6000			; 20 00 60 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	CPY $00			  ; C4 00 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_203
; Address: $E8F8EA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_203:
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_204
; Address: $E8F8F0
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_204:
	JSR $6000			; 20 00 60 | Jump to subroutine
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $1600			; 8C 00 16 | Store Y register to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1600			; 0E 00 16 | Arithmetic shift left (absolute)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $7C00			; 0E 00 7C | Arithmetic shift left (absolute)
	PEA #$D400		   ; F4 00 D4 | Push effective address to stack
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	LSR $6E7C,X		  ; 5E 7C 6E | Logical shift right (absolute,X)
	JMP $585C46		  ; 5C 46 5C 58 | Jump to address long
	JMP $0D11			; 4C 11 0D | Jump to address
	AND $304D,Y		  ; 39 4D 30 | Logical AND with accumulator (absolute,Y)
	JMP $3C65			; 4C 65 3C | Jump to address
	SBC $FD83,X		  ; FD 83 FD | Subtract with carry (absolute,X)
	SBC $FF83,X		  ; FD 83 FF | Subtract with carry (absolute,X)
	REP #$FF			 ; C2 FF | Reset processor status bits
	INC $7CDC,X		  ; FE DC 7C | Increment (absolute,X)
	CPX $445C			; EC 5C 44 | Compare X register (absolute)
	JMP $984C50		  ; 5C 50 4C 98 | Jump to address long
	LSR $6E1A			; 4E 1A 6E | Logical shift right (absolute)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	STA ($FF,X)		  ; 81 FF | Update graphics data
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_206
; Address: $E8F98C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_206:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_208
; Address: $E8F99C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_208:
	JSR $0000			; 20 00 00 | Jump to subroutine
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_209
; Address: $E8F9B2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_209:
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_20B
; Address: $E8F9CC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_20B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_20D
; Address: $E8F9DC
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_20D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $00			  ; 90 00 | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_211
; Address: $E8FA1C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_211:
	JSL $002000		  ; 22 00 20 00 | Jump to subroutine long
	ADC $7F00,X		  ; 7D 00 7F | Add with carry (absolute,X)
	ASL $1600,X		  ; 1E 00 16 | Arithmetic shift left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $1600,X		  ; 1E 00 16 | Arithmetic shift left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	LDX $AE00			; AE 00 AE | Load from absolute address into X register
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_212
; Address: $E8FA56
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_212:
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $00			  ; 84 00 | Store Y register to zero page
	LDY $00			  ; A4 00 | Load from zero page into Y register
	LDY $00			  ; A4 00 | Load from zero page into Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PLY				  ; 7A | Pull Y register from stack
	DEC				  ; 3A | Decrement accumulator
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	INC $C888,X		  ; FE 88 C8 | Increment (absolute,X)
	JMP $474853		  ; 5C 53 48 47 | Jump to address long
	PLP				  ; 28 | Pull processor status from stack
	STA $FF			  ; 85 FF | Update graphics data
	BRA $FF			  ; 80 FF | Branch always
	CPX $7F			  ; E4 7F | Compare X register (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA $F0BFF0		  ; AF F0 BF F0 | Read graphics status
	BNE $7C			  ; D0 7C | Branch if not equal
	DEC $BE			  ; C6 BE | Decrement (zero page)
	CMP $40D9,Y		  ; D9 D9 40 | Compare accumulator (absolute,Y)
	ROR $8A4A,X		  ; 7E 4A 8A | Rotate right (absolute,X)
	ROL $C6			  ; 26 C6 | Rotate left (zero page)
	SEP #$14			 ; E2 14 | Set processor status bits
	CPX #$83			 ; E0 83 | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	SBC $FD1F,Y		  ; F9 1F FD | Subtract with carry (absolute,Y)
	JMP $2800			; 4C 00 28 | Jump to address
	LDY #$B6			 ; A0 B6 | Load immediate value into Y register
	EOR $5963,Y		  ; 59 63 59 | Exclusive OR with accumulator (absolute,Y)
	LDA $4A62			; AD 62 4A | Read graphics status
	PLY				  ; 7A | Pull Y register from stack
	BPL $EF			  ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_213
; Address: $E8FAF4
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_213:
	JSR $45DF			; 20 DF 45 | Jump to subroutine
	TSX				  ; BA | Transfer stack pointer to X register
	EOR $BA			  ; 45 BA | Exclusive OR with accumulator (zero page)
	AND #$D6			 ; 29 D6 | Logical AND with accumulator (immediate)
	LDA $AD52			; AD 52 AD | Read graphics status
	JMP $004C			; 4C 4C 00 | Jump to address
	WDM #$8E			 ; 42 8E | Reserved instruction
	STX $7272			; 8E 72 72 | Store X register to absolute address
	BIT #$89			 ; 89 89 | Test bits in accumulator (immediate)
	STY $5273			; 8C 73 52 | Store Y register to absolute address
	LDA $DA25			; AD 25 DA | Read graphics status
	BVC $AF			  ; 50 AF | Branch if overflow clear
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_214
; Address: $E8FB42
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_214:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ASL $2C0E,X		  ; 1E 0E 2C | Arithmetic shift left (absolute,X)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_217
; Address: $E8FC4D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_217:
	ASL $1F08,X		  ; 1E 08 1F | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_218
; Address: $E8FC5C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_218:
	ASL $1300,X		  ; 1E 00 13 | Arithmetic shift left (absolute,X)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BVC $0C			  ; 50 0C | Branch if overflow clear
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BPL $24			  ; 10 24 | Branch if positive
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_21A
; Address: $E8FC72
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_21A:
	JSR $B000			; 20 00 B0 | Jump to subroutine
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA $0204			; 0D 04 02 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0900			; 0E 00 09 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	WDM #$D0			 ; 42 D0 | Reserved instruction
	JMP $90E0			; 4C E0 90 | Jump to address
	BRA $60			  ; 80 60 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROR $BC00,X		  ; 7E 00 BC | Rotate right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA $0603,X		  ; 1D 03 06 | Logical OR with accumulator (absolute,X)
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ASL $2D			  ; 06 2D | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $3300,X		  ; 1D 00 33 | Logical OR with accumulator (absolute,X)
	BVS $10			  ; 70 10 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_21C
; Address: $E8FCEA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_21C:
	JSR $00B0			; 20 B0 00 | Jump to subroutine
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_21D
; Address: $E8FCF0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_21D:
	BVC $00			  ; 50 00 | Branch if overflow clear
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BNE $00			  ; D0 00 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_21E
; Address: $E8FD05
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_21E:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($38),Y		  ; 11 38 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1800,Y		  ; 19 00 18 | Logical OR with accumulator (absolute,Y)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_21F
; Address: $E8FD27
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_21F:
	JSR $50E0			; 20 E0 50 | Jump to subroutine
	BEQ $48			  ; F0 48 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_220
; Address: $E8FD30
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_220:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	ORA $042F,Y		  ; 19 2F 04 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHA				  ; 48 | Push accumulator to stack
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	SEI				  ; 78 | Set interrupt disable flag
	BPL $D8			  ; 10 D8 | Branch if positive
	BCC $28			  ; 90 28 | Branch if carry clear
	RTI				  ; 40 | Return from interrupt
	BNE $40			  ; D0 40 | Branch if not equal

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_221
; Address: $E8FD6B
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_221:
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CLD				  ; D8 | Clear decimal mode flag
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	BIT $3E			  ; 24 3E | Test bits in accumulator (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_222
; Address: $E8FE03
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_222:
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	DEC $71			  ; C6 71 | Decrement (zero page)
	CMP $FF26,Y		  ; D9 26 FF | Compare accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	ASL $0EDF,X		  ; 1E DF 0E | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_223
; Address: $E8FE30
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_223:
	JSR $10C1			; 20 C1 10 | Jump to subroutine
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	INC $EC00,X		  ; FE 00 EC | Increment (absolute,X)
	BPL $EC			  ; 10 EC | Branch if positive
	BPL $E0			  ; 10 E0 | Game work RAM access
	BRA $40			  ; 80 40 | Branch always
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	INC $F910			; EE 10 F9 | Increment (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CPX #$BC			 ; E0 BC | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	STZ $EE60			; 9C 60 EE | Store zero to absolute
	INC $1000			; EE 00 10 | Increment (absolute)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_224
; Address: $E8FE6B
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_224:
	ROR $7E7E,X		  ; 7E 7E 7E | Rotate right (absolute,X)
	ROR $7C7D,X		  ; 7E 7D 7C | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $97FE,Y		  ; F9 FE 97 | Subtract with carry (absolute,Y)
	DEX				  ; CA | Decrement X register
	ROL $5827,X		  ; 3E 27 58 | Rotate left (absolute,X)
	CPX $0000			; EC 00 00 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	DEX				  ; CA | Decrement X register
	ROL $5827,X		  ; 3E 27 58 | Rotate left (absolute,X)
	CPX $0000			; EC 00 00 | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $AF3F,X		  ; FE 3F AF | Increment (absolute,X)
	LDA $8C39,Y		  ; B9 39 8C | Read graphics status
	CLI				  ; 58 | Clear interrupt disable flag
	LSR $1F07,X		  ; 5E 07 1F | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_225
; Address: $E8FEEF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_225:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	BCC $00			  ; 90 00 | Branch if carry clear
	DEC $40			  ; C6 40 | Decrement (zero page)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_226
; Address: $E8FEF9
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_226:
	JSR $2068			; 20 68 20 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	CPY #$DE			 ; C0 DE | Compare Y register (immediate)
	SBC ($05,X)		  ; E1 05 | Subtract with carry ((zero page,X))
	ROL $FF87,X		  ; 3E 87 FF | Rotate left (absolute,X)
	JMP ($CCDC)		  ; 6C DC CC | Jump to address (absolute indirect)
	STA ($7E,X)		  ; 81 7E | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	ROR $0C00,X		  ; 7E 00 0C | Rotate right (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ORA ($25,X)		  ; 01 25 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_228
; Address: $E8FF3A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_228:
	RTI				  ; 40 | Return from interrupt
	BPL $40			  ; 10 40 | Branch if positive
	STZ $0F00			; 9C 00 0F | Store zero to absolute
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PEA #$6409		   ; F4 09 64 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank50_GraphicsFunction_229
; Address: $E8FF67
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank50_GraphicsFunction_229:
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	LDA $6C02,X		  ; BD 02 6C | Read graphics status
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ORA $1E			  ; 05 1E | Logical OR with accumulator (zero page)
	ASL $01F9			; 0E F9 01 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	STA				  ; 9F 6C 46 BE | Update graphics data
	BIT $BF00			; 2C 00 BF | Test bits in accumulator (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA ($FC),Y		  ; B1 FC | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STA ($88,X)		  ; 81 88 | Update graphics data
	DEC $F8			  ; C6 F8 | Decrement (zero page)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $70			  ; F0 70 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
