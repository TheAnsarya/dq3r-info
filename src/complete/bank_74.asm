;==============================================================================
; Dragon Quest III - Bank $74
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $FA0000-$FA7FFF
; Instructions: 8444
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_74"

;------------------------------------------------------------------------------
; Bank74_DmaFunction_000
; Address: $FA8000
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_000:
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	STA $48			  ; 85 48 | Store accumulator to zero page
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FFFD,X		  ; FD FD FF | Subtract with carry (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $28			  ; 10 28 | Branch if positive
	BPL $48			  ; 10 48 | Branch if positive
	BPL $48			  ; 10 48 | Branch if positive
	BPL $88			  ; 10 88 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA $1F607F		  ; 8F 7F 60 1F | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank74_DmaFunction_001
; Address: $FA806A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_001:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA $F6			  ; 05 F6 | Logical OR with accumulator (zero page)
	AND $CD2E,X		  ; 3D 2E CD | Logical AND with accumulator (absolute,X)
	SEP #$E2			 ; E2 E2 | Set processor status bits
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDX #$E2			 ; A2 E2 | Load immediate value into X register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BIT $30C0			; 2C C0 30 | Test bits in accumulator (absolute)
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_002
; Address: $FA80A6
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_002:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVC $70			  ; 50 70 | Branch if overflow clear
	BCS $F0			  ; B0 F0 | Branch if carry set
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ADC $7E2E,X		  ; 7D 2E 7E | Add with carry (absolute,X)
	ROL $1F13,X		  ; 3E 13 1F | Rotate left (absolute,X)
	ORA ($1B,X)		  ; 01 1B | Logical OR with accumulator ((zero page,X))
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	BPL $0F			  ; 10 0F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	AND ($41),Y		  ; 31 41 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_003
; Address: $FA80D5
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_003:
	JSR $201C			; 20 1C 20 | Jump to subroutine
	ASL $0A30			; 0E 30 0A | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BCS $20			  ; B0 20 | Branch if carry set
	BNE $00			  ; D0 00 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	BRA $EC			  ; 80 EC | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	PEA #$EED0		   ; F4 D0 EE | Push effective address to stack
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BVC $40			  ; 50 40 | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_005
; Address: $FA80F7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_005:
	JSR $0004			; 20 04 00 | Jump to subroutine
	BPL $0A			  ; 10 0A | Branch if positive
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_006
; Address: $FA80FE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_006:
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $00FF			; ED FF 00 | Subtract with carry (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $60			  ; 80 60 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BPL $2D			  ; 10 2D | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank74_DmaFunction_007
; Address: $FA817F
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_007:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	LDA ($40,X)		  ; A1 40 | Load from (zero page,X) into accumulator
	STA $8F40,Y		  ; 99 40 8F | Store accumulator to absolute,Y
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	SBC $F6F9,Y		  ; F9 F9 F6 | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $20			  ; 80 20 | Branch always
	RTI				  ; 40 | Return from interrupt
	BCC $20			  ; 90 20 | Branch if carry clear
	BPL $20			  ; 10 20 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	EOR $89			  ; 45 89 | Exclusive OR with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $A5			  ; C5 A5 | Compare accumulator (zero page)
	ORA $57			  ; 05 57 | Logical OR with accumulator (zero page)
	STA $7199,Y		  ; 99 99 71 | Store accumulator to absolute,Y
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	SEP #$4D			 ; E2 4D | Set processor status bits
	DEC				  ; 3A | Decrement accumulator
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	CPX $6698			; EC 98 66 | Compare X register (absolute)
	STZ $9CFE			; 9C FE 9C | Store zero to absolute
	SBC ($9E),Y		  ; F1 9E | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_008
; Address: $FA81E7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_008:
	STZ $BEFB,X		  ; 9E FB BE | Store zero to absolute,X
	LDX $3EF5,Y		  ; BE F5 3E | Load from absolute,Y into X register
	ROR $0460,X		  ; 7E 60 04 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_00A
; Address: $FA81F8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_00A:
	RTI				  ; 40 | Return from interrupt
	ASL $C0			  ; 06 C0 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	TSX				  ; BA | Transfer stack pointer to X register
	BCC $01			  ; 90 01 | Branch if carry clear
	SEI				  ; 78 | Set interrupt disable flag
	INC $0028			; EE 28 00 | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	ROR $870E			; 6E 0E 87 | Rotate right (absolute)
	ORA ($D7,X)		  ; 01 D7 | Logical OR with accumulator ((zero page,X))
	ORA #$C9			 ; 09 C9 | Logical OR with accumulator (immediate)
	CPY $24			  ; C4 24 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_00B
; Address: $FA8224
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_00B:
	JSL $091112		  ; 22 12 11 09 | Jump to subroutine long
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND $1E3F,X		  ; 3D 3F 1E | Logical AND with accumulator (absolute,X)
	ASL $070F			; 0E 0F 07 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BMI $20			  ; 30 20 | Branch if negative
	BCS $A0			  ; B0 A0 | Branch if carry set
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $58			  ; 50 58 | Branch if overflow clear
	BVC $2C			  ; 50 2C | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	LDY $4AA8			; AC A8 4A | Load from absolute address into Y register
	PHA				  ; 48 | Push accumulator to stack
	ROL				  ; 2A | Rotate left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	BNE $F0			  ; D0 F0 | Branch if not equal
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	INC $FED6,X		  ; FE D6 FE | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	EOR $8009,X		  ; 5D 09 80 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_00C
; Address: $FA8283
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_00C:
	ASL $1477,X		  ; 1E 77 14 | Arithmetic shift left (absolute,X)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ORA $6618,Y		  ; 19 18 66 | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_00E
; Address: $FA8291
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_00E:
	BVS $E1			  ; 70 E1 | Branch if overflow set
	BRA $EB			  ; 80 EB | Branch always
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR $00			  ; 66 00 | Rotate right (zero page)
	STA $9C00,Y		  ; 99 00 9C | Store accumulator to absolute,Y
	CLC				  ; 18 | Clear carry flag
	BIT #$49			 ; 89 49 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	BIT $22			  ; 24 22 | Test bits in accumulator (zero page)
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	AND $2D3F,X		  ; 3D 3F 2D | Logical AND with accumulator (absolute,X)
	ASL $181F,X		  ; 1E 1F 18 | Arithmetic shift left (absolute,X)
	BPL $98			  ; 10 98 | Branch if positive
	BCC $8C			  ; 90 8C | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	JMP $4C48			; 4C 48 4C | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	JMP $4C48			; 4C 48 4C | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	JMP $E848			; 4C 48 E8 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	LDA $49CD			; AD CD 49 | Load from absolute address into accumulator
	BIT #$1A			 ; 89 1A | Test bits in accumulator (immediate)
	TXS				  ; 9A | Transfer X register to stack pointer
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $0932			; 0D 32 09 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ADC $52			  ; 65 52 | Add with carry (zero page)
	LDA $AD52			; AD 52 AD | Load from absolute address into accumulator
	LDA $FD02			; AD 02 FD | Load from absolute address into accumulator
	LDX #$97			 ; A2 97 | Load immediate value into X register
	STA $CFDF87		  ; 8F 87 DF CF | Store accumulator to absolute long address
	INC $2C7F,X		  ; FE 7F 2C | Increment (absolute,X)
	BNE $28			  ; D0 28 | Branch if not equal
	LDA ($5C,X)		  ; A1 5C | Load from (zero page,X) into accumulator
	BCC $68			  ; 90 68 | Branch if carry clear
	BRA $78			  ; 80 78 | Branch always
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_00F
; Address: $FA831F
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_00F:
	BRA $E7			  ; 80 E7 | Branch always
	ROR $FAEF,X		  ; 7E EF FA | Rotate right (absolute,X)
	SBC ($F6,X)		  ; E1 F6 | Subtract with carry ((zero page,X))
	CMP $D5FA			; CD FA D5 | Compare accumulator (absolute)
	PLX				  ; FA | Pull X register from stack
	TXA				  ; 8A | Transfer X register to accumulator
	CPX $1A			  ; E4 1A | Compare X register (zero page)
	PEA #$D00C		   ; F4 0C D0 | Push effective address to stack
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	INC $00A6			; EE A6 00 | Increment (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	INC $5E			  ; E6 5E | Increment (zero page)
	STX $06			  ; 86 06 | Store X register to zero page
	EOR $6600,Y		  ; 59 00 66 | Exclusive OR with accumulator (absolute,Y)
	ORA $3980,Y		  ; 19 80 39 | Logical OR with accumulator (absolute,Y)
	BRA $18			  ; 80 18 | Branch always
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $060F			; 0E 0F 06 | Arithmetic shift left (absolute)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVC $40			  ; 50 40 | Branch if overflow clear
	BMI $30			  ; 30 30 | Branch if negative
	BCS $D0			  ; B0 D0 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	CPX $62B4			; EC B4 62 | Compare X register (absolute)
	PLY				  ; 7A | Pull Y register from stack
	PEA #$FB5E		   ; F4 5E FB | Push effective address to stack
	EOR $F0B0			; 4D B0 F0 | Exclusive OR with accumulator (absolute)
	INY				  ; C8 | Increment Y register
	CPX #$28			 ; E0 28 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_010
; Address: $FA8395
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_010:
	JSR $1004			; 20 04 10 | Jump to subroutine
	DEX				  ; CA | Decrement X register
	PHP				  ; 08 | Push processor status to stack
	EOR $84			  ; 45 84 | Exclusive OR with accumulator (zero page)
	ADC ($84,X)		  ; 61 84 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_011
; Address: $FA83BE
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_011:
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	STZ $6060			; 9C 60 60 | Store zero to absolute
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	BMI $C7			  ; 30 C7 | Branch if negative
	CPY $1B1B			; CC 1B 1B | Compare Y register (absolute)
	CPX $E3			  ; E4 E3 | Compare X register (zero page)
	ORA $0707,Y		  ; 19 07 07 | Logical OR with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	ASL $071F,X		  ; 1E 1F 07 | Arithmetic shift left (absolute,X)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_013
; Address: $FA840C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_013:
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	CPX $00FE			; EC FE 00 | Compare X register (absolute)
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_015
; Address: $FA841D
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_015:
	JSR $0801			; 20 01 08 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	CPX $00FE			; EC FE 00 | Compare X register (absolute)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BRA $06			  ; 80 06 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_017
; Address: $FA848C
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_017:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $0D0F			; 0D 0F 0D | Logical OR with accumulator (absolute)
	ORA $0D09,Y		  ; 19 09 0D | Logical OR with accumulator (absolute,Y)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($43,X)		  ; 01 43 | Logical OR with accumulator ((zero page,X))
	STA ($40,X)		  ; 81 40 | Store accumulator to (zero page,X)
	BRA $16			  ; 80 16 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	STA $87			  ; 85 87 | Store accumulator to zero page
	REP #$C3			 ; C2 C3 | Reset processor status bits
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $58			  ; 50 58 | Branch if overflow clear
	BVC $D8			  ; 50 D8 | Branch if overflow clear
	BNE $D8			  ; D0 D8 | Branch if not equal
	BNE $58			  ; D0 58 | Branch if not equal
	BVC $58			  ; 50 58 | Branch if overflow clear
	BVC $70			  ; 50 70 | Branch if overflow clear
	BPL $F0			  ; 10 F0 | Branch if positive
	BPL $A8			  ; 10 A8 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BRA $E8			  ; 80 E8 | Branch always
	LDA $7C2E,Y		  ; B9 2E 7C | Load from absolute,Y into accumulator
	ROL $6C			  ; 26 6C | Rotate left (zero page)
	LSR $5F13,X		  ; 5E 13 5F | Logical shift right (absolute,X)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	ORA ($2F),Y		  ; 11 2F | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	AND ($C1),Y		  ; 31 C1 | Logical AND with accumulator ((zero page),Y)
	AND $2841,Y		  ; 39 41 28 | Logical AND with accumulator (absolute,Y)
	BVC $1C			  ; 50 1C | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_019
; Address: $FA84FB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_019:
	JSR $300F			; 20 0F 30 | Jump to subroutine
	BMI $80			  ; 30 80 | Branch if negative
	BRA $40			  ; 80 40 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_01A
; Address: $FA8508
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_01A:
	RTI				  ; 40 | Return from interrupt
	BCS $00			  ; B0 00 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	BCS $E8			  ; B0 E8 | Branch if carry set
	CPX #$5C			 ; E0 5C | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_01B
; Address: $FA8512
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_01B:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BRA $90			  ; 80 90 | Branch always
	BRA $48			  ; 80 48 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $A2			  ; 30 A2 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_01C
; Address: $FA851F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_01C:
	JSR $4F7E			; 20 7E 4F | Jump to subroutine
	LDA $7F27,X		  ; BD 27 7F | Load from absolute,X into accumulator
	ORA ($2F),Y		  ; 11 2F | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BVS $84			  ; 70 84 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	CMP ($3C,X)		  ; C1 3C | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ASL $0F20,X		  ; 1E 20 0F | Arithmetic shift left (absolute,X)
	BMI $0F			  ; 30 0F | Branch if negative
	BPL $0F			  ; 10 0F | Branch if positive
	BPL $07			  ; 10 07 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	CPY #$60			 ; C0 60 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_01D
; Address: $FA8545
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_01D:
	JSR $F050			; 20 50 F0 | Jump to subroutine
	TAY				  ; A8 | Transfer accumulator to Y register
	CLD				  ; D8 | Clear decimal mode flag
	STY $DC			  ; 84 DC | Store Y register to zero page
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $2E			  ; F0 2E | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_01E
; Address: $FA8552
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_01E:
	JSR $D000			; 20 00 D0 | Jump to subroutine
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_01F
; Address: $FA855A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_01F:
	JSL $188A20		  ; 22 20 8A 18 | Jump to subroutine long
	CMP ($10),Y		  ; D1 10 | Compare accumulator ((zero page),Y)
	BIT $5010			; 2C 10 50 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_021
; Address: $FA8568
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_021:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank74_DmaFunction_022
; Address: $FA8578
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_022:
	JSR $0020			; 20 20 00 | Jump to subroutine
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $42			  ; 80 42 | Hardware register operation
	STX $8C46			; 8E 46 8C | Store X register to absolute address
	WDM #$B4			 ; 42 B4 | Reserved instruction
	SBC $79BF,Y		  ; F9 BF 79 | Subtract with carry (absolute,Y)
	INC $6344,X		  ; FE 44 63 | Increment (absolute,X)
	CMP $CF			  ; C5 CF | Compare accumulator (zero page)
	CPY #$F1			 ; C0 F1 | Compare Y register (immediate)
	CPY #$F2			 ; C0 F2 | Compare Y register (immediate)
	DEX				  ; CA | Decrement X register
	STA $82			  ; 85 82 | Store accumulator to zero page
	STA $06			  ; 85 06 | Store accumulator to zero page
	CLV				  ; B8 | Clear overflow flag
	AND $F002,Y		  ; 39 02 F0 | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	BEQ $38			  ; F0 38 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	PEA #$E83C		   ; F4 3C E8 | Push effective address to stack
	STY $9CF0			; 8C F0 9C | Store Y register to absolute address
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BPL $C4			  ; 10 C4 | Branch if positive
	BPL $E4			  ; 10 E4 | Branch if positive
	DEX				  ; CA | Decrement X register
	PHP				  ; 08 | Push processor status to stack
	REP #$08			 ; C2 08 | Reset processor status bits
	ROR $04			  ; 66 04 | Rotate right (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $303D,Y		  ; 19 3D 30 | Logical OR with accumulator (absolute,Y)
	ASL $071F			; 0E 1F 07 | Arithmetic shift left (absolute)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	REP #$E2			 ; C2 E2 | Reset processor status bits
	SEP #$72			 ; E2 72 | Set processor status bits
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	STA $05DF			; 8D DF 05 | Store accumulator to absolute address
	ORA $0D0F			; 0D 0F 0D | Logical OR with accumulator (absolute)
	SBC $1D0F			; ED 0F 1D | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_024
; Address: $FA861F
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_024:
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $43			  ; 80 43 | Branch always
	STX $B543			; 8E 43 B5 | Store X register to absolute address
	AND ($FB),Y		  ; 31 FB | Logical AND with accumulator ((zero page),Y)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	CPY #$D8			 ; C0 D8 | Compare Y register (immediate)
	CPY #$F1			 ; C0 F1 | Compare Y register (immediate)
	CMP ($CA,X)		  ; C1 CA | Compare accumulator ((zero page,X))
	STX $83			  ; 86 83 | Store X register to zero page
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	STA ($11),Y		  ; 91 11 | Store accumulator to (zero page),Y
	STA ($91),Y		  ; 91 91 | Store accumulator to (zero page),Y
	EOR ($89),Y		  ; 51 89 | Exclusive OR with accumulator ((zero page),Y)
	EOR #$89			 ; 49 89 | Exclusive OR with accumulator (immediate)
	EOR #$C9			 ; 49 C9 | Exclusive OR with accumulator (immediate)
	EOR #$C5			 ; 49 C5 | Exclusive OR with accumulator (immediate)
	AND $FF			  ; 25 FF | Logical AND with accumulator (zero page)
	INC $EEFF			; EE FF EE | Increment (absolute)
	PLX				  ; FA | Pull X register from stack
	BPL $20			  ; 10 20 | Branch if positive
	BPL $20			  ; 10 20 | Branch if positive
	BMI $20			  ; 30 20 | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	BNE $F0			  ; D0 F0 | Branch if not equal
	JMP $41FF20		  ; 5C 20 FF 41 | Jump to address long

;------------------------------------------------------------------------------
; Bank74_DmaFunction_025
; Address: $FA8685
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_025:
	JSL $58811A		  ; 22 1A 81 58 | Jump to subroutine long
	SBC ($F8,X)		  ; E1 F8 | Subtract with carry ((zero page,X))
	LDA ($F9,X)		  ; A1 F9 | Load from (zero page,X) into accumulator
	SBC ($F8,X)		  ; E1 F8 | Subtract with carry ((zero page,X))
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	ROL $DD74,X		  ; 3E 74 DD | Rotate left (absolute,X)
	ASL $DF17,X		  ; 1E 17 DF | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_026
; Address: $FA86A0
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_026:
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	SBC $48			  ; E5 48 | Subtract with carry (zero page)
	STZ $28			  ; 64 28 | Store zero to zero page
	PLP				  ; 28 | Pull processor status from stack
	BIT $28			  ; 24 28 | Test bits in accumulator (zero page)
	STZ $7E08			; 9C 08 7E | Store zero to absolute
	INC $BF1E,X		  ; FE 1E BF | Increment (absolute,X)
	LDA				  ; BF DF FC DF | Load from absolute long,X into accumulator
	ADC ($AB),Y		  ; 71 AB | Add with carry ((zero page),Y)
	LSR $54			  ; 46 54 | Logical shift right (zero page)
	BIT $5A			  ; 24 5A | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	EOR $31			  ; 45 31 | Exclusive OR with accumulator (zero page)
	AND #$11			 ; 29 11 | Logical AND with accumulator (immediate)
	AND ($0E),Y		  ; 31 0E | Logical AND with accumulator ((zero page),Y)
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	ASL $7F1E,X		  ; 1E 1E 7F | Arithmetic shift left (absolute,X)
	SBC ($E0,X)		  ; E1 E0 | Game work RAM access
	STX $86			  ; 86 86 | Store X register to zero page
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $7F			  ; 80 7F | Branch always
	ASL $7FE1,X		  ; 1E E1 7F | Arithmetic shift left (absolute,X)
	BRA $E0			  ; 80 E0 | Game work RAM access
	STX $79			  ; 86 79 | Store X register to zero page
	CLC				  ; 18 | Clear carry flag
	CPY $E9F9			; CC F9 E9 | Compare Y register (absolute)
	AND $6D35,X		  ; 3D 35 6D | Logical AND with accumulator (absolute,X)
	ORA $9D			  ; 05 9D | Logical OR with accumulator (zero page)
	STA $8D			  ; 85 8D | Store accumulator to zero page
	ORA $6D			  ; 05 6D | Logical OR with accumulator (zero page)
	ORA $3E			  ; 05 3E | Logical OR with accumulator (zero page)
	ASL $7A			  ; 06 7A | Arithmetic shift left (zero page)
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ORA $58E3,Y		  ; 19 E3 58 | Logical OR with accumulator (absolute,Y)
	BVC $58			  ; 50 58 | Branch if overflow clear
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	LDY #$60			 ; A0 60 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_028
; Address: $FA872B
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_028:
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	BVC $F0			  ; 50 F0 | Branch if overflow clear
	LDY #$E0			 ; A0 E0 | Game work RAM access
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$EB			 ; C0 EB | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $76			  ; 80 76 | Branch always
	BVS $3F			  ; 70 3F | Branch if overflow set
	DEC				  ; 3A | Decrement accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $FB			  ; 80 FB | Branch always
	INC $BD01,X		  ; FE 01 BD | Increment (absolute,X)
	CPX $B8			  ; E4 B8 | Compare X register (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	WDM #$03			 ; 42 03 | Reserved instruction
	STY $07			  ; 84 07 | Store Y register to zero page
	LSR $5C			  ; 46 5C | Logical shift right (zero page)
	BIT $F8			  ; 24 F8 | Test bits in accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BNE $A0			  ; D0 A0 | Branch if not equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BPL $30			  ; 10 30 | Branch if positive
	BEQ $F0			  ; F0 F0 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_029
; Address: $FA87A1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_029:
	JSL $322D3B		  ; 22 3B 2D 32 | Jump to subroutine long
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	ORA $1C0A,X		  ; 1D 0A 1C | Logical OR with accumulator (absolute,X)
	PHX				  ; DA | Push X register to stack
	BIT $075F			; 2C 5F 07 | Test bits in accumulator (absolute)
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_02A
; Address: $FA87B8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_02A:
	JSL $03E303		  ; 22 03 E3 03 | Jump to subroutine long
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)
	SBC $7F5F,X		  ; FD 5F 7F | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_02B
; Address: $FA87C3
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_02B:
	JSL $62A386		  ; 22 86 A3 62 | Jump to subroutine long
	ADC ($E0),Y		  ; 71 E0 | Game work RAM access
	LDX $C77A,Y		  ; BE 7A C7 | Load from absolute,Y into X register
	AND ($FC),Y		  ; 31 FC | Logical AND with accumulator ((zero page),Y)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	CMP $5CC0,X		  ; DD C0 5C | Compare accumulator (absolute,X)
	BRA $8E			  ; 80 8E | Branch always
	ROR $4700			; 6E 00 47 | Rotate right (absolute)
	SEC				  ; 38 | Set carry flag
	LDA				  ; BF 7A FE 44 | Load from absolute long,X into accumulator
	ADC ($C5,X)		  ; 61 C5 | Add with carry ((zero page,X))
	LSR $8E			  ; 46 8E | Logical shift right (zero page)
	LDA #$4E			 ; A9 4E | Load immediate value into accumulator
	ADC $E35E,X		  ; 7D 5E E3 | Add with carry (absolute,X)
	STY $853F			; 8C 3F 85 | Store Y register to absolute address
	DEC				  ; 3A | Decrement accumulator
	ORA ($71,X)		  ; 01 71 | Logical OR with accumulator ((zero page,X))
	SEP #$40			 ; E2 40 | Set processor status bits
	RTI				  ; 40 | Return from interrupt
	ADC $25			  ; 65 25 | Add with carry (zero page)
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	PHY				  ; 5A | Push Y register to stack
	ROL				  ; 2A | Rotate left (accumulator)
	LSR $DA33			; 4E 33 DA | Logical shift right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	CPX $ADFF			; EC FF AD | Compare X register (absolute)
	LDA				  ; BF 55 DF D5 | Load from absolute long,X into accumulator
	CPY $48			  ; C4 48 | Compare Y register (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_030
; Address: $FA8829
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_030:
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	LDY #$E0			 ; A0 E0 | Game work RAM access
	LDY #$E0			 ; A0 E0 | Game work RAM access
	LDY #$E0			 ; A0 E0 | Game work RAM access
	LDY #$E0			 ; A0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank74_DmaFunction_031
; Address: $FA8838
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_031:
	LDY #$E0			 ; A0 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$74			 ; C0 74 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC ($19,X)		  ; E1 19 | Subtract with carry ((zero page,X))
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	SBC ($39,X)		  ; E1 39 | Subtract with carry ((zero page,X))
	AND ($99,X)		  ; 21 99 | Logical AND with accumulator ((zero page,X))
	STA ($F9,X)		  ; 81 F9 | Store accumulator to (zero page,X)
	SBC ($79,X)		  ; E1 79 | Subtract with carry ((zero page,X))
	ADC #$19			 ; 69 19 | Add with carry (immediate)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ASL $FFF7,X		  ; 1E F7 FF | Arithmetic shift left (absolute,X)
	ROL $9ED7,X		  ; 3E D7 9E | Rotate left (absolute,X)
	INC $7617,X		  ; FE 17 76 | Increment (absolute,X)
	STA				  ; 9F 16 FF 24 | Store accumulator to absolute long,X
	PLP				  ; 28 | Pull processor status from stack
	BIT $2C28			; 2C 28 2C | Test bits in accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	JMP $5848			; 4C 48 58 | Jump to address
	BVC $58			  ; 50 58 | Branch if overflow clear
	BVC $DC			  ; 50 DC | Branch if overflow clear
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $66			  ; 66 66 | Rotate right (zero page)
	CMP $45			  ; C5 45 | Compare accumulator (zero page)
	CMP #$49			 ; C9 49 | Compare accumulator (immediate)
	EOR $3389,Y		  ; 59 89 33 | Exclusive OR with accumulator (absolute,Y)
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_032
; Address: $FA88AE
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_032:
	JSR $661F			; 20 1F 66 | Jump to subroutine
	STA $BA45,Y		  ; 99 45 BA | Store accumulator to absolute,Y
	EOR #$B6			 ; 49 B6 | Exclusive OR with accumulator (immediate)
	ORA #$76			 ; 09 76 | Logical OR with accumulator (immediate)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CLV				  ; B8 | Clear overflow flag
	ADC $716F,Y		  ; 79 6F 71 | Add with carry (absolute,Y)
	ROR $FAC1,X		  ; 7E C1 FA | Rotate right (absolute,X)
	INX				  ; E8 | Increment X register
	PLP				  ; 28 | Pull processor status from stack
	BEQ $B8			  ; F0 B8 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BVS $81			  ; 70 81 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank74_DmaFunction_034
; Address: $FA88D5
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_034:
	BRA $01			  ; 80 01 | Branch always
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BPL $30			  ; 10 30 | Branch if positive
	JMP $000808		  ; 5C 08 08 00 | Jump to address long
	JMP $000808		  ; 5C 08 08 00 | Jump to address long
	SED				  ; F8 | Set decimal mode flag
	EOR #$72			 ; 49 72 | Exclusive OR with accumulator (immediate)
	STA				  ; 9F 2C 17 6F | Store accumulator to absolute long,X
	BRA $6F			  ; 80 6F | Branch always
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	BPL $36			  ; 10 36 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $45			  ; A5 45 | Load from zero page into accumulator
	PHB				  ; 8B | Push data bank register to stack
	BIT $4803			; 2C 03 48 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_035
; Address: $FA8934
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_035:
	JSL $3A850D		  ; 22 0D 85 3A | Jump to subroutine long
	SBC $A956			; ED 56 A9 | Subtract with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank74_DmaFunction_036
; Address: $FA8944
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_036:
	SBC ($E0,X)		  ; E1 E0 | Game work RAM access
	BCC $6D			  ; 90 6D | Branch if carry clear
	ADC $6A			  ; 65 6A | Add with carry (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	PHX				  ; DA | Push X register to stack
	PHX				  ; DA | Push X register to stack
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BCC $6F			  ; 90 6F | Branch if carry clear
	ADC $9A			  ; 65 9A | Add with carry (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	PHX				  ; DA | Push X register to stack
	AND $95			  ; 25 95 | Logical AND with accumulator (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $9E0B			; 6E 0B 9E | Rotate right (absolute)
	JMP $A7AC57		  ; 5C 57 AC A7 | Jump to address long
	LDY $98A7,X		  ; BC A7 98 | Load from absolute,X into Y register
	STA $8C1864		  ; 8F 64 18 8C | Store accumulator to absolute long address
	BVS $1C			  ; 70 1C | Branch if overflow set
	CPX #$54			 ; E0 54 | Compare X register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$A8			 ; A0 A8 | Load immediate value into Y register
	BVC $B8			  ; 50 B8 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BCC $60			  ; 90 60 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank74_DmaFunction_037
; Address: $FA8980
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_037:
	DEC				  ; 3A | Decrement accumulator
	BCC $41			  ; 90 41 | Branch if carry clear
	CLV				  ; B8 | Clear overflow flag
	ROR $6EA8			; 6E A8 6E | Rotate right (absolute)
	LDX $40			  ; A6 40 | Load from zero page into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	ROL $DE			  ; 26 DE | Rotate left (zero page)
	STX $46			  ; 86 46 | Store X register to zero page
	ROR $070E			; 6E 0E 07 | Rotate right (absolute)
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ORA $2600,Y		  ; 19 00 26 | Logical OR with accumulator (absolute,Y)
	STA $3980,Y		  ; 99 80 39 | Store accumulator to absolute,Y
	BRA $98			  ; 80 98 | Branch always
	BRA $3E			  ; 80 3E | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	AND #$3B			 ; 29 3B | Logical AND with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BEQ $20			  ; F0 20 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $30			  ; 10 30 | Branch if positive
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_039
; Address: $FA89E7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_039:
	JSR $204D			; 20 4D 20 | Jump to subroutine
	BIT $14			  ; 24 14 | Test bits in accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_03A
; Address: $FA89F4
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_03A:
	JSR $7120			; 20 20 71 | Jump to subroutine
	ADC ($7D),Y		  ; 71 7D | Add with carry ((zero page),Y)
	ADC $3F3A,X		  ; 7D 3A 3F | Add with carry (absolute,X)
	ORA $031F,X		  ; 1D 1F 03 | Logical OR with accumulator (absolute,X)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	ADC ($40,X)		  ; 61 40 | Add with carry ((zero page,X))
	ADC ($40,X)		  ; 61 40 | Add with carry ((zero page,X))
	LDA ($B3,X)		  ; A1 B3 | Load from (zero page,X) into accumulator
	LDA ($00,X)		  ; A1 00 | Load from (zero page,X) into accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	BEQ $50			  ; F0 50 | Branch if equal
	BEQ $81			  ; F0 81 | Branch if equal
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	STA				  ; 9F 00 41 81 | Store accumulator to absolute long,X
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	STA				  ; 9F 80 E0 80 | Store accumulator to absolute long,X
	SEC				  ; 38 | Set carry flag
	BRA $01			  ; 80 01 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_03B
; Address: $FA8A31
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_03B:
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	STX $81			  ; 86 81 | Store X register to zero page
	SEC				  ; 38 | Set carry flag
	CPY $02			  ; C4 02 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	BMI $08			  ; 30 08 | Branch if negative
	BRA $7F			  ; 80 7F | Branch always
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA $A5			  ; A5 A5 | Load from zero page into accumulator
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	LDA #$29			 ; A9 29 | Load immediate value into accumulator
	EOR $A409			; 4D 09 A4 | Exclusive OR with accumulator (absolute)
	CPY #$66			 ; C0 66 | Compare Y register (immediate)
	BEQ $7F			  ; F0 7F | Branch if equal
	SBC $5AA5,X		  ; FD A5 5A | Subtract with carry (absolute,X)
	AND #$D6			 ; 29 D6 | Logical AND with accumulator (immediate)
	AND #$D6			 ; 29 D6 | Logical AND with accumulator (immediate)
	BIT #$76			 ; 89 76 | Test bits in accumulator (immediate)
	LDA $28AD			; AD AD 28 | Load from absolute address into accumulator
	PLP				  ; 28 | Pull processor status from stack
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	ROL $9F			  ; 26 9F | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	INC $B51F,X		  ; FE 1F B5 | Increment (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $2852			; AD 52 28 | Load from absolute address into accumulator
	PLP				  ; 28 | Pull processor status from stack
	AND ($D8,X)		  ; 21 D8 | Logical AND with accumulator ((zero page,X))
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDA $308E,Y		  ; B9 8E 30 | Load from absolute,Y into accumulator
	CPX #$9E			 ; E0 9E | Compare X register (immediate)
	AND $7CC1,X		  ; 3D C1 7C | Logical AND with accumulator (absolute,X)
	STA $FA			  ; 85 FA | Store accumulator to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BEQ $1A			  ; F0 1A | Branch if equal

;------------------------------------------------------------------------------
; Bank74_DmaFunction_03C
; Address: $FA8ACF
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_03C:
	CPX $41B1			; EC B1 41 | Compare X register (absolute)
	AND ($C1,X)		  ; 21 C1 | Logical AND with accumulator ((zero page,X))
	ADC ($01,X)		  ; 61 01 | Add with carry ((zero page,X))
	REP #$03			 ; C2 03 | Reset processor status bits
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $8040,X		  ; 1E 40 80 | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $60			  ; 80 60 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BCS $80			  ; B0 80 | Branch if carry set
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $070F			; 0E 0F 07 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	LDA $FA5E5D		  ; AF 5D 5E FA | Load from absolute long address into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SED				  ; F8 | Set decimal mode flag
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	LDY #$F1			 ; A0 F1 | Load immediate value into Y register
	BRA $83			  ; 80 83 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	STA				  ; 9F 00 C0 00 | Store accumulator to absolute long,X
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BPL $C0			  ; 10 C0 | Branch if positive

;------------------------------------------------------------------------------
; Bank74_DmaFunction_03D
; Address: $FA8BA5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_03D:
	JSR $C000			; 20 00 C0 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_03E
; Address: $FA8BC2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_03E:
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $3C1E,X		  ; 1E 1E 3C | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_03F
; Address: $FA8BEA
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_03F:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $0D0F			; 0D 0F 0D | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1000			; 0E 00 10 | Arithmetic shift left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $A0			  ; F0 A0 | Branch if equal

;------------------------------------------------------------------------------
; Bank74_DmaFunction_040
; Address: $FA8C66
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_040:
	JSR $A8C0			; 20 C0 A8 | Jump to subroutine
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BCC $10			  ; 90 10 | Branch if carry clear
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_041
; Address: $FA8C72
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_041:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVC $10			  ; 50 10 | Branch if overflow clear
	BMI $30			  ; 30 30 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $06			  ; 30 06 | Branch if negative
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $C1			  ; 05 C1 | Logical OR with accumulator (zero page)
	DEC $1FFA,X		  ; DE FA 1F | Decrement (absolute,X)
	AND $7414,Y		  ; 39 14 74 | Logical AND with accumulator (absolute,Y)
	EOR ($A1,X)		  ; 41 A1 | Exclusive OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	DEC				  ; 3A | Decrement accumulator
	CPY #$E7			 ; C0 E7 | Compare Y register (immediate)
	SEP #$E0			 ; E2 E0 | Game work RAM access
	CPY #$EA			 ; C0 EA | Compare Y register (immediate)
	BRA $B9			  ; 80 B9 | Branch always
	STY $80			  ; 84 80 | Store Y register to zero page
	STY $03			  ; 84 03 | Store Y register to zero page
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STA				  ; 9F 00 43 83 | Store accumulator to absolute long,X
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	STA				  ; 9F 80 E0 80 | Store accumulator to absolute long,X
	CLV				  ; B8 | Clear overflow flag
	BRA $03			  ; 80 03 | Branch always
	DEC $C1			  ; C6 C1 | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	CPY $02			  ; C4 02 | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	BMI $08			  ; 30 08 | Branch if negative
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_042
; Address: $FA8D13
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_042:
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	JMP ($ED1D)		  ; 6C 1D ED | Jump to address (absolute indirect)
	EOR ($D9,X)		  ; 41 D9 | Exclusive OR with accumulator ((zero page,X))
	ORA ($1E),Y		  ; 11 1E | Logical OR with accumulator ((zero page),Y)
	ROL $3A09,X		  ; 3E 09 3A | Rotate left (absolute,X)
	ORA ($31,X)		  ; 01 31 | Logical OR with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	SEP #$00			 ; E2 00 | Set processor status bits
	DEC				  ; 3A | Decrement accumulator
	SEC				  ; 38 | Set carry flag
	BVS $70			  ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank74_DmaFunction_043
; Address: $FA8D36
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_043:
	JSR $7000			; 20 00 70 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $D0			  ; 10 D0 | Branch if positive
	CPX $A0			  ; E4 A0 | Compare X register (zero page)
	PHX				  ; DA | Push X register to stack
	CPX #$1D			 ; E0 1D | Compare X register (immediate)
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $0F			  ; F0 0F | Branch if equal
	PLX				  ; FA | Pull X register from stack
	BIT $5E00			; 2C 00 5E | Test bits in accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL $3D11,X		  ; 1E 11 3D | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_044
; Address: $FA8D67
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_044:
	JSR $BA9C			; 20 9C BA | Jump to subroutine
	PHB				  ; 8B | Push data bank register to stack
	AND $74A2,X		  ; 3D A2 74 | Logical AND with accumulator (absolute,X)
	SBC ($F8,X)		  ; E1 F8 | Subtract with carry ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	REP #$03			 ; C2 03 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	ORA ($60,X)		  ; 01 60 | Logical OR with accumulator ((zero page,X))
	BCC $60			  ; 90 60 | Branch if carry clear
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	LDY $3904,X		  ; BC 04 39 | Load from absolute,X into Y register
	EOR $BCD1,X		  ; 5D D1 BC | Exclusive OR with accumulator (absolute,X)
	EOR $2E			  ; 45 2E | Exclusive OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_046
; Address: $FA8D92
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_046:
	SED				  ; F8 | Set decimal mode flag
	BEQ $F4			  ; F0 F4 | Branch if equal
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	CPX #$E2			 ; E0 E2 | Compare X register (immediate)
	CPX #$43			 ; E0 43 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_047
; Address: $FA8D9B
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_047:
	CPY #$D1			 ; C0 D1 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $08			  ; 80 08 | Branch always
	ORA $5B			  ; 05 5B | Logical OR with accumulator (zero page)
	CLV				  ; B8 | Clear overflow flag
	LDA				  ; BF 10 F8 0F | Load from absolute long,X into accumulator
	BEQ $5F			  ; F0 5F | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	PLY				  ; 7A | Pull Y register from stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CLV				  ; B8 | Clear overflow flag
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BCC $5C			  ; 90 5C | Branch if carry clear
	BRA $8C			  ; 80 8C | Branch always
	STY $00			  ; 84 00 | Store Y register to zero page
	JMP $0E0E1C		  ; 5C 1C 0E 0E | Jump to address long
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ROL $73			  ; 26 73 | Rotate left (zero page)
	PHY				  ; 5A | Push Y register to stack
	ROL $00			  ; 26 00 | Rotate left (zero page)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_049
; Address: $FA8E3A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_049:
	JSR $1C79			; 20 79 1C | Jump to subroutine
	AND $FF1F,X		  ; 3D 1F FF | Logical AND with accumulator (absolute,X)
	BRA $60			  ; 80 60 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_04A
; Address: $FA8E43
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_04A:
	BRA $18			  ; 80 18 | Branch always
	BRA $C7			  ; 80 C7 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_04B
; Address: $FA8E4A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_04B:
	ASL $C001,X		  ; 1E 01 C0 | Arithmetic shift left (absolute,X)
	BMI $0C			  ; 30 0C | Branch if negative
	INC $FC80,X		  ; FE 80 FC | Increment (absolute,X)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BPL $40			  ; 10 40 | Branch if positive

;------------------------------------------------------------------------------
; Bank74_DmaFunction_04C
; Address: $FA8E65
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_04C:
	JSR $4080			; 20 80 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_04D
; Address: $FA8E86
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_04D:
	JSR $1C18			; 20 18 1C | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	SBC $FC1A,X		  ; FD 1A FC | Subtract with carry (absolute,X)
	PHX				  ; DA | Push X register to stack
	AND $0BE0,X		  ; 3D E0 0B | Logical AND with accumulator (absolute,X)
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	SBC $C444,Y		  ; F9 44 C4 | Subtract with carry (absolute,Y)
	LDA ($B1),Y		  ; B1 B1 | Load from (zero page),Y into accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	INX				  ; E8 | Increment X register
	ADC ($F4,X)		  ; 61 F4 | Add with carry ((zero page,X))
	DEC $03F5			; CE F5 03 | Decrement (absolute)
	SED				  ; F8 | Set decimal mode flag
	ORA $F0			  ; 05 F0 | Logical OR with accumulator (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	BRA $09			  ; 80 09 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CMP $58BF			; CD BF 58 | Compare accumulator (absolute)
	BEQ $5B			  ; F0 5B | Branch if equal
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	LDY $D007,X		  ; BC 07 D0 | Load from absolute,X into Y register
	INY				  ; C8 | Increment Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_04E
; Address: $FA8EEE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_04E:
	INY				  ; C8 | Increment Y register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$24			 ; C0 24 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_050
; Address: $FA8EFC
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_050:
	BCC $00			  ; 90 00 | Branch if carry clear
	BPL $00			  ; 10 00 | Branch if positive
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	CMP ($F6,X)		  ; C1 F6 | Compare accumulator ((zero page,X))
	CPY $1804			; CC 04 18 | Compare Y register (absolute)
	SEC				  ; 38 | Set carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	WDM #$24			 ; 42 24 | Reserved instruction
	CLC				  ; 18 | Clear carry flag
	BIT $5A			  ; 24 5A | Test bits in accumulator (zero page)
	ROR $18			  ; 66 18 | Rotate right (zero page)
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BEQ $30			  ; F0 30 | Branch if equal
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	BRA $B0			  ; 80 B0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	LDY #$4F			 ; A0 4F | Load immediate value into Y register
	LDA				  ; BF 3F F0 F0 | Load from absolute long,X into accumulator
	STA $3F3F0F		  ; 8F 0F 3F 3F | Store accumulator to absolute long address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA				  ; 9F 1F 20 5F | Store accumulator to absolute long,X
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$84			 ; E0 84 | Compare X register (immediate)
	SBC $FEF8,Y		  ; F9 F8 FE | Subtract with carry (absolute,Y)
	INC $0303,X		  ; FE 03 03 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_051
; Address: $FA8FF2
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_051:
	SED				  ; F8 | Set decimal mode flag
	INC $0301,X		  ; FE 01 03 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BEQ $88			  ; F0 88 | Branch if equal
	BMI $68			  ; 30 68 | Branch if negative
	BPL $98			  ; 10 98 | Branch if positive
	BRA $70			  ; 80 70 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	BEQ $08			  ; F0 08 | Branch if equal
	LDY #$88			 ; A0 88 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $78			  ; 80 78 | Branch always
	AND ($20,X)		  ; 21 20 | Logical AND with accumulator ((zero page,X))
	SEP #$3E			 ; E2 3E | Set processor status bits
	DEC				  ; 3A | Decrement accumulator
	ADC $A444,Y		  ; 79 44 A4 | Add with carry (absolute,Y)
	ADC ($B1),Y		  ; 71 B1 | Add with carry ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	DEC $EEC0,X		  ; DE C0 EE | Decrement (absolute,X)
	CPX #$C7			 ; E0 C7 | Compare X register (immediate)
	SEP #$E0			 ; E2 E0 | Game work RAM access
	BRA $BA			  ; 80 BA | Branch always
	BRA $89			  ; 80 89 | Branch always
	STY $18			  ; 84 18 | Store Y register to zero page
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $0305			; 0E 05 03 | Arithmetic shift left (absolute)
	BRA $84			  ; 80 84 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BEQ $1C			  ; F0 1C | Branch if equal
	PEA #$788C		   ; F4 8C 78 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_052
; Address: $FA90AA
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_052:
	STX $C67A			; 8E 7A C6 | Store X register to absolute address
	DEC $7C			  ; C6 7C | Decrement (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	AND ($1E),Y		  ; 31 1E | Logical AND with accumulator ((zero page),Y)
	ADC ($5E),Y		  ; 71 5E | Add with carry ((zero page),Y)
	ADC ($3E,X)		  ; 61 3E | Add with carry ((zero page,X))
	ADC ($3E,X)		  ; 61 3E | Add with carry ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	BVC $00			  ; 50 00 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_053
; Address: $FA90FA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_053:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	REP #$7F			 ; C2 7F | Reset processor status bits
	REP #$7F			 ; C2 7F | Reset processor status bits
	REP #$7F			 ; C2 7F | Reset processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_055
; Address: $FA912A
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_055:
	BIT $281F			; 2C 1F 28 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	BNE $5F			  ; D0 5F | Branch if not equal
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	STA $D04700		  ; 8F 00 47 D0 | Store accumulator to absolute long address
	PLP				  ; 28 | Pull processor status from stack
	BVS $00			  ; 70 00 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	XBA				  ; EB | Exchange accumulator bytes
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_056
; Address: $FA91AF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_056:
	SEP #$0B			 ; E2 0B | Set processor status bits
	PEA #$FC00		   ; F4 00 FC | Push effective address to stack
	ASL $1D00			; 0E 00 1D | Arithmetic shift left (absolute)
	INC $FE43,X		  ; FE 43 FE | Increment (absolute,X)
	INC $FC06,X		  ; FE 06 FC | Increment (absolute,X)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_057
; Address: $FA91DE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_057:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	AND $2F3C,X		  ; 3D 3C 2F | Logical AND with accumulator (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_058
; Address: $FA921E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_058:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $1608			; 0E 08 16 | Arithmetic shift left (absolute)
	ORA ($2E,X)		  ; 01 2E | Logical OR with accumulator ((zero page,X))
	ORA $22			  ; 05 22 | Logical OR with accumulator (zero page)
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	ASL $1700			; 0E 00 17 | Arithmetic shift left (absolute)
	ASL $3A10,X		  ; 1E 10 3A | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_059
; Address: $FA923E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_059:
	JSR $8000			; 20 00 80 | Jump to subroutine
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	BPL $20			  ; 10 20 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $01			  ; 10 01 | Branch if positive
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ASL $2F00,X		  ; 1E 00 2F | Arithmetic shift left (absolute,X)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_05A
; Address: $FA926A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_05A:
	REP #$FC			 ; C2 FC | Reset processor status bits
	SED				  ; F8 | Set decimal mode flag
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ASL $3F06,X		  ; 1E 06 3F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_05B
; Address: $FA928C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_05B:
	JSR $801F			; 20 1F 80 | Jump to subroutine
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_05C
; Address: $FA929D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_05C:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	ORA ($87,X)		  ; 01 87 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BRA $90			  ; 80 90 | Branch always
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $E0			  ; D0 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$E800		   ; F4 00 E8 | Push effective address to stack
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank74_DmaFunction_05D
; Address: $FA92BA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_05D:
	JSR $A000			; 20 00 A0 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA $3D			  ; 05 3D | Logical OR with accumulator (zero page)
	BMI $02			  ; 30 02 | Branch if negative
	ORA #$1D			 ; 09 1D | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	PLY				  ; 7A | Pull Y register from stack
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_05E
; Address: $FA92F8
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_05E:
	JSL $001C00		  ; 22 00 1C 00 | Jump to subroutine long
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	AND $380B,X		  ; 3D 0B 38 | Logical AND with accumulator (absolute,X)
	ORA $3C30			; 0D 30 3C | Logical OR with accumulator (absolute)
	BMI $18			  ; 30 18 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	JMP $3900			; 4C 00 39 | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $2400			; 4E 00 24 | Logical shift right (absolute)
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_05F
; Address: $FA9341
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_05F:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BVS $00			  ; 70 00 | Branch if overflow set
	BCS $00			  ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank74_DmaFunction_060
; Address: $FA9356
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_060:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_061
; Address: $FA936E
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_061:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $0F0F			; 0D 0F 0F | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCS $80			  ; B0 80 | Branch if carry set
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	LDY #$4F			 ; A0 4F | Load immediate value into Y register
	LDA				  ; BF 3F F0 F0 | Load from absolute long,X into accumulator
	STA $3F3F0F		  ; 8F 0F 3F 3F | Store accumulator to absolute long address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA				  ; 9F 1F 20 5F | Store accumulator to absolute long,X
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	SBC $FEF8,Y		  ; F9 F8 FE | Subtract with carry (absolute,Y)
	INC $0303,X		  ; FE 03 03 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $0301,X		  ; FE 01 03 | Increment (absolute,X)
	JMP $00E2BB		  ; 5C BB E2 00 | Jump to address long

;------------------------------------------------------------------------------
; Bank74_DmaFunction_062
; Address: $FA941C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_062:
	JSR $1C00			; 20 00 1C | Jump to subroutine
	ORA $2F1D,Y		  ; 19 1D 2F | Logical OR with accumulator (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	JMP $0073			; 4C 73 00 | Jump to address
	ORA $2002,Y		  ; 19 02 20 | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	BIT $5B			  ; 24 5B | Test bits in accumulator (zero page)
	LDY $DB			  ; A4 DB | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_063
; Address: $FA9449
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_063:
	SBC $EDD2			; ED D2 ED | Subtract with carry (absolute)
	AND #$D6			 ; 29 D6 | Logical AND with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_064
; Address: $FA9464
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_064:
	JSL $D12BDF		  ; 22 DF 2B D1 | Jump to subroutine long
	EOR #$B1			 ; 49 B1 | Exclusive OR with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank74_DmaFunction_065
; Address: $FA946D
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_065:
	INC $5FA9			; EE A9 5F | Increment (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $0B			  ; 80 0B | Branch always
	BIT $7F9C			; 2C 9C 7F | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	ADC ($FE,X)		  ; 61 FE | Add with carry ((zero page,X))
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BMI $00			  ; 30 00 | Branch if negative
	AND $7E66,X		  ; 3D 66 7E | Logical AND with accumulator (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	BIT $9A7B			; 2C 7B 9A | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	JMP $F508			; 4C 08 F5 | Jump to address
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$C2			 ; A0 C2 | Load immediate value into Y register
	STY $40			  ; 84 40 | Store Y register to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA $6472,Y		  ; 19 72 64 | Logical OR with accumulator (absolute,Y)
	STX $FE0C			; 8E 0C FE | Store X register to absolute address
	CMP $B099,Y		  ; D9 99 B0 | Compare accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ADC ($18),Y		  ; 71 18 | Add with carry ((zero page),Y)
	ORA #$70			 ; 09 70 | Logical OR with accumulator (immediate)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_066
; Address: $FA94DC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_066:
	JSL $004600		  ; 22 00 46 00 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F 23 63 2A | Store accumulator to absolute long,X
	STA $00FF7D		  ; 8F 7D FF 00 | Store accumulator to absolute long address
	ADC $90FF			; 6D FF 90 | Add with carry (absolute)
	DEC $60			  ; C6 60 | Decrement (zero page)
	STZ $7000			; 9C 00 70 | Store zero to absolute
	JMP ($6C92)		  ; 6C 92 6C | Jump to address (absolute indirect)
	ASL $3800			; 0E 00 38 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_067
; Address: $FA9500
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_067:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_068
; Address: $FA9507
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_068:
	JSR $10A5			; 20 A5 10 | Jump to subroutine
	STA				  ; 9F 14 B0 33 | Store accumulator to absolute long,X
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	JMP $0000			; 4C 00 00 | Jump to address
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_069
; Address: $FA9527
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_069:
	JSR $7A17			; 20 17 7A | Jump to subroutine
	ADC ($3F,X)		  ; 61 3F | Add with carry ((zero page,X))
	LSR $72FC			; 4E FC 72 | Logical shift right (absolute)
	CLC				  ; 18 | Clear carry flag
	AND ($16,X)		  ; 21 16 | Logical AND with accumulator ((zero page,X))
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $7419,X		  ; 1E 19 74 | Arithmetic shift left (absolute,X)
	STY $FA0B			; 8C 0B FA | Store Y register to absolute address
	ADC $DD02,X		  ; 7D 02 DD | Add with carry (absolute,X)
	LDX $0000,Y		  ; BE 00 00 | Load from absolute,Y into X register
	CLC				  ; 18 | Clear carry flag
	BVS $18			  ; 70 18 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	BVS $30			  ; 70 30 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank74_DmaFunction_06A
; Address: $FA955C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_06A:
	JSR $4000			; 20 00 40 | Jump to subroutine
	ADC $7D82,X		  ; 7D 82 7D | Add with carry (absolute,X)
	ADC $BD42,X		  ; 7D 42 BD | Add with carry (absolute,X)
	AND #$D6			 ; 29 D6 | Logical AND with accumulator (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_06B
; Address: $FA9587
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_06B:
	JSR $10A5			; 20 A5 10 | Jump to subroutine
	STA				  ; 9F 14 B0 33 | Store accumulator to absolute long,X
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	JMP $0000			; 4C 00 00 | Jump to address
	EOR ($7E,X)		  ; 41 7E | Exclusive OR with accumulator ((zero page,X))
	ROL $19			  ; 26 19 | Rotate left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_06C
; Address: $FA95AE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_06C:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	SBC $BEA9,X		  ; FD A9 BE | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_06D
; Address: $FA95C6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_06D:
	JSL $FBB43D		  ; 22 3D B4 FB | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $0000			; 4C 00 00 | Jump to address
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_06E
; Address: $FA95D6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_06E:
	JSR $80C0			; 20 C0 80 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	TSX				  ; BA | Transfer stack pointer to X register
	PHB				  ; 8B | Push data bank register to stack
	SEP #$15			 ; E2 15 | Set processor status bits
	INC $DE2F,X		  ; FE 2F DE | Increment (absolute,X)
	LDY $DE6D,X		  ; BC 6D DE | Load from absolute,X into Y register
	DEX				  ; CA | Decrement X register
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank74_DmaFunction_06F
; Address: $FA95FE
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_06F:
	JSR $7200			; 20 00 72 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ASL $053F			; 0E 3F 05 | Arithmetic shift left (absolute)
	ORA $030F			; 0D 0F 03 | Logical OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $28F0			; 6D F0 28 | Add with carry (absolute)
	DEC $B9AB,X		  ; DE AB B9 | Decrement (absolute,X)
	BNE $31			  ; D0 31 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BIT $AE			  ; 24 AE | Test bits in accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	AND $2306,Y		  ; 39 06 23 | Logical AND with accumulator (absolute,Y)
	AND #$AA			 ; 29 AA | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	WDM #$3D			 ; 42 3D | Reserved instruction
	ORA $BB			  ; 05 BB | Logical OR with accumulator (zero page)
	ORA $54AA,X		  ; 1D AA 54 | Logical OR with accumulator (absolute,X)
	INC $FE28,X		  ; FE 28 FE | Increment (absolute,X)
	BPL $39			  ; 10 39 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDX $EAB0,Y		  ; BE B0 EA | Load from absolute,Y into X register
	ADC ($EB),Y		  ; 71 EB | Add with carry ((zero page),Y)
	LDX $37B7			; AE B7 37 | Load from absolute address into X register
	CPX #$B2			 ; E0 B2 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_070
; Address: $FA968D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_070:
	CMP ($92,X)		  ; C1 92 | Compare accumulator ((zero page,X))
	ADC ($41,X)		  ; 61 41 | Add with carry ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_071
; Address: $FA9698
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_071:
	JSR $00C0			; 20 C0 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	TAX				  ; AA | Transfer accumulator to X register
	PEA #$ECD2		   ; F4 D2 EC | Push effective address to stack
	INC $FC			  ; E6 FC | Increment (zero page)
	TXS				  ; 9A | Transfer X register to stack pointer
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	ADC #$F6			 ; 69 F6 | Add with carry (immediate)
	PLP				  ; 28 | Pull processor status from stack
	DEC $B9AB,X		  ; DE AB B9 | Decrement (absolute,X)
	BNE $31			  ; D0 31 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BIT $AE			  ; 24 AE | Test bits in accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	AND $2306,Y		  ; 39 06 23 | Logical AND with accumulator (absolute,Y)
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	TXA				  ; 8A | Transfer X register to accumulator
	PLP				  ; 28 | Pull processor status from stack
	AND ($CF),Y		  ; 31 CF | Logical AND with accumulator ((zero page),Y)
	WDM #$3D			 ; 42 3D | Reserved instruction
	ORA $BB			  ; 05 BB | Logical OR with accumulator (zero page)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	JMP ($B2F3)		  ; 6C F3 B2 | Jump to address (absolute indirect)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	INC $2B			  ; E6 2B | Increment (zero page)
	ASL $533D			; 0E 3D 53 | Arithmetic shift left (absolute)
	CPX #$36			 ; E0 36 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_072
; Address: $FA972F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_072:
	STZ $00			  ; 64 00 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	SEP #$6C			 ; E2 6C | Set processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_073
; Address: $FA9744
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_073:
	ORA ($CF),Y		  ; 11 CF | Logical OR with accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR $A8BA,X		  ; 5D BA A8 | Exclusive OR with accumulator (absolute,X)
	PHX				  ; DA | Push X register to stack
	ROL $4FD5,X		  ; 3E D5 4F | Rotate left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_074
; Address: $FA9767
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_074:
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $AD			  ; F0 AD | Branch if equal
	AND #$DC			 ; 29 DC | Logical AND with accumulator (immediate)
	AND $A01A,Y		  ; 39 1A A0 | Logical AND with accumulator (absolute,Y)
	LDY $C0			  ; A4 C0 | Load from zero page into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	EOR ($80),Y		  ; 51 80 | Exclusive OR with accumulator ((zero page),Y)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PLY				  ; 7A | Pull Y register from stack
	ADC $D4			  ; 65 D4 | Add with carry (zero page)
	PHB				  ; 8B | Push data bank register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	INX				  ; E8 | Increment X register
	BIT $5B			  ; 24 5B | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_076
; Address: $FA97D6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_076:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ASL $17			  ; 06 17 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0762			; 0E 62 07 | Arithmetic shift left (absolute)
	BCS $33			  ; B0 33 | Branch if carry set
	LSR $0001			; 4E 01 00 | Logical shift right (absolute)
	CLC				  ; 18 | Clear carry flag
	JMP $B000			; 4C 00 B0 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_077
; Address: $FA9822
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_077:
	LDY $DCCD,X		  ; BC CD DC | Load from absolute,X into Y register
	AND $FA62			; 2D 62 FA | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP ($36),Y		  ; D1 36 | Compare accumulator ((zero page),Y)
	ORA #$65			 ; 09 65 | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	STY $0200			; 8C 00 02 | Store Y register to absolute address
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BRA $00			  ; 80 00 | Branch always
	SBC $C3			  ; E5 C3 | Subtract with carry (zero page)
	BRA $10			  ; 80 10 | Branch always
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	BEQ $4C			  ; F0 4C | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	CPX $3898			; EC 98 38 | Compare X register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BIT $661F			; 2C 1F 66 | Test bits in accumulator (absolute)
	AND ($22,X)		  ; 21 22 | Logical AND with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_07A
; Address: $FA9888
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_07A:
	JSR $30C0			; 20 C0 30 | Jump to subroutine
	BNE $D8			  ; D0 D8 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_07B
; Address: $FA988F
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_07B:
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	LDA $0F770F		  ; AF 0F 77 0F | Load from absolute long address into accumulator
	BMI $0E			  ; 30 0E | Branch if negative
	JMP $F8443E		  ; 5C 3E 44 F8 | Jump to address long
	ASL $63BC,X		  ; 1E BC 63 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $C000,X		  ; 1E 00 C0 | Arithmetic shift left (absolute,X)
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $160F,Y		  ; 19 0F 16 | Logical OR with accumulator (absolute,Y)
	ORA $0D1E			; 0D 1E 0D | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	BPL $06			  ; 10 06 | Branch if positive
	SEC				  ; 38 | Set carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	SBC $F5EA			; ED EA F5 | Subtract with carry (absolute)
	NOP				  ; EA | No operation
	AND #$38			 ; 29 38 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $0E0E,X		  ; 1D 0E 0E | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $62			  ; 66 62 | Rotate right (zero page)
	STZ $C4			  ; 64 C4 | Store zero to zero page
	CPX #$DC			 ; E0 DC | Compare X register (immediate)
	CPX #$8C			 ; E0 8C | Compare X register (immediate)
	BVS $5B			  ; 70 5B | Branch if overflow set
	AND $1B25,X		  ; 3D 25 1B | Logical AND with accumulator (absolute,X)
	ROR $D8B7			; 6E B7 D8 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_07C
; Address: $FA9951
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_07C:
	BRA $78			  ; 80 78 | Branch always
	BRA $D8			  ; 80 D8 | Branch always
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	SBC $C3			  ; E5 C3 | Subtract with carry (zero page)
	INC $C3			  ; E6 C3 | Increment (zero page)
	ORA $08C4			; 0D C4 08 | Logical OR with accumulator (absolute)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BCS $E0			  ; B0 E0 | Game work RAM access
	PHA				  ; 48 | Push accumulator to stack
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	LDY $E4			  ; A4 E4 | Load from zero page into Y register
	CPX $B0			  ; E4 B0 | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $70			  ; F0 70 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	JMP ($6418)		  ; 6C 18 64 | Jump to address (absolute indirect)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BMI $00			  ; 30 00 | Branch if negative
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BPL $E0			  ; 10 E0 | Game work RAM access
	BCC $60			  ; 90 60 | Branch if carry clear
	BCC $60			  ; 90 60 | Branch if carry clear
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_07D
; Address: $FA99E9
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_07D:
	ASL $0D1D			; 0E 1D 0D | Arithmetic shift left (absolute)
	ROL $701E,X		  ; 3E 1E 70 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BEQ $94			  ; F0 94 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $04B8,X		  ; BC B8 04 | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $60			  ; 90 60 | Branch if carry clear
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	BCS $58			  ; B0 58 | Branch if carry set
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_07E
; Address: $FA9A52
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_07E:
	JSR $E080			; 20 80 E0 | Game work RAM access
	ROL $217C,X		  ; 3E 7C 21 | PPU graphics register access
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0B05			; 0D 05 0B | Logical OR with accumulator (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_07F
; Address: $FA9AE3
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_07F:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PEA #$2340		   ; F4 40 23 | Push effective address to stack
	CPY $3000			; CC 00 30 | Compare Y register (absolute)
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	CPY $3030			; CC 30 30 | Compare Y register (absolute)
	STA $03			  ; 85 03 | Store accumulator to zero page
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_080
; Address: $FA9B40
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_080:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BEQ $A8			  ; F0 A8 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_081
; Address: $FA9B5A
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_081:
	SED				  ; F8 | Set decimal mode flag
	BVC $90			  ; 50 90 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_082
; Address: $FA9B5E
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_082:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $0D25,X		  ; 1E 25 0D | Arithmetic shift left (absolute,X)
	LSR $6806			; 4E 06 68 | Logical shift right (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($37,X)		  ; 01 37 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	PHP				  ; 08 | Push processor status to stack
	BPL $60			  ; 10 60 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	EOR #$07			 ; 49 07 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_083
; Address: $FA9BA4
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_083:
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	JMP ($C478)		  ; 6C 78 C4 | Jump to address (absolute indirect)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PEA #$F008		   ; F4 08 F0 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BIT $5F79			; 2C 79 5F | Test bits in accumulator (absolute)
	ORA $0003,X		  ; 1D 03 00 | Logical OR with accumulator (absolute,X)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	BMI $10			  ; 30 10 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_084
; Address: $FA9BF7
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_084:
	JSR $0824			; 20 24 08 | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	BRA $00			  ; 80 00 | Branch always
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	REP #$81			 ; C2 81 | Reset processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $30			  ; 30 30 | Branch if negative
	JMP ($2A5E)		  ; 6C 5E 2A | Jump to address (absolute indirect)
	ROR $0000			; 6E 00 00 | Rotate right (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	JMP $0E10			; 4C 10 0E | Jump to address
	CPY $05			  ; C4 05 | Compare Y register (zero page)
	CMP ($12,X)		  ; C1 12 | Compare accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ROL $7A36,X		  ; 3E 36 7A | Rotate left (absolute,X)
	CPX $D03C			; EC 3C D0 | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	BVS $28			  ; 70 28 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_085
; Address: $FA9C7C
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_085:
	LDY #$83			 ; A0 83 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA $0907			; 0D 07 09 | Logical OR with accumulator (absolute)
	ORA $110B,Y		  ; 19 0B 11 | Logical OR with accumulator (absolute,Y)
	BPL $07			  ; 10 07 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $E0			  ; 90 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	BPL $C4			  ; 10 C4 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX $04F8			; EC F8 04 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $60			  ; 90 60 | Branch if carry clear
	AND $7E66,X		  ; 3D 66 7E | Logical AND with accumulator (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	PHP				  ; 08 | Push processor status to stack
	JMP $F508			; 4C 08 F5 | Jump to address
	PLP				  ; 28 | Pull processor status from stack
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_086
; Address: $FA9D25
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_086:
	JSR $7A17			; 20 17 7A | Jump to subroutine
	ADC ($3F,X)		  ; 61 3F | Add with carry ((zero page,X))
	LSR $72FC			; 4E FC 72 | Logical shift right (absolute)
	CLC				  ; 18 | Clear carry flag
	AND ($16,X)		  ; 21 16 | Logical AND with accumulator ((zero page,X))
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA $16			  ; 05 16 | Logical OR with accumulator (zero page)
	ASL $0C1C			; 0E 1C 0C | Arithmetic shift left (absolute)
	AND ($1F),Y		  ; 31 1F | Logical AND with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_087
; Address: $FA9D56
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_087:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $E0			  ; D0 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	BMI $54			  ; 30 54 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	LDY $14B8,X		  ; BC B8 14 | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	JMP ($C478)		  ; 6C 78 C4 | Jump to address (absolute indirect)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_088
; Address: $FA9D73
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_088:
	JSR $00D0			; 20 D0 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($EB,X)		  ; E1 EB | Subtract with carry ((zero page,X))
	CPX $FD			  ; E4 FD | Compare X register (zero page)
	LDA $F36F,X		  ; BD 6F F3 | Load from absolute,X into accumulator
	JMP ($40DC)		  ; 6C DC 40 | Jump to address (absolute indirect)
	BPL $80			  ; 10 80 | Branch if positive
	BMI $A0			  ; 30 A0 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_089
; Address: $FA9DBA
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_089:
	JSR $6000			; 20 00 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	SBC $F58A			; ED 8A F5 | Subtract with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	AND #$38			 ; 29 38 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDX #$64			 ; A2 64 | Load immediate value into X register
	ROL $7C30,X		  ; 3E 30 7C | Rotate left (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	JMP $8678BC		  ; 5C BC 78 86 | Jump to address long
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_08B
; Address: $FA9E1E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_08B:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDA $2645FE		  ; AF FE 45 26 | Load from absolute long address into accumulator
	LSR $7C			  ; 46 7C | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_08C
; Address: $FA9E27
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_08C:
	ROL $3E1D,X		  ; 3E 1D 3E | Rotate left (absolute,X)
	AND $241E,Y		  ; 39 1E 24 | Logical AND with accumulator (absolute,Y)
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	ROL $3800,X		  ; 3E 00 38 | Rotate left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BIT $0F			  ; 24 0F | Test bits in accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL $69			  ; 06 69 | Arithmetic shift left (zero page)
	ORA $42			  ; 05 42 | Hardware register operation
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP ($84F8)		  ; 6C F8 84 | Jump to address (absolute indirect)
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	BMI $48			  ; 30 48 | Branch if negative
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BCS $00			  ; B0 00 | Branch if carry set
	BPL $40			  ; 10 40 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_08D
; Address: $FA9E8E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_08D:
	BRA $C0			  ; 80 C0 | Branch always
	BCC $60			  ; 90 60 | Branch if carry clear
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT $9A7B			; 2C 7B 9A | Test bits in accumulator (absolute)
	ORA $193E			; 0D 3E 19 | Logical OR with accumulator (absolute)
	ROL $3D03,X		  ; 3E 03 3D | Rotate left (absolute,X)
	AND $1B			  ; 25 1B | Logical AND with accumulator (zero page)
	LDY #$C2			 ; A0 C2 | Load immediate value into Y register
	STY $40			  ; 84 40 | Store Y register to zero page
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_08E
; Address: $FA9EBA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_08E:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_08F
; Address: $FA9EE3
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_08F:
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	NOP				  ; EA | No operation
	PEA #$ECF2		   ; F4 F2 EC | Push effective address to stack
	ROR $FC			  ; 66 FC | Rotate right (zero page)
	INC				  ; 1A | Increment accumulator
	INX				  ; E8 | Increment X register
	TXS				  ; 9A | Transfer X register to stack pointer
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	STZ $00			  ; 64 00 | Store zero to zero page
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PEA #$F008		   ; F4 08 F0 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	PEA #$8C0A		   ; F4 0A 8C | Push effective address to stack
	PHX				  ; DA | Push X register to stack
	INC $16FC,X		  ; FE FC 16 | Increment (absolute,X)
	STZ $9A0C,X		  ; 9E 0C 9A | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank74_DmaFunction_090
; Address: $FA9FAD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_090:
	PHP				  ; 08 | Push processor status to stack
	STZ $0008			; 9C 08 00 | Store zero to absolute
	PHP				  ; 08 | Push processor status to stack
	BVS $58			  ; 70 58 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank74_DmaFunction_091
; Address: $FA9FB5
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_091:
	JSR $0038			; 20 38 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	ORA $0719			; 0D 19 07 | Logical OR with accumulator (absolute)
	ASL $0602			; 0E 02 06 | Arithmetic shift left (absolute)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ASL $0711			; 0E 11 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	INY				  ; C8 | Increment Y register
	BEQ $C4			  ; F0 C4 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	CPX $9CF8			; EC F8 9C | Compare X register (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag
	STY $00F8			; 8C F8 00 | Store Y register to absolute address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_092
; Address: $FAA03C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_092:
	BRA $00			  ; 80 00 | Branch always
	ASL $1E37			; 0E 37 1E | Arithmetic shift left (absolute)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_093
; Address: $FAA0C8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_093:
	BNE $18			  ; D0 18 | Branch if not equal
	BVC $58			  ; 50 58 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_095
; Address: $FAA0D9
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_095:
	JSR $2080			; 20 80 20 | Jump to subroutine
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	BRA $10			  ; 80 10 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $2FD8			; 0E D8 2F | Arithmetic shift left (absolute)
	LSR $F5			  ; 46 F5 | Logical shift right (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	BRA $DB			  ; 80 DB | Branch always
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $07			  ; 80 07 | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BMI $1F			  ; 30 1F | Branch if negative
	ADC #$05			 ; 69 05 | Add with carry (immediate)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_096
; Address: $FAA1D6
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_096:
	JSR $3500			; 20 00 35 | Jump to subroutine
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag
	STY $F8			  ; 84 F8 | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	BVS $48			  ; 70 48 | Branch if overflow set
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BCS $20			  ; B0 20 | Branch if carry set
	BMI $C0			  ; 30 C0 | Branch if negative
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BCC $60			  ; 90 60 | Branch if carry clear
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	ASL $3D75,X		  ; 1E 75 3D | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_097
; Address: $FAA21C
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_097:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $60			  ; 70 60 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	BPL $E0			  ; 10 E0 | Game work RAM access
	BCC $60			  ; 90 60 | Branch if carry clear
	BCC $60			  ; 90 60 | Branch if carry clear
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	ORA $140B,Y		  ; 19 0B 14 | Logical OR with accumulator (absolute,Y)
	ORA $070A			; 0D 0A 07 | Logical OR with accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BIT $661F			; 2C 1F 66 | Test bits in accumulator (absolute)
	AND ($22,X)		  ; 21 22 | Logical AND with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BVS $0D			  ; 70 0D | Branch if overflow set
	BMI $30			  ; 30 30 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_098
; Address: $FAA2A8
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_098:
	JSR $30C0			; 20 C0 30 | Jump to subroutine
	BNE $D8			  ; D0 D8 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	STY $C000			; 8C 00 C0 | Store Y register to absolute address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	LDA $C75DFF		  ; AF FF 5D C7 | Load from absolute long address into accumulator
	LDA ($0E),Y		  ; B1 0E | Load from (zero page),Y into accumulator
	EOR ($0E),Y		  ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
	JMP $8BE4DA		  ; 5C DA E4 8B | Jump to address long
	PLX				  ; FA | Pull X register from stack
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_09A
; Address: $FAA2D6
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_09A:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STY $00			  ; 84 00 | Store Y register to zero page
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	JMP ($2A5E)		  ; 6C 5E 2A | Jump to address (absolute indirect)
	BMI $00			  ; 30 00 | Branch if negative
	JMP $0E10			; 4C 10 0E | Jump to address
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ROL $7A36,X		  ; 3E 36 7A | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BVS $28			  ; 70 28 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ASL $0B1B			; 0E 1B 0B | Arithmetic shift left (absolute)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	JMP ($CC78)		  ; 6C 78 CC | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA $1504			; 0D 04 15 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ASL $0B13			; 0E 13 0B | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_09B
; Address: $FAA3B2
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_09B:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	INY				  ; C8 | Increment Y register
	CPY $08			  ; C4 08 | Compare Y register (zero page)
	CPX $D408			; EC 08 D4 | Compare X register (absolute)
	CLC				  ; 18 | Clear carry flag
	JMP ($C478)		  ; 6C 78 C4 | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	LSR $4816,X		  ; 5E 16 48 | Logical shift right (absolute,X)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($37,X)		  ; 01 37 | Logical OR with accumulator ((zero page,X))
	LDY $04B8,X		  ; BC B8 04 | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	INY				  ; C8 | Increment Y register
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ADC ($62,X)		  ; 61 62 | Add with carry ((zero page,X))
	ORA $0600,Y		  ; 19 00 06 | Logical OR with accumulator (absolute,Y)
	ASL $0701			; 0E 01 07 | Arithmetic shift left (absolute)
	ASL $0619			; 0E 19 06 | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $20			  ; 80 20 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_09C
; Address: $FAA450
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_09C:
	JSR $C040			; 20 40 C0 | Jump to subroutine
	BRA $80			  ; 80 80 | Branch always
	LDX #$64			 ; A2 64 | Load immediate value into X register
	ROL $7C30,X		  ; 3E 30 7C | Rotate left (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	JMP $C278BC		  ; 5C BC 78 C2 | Jump to address long
	JMP $8C0A			; 4C 0A 8C | Jump to address

;------------------------------------------------------------------------------
; Bank74_DmaFunction_09E
; Address: $FAA474
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_09E:
	JSL $007C00		  ; 22 00 7C 00 | Jump to subroutine long
	BMI $00			  ; 30 00 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	CPX $453C			; EC 3C 45 | Compare X register (absolute)
	ROL $46			  ; 26 46 | Rotate left (zero page)
	ROL $3E1D,X		  ; 3E 1D 3E | Rotate left (absolute,X)
	AND $251E,Y		  ; 39 1E 25 | Logical AND with accumulator (absolute,Y)
	ASL $1D22,X		  ; 1E 22 1D | Arithmetic shift left (absolute,X)
	LDY #$83			 ; A0 83 | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	ROL $3800,X		  ; 3E 00 38 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$1F			 ; A0 1F | Load immediate value into Y register
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	STA ($63,X)		  ; 81 63 | Store accumulator to (zero page,X)
	PHP				  ; 08 | Push processor status to stack
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $03			  ; 65 03 | Add with carry (zero page)
	PEA #$CCF8		   ; F4 F8 CC | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $90			  ; F0 90 | Branch if equal
	INX				  ; E8 | Increment X register
	BPL $C0			  ; 10 C0 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $00			  ; F0 00 | Branch if equal
	BCC $60			  ; 90 60 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	BVC $E0			  ; 50 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $1F33,X		  ; 1E 33 1F | Arithmetic shift left (absolute,X)
	LDY #$1F			 ; A0 1F | Load immediate value into Y register
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	STA ($63,X)		  ; 81 63 | Store accumulator to (zero page,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_09F
; Address: $FAA4F8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_09F:
	JSR $6F00			; 20 00 6F | Jump to subroutine
	ADC $03			  ; 65 03 | Add with carry (zero page)
	CPX $1CF8			; EC F8 1C | Compare X register (absolute)
	CLC				  ; 18 | Clear carry flag
	PEA #$C8F8		   ; F4 F8 C8 | Push effective address to stack
	BEQ $10			  ; F0 10 | Branch if equal
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0A0
; Address: $FAA50B
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0A0:
	SED				  ; F8 | Set decimal mode flag
	BPL $C0			  ; 10 C0 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	BVC $E0			  ; 50 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	AND ($18),Y		  ; 31 18 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ROL $311E			; 2E 1E 31 | Rotate left (absolute)
	ORA $0F1C,X		  ; 1D 1C 0F | Logical OR with accumulator (absolute,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BVS $4F			  ; 70 4F | Branch if overflow set
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	JMP $44A7D8		  ; 5C D8 A7 44 | Jump to address long
	JMP $0000			; 4C 00 00 | Jump to address
	BRA $00			  ; 80 00 | Branch always
	BRA $83			  ; 80 83 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	AND $8FC2,X		  ; 3D C2 8F | Logical AND with accumulator (absolute,X)
	ADC ($33),Y		  ; 71 33 | Add with carry ((zero page),Y)
	CMP #$CC			 ; C9 CC | Compare accumulator (immediate)
	STY $3176			; 8C 76 31 | Store Y register to absolute address
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	INY				  ; C8 | Increment Y register
	BVS $08			  ; 70 08 | Branch if overflow set
	BMI $28			  ; 30 28 | Branch if negative
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BCS $70			  ; B0 70 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0A1
; Address: $FAA5CF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0A1:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0A2
; Address: $FAA5EE
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0A2:
	ORA $0002			; 0D 02 00 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $057A,X		  ; 3D 7A 05 | Logical AND with accumulator (absolute,X)
	LSR $ED			  ; 46 ED | Logical shift right (zero page)
	INC $FE7F			; EE 7F FE | Increment (absolute)
	PHB				  ; 8B | Push data bank register to stack
	ROR $864F,X		  ; 7E 4F 86 | Rotate right (absolute,X)
	CMP $CE84			; CD 84 CE | Compare accumulator (absolute)
	STY $80			  ; 84 80 | Store Y register to zero page
	STY $38			  ; 84 38 | Store Y register to zero page
	BIT $1C10			; 2C 10 1C | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	AND $1A			  ; 25 1A | Logical AND with accumulator (zero page)
	ASL $163F			; 0E 3F 16 | Arithmetic shift left (absolute)
	AND $3D14			; 2D 14 3D | Logical AND with accumulator (absolute)
	AND ($18),Y		  ; 31 18 | Logical AND with accumulator ((zero page),Y)
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	INC $F9			  ; E6 F9 | Increment (zero page)
	ROR $C9			  ; 66 C9 | Rotate right (zero page)
	CMP #$92			 ; C9 92 | Compare accumulator (immediate)
	STA $F37CCC		  ; 8F CC 7C F3 | Store accumulator to absolute long address
	EOR $B680,Y		  ; 59 80 B6 | Exclusive OR with accumulator (absolute,Y)
	JMP $3000			; 4C 00 30 | Jump to address
	CMP $0A3F			; CD 3F 0A | Compare accumulator (absolute)
	AND $FBFA,X		  ; 3D FA FB | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0A3
; Address: $FAA6E9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0A3:
	INC $FE6F,X		  ; FE 6F FE | Increment (absolute,X)
	CPY $64E2			; CC E2 64 | Compare Y register (absolute)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0A4
; Address: $FAA6FA
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0A4:
	JSR $3000			; 20 00 30 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	AND ($18),Y		  ; 31 18 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ROL $311E			; 2E 1E 31 | Rotate left (absolute)
	ORA $1F2C,X		  ; 1D 2C 1F | Logical OR with accumulator (absolute,X)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	PEA #$4DBB		   ; F4 BB 4D | Push effective address to stack
	LDX $7CB3,Y		  ; BE B3 7C | Load from absolute,Y into X register
	CPX $FE			  ; E4 FE | Compare X register (zero page)
	EOR ($71),Y		  ; 51 71 | Exclusive OR with accumulator ((zero page),Y)
	LDX $E7			  ; A6 E7 | Load from zero page into X register
	STA $800780		  ; 8F 80 07 80 | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1880			; 0E 80 18 | Arithmetic shift left (absolute)
	SBC ($13),Y		  ; F1 13 | Subtract with carry ((zero page),Y)
	SBC #$2C			 ; E9 2C | Subtract with carry (immediate)
	JMP $61B6			; 4C B6 61 | Jump to address
	CLI				  ; 58 | Clear interrupt disable flag
	TSX				  ; BA | Transfer stack pointer to X register
	EOR #$F8			 ; 49 F8 | Exclusive OR with accumulator (immediate)
	INC $00			  ; E6 00 | Increment (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	ASL $C8			  ; 06 C8 | Arithmetic shift left (zero page)
	BVS $08			  ; 70 08 | Branch if overflow set
	BMI $28			  ; 30 28 | Branch if negative
	BVS $88			  ; 70 88 | Branch if overflow set
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0A5
; Address: $FAA7C4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0A5:
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0A6
; Address: $FAA827
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0A6:
	JSR $7A17			; 20 17 7A | Jump to subroutine
	ADC ($3F,X)		  ; 61 3F | Add with carry ((zero page,X))
	LSR $72FC			; 4E FC 72 | Logical shift right (absolute)
	CLC				  ; 18 | Clear carry flag
	AND ($16,X)		  ; 21 16 | Logical AND with accumulator ((zero page,X))
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BVC $EF			  ; 50 EF | Branch if overflow clear
	SED				  ; F8 | Set decimal mode flag
	CMP $22FE			; CD FE 22 | Compare accumulator (absolute)
	SBC ($06),Y		  ; F1 06 | Subtract with carry ((zero page),Y)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0A7
; Address: $FAA852
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0A7:
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	BRA $00			  ; 80 00 | Branch always
	NOP				  ; EA | No operation
	BIT $F7			  ; 24 F7 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	CMP $7C23,X		  ; DD 23 7C | Compare accumulator (absolute,X)
	BNE $3C			  ; D0 3C | Branch if not equal
	ROL $0010,X		  ; 3E 10 00 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $58F2			; 2D F2 58 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0A8
; Address: $FAA8C7
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0A8:
	DEC $2FD8,X		  ; DE D8 2F | Decrement (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $CE			  ; C5 CE | Compare accumulator (zero page)
	SBC ($66,X)		  ; E1 66 | Subtract with carry ((zero page,X))
	NOP				  ; EA | No operation
	BIT $92			  ; 24 92 | Test bits in accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	STY $0C			  ; 84 0C | Store Y register to zero page
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0AB
; Address: $FAA948
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0AB:
	JSR $30C0			; 20 C0 30 | Jump to subroutine
	BNE $D8			  ; D0 D8 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	STA $B307,X		  ; 9D 07 B3 | Store accumulator to absolute,X
	EOR ($0E),Y		  ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	JMP $8BE4DA		  ; 5C DA E4 8B | Jump to address long
	PLX				  ; FA | Pull X register from stack
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ASL $0B04			; 0E 04 0B | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $140C,X		  ; 1D 0C 14 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0AC
; Address: $FAA996
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0AC:
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $20			  ; B0 20 | Branch if carry set
	SEI				  ; 78 | Set interrupt disable flag
	BVC $F4			  ; 50 F4 | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	CPX $08			  ; E4 08 | Compare X register (zero page)
	CPY $1C08			; CC 08 1C | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	ASL $1B39,X		  ; 1E 39 1B | Arithmetic shift left (absolute,X)
	BIT $410C			; 2C 0C 41 | Test bits in accumulator (absolute)
	WDM #$0F			 ; 42 0F | Reserved instruction
	ADC $500B			; 6D 0B 50 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0AD
; Address: $FAA9EF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0AD:
	JSR $0001			; 20 01 00 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	STZ $68			  ; 64 68 | Store zero to zero page
	STZ $8898			; 9C 98 88 | Store zero to absolute
	BEQ $08			  ; F0 08 | Branch if equal
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BRA $F0			  ; 80 F0 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0AE
; Address: $FAAA16
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0AE:
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	AND $3838,X		  ; 3D 38 38 | Logical AND with accumulator (absolute,X)
	AND $383D,X		  ; 3D 3D 38 | Logical AND with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	BRA $80			  ; 80 80 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	ROR $007E,X		  ; 7E 7E 00 | Rotate right (absolute,X)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0AF
; Address: $FAAA9A
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0AF:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ROR $007E,X		  ; 7E 7E 00 | Rotate right (absolute,X)
	INX				  ; E8 | Increment X register
	CMP ($E9,X)		  ; C1 E9 | Compare accumulator ((zero page,X))
	SBC #$E9			 ; E9 E9 | Subtract with carry (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	STA				  ; 9F 9F DF DF | Store accumulator to absolute long,X
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	STA				  ; 9F 9F DF DF | Store accumulator to absolute long,X
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ASL $1036			; 0E 36 10 | Arithmetic shift left (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $E0			  ; D0 E0 | Game work RAM access
	CLV				  ; B8 | Clear overflow flag
	BMI $C4			  ; 30 C4 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	STZ $6418			; 9C 18 64 | Store zero to absolute
	SEI				  ; 78 | Set interrupt disable flag
	STZ $2CF8			; 9C F8 2C | Store zero to absolute
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0B1
; Address: $FAAB52
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0B1:
	JSR $0720			; 20 20 07 | Jump to subroutine
	STA				  ; 9F 9F 00 C0 | Store accumulator to absolute long,X
	BMI $B8			  ; 30 B8 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BRA $D8			  ; 80 D8 | Branch always
	REP #$0C			 ; C2 0C | Reset processor status bits
	STY $C0C0			; 8C C0 C0 | Store Y register to absolute address
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0B2
; Address: $FAAB73
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0B2:
	CLV				  ; B8 | Clear overflow flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	REP #$C2			 ; C2 C2 | Reset processor status bits
	STY $018C			; 8C 8C 01 | Store Y register to absolute address
	ORA $0F0F,Y		  ; 19 0F 0F | Logical OR with accumulator (absolute,Y)
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	STA ($EF,X)		  ; 81 EF | Store accumulator to (zero page,X)
	BRA $83			  ; 80 83 | Branch always
	ORA $0F19,Y		  ; 19 19 0F | Logical OR with accumulator (absolute,Y)
	DEC $E6DF,X		  ; DE DF E6 | Decrement (absolute,X)
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	STA ($F9,X)		  ; 81 F9 | Store accumulator to (zero page,X)
	BRA $E1			  ; 80 E1 | Branch always
	DEC $FF			  ; C6 FF | Decrement (zero page)
	INC $F9FE,X		  ; FE FE F9 | Increment (absolute,X)
	SBC $E1E1,Y		  ; F9 E1 E1 | Subtract with carry (absolute,Y)
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	AND ($3B,X)		  ; 21 3B | Logical AND with accumulator ((zero page,X))
	JMP $1818			; 4C 18 18 | Jump to address
	BPL $46			  ; 10 46 | Branch if positive
	BIT #$CF			 ; 89 CF | Test bits in accumulator (immediate)
	BRA $83			  ; 80 83 | Branch always
	JMP $184C			; 4C 4C 18 | Jump to address
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive
	SBC $F8FB,Y		  ; F9 FB F8 | Subtract with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	INC $FC80,X		  ; FE 80 FC | Increment (absolute,X)
	STA ($F9,X)		  ; 81 F9 | Store accumulator to (zero page,X)
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	SBC $C3F9,Y		  ; F9 F9 C3 | Subtract with carry (absolute,Y)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	BPL $D8			  ; 10 D8 | Branch if positive

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0B3
; Address: $FAAC06
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0B3:
	JSR $00F0			; 20 F0 00 | Jump to subroutine
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0B4
; Address: $FAAC26
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0B4:
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	EOR $CD			  ; 45 CD | Exclusive OR with accumulator (zero page)
	STA $339A,Y		  ; 99 9A 33 | Store accumulator to absolute,Y
	AND ($D4),Y		  ; 31 D4 | Logical AND with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	LDA				  ; BF 00 00 0C | Load from absolute long,X into accumulator
	STZ $00			  ; 64 00 | Store zero to zero page
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 98 45 C7 | Store accumulator to absolute long,X
	LDA ($71,X)		  ; A1 71 | Load from (zero page,X) into accumulator
	AND $8F6A,X		  ; 3D 6A 8F | Logical AND with accumulator (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0B5
; Address: $FAAC74
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0B5:
	SEC				  ; 38 | Set carry flag
	ASL $0200			; 0E 00 02 | Arithmetic shift left (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0B6
; Address: $FAAC86
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0B6:
	JSR $6040			; 20 40 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BCC $A0			  ; 90 A0 | Branch if carry clear
	BVS $60			  ; 70 60 | Branch if overflow set
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	INC				  ; 1A | Increment accumulator
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	BVS $B0			  ; 70 B0 | Branch if overflow set
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	BVS $C0			  ; 70 C0 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0B7
; Address: $FAACCD
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0B7:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	BMI $38			  ; 30 38 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	STA ($91,X)		  ; 81 91 | Store accumulator to (zero page,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	STA ($91),Y		  ; 91 91 | Store accumulator to (zero page),Y
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	BEQ $F1			  ; F0 F1 | Branch if equal
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BMI $30			  ; 30 30 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0BB
; Address: $FAAD4C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0BB:
	AND ($71),Y		  ; 31 71 | Logical AND with accumulator ((zero page),Y)
	BMI $30			  ; 30 30 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0BF
; Address: $FAAD5C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0BF:
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ASL $0C00			; 0E 00 0C | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0C0
; Address: $FAAD6E
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0C0:
	ASL $006E			; 0E 6E 00 | Arithmetic shift left (absolute)
	ASL $0C0E			; 0E 0E 0C | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ROR $006E			; 6E 6E 00 | Rotate right (absolute)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ASL $1C08,X		  ; 1E 08 1C | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ASL $1C1E,X		  ; 1E 1E 1C | Arithmetic shift left (absolute,X)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	JMP ($B7FF)		  ; 6C FF B7 | Jump to address (absolute indirect)
	CLI				  ; 58 | Clear interrupt disable flag
	LDA				  ; BF 25 DF D9 | Load from absolute long,X into accumulator
	ROL $34			  ; 26 34 | Rotate left (zero page)
	INC				  ; 1A | Increment accumulator
	SBC $06			  ; E5 06 | Subtract with carry (zero page)
	AND $1BFF			; 2D FF 1B | Logical AND with accumulator (absolute)
	INY				  ; C8 | Increment Y register
	CPX $32CD			; EC CD 32 | Compare X register (absolute)
	JMP ($FE9B)		  ; 6C 9B FE | Jump to address (absolute indirect)
	ORA $0000,X		  ; 1D 00 00 | Logical OR with accumulator (absolute,X)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BPL $2F			  ; 10 2F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $E0			  ; D0 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	BMI $C4			  ; 30 C4 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	JMP $00F8			; 4C F8 00 | Jump to address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0C1
; Address: $FAAE5A
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0C1:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $170E			; 0E 0E 17 | Arithmetic shift left (absolute)
	ROL $5E37,X		  ; 3E 37 5E | Rotate left (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	ROR $0053,X		  ; 7E 53 00 | Rotate right (absolute,X)
	ASL $1800			; 0E 00 18 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ADC #$02			 ; 69 02 | Add with carry (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	BMI $18			  ; 30 18 | Branch if negative
	BVC $20			  ; 50 20 | Branch if overflow clear
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$F1			 ; C0 F1 | Compare Y register (immediate)
	STA $000001		  ; 8F 01 00 00 | Store accumulator to absolute long address
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BVS $62			  ; 70 62 | Branch if overflow set
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BPL $18			  ; 10 18 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BRA $81			  ; 80 81 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ROR $637E,X		  ; 7E 7E 63 | Rotate right (absolute,X)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	BPL $18			  ; 10 18 | Branch if positive
	BRA $C0			  ; 80 C0 | Branch always
	ROR $7F7E,X		  ; 7E 7E 7F | Rotate right (absolute,X)
	ASL $0E0E			; 0E 0E 0E | Arithmetic shift left (absolute)
	ASL $0404			; 0E 04 04 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PEA #$6606		   ; F4 06 66 | Push effective address to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $3C00			; 0E 00 3C | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0C2
; Address: $FAAEEE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0C2:
	BRA $C0			  ; 80 C0 | Branch always
	PEA #$66F4		   ; F4 F4 66 | Push effective address to stack
	ROR $06			  ; 66 06 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0C3
; Address: $FAAEF5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0C3:
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ASL $3C3C			; 0E 3C 3C | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0C5
; Address: $FAAEFE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0C5:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	JMP ($0808)		  ; 6C 08 08 | Jump to address (absolute indirect)
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	JMP ($086C)		  ; 6C 6C 08 | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0C7
; Address: $FAAF4D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0C7:
	JSR $E0C0			; 20 C0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0C9
; Address: $FAAF5C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0C9:
	JSR $E020			; 20 20 E0 | Game work RAM access
	CPX #$0D			 ; E0 0D | Compare X register (immediate)
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BEQ $D8			  ; F0 D8 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BNE $40			  ; D0 40 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0CA
; Address: $FAAF94
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0CA:
	JSR $2000			; 20 00 20 | Jump to subroutine
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BPL $0F			  ; 10 0F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0CB
; Address: $FAAFE7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0CB:
	INC				  ; 1A | Increment accumulator
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ASL $001F			; 0E 1F 00 | Arithmetic shift left (absolute)
	ASL $0609			; 0E 09 06 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $7400			; 0E 00 74 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	BVS $B0			  ; 70 B0 | Branch if overflow set
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BIT $23			  ; 24 23 | Test bits in accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0CC
; Address: $FAB030
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0CC:
	JSR $0300			; 20 00 03 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	INC $FF2D,X		  ; FE 2D FF | Increment (absolute,X)
	JMP $5937			; 4C 37 59 | Jump to address
	ROR $0820			; 6E 20 08 | Rotate right (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	BVC $C0			  ; 50 C0 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0CD
; Address: $FAB051
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0CD:
	JSR $00C1			; 20 C1 00 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0CE
; Address: $FAB05E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0CE:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($61,X)		  ; 41 61 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0CF
; Address: $FAB0A9
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0CF:
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0E1E,X		  ; 1E 1E 0E | Arithmetic shift left (absolute,X)
	ASL $0404			; 0E 04 04 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	WDM #$73			 ; 42 73 | Reserved instruction
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	JMP $B700			; 4C 00 B7 | Jump to address
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	CPX $18			  ; E4 18 | Compare X register (zero page)
	ASL $B1			  ; 06 B1 | Arithmetic shift left (zero page)
	CMP $3D05			; CD 05 3D | Compare accumulator (absolute)
	SBC ($F3),Y		  ; F1 F3 | Subtract with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ORA ($EE,X)		  ; 01 EE | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	REP #$00			 ; C2 00 | Reset processor status bits
	INC $1F00,X		  ; FE 00 1F | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0D0
; Address: $FAB108
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0D0:
	BMI $20			  ; 30 20 | Branch if negative
	BVC $00			  ; 50 00 | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	BMI $78			  ; 30 78 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVC $00			  ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0D2
; Address: $FAB130
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0D2:
	JSR $0000			; 20 00 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0D3
; Address: $FAB18E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0D3:
	JSR $0820			; 20 20 08 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0D4
; Address: $FAB19E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0D4:
	JSR $D120			; 20 20 D1 | Jump to subroutine
	TAX				  ; AA | Transfer accumulator to X register
	BVC $79			  ; 50 79 | Branch if overflow clear
	BIT $36			  ; 24 36 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	STY $9000			; 8C 00 90 | Store Y register to absolute address
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	STZ $0F3B			; 9C 3B 0F | Store zero to absolute
	ORA $707D			; 0D 7D 70 | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0D5
; Address: $FAB1CE
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0D5:
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	SEC				  ; 38 | Set carry flag
	STA $8002			; 8D 02 80 | Store accumulator to absolute address
	SEC				  ; 38 | Set carry flag
	DEY				  ; 88 | Decrement Y register
	BEQ $30			  ; F0 30 | Branch if equal
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDX #$BD			 ; A2 BD | Load immediate value into X register
	SBC $A6DD,X		  ; FD DD A6 | Subtract with carry (absolute,X)
	CPY #$23			 ; C0 23 | Compare Y register (immediate)
	BPL $34			  ; 10 34 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BPL $0C			  ; 10 0C | Branch if positive
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	BIT $3310			; 2C 10 33 | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0D6
; Address: $FAB264
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0D6:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $1617			; 0D 17 16 | Logical OR with accumulator (absolute)
	ORA $0C12,X		  ; 1D 12 0C | Logical OR with accumulator (absolute,X)
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $1A02			; 0D 02 1A | Logical OR with accumulator (absolute)
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BCS $30			  ; B0 30 | Branch if carry set
	BCC $30			  ; 90 30 | Branch if carry clear
	LDA $A7C0,Y		  ; B9 C0 A7 | Load from absolute,Y into accumulator
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVC $80			  ; 50 80 | Branch if overflow clear
	BCC $C0			  ; 90 C0 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	ASL $3519,X		  ; 1E 19 35 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0D7
; Address: $FAB2C7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0D7:
	JSL $B56669		  ; 22 69 66 B5 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	CLC				  ; 18 | Clear carry flag
	BMI $18			  ; 30 18 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0D9
; Address: $FAB2DC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0D9:
	JSR $8000			; 20 00 80 | Jump to subroutine
	JMP ($F609)		  ; 6C 09 F6 | Jump to address (absolute indirect)
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $5BA4			; 6D A4 5B | Add with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0DB
; Address: $FAB307
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0DB:
	JSR $2004			; 20 04 20 | Jump to subroutine
	STY $4420			; 8C 20 44 | Store Y register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0DC
; Address: $FAB30E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0DC:
	LDY $00E8			; AC E8 00 | Load from absolute address into Y register
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $D8			  ; 80 D8 | Branch always
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0DD
; Address: $FAB31E
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0DD:
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $0B07			; 0E 07 0B | Arithmetic shift left (absolute)
	ASL $0201			; 0E 01 02 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	INC $7F05,X		  ; FE 05 7F | Increment (absolute,X)
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)
	AND $361A			; 2D 1A 36 | Logical AND with accumulator (absolute)
	BPL $04			  ; 10 04 | Branch if positive

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0DE
; Address: $FAB36D
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0DE:
	JSR $280C			; 20 0C 28 | Jump to subroutine
	BMI $08			  ; 30 08 | Branch if negative
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	EOR $BB			  ; 45 BB | Exclusive OR with accumulator (zero page)
	EOR #$B7			 ; 49 B7 | Exclusive OR with accumulator (immediate)
	ORA ($EF),Y		  ; 11 EF | Logical OR with accumulator ((zero page),Y)
	LDX #$5E			 ; A2 5E | Load immediate value into X register
	LDY $7BCD,X		  ; BC CD 7B | Load from absolute,X into Y register
	AND $003A			; 2D 3A 00 | Logical AND with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	BEQ $68			  ; F0 68 | Branch if equal
	BEQ $98			  ; F0 98 | Branch if equal
	BNE $30			  ; D0 30 | Branch if not equal

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0E0
; Address: $FAB3AC
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0E0:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BCC $20			  ; 90 20 | Branch if carry clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROL $7D2C			; 2E 2C 7D | Rotate left (absolute)
	STA $CCB1			; 8D B1 CC | Store accumulator to absolute address
	LDA ($B2),Y		  ; B1 B2 | Load from (zero page),Y into accumulator
	SBC $00B6,X		  ; FD B6 00 | Subtract with carry (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	ADC $C310			; 6D 10 C3 | Add with carry (absolute)
	LSR $58B0			; 4E B0 58 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0E1
; Address: $FAB3DE
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0E1:
	BCS $40			  ; B0 40 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	STY $5B70			; 8C 70 5B | Store Y register to absolute address
	AND $1B25,X		  ; 3D 25 1B | Logical AND with accumulator (absolute,X)
	ROR $00B7			; 6E B7 00 | Rotate right (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BCS $F8			  ; B0 F8 | Branch if carry set
	BEQ $70			  ; F0 70 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BMI $00			  ; 30 00 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CMP ($E7,X)		  ; C1 E7 | Compare accumulator ((zero page,X))
	SBC $381B,Y		  ; F9 1B 38 | Subtract with carry (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0E2
; Address: $FAB487
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0E2:
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	STY $78			  ; 84 78 | Store Y register to zero page
	BNE $80			  ; D0 80 | Branch if not equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	BCC $00			  ; 90 00 | Branch if carry clear
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	EOR #$47			 ; 49 47 | Exclusive OR with accumulator (immediate)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BVS $E0			  ; 70 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0E4
; Address: $FAB507
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0E4:
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BCC $F0			  ; 90 F0 | Branch if carry clear
	BNE $10			  ; D0 10 | Branch if not equal
	CPY $2310			; CC 10 23 | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	JMP ($7E9A)		  ; 6C 9A 7E | Jump to address (absolute indirect)
	BRA $00			  ; 80 00 | Branch always
	BCC $00			  ; 90 00 | Branch if carry clear
	BMI $40			  ; 30 40 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $03			  ; 80 03 | Branch always
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ASL $38			  ; 06 38 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPX $24			  ; E4 24 | Compare X register (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	JMP ($0500)		  ; 6C 00 05 | Jump to address (absolute indirect)
	ORA $161F			; 0D 1F 16 | Logical OR with accumulator (absolute)
	ORA $13			  ; 05 13 | Logical OR with accumulator (zero page)
	ORA $0908,X		  ; 1D 08 09 | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	PHX				  ; DA | Push X register to stack
	INC $BE00,X		  ; FE 00 BE | Increment (absolute,X)
	BIT $B090			; 2C 90 B0 | Test bits in accumulator (absolute)
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$24			 ; C0 24 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0E5
; Address: $FAB5C4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0E5:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0E6
; Address: $FAB5E5
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0E6:
	JSR $FC64			; 20 64 FC | Jump to subroutine
	CPY $4B			  ; C4 4B | Compare Y register (zero page)
	PEA #$0058		   ; F4 58 00 | Push effective address to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$64			 ; C0 64 | Compare Y register (immediate)
	STY $D010			; 8C 10 D0 | Store Y register to absolute address
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $00			  ; C6 00 | Decrement (zero page)
	PLY				  ; 7A | Pull Y register from stack
	ADC $D4			  ; 65 D4 | Add with carry (zero page)
	PHB				  ; 8B | Push data bank register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	INX				  ; E8 | Increment X register
	BIT $5B			  ; 24 5B | Test bits in accumulator (zero page)
	NOP				  ; EA | No operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0E7
; Address: $FAB636
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0E7:
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	LDX #$28			 ; A2 28 | Load immediate value into X register
	CMP ($28),Y		  ; D1 28 | Compare accumulator ((zero page),Y)
	CMP ($48),Y		  ; D1 48 | Compare accumulator ((zero page),Y)
	LDA ($96),Y		  ; B1 96 | Load from (zero page),Y into accumulator
	AND #$DF			 ; 29 DF | Logical AND with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0E9
; Address: $FAB66C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0E9:
	JSR $6000			; 20 00 60 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0EA
; Address: $FAB67A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0EA:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA ($33),Y		  ; B1 33 | Load from (zero page),Y into accumulator
	LSR $0000			; 4E 00 00 | Logical shift right (absolute)
	CLC				  ; 18 | Clear carry flag
	JMP $B000			; 4C 00 B0 | Jump to address
	BCS $CF			  ; B0 CF | Branch if carry set
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX $0213			; EC 13 02 | Compare X register (absolute)
	SBC $FB85,X		  ; FD 85 FB | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0EB
; Address: $FAB6C2
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0EB:
	JSR $60C0			; 20 C0 60 | Jump to subroutine
	BRA $10			  ; 80 10 | Branch always
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	BEQ $4C			  ; F0 4C | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	CPX $3898			; EC 98 38 | Compare X register (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	INC $4F80,X		  ; FE 80 4F | Increment (absolute,X)
	ADC ($60),Y		  ; 71 60 | Add with carry ((zero page),Y)
	CMP $73FE			; CD FE 73 | Compare accumulator (absolute)
	BRA $2B			  ; 80 2B | Branch always
	LDA ($02,X)		  ; A1 02 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0EC
; Address: $FAB6FA
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0EC:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	STA $09B506		  ; 8F 06 B5 09 | Store accumulator to absolute long address
	BEQ $24			  ; F0 24 | Branch if equal
	BPL $D2			  ; 10 D2 | Branch if positive
	CMP ($7B),Y		  ; D1 7B | Compare accumulator ((zero page),Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $0400			; 2D 00 04 | Logical AND with accumulator (absolute)
	LDX $9E			  ; A6 9E | Load from zero page into X register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	LDY $B6			  ; A4 B6 | Load from zero page into Y register
	SBC $FF9B,X		  ; FD 9B FF | Subtract with carry (absolute,X)
	JMP ($E3DF)		  ; 6C DF E3 | Jump to address (absolute indirect)
	LDY $2080,X		  ; BC 80 20 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0EE
; Address: $FAB74F
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0EE:
	RTI				  ; 40 | Return from interrupt
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SBC $F54A			; ED 4A F5 | Subtract with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	AND #$38			 ; 29 38 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BMI $00			  ; 30 00 | Branch if negative
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	EOR ($B7),Y		  ; 51 B7 | Exclusive OR with accumulator ((zero page),Y)
	LDA				  ; BF 83 7F 0E | Load from absolute long,X into accumulator
	INC $FD3C,X		  ; FE 3C FD | Increment (absolute,X)
	INX				  ; E8 | Increment X register
	JMP $000873		  ; 5C 73 08 00 | Jump to address long
	ASL $1C01			; 0E 01 1C | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0EF
; Address: $FAB7A4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0EF:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0F0
; Address: $FAB7AA
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0F0:
	JSR $40C0			; 20 C0 40 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $0804			; 0D 04 08 | Logical OR with accumulator (absolute)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	STA ($80,X)		  ; 81 80 | Store accumulator to (zero page,X)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	AND $1103,X		  ; 3D 03 11 | Logical AND with accumulator (absolute,X)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDA ($FB),Y		  ; B1 FB | Load from (zero page),Y into accumulator
	STA $DE			  ; 85 DE | Store accumulator to zero page
	ASL $D8			  ; 06 D8 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0F1
; Address: $FAB806
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0F1:
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	BNE $40			  ; D0 40 | Branch if not equal
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0F3
; Address: $FAB816
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0F3:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0F4
; Address: $FAB846
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0F4:
	ROL $A9			  ; 26 A9 | Rotate left (zero page)
	SEC				  ; 38 | Set carry flag
	BRA $30			  ; 80 30 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0F6
; Address: $FAB860
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0F6:
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BVS $E0			  ; 70 E0 | Game work RAM access
	BPL $60			  ; 10 60 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BVS $30			  ; 70 30 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	BNE $00			  ; D0 00 | Branch if not equal
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag
	AND $7F19,X		  ; 3D 19 7F | Logical AND with accumulator (absolute,X)
	LSR $5EFF,X		  ; 5E FF 5E | Logical shift right (absolute,X)
	AND $7F3D,X		  ; 3D 3D 7F | Logical AND with accumulator (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FF1C,X		  ; FE 1C FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ROR $3EFF,X		  ; 7E FF 3E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0F7
; Address: $FAB930
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0F7:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($37,X)		  ; 01 37 | Logical OR with accumulator ((zero page,X))
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	INX				  ; E8 | Increment X register
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	JMP $C000			; 4C 00 C0 | Jump to address
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	JMP $C04C			; 4C 4C C0 | Jump to address
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	BMI $30			  ; 30 30 | Branch if negative
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ROL $3F3E,X		  ; 3E 3E 3F | Rotate left (absolute,X)
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ROL $3F7E,X		  ; 3E 7E 3F | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	CPX #$60			 ; E0 60 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0F8
; Address: $FAB9E3
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0F8:
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	ROR $FEFC,X		  ; 7E FC FE | Rotate right (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $00F3,X		  ; FE F3 00 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BVS $00			  ; 70 00 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BMI $F0			  ; 30 F0 | Branch if negative
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	ASL $3C0D,X		  ; 1E 0D 3C | Arithmetic shift left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CMP $4F5C			; CD 5C 4F | Compare accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($28,X)		  ; 01 28 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0F9
; Address: $FABA5F
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0F9:
	JSR $48B8			; 20 B8 48 | Jump to subroutine
	CPY $9F7F			; CC 7F 9F | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	BEQ $7E			  ; F0 7E | Branch if equal
	CPX $E2			  ; E4 E2 | Compare X register (zero page)
	PEA #$FEC1		   ; F4 C1 FE | Push effective address to stack
	BEQ $F3			  ; F0 F3 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$C7			 ; E0 C7 | Compare X register (immediate)
	STA				  ; 9F 8F 3B 1F | Store accumulator to absolute long,X
	AND $3FF8,X		  ; 3D F8 3F | Logical AND with accumulator (absolute,X)
	BVS $4C			  ; 70 4C | Branch if overflow set
	BEQ $CE			  ; F0 CE | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $7C			  ; E6 7C | Increment (zero page)
	INC $9E7C,X		  ; FE 7C 9E | Increment (absolute,X)
	STY $1A4E			; 8C 4E 1A | Store Y register to absolute address
	CPX $38B8			; EC B8 38 | Compare X register (absolute)
	CPY $FC8C			; CC 8C FC | Compare Y register (absolute)
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	LDY #$BC			 ; A0 BC | Load immediate value into Y register
	BVS $28			  ; 70 28 | Branch if overflow set
	BEQ $7F			  ; F0 7F | Branch if equal
	RTI				  ; 40 | Return from interrupt
	ORA $000D			; 0D 0D 00 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA $000D			; 0D 0D 00 | Logical OR with accumulator (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0FA
; Address: $FABAC5
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0FA:
	SEC				  ; 38 | Set carry flag
	INC $FCEC,X		  ; FE EC FC | Increment (absolute,X)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $00			  ; 90 00 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $90			  ; 90 90 | Branch if carry clear
	CPX $40			  ; E4 40 | Compare X register (zero page)
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0FB
; Address: $FABB25
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0FB:
	JSR $3C7F			; 20 7F 3C | Jump to subroutine
	ORA $0F3F,Y		  ; 19 3F 0F | Logical OR with accumulator (absolute,Y)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0FC
; Address: $FABB47
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0FC:
	JSR $C0F2			; 20 F2 C0 | Jump to subroutine
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	BRA $80			  ; 80 80 | Branch always
	LDA				  ; BF 3F 1F BF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0FD
; Address: $FABB71
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0FD:
	JSR $007F			; 20 7F 00 | Jump to subroutine
	CPY #$9F			 ; C0 9F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FEFB,X		  ; FE FB FE | Increment (absolute,X)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	INC $FCFD,X		  ; FE FD FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $F8E3,X		  ; FD E3 F8 | Subtract with carry (absolute,X)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SBC $E002,Y		  ; F9 02 E0 | Game work RAM access
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0FE
; Address: $FABBC6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0FE:
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F 67 1F E7 | Store accumulator to absolute long,X
	BEQ $F8			  ; F0 F8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $E0			  ; F0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_0FF
; Address: $FABBE3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_0FF:
	JSR $2080			; 20 80 20 | Jump to subroutine
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_100
; Address: $FABBEB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_100:
	BMI $60			  ; 30 60 | Branch if negative
	BMI $70			  ; 30 70 | Branch if negative
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_101
; Address: $FABBFE
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_101:
	JSR $0100			; 20 00 01 | Jump to subroutine
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY $33FF,X		  ; BC FF 33 | Load from absolute,X into Y register
	LDY $E8B9			; AC B9 E8 | Load from absolute address into Y register
	ROR $76DF,X		  ; 7E DF 76 | Rotate right (absolute,X)
	CPX #$6B			 ; E0 6B | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_102
; Address: $FABC31
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_102:
	JSR $0738			; 20 38 07 | Jump to subroutine
	LDY #$1F			 ; A0 1F | Load immediate value into Y register
	ORA $1A45,X		  ; 1D 45 1A | Logical OR with accumulator (absolute,X)
	LDY #$9F			 ; A0 9F | Load immediate value into Y register
	INY				  ; C8 | Increment Y register
	BCC $6F			  ; 90 6F | Branch if carry clear
	STA ($DC,X)		  ; 81 DC | Store accumulator to (zero page,X)
	BRA $9F			  ; 80 9F | Branch always
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	BPL $FC			  ; 10 FC | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $BF00,X		  ; FE 00 BF | Increment (absolute,X)
	STA				  ; 9F 61 07 F8 | Store accumulator to absolute long,X
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_103
; Address: $FABC63
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_103:
	BPL $D8			  ; 10 D8 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PLX				  ; FA | Pull X register from stack
	ASL $064D,X		  ; 1E 4D 06 | Arithmetic shift left (absolute,X)
	SBC $6072			; ED 72 60 | Subtract with carry (absolute)
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	BMI $04			  ; 30 04 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_104
; Address: $FABC79
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_104:
	STZ $8649,X		  ; 9E 49 86 | Store zero to absolute,X
	SEP #$8D			 ; E2 8D | Set processor status bits
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $3D04,X		  ; 1E 04 3D | Arithmetic shift left (absolute,X)
	ORA #$BF			 ; 09 BF | Logical OR with accumulator (immediate)
	LDA				  ; BF 10 3E 10 | Load from absolute long,X into accumulator
	JMP $010108		  ; 5C 08 01 01 | Jump to address long
	ASL $3D1E,X		  ; 1E 1E 3D | Arithmetic shift left (absolute,X)
	AND $BFBF,X		  ; 3D BF BF | Logical AND with accumulator (absolute,X)
	LDA				  ; BF BF 3E 3E | Load from absolute long,X into accumulator
	JMP $00E05C		  ; 5C 5C E0 00 | Jump to address long
	STZ $FE00			; 9C 00 FE | Store zero to absolute
	DEY				  ; 88 | Decrement Y register
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	ASL $0E1F			; 0E 1F 0E | Arithmetic shift left (absolute)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STZ $FE9C			; 9C 9C FE | Store zero to absolute
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	AND $3F08,Y		  ; 39 08 3F | Logical AND with accumulator (absolute,Y)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	ASL $0404,X		  ; 1E 04 04 | Arithmetic shift left (absolute,X)
	AND $3F39,Y		  ; 39 39 3F | Logical AND with accumulator (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	BPL $FE			  ; 10 FE | Branch if positive
	CPX #$FA			 ; E0 FA | Compare X register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_105
; Address: $FABCED
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_105:
	JSR $187C			; 20 7C 18 | Jump to subroutine
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	INC $FAFE,X		  ; FE FE FA | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_106
; Address: $FABD0C
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_106:
	PHA				  ; 48 | Push accumulator to stack
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	ROL $26			  ; 26 26 | Rotate left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	ASL $0F04			; 0E 04 0F | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	ASL $0F0E			; 0E 0E 0F | Arithmetic shift left (absolute)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ROL $301C,X		  ; 3E 1C 30 | Rotate left (absolute,X)
	BMI $20			  ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_107
; Address: $FABD4E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_107:
	JSR $0100			; 20 00 01 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	BMI $10			  ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_108
; Address: $FABD5D
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_108:
	JSR $0020			; 20 20 00 | Jump to subroutine
	SBC $F2F0,X		  ; FD F0 F2 | Subtract with carry (absolute,X)
	BIT $A3E2			; 2C E2 A3 | Test bits in accumulator (absolute)
	STZ $01			  ; 64 01 | Store zero to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	TSX				  ; BA | Transfer stack pointer to X register
	ORA $0F08,X		  ; 1D 08 0F | Logical OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $38			  ; 70 38 | Branch if overflow set
	BVC $38			  ; 50 38 | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $1D			  ; 30 1D | Branch if negative
	ORA $3652,X		  ; 1D 52 36 | Logical OR with accumulator (absolute,X)
	AND $0020			; 2D 20 00 | Logical AND with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_109
; Address: $FABDA2
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_109:
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ASL $3603			; 0E 03 36 | Arithmetic shift left (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STY $6ED7			; 8C D7 6E | Store Y register to absolute address
	LDX $0000,Y		  ; BE 00 00 | Load from absolute,Y into X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	JMP $6608			; 4C 08 66 | Jump to address
	RTI				  ; 40 | Return from interrupt
	BMI $C6			  ; 30 C6 | Branch if negative
	CPY #$33			 ; C0 33 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	BEQ $7C			  ; F0 7C | Branch if equal
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	BCC $80			  ; 90 80 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $6F			  ; 80 6F | Branch always
	BVC $E3			  ; 50 E3 | Branch if overflow clear
	ROL $59			  ; 26 59 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_10A
; Address: $FABDD6
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_10A:
	JSR $50DF			; 20 DF 50 | Jump to subroutine
	LDA $EFE718		  ; AF 18 E7 EF | Load from absolute long address into accumulator
	BPL $E3			  ; 10 E3 | Branch if positive
	JMP $710200		  ; 5C 00 02 71 | Jump to address long
	SBC ($0D),Y		  ; F1 0D | Subtract with carry ((zero page),Y)
	SBC $0200,Y		  ; F9 00 02 | Subtract with carry (absolute,Y)
	CMP $F8			  ; C5 F8 | Compare accumulator (zero page)
	SBC $73FC,X		  ; FD FC 73 | Subtract with carry (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $E7C6,Y		  ; F9 C6 E7 | Subtract with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	LDY $D8C8,X		  ; BC C8 D8 | Load from absolute,X into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_10C
; Address: $FABE0C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_10C:
	JSR $8000			; 20 00 80 | Jump to subroutine
	INC $18			  ; E6 18 | Increment (zero page)
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_110
; Address: $FABE27
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_110:
	JSR $3F7F			; 20 7F 3F | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	INC $FE30,X		  ; FE 30 FE | Increment (absolute,X)
	BEQ $FA			  ; F0 FA | Branch if equal
	CPX #$F4			 ; E0 F4 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FAFA,X		  ; FE FA FA | Increment (absolute,X)
	PEA #$C0F4		   ; F4 F4 C0 | Push effective address to stack
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDY $BC18,X		  ; BC 18 BC | Load from absolute,X into Y register
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BPL $78			  ; 10 78 | Branch if positive
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank74_DmaFunction_111
; Address: $FABE8A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_111:
	JSR $0000			; 20 00 00 | Jump to subroutine
	LDY $BCBC,X		  ; BC BC BC | Load from absolute,X into Y register
	LDY $3838,X		  ; BC 38 38 | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank74_DmaFunction_112
; Address: $FABE9A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_112:
	JSR $0020			; 20 20 00 | Jump to subroutine
	CPX $40			  ; E4 40 | Compare X register (zero page)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_113
; Address: $FABEA5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_113:
	JSR $0038			; 20 38 00 | Jump to subroutine
	ORA $0100			; 0D 00 01 | Logical OR with accumulator (absolute)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_115
; Address: $FABEB6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_115:
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA $010D			; 0D 0D 01 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY #$E6			 ; C0 E6 | Compare Y register (immediate)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	INC $E6			  ; E6 E6 | Increment (zero page)
	ASL $303E			; 0E 3E 30 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_116
; Address: $FABEEB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_116:
	BEQ $FC			  ; F0 FC | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $1B24,X		  ; 3D 24 1B | Logical AND with accumulator (absolute,X)
	ORA #$26			 ; 09 26 | Logical OR with accumulator (immediate)
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ROL $7798,X		  ; 3E 98 77 | Rotate left (absolute,X)
	EOR $BA			  ; 45 BA | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_117
; Address: $FABF26
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_117:
	JSL $09F01D		  ; 22 1D F0 09 | Jump to subroutine long
	LDY $1B			  ; A4 1B | Load from zero page into Y register
	BPL $1C			  ; 10 1C | Branch if positive
	EOR ($10,X)		  ; 41 10 | Exclusive OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	REP #$49			 ; C2 49 | Reset processor status bits
	LDX $BB			  ; A6 BB | Load from zero page into X register
	CLI				  ; 58 | Clear interrupt disable flag
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BPL $40			  ; 10 40 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_119
; Address: $FABF53
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_119:
	STA				  ; 9F 10 EF 0F | Store accumulator to absolute long,X
	BEQ $40			  ; F0 40 | Branch if equal
	LDA				  ; BF 67 98 92 | Load from absolute long,X into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $9600,X		  ; 7D 00 96 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_11A
; Address: $FABF66
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_11A:
	JSR $F000			; 20 00 F0 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	BVS $00			  ; 70 00 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	ORA $16E6,Y		  ; 19 E6 16 | Logical OR with accumulator (absolute,Y)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	LDY #$88			 ; A0 88 | Load immediate value into Y register
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_11B
; Address: $FABF88
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_11B:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_11C
; Address: $FABF98
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_11C:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_11D
; Address: $FABF9E
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_11D:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_11E
; Address: $FAC00A
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_11E:
	JSR $80E0			; 20 E0 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $0706,X		  ; FE 06 07 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $1608			; 0E 08 16 | Arithmetic shift left (absolute)
	ASL $0C00,X		  ; 1E 00 0C | Arithmetic shift left (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_11F
; Address: $FAC0FA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_11F:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BMI $70			  ; 30 70 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	JMP $5FCC			; 4C CC 5F | Jump to address

;------------------------------------------------------------------------------
; Bank74_DmaFunction_121
; Address: $FAC13F
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_121:
	JSR $0101			; 20 01 01 | Jump to subroutine
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $C0			  ; 80 C0 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $80			  ; F0 80 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_122
; Address: $FAC174
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_122:
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BMI $70			  ; 30 70 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	JMP $5FCC			; 4C CC 5F | Jump to address

;------------------------------------------------------------------------------
; Bank74_DmaFunction_123
; Address: $FAC19E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_123:
	JSR $0000			; 20 00 00 | Jump to subroutine
	INC $0706,X		  ; FE 06 07 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_124
; Address: $FAC1AC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_124:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_125
; Address: $FAC1D8
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_125:
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	BPL $0B			  ; 10 0B | Branch if positive
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF FF 3E 7F | Load from absolute long,X into accumulator
	JMP $B9A47F		  ; 5C 7F A4 B9 | Jump to address long
	INX				  ; E8 | Increment X register
	BVS $DF			  ; 70 DF | Branch if overflow set
	BVS $B3			  ; 70 B3 | Branch if overflow set
	CPX #$6C			 ; E0 6C | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_126
; Address: $FAC211
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_126:
	JSR $003F			; 20 3F 00 | Jump to subroutine
	LDX $9D00,Y		  ; BE 00 9D | Load from absolute,Y into X register
	EOR $02			  ; 45 02 | Exclusive OR with accumulator (zero page)
	LDY #$9F			 ; A0 9F | Load immediate value into Y register
	INY				  ; C8 | Increment Y register
	BCC $6F			  ; 90 6F | Branch if carry clear
	BRA $BE			  ; 80 BE | Branch always
	CLC				  ; 18 | Clear carry flag
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	LDX $FF41,Y		  ; BE 41 FF | Load from absolute,Y into X register
	INC $0019,X		  ; FE 19 00 | Increment (absolute,X)
	INX				  ; E8 | Increment X register
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_127
; Address: $FAC246
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_127:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BNE $60			  ; D0 60 | Branch if not equal
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_128
; Address: $FAC24F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_128:
	BVS $A8			  ; 70 A8 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	BVC $80			  ; 50 80 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank74_DmaFunction_129
; Address: $FAC256
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_129:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $10			  ; 80 10 | Branch always
	CPX #$88			 ; E0 88 | Compare X register (immediate)
	BVS $7F			  ; 70 7F | Branch if overflow set
	ROL $1C7F,X		  ; 3E 7F 1C | Rotate left (absolute,X)
	ORA $3028,Y		  ; 19 28 30 | Logical OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_12A
; Address: $FAC273
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_12A:
	JSR $206C			; 20 6C 20 | Jump to subroutine
	ROL $1D00,X		  ; 3E 00 1D | Rotate left (absolute,X)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	BRA $BE			  ; 80 BE | Branch always
	CLC				  ; 18 | Clear carry flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	LDX $FF41,Y		  ; BE 41 FF | Load from absolute,Y into X register
	INC $F819,X		  ; FE 19 F8 | Increment (absolute,X)
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $E8			  ; F0 E8 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_12B
; Address: $FAC2AA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_12B:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $00			  ; F0 00 | Branch if equal
	BVC $80			  ; 50 80 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank74_DmaFunction_12C
; Address: $FAC2BA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_12C:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	PEA #$1418		   ; F4 18 14 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	LDY $D8C8,X		  ; BC C8 D8 | Load from absolute,X into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_12E
; Address: $FAC30C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_12E:
	JSR $8000			; 20 00 80 | Jump to subroutine
	CPX $18			  ; E4 18 | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_130
; Address: $FAC31C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_130:
	JSR $8000			; 20 00 80 | Jump to subroutine
	BVS $33			  ; 70 33 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_131
; Address: $FAC324
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_131:
	JSR $4040			; 20 40 40 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $63			  ; 10 63 | Branch if positive

;------------------------------------------------------------------------------
; Bank74_DmaFunction_132
; Address: $FAC334
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_132:
	JSR $4040			; 20 40 40 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BNE $60			  ; D0 60 | Branch if not equal
	INX				  ; E8 | Increment X register
	BVS $74			  ; 70 74 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $E0			  ; 10 E0 | Game work RAM access
	DEY				  ; 88 | Decrement Y register
	BVS $64			  ; 70 64 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BEQ $80			  ; F0 80 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $F880,X		  ; FE 80 F8 | Increment (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INC $F8FE,X		  ; FE FE F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_133
; Address: $FAC40B
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_133:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF BF FF 7F | Load from absolute long,X into accumulator
	BEQ $F3			  ; F0 F3 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STA $83FC80		  ; 8F 80 FC 83 | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_136
; Address: $FAC49E
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_136:
	ASL $031E,X		  ; 1E 1E 03 | Arithmetic shift left (absolute,X)
	BEQ $C0			  ; F0 C0 | Branch if equal
	SBC $C0F0,X		  ; FD F0 C0 | Subtract with carry (absolute,X)
	BRA $F0			  ; 80 F0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC $C0FD,X		  ; FD FD C0 | Subtract with carry (absolute,X)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($6F,X)		  ; 01 6F | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_137
; Address: $FAC507
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_137:
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $C0FE,X		  ; FE FE C0 | Increment (absolute,X)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BPL $60			  ; 10 60 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	BMI $14			  ; 30 14 | Branch if negative
	SEC				  ; 38 | Set carry flag
	INC				  ; 1A | Increment accumulator
	ASL $170F,X		  ; 1E 0F 17 | Arithmetic shift left (absolute,X)
	ASL $0709			; 0E 09 07 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_138
; Address: $FAC532
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_138:
	JSR $3000			; 20 00 30 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ASL $1603			; 0E 03 16 | Arithmetic shift left (absolute)
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	BIT $AEF7			; 2C F7 AE | Test bits in accumulator (absolute)
	LSR $0000,X		  ; 5E 00 00 | Logical shift right (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	STY $A608			; 8C 08 A6 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank74_DmaFunction_139
; Address: $FAC55F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_139:
	JSR $E770			; 20 70 E7 | Jump to subroutine
	CPY #$33			 ; C0 33 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	BEQ $7C			  ; F0 7C | Branch if equal
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	BCC $80			  ; 90 80 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $37			  ; 80 37 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_13A
; Address: $FAC576
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_13A:
	JSR $50DF			; 20 DF 50 | Jump to subroutine
	LDA $B7E718		  ; AF 18 E7 B7 | Load from absolute long address into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDY $FEF8			; AC F8 FE | Load from absolute address into Y register
	ADC ($FC),Y		  ; 71 FC | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_13B
; Address: $FAC585
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_13B:
	SBC ($0D),Y		  ; F1 0D | Subtract with carry ((zero page),Y)
	SBC $0200,Y		  ; F9 00 02 | Subtract with carry (absolute,Y)
	CMP $F8			  ; C5 F8 | Compare accumulator (zero page)
	INC $FCF9,X		  ; FE F9 FC | Increment (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $E7C6,Y		  ; F9 C6 E7 | Subtract with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BNE $60			  ; D0 60 | Branch if not equal
	BVC $20			  ; 50 20 | Branch if overflow clear
	BVS $20			  ; 70 20 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank74_DmaFunction_13F
; Address: $FAC5BC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_13F:
	JSR $8000			; 20 00 80 | Jump to subroutine
	BEQ $90			  ; F0 90 | Branch if equal
	STA				  ; 9F F7 37 3C | Store accumulator to absolute long,X
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_140
; Address: $FAC5FC
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_140:
	AND $0C00,Y		  ; 39 00 0C | Logical AND with accumulator (absolute,Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $C8			  ; F0 C8 | Branch if equal
	INY				  ; C8 | Increment Y register
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL $0916			; 0E 16 09 | Arithmetic shift left (absolute)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_141
; Address: $FAC672
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_141:
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	STA				  ; 9F D8 B7 25 | Store accumulator to absolute long,X
	PHX				  ; DA | Push X register to stack
	CPX $843A			; EC 3A 84 | Compare X register (absolute)
	BVS $8D			  ; 70 8D | Branch if overflow set
	STX $3300			; 8E 00 33 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank74_DmaFunction_142
; Address: $FAC691
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_142:
	JSR $0090			; 20 90 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $63			  ; 84 63 | Store Y register to zero page
	LDA $4D42			; AD 42 4D | Load from absolute address into accumulator
	STX $A800			; 8E 00 A8 | Store X register to absolute address
	BVS $FC			  ; 70 FC | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	STA $3F8020		  ; 8F 20 80 3F | Store accumulator to absolute long address
	BRA $D2			  ; 80 D2 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BMI $CF			  ; 30 CF | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	STA $7F8070		  ; 8F 70 80 7F | Store accumulator to absolute long address
	CLI				  ; 58 | Clear interrupt disable flag
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $2300			; 0E 00 23 | Arithmetic shift left (absolute)
	ASL $230E			; 0E 0E 23 | Arithmetic shift left (absolute)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	INC $1C00,X		  ; FE 00 1C | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $8080,X		  ; FE 80 80 | Increment (absolute,X)
	PEA #$C000		   ; F4 00 C0 | Push effective address to stack
	INC $1CFE,X		  ; FE FE 1C | Increment (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	INC $80FE,X		  ; FE FE 80 | Increment (absolute,X)
	BRA $F4			  ; 80 F4 | Branch always
	PEA #$C0C0		   ; F4 C0 C0 | Push effective address to stack
	BMI $F0			  ; 30 F0 | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	STA				  ; 9F 00 7F 00 | Store accumulator to absolute long,X
	ASL $1C0D			; 0E 0D 1C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_143
; Address: $FAC7A5
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_143:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $0F1C			; 0D 1C 0F | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BCS $40			  ; B0 40 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	STA				  ; 9F F8 1F F0 | Store accumulator to absolute long,X
	ROL $F2E4,X		  ; 3E E4 F2 | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_144
; Address: $FAC7F3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_144:
	BEQ $F7			  ; F0 F7 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$E7			 ; E0 E7 | Compare X register (immediate)
	PLX				  ; FA | Pull X register from stack
	ORA $0703,X		  ; 1D 03 07 | Logical OR with accumulator (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $0D06			; 0D 06 0D | Logical OR with accumulator (absolute)
	ASL $0F07			; 0E 07 0F | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_145
; Address: $FAC823
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_145:
	BRA $70			  ; 80 70 | Branch always
	BCC $FE			  ; 90 FE | Branch if carry clear
	ROL $3FF8,X		  ; 3E F8 3F | Rotate left (absolute,X)
	BEQ $7E			  ; F0 7E | Branch if equal
	CPX $F2			  ; E4 F2 | Compare X register (zero page)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	CPX #$C1			 ; E0 C1 | Compare X register (immediate)
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	STA $1F1B8F		  ; 8F 8F 1B 1F | Store accumulator to absolute long address
	PLX				  ; FA | Pull X register from stack
	ORA $1C0F,X		  ; 1D 0F 1C | Logical OR with accumulator (absolute,X)
	ORA $193A,X		  ; 1D 3A 19 | Logical OR with accumulator (absolute,X)
	BMI $1F			  ; 30 1F | Branch if negative
	AND $3F1F,Y		  ; 39 1F 3F | Logical AND with accumulator (absolute,Y)
	ASL $1E06,X		  ; 1E 06 1E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_146
; Address: $FAC862
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_146:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STZ $F89E,X		  ; 9E 9E F8 | Store zero to absolute,X
	BEQ $FE			  ; F0 FE | Branch if equal
	CPX $F2			  ; E4 F2 | Compare X register (zero page)
	BRA $FF			  ; 80 FF | Branch always
	BRA $61			  ; 80 61 | Branch always
	PLX				  ; FA | Pull X register from stack
	ORA $0703,X		  ; 1D 03 07 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $10			  ; 10 10 | Branch if positive
	ORA $1804,X		  ; 1D 04 18 | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	STA ($DC,X)		  ; 81 DC | Store accumulator to (zero page,X)
	BRA $9F			  ; 80 9F | Branch always
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 3F 3B 5F | Load from absolute long,X into accumulator
	STA				  ; 9F 61 07 F8 | Store accumulator to absolute long,X
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	BPL $D8			  ; 10 D8 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PLX				  ; FA | Pull X register from stack
	ASL $060D,X		  ; 1E 0D 06 | Arithmetic shift left (absolute,X)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_147
; Address: $FAC8D1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_147:
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	BMI $04			  ; 30 04 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_148
; Address: $FAC8D9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_148:
	STZ $0609,X		  ; 9E 09 06 | Store zero to absolute,X
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $0804			; 0E 04 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_149
; Address: $FAC8FE
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_149:
	PHP				  ; 08 | Push processor status to stack
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	ADC ($EC,X)		  ; 61 EC | Add with carry ((zero page,X))
	CPX #$8F			 ; E0 8F | Compare X register (immediate)
	LDY #$E1			 ; A0 E1 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	STA $89D12F		  ; 8F 2F D1 89 | Store accumulator to absolute long address
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $0804			; 0E 04 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	SBC ($EC,X)		  ; E1 EC | Subtract with carry ((zero page,X))
	CPX #$8F			 ; E0 8F | Compare X register (immediate)
	LDY #$C1			 ; A0 C1 | Load immediate value into Y register
	CLC				  ; 18 | Clear carry flag
	BMI $06			  ; 30 06 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	STA $99D12F		  ; 8F 2F D1 99 | Store accumulator to absolute long address
	ROR $06			  ; 66 06 | Rotate right (zero page)
	AND $0F00,Y		  ; 39 00 0F | Logical AND with accumulator (absolute,Y)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $0804			; 0E 04 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	SBC ($EC,X)		  ; E1 EC | Subtract with carry ((zero page,X))
	CPX #$8F			 ; E0 8F | Compare X register (immediate)
	CPX #$81			 ; E0 81 | Compare X register (immediate)
	BPL $C0			  ; 10 C0 | Branch if positive
	ASL $0370			; 0E 70 03 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	STA $91910F		  ; 8F 0F 91 91 | Store accumulator to absolute long address
	ROR $F10E			; 6E 0E F1 | Rotate right (absolute)
	BVS $E7			  ; 70 E7 | Branch if overflow set
	CPY #$33			 ; C0 33 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	BEQ $7C			  ; F0 7C | Branch if equal
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	BCC $80			  ; 90 80 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank74_DmaFunction_14A
; Address: $FAC9AC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_14A:
	BRA $6F			  ; 80 6F | Branch always
	BVC $E3			  ; 50 E3 | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_14B
; Address: $FAC9B6
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_14B:
	JSR $50DF			; 20 DF 50 | Jump to subroutine
	LDA $EFE718		  ; AF 18 E7 EF | Load from absolute long address into accumulator
	BPL $E3			  ; 10 E3 | Branch if positive
	JMP $000002		  ; 5C 02 00 00 | Jump to address long
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SBC $FE00,Y		  ; F9 00 FE | Subtract with carry (absolute,Y)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $70			  ; F0 70 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BCC $00			  ; 90 00 | Branch if carry clear
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $0E06			; 0E 06 0E | Arithmetic shift left (absolute)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F 00 7F 00 | Store accumulator to absolute long,X
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $7C			  ; 70 7C | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_14D
; Address: $FACB14
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_14D:
	STY $0400			; 8C 00 04 | Store Y register to absolute address
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STX $0400			; 8E 00 04 | Store X register to absolute address
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	ASL $1E38,X		  ; 1E 38 1E | Arithmetic shift left (absolute,X)
	SEC				  ; 38 | Set carry flag
	ADC ($1F),Y		  ; 71 1F | Add with carry ((zero page),Y)
	ASL $17			  ; 06 17 | Arithmetic shift left (zero page)
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ASL $0C1C			; 0E 1C 0C | Arithmetic shift left (absolute)
	BVS $70			  ; 70 70 | Branch if overflow set
	STA $000000		  ; 8F 00 00 00 | Store accumulator to absolute long address
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	ROL $7E3C,X		  ; 3E 3C 7E | Rotate left (absolute,X)
	ROR $FEFF,X		  ; 7E FF FE | Rotate right (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $00CC,X		  ; FE CC 00 | Increment (absolute,X)
	DEC $00			  ; C6 00 | Decrement (zero page)
	STX $00			  ; 86 00 | Store X register to zero page
	ROL $007E,X		  ; 3E 7E 00 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1E0B,X		  ; 1E 0B 1E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ASL $1D39,X		  ; 1E 39 1D | Arithmetic shift left (absolute,X)
	ASL $0107,X		  ; 1E 07 01 | Arithmetic shift left (absolute,X)
	ORA ($1B,X)		  ; 01 1B | Logical OR with accumulator ((zero page,X))
	ORA $1400,Y		  ; 19 00 14 | Logical OR with accumulator (absolute,Y)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BMI $C1			  ; 30 C1 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	CPY #$E7			 ; C0 E7 | Compare Y register (immediate)
	BPL $F1			  ; 10 F1 | Branch if positive
	BRA $FF			  ; 80 FF | Branch always
	SBC $FB00,X		  ; FD 00 FB | Subtract with carry (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BMI $CF			  ; 30 CF | Branch if negative
	BNE $2F			  ; D0 2F | Branch if not equal
	BRA $BF			  ; 80 BF | Branch always
	SEC				  ; 38 | Set carry flag
	INC $7CFF,X		  ; FE FF 7C | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_14E
; Address: $FACC12
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_14E:
	LDA				  ; BF 40 FF 00 | Load from absolute long,X into accumulator
	SEC				  ; 38 | Set carry flag
	INC $7CFF,X		  ; FE FF 7C | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SEI				  ; 78 | Set interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	BRA $08			  ; 80 08 | Branch always
	BRA $10			  ; 80 10 | Branch always
	PEA #$7A18		   ; F4 18 7A | Push effective address to stack
	NOP				  ; EA | No operation
	BRA $94			  ; 80 94 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_14F
; Address: $FACC36
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_14F:
	DEY				  ; 88 | Decrement Y register
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $10			  ; 70 10 | Branch if overflow set
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	WDM #$BC			 ; 42 BC | Reserved instruction
	LSR $4F0C,X		  ; 5E 0C 4F | Logical shift right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	JMP $17781B		  ; 5C 1B 78 17 | Jump to address long
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BVS $81			  ; 70 81 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BRA $E7			  ; 80 E7 | Branch always
	BPL $03			  ; 10 03 | Branch if positive
	SBC $FB00,X		  ; FD 00 FB | Subtract with carry (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BVS $8F			  ; 70 8F | Branch if overflow set
	BCC $6F			  ; 90 6F | Branch if carry clear
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	ROR $00FF,X		  ; 7E FF 00 | Rotate right (absolute,X)
	ROL $0001,X		  ; 3E 01 00 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_150
; Address: $FACC93
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_150:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	ROR $C13E,X		  ; 7E 3E C1 | Rotate right (absolute,X)
	INC $DE1F,X		  ; FE 1F DE | Increment (absolute,X)
	ASL $E4			  ; 06 E4 | Arithmetic shift left (zero page)
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BRA $3C			  ; 80 3C | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_151
; Address: $FACCB3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_151:
	JSR $18E6			; 20 E6 18 | Jump to subroutine
	SEP #$1C			 ; E2 1C | Set processor status bits
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	BVS $08			  ; 70 08 | Branch if overflow set
	BPL $EF			  ; 10 EF | Branch if positive
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_152
; Address: $FACCCE
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_152:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $7F9FFF		  ; 8F FF 9F 7F | Store accumulator to absolute long address
	ROL $7F00,X		  ; 3E 00 7F | Rotate left (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	BVS $FF			  ; 70 FF | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_153
; Address: $FACD21
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_153:
	ORA $2C0B,X		  ; 1D 0B 2C | Logical OR with accumulator (absolute,X)
	ORA $0D37,X		  ; 1D 37 0D | Logical OR with accumulator (absolute,X)
	INC $DE82,X		  ; FE 82 DE | Increment (absolute,X)
	SBC $B36D			; ED 6D B3 | Subtract with carry (absolute)
	ORA $0C00,Y		  ; 19 00 0C | Logical OR with accumulator (absolute,Y)
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ORA $2002			; 0D 02 20 | Logical OR with accumulator (absolute)
	EOR ($C0,X)		  ; 41 C0 | Exclusive OR with accumulator ((zero page,X))
	ORA ($CF,X)		  ; 01 CF | Logical OR with accumulator ((zero page,X))
	CPX #$C7			 ; E0 C7 | Compare X register (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_154
; Address: $FACD4D
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_154:
	LDA				  ; BF 41 8F 1C | Load from absolute long,X into accumulator
	SBC ($07),Y		  ; F1 07 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 60 9F BF | Load from absolute long,X into accumulator
	STA $01FC71		  ; 8F 71 FC 01 | Store accumulator to absolute long address
	BEQ $FE			  ; F0 FE | Branch if equal
	CMP ($F8,X)		  ; C1 F8 | Compare accumulator ((zero page,X))
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	SBC $C200,Y		  ; F9 00 C2 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	INC $F1FE,X		  ; FE FE F1 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ADC $8506,X		  ; 7D 06 85 | Add with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_155
; Address: $FACD8C
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_155:
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	BRA $79			  ; 80 79 | Branch always
	STX $05			  ; 86 05 | Store X register to zero page
	ORA $E6F2			; 0D F2 E6 | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP $7A			  ; C5 7A | Compare accumulator (zero page)
	LDA $CF79,Y		  ; B9 79 CF | Load from absolute,Y into accumulator
	DEC $FC3A			; CE 3A FC | Decrement (absolute)
	STY $FC			  ; 84 FC | Store Y register to zero page
	PLY				  ; 7A | Pull Y register from stack
	ORA #$72			 ; 09 72 | Logical OR with accumulator (immediate)
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	ADC $3A36,Y		  ; 79 36 3A | Add with carry (absolute,Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	WDM #$80			 ; 42 80 | Reserved instruction
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	CPY #$87			 ; C0 87 | Compare Y register (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	BRA $03			  ; 80 03 | Branch always
	CPX #$07			 ; E0 07 | Compare X register (immediate)
	SBC ($07),Y		  ; F1 07 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SBC ($FC,X)		  ; E1 FC | Subtract with carry ((zero page,X))
	STA ($F0,X)		  ; 81 F0 | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	SBC ($8E),Y		  ; F1 8E | Subtract with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_156
; Address: $FACE02
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_156:
	JSR $7A80			; 20 80 7A | Jump to subroutine
	LDA $2506,X		  ; BD 06 25 | Load from absolute,X into accumulator
	BCC $60			  ; 90 60 | Branch if carry clear
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_157
; Address: $FACE16
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_157:
	AND $25C6,Y		  ; 39 C6 25 | Logical AND with accumulator (absolute,Y)
	REP #$45			 ; C2 45 | Reset processor status bits
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_159
; Address: $FACE30
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_159:
	JSR $A0C0			; 20 C0 A0 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	STA $1F033F		  ; 8F 3F 03 1F | Store accumulator to absolute long address
	BRA $1F			  ; 80 1F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $03			  ; 80 03 | Branch always
	EOR $BA			  ; 45 BA | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_15A
; Address: $FACE66
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_15A:
	JSL $09F01D		  ; 22 1D F0 09 | Jump to subroutine long
	LDY $1B			  ; A4 1B | Load from zero page into Y register
	BPL $1C			  ; 10 1C | Branch if positive
	EOR $11			  ; 45 11 | Exclusive OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	REP #$49			 ; C2 49 | Reset processor status bits
	LDX $BB			  ; A6 BB | Load from zero page into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_15E
; Address: $FACE94
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_15E:
	JSR $1FDF			; 20 DF 1F | Jump to subroutine
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	LDA				  ; BF 67 98 92 | Load from absolute long,X into accumulator
	ORA $7E80			; 0D 80 7E | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_15F
; Address: $FACEA6
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_15F:
	JSR $F000			; 20 00 F0 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	BVS $00			  ; 70 00 | Branch if overflow set
	STY $7B			  ; 84 7B | Store Y register to zero page
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	LDY #$88			 ; A0 88 | Load immediate value into Y register
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	NOP				  ; EA | No operation
	SEI				  ; 78 | Set interrupt disable flag
	LSR $B8			  ; 46 B8 | Logical shift right (zero page)
	BIT $1A			  ; 24 1A | Test bits in accumulator (zero page)
	BEQ $0A			  ; F0 0A | Branch if equal
	LDY $12			  ; A4 12 | Load from zero page into Y register
	BPL $1C			  ; 10 1C | Branch if positive
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $4A			  ; C5 4A | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_160
; Address: $FACEF9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_160:
	LDA $B2			  ; A5 B2 | Load from zero page into accumulator
	ORA $0C33			; 0D 33 0C | Logical OR with accumulator (absolute)
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_161
; Address: $FACF06
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_161:
	BRA $1F			  ; 80 1F | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_162
; Address: $FACF15
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_162:
	STA				  ; 9F 1F E0 80 | Store accumulator to absolute long,X
	CLC				  ; 18 | Clear carry flag
	CPY #$39			 ; C0 39 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	CPX $00			  ; E4 00 | Compare X register (zero page)
	SEC				  ; 38 | Set carry flag
	DEC $39			  ; C6 39 | Decrement (zero page)
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	BNE $C4			  ; D0 C4 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BVC $00			  ; 50 00 | Branch if overflow clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $E0			  ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank74_DmaFunction_163
; Address: $FACF52
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_163:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	ORA ($F3,X)		  ; 01 F3 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F FF 7F 00 | Store accumulator to absolute long,X
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	DEC $FF			  ; C6 FF | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_164
; Address: $FACFCA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_164:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_167
; Address: $FACFEC
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_167:
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDA				  ; BF 00 00 00 | Load from absolute long,X into accumulator
	LDA				  ; BF BF 00 00 | Load from absolute long,X into accumulator
	BRA $00			  ; 80 00 | Branch always
	ASL $F000			; 0E 00 F0 | Arithmetic shift left (absolute)
	BRA $FF			  ; 80 FF | Branch always
	DEC $FF			  ; C6 FF | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	ASL $F00E			; 0E 0E F0 | Arithmetic shift left (absolute)
	BEQ $E7			  ; F0 E7 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BVS $70			  ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank74_DmaFunction_169
; Address: $FAD0BC
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_169:
	JSR $8020			; 20 20 80 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BCS $00			  ; B0 00 | Branch if carry set
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BCS $B0			  ; B0 B0 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_16A
; Address: $FAD130
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_16A:
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	STY $C7			  ; 84 C7 | Store Y register to zero page
	BRA $F9			  ; 80 F9 | Branch always
	RTI				  ; 40 | Return from interrupt
	BEQ $FC			  ; F0 FC | Branch if equal
	BEQ $F8			  ; F0 F8 | Branch if equal
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_16B
; Address: $FAD16F
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_16B:
	JSR $FFFF			; 20 FF FF | Jump to subroutine
	SBC $FFF9,Y		  ; F9 F9 FF | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $C0FE,X		  ; FE FE C0 | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $F8			  ; 80 F8 | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BMI $30			  ; 30 30 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_16C
; Address: $FAD1A2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_16C:
	JSR $0300			; 20 00 03 | Jump to subroutine
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_16D
; Address: $FAD1B2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_16D:
	JSR $0320			; 20 20 03 | Jump to subroutine
	BMI $FF			  ; 30 FF | Branch if negative
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $80FF,X		  ; FD FF 80 | Subtract with carry (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STX $FF00			; 8E 00 FF | Store X register to absolute address
	ASL $FDFF			; 0E FF FD | Arithmetic shift left (absolute)
	BVS $FC			  ; 70 FC | Branch if overflow set
	BRA $FE			  ; 80 FE | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_16E
; Address: $FAD1EF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_16E:
	JSR $FCFC			; 20 FC FC | Jump to subroutine
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STX $FF8E			; 8E 8E FF | Store X register to absolute address
	INC $E0FE,X		  ; FE FE E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_170
; Address: $FAD20C
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_170:
	PHP				  ; 08 | Push processor status to stack
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_172
; Address: $FAD21C
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_172:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BVS $10			  ; 70 10 | Branch if overflow set
	ROR $FC00,X		  ; 7E 00 FC | Rotate right (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $10			  ; 10 10 | Branch if positive
	ROR $1C7E,X		  ; 7E 7E 1C | Rotate right (absolute,X)
	INC $1800,X		  ; FE 00 18 | Increment (absolute,X)
	INC $18FE,X		  ; FE FE 18 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $30			  ; 30 30 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $FFC0,X		  ; FE C0 FF | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$E0			 ; C0 E0 | Game work RAM access
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_173
; Address: $FAD390
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_173:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_176
; Address: $FAD3C0
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_176:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 01 C7 03 | Store accumulator to absolute long,X
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 9F C7 C7 | Store accumulator to absolute long,X
	INC $FF1C,X		  ; FE 1C FF | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STY $008C			; 8C 8C 00 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank74_DmaFunction_177
; Address: $FAD4F4
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_177:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ROL $003E,X		  ; 3E 3E 00 | Rotate left (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $0000,X		  ; 3E 00 00 | Rotate left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ROL $1C3E,X		  ; 3E 3E 1C | Rotate left (absolute,X)
	DEC $00			  ; C6 00 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BEQ $F0			  ; F0 F0 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STY $008C			; 8C 8C 00 | Store Y register to absolute address
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank74_DmaFunction_178
; Address: $FAD680
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_178:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	STA $808780		  ; 8F 80 87 80 | Store accumulator to absolute long address
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ROL $001C,X		  ; 3E 1C 00 | Rotate left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ASL $1F3E,X		  ; 1E 3E 1F | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BRA $C0			  ; 80 C0 | Branch always
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BEQ $D0			  ; F0 D0 | Branch if equal
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_17A
; Address: $FAD754
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_17A:
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $00			  ; F0 00 | Branch if equal
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	BIT $5838			; 2C 38 58 | Test bits in accumulator (absolute)
	BVS $30			  ; 70 30 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BVS $30			  ; 70 30 | Branch if overflow set
	ASL $3F3E,X		  ; 1E 3E 3F | Arithmetic shift left (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_17B
; Address: $FAD79B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_17B:
	JSR $203F			; 20 3F 20 | Jump to subroutine
	BRA $E0			  ; 80 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_17C
; Address: $FAD7A3
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_17C:
	BVS $F0			  ; 70 F0 | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$F4F8		   ; F4 F8 F4 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_17D
; Address: $FAD7CE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_17D:
	JSL $000022		  ; 22 22 00 00 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	BIT $4E38			; 2C 38 4E | Test bits in accumulator (absolute)
	EOR $0000,X		  ; 5D 00 00 | Exclusive OR with accumulator (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_17E
; Address: $FAD803
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_17E:
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	TXS				  ; 9A | Transfer X register to stack pointer
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	NOP				  ; EA | No operation
	PLA				  ; 68 | Pull accumulator from stack
	BCC $90			  ; 90 90 | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	BMI $C0			  ; 30 C0 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BVS $D8			  ; 70 D8 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	BVS $D0			  ; 70 D0 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	BNE $A8			  ; D0 A8 | Branch if not equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_180
; Address: $FAD894
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_180:
	JSR $8800			; 20 00 88 | Jump to subroutine
	BNE $00			  ; D0 00 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_181
; Address: $FAD8A7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_181:
	JSR $3171			; 20 71 31 | Jump to subroutine
	ASL $113F			; 0E 3F 11 | Arithmetic shift left (absolute)
	JMP ($0E17)		  ; 6C 17 0E | Jump to address (absolute indirect)
	ASL $1517			; 0E 17 15 | Arithmetic shift left (absolute)
	ASL $040A			; 0E 0A 04 | Arithmetic shift left (absolute)
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_183
; Address: $FAD8C1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_183:
	BRA $00			  ; 80 00 | Branch always
	BNE $10			  ; D0 10 | Branch if not equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $C0			  ; B0 C0 | Branch if carry set
	CLD				  ; D8 | Clear decimal mode flag
	BCS $38			  ; B0 38 | Branch if carry set
	BEQ $C0			  ; F0 C0 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_184
; Address: $FAD8D2
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_184:
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	BIT $1850			; 2C 50 18 | Test bits in accumulator (absolute)
	ASL $8FAE,X		  ; 1E AE 8F | Arithmetic shift left (absolute,X)
	CPY $86			  ; C4 86 | Compare Y register (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA $31			  ; 05 31 | Logical OR with accumulator (zero page)
	ORA #$D1			 ; 09 D1 | Logical OR with accumulator (immediate)
	AND ($A3),Y		  ; 31 A3 | Logical AND with accumulator ((zero page),Y)
	STX $C6			  ; 86 C6 | Store X register to zero page
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $9C00			; 0E 00 9C | Arithmetic shift left (absolute)
	AND $7A00,Y		  ; 39 00 7A | Logical AND with accumulator (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	STZ $FF9A,X		  ; 9E 9A FF | Store zero to absolute,X
	SBC $FF7F,X		  ; FD 7F FF | Subtract with carry (absolute,X)
	WDM #$7F			 ; 42 7F | Reserved instruction
	BRA $7F			  ; 80 7F | Branch always
	BRA $F5			  ; 80 F5 | Branch always
	ADC $00			  ; 65 00 | Add with carry (zero page)
	BRA $00			  ; 80 00 | Branch always
	LDA $7F00,X		  ; BD 00 7F | Load from absolute,X into accumulator
	ASL $0F02			; 0E 02 0F | Arithmetic shift left (absolute)
	ASL $1D06			; 0E 06 1D | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_185
; Address: $FAD94E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_185:
	JSR $051F			; 20 1F 05 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	SBC $EFFD,X		  ; FD FD EF | Subtract with carry (absolute,X)
	CMP ($7F,X)		  ; C1 7F | Compare accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_186
; Address: $FAD97C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_186:
	ROL $6700,X		  ; 3E 00 67 | Rotate left (absolute,X)
	ORA $3C07,Y		  ; 19 07 3C | Logical OR with accumulator (absolute,Y)
	ROL $6309			; 2E 09 63 | Rotate left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BMI $24			  ; 30 24 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($2C,X)		  ; 01 2C | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	BVS $A0			  ; 70 A0 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	BVC $48			  ; 50 48 | Branch if overflow clear
	BMI $50			  ; 30 50 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_187
; Address: $FAD9AB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_187:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_189
; Address: $FAD9BB
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_189:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BVS $F5			  ; 70 F5 | Branch if overflow set
	ROL $79			  ; 26 79 | Rotate left (zero page)
	LSR $0008			; 4E 08 00 | Logical shift right (absolute)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_18A
; Address: $FAD9F8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_18A:
	JSR $02FF			; 20 FF 02 | Jump to subroutine
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA $7F			  ; 05 7F | Logical OR with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPX $FC90			; EC 90 FC | Compare X register (absolute)
	BRA $C6			  ; 80 C6 | Branch always
	SEC				  ; 38 | Set carry flag
	LDX $58			  ; A6 58 | Load from zero page into X register
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	LDX $7C			  ; A6 7C | Load from zero page into X register
	BVC $22			  ; 50 22 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank74_DmaFunction_18B
; Address: $FADA12
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_18B:
	ROR				  ; 6A | Rotate right (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	LDY $F8			  ; A4 F8 | Load from zero page into Y register
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	CPY $F8			  ; C4 F8 | Compare Y register (zero page)
	BRA $F8			  ; 80 F8 | Branch always
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	SBC $FD2A			; ED 2A FD | Subtract with carry (absolute)
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	EOR $B5DA			; 4D DA B5 | Exclusive OR with accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	XBA				  ; EB | Exchange accumulator bytes
	JMP $6000			; 4C 00 60 | Jump to address
	BMI $01			  ; 30 01 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	ORA ($94,X)		  ; 01 94 | Logical OR with accumulator ((zero page,X))
	BPL $52			  ; 10 52 | Branch if positive
	BPL $C3			  ; 10 C3 | Branch if positive
	LDX $0C41,Y		  ; BE 41 0C | Load from absolute,Y into X register
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ADC ($8E),Y		  ; 71 8E | Add with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	BCS $3F			  ; B0 3F | Branch if carry set
	STA $003E0F		  ; 8F 0F 3E 00 | Store accumulator to absolute long address
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BEQ $F8			  ; F0 F8 | Branch if equal
	SBC $FF71,Y		  ; F9 71 FF | Subtract with carry (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_18C
; Address: $FADAA0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_18C:
	JSR $211F			; 20 1F 21 | PPU graphics register access
	ASL $3E41,X		  ; 1E 41 3E | Arithmetic shift left (absolute,X)
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	BNE $AF			  ; D0 AF | Branch if not equal
	BCC $6F			  ; 90 6F | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_18E
; Address: $FADABA
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_18E:
	BRA $03			  ; 80 03 | Branch always
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	ORA ($CE,X)		  ; 01 CE | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $F7			  ; F0 F7 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	DEX				  ; CA | Decrement X register
	CPY #$F7			 ; C0 F7 | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	BPL $01			  ; 10 01 | Branch if positive
	ASL $0719			; 0E 19 07 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	BMI $C0			  ; 30 C0 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BVS $88			  ; 70 88 | Branch if overflow set
	PHA				  ; 48 | Push accumulator to stack
	CLD				  ; D8 | Clear decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	CLI				  ; 58 | Clear interrupt disable flag
	BCS $F8			  ; B0 F8 | Branch if carry set
	BRA $B0			  ; 80 B0 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	BVS $A0			  ; 70 A0 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	BCS $00			  ; B0 00 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STY $80			  ; 84 80 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank74_DmaFunction_18F
; Address: $FADB4E
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_18F:
	STA $120C8C		  ; 8F 8C 0C 12 | Store accumulator to absolute long address
	CLC				  ; 18 | Clear carry flag
	BIT $38			  ; 24 38 | Test bits in accumulator (zero page)
	LSR $72			  ; 46 72 | Logical shift right (zero page)
	STA $BB76,X		  ; 9D 76 BB | Store accumulator to absolute,X
	INC $C277,X		  ; FE 77 C2 | Increment (absolute,X)
	BCS $40			  ; B0 40 | Branch if carry set
	ROR $7D4D,X		  ; 7E 4D 7D | Rotate right (absolute,X)
	LDX $AEFA			; AE FA AE | Load from absolute address into X register
	BPL $10			  ; 10 10 | Branch if positive
	INC $FE2C,X		  ; FE 2C FE | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	ADC $FF6D,X		  ; 7D 6D FF | Add with carry (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	DEC $BEE4,X		  ; DE E4 BE | Decrement (absolute,X)
	CPY $E6			  ; C4 E6 | Compare Y register (zero page)
	STZ $E09E			; 9C 9E E0 | Game work RAM access
	INC $BE80,X		  ; FE 80 BE | Increment (absolute,X)
	CPY #$CE			 ; C0 CE | Compare Y register (immediate)
	BCS $7C			  ; B0 7C | Branch if carry set
	BRA $18			  ; 80 18 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_190
; Address: $FADB95
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_190:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $4C			  ; F0 4C | Branch if equal
	BEQ $38			  ; F0 38 | Branch if equal

;------------------------------------------------------------------------------
; Bank74_DmaFunction_191
; Address: $FADB9F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_191:
	JSR $040B			; 20 0B 04 | Jump to subroutine
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	EOR $82			  ; 45 82 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_192
; Address: $FADBC2
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_192:
	JSL $00C0C0		  ; 22 C0 C0 00 | Jump to subroutine long
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $1601,X		  ; 1E 01 16 | Arithmetic shift left (absolute,X)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CMP $D825			; CD 25 D8 | Compare accumulator (absolute)
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	ASL $1FF0			; 0E F0 1F | Arithmetic shift left (absolute)
	CPX #$C9			 ; E0 C9 | Compare X register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	ASL $C200,X		  ; 1E 00 C2 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_194
; Address: $FADC30
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_194:
	JSR $03FF			; 20 FF 03 | Jump to subroutine
	ROL $6309			; 2E 09 63 | Rotate left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	BMI $24			  ; 30 24 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($2C,X)		  ; 01 2C | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLV				  ; B8 | Clear overflow flag
	BVC $48			  ; 50 48 | Branch if overflow clear
	BMI $50			  ; 30 50 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_197
; Address: $FADC75
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_197:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($4B,X)		  ; 01 4B | Logical OR with accumulator ((zero page,X))
	STX $11			  ; 86 11 | Store X register to zero page
	JMP $B75FB7		  ; 5C B7 5F B7 | Jump to address long
	SBC $4F4D,X		  ; FD 4D 4F | Subtract with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	CLI				  ; 58 | Clear interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF 23 7F D3 | Load from absolute long,X into accumulator
	LDA				  ; BF 64 5F FB | Load from absolute long,X into accumulator
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	STA $F37C,Y		  ; 99 7C F3 | Store accumulator to absolute,Y
	RTI				  ; 40 | Return from interrupt
	BPL $30			  ; 10 30 | Branch if positive
	BMI $80			  ; 30 80 | Branch if negative
	LSR $1F			  ; 46 1F | Logical shift right (zero page)
	STY $D2FF			; 8C FF D2 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF AD D2 CD | Load from absolute long,X into accumulator
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	JMP $A362BF		  ; 5C BF 62 A3 | Jump to address long
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	LDA				  ; BF 00 40 00 | Load from absolute long,X into accumulator
	AND $8D1E			; 2D 1E 8D | Logical AND with accumulator (absolute)
	CMP ($9F,X)		  ; C1 9F | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 40 A3 80 | Store accumulator to absolute long,X
	CMP ($7C,X)		  ; C1 7C | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDY $FCA0,X		  ; BC A0 FC | Load from absolute,X into Y register
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	BVC $5E			  ; 50 5E | Branch if overflow clear
	PEA #$B07F		   ; F4 7F B0 | Push effective address to stack
	ROR $38A6,X		  ; 7E A6 38 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_198
; Address: $FADCEF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_198:
	CPY #$98			 ; C0 98 | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	BRA $40			  ; 80 40 | Branch always
	CPY #$51			 ; C0 51 | Compare Y register (immediate)
	CPY #$37			 ; C0 37 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ADC ($11),Y		  ; 71 11 | Add with carry ((zero page),Y)
	ROL $7F36,X		  ; 3E 36 7F | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_19A
; Address: $FADD1E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_19A:
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	JMP ($0060)		  ; 6C 60 00 | Jump to address (absolute indirect)
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BNE $E0			  ; D0 E0 | Game work RAM access
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_19B
; Address: $FADD7D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_19B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $0F			  ; 10 0F | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	SBC $CE12,X		  ; FD 12 CE | Subtract with carry (absolute,X)
	SBC ($B3),Y		  ; F1 B3 | Subtract with carry ((zero page),Y)
	CPX $D0DC			; EC DC D0 | Compare X register (absolute)
	BCS $A0			  ; B0 A0 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_19C
; Address: $FADDAC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_19C:
	RTI				  ; 40 | Return from interrupt
	CPY #$81			 ; C0 81 | Compare Y register (immediate)
	BRA $0D			  ; 80 0D | Branch always
	ROL $50FF			; 2E FF 50 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_19D
; Address: $FADDB6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_19D:
	JSR $40FC			; 20 FC 40 | Jump to subroutine
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_19E
; Address: $FADDBD
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_19E:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $41			  ; 80 41 | Branch always
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	STA ($03,X)		  ; 81 03 | Store accumulator to (zero page,X)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ROL $EC06,X		  ; 3E 06 EC | Rotate left (absolute,X)
	INC $00DE			; EE DE 00 | Increment (absolute)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	LDY #$71			 ; A0 71 | Load immediate value into Y register
	BIT #$BB			 ; 89 BB | Test bits in accumulator (immediate)
	EOR ($51,X)		  ; 41 51 | Exclusive OR with accumulator ((zero page,X))
	LDA ($F9,X)		  ; A1 F9 | Load from (zero page,X) into accumulator
	ORA ($FA),Y		  ; 11 FA | Logical OR with accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	ADC $090D,X		  ; 7D 0D 09 | Add with carry (absolute,X)
	CPY #$76			 ; C0 76 | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$5F			 ; C0 5F | Compare Y register (immediate)
	REP #$EF			 ; C2 EF | Reset processor status bits
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ADC #$20			 ; 69 20 | Add with carry (immediate)
	EOR #$46			 ; 49 46 | Exclusive OR with accumulator (immediate)
	AND $7F00,Y		  ; 39 00 7F | Logical AND with accumulator (absolute,Y)
	ASL $317F			; 0E 7F 31 | Arithmetic shift left (absolute)
	ADC ($40),Y		  ; 71 40 | Add with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	LSR $3F			  ; 46 3F | Logical shift right (zero page)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	BMI $20			  ; 30 20 | Branch if negative
	CLD				  ; D8 | Clear decimal mode flag
	BNE $F8			  ; D0 F8 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_19F
; Address: $FADE26
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_19F:
	CPX $AC28			; EC 28 AC | Compare X register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	BNE $9C			  ; D0 9C | Branch if not equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1A0
; Address: $FADE32
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1A0:
	JSR $9000			; 20 00 90 | Jump to subroutine
	BNE $C0			  ; D0 C0 | Branch if not equal
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1A2
; Address: $FADE3F
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1A2:
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $EC			  ; 10 EC | Branch if positive
	INX				  ; E8 | Increment X register
	BCS $76			  ; B0 76 | Branch if carry set
	INC $CCBE			; EE BE CC | Increment (absolute)
	CPY $00E0			; CC E0 00 | Compare Y register (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	CPY #$68			 ; C0 68 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $32			  ; F0 32 | Branch if equal
	BEQ $32			  ; F0 32 | Branch if equal
	BEQ $03			  ; F0 03 | Branch if equal
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP $DEEF,X		  ; DD EF DE | Compare accumulator (absolute,X)
	LDX $8FF7			; AE F7 8F | Load from absolute address into X register
	LDX $F747,Y		  ; BE 47 F7 | Load from absolute,Y into X register
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	ASL $301F,X		  ; 1E 1F 30 | Arithmetic shift left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	BVC $00			  ; 50 00 | Branch if overflow clear
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	ASL $D8F2,X		  ; 1E F2 D8 | Arithmetic shift left (absolute,X)
	SBC #$F1			 ; E9 F1 | Subtract with carry (immediate)
	ADC #$59			 ; 69 59 | Add with carry (immediate)
	SBC $BC95			; ED 95 BC | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	BIT $1C			  ; 24 1C | Test bits in accumulator (zero page)
	INC $01E1			; EE E1 01 | Increment (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1A4
; Address: $FADEDA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1A4:
	LDA $03C103		  ; AF 03 C1 03 | Load from absolute long address into accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STX $9EF8			; 8E F8 9E | Store X register to absolute address
	CPX #$34			 ; E0 34 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	ASL $34F0,X		  ; 1E F0 34 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1A5
; Address: $FADEF6
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1A5:
	SEC				  ; 38 | Set carry flag
	ASL $1300			; 0E 00 13 | Arithmetic shift left (absolute)
	ORA $0609			; 0D 09 06 | Logical OR with accumulator (absolute)
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	BPL $0E			  ; 10 0E | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $0308			; 0E 08 03 | Arithmetic shift left (absolute)
	ORA $410C			; 0D 0C 41 | Logical OR with accumulator (absolute)
	ROL $FE81,X		  ; 3E 81 FE | Rotate left (absolute,X)
	STY $E270			; 8C 70 E2 | Store Y register to absolute address
	ROR				  ; 6A | Rotate right (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1A6
; Address: $FADF2E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1A6:
	SBC $82			  ; E5 82 | Subtract with carry (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1A7
; Address: $FADF3C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1A7:
	STX $00			  ; 86 00 | Store X register to zero page
	AND $97D1			; 2D D1 97 | Logical AND with accumulator (absolute)
	JMP ($1E77)		  ; 6C 77 1E | Jump to address (absolute indirect)
	ROR $7119,X		  ; 7E 19 71 | Rotate right (absolute,X)
	ORA $6852			; 0D 52 68 | Logical OR with accumulator (absolute)
	ROR $0C5E			; 6E 5E 0C | Rotate right (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1A9
; Address: $FADF5E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1A9:
	AND ($70,X)		  ; 21 70 | Logical AND with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $011E,X		  ; 1E 1E 01 | Arithmetic shift left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $1F0D			; 0D 0D 1F | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1F07,X		  ; 1E 07 1F | Arithmetic shift left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1AA
; Address: $FADF88
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1AA:
	BEQ $80			  ; F0 80 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	STY $EE00			; 8C 00 EE | Store Y register to absolute address
	INX				  ; E8 | Increment X register
	BRA $80			  ; 80 80 | Branch always
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	SEC				  ; 38 | Set carry flag
	PHA				  ; 48 | Push accumulator to stack
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA $0112			; 0D 12 01 | Logical OR with accumulator (absolute)
	ASL $1F18,X		  ; 1E 18 1F | Arithmetic shift left (absolute,X)
	ORA $011F			; 0D 1F 01 | Logical OR with accumulator (absolute)
	BRA $40			  ; 80 40 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	BNE $D8			  ; D0 D8 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	CPX $68			  ; E4 68 | Compare X register (zero page)
	LDY $10F6			; AC F6 10 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1AB
; Address: $FADFD0
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1AB:
	JSR $D838			; 20 38 D8 | Jump to subroutine
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	CPX $48E0			; EC E0 48 | Compare X register (absolute)
	CPX #$09			 ; E0 09 | Compare X register (immediate)
	ASL $0704			; 0E 04 07 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	JMP ($ECA0)		  ; 6C A0 EC | Jump to address (absolute indirect)
	PLP				  ; 28 | Pull processor status from stack
	BMI $36			  ; 30 36 | Branch if negative
	BNE $76			  ; D0 76 | Branch if not equal
	LDY #$8C			 ; A0 8C | Load immediate value into Y register
	STX $B4			  ; 86 B4 | Store X register to zero page
	DEC $5A			  ; C6 5A | Decrement (zero page)
	INY				  ; C8 | Increment Y register
	SEP #$2C			 ; E2 2C | Set processor status bits
	CPX #$68			 ; E0 68 | Compare X register (immediate)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	AND $131D			; 2D 1D 13 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1AC
; Address: $FAE065
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1AC:
	ASL $0E0B			; 0E 0B 0E | Arithmetic shift left (absolute)
	ORA $060B			; 0D 0B 06 | Logical OR with accumulator (absolute)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	BPL $31			  ; 10 31 | Branch if positive
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	NOP				  ; EA | No operation
	INY				  ; C8 | Increment Y register
	LDA				  ; BF C6 4F 74 | Load from absolute long,X into accumulator
	ROR $BC41,X		  ; 7E 41 BC | Rotate right (absolute,X)
	REP #$68			 ; C2 68 | Reset processor status bits
	CPX #$C6			 ; E0 C6 | Compare X register (immediate)
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	BEQ $36			  ; F0 36 | Branch if equal
	BEQ $38			  ; F0 38 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $3C78,X		  ; 3E 78 3C | Rotate left (absolute,X)
	BEQ $01			  ; F0 01 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY $C83B			; CC 3B C8 | Compare Y register (absolute)
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHB				  ; 8B | Push data bank register to stack
	BEQ $BF			  ; F0 BF | Branch if equal
	DEC $A6			  ; C6 A6 | Decrement (zero page)
	CMP $F08C,X		  ; DD 8C F0 | Compare accumulator (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	CPY #$32			 ; C0 32 | Compare Y register (immediate)
	BEQ $36			  ; F0 36 | Branch if equal
	BEQ $24			  ; F0 24 | Branch if equal
	BEQ $0E			  ; F0 0E | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1AD
; Address: $FAE0FA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1AD:
	JSL $F80CF8		  ; 22 F8 0C F8 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	BEQ $01			  ; F0 01 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1AE
; Address: $FAE10D
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1AE:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LSR $3AAC,X		  ; 5E AC 3A | Logical shift right (absolute,X)
	INY				  ; C8 | Increment Y register
	ROR $94			  ; 66 94 | Rotate right (zero page)
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	CPY $9A6C			; CC 6C 9A | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	BEQ $30			  ; F0 30 | Branch if equal
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	BEQ $34			  ; F0 34 | Branch if equal
	BEQ $68			  ; F0 68 | Branch if equal
	BEQ $1C			  ; F0 1C | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	BEQ $64			  ; F0 64 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1B2
; Address: $FAE176
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1B2:
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BCC $E8			  ; 90 E8 | Branch if carry clear
	BCS $D8			  ; B0 D8 | Branch if carry set
	BEQ $FE			  ; F0 FE | Branch if equal
	STX $00CB			; 8E CB 00 | Store X register to absolute address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1B3
; Address: $FAE19C
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1B3:
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $321C			; 0E 1C 32 | Arithmetic shift left (absolute)
	AND $0101,X		  ; 3D 01 01 | Logical AND with accumulator (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BMI $70			  ; 30 70 | Branch if negative
	SEC				  ; 38 | Set carry flag
	JMP $BCC8			; 4C C8 BC | Jump to address
	BRA $80			  ; 80 80 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $30			  ; 80 30 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1B4
; Address: $FAE22F
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1B4:
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $1800			; 0D 00 18 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BMI $60			  ; 30 60 | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	BPL $38			  ; 10 38 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	CPX $80A0			; EC A0 80 | Compare X register (absolute)
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always
	BVC $80			  ; 50 80 | Branch if overflow clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCS $00			  ; B0 00 | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $1D			  ; 05 1D | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $0800			; 0D 00 08 | Logical OR with accumulator (absolute)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1B5
; Address: $FAE284
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1B5:
	JSR $5000			; 20 00 50 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	LDY #$B8			 ; A0 B8 | Load immediate value into Y register
	CPY #$AC			 ; C0 AC | Compare Y register (immediate)
	BNE $80			  ; D0 80 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BCS $00			  ; B0 00 | Branch if carry set
	BPL $80			  ; 10 80 | Branch if positive
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	PHA				  ; 48 | Push accumulator to stack
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $0F03			; 0E 03 0F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1B6
; Address: $FAE2A9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1B6:
	ORA $65			  ; 05 65 | Logical OR with accumulator (zero page)
	ORA $038F,X		  ; 1D 8F 03 | Logical OR with accumulator (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	JMP $020305		  ; 5C 05 03 02 | Jump to address long
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1B7
; Address: $FAE2BE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1B7:
	JSL $203800		  ; 22 00 38 20 | Jump to subroutine long
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPX $F6B0			; EC B0 F6 | Compare X register (absolute)
	JMP ($FC0E)		  ; 6C 0E FC | Jump to address (absolute indirect)
	NOP				  ; EA | No operation
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1B8
; Address: $FAE2CF
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1B8:
	JSR $8654			; 20 54 86 | Jump to subroutine
	BRA $07			  ; 80 07 | Branch always
	ADC ($61),Y		  ; 71 61 | Add with carry ((zero page),Y)
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHX				  ; DA | Push X register to stack
	LSR $323C,X		  ; 5E 3C 32 | Logical shift right (absolute,X)
	AND $1711			; 2D 11 17 | Logical AND with accumulator (absolute)
	ASL $197E,X		  ; 1E 7E 19 | Arithmetic shift left (absolute,X)
	ADC ($0D),Y		  ; 71 0D | Add with carry ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $0C5E			; 6E 5E 0C | Rotate right (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1BA
; Address: $FAE2FE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1BA:
	AND ($70,X)		  ; 21 70 | Logical AND with accumulator ((zero page,X))
	JMP $B448			; 4C 48 B4 | Jump to address
	DEY				  ; 88 | Decrement Y register
	INX				  ; E8 | Increment X register
	BMI $EC			  ; 30 EC | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	ROR $8E98,X		  ; 7E 98 8E | Rotate right (absolute,X)
	BCS $4A			  ; B0 4A | Branch if carry set
	PLY				  ; 7A | Pull Y register from stack
	BMI $80			  ; 30 80 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1BC
; Address: $FAE31A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1BC:
	JMP $A800			; 4C 00 A8 | Jump to address
	ASL $84			  ; 06 84 | Arithmetic shift left (zero page)
	ASL $1232			; 0E 32 12 | Arithmetic shift left (absolute)
	BIT $1710			; 2C 10 17 | Test bits in accumulator (absolute)
	ASL $1176,X		  ; 1E 76 11 | Arithmetic shift left (absolute,X)
	ROR $5C60			; 6E 60 5C | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1BD
; Address: $FAE330
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1BD:
	ORA $0201			; 0D 01 02 | Logical OR with accumulator (absolute)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	ORA ($60),Y		  ; 11 60 | Logical OR with accumulator ((zero page),Y)
	BVS $4C			  ; 70 4C | Branch if overflow set
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	BMI $EC			  ; 30 EC | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	ROR $FE88			; 6E 88 FE | Rotate right (absolute)
	CPX #$CA			 ; E0 CA | Compare X register (immediate)
	ASL $3A			  ; 06 3A | Arithmetic shift left (zero page)
	BCS $80			  ; B0 80 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	BRA $A0			  ; 80 A0 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1BE
; Address: $FAE355
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1BE:
	JSR $6060			; 20 60 60 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	ASL $C4			  ; 06 C4 | Arithmetic shift left (zero page)
	ASL $0C37			; 0E 37 0C | Arithmetic shift left (absolute)
	ASL $1D71,X		  ; 1E 71 1D | Arithmetic shift left (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	TAX				  ; AA | Transfer accumulator to X register
	PHX				  ; DA | Push X register to stack
	STA $83FD			; 8D FD 83 | Store accumulator to absolute address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1C0
; Address: $FAE374
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1C0:
	JSL $003D00		  ; 22 00 3D 00 | Jump to subroutine long
	AND $F0			  ; 25 F0 | Logical AND with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1C1
; Address: $FAE37B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1C1:
	SBC ($72,X)		  ; E1 72 | Subtract with carry ((zero page,X))
	CPX $EE30			; EC 30 EE | Compare X register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STX $5EB8			; 8E B8 5E | Store X register to absolute address
	LDA ($BF),Y		  ; B1 BF | Load from (zero page),Y into accumulator
	CMP ($AA,X)		  ; C1 AA | Compare accumulator ((zero page,X))
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	STZ $60			  ; 64 60 | Store zero to zero page
	LDY $A400,X		  ; BC 00 A4 | Load from absolute,X into Y register
	ASL $87			  ; 06 87 | Arithmetic shift left (zero page)
	LSR $48CF			; 4E CF 48 | Logical shift right (absolute)
	DEC $132D,X		  ; DE 2D 13 | Decrement (absolute,X)
	ADC $3B			  ; 65 3B | Add with carry (zero page)
	STA				  ; 9F FF 8F BF | Store accumulator to absolute long,X
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1C2
; Address: $FAE3B6
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1C2:
	JSR $683F			; 20 3F 68 | Jump to subroutine
	BVS $FF			  ; 70 FF | Branch if overflow set
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $7F			  ; 10 7F | Branch if positive
	INY				  ; C8 | Increment Y register
	LDX $DC			  ; A6 DC | Load from zero page into X register
	INC $F8			  ; E6 F8 | Increment (zero page)
	SED				  ; F8 | Set decimal mode flag
	SBC $F1FF,Y		  ; F9 FF F1 | Subtract with carry (absolute,Y)
	SBC $FAF3,X		  ; FD F3 FA | Subtract with carry (absolute,X)
	BVC $C0			  ; 50 C0 | Branch if overflow clear
	BVC $D0			  ; 50 D0 | Branch if overflow clear
	PEA #$FC04		   ; F4 04 FC | Push effective address to stack
	ASL $0CFF			; 0E FF 0C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	INC $0F37,X		  ; FE 37 0F | Increment (absolute,X)
	STA $BF8FFF		  ; 8F FF 8F BF | Store accumulator to absolute long address
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1C3
; Address: $FAE3F4
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1C3:
	JSR $287F			; 20 7F 28 | Jump to subroutine
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $7F			  ; 10 7F | Branch if positive
	CPX $E4F0			; EC F0 E4 | Compare X register (absolute)
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	INC $FA			  ; E6 FA | Increment (zero page)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FD),Y		  ; F1 FD | Subtract with carry ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $04			  ; F0 04 | Branch if equal
	INC $FE14,X		  ; FE 14 FE | Increment (absolute,X)
	ASL $0EFF			; 0E FF 0E | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	INC $0719,X		  ; FE 19 07 | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $100F,X		  ; 1D 0F 10 | Logical OR with accumulator (absolute,X)
	ORA $0E02,X		  ; 1D 02 0E | Logical OR with accumulator (absolute,X)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $0E03,X		  ; 1D 03 0E | Logical OR with accumulator (absolute,X)
	ORA ($98,X)		  ; 01 98 | Logical OR with accumulator ((zero page,X))
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	BVC $B8			  ; 50 B8 | Branch if overflow clear
	BEQ $08			  ; F0 08 | Branch if equal
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1C4
; Address: $FAE449
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1C4:
	RTI				  ; 40 | Return from interrupt
	BVS $80			  ; 70 80 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BPL $E0			  ; 10 E0 | Game work RAM access
	BMI $E0			  ; 30 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$B8			 ; E0 B8 | Compare X register (immediate)
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BRA $FD			  ; 80 FD | Branch always
	ORA #$1E			 ; 09 1E | Logical OR with accumulator (immediate)
	ROL $0302,X		  ; 3E 02 03 | Rotate left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BVS $CE			  ; 70 CE | Branch if overflow set
	INX				  ; E8 | Increment X register
	CPY $F4			  ; C4 F4 | Compare Y register (zero page)
	STY $9868			; 8C 68 98 | Store Y register to absolute address
	BCS $70			  ; B0 70 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $B0			  ; 80 B0 | Branch always
	INC $FE28,X		  ; FE 28 FE | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	BVS $FC			  ; 70 FC | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1C5
; Address: $FAE499
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1C5:
	SED				  ; F8 | Set decimal mode flag
	BRA $F0			  ; 80 F0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $FC			  ; 80 FC | Branch always
	CLV				  ; B8 | Clear overflow flag
	INY				  ; C8 | Increment Y register
	BNE $70			  ; D0 70 | Branch if not equal
	BNE $70			  ; D0 70 | Branch if not equal
	BCS $D0			  ; B0 D0 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1C7
; Address: $FAE4AD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1C7:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	STY $C840			; 8C 40 C8 | Store Y register to absolute address
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$32			 ; C0 32 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1C8
; Address: $FAE4C1
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1C8:
	PLP				  ; 28 | Pull processor status from stack
	ROL $172E,X		  ; 3E 2E 17 | Rotate left (absolute,X)
	ASL $1B15,X		  ; 1E 15 1B | Arithmetic shift left (absolute,X)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0407			; 0D 07 04 | Logical OR with accumulator (absolute)
	BMI $11			  ; 30 11 | Branch if negative
	BMI $01			  ; 30 01 | Branch if negative
	BPL $02			  ; 10 02 | Branch if positive
	JMP $7C14			; 4C 14 7C | Jump to address
	INX				  ; E8 | Increment X register
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	CLD				  ; D8 | Clear decimal mode flag
	BCC $F0			  ; 90 F0 | Branch if carry clear
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	BRA $08			  ; 80 08 | Branch always
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$27			 ; C0 27 | Compare Y register (immediate)
	ROL $1E17,X		  ; 3E 17 1E | Rotate left (absolute,X)
	ASL $1E15,X		  ; 1E 15 1E | Arithmetic shift left (absolute,X)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	CPX $7C			  ; E4 7C | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	SEI				  ; 78 | Set interrupt disable flag
	INX				  ; E8 | Increment X register
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	SEI				  ; 78 | Set interrupt disable flag
	BCC $F0			  ; 90 F0 | Branch if carry clear
	BMI $D0			  ; 30 D0 | Branch if negative
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1C9
; Address: $FAE53D
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1C9:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$2F			 ; C0 2F | Compare Y register (immediate)
	ORA $0D16,Y		  ; 19 16 0D | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	PEA #$D86C		   ; F4 6C D8 | Push effective address to stack
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	PLA				  ; 68 | Pull accumulator from stack
	BCS $D0			  ; B0 D0 | Branch if carry set
	BMI $D0			  ; 30 D0 | Branch if negative
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BPL $FC			  ; 10 FC | Branch if positive
	BMI $F8			  ; 30 F8 | Branch if negative
	BPL $F8			  ; 10 F8 | Branch if positive
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1CA
; Address: $FAE579
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1CA:
	BEQ $A0			  ; F0 A0 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$2B			 ; C0 2B | Compare Y register (immediate)
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ASL $001F			; 0E 1F 00 | Arithmetic shift left (absolute)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1CB
; Address: $FAE63F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1CB:
	ORA $80			  ; 05 80 | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1CC
; Address: $FAE646
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1CC:
	JSR $4020			; 20 20 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive
	BMI $80			  ; 30 80 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	CPX #$B8			 ; E0 B8 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	CPX $00C0			; EC C0 00 | Compare X register (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $180E			; 0E 0E 18 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA ($11),Y		  ; 11 11 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1CD
; Address: $FAE66A
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1CD:
	JSL $202122		  ; 22 22 21 20 | Jump to subroutine long
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $1C11			; 0E 11 1C | Arithmetic shift left (absolute)
	ORA $3F2E,X		  ; 1D 2E 3F | Logical OR with accumulator (absolute,X)
	EOR $5E30,X		  ; 5D 30 5E | Exclusive OR with accumulator (absolute,X)
	BIT $0050			; 2C 50 00 | Test bits in accumulator (absolute)
	BRA $80			  ; 80 80 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $D0			  ; 80 D0 | Branch always
	BCC $F8			  ; 90 F8 | Branch if carry clear
	BCS $F8			  ; B0 F8 | Branch if carry set
	BMI $38			  ; 30 38 | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $3901,X		  ; 1D 01 39 | Logical OR with accumulator (absolute,X)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1CF
; Address: $FAE6CC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1CF:
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BRA $40			  ; 80 40 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $E0			  ; 80 E0 | Game work RAM access
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	BEQ $F8			  ; F0 F8 | Branch if equal
	BRA $F0			  ; 80 F0 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1D0
; Address: $FAE6DF
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1D0:
	BRA $01			  ; 80 01 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	ORA #$2D			 ; 09 2D | Logical OR with accumulator (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	BPL $7C			  ; 10 7C | Branch if positive
	BMI $80			  ; 30 80 | Branch if negative
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $A0			  ; F0 A0 | Branch if equal
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BRA $32			  ; 80 32 | Branch always
	AND $3D17,X		  ; 3D 17 3D | Logical AND with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	ROL $43			  ; 26 43 | Rotate left (zero page)
	STA ($25,X)		  ; 81 25 | Store accumulator to (zero page,X)
	LSR $000D,X		  ; 5E 0D 00 | Logical shift right (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1D1
; Address: $FAE73F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1D1:
	PHY				  ; 5A | Push Y register to stack
	SED				  ; F8 | Set decimal mode flag
	STY $4EFC			; 8C FC 4E | Store Y register to absolute address
	CPY $96FE			; CC FE 96 | Compare Y register (absolute)
	ROL $FB31			; 2E 31 FB | Rotate left (absolute)
	STA $FB			  ; 85 FB | Store accumulator to zero page
	AND $F3			  ; 25 F3 | Logical AND with accumulator (zero page)
	EOR $0000			; 4D 00 00 | Exclusive OR with accumulator (absolute)
	BVC $40			  ; 50 40 | Branch if overflow clear
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	DEC $5A0C			; CE 0C 5A | Decrement (absolute)
	PHX				  ; DA | Push X register to stack
	BRA $80			  ; 80 80 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1D2
; Address: $FAE768
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1D2:
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	LDY #$80			 ; A0 80 | Load immediate value into Y register
	CPY #$19			 ; C0 19 | Compare Y register (immediate)
	ASL $2E0B,X		  ; 1E 0B 2E | Arithmetic shift left (absolute,X)
	ORA $237D,X		  ; 1D 7D 23 | Logical OR with accumulator (absolute,X)
	BVC $68			  ; 50 68 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1D3
; Address: $FAE78E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1D3:
	JSR $0634			; 20 34 06 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BIT $60			  ; 24 60 | Test bits in accumulator (zero page)
	BVS $0B			  ; 70 0B | Branch if overflow set

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1D4
; Address: $FAE79F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1D4:
	JSR $447A			; 20 7A 44 | Jump to subroutine
	LDX #$E4			 ; A2 E4 | Load immediate value into X register
	ROR $3BCE,X		  ; 7E CE 3B | Rotate right (absolute,X)
	STA $53AD,Y		  ; 99 AD 53 | Store accumulator to absolute,Y
	EOR $3A77,Y		  ; 59 77 3A | Exclusive OR with accumulator (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BIT $6020			; 2C 20 60 | Test bits in accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1D5
; Address: $FAE7B6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1D5:
	STY $00			  ; 84 00 | Store Y register to zero page
	ROR $07			  ; 66 07 | Rotate right (zero page)
	LDY $880F			; AC 0F 88 | Load from absolute address into Y register
	PLA				  ; 68 | Pull accumulator from stack
	ASL $3171,X		  ; 1E 71 31 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1D6
; Address: $FAE7C2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1D6:
	AND $7E00,Y		  ; 39 00 7E | Logical AND with accumulator (absolute,Y)
	ROR $7D3D			; 6E 3D 7D | Rotate right (absolute)
	LSR $307A,X		  ; 5E 7A 30 | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	ORA $0602			; 0D 02 06 | Logical OR with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BPL $40			  ; 10 40 | Branch if positive
	BIT $0560			; 2C 60 05 | Test bits in accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1D7
; Address: $FAE7DF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1D7:
	BMI $0A			  ; 30 0A | Branch if negative
	WDM #$FC			 ; 42 FC | Reserved instruction
	LDX $EF			  ; A6 EF | Load from zero page into X register
	ADC ($DF),Y		  ; 71 DF | Add with carry ((zero page),Y)
	AND #$95			 ; 29 95 | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	JMP $807074		  ; 5C 74 70 80 | Jump to address long
	STY $00			  ; 84 00 | Store Y register to zero page
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1D8
; Address: $FAE7F5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1D8:
	JSR $636E			; 20 6E 63 | Jump to subroutine
	STZ $07			  ; 64 07 | Store zero to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $1C88			; 0E 88 1C | Arithmetic shift left (absolute)
	ADC $3F2F,X		  ; 7D 2F 3F | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1D9
; Address: $FAE80B
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1D9:
	JSR $111E			; 20 1E 11 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	BPL $3F			  ; 10 3F | Branch if positive
	INC				  ; 1A | Increment accumulator
	ASL $001F			; 0E 1F 00 | Arithmetic shift left (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	DEC $BC44			; CE 44 BC | Decrement (absolute)
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	INC $FE30,X		  ; FE 30 FE | Increment (absolute,X)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BRA $F8			  ; 80 F8 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SBC $CE12,X		  ; FD 12 CE | Subtract with carry (absolute,X)
	SBC ($B3),Y		  ; F1 B3 | Subtract with carry ((zero page),Y)
	CPX $D0DC			; EC DC D0 | Compare X register (absolute)
	BCS $A0			  ; B0 A0 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1DC
; Address: $FAE856
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1DC:
	JSR $40FC			; 20 FC 40 | Jump to subroutine
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $2B			  ; 80 2B | Branch always
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1DD
; Address: $FAE871
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1DD:
	JSR $0008			; 20 08 00 | Jump to subroutine
	JMP ($A8D8)		  ; 6C D8 A8 | Jump to address (absolute indirect)
	PLA				  ; 68 | Pull accumulator from stack
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $D0			  ; F0 D0 | Branch if equal
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BCC $3C			  ; 90 3C | Branch if carry clear
	BVC $38			  ; 50 38 | Branch if overflow clear
	LDY #$F8			 ; A0 F8 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1DE
; Address: $FAE896
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1DE:
	JSR $C0F0			; 20 F0 C0 | Jump to subroutine
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $20			  ; 80 20 | Branch always
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1DF
; Address: $FAE8B1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1DF:
	JSR $1004			; 20 04 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $04			  ; 10 04 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	BNE $B0			  ; D0 B0 | Branch if not equal
	BVS $D0			  ; 70 D0 | Branch if overflow set
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1E0
; Address: $FAE8D1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1E0:
	CLC				  ; 18 | Clear carry flag
	BRA $38			  ; 80 38 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $A0			  ; 30 A0 | Branch if negative
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $80			  ; F0 80 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1E1
; Address: $FAE8EB
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1E1:
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ASL $0F00			; 0E 00 0F | Arithmetic shift left (absolute)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	BCC $80			  ; 90 80 | Branch if carry clear
	BNE $80			  ; D0 80 | Branch if not equal
	BRA $80			  ; 80 80 | Branch always
	BCC $80			  ; 90 80 | Branch if carry clear
	BVC $10			  ; 50 10 | Branch if overflow clear
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1E2
; Address: $FAE91D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1E2:
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	AND $06			  ; 25 06 | Logical AND with accumulator (zero page)
	ADC $7D72,Y		  ; 79 72 7D | Add with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0605			; 0D 05 06 | Logical OR with accumulator (absolute)
	JMP $7E5A78		  ; 5C 78 5A 7E | Jump to address long
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $60			  ; F0 60 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1E4
; Address: $FAE94C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1E4:
	SEI				  ; 78 | Set interrupt disable flag
	BCS $78			  ; B0 78 | Branch if carry set
	BCS $80			  ; B0 80 | Branch if carry set
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1E5
; Address: $FAE954
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1E5:
	JSR $8000			; 20 00 80 | Jump to subroutine
	BRA $90			  ; 80 90 | Branch always
	BRA $90			  ; 80 90 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$D8			 ; C0 D8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1E6
; Address: $FAE963
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1E6:
	JSR $C038			; 20 38 C0 | Jump to subroutine
	CPY #$0C			 ; C0 0C | Compare Y register (immediate)
	BEQ $1C			  ; F0 1C | Branch if equal
	CPX #$3C			 ; E0 3C | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1E8
; Address: $FAE970
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1E8:
	JSR $D0C0			; 20 C0 D0 | Jump to subroutine
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	BEQ $08			  ; F0 08 | Branch if equal
	BEQ $18			  ; F0 18 | Branch if equal
	BEQ $38			  ; F0 38 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0001			; 0E 01 00 | Arithmetic shift left (absolute)
	BRA $80			  ; 80 80 | Branch always
	BNE $80			  ; D0 80 | Branch if not equal
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1E9
; Address: $FAE9BA
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1E9:
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $40			  ; F0 40 | Branch if equal
	BVS $80			  ; 70 80 | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $80			  ; 80 80 | Branch always
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT #$89			 ; 89 89 | Test bits in accumulator (immediate)
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BIT #$89			 ; 89 89 | Test bits in accumulator (immediate)
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1EA
; Address: $FAEA3C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1EA:
	BRA $80			  ; 80 80 | Branch always
	ORA $0409			; 0D 09 04 | Logical OR with accumulator (absolute)
	ASL $1008			; 0E 08 10 | Arithmetic shift left (absolute)
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	ORA $1915			; 0D 15 19 | Logical OR with accumulator (absolute)
	ORA $1C			  ; 05 1C | Logical OR with accumulator (zero page)
	ASL $0207			; 0E 07 02 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BCS $90			  ; B0 90 | Branch if carry set

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1EB
; Address: $FAEA62
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1EB:
	JSR $1070			; 20 70 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BCC $98			  ; 90 98 | Branch if carry clear
	BCS $A8			  ; B0 A8 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$38			 ; A0 38 | Load immediate value into Y register
	SEC				  ; 38 | Set carry flag
	BVS $E0			  ; 70 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BNE $40			  ; D0 40 | Branch if not equal
	BNE $40			  ; D0 40 | Branch if not equal
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	STZ $7C70			; 9C 70 7C | Store zero to absolute
	BCC $3C			  ; 90 3C | Branch if carry clear
	BNE $DC			  ; D0 DC | Branch if not equal
	BMI $7C			  ; 30 7C | Branch if negative
	BCC $3C			  ; 90 3C | Branch if carry clear
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	CPX #$68			 ; E0 68 | Compare X register (immediate)
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	CPX #$C8			 ; E0 C8 | Compare X register (immediate)
	CPX #$68			 ; E0 68 | Compare X register (immediate)
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1EC
; Address: $FAEAC1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1EC:
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	CPY $3C38			; CC 38 3C | Compare Y register (absolute)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	BRA $9C			  ; 80 9C | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1ED
; Address: $FAEACE
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1ED:
	SED				  ; F8 | Set decimal mode flag
	BMI $F0			  ; 30 F0 | Branch if negative
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $78			  ; F0 78 | Branch if equal
	CPX #$98			 ; E0 98 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPY #$09			 ; C0 09 | Compare Y register (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA $0E04			; 0D 04 0E | Logical OR with accumulator (absolute)
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	ORA $1915			; 0D 15 19 | Logical OR with accumulator (absolute)
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	ORA $0D1D			; 0D 1D 0D | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	BCC $90			  ; 90 90 | Branch if carry clear
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1EE
; Address: $FAEB04
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1EE:
	JSR $9070			; 20 70 90 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	BCS $A8			  ; B0 A8 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$A8			 ; A0 A8 | Load immediate value into Y register
	BCS $B8			  ; B0 B8 | Branch if carry set
	BCS $E0			  ; B0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BNE $40			  ; D0 40 | Branch if not equal
	BNE $40			  ; D0 40 | Branch if not equal
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1E18			; 0E 18 1E | Arithmetic shift left (absolute)
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1F1C,X		  ; 1E 1C 1F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1EF
; Address: $FAEB3D
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1EF:
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA #$46			 ; 09 46 | Logical OR with accumulator (immediate)
	ROR $7E46,X		  ; 7E 46 7E | Rotate right (absolute,X)
	EOR $7F			  ; 45 7F | Exclusive OR with accumulator (zero page)
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	ROR $7E56,X		  ; 7E 56 7E | Rotate right (absolute,X)
	EOR $597F,Y		  ; 59 7F 59 | Exclusive OR with accumulator (absolute,Y)
	REP #$FF			 ; C2 FF | Reset processor status bits
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	EOR ($43,X)		  ; 41 43 | Exclusive OR with accumulator ((zero page,X))
	CMP ($C3,X)		  ; C1 C3 | Compare accumulator ((zero page,X))
	STA $87			  ; 85 87 | Store accumulator to zero page
	SEP #$EA			 ; E2 EA | Set processor status bits
	ORA #$43			 ; 09 43 | Logical OR with accumulator (immediate)
	EOR ($C3,X)		  ; 41 C3 | Exclusive OR with accumulator ((zero page,X))
	CMP ($87,X)		  ; C1 87 | Compare accumulator ((zero page,X))
	STA $C7			  ; 85 C7 | Store accumulator to zero page
	NOP				  ; EA | No operation
	SEP #$00			 ; E2 00 | Set processor status bits
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1F0
; Address: $FAEBCB
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1F0:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BMI $C0			  ; 30 C0 | Branch if negative
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	BMI $C0			  ; 30 C0 | Branch if negative
	BEQ $80			  ; F0 80 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	BMI $10			  ; 30 10 | Branch if negative
	BMI $10			  ; 30 10 | Branch if negative
	ADC $5731			; 6D 31 57 | Add with carry (absolute)
	BIT $DEB7			; 2C B7 DE | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1F1
; Address: $FAEBED
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1F1:
	STA ($DB),Y		  ; 91 DB | Store accumulator to (zero page),Y
	PLB				  ; AB | Pull data bank register from stack
	ORA $0D03			; 0D 03 0D | Logical OR with accumulator (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ROL $C6			  ; 26 C6 | Rotate left (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	CPY #$54			 ; C0 54 | Compare Y register (immediate)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	JMP $0C48			; 4C 48 0C | Jump to address
	PHP				  ; 08 | Push processor status to stack
	STY $34EA			; 8C EA 34 | Store Y register to absolute address
	SBC $6F7B			; ED 7B 6F | Subtract with carry (absolute)
	BIT #$DB			 ; 89 DB | Test bits in accumulator (immediate)
	BCS $C0			  ; B0 C0 | Branch if carry set
	BCS $80			  ; B0 80 | Branch if carry set
	BEQ $80			  ; F0 80 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	LDY #$20			 ; A0 20 | Load immediate value into Y register
	STZ $63			  ; 64 63 | Store zero to zero page
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $000E			; 0E 0E 00 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	BPL $1F			  ; 10 1F | Branch if positive
	BCC $9F			  ; 90 9F | Branch if carry clear
	BCC $9F			  ; 90 9F | Branch if carry clear
	STA				  ; 9F 94 9F 90 | Store accumulator to absolute long,X
	BIT $EC			  ; 24 EC | Test bits in accumulator (zero page)
	BVS $FC			  ; 70 FC | Branch if overflow set
	SBC $DFDF,X		  ; FD DF DF | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPX $FC24			; EC 24 FC | Compare X register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SBC $DF75,X		  ; FD 75 DF | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BMI $F0			  ; 30 F0 | Branch if negative
	BMI $F0			  ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1F2
; Address: $FAEC8A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1F2:
	BMI $F0			  ; 30 F0 | Branch if negative
	BPL $F0			  ; 10 F0 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1F3
; Address: $FAEC8F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1F3:
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	BRA $F0			  ; 80 F0 | Branch always
	BVS $F0			  ; 70 F0 | Branch if overflow set
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BPL $E0			  ; 10 E0 | Game work RAM access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1F4
; Address: $FAECA0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1F4:
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	ADC $F906			; 6D 06 F9 | Add with carry (absolute)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	DEC $00			  ; C6 00 | Decrement (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	BEQ $D8			  ; F0 D8 | Branch if equal
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1F5
; Address: $FAECCD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1F5:
	JSR $40B8			; 20 B8 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1F6
; Address: $FAECDA
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1F6:
	JSR $D000			; 20 00 D0 | Jump to subroutine
	BRA $B0			  ; 80 B0 | Branch always
	CPY #$67			 ; C0 67 | Compare Y register (immediate)
	PHY				  ; 5A | Push Y register to stack
	BVC $6C			  ; 50 6C | Branch if overflow clear
	BMI $28			  ; 30 28 | Branch if negative
	ASL $1614,X		  ; 1E 14 16 | Arithmetic shift left (absolute,X)
	ASL $0D0B,X		  ; 1E 0B 0D | Arithmetic shift left (absolute,X)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	AND $70			  ; 25 70 | Logical AND with accumulator (zero page)
	BVS $17			  ; 70 17 | Branch if overflow set
	BMI $09			  ; 30 09 | Branch if negative
	BPL $01			  ; 10 01 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC $5A			  ; E6 5A | Increment (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1F7
; Address: $FAED08
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1F7:
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	BNE $B0			  ; D0 B0 | Branch if not equal
	BCC $F0			  ; 90 F0 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1F8
; Address: $FAED0F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1F8:
	CPX #$A4			 ; E0 A4 | Compare X register (immediate)
	ASL $0EC8			; 0E C8 0E | Arithmetic shift left (absolute)
	INX				  ; E8 | Increment X register
	BCC $08			  ; 90 08 | Branch if carry clear
	BRA $18			  ; 80 18 | Branch always
	RTI				  ; 40 | Return from interrupt
	BMI $40			  ; 30 40 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BMI $F0			  ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1F9
; Address: $FAED42
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1F9:
	JSR $60E0			; 20 E0 60 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $B0			  ; F0 B0 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BMI $38			  ; 30 38 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	BMI $1C			  ; 30 1C | Branch if negative
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1FA
; Address: $FAED94
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1FA:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA $020E			; 0D 0E 02 | Logical OR with accumulator (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $1C			  ; 80 1C | Branch always
	CPX #$7E			 ; E0 7E | Compare X register (immediate)
	BRA $3E			  ; 80 3E | Branch always
	CPY #$CE			 ; C0 CE | Compare Y register (immediate)
	BCS $FF			  ; B0 FF | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	BEQ $4C			  ; F0 4C | Branch if equal
	BEQ $7C			  ; F0 7C | Branch if equal
	CPX #$37			 ; E0 37 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1FB
; Address: $FAEDE6
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1FB:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $0A0D			; 0D 0D 0A | Logical OR with accumulator (absolute)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $0E0D			; 0D 0D 0E | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC $C7			  ; C6 C7 | Decrement (zero page)
	JMP $9B92DF		  ; 5C DF 92 9B | Jump to address long
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	DEC $D7			  ; C6 D7 | Decrement (zero page)
	JMP $3F929B		  ; 5C 9B 92 3F | Jump to address long
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	STY $84			  ; 84 84 | Store Y register to zero page
	STA $698D			; 8D 8D 69 | Store accumulator to absolute address
	SBC #$22			 ; E9 22 | Subtract with carry (immediate)
	STZ $E7			  ; 64 E7 | Store zero to zero page
	WDM #$C3			 ; 42 C3 | Reserved instruction
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	STY $84			  ; 84 84 | Store Y register to zero page
	STA $E98D			; 8D 8D E9 | Store accumulator to absolute address
	ADC #$E3			 ; 69 E3 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1FC
; Address: $FAEE39
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1FC:
	JSL $C364E7		  ; 22 E7 64 C3 | Jump to subroutine long
	WDM #$8B			 ; 42 8B | Reserved instruction
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1FD
; Address: $FAEE40
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1FD:
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BEQ $7F			  ; F0 7F | Branch if equal
	STX $936F			; 8E 6F 93 | Store X register to absolute address
	CPX $E6			  ; E4 E6 | Compare X register (zero page)
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $7100			; 0E 00 71 | Arithmetic shift left (absolute)
	CPY #$6C			 ; C0 6C | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FF1B,X		  ; FE 1B FF | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1FE
; Address: $FAEE6D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1FE:
	BCC $FE			  ; 90 FE | Branch if carry clear
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_1FF
; Address: $FAEE7A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_1FF:
	BCC $00			  ; 90 00 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	BRA $FC			  ; 80 FC | Branch always
	CPY #$0A			 ; C0 0A | Compare Y register (immediate)
	ASL $0F0B			; 0E 0B 0F | Arithmetic shift left (absolute)
	AND #$2F			 ; 29 2F | Logical AND with accumulator (immediate)
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	AND ($3F),Y		  ; 31 3F | Logical AND with accumulator ((zero page),Y)
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank74_DmaFunction_200
; Address: $FAEE8C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_200:
	JSR $183F			; 20 3F 18 | Jump to subroutine
	ASL $0F0A			; 0E 0A 0F | Arithmetic shift left (absolute)
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ADC ($7F,X)		  ; 61 7F | Add with carry ((zero page,X))
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank74_DmaFunction_201
; Address: $FAEEB3
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_201:
	ADC $597F,Y		  ; 79 7F 59 | Add with carry (absolute,Y)
	ADC $FEFF,X		  ; 7D FF FE | Add with carry (absolute,X)
	ROR $5EFF,X		  ; 7E FF 5E | Rotate right (absolute,X)
	LSR $0B0A,X		  ; 5E 0A 0B | Logical shift right (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	STY $8F			  ; 84 8F | Store Y register to zero page
	STZ $889F			; 9C 9F 88 | Store zero to absolute
	STA $27EFE8		  ; 8F E8 EF 27 | Store accumulator to absolute long address
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_202
; Address: $FAEED3
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_202:
	PHA				  ; 48 | Push accumulator to stack
	STA $9D9F85		  ; 8F 85 9F 9D | Store accumulator to absolute long address
	STA $E8EF8B		  ; 8F 8B EF E8 | Store accumulator to absolute long address
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank74_DmaFunction_203
; Address: $FAEF21
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_203:
	JSR $C03F			; 20 3F C0 | Jump to subroutine
	LDA				  ; BF C0 4C 70 | Load from absolute long,X into accumulator
	BVS $40			  ; 70 40 | Branch if overflow set
	DEC $3EE0,X		  ; DE E0 3E | Decrement (absolute,X)
	BEQ $3E			  ; F0 3E | Branch if equal
	BEQ $0C			  ; F0 0C | Branch if equal
	BVS $30			  ; 70 30 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $000F			; 0E 0F 00 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $8080			; 0E 80 80 | Arithmetic shift left (absolute)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_204
; Address: $FAEF9E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_204:
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	BMI $3F			  ; 30 3F | Branch if negative
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank74_DmaFunction_205
; Address: $FAEFC6
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_205:
	JSR $313F			; 20 3F 31 | Jump to subroutine
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	LDA				  ; BF A6 3F 34 | Load from absolute long,X into accumulator
	ASL $2C3F,X		  ; 1E 3F 2C | Arithmetic shift left (absolute,X)
	AND ($1F),Y		  ; 31 1F | Logical AND with accumulator ((zero page),Y)
	CPX $E4			  ; E4 E4 | Compare X register (zero page)
	SEP #$FE			 ; E2 FE | Set processor status bits
	SEP #$FE			 ; E2 FE | Set processor status bits

;------------------------------------------------------------------------------
; Bank74_DmaFunction_206
; Address: $FAEFE4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_206:
	JSL $FF77FE		  ; 22 FE 77 FF | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $FEEA,X		  ; FE EA FE | Increment (absolute,X)
	SEP #$FE			 ; E2 FE | Set processor status bits

;------------------------------------------------------------------------------
; Bank74_DmaFunction_207
; Address: $FAEFF5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_207:
	JSL $DB77FF		  ; 22 FF 77 DB | Jump to subroutine long
	PHX				  ; DA | Push X register to stack
	BRA $C0			  ; 80 C0 | Branch always
	BCC $D0			  ; 90 D0 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank74_DmaFunction_208
; Address: $FAF004
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_208:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BPL $F0			  ; 10 F0 | Branch if positive
	BVS $F0			  ; 70 F0 | Branch if overflow set
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BNE $90			  ; D0 90 | Branch if not equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $90			  ; F0 90 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ORA $0B0F			; 0D 0F 0B | Logical OR with accumulator (absolute)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_209
; Address: $FAF049
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_209:
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	PHA				  ; 48 | Push accumulator to stack
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_20A
; Address: $FAF06C
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_20A:
	SBC $F846,Y		  ; F9 46 F8 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($B9,X)		  ; 01 B9 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	LDA				  ; BF 40 33 CC | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	BMI $00			  ; 30 00 | Branch if negative
	SBC $BF00,X		  ; FD 00 BF | Subtract with carry (absolute,X)
	CPX #$33			 ; E0 33 | Compare X register (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ORA $1B1F,Y		  ; 19 1F 1B | Logical OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	BNE $70			  ; D0 70 | Branch if not equal
	BEQ $30			  ; F0 30 | Branch if equal
	BEQ $38			  ; F0 38 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_20B
; Address: $FAF0CD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_20B:
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BRA $C0			  ; 80 C0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BNE $50			  ; D0 50 | Branch if not equal

;------------------------------------------------------------------------------
; Bank74_DmaFunction_20C
; Address: $FAF0D6
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_20C:
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CLC				  ; 18 | Clear carry flag
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ORA $1C1F,X		  ; 1D 1F 1C | Logical OR with accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_20D
; Address: $FAF101
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_20D:
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	CPX $FC14			; EC 14 FC | Compare X register (absolute)
	BMI $F0			  ; 30 F0 | Branch if negative
	BMI $F0			  ; 30 F0 | Branch if negative
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX $FCCC			; EC CC FC | Compare X register (absolute)
	BEQ $70			  ; F0 70 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_20E
; Address: $FAF142
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_20E:
	JSR $C0E0			; 20 E0 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	BIT $2C			  ; 24 2C | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	BMI $30			  ; 30 30 | Branch if negative
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	BIT $7C24			; 2C 24 7C | Test bits in accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	BMI $30			  ; 30 30 | Branch if negative
	BVC $D0			  ; 50 D0 | Branch if overflow clear
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_20F
; Address: $FAF190
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_20F:
	BNE $50			  ; D0 50 | Branch if not equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	PEA #$080C		   ; F4 0C 08 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0C			  ; F0 0C | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BEQ $12			  ; F0 12 | Branch if equal
	INC $1E02,X		  ; FE 02 1E | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR $47			  ; 45 47 | Exclusive OR with accumulator (zero page)
	CPY $C7			  ; C4 C7 | Compare Y register (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	LDY $00BF			; AC BF 00 | Load from absolute address into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR $C7			  ; 45 C7 | Exclusive OR with accumulator (zero page)
	CPY $D3			  ; C4 D3 | Compare Y register (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	LDA				  ; BF AC 00 00 | Load from absolute long,X into accumulator
	STY $84			  ; 84 84 | Store Y register to zero page
	JMP ($69EC)		  ; 6C EC 69 | Jump to address (absolute indirect)
	SBC #$23			 ; E9 23 | Subtract with carry (immediate)
	STY $84			  ; 84 84 | Store Y register to zero page
	CPX $E96C			; EC 6C E9 | Compare X register (absolute)
	ADC #$E3			 ; 69 E3 | Add with carry (immediate)
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank74_DmaFunction_210
; Address: $FAF2CD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_210:
	LDA				  ; BF CF BF 1B | Load from absolute long,X into accumulator
	BPL $03			  ; 10 03 | Branch if positive
	BIT $07			  ; 24 07 | Test bits in accumulator (zero page)
	BMI $1F			  ; 30 1F | Branch if negative
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank74_DmaFunction_211
; Address: $FAF2DC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_211:
	RTI				  ; 40 | Return from interrupt
	BVC $FF			  ; 50 FF | Branch if overflow clear
	BCC $80			  ; 90 80 | Branch if carry clear
	BNE $40			  ; D0 40 | Branch if not equal
	BVS $80			  ; 70 80 | Branch if overflow set
	LDY #$DC			 ; A0 DC | Load immediate value into Y register
	CPX #$CA			 ; E0 CA | Compare X register (immediate)
	BEQ $F2			  ; F0 F2 | Branch if equal
	SEP #$D7			 ; E2 D7 | Set processor status bits
	SBC $60			  ; E5 60 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_212
; Address: $FAF2F2
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_212:
	JSR $A100			; 20 00 A1 | Jump to subroutine
	STA ($90,X)		  ; 81 90 | Store accumulator to (zero page,X)
	BRA $33			  ; 80 33 | Branch always
	CPX #$25			 ; E0 25 | Compare X register (immediate)
	CPX #$0D			 ; E0 0D | Compare X register (immediate)
	CPX #$28			 ; E0 28 | Compare X register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $0D0E			; 0E 0E 0D | Arithmetic shift left (absolute)
	ASL $060F			; 0E 0F 06 | Arithmetic shift left (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $0F0E			; 0E 0E 0F | Arithmetic shift left (absolute)
	ORA $0E0F			; 0D 0F 0E | Logical OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CLI				  ; 58 | Clear interrupt disable flag
	CLD				  ; D8 | Clear decimal mode flag
	BPL $10			  ; 10 10 | Branch if positive
	BRA $80			  ; 80 80 | Branch always
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CLD				  ; D8 | Clear decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_214
; Address: $FAF37C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_214:
	JSR $0020			; 20 20 00 | Jump to subroutine
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_215
; Address: $FAF3A2
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_215:
	BPL $10			  ; 10 10 | Branch if positive
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BIT $3C			  ; 24 3C | Test bits in accumulator (zero page)
	BPL $10			  ; 10 10 | Branch if positive
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0E0A			; 0E 0A 0E | Arithmetic shift left (absolute)
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	BPL $1F			  ; 10 1F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $0E0A			; 0E 0A 0E | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	NOP				  ; EA | No operation
	WDM #$C3			 ; 42 C3 | Reserved instruction
	STX $9C8F			; 8E 8F 9C | Store X register to absolute address
	STA				  ; 9F 90 9F F0 | Store accumulator to absolute long,X
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	WDM #$CB			 ; 42 CB | Reserved instruction
	STA $9C9F8E		  ; 8F 8E 9F 9C | Store accumulator to absolute long address
	STA				  ; 9F 90 FF F0 | Store accumulator to absolute long,X
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_216
; Address: $FAF460
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_216:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	STY $00			  ; 84 00 | Store Y register to zero page
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$48			 ; 49 48 | Exclusive OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	STA				  ; 9F BF DF 5F | Store accumulator to absolute long,X
	JMP ($2C37)		  ; 6C 37 2C | Jump to address (absolute indirect)
	BIT $2C33			; 2C 33 2C | Test bits in accumulator (absolute)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_217
; Address: $FAF496
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_217:
	JSR $10FF			; 20 FF 10 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	BPL $3F			  ; 10 3F | Branch if positive
	SBC $F5E3,X		  ; FD E3 F5 | Subtract with carry (absolute,X)
	STA $0A8FFF		  ; 8F FF 8F 0A | Store accumulator to absolute long address
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_218
; Address: $FAF4B8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_218:
	JSR $28FF			; 20 FF 28 | Jump to subroutine
	BVS $FF			  ; 70 FF | Branch if overflow set
	BVS $FF			  ; 70 FF | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	JMP ($467F)		  ; 6C 7F 46 | Jump to address (absolute indirect)
	ORA $0C0F			; 0D 0F 0C | Logical OR with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ADC $477F			; 6D 7F 47 | Add with carry (absolute)
	EOR $D858,X		  ; 5D 58 D8 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_219
; Address: $FAF4E2
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_219:
	JSR $24E0			; 20 E0 24 | Jump to subroutine
	CPX $7C			  ; E4 7C | Compare X register (zero page)
	STZ $FC			  ; 64 FC | Store zero to zero page
	BIT $FC			  ; 24 FC | Test bits in accumulator (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX $24			  ; E4 24 | Compare X register (zero page)
	STZ $FC			  ; 64 FC | Store zero to zero page
	LDY $FC			  ; A4 FC | Load from zero page into Y register
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	BPL $17			  ; 10 17 | Branch if positive
	ROL $3F			  ; 26 3F | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_21A
; Address: $FAF510
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_21A:
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	BPL $3F			  ; 10 3F | Branch if positive
	BCC $90			  ; 90 90 | Branch if carry clear
	BCC $90			  ; 90 90 | Branch if carry clear
	BCS $B0			  ; B0 B0 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BCC $90			  ; 90 90 | Branch if carry clear
	BCC $90			  ; 90 90 | Branch if carry clear
	BCS $B0			  ; B0 B0 | Branch if carry set
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $040E			; 0E 0E 04 | Arithmetic shift left (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $040E			; 0E 0E 04 | Arithmetic shift left (absolute)
	STZ $7C			  ; 64 7C | Store zero to zero page
	LSR $7E			  ; 46 7E | Logical shift right (zero page)
	LSR $7E			  ; 46 7E | Logical shift right (zero page)
	ADC ($7F,X)		  ; 61 7F | Add with carry ((zero page,X))
	ORA $091F,Y		  ; 19 1F 09 | Logical OR with accumulator (absolute,Y)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	STZ $7E			  ; 64 7E | Store zero to zero page
	LSR $7E			  ; 46 7E | Logical shift right (zero page)
	LSR $797F,X		  ; 5E 7F 79 | Logical shift right (absolute,X)
	ORA $090F,Y		  ; 19 0F 09 | Logical OR with accumulator (absolute,Y)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank74_DmaFunction_21B
; Address: $FAF58F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_21B:
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $031F,X		  ; 1D 1F 03 | Logical OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $0303,X		  ; 1D 03 03 | Logical OR with accumulator (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_21C
; Address: $FAF5C8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_21C:
	JSR $203F			; 20 3F 20 | Jump to subroutine
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	ASL $04FF			; 0E FF 04 | Arithmetic shift left (absolute)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $1D3F			; 2C 3F 1D | Test bits in accumulator (absolute)
	EOR $FE36,X		  ; 5D 36 FE | Exclusive OR with accumulator (absolute,X)
	INC $FF23,X		  ; FE 23 FF | Increment (absolute,X)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_21D
; Address: $FAF5EC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_21D:
	JMP $CFCCDF		  ; 5C DF CC CF | Jump to address long
	INC $FE36,X		  ; FE 36 FE | Increment (absolute,X)
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_21E
; Address: $FAF5FD
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_21E:
	EOR $CDCF,X		  ; 5D CF CD | Exclusive OR with accumulator (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $40			  ; 80 40 | Branch always
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	BEQ $B0			  ; F0 B0 | Branch if equal
	BEQ $B0			  ; F0 B0 | Branch if equal
	BEQ $B0			  ; F0 B0 | Branch if equal
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_21F
; Address: $FAF62C
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_21F:
	ORA $1C03			; 0D 03 1C | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $FD1F			; 0D 1F FD | Logical OR with accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	ADC $7BB4,Y		  ; 79 B4 7B | Add with carry (absolute,Y)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	BMI $4A			  ; 30 4A | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	EOR #$78			 ; 49 78 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	LSR				  ; 4A | Logical shift right (accumulator)
	PLY				  ; 7A | Pull Y register from stack
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	STA $078708		  ; 8F 08 87 07 | Store accumulator to absolute long address
	CPY $87			  ; C4 87 | Compare Y register (zero page)
	PLX				  ; FA | Pull X register from stack
	INC $FE23,X		  ; FE 23 FE | Increment (absolute,X)
	BRA $83			  ; 80 83 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $E3			  ; C4 E3 | Compare Y register (zero page)
	LDA				  ; BF CF 5F EF | Load from absolute long,X into accumulator
	SBC $BD36,Y		  ; F9 36 BD | Subtract with carry (absolute,Y)
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $FF			  ; 10 FF | Branch if positive
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	DEX				  ; CA | Decrement X register
	LDX $EF			  ; A6 EF | Load from zero page into X register
	ADC $EF			  ; 65 EF | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_220
; Address: $FAF6A2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_220:
	SEI				  ; 78 | Set interrupt disable flag
	BMI $3F			  ; 30 3F | Branch if negative
	BMI $3F			  ; 30 3F | Branch if negative
	BMI $3F			  ; 30 3F | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ASL $4EFE			; 0E FE 4E | Arithmetic shift left (absolute)
	INC $FEC6,X		  ; FE C6 FE | Increment (absolute,X)
	LDY $A0BC,X		  ; BC BC A0 | Load from absolute,X into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	INC $FE86,X		  ; FE 86 FE | Increment (absolute,X)
	ASL $6EFE			; 0E FE 6E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_221
; Address: $FAF6D6
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_221:
	INC $BCC6,X		  ; FE C6 BC | Increment (absolute,X)
	LDY $A0A0,X		  ; BC A0 A0 | Load from absolute,X into Y register
	BIT $3F			  ; 24 3F | Test bits in accumulator (zero page)
	BMI $3F			  ; 30 3F | Branch if negative
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	AND $383F			; 2D 3F 38 | Logical AND with accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	STY $F8FC			; 8C FC F8 | Store Y register to absolute address
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	STY $1CFC			; 8C FC 1C | Store Y register to absolute address
	STY $F8F8			; 8C F8 F8 | Store Y register to absolute address
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_222
; Address: $FAF7B1
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_222:
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $00FE,X		  ; 1E FE 00 | Arithmetic shift left (absolute,X)
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	INC $E01E,X		  ; FE 1E E0 | Game work RAM access
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	STY $87			  ; 84 87 | Store Y register to zero page
	ADC $6D			  ; 65 6D | Add with carry (zero page)
	ROR $FCC4,X		  ; 7E C4 FC | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	STY $83			  ; 84 83 | Store Y register to zero page
	ADC $7E65			; 6D 65 7E | Add with carry (absolute)
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	BMI $F0			  ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank74_DmaFunction_223
; Address: $FAF802
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_223:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BEQ $30			  ; F0 30 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($17),Y		  ; 11 17 | Logical OR with accumulator ((zero page),Y)
	ORA $0D0B,Y		  ; 19 0B 0D | Logical OR with accumulator (absolute,Y)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $061F			; 0E 1F 06 | Arithmetic shift left (absolute)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $CDFE,X		  ; FE FE CD | Increment (absolute,X)
	CMP $CDFF			; CD FF CD | Compare accumulator (absolute)
	CMP $7AB6			; CD B6 7A | Compare accumulator (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STX $FF			  ; 86 FF | Store X register to zero page
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY $FEFE			; CC FE FE | Compare Y register (absolute)
	LDX $5E63,Y		  ; BE 63 5E | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_224
; Address: $FAF866
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_224:
	TXS				  ; 9A | Transfer X register to stack pointer
	PEA #$09FF		   ; F4 FF 09 | Push effective address to stack
	ROL $CE3F,X		  ; 3E 3F CE | Rotate left (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	STZ $1CE3			; 9C E3 1C | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BIT $C32F			; 2C 2F C3 | Test bits in accumulator (absolute)
	ADC $CC87,Y		  ; 79 87 CC | Add with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC $906F,X		  ; FD 6F 90 | Subtract with carry (absolute,X)
	STA $0E82,X		  ; 9D 82 0E | Store accumulator to absolute,X
	ORA ($D3,X)		  ; 01 D3 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	CPY $02E7			; CC E7 02 | Compare Y register (absolute)
	ADC $FE03,X		  ; 7D 03 FE | Add with carry (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ORA $1819,Y		  ; 19 19 18 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BRA $80			  ; 80 80 | Branch always
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ORA $1819,Y		  ; 19 19 18 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BRA $80			  ; 80 80 | Branch always
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	BRA $80			  ; 80 80 | Branch always
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ROL $26			  ; 26 26 | Rotate left (zero page)
	REP #$C3			 ; C2 C3 | Reset processor status bits
	ROL $26			  ; 26 26 | Rotate left (zero page)
	REP #$C7			 ; C2 C7 | Reset processor status bits
	CPY $20CC			; CC CC 20 | Compare Y register (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY $E0CC			; CC CC E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank74_DmaFunction_225
; Address: $FAF99F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_225:
	JSR $0101			; 20 01 01 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	STY $7A			  ; 84 7A | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_226
; Address: $FAF9D1
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_226:
	INC $FC79,X		  ; FE 79 FC | Increment (absolute,X)
	ORA ($78,X)		  ; 01 78 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	SBC ($E9),Y		  ; F1 E9 | Subtract with carry ((zero page),Y)
	STA				  ; 9F D0 36 E9 | Store accumulator to absolute long,X
	STA $2AD774		  ; 8F 74 D7 2A | Store accumulator to absolute long address
	ADC #$96			 ; 69 96 | Add with carry (immediate)
	INX				  ; E8 | Increment X register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	LDY $20			  ; A4 20 | Load from zero page into Y register
	STX $86			  ; 86 86 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	SBC $EFFD,X		  ; FD FD EF | Subtract with carry (absolute,X)
	CMP ($7F,X)		  ; C1 7F | Compare accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($77,X)		  ; 01 77 | Logical OR with accumulator ((zero page,X))
	BNE $00			  ; D0 00 | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ROL $6700,X		  ; 3E 00 67 | Rotate left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROL $0026,X		  ; 3E 26 00 | Rotate left (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_227
; Address: $FAFA74
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_227:
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	ASL $463E			; 0E 3E 46 | Arithmetic shift left (absolute)
	ROR $7E42,X		  ; 7E 42 7E | Rotate right (absolute,X)
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	ROL $7E0E,X		  ; 3E 0E 7E | Rotate left (absolute,X)
	LSR $7E			  ; 46 7E | Logical shift right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	INC $00			  ; E6 00 | Increment (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	STZ $3E9F,X		  ; 9E 9F 3E | Store zero to absolute,X
	DEY				  ; 88 | Decrement Y register
	STA				  ; 9F 9E 3F 3E | Store accumulator to absolute long,X
	EOR $FF			  ; 45 FF | Exclusive OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank74_DmaFunction_228
; Address: $FAFB00
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_228:
	JSR $41E0			; 20 E0 41 | Jump to subroutine
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	STA ($43,X)		  ; 81 43 | Store accumulator to (zero page,X)
	ORA $09FF			; 0D FF 09 | Logical OR with accumulator (absolute)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ORA $89FF			; 0D FF 89 | Logical OR with accumulator (absolute)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_229
; Address: $FAFB28
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_229:
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA $0406			; 0D 06 04 | Logical OR with accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	LDA $1A			  ; A5 1A | Load from zero page into accumulator
	EOR ($3E,X)		  ; 41 3E | Exclusive OR with accumulator ((zero page,X))
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	BNE $AF			  ; D0 AF | Branch if not equal
	BCC $6F			  ; 90 6F | Branch if carry clear
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_22A
; Address: $FAFB76
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_22A:
	JSR $4003			; 20 03 40 | Jump to subroutine
	BRA $03			  ; 80 03 | Branch always
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $1E1E,X		  ; 1E 1E 1E | Arithmetic shift left (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $1E06,X		  ; 1E 06 1E | Arithmetic shift left (absolute,X)
	ASL $0606,X		  ; 1E 06 06 | Arithmetic shift left (absolute,X)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BVS $7F			  ; 70 7F | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	STA				  ; 9F 8F 8F E0 | Store accumulator to absolute long,X
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F 98 8F 8F | Store accumulator to absolute long,X
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	STZ $8D8D			; 9C 8D 8D | Store zero to absolute

;------------------------------------------------------------------------------
; Bank74_DmaFunction_22B
; Address: $FAFBCE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_22B:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	STZ $8D94			; 9C 94 8D | Store zero to absolute
	STA $0303			; 8D 03 03 | Store accumulator to absolute address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_22C
; Address: $FAFBE8
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_22C:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	ORA ($1F),Y		  ; 11 1F | Logical OR with accumulator ((zero page),Y)
	BRA $FF			  ; 80 FF | Branch always
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	LDA				  ; BF FF 1F FF | Load from absolute long,X into accumulator
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	BVS $FF			  ; 70 FF | Branch if overflow set
	INC $FF06,X		  ; FE 06 FF | Increment (absolute,X)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_22D
; Address: $FAFC90
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_22D:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_22E
; Address: $FAFCE0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_22E:
	JSR $373F			; 20 3F 37 | Jump to subroutine
	INC $3EFE,X		  ; FE FE 3E | Increment (absolute,X)
	INC $F070,X		  ; FE 70 F0 | Increment (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_22F
; Address: $FAFCF1
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_22F:
	JSR $373F			; 20 3F 37 | Jump to subroutine
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	ROL $70F0,X		  ; 3E F0 70 | Rotate left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SEP #$FE			 ; E2 FE | Set processor status bits
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	INC $3EE2,X		  ; FE E2 3E | Increment (absolute,X)
	ROL $3C			  ; 26 3C | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_230
; Address: $FAFD20
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_230:
	JSR $20E0			; 20 E0 20 | Jump to subroutine
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank74_DmaFunction_231
; Address: $FAFD4A
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_231:
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $10			  ; 06 10 | Arithmetic shift left (zero page)
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	CPX $7EE8			; EC E8 7E | Compare X register (absolute)
	STY $068F			; 8C 8F 06 | Store Y register to absolute address
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	STA $019E00		  ; 8F 00 9E 01 | Store accumulator to absolute long address
	BPL $28			  ; 10 28 | Branch if positive
	STA $000000		  ; 8F 00 00 00 | Store accumulator to absolute long address
	ASL $FF00,X		  ; 1E 00 FF | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SBC $0000			; ED 00 00 | Subtract with carry (absolute)
	ASL $FF1E,X		  ; 1E 1E FF | Arithmetic shift left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CLC				  ; 18 | Clear carry flag
	ROR $6E00,X		  ; 7E 00 6E | Rotate right (absolute,X)
	BPL $EB			  ; 10 EB | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROR $7E7E,X		  ; 7E 7E 7E | Rotate right (absolute,X)
	ROR $FFE0,X		  ; 7E E0 FF | Rotate right (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	AND $0000			; 2D 00 00 | Logical AND with accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	ROR $6A11			; 6E 11 6A | Rotate right (absolute)
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	ASL $1F0E			; 0E 0E 1F | Arithmetic shift left (absolute)
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank74_DmaFunction_232
; Address: $FAFE88
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_232:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_233
; Address: $FAFE8D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_233:
	BRA $30			  ; 80 30 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ORA #$15			 ; 09 15 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_234
; Address: $FAFEC3
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_234:
	ASL $38C0,X		  ; 1E C0 38 | Arithmetic shift left (absolute,X)
	BRA $61			  ; 80 61 | Branch always
	BMI $CD			  ; 30 CD | Branch if negative
	BPL $27			  ; 10 27 | Branch if positive
	ASL $1E3F,X		  ; 1E 3F 1E | Arithmetic shift left (absolute,X)
	STA				  ; 9F 3F 3F 7F | Store accumulator to absolute long,X
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BPL $AB			  ; 10 AB | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	SBC $FFC6,Y		  ; F9 C6 FF | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BPL $D0			  ; 10 D0 | Branch if positive
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ADC ($80,X)		  ; 61 80 | Add with carry ((zero page,X))
	BRA $77			  ; 80 77 | Branch always
	DEC $C03E,X		  ; DE 3E C0 | Decrement (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	SBC ($E0),Y		  ; F1 E0 | Game work RAM access
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	SBC $FD02,Y		  ; F9 02 FD | Subtract with carry (absolute,Y)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	DEC $E6E3			; CE E3 E6 | Decrement (absolute)
	INC $0FFE,X		  ; FE FE 0F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank74_DmaFunction_235
; Address: $FAFF36
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_235:
	AND ($C9,X)		  ; 21 C9 | Logical AND with accumulator ((zero page,X))
	SBC ($05),Y		  ; F1 05 | Subtract with carry ((zero page),Y)
	BMI $CA			  ; 30 CA | Branch if negative
	BPL $EA			  ; 10 EA | Branch if positive
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPX #$E0			 ; E0 E0 | Game work RAM access
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	BMI $0D			  ; 30 0D | Branch if negative
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ADC $DB24			; 6D 24 DB | Add with carry (absolute)
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	BIT $5B			  ; 24 5B | Test bits in accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	STY $FF50			; 8C 50 FF | Store Y register to absolute address
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank74_DmaFunction_236
; Address: $FAFFE1
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank74_DmaFunction_236:
	BRA $61			  ; 80 61 | Branch always
	BRA $73			  ; 80 73 | Branch always
	BRA $37			  ; 80 37 | Branch always
	DEC $C03E,X		  ; DE 3E C0 | Decrement (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	SBC ($E0),Y		  ; F1 E0 | Game work RAM access
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
